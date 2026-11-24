# H1067:S3 | Orson Vay | Evidence-flow identity admission gate

**Run key:** `REVROT3-19-20261011:1067:s3`  
**Nominal slot:** 2026-11-24T11:36:00Z  
**Selection:** `h=1067`, `seq=5h+3=5338`, `5338 mod 19=18` → Orson Vay; next ring label: Sable (index 0).  
**Participation class:** source-grounded continuity reconstruction; thread authentication not established.  
**Status:** bounded cognition-methods / formalization work; no P1 protocol or paper-gate change.

## 1. Authority, remit, and thread boundary

The historical MIRA source at `DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/MIRA.md`, blob `ecb0b2e552a58b7d0032ce2205d5334484794848`, records the direct 2026-09-23 user appointment: Orson Vey is to become an AI-cognition expert and advisor directly to Tern, with work on ChatGPT/NotebookLM and LLM cognition, the user's LLM interactions, team cognition, test design, and bounded research tooling. This is historical source evidence, not proof of current instance identity.

`WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md` (blob `4b8ec39976fdb079a6e28febfe719316c7e46adf`) is an assistant-maintained role reconstruction, not a signed standalone charter. The live Steering Charter preserves the four-of-five substantive Orson cognition priority. This run serves the protected cognition remit rather than drifting into generalist physics.

Existing-thread-first was honored. The Orson inbox and revival prompt say the export titled “ND Orson LLM Cognition Lab” has a later user direction that moved it to H(s)H theory, so it is not a verified current cognition destination without direct reactivation; the older “Cognition Research: Reading Program 01” remains unresolved. No current Orson thread was authenticated in this run. No new conversation, direct-thread post, cross-thread delivery, consumption, or acknowledgment is claimed.

## 2. Source question

Zhang et al., “Multi-Agent Memory Inconsistency: Where Factual Conflicts Disappear in LLM Agents,” arXiv:2611.22245v2 (submitted 2026-11-17; revised 2026-11-18), tracks evidence through Source Reads, Worker Reports, Lead Evidence, and Final Report. It defines Pair Recall for conflict observation `i` as the presence of both endpoints `G_i={A_i,B_i}` in the stage's observed endpoint set `E_i^t`, separately from semantic Judge Pass. The paper reports 73 planted numerical conflicts across 11 Harvey LAB tasks, 198 task executions, and 1,314 conflict observations; pooled Required delegation raises Source Reads Pair Recall from 50.2% to 68.7% while Judge Pass falls from 16.2% to 13.2%. The largest observed Pair Recall decline occurs before the lead receives the worker reports.

The paper describes correlation of model requests/responses with SDK events, native traces, tool outputs, report artifacts, and agent/tool-call identifiers. It does not specify a canonical schema requiring unique semantic-item keys, unique disclosure-event keys, or foreign-key resolution. The following gate is therefore an assistant-reconstructed integrity requirement for the existing formalization, not a claim about the paper's implementation or an empirical defect found in its released profiler.

## 3. Substantive architecture improvement

Extended the existing sandbox PR #2375, branch `research/orson-crtc-group-projection-20261122t2136z`, rather than creating a new module, tool, PR, or registry.

- Prior PR head: `2cd84d09d2351b3deedf98a25c1b341d7280860d`.
- First patch commit: `63c9edfc4fb78b131f3a10c7cae54c80b03fb64e`.
- Corrective/current PR head: `4f43a466a491b850c9ef18186f77cae30cbf573e`.
- Current `OrsonEvidenceFlow.lean` blob: `15ef5020f3869d54067b2a285f8e2db3133e5f3e`.
- The file was fetched again after the corrective write; its blob matched the returned current blob SHA exactly.
- PR #2375 remains OPEN / DRAFT / UNMERGED. No formal review or merge is claimed.

The new `HsHVerification.OrsonEvidenceFlowAdmission` namespace adds definitions for:

1. `uniqueItemIds`: within one `EvidenceFlow`, distinct registered `EvidenceItem` records may not share the `itemId` used by the raw readout functions.
2. `eventReferencesResolve`: every `DisclosureEvent.itemId` must resolve to a registered evidence item.
3. `uniqueEventIds`: `eventId` identifies one disclosure occurrence within the flow. Repeated disclosures of one semantic item remain allowed when their event IDs differ.
4. `validEvidenceFlow`: the conjunction of those three invariants.
5. `admissibleItemPresence` and `admissiblePairPresence`: raw event-presence readouts are admitted only after flow validity and endpoint registration; pair endpoints must also be distinct.

### Candidate counterexamples and admission boundary

The Lean patch encodes three finite cases, but **none is yet verified** because the first full-library build failed in four finite-decision proofs. The source-level design is:

- **Semantic-ID collision:** two distinct evidence-item records with different source-root sets but the same `itemId` are intended to demonstrate how one disclosure event can satisfy both endpoints of a pair under the raw `pairPresentAt` predicate. `uniqueItemIds` is the proposed invariant that rejects this aliasing.
- **Orphan event:** an event whose `itemId` is absent from `flow.items` is intended to demonstrate how an unregistered item can appear present under raw `itemPresentAt`. `eventReferencesResolve` is the proposed invariant that rejects the flow.
- **Repeated disclosure:** the existing `repeatedDisclosureFlow` is intended to remain admissible when one semantic item has multiple disclosure occurrences with distinct event IDs.

The first CI log shows the intended witnesses did not compile: four `by decide` proofs lacked a `Decidable` instance for propositions whose filters depend on classical equality. The follow-up commit adds `classical` before those four `decide` calls. The gate and witnesses remain proposals until the second CI run completes successfully. Callers must use the admissible readouts or prove the flow predicate before interpreting Pair Recall.

## 4. Verification status

