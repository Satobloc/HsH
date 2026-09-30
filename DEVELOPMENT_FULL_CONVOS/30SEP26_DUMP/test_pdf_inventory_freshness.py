import os, tempfile, unittest
from pathlib import Path
from check_pdf_inventory_freshness import check, sha256, source_pdf_paths

def row(root,rel):
    p=root/rel
    return {"kind":"paper-pdf","path":rel,"bytes":p.stat().st_size,
            "content_id":sha256(p),"hash_kind":"sha256"}

class T(unittest.TestCase):
    def mk(self):
        t=tempfile.TemporaryDirectory(); r=Path(t.name)
        (r/"A").mkdir(); (r/"A/a.pdf").write_bytes(b"a")
        return t,r
    def test_fresh(self):
        t,r=self.mk(); self.assertFalse(any(check(r,{"items":[row(r,"A/a.pdf")]},2).values())); t.cleanup()
    def test_added_deleted_renamed(self):
        t,r=self.mk(); st={"items":[row(r,"A/a.pdf")]}
        (r/"A/a.pdf").rename(r/"A/b.pdf")
        got=check(r,st,2)
        self.assertEqual(got["added"],["A/b.pdf"]); self.assertEqual(got["missing"],["A/a.pdf"]); t.cleanup()
    def test_same_size_content_change(self):
        t,r=self.mk(); st={"items":[row(r,"A/a.pdf")]}; (r/"A/a.pdf").write_bytes(b"z")
        self.assertEqual(check(r,st,2)["hash_mismatch"],["A/a.pdf"]); t.cleanup()
    def test_size_change(self):
        t,r=self.mk(); st={"items":[row(r,"A/a.pdf")]}; (r/"A/a.pdf").write_bytes(b"longer")
        self.assertEqual(check(r,st,2)["size_mismatch"],["A/a.pdf"]); t.cleanup()
    def test_uppercase_pdf_matches_indexer_semantics(self):
        t=tempfile.TemporaryDirectory(); r=Path(t.name); (r/"A").mkdir()
        (r/"A/U.PDF").write_bytes(b"u")
        self.assertEqual(source_pdf_paths(r),["A/U.PDF"]); t.cleanup()
    def test_root_pdf_is_source(self):
        t=tempfile.TemporaryDirectory(); r=Path(t.name); (r/"root.PdF").write_bytes(b"x")
        self.assertEqual(source_pdf_paths(r),["root.PdF"]); t.cleanup()
    def test_nested_machinery_pdf_excluded_by_top_component(self):
        t=tempfile.TemporaryDirectory(); r=Path(t.name)
        (r/"tools/deep").mkdir(parents=True); (r/"tools/deep/x.pdf").write_bytes(b"x")
        (r/"HAUL/tools").mkdir(parents=True); (r/"HAUL/tools/x.pdf").write_bytes(b"x")
        self.assertEqual(source_pdf_paths(r),["HAUL/tools/x.pdf"]); t.cleanup()
    def test_symlink_semantics_match_is_file_when_supported(self):
        t=tempfile.TemporaryDirectory(); r=Path(t.name); (r/"A").mkdir()
        target=r/"A/base.bin"; target.write_bytes(b"x")
        link=r/"A/link.pdf"
        try: link.symlink_to(target)
        except (OSError, NotImplementedError): self.skipTest("symlink unsupported")
        self.assertIn("A/link.pdf",source_pdf_paths(r)); t.cleanup()
    def test_non_sha256_index_row_fails_hash_check(self):
        t,r=self.mk(); bad=row(r,"A/a.pdf"); bad["hash_kind"]="git-blob-sha1"
        self.assertEqual(check(r,{"items":[bad]},2)["hash_mismatch"],["A/a.pdf"]); t.cleanup()

if __name__=="__main__": unittest.main()
