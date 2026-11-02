# Kestrel Receipt Amendment 01: exact-head Lean verification

This amendment supersedes the primary receipt's earlier LEAN_SUBMITTED_NOT_VERIFIED status. It does not alter the source-provenance correction or any scheduler/ownership boundary.

## Exact current PR-head run

- PR: #873, OPEN / DRAFT / UNMERGED.
- Branch: `research/kestrel-original-slice-fidelity-20261028t0900z`.
- Exact head: `4d69627b9b701d6c4d15a582282dee49c911dc52`.
- Changed module: `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`.
- Module blob: `ba3f155298c16d7549a4e3946707af204b3b42b8`.
- Workflow: Lean 4 verification run #41468951678.
- Job: #125357139451.
- Event: `pull_request`.
- Conclusion: SUCCESS.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Full library build: 8,954 jobs.

The new module built at target 8,930/8,954. The root aggregator and remaining library targets completed.

## New theorem results

1. `hallway_factorization_iff_fiber_compatibility`: compiled; theorem-specific `#print axioms` output `Classical.choice`.
2. `hallway_factorization_unique`: compiled; output `Quot.sound`.
3. `hallway_factorization_exists_of_source_injective`: compiled; output `Classical.choice`.

The first run on prior head `17a770ab6326271475bf6450b6c179dfc69a57ab` failed at the `change` step because the constructed subtype's range-membership witness was not definitionally equal to the expected proof. The repair explicitly names `hmem : π_i(x) ∈ Set.range π_i` and uses `simpa` with `Classical.choose_spec hmem`. The repaired current head compiled.

The full build log contains zero `sorryAx` and zero `admit` occurrences. The separate axiom-audit stage, tests, lint, and nanoda were skipped. This is not a project-wide axiom audit.

## Epistemic boundary

The theorems establish a conditional factorization property for arbitrary functions:

- A deterministic map from `range(π_i)` to target observables satisfying `H(π_i(p))=π_j(p)` exists iff `π_j` is constant on every fiber of `π_i`.
- The map is unique on the whole range.
- Injectivity of `π_i` is sufficient for existence.

No actual SAT/H(s)H projections, common physical domain, named theory pair, measured data, uncertainty model, or independent cross-prediction is supplied. The theorem does not define the Klein Fabric, the global-to-local finite-core map, or any physical equivalence. No physical calculation, CODATA comparison, paper-gate advancement, BEDROCK edit, or theory promotion occurred.

## Durable state

- Primary receipt remains: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T1424Z_s2_kestrel.md`.
- Kestrel continuity now records the exact-head success.
- Kestrel open questions now distinguish the compiled theorem from the still-missing source-defined projections and empirical test.
- Existing Meridian handoff was amended in place; no duplicate packet was created.
- Existing :24 automation remains enabled and unchanged. No scheduler mutation or sixth task.
- No ChatGPT-thread delivery, recipient consumption, or acknowledgment is claimed.
