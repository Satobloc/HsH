> **QUARANTINED — 2026-09-13:** Nathan halted this integration lane after identifying a category failure in its assessment process. This generated artifact is preserved only as history and must not control theory, predictions, papers, or future work. See [quarantine manifest](../QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md).

# H(s)H Tight Prediction Ledger

Promotion order: `UNFROZEN -> CANDIDATE -> FROZEN -> TESTED / FAILED`.

No empirical prediction is frozen yet. The finite-core architecture and observable forward map remain underdetermined.

## PRED-FC-001 — Cross-section dimensional/scaling discriminator

- **Status:** `UNFROZEN`
- **Derivation source:** `FC-BASE-001` in [FINITE_CORE_COMPARISON.md](FINITE_CORE_COMPARISON.md)
- **Assumptions:** smooth embedded center history; locally Euclidean normal metric; isotropic radius `epsilon`; transverse, effectively thin resolver; no convolution or clipping.
- **Exact relations:** `Vol(B^3_epsilon) = (4 pi/3) epsilon^3`; `Area(S^2_epsilon) = 4 pi epsilon^2`; `Area(B^2_epsilon) = pi epsilon^2`.
- **Predicted discriminator:** an observable proportional to occupied bulk measure scales as `epsilon^3`; boundary- or support-dominated observables scale as `epsilon^2`.
- **Units:** depend on the observable map; geometric measures have units `L^3` and `L^2`.
- **Observable/readout map:** not yet defined.
- **Independent comparator:** none selected; no target data may be used to choose the exponent.
- **Uncertainty:** dominated by anisotropy, resolver thickness, unknown coupling density, and scale definition.
- **Candidate contrast:** distinguishes full-core volume coupling from boundary/material-support coupling only if the same independently measured `epsilon` enters both.
- **Falsification condition:** after precommitting the coupling and scale estimator, a robust exponent inconsistent with the selected candidate fails that candidate.
- **Freeze condition:** select the material carrier, derive the coupling density and resolver kernel, and identify an independent scale/observable pair before inspecting target scaling data.
- **Historical provenance:** not yet checked; do not claim SAT priority.

## PRED-FC-002 — Canonical moment/readout discriminator

- **Status:** `CANDIDATE` — frozen geometric discriminator; not yet a frozen empirical H(s)H prediction.
- **Derivation source:** `FC-BASE-002` and [FINITE_CORE_CROSS_SECTION_PACKET_001.md](../WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_CROSS_SECTION_PACKET_001.md).
- **Assumptions:** a declared fiber measure; uniform canonical `B^3`, `S^2`, `B^2`, or `S^1` family; smooth transverse thin-sheet crossing; moment-preserving readout.
- **Exact invariant:** `(I2,I3,chi)` equals `(0,0,25/21)`, `(0,0,1)`, `(1/6,-1/108,4/3)`, or `(1/6,-1/108,1)` respectively.
- **Exact linear readout:** `|det L_Sigma|=|n_Sigma·T|^-1`; generic sheet-support dimensions are 3 for `B^3` and 2 for `B^2/S^2`.
- **Units:** `I2`, `I3`, `chi`, and the secant factor are dimensionless.
- **Observable/readout map:** cross-sectional moment estimation after a specified resolver kernel; physical measurement channel not selected. Under the affine independent-kernel baseline, `Q_obs = L_Sigma Q_core L_Sigma^T + Q_kernel`.
- **Independent comparator:** none selected.
- **Uncertainty:** nonuniform density, anisotropy, finite resolver thickness, tangency, curvature, clipping, and reconstruction bias. FC-BASE-003 shows that second moments cannot separate core and resolver width without calibration, and `chi` is not generally convolution-invariant.
- **Rival contrast:** separates canonical bulk from boundary using `chi`; separates rank-three from rank-two support using `I2,I3` or support dimension.
- **Falsification:** after freezing carrier, measure, and resolver, failure of the declared canonical tuple or transverse secant factor fails that representation/readout model.
- **Freeze condition:** select a physical carrier and independent measurement channel; independently calibrate the resolver kernel, use a controlled thickness family, or prove kernel insensitivity; then preregister estimator, corrections, and comparator before target inspection.
- **Historical provenance:** unchecked; no novelty or priority claim.

## PRED-FC-003 — Controlled resolver-width covariance law

