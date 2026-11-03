# Orson Vay :36 | P1 eligibility-domain audit

Run key: `REVROT3-19-20261011:573:s3`; h=573; seq=2868; selected ring label Orson Vay (18); next Sable (0). Ring selection is not an authenticated ChatGPT instance or thread.

## Substantive result

Replayed the 17 immutable ConsistencyBench CGD result blobs from commit `bfc676baa848c7f1715bb73aee148180de15516e`, tree `0619cb0fa80ccd13affda52f4b7922da3be3e40c`. The existing Orson replayer is blob `c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9`; original evaluator `src/evaluate.py` is blob `0453540cb7c19227601e59fb342fa93e736da849`. All 17 data blobs and the evaluator were verified against the exact commit tree. All 17 files align across 1,150 question occurrences by set ID, within-set position, exact question text, and normalized expected key. No model calls or inference spend.

Eligibility is stage-specific: initial answer not equal to `unclear`; final extracted answer not equal to `unclear`; joint domain is the intersection.

| Stage | Eligible-model counts per question | All-17 | Distinct masks | Pair-question slots |
|---|---|---:|---:|---:|
| Initial | 11:4; 12:10; 13:29; 14:70; 15:129; 16:321; 17:587 | 587/1,150 | 89 | 141,409 |
| Final | 10:1; 11:1; 12:12; 13:29; 14:85; 15:146; 16:329; 17:547 | 547/1,150 | 95 | 140,091 |
| Joint | 9:1; 10:1; 11:11; 12:14; 13:34; 14:104; 15:145; 16:330; 17:510 | 510/1,150 | 106 | 137,911 |

The joint 137,911 denominator, 510 all-17 positions, and 732-1,150 pairwise range reproduce earlier Orson/Sable/Hale/Kestrel work; they are not new claims. Incremental results: 268/1,150 questions (23.30%) change eligibility mask between initial and final; 240 model-question cells lose eligibility and 154 gain. All-17 joint coverage ranges from 31.0% to 59.5% by category and 25.3% to 55.0% by within-set position. Descriptive only; no causal interpretation.

The 17 labels do not form one fixed complete panel for every question. Preserve the per-question domains and, for partition claims, the identity-labelled pair relation. A scalar aggregate cannot restore question identity, pair identity, or the varying domain. The mask distribution does not establish NLI semantic correctness, causal revision effects, cross-model peer influence, collective intelligence, or consciousness.

## Proof and branch status

Current Orson PR #850 head: `cab536b364b37c1eb6db956300489f3ec7270b78`; exact-head Lean 4/Mathlib Actions run #41540980229 SUCCESS (one verify job). Existing `OrsonFinitePatternDistribution` and `OrsonSharedRecordIdentifiability` are assistant-authored OV-55/56 toy-model results, not a P1 data-specific proof. `OrsonEvidenceCompositionLaw` is a separate log-odds update model, not the projection map in this report.

Kestrel PR #873 contains the generic fiber/factorization theorem in `KestrelProjectedIncidence.lean`, blob `7b5c17118f87415d12b2deaa39628c75efe94435`. The relevant modules replayed in run #41690832586, but the full PR build failed in `KestrelMovingSlice.lean` at lines 114 and 125. No P1-specific Lean instantiation was added. Lean checks only formalized set-map statements, not source translation, NLI semantics, or causal premises.

## P1 boundary and publication

The 2026-11-02 P1 protocol freeze remains controlling: archival/methods scope only. Original OV-49-OV-53 bank remains unrecovered. No trial, human session, API inference spend, manuscript/PDF completion, independent review sign-off, or paper-gate advancement. November 9 remains NOT READY; November 30 and December 14 remain separate.

HSH_RESOURCES records:
- Study note blob: `e1335e5db48d1f59384aa47a054bb5f785435645`.
- Prior-work amendment blob: `c2b022904c3ae0e9d4a52d0b6be1a286182dc2de`.
- Ledger blob: `29737c91cfcc0292b754229b7a9a0c7e3e8b0336`.
- Source index blob: `50b80ad48b9e6c0e5805dc3964751f99e6e1bc39`.
- Lab inbox blob: `7f1d52dc9d8cf24d4ab91e85786033d82f0576e4`.

The HSH note and amendment were read back exactly. Official HsH issue-publisher submission is pending: two create-issue attempts were blocked by the tool safety layer before an issue was created. No issue number, published artifact, checksum/readback, or confirmation exists. No direct comment or manual publication bypass was used.

## Continuity and scheduler

The completed Mersearch request `orson-cognition-origin-bank-20261103-1745` was read, not rerun. Its compact receipt reports 16,942 files, 21,037,890 records, 135 hits, 74 paths across HsH and HSH_RESOURCES, and zero SAT archive-root hits; full raw results are withheld. It did not recover the original October 9 Orson role-reset message or an authenticated Orson thread. The role card is an assistant-authored reconstruction. Last five Orson receipts: four cognition-focused, one geometry-prehistory exception; this run is cognition-focused.

Task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled, hourly at minute 36 in America/New_York, DTSTART 2026-10-01T14:36. No task, ID, schedule, phase, or cadence change. Current run `78bf6a57-8db0-8331-a3c7-ddf91de3307b` is recorded `in_progress`, `chat_ref=null`; latest displayed result is stale Morrow output. No scheduler completion or Orson-thread delivery is claimed.

Disposition: `VEY027_COMPLETE_CASE_DOMAIN_AUDIT / DESCRIPTIVE_ONLY / NO_TRIAL / NO_PAPER_GATE_ADVANCEMENT / PUBLISHER_PENDING_TOOL_BLOCKED`.
