"""M5a glossary/crosswalk extraction and provenance acceptance."""
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/"tools"))
import mersearch_glossary_candidates as G


class SourceAndRelationTests(unittest.TestCase):
    def test_latex_definitions_are_source_candidates_not_authoritative_facts(self):
        src=r"""
\section*{Glossary}
\begin{description}
\item[\( \theta_4(x) \)]
A diagnostic of local angular deviation, not necessarily mass.
\item[\( u^\mu(x) \)]
An emergent time-flow field.
\end{description}
"""
        result=G.parse_glossary(src)
        self.assertEqual(len(result),2)
        self.assertTrue(result[0]["term_original"].startswith(r"\("))
        self.assertIn("diagnostic",result[0]["definition_original"])
        self.assertEqual(result[0]["relation_type"],"SOURCE_DEFINES_TERM")
        self.assertTrue(result[0]["line_start"]<result[1]["line_start"])

    def test_standard_mapping_is_proposed_not_equivalence(self):
        src="""Mapping SAT-W to Known Physics (Initial Set)
1. GRAVITY → Filament Tension Across Time
Standard View:
General Relativity curvature
SAT-W Interpretation:
Geometrical tension
2. PHOTON → Ripple (Structural Realignment Event)
"""
        rows=G.parse_standard_crosswalk(src)
        self.assertEqual(len(rows),2)
        self.assertEqual(rows[0]["standard_original"],"GRAVITY")
        self.assertIn("Filament Tension",rows[0]["sat_original"])
        self.assertEqual(rows[0]["relation_type"],"PROPOSED_INTERPRETIVE_TRANSLATION")
        self.assertEqual(rows[0]["reverse_relation_type"],"PROPOSED_STANDARD_ANALOGUE")
        self.assertFalse(any("EQUIVALENT" in json.dumps(x) for x in rows))

    def test_realistic_archive_fixture_preserves_source_dates_and_authorship_unknown(self):
        with tempfile.TemporaryDirectory() as d:
            home=Path(d)
            root=home/"SAT_THEORY_ARCHIVE_2023-25"
            for repo,rel,kind in G.SOURCES[:4]:
                path=root/rel
                path.parent.mkdir(parents=True,exist_ok=True)
                if kind=="latex-glossary":
                    path.write_text(r"\item[\( \theta_4 \)] An early diagnostic.",encoding="utf-8")
                else:
                    path.write_text("1. GRAVITY → Filament Tension Across Time\n",encoding="utf-8")
            result=G.build(home)
            self.assertGreaterEqual(len(result["entries"]),4)
            self.assertEqual(result["publication_status"],"INTERNAL_REVIEW_CANDIDATES_NOT_PUBLIC_INDEX")
            self.assertIn("Satobloc/SAT_THEORY_ARCHIVE_2023-25",result["archives_present"])
            self.assertNotIn("Satobloc/HSH_RESOURCES",result["archives_present"])
            self.assertTrue(all(x["original_creation_date"] is None for x in result["entries"]))
            self.assertTrue(all(x["historical_currentness"]=="unverified" for x in result["entries"]))
            self.assertTrue(all(x["content_authorship_status"]=="unresolved" for x in result["entries"]))
            self.assertTrue(all("source_sha256" in x and "source_url" in x and "line_start" in x for x in result["entries"]))
            self.assertTrue(any(x["relation_type"]=="PROPOSED_INTERPRETIVE_TRANSLATION" for x in result["entries"]))
            self.assertTrue(all(x["source_url"].startswith("https://github.com/Satobloc/") for x in result["entries"]))

    def test_symlinked_parent_does_not_escape_allowlisted_path(self):
        with tempfile.TemporaryDirectory() as d:
            home=Path(d)
            root=home/"SAT_THEORY_ARCHIVE_2023-25"
            root.mkdir()
            elsewhere=home/"outsider"
            elsewhere.mkdir()
            (elsewhere/"GLOSSARY (LIVE).txt").write_text(r"\item[X] Secret")
            (root/"Early SAT").symlink_to(elsewhere,target_is_directory=True)
            index=G.build(home)
            self.assertFalse(any(x["path"]=="Early SAT/GLOSSARY (LIVE).txt" for x in index["entries"]))
            self.assertEqual(next(x for x in index["sources"] if x["path"]=="Early SAT/GLOSSARY (LIVE).txt")["status"],
                             "symlink-refused")

    def test_user_facing_cli_exports_json_with_honest_partial_coverage(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d)
            output=root/"candidates.json"
            run=subprocess.run([sys.executable,str(ROOT/"tools/mersearch_glossary_candidates.py"),
                "--archives-home",str(root),"--out",str(output)],
                text=True,capture_output=True,timeout=10)
            self.assertEqual(run.returncode,0,run.stderr)
            data=json.loads(output.read_text(encoding="utf-8"))
            self.assertEqual(data["entries"],[])
            self.assertEqual(set(data["missing_archives"]),set(G.ARCHIVE_NAMES))
            self.assertEqual(data["source_scope"],"explicit-historical-source-allowlist-not-complete-corpus")


if __name__=="__main__":
    unittest.main()
