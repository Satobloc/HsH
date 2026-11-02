import json
import tempfile
import unittest
from pathlib import Path
from build import build_site

REPO = Path(__file__).resolve().parents[2]


class StaticSiteBuildTests(unittest.TestCase):
    def test_bundle_and_existing_viewer_are_preserved(self):
        with tempfile.TemporaryDirectory() as temp:
            output = Path(temp) / "_site"
            manifest = build_site(REPO, output, "/HsH/")
            self.assertTrue((output / "index.html").is_file())
            self.assertIn("HsH Conversation Viewer", (output / "index.html").read_text(encoding="utf-8"))
            self.assertTrue((output / "glass-sausage-factory" / "index.html").is_file())
            self.assertTrue((output / "glass-sausage-factory" / "visual-atlas" / "index.html").is_file())
            self.assertTrue((output / "glass-sausage-factory" / "papers" / "files" / "cruller-rubin.pdf").is_file())
            self.assertTrue((output / "laboratory" / "whirligig" / "index.html").is_file())
            self.assertTrue((output / "laboratory" / "universal-indicatrix" / "index.html").is_file())
            self.assertTrue((output / "mersearch" / "index.html").is_file())
            self.assertTrue((output / "research" / "search" / "index.html").is_file())
            self.assertTrue((output / "conversations" / "index.html").is_file())
            papers = json.loads((output / "glass-sausage-factory" / "data" / "papers.json").read_text(encoding="utf-8"))
            self.assertGreaterEqual(len(papers["papers"]), 1)
            self.assertTrue(all(p["site_pdf"].startswith("papers/files/") for p in papers["papers"]))
            atlas = json.loads((output / "glass-sausage-factory" / "data" / "atlas.json").read_text(encoding="utf-8"))
            self.assertGreaterEqual(len(atlas), 1)
            self.assertTrue(all((output / "glass-sausage-factory" / x["image"]).is_file() for x in atlas))
            self.assertFalse((output / "glass-sausage-factory" / "data" / "ASSET_MANIFEST.json").exists())
            self.assertFalse((output / "glass-sausage-factory" / "data" / "GALLERY_FEED.json").exists())
            self.assertFalse((output / "glass-sausage-factory" / "live_influx").exists())
            self.assertFalse((output / "glass-sausage-factory" / "STAGING").exists())
            self.assertEqual(manifest["source_repository"], "Satobloc/HsH")
            self.assertEqual(manifest["factory_base"], "/HsH/glass-sausage-factory/")
            self.assertEqual(manifest["published_pdf_count"], len(papers["papers"]))


if __name__ == "__main__":
    unittest.main()
