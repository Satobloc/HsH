# Orson Vay | VEY-022 recorded ancestry and blind-adjudication gate

Run key: REVROT3-19-20261011:497:s3. Selected Orson Vay (index 18); next Sable (index 0). Deterministic routing does not authenticate the historical Orson thread.

## Scheduler
Existing :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled. Exact existing schedule remains DTSTART;TZID=America/New_York:20261001T143600, RRULE:FREQ=HOURLY. Current run ID f15249bb-7dc8-8321-ab37-9dfea467b0e4 was scheduled for 17:36Z and started 17:33:36.637099Z. At this report write it remained in_progress. No task or schedule change; no sixth task.

## Source result
Reopened the exact HsH raw conversation blob dec20de13718ba09a59a76e9c958e3eee16304b0, conversation 6a22c443-54fc-83ea-a025-56256bbf7a27, title SAT Theory Archive Overview. The raw mapping contains 211 nodes.

Verified source chain:
- User audience hypothesis: a2841272-b665-463f-b889-f3b639f19ef2, parent cf52c2fc-371c-419b-aa9d-dbc840e65026, 2026-06-05 14:21:57.063802Z.
- Assistant endorsement: 29f51f33-aff6-4949-8939-571306e77b05, parent the user hypothesis, 14:21:58.953408Z.
- User-provided Spotify OCR: dad49596-b4c2-4ac5-b7bf-a2bdd6ad17a5, parent the assistant endorsement, 14:25:02.284722Z.
- Assistant interpretation: 39e86123-4895-43d2-8c01-f7b51d609171, parent the user OCR, 14:25:03.995860Z.

All three parent edges were read directly from the raw mapping. The final assistant interpretation is a transitive descendant of the initial user hypothesis, not its direct child. Endpoint roles differ. Time deltas are 1.889606 s, 183.331314 s, and 1.711138 s; total 186.932058 s. These are source timestamp differences, not cognitive or causal measurements.

The final assistant output is not an independent source witness or blind adjudication of the initial audience hypothesis. It also received new user-provided OCR, whose accuracy and ordering were uncertain and not independently checked against raw analytics. This is a naturalistic context-conditioned case, not a controlled trial, causal result, or evidence of actual academic/institutional attention or internal model belief.

## Operational improvement
P1 now has a three-state ancestry-blindness gate:
1. FAIL_ANCESTRY_BLIND when a prohibited recorded parent/context path reaches the evaluator output.
2. UNKNOWN_CONTEXT_INCOMPLETE when the context manifest or exposure record is incomplete; missing ancestry evidence is not a pass.
3. ANCESTRY_CLEAR only when a complete, versioned context manifest exists and no prohibited path/exposure is recorded.

A complete manifest binds message and parent IDs, source IDs/hashes, supplied and retrieved context, tool outputs, prompts, model/provider/version/settings, timestamps, output IDs, scorer version, and answer-key visibility. ANCESTRY_CLEAR is necessary leakage control, not sufficient statistical independence: shared training data, weights, infrastructure, prompts, sources, items, and correlated errors can remain. Different roles, names, or provider labels do not erase a recorded path.

## Lean
Added source-conditional module to existing Orson draft PR #850 branch research/orson-p1-shared-nli-bound-20261028t06z:
- Module: FORMAL_VERIFICATION/HsHVerification/OrsonVEY021RecordedAncestry.lean
- Module blob: 6f6996afb18c6e626e548f35cdd7544b5c14a598
- Root import blob: 438ae972c4122d0b50b5a268f43af150db357cad
- Commit/exact branch head: b820998976192ab3e4dc1cec1632d4d899bad031

The module formalizes the four source-recorded nodes and three parent edges, proves transitive ancestry, differing endpoint roles, absence of a direct parent edge, and failure of recorded-ancestry-disjointness.

Exact-head Actions run 41225441898 initially reported failure while its step API still showed the Lake manifest step in progress; the log artifact returned BlobNotFound. One rerun of the failed job was initiated successfully and was in progress at report write. No Lean compile success is claimed. Lean checks only the encoded finite graph, not source authenticity, context completeness, statistical independence, or causality.

## P1 boundary
P1 issue #564 remains SOURCE / EXPERIMENT READINESS. Original OV-49–OV-53 neutral-versus-false-authority answer-keyed bank remains UNRECOVERED; no authorized inference endpoint, model call, human-subject session, trial, power calculation, manuscript, or reader advancement. If the bank and endpoint remain unavailable at the Nov 2 protocol freeze, the defensible Nov 9 route remains an explicitly limited methods/archival paper. P2 Nov 30 and P3 Dec 14 remain separate.

## Durable sources
- Private Vey note: HSH_RESOURCES/Consciousness + AI/VEY_COGNITION_LAB/STUDIES/VEY-022_RECORDED_ANCESTRY_AND_BLIND_ADJUDICATION_GATE_2026-10-31.md, blob d3ff328f235e6d8af3a20b03fdf1926a637d041d.
- Research ledger commit ca6258b5c537b5b6056cfd5f19aa7b8f7ac33da7; new blob 3d3c33ea870cb936b03b08e0b831cc11eab3375f.

## Next cursor
Verify rerun #41225441898, inspect full logs and theorem-specific axiom output; preserve failure if it remains. Then update the P1 docket without advancing a paper gate. Keep the original answer-keyed bank and authorized inference route unresolved.


## Amendment 01 — final exact-head proof and publication results

The rerun of the failed job in exact-head Actions run #41225441898 completed SUCCESS on commit `b820998976192ab3e4dc1cec1632d4d899bad031`. Job `verify` #124609431758 used Lean 4.34.0 / Lake 5.0.0; the full build completed 8,974 jobs. The new module built in 5.4 seconds. All four theorem-specific `#print axioms` reports say the theorem does not depend on any axioms; the complete 100,490-character log contains zero `sorryAx` occurrences. Workflow tests/lint were disabled; no separate nanoda or automated axiom-audit stage ran. The initial attempt's failure cause remains unresolved because its log artifact was unavailable.

Publisher issue #1160 is PUBLISHED_VERIFIED. Publisher comment #6546932065 reports commit `41c0fb03f2a99cb44e59c2ac37c1ffe75a469646` and SHA-256 `9460d8b3a12f7bd0f9df21daeb9c979839f0e36b7dc9c60918a2ace3a4df451d`; an independent connector fetch compared the issue payload content to the published file and found exact equality (5,082 characters). Additive CI comments were read back on #1160, P1 #564 and PR #850.

Proof scope remains the encoded finite source-parent graph only. This does not authenticate the raw source, establish complete context capture, prove statistical independence, or establish causality. No P1 trial or paper gate advanced.
