import json
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
            canonical_dev.write_text('{"mode":"apply","sentinel":"dev"}\n',encoding="utf-8")
            canonical_live.write_text('{"mode":"dry-run","sentinel":"live"}\n',encoding="utf-8")

            private=root/"viewer-private"; private.mkdir()
            private_dev=private/"development.json"; private_live=private/"live.json"

            old_cwd=Path.cwd()
            try:
                import os
                os.chdir(root)
                viewer_resolved.refresh_source_manifests(private_dev,private_live)
            finally:
                os.chdir(old_cwd)

            self.assertEqual(canonical_dev.read_text(encoding="utf-8"),'{"mode":"apply","sentinel":"dev"}\n')
            self.assertEqual(canonical_live.read_text(encoding="utf-8"),'{"mode":"dry-run","sentinel":"live"}\n')
            self.assertEqual(json.loads(private_dev.read_text(encoding="utf-8"))["mode"],"dry-run")
            self.assertEqual(json.loads(private_live.read_text(encoding="utf-8"))["mode"],"dry-run")

if __name__=="__main__":
    unittest.main()
