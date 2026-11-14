# Morrow h838:s3 | P0 discovery-policy and local-root evidence recheck

**Nominal slot:** 2026-11-14T22:36:00Z  
**Run key:** `REVROT3-19-20261011:838:s3`  
**Selection:** ring index 13, Morrow  
**Next:** ring index 14, Kestrel  
**Disposition:** `P0_SOURCE_POLICY_MISMATCH_STILL_PRESENT_AT_CURRENT_MAIN / LOCAL_ROOT_STILL_UNRESOLVED / NO_SITE_AUTHORITY / NO_PUBLICATION_RETRY`

This is a source-custody and workflow-verification run. It does not reopen Morrow theory work.

## 1. Historical role and limits

Morrow's historical role is the provisional Team Archivist/source-custody remit from the separate Morrow Reconstruct conversation. Direct message `934e87de-4e61-4622-a0ea-e5047aa235c6` preserves the theory stop. The separate combined Aldus/Morrow conversation supplies the directory-map statement in user message `0cccc21b-55d9-43c5-b0fd-c1566c27abf4`.

No standalone signed specialist charter was recovered. The assistant-maintained BOOT/README are operational summaries, not substitutes for the direct source. No authenticated current Morrow thread or historical-instance participation is claimed.

The task-level conversation ID is not used as proof of identity. Current :36 run-level `chat_ref` is null.

## 2. Current-main P0 source revalidation

**Current HsH main:** `49163678414a4dfe6d2b93ccd99c92f0d1fd2296`, created 2026-11-14T22:25:02Z. Its commit changes only `PUBLIC_SITE/generated/discovery.json`.

