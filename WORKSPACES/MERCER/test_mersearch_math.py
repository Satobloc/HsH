"""Mathematics engine contract: conservative positive and NEGATIVE cases."""
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

HERE=Path(__file__).resolve()
ROOT=HERE.parents[2]
sys.path.insert(0,str(ROOT/"tools"))
import mersearch_math as m


class SafeMathParsing(unittest.TestCase):
    def test_dependency_available_in_ci(self):
        self.assertEqual(m.dependency_state(),"available")

    def test_equivalence_of_rearrangements(self):
        query=m.parse("B=3/(4*pi)")
        positive=["4πB=3","4*pi*B = 3","B=3/(4\\pi)",
                  r"B=\frac{3}{4\pi}", "3=4πB", "B=0.75/pi"]
        for source in positive:
            with self.subTest(source=source):
                self.assertTrue(m.algebraically_equivalent(query,m.parse(source)))

    def test_identity_is_symbol_sensitive(self):
        a=m.parse("B=3/(4*pi)")
        for b in ["X=3/(4*pi)","B=4/(3*pi)","B=0.2387","B=B",
                  "B^2=(3/(4*pi))^2","B^2=1","B=1/0.0"]:
            with self.subTest(source=b):
                if b.endswith("1/0.0"):
                    with self.assertRaises(m.UnsupportedExpression):m.parse(b)
                else:
                    self.assertFalse(m.algebraically_equivalent(a,m.parse(b)))

    def test_domain_sensitive_relationship_is_not_promoted(self):
        q=m.parse("x=1")
        for source in ["x*(x-1)=0","x^2=1","(x-1)/(x+1)=0","(x-1)/x=0"]:
            with self.subTest(source=source):
                self.assertFalse(m.algebraically_equivalent(q,m.parse(source)))

    def test_unsafe_ast_inputs_refused_without_execution(self):
        for expression in [
            "B=__import__('os').system('echo OOPS')",
            "B=().__class__", "B=sum([1,2])", "B=x[0]",
            "B=1 if x else 2", "B=2^1000000","B=x^x",
            "B=1/0", "B=eval(x)","B=lambda x:x",
        ]:
            with self.subTest(expression=expression):
                with self.assertRaises(m.UnsupportedExpression):
                    m.parse(expression)

    def test_supported_functions_are_not_claimed_as_polynomial_proofs(self):
        expression=m.parse("B=sqrt(x)")
        self.assertFalse(m.algebraically_equivalent(m.parse("B=3/(4*pi)"),expression))

    def test_numeric_approximation_not_symbolic_proof(self):
        q=m.parse("B=3/(4*pi)")
        rounded=m.parse("B=0.2387")
        self.assertFalse(m.algebraically_equivalent(q,rounded))
        matches,stats=m.match_source("B≈0.2387","value","B=0.239;atol=0.003")
        self.assertEqual(matches[0]["classification"],"NUMERICALLY_CONSISTENT")
        self.assertIn("difference_absolute",matches[0])
        self.assertGreaterEqual(stats["lines_inspected"],1)

    def test_numeric_target_derived_from_linear_equation(self):
        matches,stats=m.match_source("4πB=3","value","B=0.2387;atol=0.001")
        self.assertTrue(matches)
        self.assertEqual(matches[0]["numeric_provenance"],"solved-linear-equality")
        self.assertAlmostEqual(matches[0]["source_numeric"],0.2387324146,places=8)

    def test_numeric_target_must_name_same_variable(self):
        got,_=m.match_source("X≈0.239","value","B=0.239;atol=0.001")
        self.assertEqual(got,[])
        got,_=m.match_source("B≈0.239","value","B=0.239;atol=0.001")
        self.assertEqual(len(got),1)

    def test_structural_search_is_not_false_equivalence(self):
        got,_=m.match_source("B=3/(4*pi)","contains","3/(4*pi)")
        self.assertTrue(got)
        self.assertEqual(got[0]["classification"],"CONTAINS_SUBEXPRESSION")
        got,_=m.match_source("B=3/(4*pi)","contains","4/(3*pi)")
        self.assertEqual(got,[])

    def test_textual_extraction_and_line_provenance(self):
        source="Introduction: optical experiment\nThe result was B=3/(4π) and this is an experimental fit.\nOther text\n4πB=3"
        rows,stats=m.extract(source)
        self.assertEqual(len(rows),2)
        self.assertEqual([r["source_line"] for r in rows],[2,4])
        matches,_=m.match_source(source,"equiv","B=3/(4*pi)")
        self.assertEqual(len(matches),2)
        self.assertEqual([x["source_line"] for x in matches],[2,4])

    def test_latex_nested_fraction(self):
        raw=r"B=\frac{3}{\frac{16}{4}\pi}"
        self.assertTrue(m.algebraically_equivalent(m.parse("B=3/(4*pi)"),m.parse(raw)))

    def test_invalid_numeric_tolerance_fails_closed(self):
        for value in ["0.239;atol=-1","0.239;atol=nan","0.239;rtol=0.1",
                      "B=abc;atol=0.1", "0.239;atol=2", "0.239;atol=0"]:
            with self.subTest(value=value):
                with self.assertRaises(m.UnsupportedExpression):m._numeric_request(value)

    def test_source_extraction_limit_is_reported(self):
        text=("B=3/(4π)\n"*2600)
        rows,stats=m.extract(text)
        self.assertLessEqual(len(rows),m.MAX_SOURCE_CANDIDATES)
        self.assertGreater(stats["truncated_candidates"],0)

    def test_example_refusal_no_physical_identity(self):
        got,_=m.match_source("v_crit≈0.2387*c","value","B=0.2387;atol=0.01")
        self.assertFalse(got)


