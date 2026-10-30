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

## Mandatory Factory Floor handoff on Lean success

When a specific submitted theorem receives a successful Lean CI result, **route the source-linked verification packet to Satobloc/FACTORY_FLOOR intake immediately**. Lean success is a transition into the Factory Floor, **not** promotion to accepted physics, BEDROCK, a paper, or the public website.

Use the existing Factory authority [FLOORROOM_TODO.md](https://github.com/Satobloc/FACTORY_FLOOR/blob/main/FLOORROOM_TODO.md). Correct intake is **1 GLASS+HSH -> 2 WORKSHOP**, followed by any duly approved LIVE / ARTIFACTS / WEBSITE stages. Respect all Factory routing, licensing, privacy, and presentation gates. If the intake mechanism is not available, emit a machine-readable, provenance-complete **FACTORY_HANDOFF_PENDING** packet instead of claiming delivery.

Minimum handoff fields: source repository/path/blob SHA/commit; proof theorem/module; exact Lean+Mathlib toolchain and dependency manifest identity; Actions run ID and URL; compilation conclusion; assumptions and declared axioms; theorem statement; original historical source/date/locator where applicable; Python/numeric tests and limitations; physical/empirical interpretation explicitly separate; candidate visibility and workshop presentation status; stable item identity (allocated by Factory rules). Mark status `LEAN_VERIFIED / FACTORY_INTAKE_PENDING` until receipt, then `LEAN_VERIFIED / FACTORY_INTAKE_RECEIVED` after independent acknowledgement. Compilation failure or untested proofs remain upstream with errors and discriminators, not success handoffs.

**Do not route the CI smoke-test theorem as a scientific result.** The policy applies to substantive source-linked research proofs with verified CI and a valid publication/visibility gate. Never write directly into Factory Floor or claim arrival without an authorized intake route and readback.
