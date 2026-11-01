# Hale receipt amendment 01 — formalization update

The parent receipt records the report and PR state at the time of its creation. This amendment supersedes only the formalization cursor and current CI snapshot.

- Existing PR #1166 branch head: `1504959a6a9c82eb0eb9fac3e223fc9bf1d136a5`.
- Added the source's two-channel first-echo composition as `firstEchoAmplitude`.
- Added `firstEchoAmplitude_split`.
- Added `firstEchoAmplitude_injective_horizonPlus`, conditional on nonzero surface/phase/transfer coefficients.
- The theorem is a formalization of standard-source Eq. (5), not an H(s)H law and not a detector-data identifiability result.
- Latest Actions run #41298868634, job #124825450930, remained IN_PROGRESS at “Generate Lake dependency manifest”; Lean compilation had not started.
- No successful build is claimed. The earlier failed run #41298597013 printed `sorryAx` for the affected filter theorems; the corrected commit has not yet been compiled.
- Exact-head standalone verification remains unperformed.

Full explanation: `WORKSPACES/HALE/2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE_AMENDMENT_01.md`.

No scheduler, task, branch, PR, or theory-promotion change.
