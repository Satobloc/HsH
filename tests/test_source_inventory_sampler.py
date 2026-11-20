"""Regression tests for the Sable source inventory sampler's quarantine boundary."""
from __future__ import annotations

import importlib.util
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "WORKSPACES" / "SABLE" / "scripts" / "source_inventory_sampler.py"
SPEC = importlib.util.spec_from_file_location("source_inventory_sampler_under_test", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
sampler = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = sampler
SPEC.loader.exec_module(sampler)


class SourceInventorySymlinkTests(unittest.TestCase):
    def make_symlink(self, link: Path, target: Path, *, directory: bool = False) -> None:
        try:
            link.symlink_to(target, target_is_directory=directory)
        except (OSError, NotImplementedError) as exc:
            self.skipTest(f"symlinks unavailable in this environment: {exc}")

    def test_leaf_alias_into_prior_art_is_skipped_before_hash_or_line_count(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp).resolve()
            prior = root / "PRIOR_ART"
            ordinary = root / "ordinary"
            prior.mkdir()
            ordinary.mkdir()
            target = prior / "synthetic_fixture.txt"
            target.write_text("SYNTHETIC-QUARANTINE-FIXTURE\nsecond line\n", encoding="utf-8")
            alias = ordinary / "alias.txt"
            self.make_symlink(alias, target)
            allowed = ordinary / "allowed.txt"
            allowed.write_text("ordinary allowed file\n", encoding="utf-8")

            with (
                mock.patch.object(sampler, "sha256_file", wraps=sampler.sha256_file) as hash_file,
                mock.patch.object(sampler, "line_count", wraps=sampler.line_count) as count_lines,
            ):
                records, pruned, symlinks = sampler.inventory_repo("FIXTURE", root)

            paths = {record.path for record in records}
            self.assertIn("ordinary/allowed.txt", paths)
            self.assertNotIn("ordinary/alias.txt", paths)
            self.assertEqual(pruned, 1)
            self.assertEqual(symlinks, 1)
            touched = [call.args[0] for call in hash_file.call_args_list + count_lines.call_args_list]
            self.assertNotIn(alias, touched)
            self.assertNotIn(target, touched)

    def test_symlinked_directory_is_pruned_before_descent(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp).resolve()
            prior = root / "PRIOR_ART" / "nested"
            ordinary = root / "ordinary"
            prior.mkdir(parents=True)
            ordinary.mkdir()
            (prior / "synthetic_fixture.txt").write_text("synthetic only\n", encoding="utf-8")
            alias_dir = ordinary / "alias_dir"
            self.make_symlink(alias_dir, prior, directory=True)
            (ordinary / "allowed.txt").write_text("allowed\n", encoding="utf-8")

            records, pruned, symlinks = sampler.inventory_repo("FIXTURE", root)
            paths = {record.path for record in records}

            self.assertIn("ordinary/allowed.txt", paths)
            self.assertFalse(any(path.startswith("ordinary/alias_dir/") for path in paths))
            self.assertEqual(pruned, 1)
            self.assertEqual(symlinks, 1)

    def test_any_symlink_component_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp).resolve()
            real = root / "real"
            real.mkdir()
            (real / "file.txt").write_text("synthetic\n", encoding="utf-8")
            alias_dir = root / "alias_dir"
            self.make_symlink(alias_dir, real, directory=True)

            self.assertTrue(sampler.contains_symlink_component(root, alias_dir / "file.txt"))
            self.assertFalse(sampler.contains_symlink_component(root, real / "file.txt"))

    def test_normal_inventory_reports_zero_symlink_skips(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp).resolve()
            (root / "ordinary").mkdir()
            (root / "ordinary" / "allowed.txt").write_text("ordinary\n", encoding="utf-8")
            (root / "PRIOR_ART").mkdir()
            (root / "PRIOR_ART" / "not-opened.txt").write_text("synthetic only\n", encoding="utf-8")

            records, pruned, symlinks = sampler.inventory_repo("FIXTURE", root)

            self.assertEqual({record.path for record in records}, {"ordinary/allowed.txt"})
            self.assertEqual(pruned, 1)
            self.assertEqual(symlinks, 0)


if __name__ == "__main__":
    unittest.main(verbosity=2)
