"""M4 equation recurrence: test historical provenance, equivalence, mirrors and negatives."""
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/"tools"))
import mersearch_math_genealogy as G
import mersearch_math as M


def row(repository,path,raw,date="",kind="conversation-message",sha="",loc="messages[0]",line=1):
    return {
      "repository":repository,"path":path,"raw":raw,"source_sha256":sha or path,
      "record_locator":loc,"source_line":line,"source_kind":kind,
      "message_id":"m1" if kind=="conversation-message" else "",
      "timestamp":date,"conversation_id":"test-case","source_url":
          "https://github.com/"+repository+"/blob/main/"+path,
      "symbols":["B"],
    }


class UnitMathGenealogyTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.file=Path(self.tmp.name)/"MATH_EXPRESSIONS.jsonl"

    def compile(self,records,**options):
        self.file.write_text("\n".join(json.dumps(d,ensure_ascii=False) for d in records)+"\n",
                            encoding="utf-8")
        return G.build(self.file,**options)

    def test_rearrangements_create_one_family_without_derivation_claim(self):
        nodes=[
          row("Satobloc/SAT_THEORY_ARCHIVE_2023-25","early.raw.json",
              "B=3/(4*pi)","2025-03-01T12:00:00Z",sha="source-early"),
          row("Satobloc/HsH","late.raw.json",
              "4πB=3","2026-05-01T12:00:00Z",sha="source-late"),
          row("Satobloc/HSH_RESOURCES","unrelated.raw.json",
              "X=3/(4*pi)","2024-01-01T12:00:00Z",sha="source-other"),
        ]
        g=self.compile(nodes)
        group=[f for f in g["families"] if f["archivally_distinct_occurrences"]==2]
        self.assertEqual(len(group),1)
        self.assertEqual(group[0]["first_direct_attestation"],"2025-03-01T12:00:00Z")
        self.assertEqual(group[0]["last_direct_attestation"],"2026-05-01T12:00:00Z")
        self.assertTrue(any(e["relation"]=="ALGEBRAICALLY_EQUIVALENT_POLYNOMIAL" for e in g["edges"]))
        self.assertFalse(any("DERIVES" in e["relation"] for e in g["edges"]))
        self.assertTrue(all("not_claimed" in e for e in g["edges"]))
        self.assertEqual(g["coverage"]["claim"],"PARTIAL_SYMBOLIC_EXTRACTION_NOT_EXHAUSTIVE")

    def test_mirrors_do_not_count_as_independent_attestations(self):
        basic=row("Satobloc/SAT_THEORY_ARCHIVE_2023-25","original/a.txt",
                  "B=3/(4*pi)","2025-04-01T12:00:00Z",sha="same-original")
        copy=row("Satobloc/HsH","mirror/a.txt",
                 "B=3/(4*pi)","",kind="text-line",sha="same-original")
        later=row("Satobloc/HsH","discussion.json",
                  "4*pi*B=3","2026-01-01T12:00:00Z",sha="later-source")
        graph=self.compile([basic,copy,later])
        self.assertEqual(graph["statistics"]["parsed_nodes"],3)
        self.assertEqual(graph["families"][0]["archivally_distinct_occurrences"],2)
        self.assertTrue(any(e["relation"]=="BYTE_IDENTICAL_SOURCE_MIRROR" for e in graph["edges"]))

    def test_approximation_never_in_polynomial_exact_family(self):
        graph=self.compile([
            row("Satobloc/HsH","equal.json","B=3/(4*pi)","2025-05-01T00:00:00Z"),
            row("Satobloc/HsH","approx.json","B≈3/(4*pi)","2025-05-02T00:00:00Z"),
            row("Satobloc/HsH","rounded.json","B≈0.2387","2025-06-01T00:00:00Z")
        ],atol=0.001)
        exact={n["id"] for n in graph["nodes"] if n["polynomial_form_id"]}
        self.assertEqual(len(exact),1)
        self.assertTrue(any(e["relation"]=="NUMERICALLY_CLOSE_NOT_EQUIVALENT" for e in graph["edges"]))
        self.assertFalse(any(len(f["member_ids"])>1 for f in graph["families"]))

    def test_analogous_numbers_on_different_physical_symbols_are_not_linked(self):
        graph=self.compile([
            row("Satobloc/HsH","c1","B≈0.239","2025-01-01T00:00:00Z"),
            row("Satobloc/HsH","c2",r"\Delta \phi\approx0.239\text{ rad}","2025-01-02T00:00:00Z"),
            row("Satobloc/HsH","c3","v_crit=0.239*c","2025-01-03T00:00:00Z"),
        ])
        self.assertFalse(any(e["relation"]=="NUMERICALLY_CLOSE_NOT_EQUIVALENT" for e in graph["edges"]))

    def test_units_are_not_silently_converted_or_assumed(self):
        graph=self.compile([
            row("Satobloc/HsH","r1",r"\Delta \phi\approx0.239 \text{ rad}"),
            row("Satobloc/HsH","d1",r"\Delta \phi\approx0.239 \text{ deg}"),
            row("Satobloc/HsH","u1",r"\Delta \phi\approx0.239"),
        ])
        tags={n["unit_hint"] for n in graph["nodes"]}
        self.assertEqual(tags,{"rad","deg","not-recorded"})
        self.assertEqual(graph["edges"],[])

    def test_soft_metadata_and_file_upload_dates_never_claim_direct_priority(self):
        graph=self.compile([
            row("Satobloc/HsH","copy.txt","B=3/(4*pi)","2025-01-01T10:00:00Z",kind="text-line"),
            row("Satobloc/HsH","record.json","B=3/(4*pi)","2026-01-01T10:00:00Z"),
        ])
        self.assertEqual(graph["families"][0]["first_direct_attestation"],"2026-01-01T10:00:00Z")
        self.assertEqual(graph["families"][0]["undated_occurrences"],1)
        first=next(n for n in graph["nodes"] if n["path"]=="copy.txt")
        self.assertEqual(first["date"],"")
        self.assertEqual(first["source_timestamp_unverified"],"2025-01-01T10:00:00Z")

    def test_numeric_nearness_non_transitive(self):
        graph=self.compile([
            row("Satobloc/HsH","a","B≈0.2380"),
            row("Satobloc/HsH","b","B≈0.2389"),
            row("Satobloc/HsH","c","B≈0.2398"),
        ],atol=0.001)
        self.assertEqual(len([e for e in graph["edges"] if e["relation"]=="NUMERICALLY_CLOSE_NOT_EQUIVALENT"]),2)
        self.assertEqual(graph["families"],[])

    def test_graph_node_cap_refuses_silent_truncation(self):
        data=[row("Satobloc/HsH","a"+str(i),"B="+str(i)) for i in range(3)]
        with self.assertRaisesRegex(ValueError,"NOT silently"):
            self.compile(data,max_nodes=2)

    def test_rejected_unparseable_rows_are_counted(self):
        good=row("Satobloc/HsH","good","B=3/(4*pi)")
        bad=row("Satobloc/HsH","bad","B=evil(42)")
        graph=self.compile([good,bad,{}])
        self.assertEqual(graph["statistics"]["parsed_nodes"],1)
        self.assertEqual(graph["statistics"]["unparsed_inventory_rows"],2)

    def test_zero_inventory_and_manifest_coverage(self):
        graph=self.compile([],manifest={
            "archives_searched":["Satobloc/HsH"],"missing_archives":["Satobloc/HSH_RESOURCES"],
            "coverage_status":"partial","content_coverage_status":"partial",
            "inventory_limitations":{"oversized_files_skipped":2},
            "math_inventory":{"extraction_statistics":{"truncated_lines":5}}
        })
        self.assertEqual(graph["nodes"],[])
        self.assertEqual(graph["coverage"]["missing_repositories"],["Satobloc/HSH_RESOURCES"])
        self.assertEqual(graph["coverage"]["source_math_extraction_statistics"]["truncated_lines"],5)

    def test_source_id_linkage_and_determinism(self):
        records=[row("Satobloc/HsH","a","B=3/(4*pi)",sha="sha-A"),
                 row("Satobloc/HsH","b","4πB=3",sha="sha-B")]
        a=self.compile(records)
        b=self.compile(records)
        self.assertEqual(a,b)
        self.assertTrue(all(x["source_url"].startswith("https://github.com/") for x in a["nodes"]))


