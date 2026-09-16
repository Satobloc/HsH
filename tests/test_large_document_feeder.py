#!/usr/bin/env python3
"""Regression tests for tools/large_document_feeder.py.

Covers the 2026-09-16 active-branch ordering repair plus packet cursor/source
range/source-immutability invariants. Uses only a synthetic local fixture.
"""
from __future__ import annotations
import hashlib
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FEEDER = ROOT / "tools" / "large_document_feeder.py"


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def message(mid: str, role: str, text: str, t: float) -> dict:
    return {
        "id": mid,
        "author": {"role": role},
        "content": {"parts": [text]},
        "create_time": t,
    }


class LargeDocumentFeederConversationRegression(unittest.TestCase):
    def test_active_branch_cursors_ranges_and_source_immutability(self) -> None:
        # Deliberately place mapping entries out of conversational order and add
        # an abandoned alternate branch. current_node must select root->a->b->c.
        fixture = {
            "current_node": "c",
            "mapping": {
                "alt": {"parent": "a", "message": message("m-alt", "assistant", "ABANDONED BRANCH", 2.5)},
                "c": {"parent": "b", "message": message("m-c", "assistant", "gamma " * 90, 4.0)},
                "root": {"parent": None, "message": None},
                "a": {"parent": "root", "message": message("m-a", "user", "alpha " * 90, 2.0)},
                "b": {"parent": "a", "message": message("m-b", "assistant", "beta " * 90, 3.0)},
            },
        }
        with tempfile.TemporaryDirectory() as td:
            td = Path(td)
            source = td / "conversation.json"
            output = td / "derived"
            source.write_text(json.dumps(fixture), encoding="utf-8")
            before = digest(source)

            cp = subprocess.run(
                [sys.executable, str(FEEDER), str(source), "--output", str(output), "--target-words", "200"],
                cwd=ROOT, text=True, capture_output=True, check=True,
            )
            result = json.loads(cp.stdout)
            manifest_path = Path(result["manifest"])
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))

            self.assertEqual(before, digest(source), "source bytes changed")
            self.assertFalse(manifest["source_modified"])
            self.assertEqual(manifest["parser"], "chatgpt-active-branch")
            self.assertEqual(manifest["source"]["sha256"], before)
            self.assertGreaterEqual(manifest["packet_count"], 2)

            packets = manifest["packets"]
            combined = "\n".join((manifest_path.parent / p["file"]).read_text(encoding="utf-8") for p in packets)
            self.assertLess(combined.index("alpha"), combined.index("beta"))
            self.assertLess(combined.index("beta"), combined.index("gamma"))
            self.assertNotIn("ABANDONED BRANCH", combined)

            # Packet chain must be continuous in both directions.
            for i, p in enumerate(packets):
                self.assertEqual(p["packet_index"], i + 1)
                self.assertEqual(p["previous_packet_id"], packets[i - 1]["packet_id"] if i else None)
                self.assertEqual(p["next_packet_id"], packets[i + 1]["packet_id"] if i + 1 < len(packets) else None)
                self.assertEqual(p["source_sha256"], before)
                self.assertIn("message_index", p["source_start"])
                self.assertIn("message_id", p["source_start"])
                self.assertIn("message_index", p["source_end"])
                self.assertIn("message_id", p["source_end"])
                packet_file = manifest_path.parent / p["file"]
                self.assertEqual(p["packet_sha256"], digest(packet_file))


if __name__ == "__main__":
    unittest.main()
