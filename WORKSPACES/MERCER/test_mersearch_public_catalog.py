"""Static public catalog deployment contract and sensitive-source regression tests."""
from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import build_mersearch_public_catalog as catalog


def entry(ident, title, repo="Satobloc/HsH", path="PUBLIC_SITE/readme.md",
          corpus="development", source="message.create_time"):
    return {
        "id": ident,
        "title": title,
        "corpus": corpus,
        "path": path,
        "start_local": "2025-05-02T14:20:00-04:00",
        "end_local": "2025-05-04T14:20:00-04:00",
        "timestamp_source": source,
        "message_count": 42,
        "github_url": f"https://github.com/{repo}/blob/main/{path}",
    }


class PublicCatalogTests(unittest.TestCase):
    def test_curated_only(self):
        with self.assertRaises(ValueError):
            catalog.make_catalog({"conversations":[entry("a", "A")]})

    def test_no_private_or_quarantined_references(self):
        good=entry("valid1", "Optical phase shift 0.24")
        sat=entry("valid2", "Stringing Along Theory",
                  "Satobloc/SAT_THEORY_ARCHIVE_2023-25",
                  "SAT Mark V/SAT_Phase_Shift_Note.txt", "registered-external")
        bad=[
            entry("private1", "Sensitive docs", "Satobloc/HSH_RESOURCES", "private.txt"),
            entry("private2", "Prior art", path="PRIOR_ART/notes.txt"),
            entry("private3", "Quarantine", path="QUARANTINE/notes.txt"),
            entry("private4", "Encoded quarantine", path="%51UARANTINE/notes.txt"),
            entry("private5", "External", "OtherOwner/OtherRepo", "notes.txt"),
            entry("private6", "Not curated", corpus="secret"),
        ]
        payload={"schema_version":1,"curation":{"source":"CURATION.json"},
                 "conversations":[good,sat,*bad]}
        out=catalog.make_catalog(payload)
        self.assertEqual(out["kind"],"public-conversation-catalog")
        self.assertEqual(len(out["hits"]),2)
        self.assertEqual(out["coverage_status"],"partial")
        self.assertNotIn("Satobloc/HSH_RESOURCES",out["archives_searched"])
        self.assertTrue(all("satobloc" in r["source_url"].lower() for r in out["hits"]))
        self.assertTrue(all("message_count" in r for r in out["hits"]))
        self.assertEqual(out["catalog_rejections"]["not_publicly_linkable"],len(bad))
        self.assertEqual(out["hits"][0]["chronology"]["date_confidence"],
                         "direct-message-timestamps")

    def test_bad_snapshot_date_not_forged(self):
        payload={"curation":{},"conversations":[entry("a1","Undated",source="archive_date")]}
        output=catalog.make_catalog(payload)
        self.assertEqual(output["hits"][0]["chronology"]["earliest_message_at"],"")
        self.assertEqual(output["hits"][0]["chronology"]["date_confidence"],"undetermined")

    def test_written_catalog_is_bounded_and_parseable(self):
        with tempfile.TemporaryDirectory() as folder:
            source=Path(folder)/"input.json"
            output=Path(folder)/"catalog.json"
            source.write_text(json.dumps({"curation":{},"conversations":[entry("good1","SAT Lab"),
                entry("good2","Chronophysical")]}),encoding="utf-8")
            # Use script entrypoint, not only helper functions.
            import subprocess
            r=subprocess.run([sys.executable,str(ROOT/"tools"/"build_mersearch_public_catalog.py"),
                              "--catalog",str(source),"--output",str(output)],
                             text=True,capture_output=True,timeout=10)
            self.assertEqual(r.returncode,0,r.stderr)
            data=json.loads(output.read_text(encoding="utf-8"))
            self.assertEqual(data["catalog_entries"],2)
            self.assertNotIn("HSH_RESOURCES",json.dumps(data["hits"]))


if __name__=="__main__":
    unittest.main()
