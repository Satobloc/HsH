import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("equation_pipeline", ROOT / "tools" / "equation_pipeline.py")
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
sys.modules[SPEC.name] = MODULE
SPEC.loader.exec_module(MODULE)


class EquationPipelineTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.registry_path = ROOT / "formalization" / "equations.json"
        cls.registry = MODULE.load_registry(cls.registry_path)

    def test_registry_is_valid(self):
        self.assertEqual(MODULE.validate_registry(self.registry), [])

    def test_dimensions_and_numeric_checks_pass(self):
        results = []
        for equation in self.registry["equations"]:
            results.extend(MODULE.run_checks(equation))
        relevant = [item for item in results if item.kind in {"dimensions", "numeric_close"}]
        self.assertTrue(relevant)
        self.assertTrue(all(item.status == "PASS" for item in relevant), relevant)

    def test_outputs_are_created_and_statuses_are_explicit(self):
        with tempfile.TemporaryDirectory() as directory:
            base = Path(directory)
            code = MODULE.main([str(self.registry_path), "--out", str(base / "checks"), "--lean-out", str(base / "lean")])
            self.assertEqual(code, 0)
            records = [json.loads(line) for line in (base / "checks" / "check-log.jsonl").read_text(encoding="utf-8").splitlines()]
            self.assertTrue(records)
            self.assertTrue(all(item["status"] in {"PASS", "FAIL", "NOT_RUN"} for item in records))
            self.assertIn("theorem radius_rearrangement", (base / "lean" / "EQ_0001_Carrier.lean").read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
