# Mass-sector playground — old SAT math promoted into H(s)H experiments

**Date:** 2026-10-01  
**Status:** SANDBOX / EXPERIMENTAL — NOT CURRENT THEORY  
**Purpose:** deliberately import old mass-sector mathematics, reproduce failures, and search for cleaner H(s)H replacements without target-fitting particle labels or remembered constants.

## 0. Provenance boundary

### Recovered/source-supported material
- The archive derivation index marks the proton/electron formula
  `mu = (3/(2 B^5))(1 + delta_elastic)`
  as **FRACTURED / OPEN**, specifically because the elastic correction is not independently derived.
- Raw geometric projection constant:
  `B0 = 3/(4 pi) = 0.2387324146...`.
- Old mass concept: mass/projective resistance depends on worldline/time-surface angle theta4.
- Older formal bridge: `m = tau_mu v^mu`.
- Audit documents explicitly say the fifth power and prefactor 3/2 still needed derivation from action extrema; one proposed route was
  `Ext(S[B3(B3)]) / Ext(S[B1]) = 3/(2 B^5)`,
  with the exponent 5 to be forced as a winding index. That document states this as an objective, not an achieved proof.
- An early theta4 toy model used `m/m_max = sin^2(theta4)` and helix geometry `tan(theta4)=2 pi r/p`. This was reverse-mapped from mass and should be treated as a toy constitutive law, not recovered first-principles theory.

### New playground work below
Everything labelled **NEW** is generated on 2026-10-01 and is not historical project provenance.

---

## 1. Reproduce the old failure before repairing anything

With the raw geometric value

`B0 = 3/(4 pi)`,

the bare historical expression gives

`mu_bare = 3/(2 B0^5) = 1934.34665...`.

So the raw geometry does **not** yield the remembered observed ratio. This is not a small rounding issue.

If one instead asks what B would be required for the bare formula to equal 1836.15267343, one gets

`B_required = (3/(2 mu))^(1/5) = 0.2412328757...`,

which is about 1.047% above B0.

That number should **not** be promoted as a discovery: it is the inverse solution obtained from the target. It is useful only as a diagnostic showing how much the effective projection would have to move if the old fifth-power formula were otherwise correct.

The archive's later `B_stable ~ 0.24177` is therefore suspicious in this sector unless independently derived: it sits near the target-implied effective B and was explicitly described in some old files as a metrological refinement.

**Conclusion:** do not heal the old equation with `delta_elastic`, a bridge, alpha, or a renormalized B unless the correction falls out of the geometry/action independently.

---

## 2. What probably went wrong structurally

The old construction appears to have compressed several logically different things into one scalar B:

1. **projection geometry** — a dimensionless map factor such as 3/(4 pi);
2. **local worldtube orientation** — theta4 / tangent angle;
3. **finite-core deformation** — curvature, torsion, strain, thickness;
4. **composite topology** — braid/link/closure class;
5. **constitutive response** — how the timesheet/medium reacts;
6. **coarse-graining** — how several filaments combine into a composite inertial response.

If all six are represented by powers/corrections of one B, a fifth power can fit many ratios without explaining why five independent projection factors exist.

The more promising H(s)H move is therefore to stop treating `B^5` as primitive and ask whether an action extremum naturally factorizes into five dimensionless geometric Jacobians/invariants. If it does, the old exponent 5 is recovered. If it does not, discard it.

---

## 3. NEW PLAYGROUND A — worldtube action with an angle-generated mass functional

Take a finite-core curve `H(lambda)` in 4D with unit tangent `T`, curvature `kappa`, generalized torsion/twist `omega`, and a local unit timesheet/flow direction `u`.

Define the invariant angle through

`q = 1 - (T·u)^2 = sin^2(theta4)`.

This immediately reproduces the useful part of the old theta4 toy model without defining theta4 from an observed mass.

Try the dimensionless action density

`L = A kappa^2 + C omega^2 + D q + E q^2 + F |D_lambda q|^2 + V_core(a) + V_link[H_i,H_j]`.

Then define inertial response operationally, not by decree, as the second variation of the minimized action under a small imposed spatial acceleration/tilt:

`M_eff := d^2 S_min(epsilon) / d epsilon^2 |_(epsilon=0)`.

This is attractive because:
- theta4 can influence mass without mass being inserted into theta4;
- curvature/torsion/core deformation contribute automatically;
- composites can differ from single filaments through `V_link`;
- a mass ratio becomes a ratio of Hessian eigenvalues of two stationary geometric solutions.

This is much closer to the old audit's desired “ratio of action extrema,” but makes the quantity to compare a **response eigenvalue** rather than the raw action value.

### Immediate test
Solve two families without particle labels:
- class U: one closed/stable finite-core excitation;
- class C3: the minimal stable three-component linked/braided excitation.

Compute
`R = lambda_inertial(C3) / lambda_inertial(U)`.

Only after solving should labels be compared to known particles.

---

## 4. NEW PLAYGROUND B — can the old fifth power emerge rather than be assumed?

Suppose the inertial Hessian factorizes locally:

`lambda_inertial ~ J_proj J_angle J_core J_hol J_link`.

If, in a special symmetric limit, each factor approaches the same geometric projection eigenvalue B, then

`lambda ~ B^5`.

A ratio could then contain `B^{-5}` without putting “5” into the law.

This gives a concrete falsification test for the old formula:

**Search the actual H(s)H action for five independent Jacobian/eigenvalue factors.**

Candidate meanings:
1. tangent projection into observed 3-space;
2. normal-plane projection;
3. finite-core cross-section response;
4. holonomy/closure response;
5. braid/link coupling response.

