import tempfile
import unittest
from pathlib import Path

from tools.build_whirligig_pages import build


class WhirligigPagesBuildTests(unittest.TestCase):
    def test_adds_only_whirligig_and_preserves_viewer(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            (root / "CONVERSATION_VIEWER").mkdir()
            (root / "CONVERSATION_VIEWER" / "index.html").write_text(
                "<!doctype html><title>Original Viewer</title>", encoding="utf-8"
            )
            instrument_dir = root / "PUBLIC_SITE" / "instruments" / "whirligig"
            instrument_dir.mkdir(parents=True)
            source = (
                '<!doctype html><title>Whirligig</title><body>'
                '<nav>Geometry laboratory · <strong>Whirligig R/Q</strong> · '
                '<a href="../universal-indicatrix/index.html" style="color:#9ddbd1">'
                'Universal Indicatrix (blind lab)</a></nav>'
                'Analemma Donomphulon P_ivot Curvy Lisa pairPreset differenceStatus'
                '</body>'
            )
            (instrument_dir / "index.html").write_text(source, encoding="utf-8")
            output = root / "_site"

            result = build(root, output)
            self.assertEqual(
                (output / "index.html").read_text(encoding="utf-8"),
                "<!doctype html><title>Original Viewer</title>",
            )
            built = result.read_text(encoding="utf-8")
            self.assertIn("Analemma", built)
            self.assertNotIn("Universal Indicatrix", built)
            self.assertFalse((output / "glass-sausage-factory").exists())
            self.assertEqual(
                (instrument_dir / "index.html").read_text(encoding="utf-8"),
                source,
            )

    def test_refuses_to_overwrite_existing_output(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            (root / "CONVERSATION_VIEWER").mkdir()
            (root / "CONVERSATION_VIEWER" / "index.html").write_text("viewer")
            instrument_dir = root / "PUBLIC_SITE" / "instruments" / "whirligig"
            instrument_dir.mkdir(parents=True)
            (instrument_dir / "index.html").write_text(
                "Whirligig Analemma Donomphulon P_ivot Curvy Lisa pairPreset differenceStatus"
                '<a href="../universal-indicatrix/index.html">Universal Indicatrix (blind lab)</a>'
            )
            output = root / "_site"
            output.mkdir()
            with self.assertRaises(FileExistsError):
                build(root, output)


if __name__ == "__main__":
    unittest.main()
