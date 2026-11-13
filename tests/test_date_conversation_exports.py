import json
import os
import tempfile
import unittest
from pathlib import Path
from zoneinfo import ZoneInfo

from tools.date_conversation_exports import build_records
from tools.audit_conversation_date_tags import audit
from tools import build_conversation_viewer_resolved as viewer_resolved

class DateConversationExportsTests(unittest.TestCase):
    def write_convo(self,path,stamp):
        data={"current_node":"m","mapping":{"m":{"parent":None,"message":{"author":{"role":"user"},"create_time":stamp}}}}
        path.write_text(json.dumps(data),encoding="utf-8")

    def test_collision_is_local_not_global(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td); tz=ZoneInfo("America/New_York")
            a=root/"A — raw.json"; b=root/"B — raw.json"
            self.write_convo(a,1780000000); self.write_convo(b,1780000000)
            first=build_records(root,tz)
            target_a=Path(next(r.new_path for r in first if r.old_path==str(a)))
            target_a.write_text(a.read_text(encoding="utf-8"),encoding="utf-8")
            records=build_records(root,tz)
            by_name={Path(r.old_path).name:r for r in records}
            self.assertEqual(by_name["A — raw.json"].status,"collision")
            self.assertEqual(by_name["B — raw.json"].status,"planned")

    def test_collision_resolution_preserves_both_dated_exports(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td);tz=ZoneInfo("America/New_York")
            original=root/"Collision — raw.json"
            self.write_convo(original,1780000000)
            desired=Path(build_records(root,tz)[0].new_path)
            desired.write_text(original.read_text(encoding="utf-8"),encoding="utf-8")
            rows=build_records(root,tz,resolve_collisions=True)
            planned=next(x for x in rows if x.old_path==str(original))
            self.assertEqual(planned.status,"planned")
            self.assertIn("[collision-",planned.new_path)
            self.assertNotEqual(planned.new_path,str(desired))
            original.rename(planned.new_path)
            self.assertTrue(desired.is_file())
            self.assertTrue(Path(planned.new_path).is_file())
            self.assertEqual(len(build_records(root,tz)),2)
            self.assertTrue(all(x.status=="unchanged" for x in build_records(root,tz)))
            check=audit(root)
            self.assertEqual(check["counts"]["dated_and_correct"],2)
            self.assertEqual(check["exceptions"],[])

    def test_audit_refuses_to_invent_undated_conversation_dates(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            source=root/"no-timestamps.txt"
            source.write_text(json.dumps({"current_node":"m","mapping":{
                "m":{"parent":None,"message":{"author":{"role":"user"},"content":{"parts":["A message"]}}}
            }}),encoding="utf-8")
            result=audit(root)
            self.assertEqual(result["counts"]["undatable_conversations"],1)
            self.assertEqual(result["counts"]["dated_and_correct"],0)
            self.assertEqual(result["exceptions"][0]["path"],str(source))
            self.assertTrue(result["all_datable_tagged"])
            self.assertFalse(result["all_conversations_have_dates"])
            self.assertFalse(result["fully_tagged"])
            self.assertTrue(result["strict_pass"])

    def test_strict_audit_still_blocks_datable_untagged_conversations(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            source=root/"conversation.md"
            self.write_convo(source,1780000000)
            result=audit(root)
            self.assertEqual(result["counts"]["needs_renaming"],1)
            self.assertFalse(result["all_datable_tagged"])
            self.assertFalse(result["strict_pass"])

    def test_strict_audit_blocks_unresolved_filename_collisions(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td); tz=ZoneInfo("America/New_York")
            source=root/"collision.json"
            self.write_convo(source,1780000000)
            target=Path(build_records(root,tz)[0].new_path)
            target.write_text(source.read_text(encoding="utf-8"),encoding="utf-8")
            result=audit(root)
            self.assertEqual(result["counts"]["unresolved_collisions"],1)
            self.assertFalse(result["strict_pass"])

    def test_root_scan_is_suffix_independent_and_preserves_exclusions(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            self.write_convo(root/"root.md",1780000000)
            self.write_convo(root/"root.log",1780000001)
            self.write_convo(root/"root.data",1780000002)
            self.write_convo(root/"extensionless",1780000003)
            (root/"notes.md").write_text("Ordinary prose, not a JSON export.",encoding="utf-8")
            (root/"arbitrary.json").write_text('{"create_time":1780000000}',encoding="utf-8")
            for excluded in ("PRIOR_ART","QUARANTINE","DEVELOPMENT_FULL_CONVOS","LIVE CONVOS"):
                folder=root/excluded
                folder.mkdir()
                self.write_convo(folder/"hidden.md",1780000004)
            old_cwd=Path.cwd()
            try:
                os.chdir(root)
                records=build_records(Path("."),ZoneInfo("America/New_York"))
            finally:
                os.chdir(old_cwd)
            planned={Path(r.old_path).name for r in records if r.status=="planned"}
            self.assertEqual(planned,{"root.md","root.log","root.data","extensionless"})
            skipped={Path(r.old_path).name for r in records if r.status=="skipped"}
            self.assertIn("arbitrary.json",skipped)
            self.assertNotIn("notes.md",{Path(r.old_path).name for r in records})
            self.assertNotIn("hidden.md",{Path(r.old_path).name for r in records})

    def test_viewer_private_refresh_does_not_overwrite_canonical_audit_manifests(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            dev=root/"DEVELOPMENT_FULL_CONVOS"; live=root/"LIVE CONVOS"
            dev.mkdir(); live.mkdir()
            self.write_convo(dev/"A — raw.json",1780000000)
            self.write_convo(live/"B — raw.json",1780000001)

            canonical_dir=root/"indexes"/"manifests"; canonical_dir.mkdir(parents=True)
            canonical_dev=canonical_dir/"development-conversation-dates.json"
            canonical_live=canonical_dir/"live-conversation-dates.json"
            canonical_root=canonical_dir/"root-conversation-dates.json"
            canonical_dev.write_text('{"mode":"apply","sentinel":"dev"}\n',encoding="utf-8")
            canonical_live.write_text('{"mode":"dry-run","sentinel":"live"}\n',encoding="utf-8")
            canonical_root.write_text('{"mode":"apply","sentinel":"root"}\n',encoding="utf-8")

            self.write_convo(root/"root-export.md",1780000002)
            private=root/"viewer-private"; private.mkdir()
            private_dev=private/"development.json"; private_live=private/"live.json"; private_root=private/"root.json"

            old_cwd=Path.cwd()
            try:
                os.chdir(root)
                viewer_resolved.refresh_source_manifests(private_dev,private_live,private_root)
            finally:
                os.chdir(old_cwd)

            self.assertEqual(canonical_dev.read_text(encoding="utf-8"),'{"mode":"apply","sentinel":"dev"}\n')
            self.assertEqual(canonical_live.read_text(encoding="utf-8"),'{"mode":"dry-run","sentinel":"live"}\n')
            self.assertEqual(canonical_root.read_text(encoding="utf-8"),'{"mode":"apply","sentinel":"root"}\n')
            self.assertEqual(json.loads(private_dev.read_text(encoding="utf-8"))["mode"],"dry-run")
            self.assertEqual(json.loads(private_live.read_text(encoding="utf-8"))["mode"],"dry-run")
            root_manifest=json.loads(private_root.read_text(encoding="utf-8"))
            self.assertTrue(any(Path(r["old_path"]).name=="root-export.md" for r in root_manifest["records"]))

if __name__=="__main__":
    unittest.main()