This list is speculative. The point is not that these are the five; the point is to demand five independently motivated factors before accepting B^5.

If only 3 or 4 survive, the exponent should change.

---

## 5. NEW PLAYGROUND C — reinterpret the 3/2 prefactor

Do not accept 3/2 as a “baryon factor.”

Possible derivational sources worth testing:
- ratio of numbers of active transverse modes after constraints;
- degeneracy ratio of stationary Hessian spectra;
- three linked components divided by a two-sided/orientation degeneracy;
- quotient of carrier multiplicities after closure.

The cleanest test is spectral:

Let `K_U` and `K_C3` be quadratic fluctuation operators around the two stationary solutions. Compute non-zero mode spectra after gauge/parameterization zero modes are removed.

Ask whether

`det'(K_C3)/det'(K_U)`

or the relevant lowest inertial eigenvalue ratio generates a natural multiplicity of 3/2.

If not, drop 3/2.

---

## 6. NEW PLAYGROUND D — ᚼ as a renormalization/coarse-graining operator

Instead of a fitted `B_stable`, let ᚼ act on the geometric state:

`X_(n+1) = ᚼ[X_n]`.

For any observable geometric response `Q`, define

`Q_(n+1) = R_ᚼ(Q_n)`.

Then a “renormalized projection constant” would only be legitimate if B is an eigen-observable or fixed point:

`R_ᚼ(B*) = B*`.

This suggests a real route to the old B0 → Bstable idea:

1. start from B0 purely geometrically;
2. apply the actual helix→superhelix transformation;
3. compute the induced projection/response map;
4. look for a stable fixed point B*;
5. **do not use mass data in this computation**.

If B* happens to land near an old value, that is interesting. If not, the old Bstable should be retired.

---

## 7. NEW PLAYGROUND E — replace “mass formula” with a generalized Rayleigh quotient

For perturbation `eta(lambda)` around a stationary worldtube `H0`, let

`delta^2 S = <eta, K eta>`.

Let `W` measure the imposed observable displacement/acceleration mode. Define

`m_geom[eta] = <eta, K eta> / <eta, W eta>`.

The physical inertial mode is the minimum admissible quotient:

`m_eff = min_eta m_geom[eta]`.

Advantages:
- mass becomes an eigenvalue problem;
- topology changes admissible perturbations and boundary conditions;
- finite core and timesheet coupling enter K;
- no particle mass is supplied as input;
- ratios can be dimensionless even before the absolute scale is fixed.

This may be the cleanest mathematical replacement for “projective resistance.”

---

## 8. External mathematics worth importing

Use as mathematical machinery, not evidence for SAT/H(s)H:

- Kirchhoff elastic rods / Cosserat rods: finite-core curves with bending and twist energies.
- Euler elastica: variational curve mechanics and stability spectra.
- Frenet–Serret / Bishop frames: curvature/torsion without coordinate artifacts.
- Călugăreanu–White–Fuller relation `Lk = Tw + Wr`: useful for separating braid/link closure from local twist.
- Floquet theory: stability of periodic/helical stationary solutions.
- Rayleigh–Ritz / Sturm–Liouville methods: extracting response eigenvalues.
- SO(4) double rotations: correct 4D rotation grammar for ᚼ.
- Homotopy/link invariants: admissible topological sectors.
- Renormalization/coarse-graining ideas: only as mathematics for iterated ᚼ maps, not as permission to fit B.

---

## 9. First computational experiments

### Experiment 1 — old formula autopsy
Sweep B around B0. Plot `3/(2B^5)`; mark B0 and any independently derived B candidates. No target-fitting during derivation.

### Experiment 2 — single helix Hessian
Use
`H(s) = (R cos ks, R sin ks, P s, T(s))`
in a simplified 3+1 embedding. Build bending + twist + q coupling action. Find stationary R,P and compute Hessian eigenvalues.

### Experiment 3 — ᚼ iteration
Define a concrete helix→superhelix transform and numerically track:
`B_n, kappa_n, omega_n, q_n, m_eff,n`.
Look for fixed points and invariants.

### Experiment 4 — one vs three
Construct a single finite-core helix and a symmetric three-component linked configuration with identical primitive parameters. Minimize both under the same action and compare response eigenvalues. Do not call them electron/proton until afterward.

### Experiment 5 — exponent detector
Numerically perturb primitive projection parameter b and estimate
`p_eff = - d ln R / d ln b`.
If the old law is structurally real, a regime near `p_eff = 5` should emerge without imposing exponent 5.

---

## 10. Current verdict

The old mass-ratio mathematics is worth promoting as a **failed-but-informative scaffold**, not as a recovered successful derivation.

The key historical formula survives as a hypothesis:
`mu ~ 3/(2B^5)`.

But the archive itself contains the diagnosis: the exponent 5 and prefactor 3/2 were still awaiting an eigenvalue/action derivation, and later bridge/elastic/renormalized-B repairs risk target fitting.

The most promising salvage is to reinterpret:
- **mass/projective resistance → second variation / inertial Hessian eigenvalue**;
- **theta4 → invariant tangent-timesheet misalignment q = 1-(T·u)^2**;
- **Bstable → possible fixed point of ᚼ, to be derived without metrology**;
- **B^5 → possible product of independent geometric response factors, to be counted rather than assumed**;
- **3/2 → possible spectral/topological multiplicity, to be derived or discarded**.

That gives the old machine a fair chance to regenerate its own formula. If it cannot, H(s)H gets a cleaner mass sector anyway.
