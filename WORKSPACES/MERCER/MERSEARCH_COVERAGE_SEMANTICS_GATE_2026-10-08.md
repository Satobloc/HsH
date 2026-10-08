# Three-repo coverage gate implementation plan — 2026-10-08

## Reviewed code
Candidate `tools/search_archive_content.py` at branch `mersearch-chronology-20261007` already maps checkout aliases `archive`, `hsh-main`, and `resources` to the correct repositories. Its `--coverage` reports **checkout presence**, not file-level parse coverage. The search path uses `permitted(...,scan_stats)`, which counts eligible, oversized, policy-excluded, unsupported-extension, and inaccessible files, and counts `files_without_readable_records`. This is useful but is **not per-repository**.

## Immediate isolated acceptance job
A proposed new branch-only GitHub Actions workflow was prepared but GitHub connector safety checks blocked its creation. Do not claim the job ran.

When permitted, add an isolated `workflow_dispatch` acceptance workflow that:
1. Checks out candidate engine and all three repositories at recorded SHAs.
2. Inventories every file excluding .git, reporting discovered counts and bytes, PDFs, files above 25 MB, policy-excluded candidates, inaccessible paths, with per-repo example paths.
3. Runs `--capabilities`, `--coverage`, and a bounded 3-root search (`--max-bytes 1000000 --limit 5`) to smoke test routing.
4. Uploads JSON inventories and search output as an artifact; no writes to main, no stable promotion.
5. Separately runs uncapped/large-file tests with adequate resource budgeting before promotion.

## Important semantic correction
`--coverage` currently returns `coverage_status=complete` if three repository roots are present. This must be documented as **repository checkout presence**, NOT full searchable-content coverage. An omitted large JSON, unsupported PDF or parser failure can coexist with this status.

## Next code changes
- Introduce `coverage_by_repository` counters in the engine, keyed by resolved repo aliases, not just aggregate `scan_stats`.
- Add file-level parser outcomes (including PDFs without text and JSON parse errors) and explicit bytes examined; currently `iter_records` exceptions are not fully classified.
- Distinguish checkout-level coverage, eligible-file coverage, and successfully parsed content coverage.
- Add acceptance fixtures where all three roots exist but one source is oversized and one is unparseable; assert status is not reported as fully searchable.

Status: identified release-blocking semantic gap; no new workflow or tests executed in this checkpoint.
