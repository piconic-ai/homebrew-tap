import importlib.util
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("auto_merge", ROOT / "scripts/auto-merge-release.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class MetadataGuardTest(unittest.TestCase):
    def test_formula_and_cask_release_updates(self):
        for path in ("Formula/pedit.rb", "Casks/peitho-studio.rb"):
            with self.subTest(path=path):
                before = (ROOT / path).read_text()
                version = module.re.findall(r'^  version "([^"]+)"$', before, module.re.MULTILINE)[0]
                after = before.replace(f'version "{version}"', 'version "1.2.3-rc.1"')
                after = module.re.sub(r'(sha256 ")[0-9a-f]{64}', r'\g<1>' + "a" * 64, after)
                name = Path(path).stem
                self.assertTrue(module.metadata_only(before, after, f"{name}-v1.2.3-rc.1", name))
                self.assertFalse(module.metadata_only(before, after, "unrelated", name))
                self.assertFalse(module.metadata_only(before, after + '\nsystem "unexpected"\n', f"{name}-v1.2.3-rc.1", name))
                self.assertFalse(module.metadata_only(before, after.replace('https://github.com/', 'https://example.com/'), f"{name}-v1.2.3-rc.1", name))
                self.assertFalse(module.metadata_only(before, after.replace('sha256 "', 'sha256 "invalid', 1), f"{name}-v1.2.3-rc.1", name))
                self.assertFalse(module.metadata_only(before, before, f"{name}-v{version}", name))


if __name__ == "__main__":
    unittest.main()
