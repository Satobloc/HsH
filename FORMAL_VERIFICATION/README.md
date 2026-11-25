# HsH Lean 4 verification

This isolated Lake project compiles on pull requests, main pushes, and manual dispatch through `.github/workflows/lean-verification.yml`. Existing publication workflows are unchanged.

## Local reproduction

```bash
cd FORMAL_VERIFICATION
lake update
lake exe cache get
lake build
```

The toolchain and Mathlib release are both pinned to v4.34.0. Commit `lake-manifest.json` after the first successful dependency resolution to lock transitive dependencies as well.

## Verification meanings

- `LEAN_UNTESTED`: source exists but no successful CI compilation recorded.
- `LEAN_FAILED`: compilation failed; inspect Actions diagnostics.
- `LEAN_VERIFIED`: exact checked source compiled successfully with the recorded toolchain, manifest and commit.

Compilation does not verify physical assumptions, interpretation, dimensional conventions, or empirical predictions. Never label a theorem verified merely because the file was submitted. Avoid `sorry` and custom axioms in proof submissions; future enforcement should audit these explicitly.

The starter theorem is only a CI smoke test. Add separate imports to `HsHVerification.lean` when adding formal modules.

## Mandatory semantic-overlap and source-map preflight

Before adding a theorem, module, or proof PR, complete this bounded preflight against the current repository and open formalization branches:

1. **Search by meaning, not only by theorem name.** Inspect existing formal modules, open PR diffs, and their theorem declarations for the same map property, fiber condition, composition rule, or identifiability result. Search all relevant namespaces and prior PR branches. Record the exact module path/blob and the strongest available build receipt.
2. **Classify the proposed work.** Mark it as `EXACT_DUPLICATE`, `SPECIALIZATION_OR_REFINEMENT`, or `NEW_RESULT`. For a duplicate, reuse/import the existing theorem and close the duplicate draft without merging. A renamed theorem or different variable names do not make a new result.
3. **Type every source operation before formalizing it.** Keep structural coarse-graining, support intersection, projection, transport/re-identification, comparison maps, and instrument/readout as distinct operations. A symbol such as `P` must retain its source-defined meaning and namespace; equal dimensions do not identify the underlying objects.
4. **Write the composition contract.** State each domain and codomain, the exact order of composition, any transport of ambient structure/timesheet, admissible domain, and the common comparison codomain or comparison maps required to compare two routes. Do not call two routes equivalent merely because they share a codomain or produce equal dimensions.
5. **Separate generic theorem from physical instantiation.** A generic factorization, commutation, or identifiability theorem does not supply a physical projection, coarse-graining, constitutive law, or detector map. If source-authorized maps are absent, keep the result conditional and list the missing maps; do not assign physical meaning to arbitrary functions.
6. **Audit source authority and CI recency.** Prefer Mersearch-recovered originals. If only a BEDROCK register or assistant-prepared transcription is available, label it accordingly and do not call it a newly authenticated Nathan Direct quotation. Distinguish exact-head builds from merge-reference builds and historical builds; verify that the relevant module blob is unchanged before reusing an older result.
7. **Stop on missing physical inputs.** Do not create finite fixtures, synthetic physical data, parameter values, or data-free calculations without explicit prior permission. A formal proof of an abstract statement does not authorize a physical calculation or prediction.

The preflight is a workflow guard, not a theory axiom. It prevents duplicate proof submissions and blocks semantic drift between source-defined operations and their Lean abstractions. A successful build still checks only the formalized statement, not the source-to-model translation or physical premises.

## Mandatory Factory Floor handoff on Lean success

When a specific submitted theorem receives a successful Lean CI result, **route the source-linked verification packet to Satobloc/FACTORY_FLOOR intake immediately**. Lean success is a transition into the Factory Floor, **not** promotion to accepted physics, BEDROCK, a paper, or the public website.

Use the existing Factory authority [FLOORROOM_TODO.md](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/FLOORROOM_TODO.md). Correct intake is **1 GLASS+HSH -> 2 WORKSHOP**, followed by any duly approved LIVE / ARTIFACTS / WEBSITE stages. Respect all Factory routing, licensing, privacy, and presentation gates. If the intake mechanism is not available, emit a machine-readable, provenance-complete **FACTORY_HANDOFF_PENDING** packet instead of claiming delivery.

Minimum handoff fields: source repository/path/blob SHA/commit; proof theorem/module; exact Lean+Mathlib toolchain and dependency manifest identity; Actions run ID and URL; compilation conclusion; assumptions and declared axioms; theorem statement; original historical source/date/locator where applicable; Python/numeric tests and limitations; physical/empirical interpretation explicitly separate; candidate visibility and workshop presentation status; stable item identity (allocated by Factory rules). Mark status `LEAN_VERIFIED / FACTORY_INTAKE_PENDING` until receipt, then `LEAN_VERIFIED / FACTORY_INTAKE_RECEIVED` after independent acknowledgement. Compilation failure or untested proofs remain upstream with errors and discriminators, not success handoffs.

**Do not route the CI smoke-test theorem as a scientific result.** The policy applies to substantive source-linked research proofs with verified CI and a valid publication/visibility gate. Never write directly into Factory Floor or claim arrival without an authorized intake route and readback.
