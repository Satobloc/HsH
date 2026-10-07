# Ravel sandbox — finite-rod mode memory

**Status:** new sandbox conjecture and solver test, not canonical H(s)H. Historical labels, fitted particle assignments, and archived numerical constants were not used as targets.

## Result in one sentence

Replacing an imposed relaxation time by the smallest finite-core constitutive law produces a **positive torsional mode spectrum** whose ordered-frame memory is

\[
r(\Delta)=\sum_{n\ge0}w_n e^{-\lambda_n\Delta},\qquad
\lambda_n={K+C(n\pi/L)^2\over\gamma},\qquad
M(\Delta)=2r-r^2+O(\varepsilon),
\]

so a length-dependent drift of the recovered logarithmic rate is the clean discriminator between finite-worldtube mechanics and a hand-set single decay time.

## Exact reading record

### Controlling onboarding and routing

- `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — read in full; followed its direct-file and provenance workflow.
- `Satobloc/HsH/WORKSPACES/COMMON/REFERENCE_DESK/README.md` — read as current routing guidance.
- `Satobloc/HSH_RESOURCES/!_HSH_RESOURCES_INDEX.md`, `indexes/ai_source_index/HSH_TOOLKIT.md`, `HQ/TOOL_CHEST.md`, and `HQ/THE_WAR_ROOM/DECLARATION.txt` — reviewed for tools and source routing only. No quarantined theory was promoted.

### SAT archive source

- [`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UNIT CELL LAGRANGIANS.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UNIT%20CELL%20LAGRANGIANS.txt) — read sequentially, lines 1–1430 (entire file; blob `8adfdc9e5fcd8474c69f1dded679eda5d4434608`). Extracted only: the historical kinetic/overlap/resistance/rotation decomposition; the later curvature-stiffness term (C_p\|\partial_s^2r_p\|^2); and the internal correction that rotation of a perfectly isotropic sphere is gauge unless internal structure, a tracked surface field, phase, or orientation-dependent intersection makes it observable. Lattice counts, particle mappings, mass fits, and historical constants remain quarantined.

### Current H(s)H source

