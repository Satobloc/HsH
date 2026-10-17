# Kestrel V — executable-install closure 6.5

## Fresh live state
Direct GitHub compare at start of turn:
- `main` == `review/rook-iv-bibliography-policy`
- SHA: `296fd66e0ded7b3017748b4d17b2c75be3c134d6`
- ahead 0 / behind 0 / changed files none.

Directly reread exact current README, `indexes/AI_START_HERE.md`,
`tools/index_papers.py`, `tools/extract_papers.py`, `tests/test_tools.py`, and
`.github/workflows/extract-papers.yml`.

## Runtime bridge result
A real local `git clone` was attempted from the container and failed because the
container has no external DNS/network route to github.com.

I then attempted the connector-native alternative: fetch exact live files,
transform all six Commit-1 files in one Code Mode transaction, create Git blobs,
and return their SHAs without moving any ref. OpenAI connector safety blocked
that object-creation transaction before any blobs were created.

Therefore there is still no honest path in this runtime to execute the exact
patched live repository suite before ref movement. No review ref or generated
bibliography state was changed.

## Exact transformed-file plan
Commit 1 consists of exactly six paths:

1. `tools/archive_source_policy.py` — new shared primitives only:
   - index skip components;
   - extraction skip components;
   - exact-component quarantine;
   - symlink-rejecting safe regular-file/containment check;
   - lexical repository-relative normalization rejecting `..` escape before
     dereference.

2. `tools/index_papers.py`
   - import `has_index_skip`, `safe_regular_file`;
   - remove local `SKIP_PARTS`;
   - in `local_entries`, compute repository-relative path first, then reject
     index-skip components or unsafe/symlink files;
   - preserve generated-output and `derived/text/` exclusions exactly;
   - no change to `enrich`, classification, hashes, duplicate grouping, counts,
     or tree-id construction.

3. `tools/extract_papers.py`
   - import shared extraction/quarantine/safety/lexical primitives;
   - preserve extraction's broader exclusion set (`derived`, PRIOR_ART);
   - discovery rejects file symlinks before admission;
   - supplied path order:
     lexical normalization/escape rejection → quarantine → extraction exclusion
     → symlink rejection → safe resolved containment → regular PDF;
   - legacy manifest quarantine filtering uses the shared exact-component
     predicate.

4. `tests/test_tools.py`
   - add `sys`;
   - prepend `ROOT / "tools"` to `sys.path` before file-location module loads.
   This is required because the live tests use `spec_from_file_location`.

5. `tests/test_archive_source_policy.py`
   - six focused tests: distinct index/extraction universes; nested machinery
     names; exact quarantine component; lexical escape; lexical quarantine;
     source symlink rejection.

6. `.github/workflows/extract-papers.yml`
   - retain `**/*.pdf`;
   - add explicit root `*.pdf`;
   - trigger on shared policy and both relevant test files.

## Pre-ref commands in a real checkout
```
python -m unittest discover -s tests -v
python tools/index_papers.py --root . --scanned-at 2000-01-01T00:00:00Z
```

For normalized equivalence, run old and patched indexers against the same
checkout/fixture tree with a fixed `scanned_at`, remove only `scanned_at` from
state comparison, and require equality of ordinary non-symlink membership,
kind, bytes, content identity/hash kind, duplicate groups, counts, and tree_id.

Independent whole-repository backstop from Rook V remains valid for base
`296fd66e...`: recursive Git tree was non-truncated and contained zero
mode-120000 symlinks.

## Atomic Git plan after green tests
Against parent `296fd66e0ded7b3017748b4d17b2c75be3c134d6`:
1. create six UTF-8 blobs for the exact transformed files;
2. create one tree using the parent's tree as `base_tree_sha`, replacing/adding
   only the six paths above with mode `100644`, type `blob`;
3. create one commit with that tree and the parent SHA above;
4. recompare review branch immediately;
5. only if review branch still equals the parent, update
   `review/rook-iv-bibliography-policy` to the new commit with `force=false`;
6. verify compare is exactly one commit ahead and inspect CI/status.
No generated artifacts belong in the tree.

## Hard stop
Commit 2 remains barred. Bibliography regeneration remains barred.
PRIOR_ART remains structurally indexed and unextracted.
