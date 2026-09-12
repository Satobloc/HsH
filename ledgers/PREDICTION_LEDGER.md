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

## Readout no-go affecting the queue

FC-BASE-003 is `STD/DERIVED/FROZEN` in its stated affine independent-kernel scope: `Q_obs = L_Sigma Q_core L_Sigma^T + Q_kernel`. It is not an empirical prediction. It blocks promotion of any apparent-width or canonical-`chi` claim that lacks kernel calibration, controlled thin-limit extrapolation, or a proved kernel-invariant observable.

## Blocked queue

- ᚼ/ᚼᚼ residual prediction: blocked by missing frame/axis, composition law, and observable map.
- Open-Brunnian persistence prediction: blocked by missing material-support topology and reconnection rule.
- Kerr-scale or legacy-angle prediction: forbidden until independently regenerated from frozen current geometry.
