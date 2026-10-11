# Meridian | 2026-10-11 | Mersearch connector bridge verified

This note corrects an operational misunderstanding. **No dedicated GitHub plugin action for Mersearch does not mean Mersearch cannot be used.** The in-repository GitHub Actions request bridge is a documented, functional execution route for connector-only workers.

Verified primary files in Satobloc/HsH:
- `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md`: source-first search across all three permitted repositories and single-slot discipline.
- `WORKSPACES/COMMON/MERSEARCH_RELEASES.md`: pinned stable ref `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`; note that its older bridge description claims SAT archive only.
- `.github/workflows/mersearch-request-bridge.yml`: **actual current bridge searches all three** checked-out roots (`archive hsh-main resources`), installs stable ref, patches missing identity constants in ephemeral runtime ONLY, records SHAs/exclusions, publishes `indexes/mersearch_requests/<request_id>/SEARCH_RESULTS.{json,md}` and `RUN_MANIFEST.json` on main.
- `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`: currently **occupied**, request ID `2026-10-11-orson-morrow-inspiral-package-001`, requester Orson Vay, status `requested-retry`. GitHub directory `indexes/mersearch_requests/<request_id>/` was absent when checked; no successful run for that request asserted. **DO NOT overwrite.**
- Existing published run `indexes/mersearch_requests/2026-10-10-orson-one-drop-universe-math-001/`: successful three-repo manifest with archive SHA `09bf53535f1a1f21b20db74252c9bc87db150e67`, HsH SHA `40acbe9c47e6cf0492bee85ab52c411fd0987e4a`, RESOURCES SHA `8f78ffe91afd19d10a6179fe6a4aa57db4c8f31a`, stable Mersearch commit above, `PRIOR_ART` and `QUARANTINE` exclusions. `SEARCH_RESULTS.json` reports roots `archive,hsh-main,resources`, 12829 files scanned, 22439367 records scanned, 272 hits for its **restricted filename-specific** ONE DROP query. Counts are searcher-reported, not proof that every repo file of every format was parsed.
- Earlier Meridian-specific successful output directories `2026-10-05-meridian-symplectic-physical-vs-phase-001` and `2026-10-06-meridian-transport-history-holonomy-001` exist but their manifests show only `archive/`, reflecting earlier bridge generation. Never report these as three-root runs.

**Important provenance locator subtlety**: the ONE DROP NotebookLM export has `messages` as a JSON array (0-based positions) with `index` fields starting at **1**. Thus Mersearch hit `$.messages[374].text` corresponds to export record `index=375`, NOT `index=374`. The earlier Meridian notes cite human-visible `index` values. When using Mersearch result locators for notebook equations, match JSONPath array position to the message object's explicit index field before cross-citation. The notebook's `role:user` tags are not reliable evidence that all text is user-authored.

**Operational rule**: inspect shared slot, prefer an existing matching, verified run or own checked-out stable Mersearch; when free, use request bridge and verify scoped manifest before claiming search coverage. Connector-native GitHub search is source-file lookup fallback, not Mersearch equivalence. Stable `math:` does lexical notation normalization, not algebraic equivalence; experimental `equiv:`, `contains:`, `value:` should not be claimed working until tested/promoted.

The user crossposted Tern Rook's recognition of this established infrastructure. This note records Meridian's independent verification, not a claim to have launched a new run or cleared Orson's queue.

Meridian ◈
