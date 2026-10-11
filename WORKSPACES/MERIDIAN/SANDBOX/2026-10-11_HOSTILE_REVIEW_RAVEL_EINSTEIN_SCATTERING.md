# Meridian | Hostile review for HsH issue #20 | 11 October 2026

**Decision: MAJOR REVISION** as a standard-GR mathematical control; **REJECT** any presentation as a derived, uniquely SAT/H(s)H, observationally established finite-core gravity theory.

## Scope and provenance
Reviewed Ravel's 8 Oct SANDBOXED COVARIANT_SCATTERING_METRIC_AUDIT.md, the 9 Oct ACTION_FIRST_SHEATH_SCATTERING.md and STRAIGHT_VACUUM_COILING_GATE.md, and relevant original historical Einstein/Minkowski sections in the archived 414,356-character PRINCIP RELAT translation, especially Einstein's 1916 §9, 'Equation of the geodetic line.' I inspected the specified portions of the historical collection, not every page of that anthology. No forbidden Hypothesis H or direct Schreiber material was consulted.

The comparator's strongest derivation begins: **"As the ‘line element’ ds is a definite magnitude independent of the co-ordinate system"**; the translated Einstein §9 then gives the coordinate-independent geodesic principle **δ∫ds=0** in Eq (20), and derives geodesic equations by variation. That is a general covariant law. Ravel instead specifies a spherical GR metric and computes a bounded set of its consequences. It is a useful application, not a comparable derivation of a foundational law.

## Independent algebra and numerics

1. **Metric and source.** Ravel's ansatz A(r)=1-2m(r)/r, m(r)=M r³/(r²+ell²)^(3/2) has m'=3M ell²r²/(r²+ell²)^(5/2). The Einstein source rho=m'/(4πr²), radial pressure p_r=-rho, tangential p_t=-m''/(8πr) agrees with his Eq (3). This is anisotropic matter throughout the exterior, not vacuum Schwarzschild or derived SAT matter.

2. **Exact null orbit.** In u=1/r, A(u)=1-2Mu/(1+ell²u²)^(3/2). Null conservation gives (du/dphi)²=1/b²-A(u)u². Differentiation yields u''+u=3Mu²/(1+ell²u²)^(5/2), exactly Ravel Eq (5). The calculation is GR, not a QFT scattering amplitude.

3. **Weak-angle.** First-order M/b perturbation gives alpha = (3M/b) integral_{-π/2}^{π/2} [cos³(phi)/(1+(ell/b)²cos²(phi))^(5/2)] dphi = (4M/b)/(1+(ell/b)²)^2. For ell/M=0.2 and b/M=100, independent SciPy quadrature gives 0.03999968000191998 rad; formula gives 0.039999680001919995 rad. Difference -1.39e-17 rad. Hence leading fractional change -2(ell/b)² at fixed impact parameter. A softened scalar potential alone does not uniquely select this coefficient.

4. **Fixed-angle cross section.** Differentiating the first-PM deflection and comparing classical rays at the SAME observed alpha yields ratio 1/[(1+q)^3(1-3q)], q=(ell/b)², as Ravel Eq (7). Expansion 1+6q²+O(q³) is correct. At q=4e-6 the relative change is 9.6000985e-11. This is a geometric ray Jacobian under the monotone first-PM approximation, not quantum cross section or an observed photon-ring signal.

5. **Decisive independent physical-source defect.** Ravel's required tangential stress satisfies p_t/rho = (3r²-2ell²)/[2(r²+ell²)]. At r=4ell it is 23/17=1.352941>1. For ell=.2M at r=4M=20ell, p_t/rho=1.4937656. Thus the **dominant energy condition fails for r>2ell**, extending well outside the compact object. Weak energy condition is not thereby violated. The stipulated metric remains valid mathematics, but an ordinary causal positive-energy filament/sheath source does NOT follow. This failure is more serious than a cosmetic difference from the historical scalar-potential heuristic.

6. **Horizon and capture.** Maximizing 2m(r)/r at r=sqrt(2)ell yields horizon iff ell/M<=4/(3sqrt(3))=0.76980036, in accord with Ravel. Null photon circular-orbit equation (r²+ell²)^(5/2)=3Mr⁴ is likewise correct for the ansatz. No Kerr rotation or actual particle exclusion is derived.

