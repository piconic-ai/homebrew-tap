"""Verify every application declared by the tap, failing if one is missing."""

import json
import os
from pathlib import Path
import subprocess


def main():
    for cask_file in Path("Casks").glob("*.rb"):
        info = json.loads(subprocess.check_output([
            "brew", "info", "--json=v2", "--cask", f"piconic-ai/tap/{cask_file.stem}",
        ], text=True))
        for artifact in info["casks"][0]["artifacts"]:
            if "app" not in artifact:
                continue
            source, *options = artifact["app"]
            target = next((option["target"] for option in options if isinstance(option, dict) and "target" in option), source)
            app = Path("/Applications") / target
            if not app.is_dir():
                raise RuntimeError(f"Declared application is missing: {app}")
            subprocess.run(["codesign", "--verify", "--deep", "--strict", str(app)], check=True)
            executable = subprocess.check_output([
                "/usr/libexec/PlistBuddy", "-c", "Print :CFBundleExecutable",
                str(app / "Contents/Info.plist"),
            ], text=True).strip()
            binary = app / "Contents/MacOS" / executable
            if not binary.is_file() or not os.access(binary, os.X_OK):
                raise RuntimeError(f"Application executable is missing or not executable: {binary}")


if __name__ == "__main__":
    main()