- **Status:** `CANDIDATE` — exact calibration prediction; no physical H(s)H resolver family selected.
- **Derivation source:** `FC-BASE-003/004` and [FINITE_THICKNESS_READOUT_PACKET_001.md](../WORKSPACES/WORLDTUBE_LAB/FINITE_THICKNESS_READOUT_PACKET_001.md).
- **Assumptions:** centered independent additive kernel; local affine crossing; controlled scale family `Z_delta=delta Z_1`; fixed carrier state across settings.
- **Exact equation:** `Q_obs(delta)=Q_0+delta^2 Q_K`; equivalently `Q_obs(delta_2)-Q_obs(delta_1)=(delta_2^2-delta_1^2)Q_K`.
- **Predicted scaling/invariant:** every covariance component and the trace are affine in `delta^2`; the intercept is the projected carrier covariance `Q_0`.
- **Units:** covariance entries `L^2`; `delta` has the chosen resolver-width unit and must be independently calibrated.
- **Observable/readout map:** repeated cross-sectional measurements of the same declared carrier ensemble at preregistered resolver widths.
- **Independent comparator:** held-out resolver settings not used to estimate `Q_0,Q_K`.
- **Uncertainty:** carrier drift, correlated core-resolver response, nonlinear reconstruction, clipping, curvature, tangency, and width-calibration error.
- **Rival contrast:** separates additive resolver broadening from a fixed projected carrier covariance; it does not by itself select `B^3`, `B^2`, or `S^2`.
- **Falsification condition:** statistically resolved non-affinity in `delta^2` after preregistered corrections rejects the scaled independent-kernel readout model.
- **Freeze condition:** demonstrate an independently controlled H(s)H resolver-width family and freeze estimator, settings, corrections, and held-out test before inspecting target behavior.
- **Historical provenance:** unchecked; no SAT priority or physical prediction claim.

## PRED-FC-004 — Helical speed-budget relation

- **Status:** `UNFROZEN` — exact local kinematic guard; no physical H(s)H speed/readout assignment.
- **Derivation source:** `FC-BASE-005` and [FIXED_SPEED_HELIX_COMPATIBILITY_001.md](../WORKSPACES/WORLDTUBE_LAB/FIXED_SPEED_HELIX_COMPATIBILITY_001.md).
- **Assumptions:** constant-radius circular helix; orthogonal Euclidean axial/transverse decomposition; total parameter speed fixed to `c`.
- **Exact equation:** `v_perp^2+v_axial^2=c^2`, with `v_perp=R omega`; hence `v_axial=c => v_perp=0`.
- **Predicted relation:** any admitted nonzero winding requires `|v_axial|<c` under this specific speed convention.
- **Units:** speed squared.
- **Observable/readout map:** not defined; parameter, group, phase, signal, and material speeds remain untyped.
- **Independent comparator:** none selected.
- **Uncertainty:** variable radius, nesting, nonorthogonal frames, curved geometry, and Lorentzian signature add or alter terms.
- **Rival contrast:** distinguishes a fixed-total-speed Euclidean transport convention from models that fix axial/phase speed or impose a Lorentzian null condition.
- **Falsification condition:** a fully specified model satisfying the stated assumptions while having `v_axial=c` and nonzero `R omega` is algebraically inconsistent.
- **Freeze condition:** type the parameter and metric, identify the relevant speed operationally, and derive the centerline/readout velocity map.
- **Historical provenance:** a former-instance closure audit recovered the original correction; no novelty claim.

## Readout no-go affecting the queue

FC-BASE-003 is `STD/DERIVED/FROZEN` in its stated affine independent-kernel scope: `Q_obs = L_Sigma Q_core L_Sigma^T + Q_kernel`. It is not an empirical prediction. It blocks promotion of any apparent-width or canonical-`chi` claim that lacks kernel calibration, controlled thin-limit extrapolation, or a proved kernel-invariant observable.

## Blocked queue

- ᚼ/ᚼᚼ residual prediction: blocked by missing frame/axis, composition law, and observable map.
- Open-Brunnian persistence prediction: blocked by missing material-support topology and reconnection rule.
- Kerr-scale or legacy-angle prediction: forbidden until independently regenerated from frozen current geometry. `KERR_CORE_BASELINE.md` is provisionally quarantined; its electron-scale circuit identities are consequences of the selected `a=hbar/(2m_ec)`, not independent predictions.
