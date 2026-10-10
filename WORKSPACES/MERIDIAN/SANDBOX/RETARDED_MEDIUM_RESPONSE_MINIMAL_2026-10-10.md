# Meridian sandbox | Retarded response and constrained geometric memory | 2026-10-10

**Status:** SANDBOXED analytic test, no extra ontology. **Author:** Meridian. The direct user-clarification source is `WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-10_GEOMETRIC_ENCODING.md`. **Original source material reread this run:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt` substantive start; `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` substantive text. Direct user instruction: Minkowski+known physics+responsive medium.

## Construction: finite responsiveness without a new field
In a local inertial Minkowski patch, take a scalar component `f(t)` of **existing** filament-on-timesheet mechanical forcing and a measured medium response `q(t)`. As an illustrative *constitutive relation*, not a physical postulate, choose an ordinary causal linear relaxation law

`tau dq/dt + q = chi f(t)`, with `tau>0`, `chi` effective susceptibility.

Here q is a directly measurable deformation/response coordinate of the existing medium, not a newly declared field; no second spacetime, induced metric, or carrier is introduced.

The stationary retarded solution is

`q(t)=(chi/tau)∫_{-∞}^t exp[-(t-s)/tau] f(s) ds`.

Proof: differentiate the convolution and use normalization of exponential kernel. For input `f(t)=f0 cos(omega t)`, stable particular solution is

`q(t)=chi f0 /sqrt(1+(omega tau)^2) cos[omega t - arctan(omega tau)]`.

Thus `tan(delta_phase)=omega tau`; at `omega tau=1`, phase lag 45°, gain reduced by `1/sqrt(2)`. This result uses no SAT historical constant.

## The zero-memory control
For `tau→0`, `q=chi f` instantaneously. For finite `tau>0`, response retains temporal memory but does **not** imply backward-in-time causal influence. A retarded kernel is standard causal dynamics and by itself cannot establish SAT's hypothesized reciprocal four-dimensional 'backbleed'. Consequently, do not advertise phase lag as a novel SAT prediction.

## Failure conditions
1. Instability if tau<=0 for this elementary relaxation model.
2. If actual medium's response is nonlocal or nonlinear, this local scalar constitutive model is insufficient; test that instead of adding ontology.
3. Coupling the above to angular momentum/torque in flat spacetime does not by itself yield Kerr or genuine gravitational frame dragging. Require proper relativistic treatment, conserved stress energy, GR-observable comparison, and source-independent calibration.
4. If chi and tau must be adjusted separately for every system or frequency, this is arbitrary encoding rather than physical explanation.

## Discriminating solver test
Fit chi,tau at one forcing frequency and predict both amplitude and phase at two held-out frequencies. Test relation `(G0/G(omega))² -1 = (omega tau)²` and `tan(phase)=omega tau`; equivalently `G(omega)/G0=cos phase`. All this follows from one fixed constitutive model. Failure at held-out frequency falsifies this toy response law, not SAT.

## Source typing
- Nathan / SAT: a responsive time wavefront, filament-worldline as physical map, acceptance of well-established physics and rejection of arbitrary encoding.
- Standard math: first-order causal linear response and frequency transfer function.
- Meridian local invention: choosing a scalar relaxation fixture to operationalize 'medium response'.
- NOT claimed: new physical field, Kerr generation, quantum dynamics, predictive anomaly.

## Next cursor
Encode angular-momentum conservation and finite-core worldtube coupling in the **same pre-existing responsive medium**, and use observable gyroscope transport / far-field frame dragging as the GR comparator, keeping rigidly rotating Minkowski coordinates as exact flat control. Do not assume wavefront is an extra manifold or that curvature must be a Householder representation.
