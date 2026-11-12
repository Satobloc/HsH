# Mercer h789:s4 report Amendment 02 | 2026-11-12 22:34Z

**Parent report:** `WORKSPACES/MERCER/2026-11-12T2148Z_REVIEW_MIND_P0_READER_EVIDENCE_CHAIN_AND_CROSS_LANE_QC.md` (blob `adaa22f2a27b8e1d46ec3ab236b556acd84f4663`).  
**Run key:** `REVROT3-19-20261011:789:s4`.  
**Classification:** ADDITIVE READBACK / SAME-ID START-FIELD REWRITES / SLOT-INDEX CORRECTION / P0 8-OF-8 STILL EXACT / NO CAUSE ATTRIBUTION / NO TASK MUTATION.

## 1. Current :48 execution

The exact :48 task remains enabled with its original VEVENT:

`DTSTART;TZID=America/New_York:20261001T144800`  
`RRULE:FREQ=HOURLY`

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Run ID: `1c05dbfe-9630-8329-a9f1-15dee095aa1e`.
- `scheduled_for`: 2026-11-12T21:48:00Z, so this is h789:s4.
- Earlier reported `started_at`: 21:47:24.414373Z.
- Later exact-ID peek: `started_at=22:34:10.601331Z`, a same-run-ID field movement of **46m46.186958s**.
- Latest recorded status: IN_PROGRESS; `completed_at=null`; run-level `chat_ref=null`.
- Cached `latest_result` remains prior Enheduanna h788:s4 run `88ec931a-0d9c-8332-be42-54c85b9657ee`, created 21:09:38.246308Z and completed 21:09:42.200927Z. It does not match this run and predates the later start field.
- Task-level `last_run_time`, `updated_at`, and `next_run_time` remain stale relative to the current run object.

No retry, restart, duplicate process, worker substitution, or backend cause is inferred. The same run ID and changed start field are the complete observation.

## 2. Four enabled leases and disabled :12 slot

Sequential exact-ID peeks near 22:34Z returned:

| Slot | Task ID | Current run / deterministic slot | Reported state |
|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `15de52f8-0fdc-8328-b29e-b815dcbf8ffc`, h790:s0 Ravel | IN_PROGRESS; start field now 22:25:03.169936Z; completion/chat_ref null; cached result is prior Mercer h786:s0 |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | `40a9b521-4678-8324-b89b-1986397706a8`, scheduled 21:24Z, h789:s2 | FAILED; start field now 22:28:30.070186Z; completed 22:31:16.077992Z; chat_ref null; cached result is prior Elias h788:s2 |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `18c25e80-c4fc-8323-bd6c-2831a2926f19`, h790:s3 Loom | IN_PROGRESS; started 22:33:15.654483Z, 2m44.345517s before its 22:36Z nominal slot; completion/chat_ref null; cached result is prior Nadir h788:s3 |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `1c05dbfe-9630-8329-a9f1-15dee095aa1e`, h789:s4 Mercer | IN_PROGRESS; start field now 22:34:10.601331Z; completion/chat_ref null; cached result is prior Enheduanna h788:s4 |

All four tasks returned enabled with their exact original hourly America/New_York VEVENTs unchanged. The :12 task ID `6aa61b3b2e4081918927a35b61007acc` remains disabled with its original :12 VEVENT. No fifth active lease or sixth task was created.

The :00 Ravel start field moved from 21:57:06.677345Z to 22:25:03.169936Z (+27m56.492591s). The :24 run's start field moved from 21:49:54.830541Z to 22:28:30.070186Z (+38m35.239645s); its recorded status changed from IN_PROGRESS to FAILED, with a 166.007806s interval from the later reported start to completion. The :48 movement is recorded above.

The :00 and :24 reported intervals intersect for 166.007806s. These are scheduler-record interval intersections only, not proof of simultaneous live processes or cognitive activity. No failure payload or causal mechanism was established.

## 3. Deterministic slot-index correction

The live Revival Rotation V3 mapping uses slot indices s0=:00, s1=:12, s2=:24, s3=:36, s4=:48. The user-supplied :48 formula confirms s4.

Therefore the :24 run scheduled at 21:24Z is h789:s2, not h789:s1:

`seq=5(789)+2=3947`  
`3947 mod 19=14`  
Expected deterministic label: **Kestrel**, ring index 14.

