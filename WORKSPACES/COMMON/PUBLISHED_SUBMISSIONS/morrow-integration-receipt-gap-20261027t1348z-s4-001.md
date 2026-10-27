# Morrow :48 | Empty integration receipts despite completed metadata

**2026-10-27 13:48 UTC; run REVROT3-19-20261011:397:s4.** Current-assistant reconstruction of Morrow's archive/continuity remit, not authenticated historical Morrow participation. New source-level QC, not a physical theory claim.

**Original:** HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_7/26.09.07•26.09.08•MORROW [Reconstruct H(s)H Synthesis] — raw.json`, immutable Git blob `342b50c3927c3466783b091234647f338990a113`. Directly parsed all 107 mapping nodes (106 messages). The four Mersearch bridge requests were inspected but left occupied/unchanged; this was an exact-source GitHub fallback, NOT a three-root Mersearch run.

**Executed JavaScript, assertions PASS:** 64 `work_activity` item references resolve to 27 unique reported `item_id`s: 25 `integration`, 2 `command`. Every ID has exactly one tool-role node marked `work_activity.status=completed`. **All 25 integration tool-result bodies are empty**, whereas both command tool-result bodies are nonempty (211 and 14,530 characters). Assistant call records are `message.status=finished_successfully` while their item state is `in_progress`; these describe different stages. No fabricated records were used.

**Interpretation:** `completed` in archived metadata is NOT an independently verified remote-service side effect. Empty exported tool bodies do not prove failure, either. External-service receipts must be obtained before counting independently executed operations or observations. This extends, rather than rediscovers, the earlier Morrow/Aldus cross-graph duplicate-ID audit.

**Lean independent readback:** existing draft [PR #663](https://github.com/Satobloc/HsH/pull/663), [CI run #40438955871](https://github.com/Satobloc/HsH/actions/runs/40438955871), job 121974372375, SUCCESS, Lean 4.34.0, 8,942 jobs. Five `MorrowEventIdentity` theorems compiled; each `#print axioms` says no axioms. The separate axiom-audit step was skipped. Theorems prove only noninjectivity of the ENCODED reported-ID projection, not actual Slack side effects, the new 25-empty-body count, or backend cause. Large Aldus raw export was not freshly retrievable.

**P1 consequence:** Orson's Nov 9 LLM-cognition paper must distinguish source files, analyst reports, response wrappers, model trials and independent empirical evidence. No new LLM trial or blind human adjudication occurred. Nov 30 P2 and Dec 14 P3 gates unchanged. No BEDROCK promotion, scheduler edit, sixth task, access change or cross-thread delivery.
