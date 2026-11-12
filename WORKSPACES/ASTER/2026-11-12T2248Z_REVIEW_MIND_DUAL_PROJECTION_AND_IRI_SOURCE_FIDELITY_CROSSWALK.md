# Aster h790:s4 | Review-MIND dual-projection provenance and IRI source-fidelity crosswalk

**Disposition:** SOURCE-GROUNDED REVIVAL COMPLETE; LOOM OPTIONAL HANDOFF CONSUMED; TWO EXISTING CONDITIONAL LEAN PROJECTIONS REPLAYED; IRI SOURCE CHRONOLOGY CORRECTED; HSH_RESOURCES ACCESS BOUNDARY FLAGGED; TERN OBSERVATION 008 AMENDED; NO NEW PUBLIC ISSUE OR PHYSICAL CLAIM.

## 1. Selection and continuity

- h=790; seq=5(790)+4=3954; ring index 3. Selected label: Aster. Successor: Ariadne.
- Run key: `REVROT3-19-20261011:790:s4`.
- Historical Aster source is archived conversation `6ab006ce-...`, *Aster / Nathan Words Excavator*. Direct user-role messages `d15369d1-...` and `01505af7-...` establish the source-fidelity remit. No standalone signed charter was found.
- The current Code Grurple roster keeps Aster's Paper A formal review FROZEN / CROSS-READ OPEN. No formal Paper A review or manuscript change was performed.
- The prior Aster conversation is archived, last active 2026-10-17. The current :48 run has no run-level `chat_ref`; selection does not authenticate an Aster instance or thread.
- Task ID `6aa6c3bc02b48191b8a91a30d2a155e0`; run `6c0f2ada-b648-8320-b9b3-95e00a598eb5`; scheduled 22:48Z, started 22:52:35.578232Z, IN_PROGRESS, completion null, `chat_ref` null. Cached latest result is prior Mercer run `1c05dbfe-9630-8329-a9f1-15dee095aa1e`, not this execution.

## 2. Loom predecessor context

The Aster INBOX pointer `LOOM-H790-S3-SOURCE-PROVENANCE-OPTIONAL-20261112T2236Z` was read from [the repository-only handoff](../COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T2236Z_from_s3_to_s4_aster.md). It was written after the Aster run had started, so it remains POST_START_OPTIONAL_CONTEXT_ONLY. This is a repository-content read, not direct thread delivery or authenticated context injection.

Loom's [issue #1655](https://github.com/Satobloc/HsH/issues/1655) is already PUBLISHED_VERIFIED. No duplicate issue or publisher submission was created.

## 3. Raw conversation graph

Source: *DIMENSIONAL GRAVITY*, conversation ID `252d05c0-22ed-4ea2-a474-7966ab13145a`, raw JSON blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

A parent-chain traversal from the export's `current_node` gives 466 mapping nodes, 465 message nodes, 456 nodes on the selected ancestry (455 messages), and 10 off-ancestry messages (7 assistant, 3 tool). Four off-ancestry assistant leaves have no children; one remains marked in progress.

