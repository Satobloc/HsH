import json
import tempfile
import unittest
from pathlib import Path
from zoneinfo import ZoneInfo

from tools.date_conversation_exports import build_records

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

if __name__=="__main__":
    unittest.main()