- [`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/F1 WHIRLIGIGG.txt`](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/F1%20WHIRLIGIGG.txt) — read lines 1–169 (entire file; blob `dcb0b820600b4b43593e4a225562efb724a2a43d`). Treated as generated/quarantined. Retained only as later cross-pollination: (R\in SO(4)), (\Omega=R'R^{-1}), and a bending/restoring operational Lagrangian. Its claimed closure, fixed constants, mass/mixing/cosmology claims, and lattice identifications do not control this build.

## 1. Source facts

1. The archive explicitly introduces curvature stiffness in an intersection Lagrangian.
2. The same archive warns that bare rotation of an isotropic sphere has no observable content; orientation requires anisotropy or an internal field.
3. The current H(s)H conversation contains an SO(4) frame language and a fourth-order bending/restoring toy action, but packages them with strong unsupported closure claims. Only the formal fragments are usable, and only under quarantine.

## 2. Independent construction

Take (X(s,t)\in\mathfrak{so}(4)) to be the small angular/torsional displacement of the transported time-normal frame along a finite worldtube segment (0\le s\le L). The smallest overdamped local law with elastic transport, local restoration, and a torque source is

\[
\gamma\,\partial_tX=C\,\partial_s^2X-KX+T(s,t),
\qquad \partial_sX|_{0,L}=0.
\]

Here (C>0) is torsional stiffness, (K>0) is local pinning/restoration, and (\gamma>0) is drag. This is a sandbox constitutive law, not a sourced H(s)H equation.

For free ends, expand in Neumann modes

\[
\phi_0=L^{-1/2},\qquad
\phi_n=\sqrt{2/L}\cos(n\pi s/L),
\]

which gives

\[
X(s,t)=\sum_n a_n(t)\phi_n(s),\qquad
\dot a_n=-\lambda_na_n+T_n/\gamma,
\]

\[
\boxed{\lambda_n={K+C(n\pi/L)^2\over\gamma}}.
\]

A localized actuation and collocated finite-width resolving surface give nonnegative overlaps. For a Gaussian width (\sigma), the normalized weights used in the solver were

\[
w_n={\phi_n(s_0)^2e^{-(n\pi\sigma/L)^2}\over
\sum_m\phi_m(s_0)^2e^{-(m\pi\sigma/L)^2}},
\qquad \sum_nw_n=1.
\]

Therefore the fraction of the first angular kick retained when the second arrives after delay (\Delta) is not generically one exponential:

\[
\boxed{r(\Delta)=\sum_nw_ne^{-\lambda_n\Delta}}.
\]

### Ordered SO(4) frame residue

Let the two weak kicks be (A=e^{\varepsilon J_{01}}) and (B=e^{\varepsilon J_{02}}). Before comparing their order, minimally rotate the two final frames so their transported time normals coincide. Subtract the fully forgotten (r=0) residue. The surviving transverse holonomy is

\[
\chi_{\rm mem}=\varepsilon^2\left(r-\frac12r^2\right)+O(\varepsilon^3).
\]

Normalizing to its zero-delay value yields

\[
\boxed{M(\Delta)=2r(\Delta)-r(\Delta)^2+O(\varepsilon)}.
\]

Thus an observed memory curve can be inverted without fitting a decay model:

\[
\boxed{r_{\rm obs}=1-\sqrt{1-M}}.
\]

The diagnostic rate

\[
\Lambda_{\rm eff}(\Delta)=-{d\over d\Delta}\ln r_{\rm obs}
=\frac{\sum_nw_n\lambda_ne^{-\lambda_n\Delta}}
{\sum_nw_ne^{-\lambda_n\Delta}}
\]

is constant for a single mode but drifts downward for a genuine spectrum, approaching (K/\gamma) at late delay.

## 3. Numerical solver result

The reproducible calculation used (C=0.060), (K=0.250), (\gamma=1), 80 modes, (s_0=0.31L), (\sigma=0.07L), and a small kick (\varepsilon=0.08). These are dimensionless sandbox values chosen to test structure, not fits to nature.

| Segment | (\Lambda_{\rm eff}(0)) | (\Lambda_{\rm eff}(1)) | (\Lambda_{\rm eff}(4)) | late limit | RMS error of one-mode memory fit | max exact-SO(4) vs reduced-law error |
|---|---:|---:|---:|---:|---:|---:|
| (L=1.0) | 6.372 | 0.455 | 0.282 | 0.250 | 0.155 | 0.00118 |
| (L=1.6) | 2.642 | 0.572 | 0.299 | 0.250 | 0.121 | 0.00118 |

For example, the (n=1) rate moves from (0.8422) at (L=1) to (0.4813) at (L=1.6), precisely the predicted (K+C\pi^2/L^2) scaling. The common (n=0) rate remains (0.25=K/\gamma). The one-mode fit misses the shoulder and late tail substantially, while direct matrix exponentials and endpoint-normal matching validate (M=2r-r^2) to roughly (1.2\times10^{-3}).

![Finite torsional core mode-spectrum test](finite_rod_so4_memory.svg)

## 4. SAT → H(s)H translation

The archive's curvature penalty becomes finite-worldtube torsional transport; its resistance term becomes (\gamma\); and its warning about isotropic rotation becomes an observability condition. In current language, matter does not supply a second shell. It locally rotates the time-normal frame, and a finite, structured core transports and relaxes that rotation through internal modes. An intersection/instantiation event samples the residual frame at its resolving surface. Particle-like persistence is therefore a constitutive memory of a finite worldtube, not an extra trajectory or hidden readout layer.

Only after this derivation does the quarantined 7 October H(s)H fragment become useful: its (SO(4)) angular velocity and bending/restoring terms are compatible with the independent finite-rod law, but do not establish it.

## 5. Tight discriminator and proposed test

1. Apply two weak noncommuting angular perturbations separated by (\Delta); compare AB with BA after matching the final transported time normal.
2. Subtract the large-(\Delta) residue and normalize to (M(0)=1).
3. Recover (r_{\rm obs}=1-\sqrt{1-M}) pointwise.
4. Estimate (\Lambda_{\rm eff}=-d\ln r_{\rm obs}/d\Delta) with uncertainty propagation.
5. Repeat for at least two controlled effective core lengths (L).

**Finite-rod prediction:** the fitted modal rates satisfy

\[
\lambda_n(L)-\lambda_0={C\pi^2n^2\over\gamma L^2},
\]

while (\lambda_0=K/\gamma) is length independent. A global fit across lengths is much tighter than independently fitting sums of exponentials.

## 6. Failure conditions

- **No exposed anisotropy/internal phase:** orientation is gauge and the proposed frame memory is unobservable.
- **Only the uniform mode couples:** (w_{n>0}\simeq0), so the model collapses to the previous single-time law and cannot justify a finite-mode claim.
- **Wrong spectral scaling:** if recovered poles do not follow (K+C(n\pi/L)^2), or higher-mode gaps fail the (L^{-2}) test, this finite-rod architecture fails.
- **Resolver dependence:** if inferred pole locations move when only resolving width changes, rather than weights changing at fixed poles, the signal is likely acquisition geometry rather than constitutive dynamics.
- **Nonpositive or oscillatory kernel:** the overdamped model is inadequate; inertia, antisymmetric transport, or active gain would have to be introduced explicitly and re-tested.

## 7. Durable checkpoint

The smallest productive continuation is now clear: derive the same kernel from a covariant worldtube action with a transported (SO(4)) connection, then test whether finite inertia splits the purely decaying poles into underdamped torsional pairs without destroying endpoint-normal matching.

Artifacts:

- `WORKSPACES/RAVEL/SANDBOX_2026-10-07_FINITE_ROD_MODE_MEMORY.md`
- `WORKSPACES/RAVEL/CODE/finite_rod_so4_memory.py`
- `WORKSPACES/RAVEL/DATA/finite_rod_so4_memory.json`
- `WORKSPACES/RAVEL/FIGURES/finite_rod_so4_memory.svg`