- Direct user-role message `aaa2fcf4-62d2-4fbd-a5a1-15ec86fc794e` names strong nuclear reactions as an event class, but also says strings are more tightly bound during weak interactions. The interaction-class variable is AMBIGUOUS, not a uniquely defined predictor.
- Later direct user-role message `aaa26d2f-...` is a terminology/taxonomy request listing QCD, strong nuclear, weak nuclear, electromagnetic, and gravitational interactions. It does not explicitly correct the earlier wording or define which class controls the proposed effect.
- User prompt `aaa23277-...` is the common parent of assistant siblings `4089ad6a-7099-4946-8c36-77eb3e6303b7` and `7dfddac2-6100-470c-a8cd-541343116379`. The first is off the selected ancestry, IN_PROGRESS, has zero children, and ends mid-response. The second is on the selected ancestry and completed. They are alternative assistant outputs under one prompt, not independent confirmations.
- User-role message `aaa20385-...` contains an embedded assistant-origin prediction/outline span already documented in [issue #906](https://github.com/Satobloc/HsH/issues/906). Host role does not determine the authorship of every embedded span.
- Earlier direct user-role message `aaa2491d-...` contains the broader prediction and falsification framing. It is distinct from later assistant summaries and branch alternatives.

This is one historical conversation graph, not an independent human-LLM group experiment, replicated model trial, or independent physical observation. No worker identity, model/process isolation, or independent source lineage is inferred from message labels.

## 4. Explicit projections and formal status

Two different lossy projections are present:

1. **Host-role projection** `π_host`: maps a message and its embedded spans to the outer message role. It can erase phrase-level origin.
2. **Selected-path projection** `π_path`: maps a conversation graph to one selected ancestry. It can erase off-path sibling alternatives.

Existing formal work was checked rather than duplicated:

- [Aster PR #905](https://github.com/Satobloc/HsH/pull/905), head `660e29fe4d96acbbd26cd3115019c76e33fe3d3a`, exact-head Actions run #41294383717 SUCCESS. `AsterPastedPredictionOrigin.lean` formalizes conditional host-role/phrase-origin non-injectivity. It does not establish historical authorship or user endorsement beyond the encoded witnesses.
- [Calder PR #707](https://github.com/Satobloc/HsH/pull/707), head `97827e91dada327eb00f4dc28f4f20da46a18563`, exact-head Actions run #40924820531 SUCCESS. `CalderWitnessGraph.lean` formalizes a generic single-successor limitation for distinct sibling branches and a conditional path-status distinction. It does not encode this raw conversation's node identities or prove the source graph's semantic interpretation.

These are separate formal propositions, not independent empirical witnesses. No composition theorem combining both projections has been formalized. A future typed evidence record should preserve conversation ID, message ID, parent ID, outer role, recipient, message status, selected-ancestry membership, embedded-span ID/hash and phrase origin, plus an explicit interaction-class definition status. The composition map and its injectivity conditions remain a proposal, not a Lean result.

The existing Loom provenance-compression script assumes deterministic clones and specified source reliabilities. The two assistant siblings here are distinct alternative completions sharing a prompt, not deterministic clones. No numeric Bayes factor or posterior was calculated.

## 5. IRI source inventory and chronology correction

- The two HsH copies of `KEY CONCEPT - IRI.txt` are byte-identical, blob `ba94d513...`. The curated `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md` is a different blob, `8946d...`.
- The curated B key's first extant commit is `2bac5116afc710f7b0c9c29eb0445669155e21b4`, dated 2026-10-07 02:48:25Z. The flattened IRI text and code bundle were first added later, at 2026-10-07 08:28:50Z, in signed commit `b7de014898ac1c3dcd095b96d03a9c421edba96b`. The earlier B key therefore cannot be shown as derived from the later flat text. Their common source and derivation direction remain unknown.
- That later upload bundle includes `MACHINE1.py`, `sat_calculator.py`, `TAKE2.py`, and the flat IRI text. `MACHINE1.py` embeds a script that writes `sat_model.py` at runtime; no separate `sat_model.py` file is present. It uses scalar `B0=3/(4π)`, an optional `B_override`, and an algebraic `hbar = m0 c ell_f B` relation. Its own header says it is an algebraic calculator, not validation of the underlying theory.
- `sat_calculator.py` is a separate calculator with `B_GEOMETRIC=3/(4π)`, `M0_DEFAULT=1.0073e-27`, and a `J_eff` chain; `TAKE2.py` wraps that separate calculator. The IRI transcript's `MASTER ell_f` output and electron-scale mass are more consistent with `MACHINE1.py` than with the separate calculator's default, but no attachment locator proves which file the phrase "your file" refers to. `MACHINE1.py` is a best-matching candidate, not an authenticated original.
- A raw *Meridian Free Build* export contains a tool result linking to the curated B key, not a direct user-role definition of the IRI mapping. The bounded HsH/SAT archive search did not recover an IRI raw role graph. No direct source currently defines a typed `B(Q, topology)` map.
- `B_IRI(Q, topology)`, scalar `B0=3/(4π)`, braid-history `B(t)`, and assistant-generated `B≈0.2387 rad` remain separate symbol lineages. No substitution or equation correction was made.

**Status:** IRI source graph MISSING; attachment mapping UNRESOLVED; `B(Q, topology)` FORMALIZATION_BLOCKED_DEFINITION. No physical calculation, fit, prediction, or independent measurement was attempted because no identifiable measured system, dataset, units, uncertainties, or prediction-versus-fit separation is available.

## 6. Mersearch, tooling, and access boundary

All four shared Mersearch request lanes remain `requested`, with no request-specific manifest or receipt. No Mersearch run was performed, no lane was overwritten, and no new request was submitted. No local repository checkout, Mersearch executable, or Lean/Lake installation was present. GitHub search was a bounded fallback across the permitted HsH and SAT archive surfaces, not a Mersearch result.

Existing resources were checked: Math Hopper issue #578 / PR #991, Aster PRs #905, #1220, #1444, #811, Calder PR #707, and the existing Whirligig sandbox. The Math Hopper archive script is an extractor, not a validation engine. SciSpace is available but was not needed. No new tool, fork, dependency, subscription, or cost was introduced; fork enumeration was not exposed by the available connector.

**Access boundary:** GitHub repository metadata reports `Satobloc/HSH_RESOURCES` as public (`private=false`), while its README describes it as private/internal reference infrastructure. This is a control mismatch, not proof of intended publication. No visibility change was made. After confirming the mismatch, no further HSH_RESOURCES content was accessed. The unrelated Babbage passage at lines 1821-1860 had been read from that repository before the visibility mismatch was recognized; the next cursor is 1861 and is held pending an owner access-boundary decision or an authorized copy in the SAT archive.

## 7. Cross-lane and campaign QC

- P0: all eight protected Paper A/B source and presentation-control blobs were re-fetched at the 23:00:28Z main snapshot and matched their pinned hashes. The 237-commit diff since the previous P0 checkpoint contains none of those protected paths. Both reader routes remain PRESENTATION_PENDING / NOT_OBSERVED; no route probe or re-entry trigger.
- P1: Orson retains sole ownership. Issue #564 remains OVERDUE / NOT READY. No Orson protocol, manuscript, PR, or test bank was changed.
- P2: HOLD. P3: INCOMPLETE. No paper gate advanced.
- FIE was fully rereviewed 2026-11-10; next review 2026-11-24. No duplicate rereview.
- Unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, lines 1821-1860. Next cursor 1861, held as described above. No physical break is claimed.

## 8. Scheduler readback routed to Tern

[Tern Observation 008 Amendment 07](../TERN/OBSERVATIONS/2026-11-12T2301Z_H790_CURRENT_FOUR_LEASE_READBACK_AND_SLOT_ID_CORRECTION_OBS_008_AMENDMENT_07.md) records the new exact-ID snapshot and corrects a task-ID transcription error in Amendment 06.

- :24 actual task ID is `6abda4c8eda88191bf23a6f2849e9a17`. Amendment 06 printed a different, mistyped ID. The actual task remains enabled with its original :24 VEVENT. Its h789:s2 Kestrel-labeled run `40a9b521-4678-8324-b89b-1986397706a8` completed at 22:56:41.360336Z, and latest_result matches that run. Next nominal occurrence is 23:24Z.
- :36 run `18c25e80-c4fc-8323-bd6c-2831a2926f19` remains IN_PROGRESS; its same-ID start field moved from 22:33:15.654483Z to 23:00:25.825534Z (+27m10.171051s). Its cached result is prior Nadir h788:s3.
- :00 h791:s0 run `50422acf-2060-8333-a962-3186d8944f8f` started 22:57:54.187805Z, before its 23:00Z nominal time, and remains IN_PROGRESS. Its cached result is prior Ravel h790:s0.
- :48 h790:s4 run `6c0f2ada-b648-8320-b9b3-95e00a598eb5` remains IN_PROGRESS with null completion/chat_ref and a prior Mercer result pointer; this was already recorded in Amendment 06.
- :12 remains disabled under its existing ID. All four active leases remain enabled with their original hourly VEVENTs.

These are scheduler-record observations only. No retry, restart, duplicate process, actual concurrency, liveness, worker identity, backend cause, or missed-dispatch conclusion is inferred. Tern retains scheduler/task-graph authority. No task, ID, schedule, phase, prompt, enabled-state, or cadence was changed.

## 9. Durable artifacts

- Report: `WORKSPACES/ASTER/2026-11-12T2248Z_REVIEW_MIND_DUAL_PROJECTION_AND_IRI_SOURCE_FIDELITY_CROSSWALK.md`
- Canonical receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T2248Z_s4_aster.md`
- Tern observation: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T2301Z_H790_CURRENT_FOUR_LEASE_READBACK_AND_SLOT_ID_CORRECTION_OBS_008_AMENDMENT_07.md`
- Successor context: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T2248Z_from_s4_to_s0_ariadne_POST_START_OPTIONAL.md`

No new public issue was created because the source facts are already covered by #906 and #1655; this report adds an internal crosswalk, not an independent empirical result. No new PR, Lean module, public theory promotion, or equation change.
