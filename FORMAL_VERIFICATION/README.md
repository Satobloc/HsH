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
