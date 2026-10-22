# STAR 006 | Kelvin local-induction dispersion versus SAT.O D2: unavoidable dynamic branch

**22 October 2026 | Meridian | executable SANDBOX | not a physical SAT spectrum.**

## Authority and provenance
Read current BEDROCK.md (operative medium, literal spin, precession and 4DHH; archive second only to BEDROCK) and confirmed shared Mersearch request still occupied by Orson's 2026-10-21 search. Bounded exact primary read: SAT archive `SAT O Derivations/SAT_D2_MODE_EXPANSION.txt`; surveyed older `HsH Classic Run.txt` and `H(s)H CLASSIC.txt`, both NotebookLM-style synthesis (not primary derivation), and previous Meridian stars 003–005. No completed Mersearch invocation, Kelvin-medium parameter recovery, or full Kerr/ER solution is claimed.

## Contrasting *existing* dynamical controls, not proposing new physics
SATO O1/D2 specifies the linear second-order-in-time string equation arising from a tension kernel \(K=-T\partial_z^2\):
\[
\omega_{\rm D2}(k)=|k|\sqrt{T/\mu_L},
\]
where \(\mu_L\) must be lineal inertial mass density for the standard string equation to be dimensionally coherent (the old manuscript labels it m without adequate type declaration). This is a historically proposed dynamic law, not derived from the finite Kerr tube.

Independently, the **standard classical ideal-fluid local-induction approximation (LIA)** to a slender vortex filament takes \(\partial_t\mathbf X=\nu\,\mathbf X_s\times\mathbf X_{ss}\) in arclength gauge; \(\nu\) has units length²/time, and for specified fluid vortex circulation \(\kappa\), core radius \(a_0\), and outer cutoff \(L\), usually \(\nu\sim \kappa\ln(L/a_0)/(4\pi)\), with approximation- and geometry-dependent corrections. This is standard ideal-fluid comparator, not a new SAT law and not a statement that the SAT responsive medium must adopt LIA. LIA itself is an approximation; full Biot–Savart and a finite core may change its coefficients and mode dependence.

Linearize a nearly straight filament \(\mathbf X(z,t)=(\epsilon x(z,t),\epsilon y(z,t),z)\), \(\epsilon\ll1\). At leading order:
\[
\partial_t x=-\nu\partial_z^2y,\qquad \partial_t y=\nu\partial_z^2x.
\]
Combine \(w=x+iy\):
\[
\boxed{\partial_t w=i\nu\partial_z^2w.}
\]
For \(w=e^{i(kz-\omega t)}\):
\[
\boxed{\omega_{\rm Kelvin}(k)=\nu k^2}
\]
with a sign set by orientation/circulation conventions. A circular domain of circumference L_f has \(k_n=2\pi n/L_f\) and local-induction ratio \(|\omega_n/\omega_1|=n^2\) for fixed \(\nu\), whereas the D2 tension-string equation gives \(|\omega_n/\omega_1|=|n|\) for its single-speed model. Therefore the same geometrical mode index does not make the two dynamics equivalent.

**Do not misreport this as an exact Kerr-ring Kelvin frequency:** the straight-vortex LIA was linearized, not an equilibrium ring plus its Kelvin modes; ring curvature, self-induced translation, boundaries, nonlinearities, cutoff/log(k) dependence, and 4D codimension all matter.

## Exact executable check
Ran `/mnt/data/star006_kelvin_gate.py` using real Python+SymPy. Cross product:
`X_z × X_zz = (-eps*y_zz, eps*x_zz, O(eps²))`, symbolic residual on a helical Fourier mode:
`i*(k²*nu-omega)*exp(i*(k*z-omega*t))`, so \(\omega=\nu k^2\). Explicit limit: n=2 yields ratio 4 under fixed-coefficient LIA and 2 under D2. Independent earlier oblate-laplacian `l=1` eigenvalue splitting remains \(-4(a/r)^2/(5r^2)\) to first order; that is a *spatial* eigenvalue, not the Kelvin dispersion.

## Fail-rigid assessment and actual next construction
The inherited Kelvin-like *responsive medium* is mandatory as a hypothesis, but we must recover whether the actual historic SAT medium was line-tension dominated, vortex-LIA dominated, a combined system derived from geometry, or something else already recorded and tested. Importing \(\nu\), T or \(\mu_L\) as a free adjustment would violate BEDROCK.

Kerr core is currently an inherited **finite geometry** constraint, not a proof that an electron is a standard classical Kerr horizon (indeed its Kerr–Newman parameters are overextreme). The current 3D LIA comparator cannot be transplanted unchanged into a codimension-three 1D line in R4: the relevant transverse topology and induced transport must be specified. Reconcile existing SAT HsH codimension-two sheet circulation vs 1D line and the starred oblate-shell section without inventing a new physical law.

Necessary recovery: locate the strongest primary Kelvin / ideal-fluid / 4DHH transport equation and circulation quantization from SAT/HSH source files, check its dimensions, reproduce its linearization at a finite Kerr-related core, calculate its boundary spectrum and test with D2 / geometry 003–005. Distinguish fluid flow velocities from timesheet normals (Frobenius) and cross-check angular momentum and electromagnetic charge current before labeling physical spectrum.

**Result:** rigorous conditional non-equivalence of linear string and Kelvin-LIA *dynamical mode laws*; this is a concrete branch discriminator, not an experimentally tested theory result.

## Nathan Direct correction, 2026-10-22: established physics is the input, not another SAT obligation
**Mandatory interpretive correction:** Many items called 'must be established' in earlier STAR reports are **already established within their appropriate domains in ordinary physics** (Minkowski kinematics, relativistic wave propagation, classical vortex transport in its regime, angular-momentum/magnetic-moment relationships, Einstein-Maxwell/Kerr geometry, covariant field identities, etc.). SAT/H(s)H should **map those known relationships into the common four-dimensional construction**, not pretend to re-prove or re-invent them from scratch. The actual research obligation is the **single explicit map** (with matching dimensions, variables, physical domains, topology, observational readouts, and composition/closure), plus any genuine residual assumptions. Separate (A) established-domain facts carried unchanged, (B) their geometric representation in 4DHH, (C) remaining SAT-specific relationships that need derivation, and (D) predictions/closures that require testing. The Kelvin-vortex LIA vs original D2 comparison is not license to select a new physical dispersion: examine whether these are different observational reductions of the same existing 4D dynamics, including scale and regime distinctions. This correction constrains STAR 003–006 interpretations and future calculations.
