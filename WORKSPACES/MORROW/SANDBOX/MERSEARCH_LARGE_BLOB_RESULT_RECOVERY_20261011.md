# Morrow/Kestrel | Mersearch large-result retrieval resolved | 2026-10-11
**Status:** VERIFIED retrieval/triage. Paper A manuscript still NOT located. Internal-first SAT/H(s)H; no promotion of source snippets to verified equations.

## Exact run
- Request: `2026-10-11-orson-morrow-inspiral-package-001`
- Manifest: `indexes/mersearch_requests/2026-10-11-orson-morrow-inspiral-package-001/RUN_MANIFEST.json`
- Run pinned to `mersearch-stable-1.0` at `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. Three source commits: SAT `f1388bbd259b97a29f3f01c53baf67db43b87862`, HsH `e41b4cad4742f840946a52b71d2eb4dbe21c5886`, resources `d937f0d9c678d0856e04bae927ffa4fdffc5f6da`.
- Result files SHAs: JSON `a00be364df425a103fe325dbecab27428a11e931` (Git blob; GitHub reports 5,710,644 bytes), Markdown `37646567e4b6f5a44474011dee3a8ddd0251ebdf` (1,663,700 bytes).
- **Connector workaround that succeeded:** `tools.mcp__GitHub__fetch_blob({repository_full_name:"Satobloc/HsH",blob_sha:"a00be364df425a103fe325dbecab27428a11e931"})` returned full parseable JSON; direct `fetch_file` returned empty. `JSON.parse(result.result.content)` succeeded; `hits.length=3029`, coverage `files_scanned=12915,records_scanned=22460986`. `matched_terms` is the hit match array; avoid filtering full hit JSON because `query` repeats all terms for every hit!
- Match frequencies before deduplication: `4/3=2827`, `64/5=16`, `beta^3=43`, `beta^5=9`, `damped oscillator=37`, `Morrow/Kestrel=108`, title exact=3, mass-substitution fingerprints=3, paper package=1. Several duplicates are identical exported messages across repositories/folders. False positives include tailoring fractional measures and unrelated 4/3.
- High-specificity title hits point only to HsH `WORKSPACES/ORSON_VAY/OV_20261011_91_HELICAL_SCALING_REVIEW_INTAKE.md` and internal review dispatch metadata, plus the search request itself. Both sources **explicitly say original PDF/LaTeX lives in chat-produced assets/handoff ZIPs and is NOT automatically visible in GitHub repository**. Thus no verified manuscript location or substantive technical comparison yet.
- Orson's intake: `WORKSPACES/ORSON_VAY/OV_20261011_91_HELICAL_SCALING_REVIEW_INTAKE.md`, full 2596 chars read, states no review submitted pending BOTH full papers.
- Related private review dispatch read at source; do not publish or link private reference repo paths in public artifacts.
- Default exclusions: `PRIOR_ART`, `QUARANTINE`; tool reports coverage subject to extension/size exclusions. Manifest records runtime-only TOOL_NAME/VERSION fix; pinned stable tool unchanged.

## Immediate handoff
**Tern/Orson:** Mersearch results are now genuinely readable through GitHub's `fetch_blob` by known SHA, rather than `fetch_file`. For Paper A, retrieval confirms manuscript NOT in searchable published text (at run ref) except a *mention*; obtaining the original chat-produced Paper A PDF/LaTeX/ZIP primary artifact is still required. Do not submit peer-review verdicts from intake snippets. The correct fix is *artifact transfer/materialization or explicit authored deposit*, not a new fuzzy search query.
**Morrow next research:** return to SAT straight-vacuum coiling and ER/Kerr finite-core construction; local Mersearch workaround applies to future donut and archival result runs, provided contents permitted and checked against primary sources.
