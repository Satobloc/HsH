import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from zoneinfo import ZoneInfo

from tools.date_conversation_exports import build_records
from tools.audit_conversation_date_tags import audit
from tools import audit_conversation_date_tags as audit_tags
from tools import build_conversation_viewer as viewer_base
from tools import build_conversation_viewer_resolved as viewer_resolved

class DateConversationExportsTests(unittest.TestCase):
    def write_convo(self,path,stamp):
        data={"current_node":"m","mapping":{"m":{"parent":None,"message":{"author":{"role":"user"},"create_time":stamp}}}}
        path.write_text(json.dumps(data),encoding="utf-8")

    def write_undatable_convo(self,path):
        data={"current_node":"m","mapping":{
            "m":{"parent":None,"message":{"author":{"role":"user"},"content":{"parts":["A message"]}}}
        }}
        path.write_text(json.dumps(data),encoding="utf-8")

    def run_strict_audit(self,root,output):
        old_cwd=Path.cwd()
        old_argv=sys.argv[:]
        try:
            os.chdir(root)
            sys.argv=["audit_conversation_date_tags.py","--output",str(output),"--strict"]
            return audit_tags.main()
        finally:
            sys.argv=old_argv
            os.chdir(old_cwd)

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

            private=root/"viewer-private"; private.mkdir()
            private_dev=private/"development.json"; private_live=private/"live.json"
            private_root=private/"root.json"

            old_cwd=Path.cwd()
            try:
                import os
                os.chdir(root)
                viewer_resolved.refresh_source_manifests(private_dev,private_live,private_root)
            finally:
                os.chdir(old_cwd)

            self.assertEqual(canonical_dev.read_text(encoding="utf-8"),'{"mode":"apply","sentinel":"dev"}\n')
            self.assertEqual(canonical_live.read_text(encoding="utf-8"),'{"mode":"dry-run","sentinel":"live"}\n')
            self.assertEqual(canonical_root.read_text(encoding="utf-8"),'{"mode":"apply","sentinel":"root"}\n')
            self.assertEqual(json.loads(private_dev.read_text(encoding="utf-8"))["mode"],"dry-run")
            self.assertEqual(json.loads(private_live.read_text(encoding="utf-8"))["mode"],"dry-run")
            self.assertEqual(json.loads(private_root.read_text(encoding="utf-8"))["mode"],"dry-run")

    def test_repository_root_scan_is_suffix_independent_and_content_gated(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td); tz=ZoneInfo("America/New_York")
            excluded=("DEVELOPMENT_FULL_CONVOS","LIVE CONVOS","PRIOR_ART","QUARANTINE","CONVERSATION_VIEWER",".git")
            for directory in excluded:
                folder=root/directory; folder.mkdir()
                self.write_convo(folder/"excluded.json",1780000000)

            valid_names=("dated.md","dated.log","dated.weird","dated")
            for name in valid_names:
                self.write_convo(root/name,1780000000)

            (root/"ordinary.md").write_text("Ordinary prose, not a JSON export.\n",encoding="utf-8")
            (root/"arbitrary.json").write_text(json.dumps({"create_time":1780000000}),encoding="utf-8")
            (root/"arbitrary.weird").write_text(json.dumps({"create_time":1780000000}),encoding="utf-8")

            old_cwd=Path.cwd()
            try:
                os.chdir(root)
                records=build_records(Path("."),tz)
            finally:
                os.chdir(old_cwd)

            by_name={Path(record.old_path).name:record for record in records}
            self.assertEqual(
                {name for name in valid_names if by_name.get(name) and by_name[name].status=="planned"},
                set(valid_names),
            )
            self.assertEqual(
                {name for name,record in by_name.items() if record.status=="skipped"},
                {"arbitrary.json","arbitrary.weird"},
            )
            self.assertNotIn("ordinary.md",by_name)
            self.assertFalse(any(Path(record.old_path).parts[0] in excluded for record in records))

    def test_viewer_accepts_root_sources_with_nonstandard_suffix(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            source_name="26.05.28•26.05.28•root-source.md"
            source=root/source_name
            self.write_convo(source,1780000000)
            dev=root/"development.json"; live=root/"live.json"; root_manifest=root/"root.json"
            dev.write_text(json.dumps({"records":[]}),encoding="utf-8")
            live.write_text(json.dumps({"records":[]}),encoding="utf-8")
            root_manifest.write_text(json.dumps({"generated_at_utc":"2026-11-13T22:00:00Z","records":[{
                "old_path":source_name,
                "new_path":source_name,
                "start_local":"2026-05-28T16:26:40-04:00",
                "end_local":"2026-05-28T16:26:40-04:00",
                "timestamp_source":"message.create_time",
                "message_count":1,
                "status":"unchanged",
                "warnings":[],
            }]}),encoding="utf-8")
            external=root/"external.json"
            external.write_text(json.dumps({"schema_version":1,"conversations":[]}),encoding="utf-8")
            curation=root/"CURATION.json"
            curated=root/"curated"
            old_cwd=Path.cwd()
            old_canonical=viewer_base.canonical_path
            old_normalize=viewer_base.normalize_record
            try:
                os.chdir(root)
                viewer_base.canonical_path=viewer_resolved.existing_canonical_path
                viewer_base.normalize_record=viewer_resolved.existing_source_normalize_record
                payload=viewer_base.build_manifest(
                    dev,live,root_manifest,external,curation,curated,"Satobloc","HsH","main"
                )
            finally:
                viewer_base.canonical_path=old_canonical
                viewer_base.normalize_record=old_normalize
                os.chdir(old_cwd)
            self.assertEqual(payload["counts"]["repository_root_and_other"],1)
            self.assertEqual(payload["conversations"][0]["path"],source_name)
            self.assertEqual(payload["conversations"][0]["source_extension"],".md")

    def test_root_chronology_includes_suffix_independent_sources(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            names=("dated.md","dated.log","dated.weird","dated")
            for name in names:
                self.write_convo(root/name,1780000000)
            output=root/"chronology.md"
            script=Path(__file__).resolve().parents[1]/"tools"/"index_conversation_chronology.py"
            subprocess.run(
                [sys.executable,str(script),".","--output",str(output)],
                cwd=root,check=True,capture_output=True,text=True,
            )
            rendered=output.read_text(encoding="utf-8")
            for name in names:
                self.assertIn(name,rendered)

    def test_strict_audit_allows_legitimate_undatable_exceptions(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            (root/"DEVELOPMENT_FULL_CONVOS").mkdir()
            (root/"LIVE CONVOS").mkdir()
            self.write_undatable_convo(root/"undatable.weird")
            output=root/"date-tag-audit.json"
            status=self.run_strict_audit(root,output)
            payload=json.loads(output.read_text(encoding="utf-8"))
            self.assertEqual(status,0)
            self.assertTrue(payload["all_datable_tagged"])
            self.assertFalse(payload["all_conversations_have_dates"])
            self.assertFalse(payload["fully_tagged"])
            self.assertEqual(payload["overall_counts"]["undatable_conversations"],1)

    def test_strict_audit_still_fails_for_untagged_datable_sources(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            (root/"DEVELOPMENT_FULL_CONVOS").mkdir()
            (root/"LIVE CONVOS").mkdir()
            self.write_convo(root/"untagged.md",1780000000)
            output=root/"date-tag-audit.json"
            status=self.run_strict_audit(root,output)
            payload=json.loads(output.read_text(encoding="utf-8"))
            self.assertEqual(status,1)
            self.assertFalse(payload["all_datable_tagged"])
            self.assertEqual(payload["overall_counts"]["needs_renaming"],1)

    def test_strict_audit_still_fails_for_unresolved_collisions(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)
            (root/"DEVELOPMENT_FULL_CONVOS").mkdir()
            (root/"LIVE CONVOS").mkdir()
            source=root/"collision.json"
            self.write_convo(source,1780000000)
            desired=Path(build_records(root,ZoneInfo("America/New_York"))[0].new_path)
            desired.write_text(source.read_text(encoding="utf-8"),encoding="utf-8")
            output=root/"date-tag-audit.json"
            status=self.run_strict_audit(root,output)
            payload=json.loads(output.read_text(encoding="utf-8"))
            self.assertEqual(status,1)
            self.assertFalse(payload["all_datable_tagged"])
            self.assertEqual(payload["overall_counts"]["unresolved_collisions"],1)

if __name__=="__main__":
    unittest.main()
