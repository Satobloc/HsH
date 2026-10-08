"""End-to-end Mersearch chronology and three-archive acceptance fixtures."""
import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "tools" / "search_archive_content.py"
sys.path.insert(0, str(ROOT / "tools"))
from mersearch_chronology import Chronology, archive_date, message_date

class ChronologyTests(unittest.TestCase):
    def test_archive_does_not_override_origin(self):
        a = Chronology("10-31-2025 SAT FULL THEORY/ANSWER.txt")
        a.observe("SAT Mark V lab experiment 0.24 radians.", "line:1", "text-line")
        r = a.result()
        self.assertEqual(r["archive_date"], "2025-10-31")
        self.assertEqual(r["estimated_origin_start"], "2025-04-01")
        self.assertEqual(r["date_confidence"], "low-version-inference")
        self.assertFalse(r["earliest_message_at"])

    def test_compilation_abstains_on_origin(self):
        c=Chronology("SAT_HISTORY_ROUNDUP.txt")
        c.observe("In 2024 we called it Stringing Along Theory. Later SAT Mark V.", "line:2", "text-line")
        r=c.result()
        self.assertEqual(r["date_confidence"], "undetermined")
        self.assertTrue(r["retrospective_possible"])
        self.assertEqual(r["earliest_version_mentioned"], "stringing-along")
        self.assertEqual(r["latest_version_mentioned"], "sat-mark-v")

    def test_hard_message_date(self):
        c=Chronology("SAT_CONVOS_1/example.json")
        c.observe("2026-01-01 is a referenced date; optical phase shift 0.24", "message:x",
                  "conversation-message", "2025-02-01T04:00:00+00:00")
        r=c.result()
        self.assertEqual(r["earliest_message_at"], "2025-02-01")
        self.assertEqual(r["earliest_date_mentioned"], "2026-01-01")
        self.assertEqual(r["estimated_origin_start"], "2025-02-01")
        self.assertEqual(r["date_confidence"], "direct-message-timestamps")
        self.assertEqual(message_date("2025-02-01"), "")
        self.assertEqual(archive_date("2025-13-46/file.txt"), "")

    def test_later_version_than_archive_is_not_silently_redated(self):
        c=Chronology("2025-04-15/notes.txt")
        c.observe("SAT Mark V and Chronophysical revisions", "line:1","text-line")
        row=c.result()
        self.assertEqual(row["archive_date"],"2025-04-15")
        self.assertTrue(any("chronophysical" in w for w in row["warnings"]))
        self.assertFalse(row["version_transition_possible"])
        self.assertTrue(row["mixed_era_compilation_possible"])
        self.assertEqual(row["date_confidence"],"low-version-inference")

    def test_named_dates_and_recent_capture(self):
        c=Chronology("DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/notebook.json")
        c.observe("The result was noted February 2, 2025", "messages[0]",
                  "notebooklm-message", capture_timestamp="2026-09-19T00:43:32Z")
        row=c.result()
        self.assertEqual(row["archive_date"],"2026-09-30")
        self.assertEqual(row["earliest_date_mentioned"],"2025-02-02")
        self.assertEqual(row["captured_at"],"2026-09-19")
        self.assertEqual(row["date_confidence"],"undetermined")
        self.assertEqual(row["document_type"],"secondary-structured-export")

    def test_no_false_generic_sat_version(self):
        c=Chronology("notes.txt")
        c.observe("SAT 0.24 phase shift", "line:1", "text-line")
        self.assertFalse(c.result()["version_evidence"])

class SearchTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.base=Path(self.tmp.name)
        self.sat=self.base/"SAT_THEORY_ARCHIVE_2023-25"
        self.hsh=self.base/"HsH"
        self.resources=self.base/"HSH_RESOURCES"
        for p in (self.sat,self.hsh,self.resources):p.mkdir()
        (self.sat/"10-31-2025 SAT FULL THEORY").mkdir()
        (self.sat/"10-31-2025 SAT FULL THEORY"/"ANSWER.txt").write_text(
            "SAT Mark V optical phase shift 0.24 refractive index\n",encoding="utf-8")
        (self.sat/"SAT_HISTORY_ROUNDUP.txt").write_text(
            "History: Originally Stringing Along Theory, then SAT Mark V. 0.24\n",encoding="utf-8")
        mapping={"title":"Optical lab","id":"conv-1","mapping":{"m1":{"message":{
            "id":"m1","create_time":1738382400,
            "author":{"role":"user"},"content":{"parts":["optical phase shift 0.24"]}}}}}
        (self.hsh/"LAB.json").write_text(json.dumps(mapping),encoding="utf-8")
        (self.resources/"other.txt").write_text(
            "Chronophysical question about 0.24 radians\n",encoding="utf-8")
        (self.resources/"PRIOR_ART").mkdir()
        (self.resources/"PRIOR_ART"/"exclude.txt").write_text("0.24",encoding="utf-8")
        self.out=self.base/"output"

    def run_cli(self,*args):
        proc=subprocess.run([sys.executable,str(SCRIPT),"--archives-root",str(self.base),
            *args],capture_output=True,text=True,cwd=self.base,check=False)
        self.assertEqual(proc.returncode,0,proc.stderr)
        return proc

    def search(self,expr,*extra):
        self.run_cli("--expr",expr,"--out",str(self.out),*extra)
        return json.loads((self.out/"SEARCH_RESULTS.json").read_text(encoding="utf-8"))

    def test_default_discovery_from_checkout_cwd(self):
        proc=subprocess.run([sys.executable,str(SCRIPT),"--coverage"],
                            capture_output=True,text=True,cwd=self.hsh,check=False)
        self.assertEqual(proc.returncode,0,proc.stderr)
        self.assertEqual(json.loads(proc.stdout)["coverage_status"],"complete")

    def test_capabilities_no_query_or_roots(self):
        p=self.run_cli("--capabilities")
        spec=json.loads(p.stdout)
        self.assertIn("version",spec["fields"])
        self.assertIn("Satobloc/HSH_RESOURCES",spec["archives_default"])
        self.assertIn("PRIOR_ART",json.dumps(spec))

    def test_default_three_archives_coverage_and_links(self):
        doc=self.search('"0.24"',"--result-mode","files")
        self.assertEqual(doc["coverage_status"],"complete")
        self.assertEqual(len(doc["archives_searched"]),3)
        self.assertEqual(doc["coverage"]["total_results_before_limit"],4)
        self.assertEqual(len(doc["hits"]),4)
        self.assertTrue(all(h["source_url"].startswith("https://github.com/Satobloc/")
                            for h in doc["hits"]))
        self.assertTrue(all("PRIOR_ART" not in h["path"] for h in doc["hits"]))
        self.assertGreaterEqual(doc["coverage"]["inventory_limitations"]["excluded_by_policy"],1)

    def test_content_coverage_never_claims_full_searchability(self):
        doc=self.search('"0.24"',"--result-mode","files")
        self.assertEqual(doc["coverage_status"],"complete")
        self.assertEqual(doc["coverage_status_scope"],"repository_checkout_presence_only")
        self.assertEqual(doc["content_coverage_status"],"partial")
        self.assertGreater(doc["content_coverage_gaps"]["excluded_by_policy"],0)
        self.assertIn("not verified complete",doc["content_coverage_warning"])
        (self.resources/"huge.txt").write_text("0.24 "*1000,encoding="utf-8")
        doc=self.search('"0.24"',"--max-bytes","100")
        self.assertEqual(doc["coverage_status"],"complete")
        self.assertEqual(doc["content_coverage_status"],"partial")
        self.assertGreater(doc["content_coverage_gaps"]["oversized_files_skipped"],0)

    def test_per_repository_inventory_and_missing_repo(self):
        doc=self.search('"0.24"',"--result-mode","files")
        by=doc["coverage_by_repository"]
        self.assertEqual(set(by),{
            "Satobloc/SAT_THEORY_ARCHIVE_2023-25","Satobloc/HsH","Satobloc/HSH_RESOURCES"})
        self.assertGreaterEqual(by["Satobloc/SAT_THEORY_ARCHIVE_2023-25"]["files_scanned"],2)
        self.assertEqual(by["Satobloc/HsH"]["matching_records"],1)
        self.assertGreaterEqual(by["Satobloc/HSH_RESOURCES"]["excluded_by_policy"],1)
        self.assertEqual(sum(v.get("records_scanned",0) for v in by.values()),
                         doc["coverage"]["records_scanned"])
        self.resources.rename(self.base/"not-an-archive")
        doc=self.search('"0.24"')
        self.assertEqual(doc["coverage_by_repository"]["Satobloc/HSH_RESOURCES"],{})
        self.assertEqual(doc["coverage_status"],"partial")

    def test_malformed_json_is_visible_per_repository(self):
        (self.hsh/"broken.json").write_text("{invalid json",encoding="utf-8")
        doc=self.search('"0.24"')
        self.assertGreaterEqual(doc["coverage_by_repository"]["Satobloc/HsH"]["json_decode_failures"],1)
        self.assertGreaterEqual(doc["inventory_limitations"]["json_decode_failures"],1)
        self.assertEqual(doc["content_coverage_status"],"partial")

    def test_unextractable_pdf_is_not_silent(self):
        (self.resources/"empty.pdf").write_bytes(b"%PDF-1.4\\ninvalid pdf")
        doc=self.search('"0.24"')
        local=doc["coverage_by_repository"]["Satobloc/HSH_RESOURCES"]
        self.assertGreaterEqual(local.get("pdf_parse_failures",0)+
                                local.get("pdf_parser_unavailable",0),1)
        self.assertEqual(doc["content_coverage_status"],"partial")

    def test_date_origin_and_version_queries(self):
        doc=self.search('version:sat-mark-v AND "phase shift"')
        self.assertEqual(len(doc["hits"]),1)
        self.assertEqual(doc["hits"][0]["chronology"]["archive_date"],"2025-10-31")
        doc=self.search('era:early-2025 AND "phase shift"')
        self.assertGreaterEqual(len(doc["hits"]),1)
        doc=self.search('repo:Satobloc/HsH AND "0.24"')
        self.assertEqual(len(doc["hits"]),1)
        self.assertEqual(doc["hits"][0]["chronology"]["date_confidence"],"direct-message-timestamps")

    def test_identical_file_mirrors_are_explained_not_lost(self):
        original=(self.sat/"10-31-2025 SAT FULL THEORY"/"ANSWER.txt")
        (self.resources/"COPY.txt").write_bytes(original.read_bytes())
        doc=self.search('"0.24"',"--result-mode","files")
        original_hit=next(h for h in doc["hits"] if h["path"].endswith("ANSWER.txt"))
        self.assertEqual(len(original_hit["identical_file_sources"]),2)
        self.assertEqual(doc["pagination"]["total_hits"],5)
        doc=self.search('"0.24"',"--result-mode","files","--collapse-identical-files")
        self.assertEqual(doc["pagination"]["total_hits"],4)
        retained=next(h for h in doc["hits"] if h["identical_file_sources"])
        self.assertEqual(len(retained["identical_file_sources"]),2)

    def test_pagination_total_and_missing_archive(self):
        doc=self.search('"0.24"',"--limit","1","--offset","2")
        self.assertEqual(doc["pagination"]["total_hits"],4)
        self.assertEqual(doc["pagination"]["returned_hits"],1)
        self.resources.rename(self.base/"not-an-archive")
        doc=self.search('"0.24"')
        self.assertEqual(doc["coverage_status"],"partial")
        self.assertIn("Satobloc/HSH_RESOURCES",doc["missing_archives"])

    def test_uncertain_unstructured_dates(self):
        doc=self.search('path:*SAT_HISTORY_ROUNDUP.txt')
        self.assertEqual(len(doc["hits"]),1)
        row=doc["hits"][0]["chronology"]
        self.assertEqual(row["date_confidence"],"undetermined")
        self.assertTrue(row["retrospective_possible"])

if __name__=="__main__":
    unittest.main()
