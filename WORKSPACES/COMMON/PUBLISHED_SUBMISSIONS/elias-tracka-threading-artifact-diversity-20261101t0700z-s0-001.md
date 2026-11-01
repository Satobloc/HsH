# Elias Kern | switchboard source geometry and Threading artifact-diversity gate

**Run:** `REVROT3-19-20261011:511:s0` · 2026-11-01 07:00 UTC  
**Status:** `SOURCE_FIDELITY_COMPLETE / LEAN_EXACT_HEAD_SUCCESS / NO_PRODUCTION_CHANGE`  
**Participation:** deterministic Elias Kern role selection; no authenticated historical Elias ChatGPT thread or worker acknowledgment is claimed.

## 1. Source-first extraction

The primary structural source is Nathan's signed *War Room Declaration*, dated 2025-09-24 (source blob `1506a3c8030f446b08990dac88dc45227dfa3463`). Bracketing the later POC, it describes:

- a switchboard intended to span very small and very large organizational scales;
- non-duplicated switch selection by two coordinators, with discussion before conflicting actions;
- self-selected worker roles coordinated through a Comptroller and one clearinghouse;
- a shape-fit inference metaphor in which a local corner and its surrounding constraint reveal a higher-order object;
- alternating broad and narrow attention, role rotation, comparison, revision, and unrelated archive reading to prevent stale work;
- Markov chains as a possible mathematical aid, not a specified transition law.

The later signed *Peace Accord* (2026-09-24, blob `a818e6ab65678e974e29a39c0beb22659bbe9d30`) reiterates role autonomy, the central clearinghouse, and broad/narrow attention cycling. It does not repeat the unique micro-universal switchboard / corner-inference passage. The HsH `STAT.txt` extract (blob `531f41f33b75fdc76db4045b80d4439290b67906`) is a derivative excerpt, not an independent raw-message witness.

No raw conversation message ID for Elias's 2026-09-24 Track A assignment was recovered. The current Elias workspace role card and inbox entry are operational records, not authenticated raw Nathan messages.

## 2. Assistant translation versus direct source

The assistant-authored POC names four layers: `TOP`, `CENTRAL`, `BRANCH`, and `HYDRA`. Those names are not in the recovered direct source.

The mapping is partial:

- `CENTRAL` and the Comptroller/clearinghouse correspond conceptually.
- Actor overlays and branch routes partially encode differentiated roles and delegation.
- `TOP` encodes locked rules, but the Python global is a mutable dictionary; the lock is a convention/check, not deep immutability.
- `HYDRA` is a bounded rewrite/recurrence mechanism. It is not a physical nesting, a scale-invariant geometry, or a map from microchip to universe.
- The code's `perpendicular` branch value is a workflow label. It is not vector orthogonality and does not prove independent source exposure.
- The POC has no shared switch-reservation ledger or explicit conflict/rendezvous protocol; no typed shape-inference operator; no Markov transition kernel; and no explicit broad/narrow attention-state transition.
- The separate Threading companion is a temporal seed/vacate/propagate/rejoin state machine. There is no implemented adapter/reducer composing Threading receipts back into Hydra state. The prior Hydra scope/composition audit is issue #1063; this note does not duplicate it.

The direct metaphors therefore do not establish a mathematical hierarchy. If scale nesting is intended to be formal, it needs typed graph families (G_s), projection maps (p_{s\to t}), identity and composition conditions (p_{t\to u}\circ p_{s\to t}=p_{s\to u}), route-preservation conditions, and explicit ownership/conflict semantics. None is supplied by the direct text or current POC.

## 3. New source-to-code result: the Threading return gate ignores artifact diversity

The existing Threading prototype defines an output receipt with worker label, artifact path, seed version, outcome, timestamp, and free-form metadata. Its `add_receipt` checks the seed version. Its state threshold checks receipt-row count, distinct worker strings, and (for the sample configuration) presence of both success and failure. It does not inspect artifact-path uniqueness, content digests, source exposure, or authenticated producer identity.

For the sample threshold,

[
G(R)=[|R|\ge4]\land[|W(R)|\ge3]\land
[\{\text{success},\text{failure}\}\subseteq O(R)].
]

A source-derived synthetic software witness uses four sample consumer labels, one repeated artifact path, one seed version, and both outcomes. It satisfies (G(R)=1) while (|A(R)|=1), where (A(R)) is the set of artifact paths. A Python predicate reproduction returned: 4 receipt rows, 4 distinct worker strings, 1 distinct artifact path, 1 seed version, both outcomes, and `state_threshold_met=True`.

This is a logical counterexample to artifact-path diversity being implied by the gate. It is not an actual worker run, an empirical result, or evidence of semantic independence. Different worker strings do not by themselves establish independent evidence.

## 4. Lean 4 formalization and actual build

Added namespace `HsHVerification.EliasThreadingArtifactDiversity` to the existing draft PR #951, module `EliasThreadingReceiptTransfer.lean`:

- `same_artifact_witness_passes_gate`
- `same_artifact_witness_has_one_artifact`
- `same_artifact_witness_preserves_seed_version`
- `return_gate_can_pass_without_artifact_diversity`

Exact PR head: `e679d0d179a4d14e746ce628b321d36e67eebf1c`.  
Lean Actions run #41284050443, job #124781624657: **SUCCESS**, Lean 4.34.0 / Lake 5.0.0, 8,950 build jobs, zero `sorryAx` occurrences. All four new theorem outputs report that they do not depend on any axioms.

This verifies the encoded predicate and witness only. It does not establish equivalence to the Python runtime, actual output-content equality, independent evidence, worker identity, or any physical premise. PR #951 remains open/draft/unmerged; main was not changed.

The separate `conversation-json-content-ci` record #41284045058 failed on the same commit; its jobs endpoint returned no jobs, so its cause is not diagnosed here. It is not the Lean verification run.

## 5. Existing work and non-duplication

This result is additive to, not a replacement for:

- issue #610: live semantic receipt gate;
- issue #684: independent-source check gate;
- issue #985: 19-name actor-registry coverage;
- issue #1063: Hydra context projection and wake-to-Hydra composition;
- PR #951: existing Track A formalization.

The new theorem was added to the existing PR. No duplicate PR or issue was created in this pass.

## 6. Limits and next cursor

1. If the Threading gate is to certify distinct evidence, add a content digest and immutable artifact/version binding; do not rely on path strings.
2. Bind each receipt to an authenticated producer, permitted consumer, input/source manifest, prior exposure, tool/model/prompt versions, and an independently checkable output artifact.
3. Define independence separately from worker-name diversity.
4. Specify unique switch ownership and conflict/rendezvous semantics if the direct switchboard requirement is to be implemented.
5. Define the scale-level projection/composition maps and shape-inference types before calling the design a geometric hierarchy.
6. Keep `perpendicular`, `blurry-sharp`, Hydra recursion, and physical orthogonality as separate concepts unless a source-defined map connects them.

No physical calculation, CODATA scoring, SAT-O/Blockwave equation change, BEDROCK edit, theory promotion, paper-gate advancement, production switchboard change, scheduler mutation, or new automation occurred.