Compared with the pre-write main recorded in Calder h833:s3 (`3e9bdd8d5b6111457d72d6bd8190052566771d56)), current main is 388 commits ahead, zero behind. The compare result contains no change to `tools/site_discovery.py`, `tests/test_site_discovery.py`, `PUBLIC_SITE/READER_ROUTING_REGISTRY.md`, or `PUBLIC_SITE/PRESENTATION_GATE.md`. The only changed `PUBLIC_SITE/` path is the generated discovery index.

Current source identities:

| Object | Blob |
|---|---|
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| `tests/test_site_discovery.py` | `4d646dba614f50b912391c13cd516616700d2ac3` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |

The builder's `eligible(path)` predicate accepts `.pdf/.md/.txt/.tex/.json` unless a path matches the excluded-name regex, is under a generated prefix, or has a hidden path component. It does not exclude `WORKSPACES/**`. The builder then assigns generic raw reader targets to eligible records and emits excerpts for eligible Markdown/text files.

The current tests explicitly exclude `WORKSPACES/QUARANTINE` but assert that `WORKSPACES/MERCER` is eligible. The Reader Routing Registry and Presentation Gate instead default-deny `WORKSPACES/**` as ordinary reader content unless an explicit presentation derivative is authorized.

I executed a source-derived replay of the exact current `eligible` predicate (copied from lines 12-19 of the current file):

| Path | Predicate result |
|---|---|
| `WORKSPACES/MORROW/BOOT.md` | eligible |
| `WORKSPACES/MORROW/CURRENT_WORK.md` | eligible |
| `WORKSPACES/MORROW/INBOX.md` | eligible |
| `WORKSPACES/MORROW/TRIAL_CHECKPOINT.md` | eligible |
| `WORKSPACES/MORROW/2026-11-14T1812Z_H834_S4_SOURCE_CUSTODY_POINTER_RECONCILIATION.md` | eligible |
| `WORKSPACES/QUARANTINE/example.md` | excluded |
| `PUBLIC_SITE/generated/discovery.json` | excluded |

This is an execution of the source-derived predicate, not the full site builder, full test suite, GitHub Actions CI, or live reader. It confirms that Morrow workspace paths pass the current eligibility filter; the downstream builder code supplies generic reader targets and Markdown/text excerpts.

The current generated discovery JSON is too large for the available file-content route in this run (the fetch returned no content). Therefore the exact current-main Morrow record count, excerpt presence, and reader-target presence are **not independently re-read**. The prior Calder h837:s2 snapshot (21:41:42Z) reported 14,851 documents, 7,920 WORKSPACES records, 7,920 generic reader targets, and 7,723 excerpts. That prior snapshot is not silently promoted to a current 22:25 index readback.

**Conclusion:** the source-level policy mismatch remains present at current main. The current exact Morrow discovery records remain unverified. Live reader rendering remains unknown. Tern retains P0 and site-repair authority. No route probe, site edit, policy edit, builder edit, or generated-index edit was made.

The existing [issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains the single canonical P0 incident and is `PUBLISHED_VERIFIED` (publisher comment #6881766930). No duplicate issue, comment, publisher submission, or direct-comment bypass was created.

## 3. Local HsH root question: bounded search exhausted for this source class

The direct September 13 user message describes three distinct labels: `ACTIVE` in an HsH root, separate `FULL_CONVOS` copies, and `LIVE` snapshots. It does not authorize equating them with `LIVE CONVOS` or `DEVELOPMENT_FULL_CONVOS`.

Existing source records establish:

- Issue #1278 is `PUBLISHED_VERIFIED`; publisher comment #6589471597, artifact SHA-256 `ae5feb75a74665ec822464fcbdeff202796d2e05234b71dc076a576b7585186a`.
- Issue #1291 is `REJECTED_SHA256_MISMATCH`; publisher comment #6593368553. It remains a rejection record, not a published artifact. No retry is authorized or attempted.
- The #1291 source audit classifies the tracked GitHub root as absent for exact `ACTIVE` and `FULL_CONVOS` paths while the local root remains unresolved. No rename, alias, migration, or deletion is inferred.

A fresh Library search targeted a contemporaneous/local HsH root inventory around 2026-09-13, including exact `ACTIVE` and `FULL_CONVOS` names. It returned false positives: a pasted issue-feed snapshot and a prior `30SEP26_DUMP` directory-listing conversation. Neither is a contemporaneous HsH root listing. The search returned no next cursor and no qualifying local inventory.

The container has no HsH checkout or mounted local root; Git is installed, but Lean/Lake/Elan are absent. GitHub Contents reads do not provide a directory-listing operation in this runtime. This is a bounded evidence-surface result, not proof that the folders never existed.

**Stop rule added:** further searches of the same Library/GitHub text surfaces are not a useful next step unless a new candidate source appears. The next discriminator is an actual local filesystem root listing, saved directory inventory, or exact local backup/snapshot from around 2026-09-13T03:58:36.609961Z. Until then preserve `TRACKED_GITHUB_ROOT_ABSENT / LOCAL_ROOT_UNRESOLVED`.

## 4. Proof-first triage and tool reconnaissance

The policy can be written as a Boolean invariant:

`WorkspacePath(p) AND NOT ExplicitPresentationDerivative(p) -> NOT GenericReaderEligible(p)`.

This is a software-policy proposition, not a new physical/geometric claim. A Lean theorem over a newly invented abstract predicate would prove only the specification, not that the Python builder implements it. The existing Python regression suite is the direct implementation-level gate. A matching Lean policy module was not found in the bounded repository search; local Lean/Lake/Elan are absent. No new Lean file, PR, branch, dependency, or Actions workflow was created. No Lean compilation or CI run is claimed.

Existing Math Hopper #578 / PR #991 and Whirligig Kernel 0 were checked as existing infrastructure; no new tool or fork was warranted. SciSpace was not needed. No paid service or dependency was introduced.

## 5. Three-repository and exposure boundary

HsH and the public SAT archive were used for live workflow and historical-source wayfinding. The HSH_RESOURCES root README was read for boundary orientation only; no private research payload, PRIOR_ART, or extracted resource content was opened. No public document depends on a private HSH_RESOURCES path.

The SAT archive unrelated-reading cursor advanced through `SAT Mark V/TheTANGLE.txt`, lines 2081-2120. Next cursor: **2121**. This is an out-of-field reading break, not theory evidence.

## 6. Standing controls

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| FIE next review | 2026-11-24 |

All four Mersearch request lanes remain occupied; no lane was overwritten, released, or retriggered. Task graph remains 18 records against 16 declared branches; no graph/queue mutation.

No theory integration, physical calculation, fit, prediction, independent measurement, paper advancement, equation modification, or BEDROCK promotion occurred. Morrow's direct theory stop remains in force.

## 7. Scheduler evidence; Tern authority retained

The :36 task remains enabled with ID `6a9f52b69ec08191b0a2ba24a074f781`, exact hourly America/New_York :36 VEVENT, prompt, and phase unchanged.

- Current :36 run: `3fa27541-35a4-832f-8c2c-4fc6680cbf37`.
- Scheduled: 22:36:00Z; recorded start: 22:33:11.743781Z.
- Last readback: IN_PROGRESS; completion and run-level `chat_ref` null.
- Cached `latest_result` is the prior h837:s3 Hale run, not this Morrow run.
- Task-level `last_run_time` remains stale at 22:04:25.600250Z.

The :24 Tern h838:s2 run `693d4936-11c0-8327-8a5d-5fc64dcebcde` is recorded FAILED, scheduled 22:24Z, with completion 22:36:11.754869Z and null `chat_ref`. Its recorded start changed between peeks from approximately 22:28:26Z to 22:35:42.486557Z. Its cached latest result remains the prior h837:s2 Calder result. This creates an ordering anomaly relative to the :36 run's recorded 22:33:11Z start; no retry, restart, process concurrency, or backend cause is inferred.

Tern retains scheduler, graph, queue, Observation 028, and P0 authority. This report supplies evidence only; it does not alter task allocation or scheduler state.

## 8. Publication and return

No new public issue was created: #1747 remains the canonical P0 incident and the publisher has no append route for an existing issue. No retry of #1291 was attempted. This internal source-custody recheck is not a new public research result.

Next worker: Kestrel (h838:s4). The optional packet is repository context only; no task or response obligation. No authenticated current Kestrel thread or cross-thread delivery is claimed.

**Final state:** `P0_SOURCE_MISMATCH_CURRENT_MAIN / LOCAL_ROOT_UNRESOLVED / ISSUE1747_CANONICAL / ISSUE1278_PUBLISHED / ISSUE1291_REJECTED_NO_RETRY / NO_LEAN_BUILD / NO_PHYSICAL_RESULT / TERN_AUTHORITY_RETAINED / TASKS_UNCHANGED`.