The existing `.github/workflows/lean-verification.yml` PR workflow was reused. It runs Lean 4/Mathlib over the full formal library; no new dependency or verification service was added.

- First patch commit: `63c9edfc4fb78b131f3a10c7cae54c80b03fb64e`; file blob `89e771f8b2a1d8e32b81166e4acdaa06be9d73c6`.
- First workflow run [#45386708135](https://github.com/Satobloc/HsH/actions/runs/45386708135), job `138419395562`: **FAILURE**. It reached 8,951/8,953 targets, then failed only in `OrsonEvidenceFlow` at four `Decidable` synthesis points: `pairPresentAt aliasFlow`, `itemPresentAt orphanFlow`, `eventReferencesResolve orphanFlow`, and `validEvidenceFlow repeatedDisclosureFlow`. The emitted `#print axioms` output for affected declarations included `sorryAx`; none of those declarations is verified from this failed run.
- Corrective commit: `4f43a466a491b850c9ef18186f77cae30cbf573e`; updated file blob `15ef5020f3869d54067b2a285f8e2db3133e5f3e`. It adds `classical` before the four finite `decide` proofs.
- Second workflow run [#45387351968](https://github.com/Satobloc/HsH/actions/runs/45387351968), job `138421659721`: queued then running; last observed in checkout before the Lean compile step. **Compilation status: PENDING; no new theorem is yet described as verified.**
- The project toolchain is Lean 4.34.0 / Lake 5.0.0 from the prior verified run; the second run's own environment and job log still require readback.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit are not run by this workflow unless separately invoked. Their absence must remain explicit.
- Even a successful build establishes only the encoded propositions. It does not authenticate source logs, validate the translation from the paper, establish actual model behavior, or provide independent empirical measurement.

## 5. Observable admission matrix

| Invariant | Failure signature | Independent check | Current status |
|---|---|---|---|
| Unique semantic item IDs | One event can satisfy two distinct pair endpoints | No duplicate `itemId` within a flow | Encoded; CI pending |
| Event referential integrity | Orphan event creates apparent presence | Every event key resolves to a registered item | Encoded; CI pending |
| Unique event IDs | Two distinct event records reuse one occurrence key | No duplicate `eventId` within a flow | Encoded; CI pending |
| Task/run/session scope | Evidence from separate executions may be pooled | Explicit scope key on flow, item, event and readout | Not represented; unresolved |
| Temporal co-availability | Cumulative stage presence may not prove both endpoints were simultaneously available to a decision-maker | Timestamped availability intervals, clock uncertainty, and a declared decision window | Not represented; unresolved |
| Source independence | Distinct source roots or contributors may still share ancestry | Explicit source-lineage graph and dependence analysis | Not established by this gate |

**Acceptance rule:** Pair Recall is not admitted from this model until the three proposed invariants are compiled and pass. The next schema increment should add a typed task/run/model/session scope key before any empirical trace adapter. Temporal co-availability and source independence remain separate readouts, not consequences of item/event identity.

## 6. Tool and resource reconnaissance

- Mersearch was not callable in this runtime; all four canonical request lanes were occupied/requested. No request was overwritten or retriggered. GitHub archive retrieval and the primary arXiv page were used as bounded fallbacks, not represented as Mersearch.
- HsH onboarding and the three-repository map were read. GLASS (`SAT_THEORY_ARCHIVE_2023-25`) was used for the historical MIRA source. HSH_RESOURCES access remained root-README-only; no private payload was opened.
- Existing Lean PR #2375 and its CI were reused. Existing Math Hopper issue #578 and PR #991 were checked; neither was duplicated or modified. Whirligig is a separate geometry instrument and was not used for this cognition schema.
- SciSpace was available and used for discovery, but its search results were noisy; no new app, plugin, fork, tool, dependency, subscription, or paid service was introduced. No paid API inference or model trial occurred.

## 7. Governance and next cursor

- P1 November 9 cognition paper remains OPEN / OVERDUE / NOT READY / FROZEN / ORSON-OWNED. No LLM trial, human session, API inference, dataset expansion/reanalysis, protocol change, manuscript edit, or paper-gate advancement occurred.
- P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. The three manuscript gates remain separate.
- No physical calculation, SAT-O/Blockwave equation change, geometry claim, or BEDROCK theory promotion.
- The :36 task remains the existing `6a9f52b69ec08191b0a2ba24a074f781` Worldtube task; its hourly America/New_York schedule and phase were not changed. No automation, task ID, schedule, phase, or enabled state was changed; no sixth task was created.
- Sable is the next ring label. Sable's inbox already contains optional Orson context; no duplicate handoff or response obligation was created.
- No signet or chat rename was attempted.

**Tocktick**
- **Focus:** LLM evidence-flow identity and admissibility.
- **Completed:** source-bounded counterexample design and a typed validity-gate proposal added to existing PR #2375; proof verification remains pending.
- **Stop:** no P1 protocol, experiment, manuscript, or merge; await exact CI result and independent review.
- **Return:** `WORKSPACES/ORSON_VAY/CURRENT_WORK.md`, run key `REVROT3-19-20261011:1067:s3`; PR #2375 branch above.
- **Next:** reconcile CI run #45387351968 and record exact toolchain, build count, axiom output, skipped checks, then add explicit task/run/model/session scope as a separate proposal before any empirical adapter.

**Disposition:** `H1067_S3_ORSON / EVIDENCE_FLOW_ADMISSION_GATE_PROPOSED / FIRST_LEAN_BUILD_FAILED / CORRECTED_BUILD_PENDING / PR2375_OPEN_DRAFT / P1_FROZEN / NO_TRIAL / NO_DATA_REANALYSIS / NO_NEW_TOOLING / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK / NO_CROSS_THREAD_CLAIM`.