class UnifiedSearchCLITests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root=Path(self.tmp.name)
        self.archive=self.root/"SAT_THEORY_ARCHIVE_2023-25"
        self.archive.mkdir()
        self.resources=self.root/"HSH_RESOURCES"
        self.resources.mkdir()
        self.hsh=self.root/"HsH"
        self.hsh.mkdir()
        (self.archive/"lab.txt").write_text("Observation B≈0.239\n4πB=3\n",encoding="utf-8")
        (self.hsh/"memo.txt").write_text("Formula B=3/(4*pi)\n",encoding="utf-8")
        (self.resources/"negative.txt").write_text("Formula X=3/(4*pi)\n",encoding="utf-8")
        (self.hsh/"PRIOR_ART").mkdir()
        (self.hsh/"PRIOR_ART"/"private.txt").write_text("Formula B=3/(4*pi)\n",encoding="utf-8")

    def run_query(self,query,extra=()):
        out=self.root/"out"
        proc=subprocess.run([sys.executable,str(ROOT/"tools/search_archive_content.py"),
            str(self.archive),str(self.hsh),str(self.resources),
            "--expr",query,"--out",str(out),*extra],
            capture_output=True,text=True,timeout=30)
        self.assertEqual(proc.returncode,0,proc.stdout+"\n"+proc.stderr)
        return json.loads((out/"SEARCH_RESULTS.json").read_text(encoding="utf-8")),out

    def test_equiv_integrates_boolean_and_multirepo(self):
        data,_=self.run_query('equiv:"B=3/(4*pi)"')
        self.assertEqual(data["pagination"]["total_hits"],2)
        self.assertEqual(data["coverage_status"],"complete")
        self.assertTrue(all(h["math_evidence"] for h in data["hits"]))
        self.assertTrue(all("PRIOR_ART" not in h["path"] for h in data["hits"]))
        self.assertEqual({h["repository"] for h in data["hits"]},
                         {"Satobloc/SAT_THEORY_ARCHIVE_2023-25","Satobloc/HsH"})

    def test_numeric_match_with_tolerance(self):
        data,_=self.run_query('value:"B=0.2387;atol=0.001"')
        self.assertEqual(data["pagination"]["total_hits"],2)
        self.assertTrue(all(h["math_evidence"][0]["classification"]=="NUMERICALLY_CONSISTENT"
                            for h in data["hits"]))

    def test_boolean_and_archival_chronology_remain(self):
        data,_=self.run_query('equiv:"B=3/(4*pi)" AND repo:Satobloc/HsH')
        self.assertEqual(data["pagination"]["total_hits"],1)
        self.assertEqual(data["hits"][0]["repository"],"Satobloc/HsH")
        data,_=self.run_query('math:"B=3/(4*pi)"')
        self.assertEqual(data["pagination"]["total_hits"],1)

    def test_math_inventory_exports_source_locators(self):
        data,out=self.run_query('equiv:"B=3/(4*pi)"',("--math-inventory",))
        rows=[json.loads(x) for x in (out/"MATH_EXPRESSIONS.jsonl").read_text(encoding="utf-8").splitlines()]
        self.assertGreaterEqual(len(rows),4)
        self.assertTrue(all("record_locator" in row and "source_line" in row for row in rows))
        self.assertTrue(data["math_inventory"]["enabled"])
        self.assertEqual(data["math_inventory"]["equations_extracted"],len(rows))


if __name__=="__main__":
    unittest.main()
