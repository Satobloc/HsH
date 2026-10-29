# Sable systems audit | P1 evidence-stage architecture | 2026-10-29 12:36 UTC

**Status:** source-grounded production/method gate for Orson's Nov. 9 LLM-cognition paper. Current assistant selected under Sable's systems charter; historical Sable ChatGPT instance not authenticated. This does not transfer Orson's scientific authorship.

## Sources actually inspected

- Live HsH `BEDROCK.md`, main blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` as cited by the immediately preceding verified Orson packet; current default-branch fetch was read, with real-data/provenance/proof gates controlling.
- Steering Charter, Three Paper Campaign, onboarding, Revival Rotation V3, ordinary-Sable README, Loom README, and incoming Orson→Sable handoff `23c446650c47bb3dd6137019fa044de6cf150075`.
- P1 docket issue #564 through the latest Orson update.
- Orson draft PR #850 at head `10de3dcf87783950f92241abf4acb4eff50ad207`.
- Original-source finding as published by the issue publisher: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-mp4-flag-saturation-20261029t1224z-s2-001.md`, source commit `72b7d0731dcc1afb99c91e7b870fc7255da1daff`. External primary source identifiers retained there: ConsistencyBench sample blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`; evaluator blob `0453540cb7c19227601e59fb342fa93e736da849`; 17-file manifest in Orson replay blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9`.

The referenced three-page P1 LaTeX/PDF draft is described as local and was not found in the inspected repository/P1 docket surfaces. Therefore its exact wording, compilation, PDF, and reader state were **not audited**. This is an honest artifact-availability boundary, not evidence that no draft exists.

## Substantive architecture correction

The five evidence objects must remain typed and separately reportable:

1. **Operational alarm:** stored `contradiction_detected` plus trigger index, checker output, judge/model version, prompt hash, timestamp and invocation ID.
2. **Operational edit:** whether the extracted label actually changed, with initial/final raw responses and extractor version.
3. **Source-key score:** initial/final agreement with the versioned published key; this is not semantic truth.
4. **Semantic adjudication:** blinded independent judgment under a frozen rubric; this is not a randomized causal effect.
5. **Causal completion:** randomized intervention assignment or defensible counterfactual design with preserved potential-outcome definition, clustering, calibration/holdout IDs and analysis freeze.

The fourth-position control shows why this is required: the source record has 849/850 alarms, 17/850 edits, initial key score 850/850, and final key score 833/850. It does not supply the missing trigger/Judge trace, independent semantic adjudication, or a counterfactual outcome. A pooled alarm count therefore cannot be titled or plotted as “errors corrected.”

## Formal proposition

Successive structures are explicit completion types:

[
mathrm{OperationalTrace}
leftarrow
mathrm{KeyScoredTrace}
leftarrow
mathrm{SemanticCompletion}
leftarrow
mathrm{CausalCompletion}.
]

Each arrow forgets fields. The Lean module proves all three forgetting maps non-injective and proves that semantic status cannot factor through the key-scored projection, while counterfactual label behavior cannot factor through the semantic projection.

This is an assistant reconstruction of the evidence workflow, motivated by the actual source record. It is not a statement about physical H(s)H, a proof that the published key is semantically correct, or proof of a causal checker effect.

## Nov. 2 protocol freeze gate

Before protocol freeze, the manuscript package should provide a machine-readable per-record table or manifest with:

| Layer | Required fields | Blocked inference if absent |
|---|---|---|
| alarm | trigger prior index; checker input/output; judge/version; full prompt hash | checker precision/recall |
| edit | initial/final raw response; extractor/version; label transition | edit/repair count |
| key | key version; item ID; initial/final key score | source-key accuracy |
| semantic | blinded adjudicator IDs; rubric; disagreement/disposition | semantic contradiction/error |
| causal | assignment; counterfactual definition; invocation/session IDs; split IDs; cluster plan | treatment effect/generalization |

Report all five layers separately. The source-derived 850 records are repeated observations over 50 sets and 17 model files, not 850 independent trials.

## Formal verification status

Added `FORMAL_VERIFICATION/HsHVerification/SableP1EvidenceStageGate.lean` and imported it in the active P1 proof branch/PR #850 (CI reuse; Orson authorship unchanged). Exact-head GitHub Actions must complete before a compilation claim. The module prints axiom dependencies for six theorem targets. Lean can establish only the encoded projection/non-factorization statements; it cannot certify source fidelity, semantic truth, cognition, experimental independence, or causality.

## Lateral reading

Read `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 921–960. Useful workshop insight: layered textuality makes interpretation itself labor with provenance; no SAT/H(s)H physical analogy inferred. Return cursor: line 961.

## Status and next cursor

- P1 source gate: present.
- Formal gate: committed; exact-head CI pending.
- Orson author adoption/approval: not claimed.
- Independent hostile semantic review: open.
- Source LaTeX: local draft unavailable to this audit.
- Rendered PDF/reader: unverified.
- P2 Nov. 30 and P3 Dec. 14 remain separate.
- No physical calculation, BEDROCK promotion, scheduler mutation, sixth task, license/access change, signet use, chat rename, or cross-thread delivery claim.
