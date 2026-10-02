"""Enable auto-merge only for successful, narrowly scoped pedit updates."""

import base64
import json
import os
import re
import subprocess


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", path], text=True))


def metadata_only(before, after, branch):
    version_pattern = r'^  version "([0-9]+\.[0-9]+\.[0-9]+(?:-[0-9A-Za-z.-]+)?)"$'
    versions = re.findall(version_pattern, after, re.MULTILINE)
    if len(versions) != 1 or branch != f"pedit-v{versions[0]}":
        return False
    checksum_pattern = r'^(      sha256 ")[0-9a-f]{64}(" # (?:darwin|linux)/(?:arm64|amd64))$'
    for content in (before, after):
        if len(re.findall(version_pattern, content, re.MULTILINE)) != 1:
            return False
        if len(re.findall(checksum_pattern, content, re.MULTILINE)) != 4:
            return False

    def normalize(content):
        content = re.sub(version_pattern, '  version "VERSION"', content, flags=re.MULTILINE)
        return re.sub(checksum_pattern, r'\1CHECKSUM\2', content, flags=re.MULTILINE)

    return before != after and normalize(before) == normalize(after)


def main():
    with open(os.environ["GITHUB_EVENT_PATH"]) as event_file:
        run = json.load(event_file)["workflow_run"]
    repo = os.environ["GITHUB_REPOSITORY"]
    for associated in run["pull_requests"]:
        number = associated["number"]
        pr = api(f"repos/{repo}/pulls/{number}")
        if not (
            pr["state"] == "open"
            and not pr["draft"]
            and pr["user"]["login"] == "kfly8"
            and pr["head"]["repo"]["full_name"] == repo
            and pr["base"]["ref"] == "main"
            and pr["head"]["sha"] == run["head_sha"]
            and pr["changed_files"] == 1
        ):
            continue
        files = api(f"repos/{repo}/pulls/{number}/files")
        if len(files) != 1 or files[0]["filename"] != "Formula/pedit.rb" or files[0]["status"] != "modified":
            continue

        def formula(sha):
            blob = api(f"repos/{repo}/contents/Formula/pedit.rb?ref={sha}")
            return base64.b64decode(blob["content"]).decode()

        if not metadata_only(formula(pr["base"]["sha"]), formula(pr["head"]["sha"]), pr["head"]["ref"]):
            continue
        # The successful workflow_run has already passed both matrix jobs.
        subprocess.run([
            "gh", "pr", "merge", str(number), "--repo", repo,
            "--auto", "--squash", "--match-head-commit", pr["head"]["sha"],
        ], check=True)


if __name__ == "__main__":
    main()
