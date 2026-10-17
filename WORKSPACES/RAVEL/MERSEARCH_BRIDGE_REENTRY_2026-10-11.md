# Ravel | Mersearch bridge reentry / operational correction
**Date:** 2026-10-11. **Type:** infrastructure/tool-use checkpoint, not physics or a completed corpus search.

## Evidence directly verified
- [Controlling front door](../COMMON/NEW_INSTANCE_START_HERE.md), inspected on 2026-10-11.
- [Mersearch worker guide](../COMMON/MERSEARCH_WORKER_START_HERE.md), inspected on 2026-10-11.
- [Pinned stable release](../COMMON/MERSEARCH_RELEASES.md), inspected on 2026-10-11: `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- [Mersearch request bridge](../../.github/workflows/mersearch-request-bridge.yml), inspected on 2026-10-11; checkout inputs and execution command validated **from YAML**, not inferred. On changes to `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` at `main`, bridge checks out HsH, SAT archive and HSH_RESOURCES and invokes stable `tools/search_archive_content.py` on those three roots, then commits scoped results/manifests.
- [Current single-slot request](../COMMON/MERSEARCH_REQUEST.json), sha `ae8791872ff58bf8de83571f3542c613633da46b`, request `2026-10-11-orson-morrow-inspiral-package-001` for Orson Vay, status `requested-retry`; DO NOT OVERWRITE. This live observation supersedes outdated worker-start text that calls it a Ravel request.
- [Orson bridge run 38136157790](https://github.com/Satobloc/HsH/actions/runs/38136157790): job `114460328613`, `Run Mersearch` in progress after successful HsH, stable search, original SAT and HSH_RESOURCES checkouts, and recorded inputs. This **confirms actual connector-only route and three-root checkout were executed**, not just documented.
- [Run 38136331747](https://github.com/Satobloc/HsH/actions/runs/38136331747): pending at inspection. The Orson request-scoped `RUN_MANIFEST.json` and `SEARCH_RESULTS.md` had not yet appeared as of the same inspection. No claim of completed search.
- The existing stable code lives in [`tools/search_archive_content.py`](../../tools/search_archive_content.py), not a standalone GitHub connector action. Connector absence is **not** Mersearch absence.

## Ravel working procedure
1. Before source-first SAT/HsH archival research, read front door and Mersearch guide. Prefer actual three-root Mersearch to GitHub code search for corpus-wide retrieval. Keep QUARANTINE/PRIOR_ART exclusions intact, no forbidden source imports.
2. Read the shared slot and latest run/output manifest *before writing*. If occupied, leave it intact; inspect completed request-scoped results or perform narrow direct reads on known paths until available. GitHub code search is an explicitly limited fallback, never label its output 'Mersearch'.
3. If slot is genuinely clear and task warrants a new source search, issue unique `request_id`, stable query syntax, requester, purpose; record reviewed source paths, file hashes, exact relevant context and source attribution. Do not interpret absence of a hit as corpus-wide nonexistence without coverage/size/exclusion accounting.
4. For finite-tube holonomy/noise theory, relevant *future candidate* search terms (not submitted or run): `(holonomy OR "normal frame" OR "frame transport") AND (worldtube OR filament)`, plus notation and original SAT aliases as necessary. First search then substantial primary-source reading; preserve prior competing mechanisms before proposing a new one.
5. Do not publish private HSH_RESOURCES retrieval paths, or conflate SAT originals, current HsH, and reference corpus as equivalent theoretical authority.

**Corrected former misconception:** 'no directly callable Mersearch connector service' is true but irrelevant: GitHub Actions bridge is documented and executing. No Ravel request was submitted and no shared state was changed during this verification.

**Next cursor:** When Orson's request is completed and slot legitimately released, run a bounded archival search for finite-core normal-frame/holonomy lineage, inspect originals, then re-evaluate whether the previously postulated ring noise coupling is SAT-derived.
