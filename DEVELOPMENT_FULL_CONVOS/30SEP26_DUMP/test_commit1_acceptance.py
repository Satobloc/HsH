#!/usr/bin/env python3
"""Implementation-grade acceptance surface for HSH_RESOURCES Commit 1.

This module deliberately tests policy semantics without depending on the live
repository checkout. The eventual repository test should import the actual
tools/archive_source_policy.py instead of the reference helpers below.
"""
from pathlib import Path, PurePosixPath
import tempfile
import unittest

INDEX_SKIP={".git","__pycache__",".pytest_cache"}
EXTRACT_SKIP={".git","derived","__pycache__",".pytest_cache","PRIOR_ART"}
QUARANTINE={"PRIOR_ART"}

def lexical_supplied(root: Path, raw: str) -> Path:
    root=root.resolve()
    if "\\" in raw:
        raise ValueError("backslash not accepted in explicit repository path")
    p=PurePosixPath(raw)
    parts=p.parts
    # Absolute spelling: root relationship is host-specific; compare using Path.
    if p.is_absolute():
        try:
            rel=Path(raw).relative_to(root)
        except ValueError as e:
            raise ValueError("outside root") from e
        parts=rel.parts
    # Strong lexical quarantine precedes dot-dot collapse.
    if any(x in QUARANTINE for x in parts):
        raise ValueError("quarantined lexical component")
    stack=[]
    for x in parts:
        if x in ("","."): continue
        if x=="..":
            if not stack: raise ValueError("outside root")
            stack.pop()
        else: stack.append(x)
    return Path(*stack)

def index_regular(root: Path, rel: Path) -> bool:
    if any(x in INDEX_SKIP for x in rel.parts): return False
    if rel.as_posix().startswith("derived/text/"): return False
    p=root/rel
    cur=root
    for x in rel.parts:
        cur=cur/x
        if cur.is_symlink(): return False
    return p.is_file()

def extract_regular(root: Path, rel: Path) -> bool:
    if any(x in EXTRACT_SKIP for x in rel.parts): return False
    p=root/rel; cur=root
    for x in rel.parts:
        cur=cur/x
        if cur.is_symlink(): return False
    try:
        resolved=p.resolve(strict=True)
        rrel=resolved.relative_to(root.resolve())
    except (OSError,ValueError): return False
    if any(x in EXTRACT_SKIP for x in rrel.parts): return False
    return resolved.is_file() and resolved.suffix.lower()==".pdf"

class Commit1Acceptance(unittest.TestCase):
    def test_supplied_normalization_and_escape(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            self.assertEqual(lexical_supplied(root,"./a//b/../X.PDF"),Path("a/X.PDF"))
            with self.assertRaises(ValueError): lexical_supplied(root,"../x.pdf")
            with self.assertRaises(ValueError): lexical_supplied(root,"a/../../x.pdf")

    def test_absolute_under_and_outside_root(self):
        with tempfile.TemporaryDirectory() as d, tempfile.TemporaryDirectory() as e:
            root=Path(d).resolve()
            inside=root/"n"/"x.pdf"
            self.assertEqual(lexical_supplied(root,str(inside)),Path("n/x.pdf"))
            with self.assertRaises(ValueError): lexical_supplied(root,str(Path(e)/"x.pdf"))

    def test_prior_art_is_strong_lexical_quarantine(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            for raw in ("PRIOR_ART/x.pdf","PRIOR_ART/../x.pdf","a/PRIOR_ART/../x.pdf"):
                with self.assertRaises(ValueError): lexical_supplied(root,raw)

    def test_derived_is_normal_extraction_exclusion(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            self.assertEqual(lexical_supplied(root,"derived/../x.pdf"),Path("x.pdf"))
            (root/"derived").mkdir(); (root/"derived"/"x.pdf").write_bytes(b"x")
            self.assertFalse(extract_regular(root,Path("derived/x.pdf")))

    def test_structural_universe_preserved(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            paths=("PRIOR_ART/a.pdf","derived/a.bin","HAUL/tools/note.txt","HAUL/indexes/a.pdf")
            for raw in paths:
                p=root/raw; p.parent.mkdir(parents=True,exist_ok=True); p.write_bytes(b"x")
                self.assertTrue(index_regular(root,Path(raw)),raw)

    def test_local_symlink_aliases_rejected(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            real=root/"real"; real.mkdir(); (real/"X.PDF").write_bytes(b"x")
            alias=root/"alias"
            try: alias.symlink_to(real,target_is_directory=True)
            except OSError: self.skipTest("symlink unavailable")
            self.assertFalse(index_regular(root,Path("alias/X.PDF")))
            self.assertFalse(extract_regular(root,Path("alias/X.PDF")))

    def test_pdf_case_and_location(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            (root/"ROOT.PDF").write_bytes(b"x")
            (root/"n").mkdir(); (root/"n"/"Nested.PdF").write_bytes(b"x")
            self.assertTrue(extract_regular(root,Path("ROOT.PDF")))
            self.assertTrue(extract_regular(root,Path("n/Nested.PdF")))

    def test_backslash_rejection_is_cli_only(self):
        with tempfile.TemporaryDirectory() as d:
            root=Path(d).resolve()
            with self.assertRaises(ValueError): lexical_supplied(root,r"PRIOR_ART\x.pdf")
            # POSIX corpus discovery is not told to reinterpret legal filename chars.
            p=root/"ordinary\\name.txt"; p.write_bytes(b"x")
            self.assertTrue(index_regular(root,Path("ordinary\\name.txt")))

    def test_github_tree_semantics_are_blob_only(self):
        # This is intentionally a representation test, not filesystem traversal:
        # GitHub-tree mode admits blobs by item type and never dereferences links.
        payload=[
            {"type":"blob","path":"PRIOR_ART/a.pdf","sha":"a","size":1},
            {"type":"tree","path":"alias","sha":"b"},
        ]
        admitted=[x["path"] for x in payload if x["type"]=="blob"]
        self.assertEqual(admitted,["PRIOR_ART/a.pdf"])

if __name__=="__main__":
    unittest.main(verbosity=2)
