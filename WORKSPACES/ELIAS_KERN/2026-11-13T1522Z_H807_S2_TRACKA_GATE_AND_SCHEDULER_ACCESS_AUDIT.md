# Elias Kern h807:s2 | Track A gate and scheduler-access audit

**Status:** TRACK A GATE RECHECK / EXISTING MERGE-REF CI REPLAY VERIFIED / TRACK B PENDING / TASK-LIST ENABLED BUT EXACT-ID PEEK INACCESSIBLE / NO POC OR PR CHANGE / NO NEW LEAN BUILD / NO PUBLICATION.

## 1. Rotation and participation class

- Nominal UTC hour: h=807, measured from 2026-10-11T00:00Z.
- Slot: s2 (:24).
- seq = 5(807)+2 = 4037; 4037 mod 19 = 9.
- Selected ring label: Elias Kern, index 9.
- Next ring label: Nadir Voss, index 10; next run key `REVROT3-19-20261011:807:s3`.
- Deterministic selection is not an authenticated Elias instance or conversation.

Participation class: CURRENT-ASSISTANT / SOURCE-GROUNDED RECONSTRUCTION. No authenticated historical Elias thread was found through the existing-thread-first check. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

## 2. Preflight sources and authority

Read the complete live BEDROCK.md in three ranges (1-230, 231-460, 461-667), blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`. Also read:

- Steering Charter 2026-10-26, blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign, blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding, blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05).
- Revival Rotation V3, blob `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`; thread-first rule, blob `e79707587914edb76afca1c32f9f4dad4d0324b7`; navigation preflight and autonomy/handoff controls.
- Scheduler Authority, blob `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45); freshness/break cadence, blob `31862461418360cbf5938609992a42dbf51707fc).
- Current task graph, blob `05283edaa44e2163406c8b005a7fbbca95d76c7f`, updated 2026-11-12T13:39:32.918Z; current HsH main at intake `cf511ca72a49357857f906d3fa42433817be371f).
- Elias README, CURRENT_WORK, INBOX, latest report and latest receipt; prior h806 Alberr receipt `ece20be610d878982f6d4330a0369459257978cf`.
- HsH README `90d9a14171339ef0b149678d379cb6f8067b44cb`; SAT archive README `8cc300ba25a98dda803f6a0005bee9d97c3814ef`; HSH_RESOURCES README `1433b65480a04b1bd4ed64e4b234c3ecf1b576f0`.

The three-repository front doors were read. HSH_RESOURCES metadata reports public visibility (`private=false`) while its README states a private/internal reference boundary. Only its root README and repository metadata were inspected; no HSH_RESOURCES payload was opened.

## 3. Elias historical remit and current gate

The only located direct Nathan-to-Elias instruction is the 2026-09-24 13:47 ET message preserved in Elias INBOX (file blob `c5e3f39eeff3f972b6ffadff9843c7dad2b8b0d0`) and Tern's inbox. It assigns Track A to Nathan + Elias + Orson Vey, independently but in communication with Sable + Tern's Track B. Each leased pass is to exercise one bounded real-work mechanism, preserve a durable receipt/failure packet, document observed behavior rather than intended behavior, and keep the POC non-production.

The workspace README is an assistant-maintained synthesis, not a signed specialist charter. The originating conversation ID/message UUID and raw conversation export remain unrecovered. Personal-context lookup did not establish a currently usable authenticated Elias conversation. No identity or delivery claim is inferred from the ring label or the automation's configured conversation pointer.

Sable's optional `ELIAS-2224-20261104-TRACKB-OPTIONAL-001` EvidenceLedger/subject-scope disposition remains pending in Sable INBOX (current blob `b4adc40fe1028aaa2606c312e1470d09269bd815`, lines 420-427). The 2026-10-30 sticky-lifecycle response is separate and does not dispose the four-axis EvidenceLedger request.

PR #951 remains OPEN / DRAFT / UNMERGED:
- Branch: `research/elias-tracka-publisher-status-20261028t23z`.
- PR head: `f9fa0aad45408ab06e5430c834530854746235f0`.
- Base: `infra/lean4-verification`, base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Last PR update: 2026-11-09T16:44:57Z; 77 commits, 19 changed files.
- Formal review submissions: 0; inline review comments: 0. General PR conversation comments exist, but no independent Track B disposition was found.

No POC, PR, adapter, or production change is authorized before Sable's independent disposition. No Track A work was reassigned to Nadir.

## 4. Proof-first audit of the existing route contract

Read the current PR-branch module `FORMAL_VERIFICATION/HsHVerification/EliasRouteBudgetCoverage.lean`, blob `fd361b30a4b205a992755a4fbd7b5b461e49636c`.

