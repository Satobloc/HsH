# Foye V — Adversarial audit of bibliography PDF freshness gate 5.5

## Verdict: INSTALLABLE-WITH-PATCH

Sable's freshness invariant is correct, but the submitted enumerator had one real false negative on Linux:

`Path.rglob("*.pdf")` is case-sensitive there, while `index_papers.py` enumerates all files and classifies `Path(...).suffix.lower() == ".pdf"`.

Therefore a newly added or modified `UPPERCASE.PDF` could be present in the indexer's source universe but invisible to Sable's freshness verifier. The corrected helper enumerates `rglob("*")`, applies the same skip-component behavior, and lowercases the suffix before source classification.

## Classification attacks

- **Uppercase/mixed-case `.PDF`: PATCH REQUIRED.** Fixed and regression-tested.
- **Root PDFs:** correctly source material under current indexer semantics.
- **Nested machinery:** classification is intentionally top-component based. `tools/deep/x.pdf` is machinery; `HAUL/tools/x.pdf` is source. Corrected tests lock this in.
- **Rename/delete:** exact path-set comparison yields added+missing, as desired.
- **Symlinks:** both the live indexer and corrected verifier use `Path.is_file()` and open the resolved file bytes. The verifier should match, not silently invent a new symlink policy in this patch. A separate repository-hardening decision could reject external symlink targets, but that is outside this freshness contract.
- **Skip components:** corrected helper matches `.git`, `__pycache__`, `.pytest_cache` behavior.

Long-term, source classification should be factored into one import-safe helper used by both `index_papers.py` and the freshness gate. For the minimal install, the corrected helper exactly mirrors the current classifier and the regression suite detects drift-prone cases.

## Performance

An exact freshness gate cannot safely replace byte SHA-256 with Git metadata under the current schema. Git blob SHA-1 and structural SHA-256 are different namespaces; size/mtime cannot detect same-size content changes; and `index-state.json` does not carry a source commit identity that would make a Git-diff shortcut sufficient.

Eight worker threads are reasonable for GitHub-hosted runners: `hashlib` releases the GIL and the workload is I/O-heavy. The gate first rejects path and size changes, then hashes only common same-size paths. The current corpus count (1321 PDFs) is large enough that this costs a full byte read, but still far cheaper and safer than extraction/OCR. Do not add an unsafe Git-assisted fast path merely to avoid the read.

If runtime later proves material, optimize explicitly by adding a committed source-PDF inventory digest or source commit binding; do not infer freshness from the existing whole-repo `tree_id`.

## Race semantics

The corrected verifier closes the identified stale-index window when placed immediately before finalization.

A GitHub Actions checkout is a job-local working tree. Remote `main` advancing does not mutate it. Between freshness verification and finalizer, no current workflow step mutates source PDFs. If `main` advances remotely afterward, the existing final push refusal prevents stale generated bibliography state from being rebased over it.

No cross-workflow lock is required for correctness. Independent extraction/bibliography concurrency can waste a run, but the freshness gate plus push refusal prevents the stale result from landing.

## Installation condition

Install Sable's gate only with this case-insensitive enumeration correction and regression tests. Keep Morrow's separate identity-mode preflight; the two gates test different invariants.

No bibliography regeneration was performed. PRIOR_ART remains aggregate-only.
