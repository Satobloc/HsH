"""Test nonpublic, source-path-accurate conversation candidate audit."""
import json
import tempfile
import unittest
from pathlib import Path
from tools.audit_research_conversation_locations import audit, kind


class UnfiledConversationAuditTests(unittest.TestCase):
    def test_candidate_classification_without_directory_leakage(self):
        self.assertEqual(kind(Path("[A] Geometry in Physics — raw.json")),
                         "ROOT_OUTSIDE_ORGANIZING_FOLDERS")
        self.assertEqual(kind(Path("DEVELOPMENT_FULL_CONVOS/24.03.07•24.03.13•RMS — raw.json")),
                         "LOOSE_DEVELOPMENT_CONVERSATION")
        self.assertEqual(kind(Path("LIVE CONVOS/26.09.04•26.09.13•MERIDIAN_SOLVER_CONVO.txt")),
                         "LOOSE_LIVE_CONVERSATION")
        self.assertIsNone(kind(Path("DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_14/something — raw.json")))
        self.assertIsNone(kind(Path("QUARANTINE/something — raw.json")))
        self.assertIsNone(kind(Path("PUBLIC_SITE/archived-chat — raw.json")))
        self.assertIsNone(kind(Path("WORKSPACES/MERCER/test_chat — raw.json")))
        self.assertIsNone(kind(Path("README.md")))

    def test_report_flags_unindexed_without_publication(self):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder)
            (root/"DEVELOPMENT_FULL_CONVOS").mkdir()
            (root/"QUARANTINE").mkdir()
            (root/"CONVERSATION_VIEWER"/"data").mkdir(parents=True)
            root_src="[A] Geometry in Physics — raw.json"
            loose_src="DEVELOPMENT_FULL_CONVOS/26.01.01•26.01.02•Loose — raw.txt"
            (root/root_src).write_text('{"title":"root chat"}',encoding="utf-8")
            (root/loose_src).write_text('{"title":"loose chat"}',encoding="utf-8")
            (root/"QUARANTINE"/"secret — raw.json").write_text('{"title":"secret"}')
            (root/"DEVELOPMENT_FULL_CONVOS"/"CONVO DOWNLOAD TARGETS.txt").write_text("List of raw conversations to export")
            catalog=root/"CONVERSATION_VIEWER"/"data"/"conversations.json"
            catalog.write_text(json.dumps({"conversations":[{"path":loose_src}]}))
            data=audit(root,catalog)
            self.assertEqual(data["viewer_total"],1)
            self.assertEqual(data["statistics"]["candidates"],2)
            self.assertEqual(data["statistics"]["not_in_viewer"],1)
            seen={i["source"]:i for i in data["items"]}
            self.assertFalse(seen[root_src]["viewer_catalog_includes_source"])
            self.assertTrue(seen[loose_src]["viewer_catalog_includes_source"])
            self.assertTrue(all(i["publication_action"].startswith("NONE") for i in seen.values()))
            self.assertTrue(all(i["message_provenance_verified"] is False for i in seen.values()))
            self.assertTrue(all(len(i["content_hash"])==64 for i in seen.values()))
            self.assertFalse(any("secret" in i["source"] for i in data["items"]))

    def test_does_not_assert_parsing_from_extensions(self):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder)
            (root/"CONVERSATION_VIEWER"/"data").mkdir(parents=True)
            (root/"Fake — raw.json").write_text("not actually JSON")
            catalog=root/"CONVERSATION_VIEWER"/"data"/"conversations.json"
            catalog.write_text('{"conversations":[]}')
            found=audit(root,catalog)["items"]
            self.assertEqual(len(found),1)
            self.assertEqual(found[0]["research_ingestion_status"],
                             "LOCATION_ONLY_NOT_CONTENT_READ")


if __name__=="__main__":
    unittest.main()