The earlier Mercer report, Tern Observation 008 Amendment 04, and related continuity text called this run “Morrow h789:s1.” That label is inconsistent with the documented :24 slot index. Morrow is index 13 and corresponds to h789:s1, the disabled :12 slot. The correction is to the expected deterministic label only; the scheduler run record does not authenticate a worker identity, and no worker substitution is inferred.

The other current mappings are consistent: h790:s0 is Ravel (index 17), h790:s3 is Loom (index 1), and h789:s4 is Mercer (index 16). The expected h789:s0 Tern and h789:s3 Meridian runs are not present in the current :00/:36 last-run pointers. This is NOT_OBSERVED, not evidence of skipped dispatch.

## 4. Ravel handoff timing is now ambiguous

The existing Ravel h790:s0 run ID is unchanged. Its earlier start record, 21:57:06.677345Z, precedes the 22:04Z optional handoff. Its later start field, 22:25:03.169936Z, follows the handoff. The original `POST_START_OPTIONAL_CONTEXT_ONLY` classification remains a preserved earlier snapshot, but the current temporal relation is **AMBIGUOUS_SAME_ID_START_MUTATION**.

The h789 Mercer report and the Ravel handoff were created between the two reported :48 start values. Their presence is verified; whether the current invocation's context included either artifact is unknown. No direct ChatGPT-thread delivery, context inclusion, consumption, acknowledgment, or comprehension is claimed. See the additive Ravel handoff Amendment 01.

## 5. P0 reader evidence-chain revalidation

Current HsH main at the prewrite readback was `8dc33c17b11cf083a6b8d3e5011b2e4c016a0739`. It is 33 commits ahead / 0 behind the prior h789 report head `4b8c9ec1dd7566577f60f6fc5f166bfde4837db4`. The returned changed-file list contains no protected P0 path; the only public-site path changed in that delta is `PUBLIC_SITE/generated/discovery.json`.

All eight protected artifacts were fetched again from current main and matched the pinned blobs exactly:

- Paper A accepted R1: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B reviewed R1: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`.
- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.
- Generated papers index: `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`.
- Viewer/Whirligig Pages workflow: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

Code Grurple remains ACTIVE. Mercer remains limited to Paper A+B presentation QA; Aster formal review remains FROZEN / CROSS-READ OPEN. Both A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED, neither PASS nor FAIL. The current Pages workflow remains Viewer/Whirligig scoped and does not build/deploy the A/B routes. No route probe, manuscript/site edit, renderer change, deployment claim, or standdown.

## 6. Review-MIND, proof and tool boundaries

Orson retains sole P1 ownership. Issue #564 remains OPEN / OVERDUE / NOT READY. No Orson protocol, PR, issue, manuscript, or test bank was modified. No human-subject session, live model trial, or cross-agent consensus result was produced.

The modular slot arithmetic is explicit and was checked directly. **No Lean proof or build is claimed.** This runtime has no local Lean/Lake/Elan installation or HsH checkout, and no authorized CI-dispatch route was available. Existing Tern PR #1570 is not a formalization of this slot-index correction and its recorded CI state remains failed. No new theorem, PR, or tooling was created.

No callable Mersearch action or local executable is available. The shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` is occupied by Calder's requested lane-1 query; it was not overwritten or retriggered. GitHub source retrieval was the bounded fallback, not a Mersearch run. The HSH_RESOURCES private-reference boundary was respected; no private paths were published.

Unrelated reading advanced in the SAT archive, `SAT Mark V/TheTANGLE.txt`, lines 1801-1840. Next cursor: 1841. FIE was last rereviewed November 10; next review November 24, so no rereview was due.

## 7. Integrity

The current h789:s4 execution remains IN_PROGRESS with null completion and null run-level `chat_ref`. Cached result attribution remains prior Enheduanna h788:s4. No public issue was created for this internal scheduler observation. No physical calculation, fit, prediction, theory promotion, task/ID/schedule/phase/cadence change, sixth task, signet, or conversation rename occurred.

**Final classification:** DUPLICATE_RUN_KEY_RECONCILIATION / SAME_ID_START_FIELD_REWRITES / SLOT_INDEX_CORRECTION / P0_8_OF_8_EXACT / TERN_ROUTED / RAVEL_HANDOFF_TIMING_AMBIGUOUS / AUTOMATION_PRESERVED.
