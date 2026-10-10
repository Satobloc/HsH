"""Content-driven JSON recognition for the main HsH Conversation Viewer and search."""
import json
import tempfile
import unittest
from pathlib import Path
from zoneinfo import ZoneInfo

from tools.conversation_json_sniff import is_json_document_candidate
from tools import date_conversation_exports as dates
from tools import build_conversation_viewer as viewer
from tools import build_conversation_viewer_resolved as resolved
from tools import search_archive_content as search
from tools import discover_external_conversations as external

TIMEZONE = ZoneInfo("America/New_York")


def conversation(stamp=1780000000):
    return {
        "title": "A genuine conversation",
        "current_node": "assistant",
        "mapping": {
            "user": {
                "parent": None,
                "message": {
                    "id": "m1",
                    "author": {"role": "user"},
                    "content": {"parts": ["First message, H(s)H equation"]},
                    "create_time": stamp,
                },
            },
            "assistant": {
                "parent": "user",
                "message": {
                    "id": "m2",
                    "author": {"role": "assistant"},
                    "content": {"parts": ["Second message, SAT geometry"]},
                    "create_time": stamp + 20,
                },
            },
        },
    }


class JsonContentIndexingTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)

    def write(self, name, obj=None, text=None):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        if text is None:
            text = json.dumps(conversation() if obj is None else obj)
        path.write_text(text, encoding="utf-8")
        return path

    def test_any_extension_content_detected_consistently(self):
        for ext in (".json", ".txt", ".md", ".markdown", ".text", ".log",
                    ".raw", ".data", ".out", ".backup", ".unusual", ""):
            with self.subTest(extension=ext):
                p = self.write("Actual Conversation" + ext)
                self.assertTrue(is_json_document_candidate(p))
                self.assertEqual(dates.load_conversation(p)["title"], "A genuine conversation")
        records = dates.build_records(self.root, TIMEZONE)
        self.assertEqual(len(records), 12)
        self.assertTrue(all(r.message_count == 2 and r.start_local for r in records))
        self.assertTrue(all(r.timestamp_source == "message.create_time" for r in records))

    def test_bom_whitespace_and_uppercase_extensions(self):
        p = self.write("history.TXT", text="\ufeff\n \t" + json.dumps(conversation()))
        self.assertTrue(is_json_document_candidate(p))
        self.assertEqual(len(dates.build_records(self.root, TIMEZONE)), 1)

    def test_plain_text_and_markdown_fenced_json_not_promoted(self):
        self.write("notes.txt", text="Here is a discussion about SAT and a JSON string.")
        self.write("readme.md", text="\x60\x60\x60json\n" + json.dumps(conversation()) + "\n\x60\x60\x60")
        self.write("braced.txt", text="{this is not JSON}")
        self.write("json-shaped.txt", text='{"mapping":')
        self.write("large-header.txt", text="Nope " * 2000 + json.dumps(conversation()))
        self.write("misleading.json", text="not actually JSON")
        self.assertFalse(is_json_document_candidate(self.root / "notes.txt"))
        self.assertFalse(is_json_document_candidate(self.root / "readme.md"))
        recs = dates.build_records(self.root, TIMEZONE)
        self.assertEqual([Path(x.old_path).name for x in recs], ["braced.txt", "json-shaped.txt", "misleading.json"])
        self.assertTrue(all(r.status == "skipped" for r in recs))

    def test_json_array_wrap_matches_json_filename_semantics(self):
        original = [conversation()]
        p = self.write("one-export.md", obj=original)
        self.assertEqual(dates.load_conversation(p)["title"], "A genuine conversation")
        record = dates.build_records(self.root, TIMEZONE)[0]
        self.assertEqual(record.message_count, 2)

    def test_non_conversation_json_is_not_mislabeled(self):
        self.write("unrelated.markdown", obj={"schema_version": 3, "created_at": 1780000000})
        records = dates.build_records(self.root, TIMEZONE)
        self.assertEqual(len(records), 1)
        self.assertEqual(records[0].status, "skipped")

    def test_resolved_catalog_accepts_original_unusual_extension(self):
        p = self.write("Earliest SAT conversation.backup")
        record = dates.build_records(self.root, TIMEZONE)[0]
        self.assertEqual(resolved.existing_canonical_path(record.__dict__), str(p))
        item = viewer.normalize_record(
            dict(record.__dict__, status="unchanged"), "development", "Satobloc", "HsH", "main"
        )
        self.assertEqual(item["source_format"], "json")
        self.assertEqual(item["source_extension"], ".backup")
        self.assertEqual(item["path"], str(p).replace("\\", "/"))
        self.assertEqual(item["message_count"], 2)

    def test_json_in_plaintext_is_structured_in_main_mersearch(self):
        p = self.write("structured-messages.txt")
        parsed = list(search.iter_records(p))
        self.assertEqual(len(parsed), 2)
        self.assertEqual({r.kind for r in parsed}, {"conversation-message"})
        self.assertEqual({r.message_id for r in parsed}, {"m1", "m2"})
        self.assertTrue(all(r.timestamp for r in parsed))
        self.assertTrue(any("SAT geometry" in r.text for r in parsed))

    def test_valid_json_in_markdown_and_unusual_extension_searches_as_structured(self):
        a = self.write("snapshot.md")
        b = self.write("archive.unusual", obj=conversation(1780000100))
        for p in (a, b):
            with self.subTest(file=p.name):
                records = list(search.iter_records(p))
                self.assertEqual(len(records), 2)
                self.assertEqual({r.kind for r in records}, {"conversation-message"})
        eligible = set(search.permitted([self.root], {".git", "PRIOR_ART", "QUARANTINE"}, 1000000))
        self.assertIn(a, eligible)
        self.assertIn(b, eligible)

    def test_text_search_falls_back_for_malformed_json_shaped_plaintext(self):
        p = self.write("broken.txt", text="{invalid but still searchable text")
        rows = list(search.iter_records(p))
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0].kind, "text-line")
        self.assertIn("searchable", rows[0].text)

    def test_quarantine_and_prior_art_not_added(self):
        self.write("PRIOR_ART/old.secret", obj=conversation())
        self.write("QUARANTINE/private.backup", obj=conversation())
        self.write("safe.public", obj=conversation())
        records = dates.build_records(self.root, TIMEZONE)
        self.assertEqual(len(records), 1)
        self.assertIn("safe.public", records[0].old_path)

    def test_external_discovery_json_plaintext_and_pruning(self):
        self.write("all/valid.md", obj=conversation())
        self.write("more/valid.log", obj=conversation(1780000200))
        self.write("QUARANTINE/hidden.txt", obj=conversation(1780000400))
        self.write("PRIOR_ART/hidden.md", obj=conversation(1780000500))
        self.write("readme.txt", text="This is ordinary prose.")
        items, stats = external.discover(
            self.root, "Satobloc/SAT_THEORY_ARCHIVE_2023-25", "main", set(), TIMEZONE
        )
        self.assertEqual(stats["recognized"], 2)
        self.assertEqual(len(items), 2)
        self.assertTrue(all(x["source_path"].endswith((".md", ".log")) for x in items))
        self.assertTrue(all(x["raw_url"].startswith("https://raw.githubusercontent.com/") for x in items))
        self.assertTrue(all(x["message_count"] == 2 for x in items))


if __name__ == "__main__":
    unittest.main()
