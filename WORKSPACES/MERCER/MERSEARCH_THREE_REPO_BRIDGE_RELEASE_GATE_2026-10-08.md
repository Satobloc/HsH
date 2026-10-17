# Mersearch three-repository release gate: bridge coverage audit (2026-10-08)

Status: DEVELOPMENT REVIEW; not a stable release. Reviewed candidate PR #10 and its `.github/workflows/mersearch-request-bridge.yml`, plus stable `tools/search_archive_content.py` at `mersearch-stable-1.0`. This is a code-path audit, not a claim of a completed full-corpus run.

## Verified
- Candidate bridge checks out three repositories: SAT_THEORY_ARCHIVE_2023-25, HsH, HSH_RESOURCES.
- Stable search CLI declares positional `roots` with `nargs="+"`; the bridge's three-root invocation is syntactically supported.
- Candidate bridge explicitly pins search implementation to `mersearch-stable-1.0`, with a runtime identity hotfix. Thus chronology/version fields in candidate CLI are **not** available in this connector bridge.
- Candidate bridge workflow triggers only on pushes to `main` changing `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`. The development acceptance workflow does not exercise an end-to-end three-repo request publication path. Passing the synthetic acceptance is insufficient for bridge release qualification.
- Candidate run manifest lists three source roots and commits but includes legacy singular `source_repository` and `source_commit` pointing only to the SAT archive; consumers must use the plural source_repositories fields and should not silently misinterpret singular metadata.
- Current manifest's `scope_note` acknowledges exclusions but does not provide actual per-repository discovered/indexed/skipped/failed counts. Three checkouts alone do not establish full three-repo transparency.

## Release-blocking acceptance tasks
1. Exercise the bridge on a nonproduction development trigger or disposable fork/branch with representative three-repo request, and inspect published result manifest; avoid changing stable release or production request queue prematurely.
2. Emit per-repository inventory: files discovered, text extracted, hits, size-excluded, extension-excluded, policy-excluded, parser errors, binary/PDF-only, bytes inspected, and Git revision. Explicitly distinguish zero hits from partial/unreadable corpus.
3. Check big JSON and September 30 conversation dumps by size and alternate extraction routes; do not treat zero-length API responses as empty source files.
4. Validate source links and repo mapping for all three roots, and pagination totals with multi-root fixtures.
5. Test chronology against raw timestamped conversations, NotebookLM capture dates, retrospective compilations, and version-transition language.
6. Confirm PR's heavier CI, runtime/performance limits, and rollback path before promoting a named stable release.

## User acceptance criterion
Every worker can issue one query across all three repositories by default, discover tool capabilities, and receive auditable results **plus a truthful coverage/omissions report**. An absent hit is never reported as evidence of absence unless coverage is sufficient.

Source: PR #10 https://github.com/Satobloc/HsH/pull/10 ; passing synthetic acceptance https://github.com/Satobloc/HsH/actions/runs/37724163240 .