class EndToEndM4Tests(unittest.TestCase):
    def test_index_only_mode_needs_no_search_query(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d)
            sat=root/"SAT_THEORY_ARCHIVE_2023-25"
            sat.mkdir()
            (sat/"line.txt").write_text("B=3/(4*pi)\n4πB=3\n",encoding="utf-8")
            out=root/"out"
            run=subprocess.run([sys.executable,str(ROOT/"tools/search_archive_content.py"),
              str(sat),"--genealogy-only","--out",str(out)],
              capture_output=True,text=True,timeout=30)
            self.assertEqual(run.returncode,0,run.stderr)
            graph=json.loads((out/"MATH_GENEALOGY.json").read_text(encoding="utf-8"))
            search=json.loads((out/"SEARCH_RESULTS.json").read_text(encoding="utf-8"))
            self.assertTrue(search["math_genealogy"]["index_only"])
            self.assertEqual(len(graph["nodes"]),2)
            self.assertEqual(len(search["hits"]),0)

    def test_cli_writes_graph_and_inventory_as_search_sidecars(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d)
            sat=root/"SAT_THEORY_ARCHIVE_2023-25"
            hsh=root/"HsH"
            resources=root/"HSH_RESOURCES"
            for x in (sat,hsh,resources):x.mkdir()
            (sat/"01-early.txt").write_text("Formula B=3/(4*pi)\n",encoding="utf-8")
            (hsh/"02-later.txt").write_text("Result 4πB=3\n",encoding="utf-8")
            (hsh/"03-approx.txt").write_text("B≈0.2387\n",encoding="utf-8")
            (resources/"unrelated.txt").write_text("X=3/(4*pi)\n",encoding="utf-8")
            (hsh/"QUARANTINE").mkdir()
            (hsh/"QUARANTINE"/"unsafe.txt").write_text("B=3/(4*pi)\n",encoding="utf-8")
            output=root/"out"
            command=[sys.executable,str(ROOT/"tools/search_archive_content.py"),
                     str(sat),str(hsh),str(resources),
                     "--expr",'equiv:"B=3/(4*pi)"',
                     "--math-genealogy","--genealogy-atol","0.001",
                     "--out",str(output)]
            run=subprocess.run(command,text=True,capture_output=True,timeout=60)
            self.assertEqual(run.returncode,0,run.stdout+"\n"+run.stderr)
            self.assertTrue((output/"MATH_EXPRESSIONS.jsonl").is_file())
            graph=json.loads((output/"MATH_GENEALOGY.json").read_text(encoding="utf-8"))
            search=json.loads((output/"SEARCH_RESULTS.json").read_text(encoding="utf-8"))
            self.assertEqual(len(graph["nodes"]),4)
            self.assertTrue(search["math_genealogy"]["generated"])
            self.assertEqual(graph["coverage"]["source_scan_coverage"],"complete")
            self.assertTrue(any(f["archivally_distinct_occurrences"]==2 for f in graph["families"]))
            self.assertFalse(any("QUARANTINE" in n["path"] for n in graph["nodes"]))
            self.assertTrue(all("source_sha256" in n and "source_url" in n for n in graph["nodes"]))


if __name__=="__main__":
    unittest.main()
