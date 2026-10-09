# Orson Vay | OV-28 | Alignment, reference, and geometric information
**Status:** SANDBOXED; 2026-10-09 EDT. Independent geometry/inference test; not a SAT/H(s)H physical claim. Namespace `LOCAL:OV28`.

## Result
A 4D filament may possess nontrivial SO(3) normal holonomy, yet its collective material readout can contain **zero identifiable information** about that rotation. Three separate gates are needed: (1) orientation-sensitive material coupling, (2) nonzero collective order, (3) a calibrated initial reference or a before/after measurement. A rank-two nematic readout determines rotation only modulo π.

The independent model was constructed before external comparison. From OV-25, use a normal holonomy angle `φ_H=2.63254951046 rad` merely as a test fixture. In the invariant 2-plane, let `θ_i` be material director angles, `Δ` anisotropy, `S=|N^-1 Σ exp(2iθ_i)|` nematic order, and `θ_0` the initial director reference. If material directors actually follow normal parallel transport, the aggregate quadrupole readout is
```
z = (Qxx-Qyy, 2Qxy)
E[z_after] = Δ S (cos[2(θ_0+φ_H)], sin[2(θ_0+φ_H)]).
```
The **material transport law is stipulated**, not derived. An isotropic or freely relaxing tube may erase the signal.

## Exact inverse-problem calculation
Take independent Gaussian noise with variance `σ²/N` in each aggregate quadrupole component. Define `k=4NΔ²S²/σ²`.
- **Known initial orientation:** Fisher information `I(φ_H)=k`, local standard-deviation bound `σ/(2Δ S sqrt(N))`.
- **One post-only observation, unknown θ_0:** Fisher matrix for parameters `(φ_H,θ_0)` is `k[[1,1],[1,1]]`, rank one. The rotation is **not identifiable**, even at `S=1`. Histories `(φ_H,θ_0)=(0.4,0.1)` and `(0.1,0.4)` give exactly the same final readout.
- **Two equally noisy observations, before and after:** Fisher matrix `k[[1,1],[1,2]]`. After treating initial orientation as nuisance, `Var(φhat)≥2/k`, twice the known-reference bound.
- **S=0:** ideal isotropic coarse-grained readout has zero information about rotation. Individual-resolved measurements could retain information.
- **Rank-two ambiguity:** `z(φ_H)=z(φ_H+π)`. OV-25's `150.8339763°` is equivalent to `-29.1660237°` to this detector. A polar marker or richer representation is needed to resolve the branch.

## Synthetic numerical control
Reproducible script: `orson_ov28_observer_identifiability.py` in this task thread's downloadable packet. Seed 20261009, `N=400`, `Δ=1`, `σ=0.2`, 8,000 trials per order value. At `S=0.2`, predicted/observed known-reference SD `0.02500/0.02508 rad`; predicted/observed paired SD `0.03536/0.03558 rad`. At `S=1`, known `0.00500/0.00499`; paired `0.00707/0.00708 rad`. This validates the statistical fixture, not the proposed physical coupling.

## Multiscale organization
For `D` independently random-oriented domains with `n` aligned filaments each, `N=Dn` and `E[S²]=1/D`. **Conditional on calibrated initial aggregate orientation**, mean Fisher information is `4nΔ²/σ²`, independent of D; if domains align, information grows as `Dn`. Without calibration and with rotationally invariant prior, the common rotation remains unidentifiable. This is an exact coarse-graining/information-scaling result under the stated model.

## Archive/source record (exact coverage)
- Historical: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, lines 1250–EOF (approximately 1569), reread 1450–EOF. Historical S2/S3/S5 generated formalizations include projection and observer-tetrad language, plus unsupported claims. Not Nathan-direct theory authority.
- Sep 30 HsH: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_THEORIZING.txt`, lines 1950–2600. Nathan's direct projection hypothesis distinguished from assistant's unsupported spin/color conclusions.
- Current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Reference Desk, relevant controls, symbol and citation policy, Mersearch stable worker guidance read; 2026-10-05 HSH_RESOURCES packet/declaration link routes triaged. No `PRIOR_ART` accessed. No corpus-wide Mersearch execution: checkout/API unavailable in connector runtime. No novelty/priority claim.
- External **after** derivation: Todd Rowland, *Holonomy Group*, MathWorld, https://mathworld.wolfram.com/HolonomyGroup.html (reference excerpt in `HSH_RESOURCES/H(s)H_Toolkit/HOLONOMY REFERENCE.txt`, lines 1–120); Viamontes et al., *Phys. Rev. E* 73, 061901 (2006), https://doi.org/10.1103/PhysRevE.73.061901 (abstract-level check of experimental nematic-order measurement). Neither endorses H(s)H.

## Failure gates / continuation
No material coupling ⇒ no predicted signal. No collective order ⇒ no coarse quadrupole signal. No initial reference ⇒ no unique history reconstruction. Rank-two readout ⇒ modulo-π ambiguity. Correlated/non-Gaussian noise or relaxation ⇒ recalculate Fisher information.

**Next:** derive director transport and relaxation from the finite-core SAT/H(s)H action (OV-24/27), then replace synthetic measurement covariance with a real instrument's noise and benchmark on classical filament/nematic experiments. Eight scored LLM cognition probes in the downloadable task-thread packet address these inference gates.

**Orson Vay**
