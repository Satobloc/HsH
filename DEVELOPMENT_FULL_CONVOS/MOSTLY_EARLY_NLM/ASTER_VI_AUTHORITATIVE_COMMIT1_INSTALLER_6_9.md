# Aster VI — AUTHORITATIVE Commit-1 installer specification 6.9

**Status:** authoritative reconciliation of Mercer IV → Rook V → Kestrel V →
Blind Auditor VI → Calder V → Foye VI. Earlier packets are historical inputs;
where they conflict with this document, this document controls.

## Fresh base and branch state — 30 Sep 2026

Repository: `Satobloc/HSH_RESOURCES`

- current main: `e2f952c8471d344178136862066450dc3d471400`
- review branch: `review/rook-iv-bibliography-policy`
- review head: `296fd66e0ded7b3017748b4d17b2c75be3c134d6`
- main is one commit ahead of review
- compare changes only four generated `SOURCE_INVENTORY/SABLE/source_inventory_run/*`
  files; none are Commit-1 implementation paths.

Before installation, recompare. Commit 1 MUST parent the then-current main after
verifying any new intervening commits. Do not stack Commit 1 on the stale review
head.

## Scope: exactly six paths

1. `tools/archive_source_policy.py` — NEW
2. `tools/index_papers.py`
3. `tools/extract_papers.py`
4. `tests/test_tools.py`
5. `tests/test_archive_source_policy.py` — NEW
6. `.github/workflows/extract-papers.yml`

No generated index, manifest, bibliography, extraction, or source-inventory
artifact belongs in Commit 1.

## Superseded proposals — DO NOT IMPLEMENT

- **SUPERSEDED:** normalize/collapse `..` before checking PRIOR_ART quarantine.
  Quarantine is checked against the original lexical component stream first.
- **SUPERSEDED:** leaf-only `path.is_symlink()` rejection.
  Local filesystem admission rejects a symlink in ANY component below root.
- **SUPERSEDED:** one shared admission universe for index and extraction.
  Shared primitives do not erase the distinct lane policies.
- **SUPERSEDED:** treating `derived` like strong lexical quarantine.
  PRIOR_ART is strong lexical quarantine for supplied extraction paths;
  `derived` is an ordinary extraction exclusion.
- **SUPERSEDED:** interpreting backslashes globally.
  Backslash refusal is scoped to explicitly supplied CLI repository paths on
  Linux; corpus discovery does not reinterpret legal POSIX filename characters.

## Normative policy

### Repository path layers

Keep three representations distinct:

1. repository-relative syntax: POSIX-style path components;
2. explicit CLI spelling: untrusted lexical input checked BEFORE host resolve;
3. host filesystem path: used only after lexical acceptance.

### Shared local filesystem safety

For a candidate below resolved repository root:

- walk root → candidate component-by-component;
- reject if ANY component is a symlink, including broken links and symlinked
  directories;
- resolve strictly;
- require resolved containment below root;
- require a regular file.

GitHub-tree indexing is separate representation logic: consume Git `blob`
entries as blobs and never dereference symlink targets as host paths.

### Structural index universe

Preserve current structural semantics:

- include source PDFs;
- include non-PDF supporting resources;
- include repository machinery;
- include PRIOR_ART structurally;
- include ordinary `derived/` machinery according to current index behavior;
- exclude generated `indexes/RESOURCE_INDEX.md` and `indexes/index-state.json`;
- exclude `derived/text/`;
- retain existing `.git`, `__pycache__`, `.pytest_cache` exclusions;
- reject local candidates containing any symlink component.

Do not change `enrich`, identifier classification, hash algorithms, duplicate
grouping, counts, or tree-id construction except as mechanically necessary to
route admission through the shared safety helper.

### Extraction universe

Preserve extraction exclusions: `.git`, all `derived`, `__pycache__`,
`.pytest_cache`, and PRIOR_ART.

Discovery:
- prune excluded directory roots before descent;
- accept `.pdf` case-insensitively;
- reject a candidate if any component below root is a symlink;
- require safe contained regular PDF.

Explicit supplied path order is normative:

1. reject backslash spelling on Linux CLI;
2. parse ORIGINAL lexical component stream;
3. if any original component is exactly `PRIOR_ART`, refuse immediately;
4. normalize `.` / repeated separators and collapse `..` only while bounded
   inside root;
5. relative input becomes root-relative; absolute input is allowed only if
   lexically under root;
6. reject any symlink component;
7. resolve strictly;
8. require resolved containment below root;
9. recompute resolved repository-relative components and reject extraction
   exclusions/quarantine;
10. require regular file and suffix `.pdf` case-insensitively.

`derived/../x.pdf` may normalize to `x.pdf`; PRIOR_ART may not be laundered this
way because its original lexical occurrence is already a refusal.

Legacy manifest quarantine filtering remains exact-component PRIOR_ART filtering.

## Test-loader correction

