from __future__ import annotations

import importlib.util
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "WORKSPACES" / "COMMON" / "scripts" / "layered_autotag_nathan_v3.py"
spec = importlib.util.spec_from_file_location("layered_autotag_nathan_v3_test", SCRIPT)
if spec is None or spec.loader is None:
    raise RuntimeError(f"Could not load {SCRIPT}")
v3 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v3)


class AutotagSelectivityV3Tests(unittest.TestCase):
    def assertTagged(self, tag: str, text: str) -> None:
        self.assertIn(tag, v3.topic_tags(text), text)

    def assertNotTagged(self, tag: str, text: str) -> None:
        self.assertNotIn(tag, v3.topic_tags(text), text)

    def test_ambiguous_plain_english_negatives(self) -> None:
        self.assertNotTagged("LAW-LEGAL", "In this case, use the current version.")
        self.assertNotTagged("LAGRANGIAN", "Take action now and update the file.")
        self.assertNotTagged("ELECTROMAGNETISM", "The current version is cleaner.")
        self.assertNotTagged("BIOLOGY", "Use a smaller lattice cell for the render.")
        self.assertNotTagged("ASTRONOMY", "Give that result a five star rating.")
        self.assertNotTagged("ART-DESIGN", "This is state of the art software.")
        self.assertNotTagged("METRIC", "Use recall as the evaluation metric.")
        self.assertNotTagged("SAT-HSH", "I sat down and read the archive.")
        self.assertNotTagged("CODING", "I taught that class yesterday.")

    def test_contextual_positives(self) -> None:
        self.assertTagged("LAW-LEGAL", "The attorney discussed the court case and filing.")
        self.assertTagged("LAGRANGIAN", "Use the stationary action principle in the Lagrangian.")
        self.assertTagged("ELECTROMAGNETISM", "The electric current density changes with voltage.")
        self.assertTagged("BIOLOGY", "The cell membrane surrounds the nucleus.")
        self.assertTagged("ASTRONOMY", "The neutron star is a pulsar.")
        self.assertTagged("ART-DESIGN", "The art museum mounted the painting.")
        self.assertTagged("METRIC", "The Lorentzian metric tensor has this signature.")
        self.assertTagged("SAT-HSH", "SAT treats the worldline as a development surface.")
        self.assertTagged("CODING", "The Python class inherits a method.")

    def test_punctuation_boundaries_survive(self) -> None:
        self.assertTagged("LAGRANGIAN", "The Lagrangian, written here, gives the equations.")
        self.assertTagged("LAW-LEGAL", "The court, not the archive, controls that filing.")

    def test_glossary_and_crosswalk_candidate_surfaces(self) -> None:
        self.assertTagged("DEFINITION-CANDIDATE", "When I use the term torus, I mean a donut.")
        self.assertTagged("CROSSWALK-CANDIDATE", "This corresponds to the standard terminology in geometry.")
        self.assertTagged("SUPERSESSION-CANDIDATE", "From now on use worldtube instead.")


if __name__ == "__main__":
    unittest.main()
