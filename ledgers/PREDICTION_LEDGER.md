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

## Blocked queue

- ᚼ/ᚼᚼ residual prediction: blocked by missing frame/axis, composition law, and observable map.
- Open-Brunnian persistence prediction: blocked by missing material-support topology and reconnection rule.
- Kerr-scale or legacy-angle prediction: forbidden until independently regenerated from frozen current geometry.