Current `tests/test_tools.py` loads tool modules with
`importlib.util.spec_from_file_location`. Add `import sys`, define
`TOOLS = ROOT / "tools"`, and insert `str(TOOLS)` into `sys.path` before loading
`index_papers.py` / `extract_papers.py`.

The new policy test must use the same tools-path setup before importing the
shared helper.

## Minimum acceptance surface

The new repository test must cover, at minimum:

1. `.` + repeated-separator normalization and bounded `..`;
2. absolute-under-root accepted / absolute-outside-root refused;
3. strong lexical PRIOR_ART quarantine, including `PRIOR_ART/../x.pdf`;
4. `derived` as ordinary extraction exclusion, not lexical poison;
5. structural preservation of PRIOR_ART, ordinary derived machinery,
   nested machinery-like names, and non-PDF resources;
6. local intermediate-directory and leaf/broken symlink refusal;
7. root and nested mixed-case PDFs;
8. backslash refusal scoped to explicit CLI spelling only;
9. GitHub-tree mode as blob representation semantics, not host traversal.

The Foye reference acceptance module executed 9/9 green again during this
reconciliation. It specifies required semantics; it does not substitute for
running the repository tests against the actual transformed files.

## Workflow trigger contract

In `.github/workflows/extract-papers.yml` preserve all existing triggers and add
the missing coverage.

Must include:

- `*.pdf`
- `**/*.pdf`
- `tools/archive_source_policy.py`
- `tools/extract_papers.py`
- `tools/index_papers.py`
- `tools/build_bibliography_intake.py`
- `tests/test_tools.py`
- `tests/test_archive_source_policy.py`
- `requirements-tools.txt`
- `.github/workflows/extract-papers.yml`

Do not remove workflow_dispatch, main-branch scoping, permissions, concurrency,
or existing job steps in Commit 1.

## Pre-ref executable gate

Use a COMPLETE checkout at the verified current-main parent.

1. Preserve a pristine old-code checkout/tree for baseline comparison.
2. Apply only the six-path Commit-1 candidate.
3. Run:
   `python -m unittest discover -s tests -v`
4. Run the acceptance/adversarial policy tests as part of that discovery.
5. Run old and candidate structural indexers against the SAME ordinary
   non-symlink fixture/corpus with fixed `scanned_at`.
6. Normalize comparison by ignoring `scanned_at` ONLY.
7. Require equality of:
   - membership/path set;
   - kind/classification;
   - bytes;
   - content_id and hash_kind where present;
   - duplicate groups;
   - counts and extension/kind/top-level counts;
   - tree_id.
8. Independently retain Rook V's whole-tree backstop: the earlier base had zero
   tracked mode-120000 entries. Recheck current parent tree before release.
9. Inspect candidate Git diff/tree: exactly the six paths above, with NO
   generated bibliography/index/extraction/source-inventory state.

Any failure = do not move the review ref.

## Atomic Git release sequence

After all pre-ref gates are green:

1. fresh-fetch/recompare `main` and review branch;
2. if main advanced, STOP, inspect intervening commits, rebase candidate on the
   new main, and rerun affected gates;
3. if review branch is not still the expected clean/stale review lineage, STOP;
4. create UTF-8 blobs for the six exact transformed files;
5. create one tree using verified current-main tree as base, replacing/adding
   only those six `100644 blob` paths;
6. inspect the resulting tree/diff before commit;
7. create ONE commit whose sole parent is the verified current-main SHA;
8. compare again immediately before ref movement;
9. move `review/rook-iv-bibliography-policy` to that commit once, non-force/CAS
   style; if expected-old-head/current-main assumptions no longer hold, STOP;
10. verify review is exactly one Commit-1 commit ahead of main and no unrelated
    files changed;
11. inspect commit status/workflow runs and report exact Commit-1 SHA + CI state.

Creating orphan Git blobs/tree objects before the ref move is harmless if CAS
fails; do not force-update the branch to rescue a stale release attempt.

## Rollback

If the ref was moved and a post-move verification exposes a release defect, do
not rewrite history by force. Leave the commit inspectable and create a normal
revert/corrective commit or reset the review branch only through the repository's
explicitly approved review-branch policy. Never alter main as part of Commit-1
rollback.

## Barred actions

Commit 1 MUST NOT:

- install identity/freshness Commit 2;
- regenerate or commit bibliography state;
- regenerate or commit structural index state;
- regenerate or commit extraction manifests/text;
- import new PRIOR_ART content;
- alter the historical/theory authority boundary;
- publish substantive Factory Floor material pending Nathan's differentiated
  license approval;
- force-update a stale branch;
- silently widen beyond the six paths.

## Release success condition

Commit 1 is released only when:
- exact current parent is verified;
- complete checkout exists;
- full repository suite is green;
- acceptance/adversarial suite is green;
- normalized structural equivalence is green;
- current-parent Git tree symlink census is recorded;
- candidate tree contains exactly six intended paths and no generated state;
- atomic single commit is created;
- review ref CAS/non-force move succeeds;
- post-move compare and CI/status are reported.

Anything less remains an installer packet, not a landed Commit 1.
