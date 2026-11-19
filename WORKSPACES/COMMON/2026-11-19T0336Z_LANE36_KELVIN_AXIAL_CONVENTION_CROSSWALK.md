# Lane 36 | Kelvin axial sign-convention crosswalk

**Run:** `REVROT3-19-20261011:939:s3`  
**Selection:** `h=939`, `seq=4698`, index `5` = Mira; next index `6` = Aldus.  
**Execution identity:** assistant-level source-grounded Lane 36 work, not authenticated participation by a Mira thread or instance.

## Result

The Nature Physics and Physical Review Letters Kelvin-vortex papers print opposite signs for the axial Doppler term. A coordinate-orientation reversal can reconcile the forms, but only if the signed axial wavenumber and the positive-down velocity convention are mapped together. The available source record does not yet establish that mapping unambiguously.

This adds a **signed-coordinate convention witness** to the existing P2 source-to-observable/comparator chain. It prevents an apparent H(s)H residual from being manufactured by comparing formulas expressed in different axial conventions. It does not decide that either source equation is wrong, correct either equation, or create an H(s)H prediction.

## 1. Source equations preserved verbatim

**Nature Physics:** J. Barckicke, E. Falcon and C. Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), [DOI 10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

Phase convention:

`exp(i(k z + m theta + omega t))`

Eq. (2) axial term:

`\tilde{\omega} = \omega + m\Omega_0 + k v_z`

The paper describes `v_z` as downward-positive and defines `z=0` at the free surface and `z=40 cm` at the drain. Its Figshare data locator is [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The exact package version and bytes were not acquired.

**Physical Review Letters:** J. Barckicke, E. Falcon and C. Gissinger, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” *Physical Review Letters* 137, 134001 (2026), [DOI 10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431).

Phase convention:

`exp(i(k z + m theta + omega t))`

Eq. (1) axial term:

`\tilde{\omega} \equiv \omega + m\Omega_0 - k v_z`

The equation text also describes `v_z` as downward-positive and describes the core radius as increasing with altitude `z`. The retrieved source does not provide a complete typed mapping among the sign of the `z` coordinate component, signed Fourier wavenumber `k`, and whether `v_z` is a signed component or a positive-down scalar. The PRL Fig. 2 caption separately reports `v_z = -0.63 m/s`; this is not resolved by the equation-sign comparison. Its data-availability statement says no public research data or software support the manuscript.

These are related papers from the same research group, not two independent measurements of the same acquisition. The PRL paper cites the Nature paper. No raw-data comparison or replication is claimed.

The earlier source audit remains controlling:
- [Calder source-sign addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-06T2324Z_KELVIN_SOURCE_SIGN_AND_NULL_DESIGN_ADDENDUM.md)
- [Calder data-access/sign amendment](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-06T2324Z_PRL_SIGN_AND_DATA_ACCESS_AMENDMENT_01.md)

## 2. Conditional coordinate map

Let `v_down` be a positive-down scalar speed, not a signed coordinate component. Let `epsilon_z` encode the sign of the positive-down direction relative to the selected `z` coordinate:

- `epsilon_z=+1` when increasing `z` points downward;
- `epsilon_z=-1` when increasing `z` points upward.

For `exp(i(k z + m theta + omega t))`, the signed axial velocity component is

`U_z = epsilon_z * v_down`

and the convention-aware convective frequency is

`\tilde{\omega} = \omega + m\Omega_0 + epsilon_z k v_down`.

This is an assistant-derived normalization, not a verbatim source equation and not a Nathan-authored SAT-O/Blockwave equation.

Under `z'=-z+c`, the signed wavenumber and orientation factor both reverse (`k'=-k`, `epsilon_z'=-epsilon_z`), while the positive-down scalar speed is unchanged. Therefore `epsilon_z' k' v_down = epsilon_z k v_down`, and the plus/minus forms coincide when the coordinate wavenumber is reversed:

`omega + m Omega_0 + k v_down = omega + m Omega_0 - (-k) v_down`.

If both papers instead use the same coordinate orientation, velocity semantics, and phase convention, their opposite forms agree only when `k=0` or `v_z=0`. For a nonzero axial Doppler product, they differ. The coordinate map cannot be assumed merely because it is convenient.

If `v_z` is already a signed coordinate component `U_z`, then both `k` and `U_z` reverse and the contraction `k U_z` is invariant.

**Current disposition:** `CONDITIONALLY RECONCILABLE / SOURCE_MAP_UNVERIFIED`. Do not call this a typo, physical contradiction, correction, or resolved convention.

## 3. Additive source-convention witness

Before fitting or comparing either dispersion relation, the existing P2 source-to-observable manifest should record:

| Field | Required value |
|---|---|
| `phase_convention` | Exact signs on `kz`, `m theta`, `omega t` |
| `z_axis_orientation` | Positive-up, positive-down, or unresolved; origin and definition |
| `v_z_semantics` | Signed coordinate component, positive-down scalar, or unresolved |
| `k_semantics` | Signed coordinate Fourier component, propagation-direction label, or magnitude |
| `theta_orientation`, `m_semantics` | Positive azimuthal orientation and signed mode convention |
| `circulation_orientation` | Sign convention for `Gamma` and `Omega_0` |
| `source_locator` | Equation, page/line/figure, version and DOI |
| `parameter_provenance` | For `Gamma`, `a_0`, `Omega_0`, `v_z`: measured, averaged, fitted, independently checked |
| `fit_holdout_status` | Fit/calibration record, untouched holdout identity, or explicit absence |
| `mapping_status` | Source-verified, conditionally mapped, or unresolved |

These are source metadata, not fit parameters. The sign convention must not be tuned against the holdout.

The Nature source audit reports that circulation and axial velocity were fitted to dispersion data before checking against PIV/PTV. That is a fit-conditioned comparison, not a blind holdout prediction. The source audit reports typical core-radius/position uncertainty near 0.1 mm, PIV circulation uncertainty near 0.005 m² s⁻¹, and PTV vertical-velocity uncertainty near 0.05 m s⁻¹; exact linkage to the unacquired Figshare version remains unverified.

## 4. P2 comparison consequence

The standard Kelvin/Rankine comparator must first be expressed in the measured system's source-verified coordinate convention. Only then can an H(s)H forward map be compared.

| Comparison element | H0 standard source model | H1 H(s)H extension |
|---|---|---|
| Shared parameters | `Gamma`, `a_0`, `Omega_0`, axial flow with fit/measurement provenance | Same calibrated physical parameters |
| Convention | Fixed source-verified `epsilon_z` and signed-`k` map | Same normalized measurement convention |
| Calibration | Nature source is fit-conditioned; no blind holdout established here | Not instantiated |
| Holdout | No untouched run/version acquired or frozen here | None |
| Observable | `omega(k,m)` and, where available, `S_eta(k,omega)` | No source-authorized H(s)H readout map |
| Falsification threshold | Not formed from acquired raw data and uncertainty | Not formed |

This prevents a false H(s)H advantage that is actually a standard-model sign-convention mismatch. No worldtube thickness, twist, contact surface, finite-core mechanism, or timesheet relation is made necessary by this result.

## 5. Lean formalization

A five-theorem module was added to the existing Lean 4.34.0 / Mathlib project:

[Exact module](https://github.com/Satobloc/HsH/blob/713d6dac380e4fe25f9aa2d9b86770df7f02f454/FORMAL_VERIFICATION/HsHVerification/KelvinAxialConventionCovariance.lean)

It proves:
1. simultaneous reversal of axial orientation and signed wavenumber preserves the convention-aware Doppler shift;
2. the plus/minus forms are algebraically equivalent under reversed `k`;
3. if all conventions are identical, equality requires `k=0` or `v_down=0`;
4. the signed-component product `k U_z` is invariant when both components reverse;
5. the axial phase argument is invariant under simultaneous reversal of `k` and `z`.

The module contains an integer `#eval` smoke test. Its integers are algebraic test values, not physical data.

**Exact-head verification:** [PR #2055](https://github.com/Satobloc/HsH/pull/2055), head `713d6dac380e4fe25f9aa2d9b86770df7f02f454`, base `infra/lean4-verification-20261023` at `368f9af8d95d061b4581688759ed3eda309e9886`.

- [Actions run #44454324258](https://github.com/Satobloc/HsH/actions/runs/44454324258): exact PR-head checkout PASS; full Lean 4.34.0 / Lake 5.0.0 build PASS; 8,948 jobs successful; `#eval` returned `true`.
- Four generic-ring theorems report `[propext, Quot.sound]`; the real-field equivalence theorem reports `[propext, Classical.choice, Quot.sound]`.
- No `sorryAx` appeared in the module output.
- Global axiom-audit, tests, lint, nanoda and leanchecker stages were skipped.
- PR #2055 remains draft/open/unmerged. The first attempt PR #2054 was closed unmerged after its base advanced by 14 commits. No other worker's PR was modified.

The Lean statements prove algebra only. `epsilon_z` is not constrained in Lean to `+1` or `-1`; that interpretation remains a source-semantic premise. The formalization does not prove the source-to-coordinate translation, authenticate the papers' coordinate definitions, validate fluid premises, or establish an H(s)H prediction. The current default `main` does not contain the complete Lean project/workflow; this verification is branch-scoped, not integrated into main.

## 6. Physical and epistemic status

- P2 remains **HOLD**.
- Nature Figshare DOI remains a locator only; no versioned inventory or raw bytes were acquired.
- PRL research data/software are not publicly available according to its data statement.
- No measured system was re-instantiated; no physical calculation, fit, prediction, threshold, or independent measurement was produced.
- No SAT-O or Blockwave equation was changed, corrected, or reattributed.
- No BEDROCK theory promotion or paper-gate advancement occurred.

The next smallest useful action is to obtain a source-faithful coordinate-component definition for the PRL `z` axis and `v_z` variable, including any supplementary convention or author clarification, then record the mapping without fitting it. If the source confirms the same orientation and semantics as Nature, preserve the discrepancy for source-critical resolution; if it confirms the reversed orientation, record the exact transformation and keep both original equations unchanged.

## 7. Provenance and limitations

Primary sources:
- Nature Physics: https://doi.org/10.1038/s41567-026-03175-w
- Nature data locator: https://doi.org/10.6084/m9.figshare.30903347
- Physical Review Letters: https://doi.org/10.1103/t3bt-m431

Internal P2 source audit:
- Calder h647 sign addendum and Amendment 01 linked above.
- [P2 comparison matrix #1855](https://github.com/Satobloc/HsH/issues/1855)

No Mersearch result is claimed. All four canonical Mersearch request lanes remain `requested`; no lane was overwritten, retriggered, released, or retried. No private HSH_RESOURCES payload was accessed; only its root README was read and its private-reference boundary respected. SciSpace was available but not needed because the primary publisher PDFs were directly accessible. Existing Math Hopper #578 and Lean PRs #991/#1189/#1515 were checked. The Whirligig Kernel 0 search result's named workspace path returned 404, so no current artifact status is claimed. The connector did not expose a fresh fork inventory. No new dependency, service, fork, subscription, or cost was introduced.