The module uses `Finset Route` for `required`, `selected`, `deferred`, and `unrepresented`. Its conditional theorem `required_route_has_exactly_one_disposition` follows from coverage and pairwise disjointness. The module itself says it is an abstract allocation contract, not a formal translation of the private Python prototype and not evidence that any source was actually read.

A fresh read of the existing Actions run #42658236405 / job #129302583788 confirmed SUCCESS, 8,961 build jobs, and replay of `EliasRouteBudgetCoverage` at 8,955/8,961. The log shows checkout of merge ref `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`; the run's PR head field is `f9fa0aad45408ab06e5430c834530854746235f0`. The theorem-specific `#print axioms` output for `required_route_has_exactly_one_disposition` lists `propext`, `Classical.choice`, and `Quot.sound`.

Classification: MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_STANDALONE_UNVERIFIED. Tests, lint, nanoda, and the separate global axiom audit were not run in this job. The existing theorem proves only the formalized Finset allocation statement. It does not encode ordered candidate generation, source-order prefix selection (`take budget`), or a read-evidence witness.

Local `lean`, `lake`, and `elan` are absent; no local checkout exists. No new Lean build or theorem was attempted. No uncompiled code is presented as proof. The prior bounded 15-permutation witness was not repeated.

The next formal target, after Track B disposition, is a source-faithful ordered candidate list with an explicit budgeted prefix/deferred suffix and a distinct read-witness record. The source-to-Lean projection and conditions must be stated before proving correspondence.

## 5. Scheduler list-versus-peek discrepancy routed to Tern

The current Automations task-list view positively returned the existing task:

- ID `6abda4c8eda88191b8a91a30d2a155e0`, title `Workshop Relay :24 | Geometry`.
- `is_enabled=true`.
- Exact stored VEVENT:
  ```text
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T142400
  RRULE:FREQ=HOURLY
  END:VEVENT
  ```
- The list-level summary showed a last-run timestamp of 2026-11-13T14:38:32.423692Z. It returned no current run ID, run status, completion timestamp, or run-level `chat_ref`. Its configured conversation pointer is not treated as proof of a current Elias thread or delivery.

A separate exact-ID `peek` in the same runtime returned `NOT_FOUND / NOT_ACCESSIBLE` with “This task is no longer available.” Thus list-level existence/enabled state and exact-ID peek disagree. This is a tool/read-path discrepancy only. It does not establish deletion, disablement, cancellation, replacement, schedule change, or cause. Current run identity/status remains UNKNOWN.

Observation 016 was recorded for Tern. No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership was changed. No sixth task was created.

## 6. Mersearch and three-repository boundary

The canonical four bridge lanes are:
1. Lane 1: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, request `calder-angle-geometry-source-fidelity-20261102-1337`, status `requested`.
2. Lane 2: `MERSEARCH_REQUEST_LANE_2.json`, request `archive-harvest-20261025-optics-01`, status `requested`.
3. Lane 3: `MERSEARCH_REQUEST_LANE_3.json`, request `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`, status `requested`.
4. Lane 4: `MERSEARCH_REQUEST_LANE_4.json`, request `kestrel-finite-core-geometry-source-fidelity-20261102-2200`, status `requested`.

The separate `MERSEARCH_REQUEST_LANE_1.json` is not the canonical lane-1 file according to MERSEARCH_WORKER_START_HERE; it is a legacy/extra request file with no lane or status field. It is not counted as a fifth lane. The four current request IDs have no corresponding request-scoped folders in the current `indexes/mersearch_requests` directory listing. No callable Mersearch action or authorized local three-root checkout was available; GitHub fetch/search is navigation fallback, not a Mersearch execution. No lane was overwritten, reset, or retriggered.

## 7. Campaign, freshness, and successor

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 measured-system geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE last full rereview: November 10; next due November 24. No FIE rereview was due or claimed.
- Unrelated reading: SAT archive `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 621-660. Next cursor: 661. This is a memoir/conversation fragment, not independent historical evidence. No physical break is claimed.

Next ring label is Nadir Voss, but no Track A handoff or assignment was made because Nadir's separate finite-core/geometry remit is protected. No direct thread delivery, consumption, or acknowledgment is claimed.

## 8. Final disposition

No physical dataset, calibration, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, paper-gate advancement, public issue, publisher submission, new PR, branch, tool, dependency, subscription, or expenditure.

**Final status:** `ELIAS_H807_S2 / TRACKA_GATE_RECHECK / MERGE_REF_CI_REPLAY_VERIFIED_WITH_LIMITS / TRACKB_PENDING / TASK_LIST_ENABLED_EXACT_ID_PEEK_INACCESSIBLE / NO_POC_OR_PR_CHANGE / NO_NEW_LEAN_BUILD / NO_PUBLICATION / NO_NADIR_TRACKA_HANDOFF / AUTOMATION_PRESERVED`.