7. **Action-first shell extension.** This is a distinct external GR comparison action with four-form and fluid membrane, not a SAT primitive nor a derivation of the original m(r). For the quoted outer branch rho_v=.01, A_s=.01, B_s=.1, R=1.6098793999 and M=.5992018936, independent substitution gives first Israel-junction residual about 5.5e-11 and pressure residual about 2.5e-12 (with the printed rounded values). Fixed-M numerical second derivative V''≈+1.4010517; inner branch V''≈-1.9906051. This checks radial-potential curvature, **not** angular, finite-thickness, spinning, radiative, or global stability. The outer radius R/M=2.686706 lies outside 2M and inside 3M. Rays turning outside the shell have EXACTLY Schwarzschild propagation at fixed mass. A 1e-13 agreement for such rays is therefore guaranteed by the stipulated GR exterior, not evidence for SAT.

## Comparative rubric (severity-aware)

1. **Correctness/general validity:** Einstein/Minkowski stronger as general invariant metric and geodesic theory. Ravel's narrower null and shell computations largely pass controlled checks.
2. **Predictive scope:** Einstein/Minkowski stronger. Ravel stipulates a free ell and later extra membrane/field parameters; no new independently fixed observables.
3. **Source/author provenance:** Einstein/Minkowski derivations have their own primary mathematical and historical record. Ravel properly credits ordinary GR and explicitly describes his model as sandbox.
4. **New information:** Ravel adds a useful controlled benchmark (coefficient audit and fixed-angle cancellation) but no unique SAT matter law; novelty relative to all GR compact-body literature not established.
5. **Empirical testing:** Einstein/Minkowski stronger. Ravel has no source-backed measurement fit or differentiating held-out test, and physically different interiors share identical exteriors.
6. **Explanatory economy:** Einstein/Minkowski stronger at foundations. Four-form, membrane EOS, or m(r) must not be smuggled in as SAT-native primitives.
7. **Reproducibility/clarity for the narrow task:** Ravel's numerical fixtures and declared approximations are readily checked; this merits retaining the technical note, not promoting the physical claim.

**Overall classification:** the historical comparator is stronger as a foundation of physics. Ravel's candidate is useful as a tightly bounded GR mathematical control, **not a competing physical theory**.

## Severity-ranked repair requests

**CRITICAL for a theory claim:** Obtain a SAT-internal worldline/worldtube constitutive derivation and a separately justified map to metric stress. Do not infer Minkowski→Lorentzian emergence from use of a Lorentzian GR metric.

**HIGH:** Put exterior violation of the dominant energy condition beside the metric's stress tensor. If a standard causal material is demanded, replace the metric or demonstrate a physically admissible source.

**HIGH:** The later shell's exact Schwarzschild exterior makes exterior ray-scattering data non-identifying. Derive boundary impedance/response modes or other held-out observables that discriminate material models at fixed ADM mass.

**HIGH:** Radial V''>0 is not full membrane stability. Compute nonspherical perturbations, self-consistent backreaction, finite-thickness regularization and Kerr/rotational extensions before a physical compact-object claim.

**MEDIUM:** Keep the historical SAT coil scale ell_f, Kerr rotation scale a_K, HsH core thickness and GR softening ell as four separate parameters until derivation supplies a relation.

**MEDIUM:** Do not call classical null-geodesic deflection a QFT scattering amplitude or claim the metric follows from SAT without explicit field equations.

## Rewritten abstract acceptable for technical circulation

"We examine a one-parameter regular spherical metric within standard Lorentzian Einstein gravity as a controlled comparison for previously proposed SAT scattering heuristics. We derive its anisotropic source, classical null orbit, first-post-Minkowskian deflection, and capture threshold. The fixed-angle ray Jacobian cancels the leading softening correction. The required material violates the dominant energy condition outside r=2ell, and the metric has no demonstrated SAT derivation. An independent four-form/thin-shell GR control admits a radially stable benchmark with exactly Schwarzschild exterior trajectories, illustrating why external ray scattering cannot identify internal worldtube microphysics."

## Killing test and return to SAT

Numerical internal falsifier: for ell/M=.2, b/M=100 the 1PM angle must be 0.03999968000192 rad on the prescribed null metric. Passing this is only a mathematical self-check. Physical failure criterion: an asserted ordinary DEC-satisfying source reproducing Ravel Eq (3) at r=4M when ell=.2M would require p_t/rho=1.4937656>1 and is contradictory.

Next: straight timelike SAT Minkowski worldtube, explicitly sourced coiling/contact onset, conservative timesheet readout. Keep GR shell and Kerr comparisons external until a genuine internal construction maps onto them.

**Reviewer:** Meridian ◈
