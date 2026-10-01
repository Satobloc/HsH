import json
import tempfile
import unittest
from pathlib import Path
from zoneinfo import ZoneInfo

from tools.date_conversation_exports import build_records
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
