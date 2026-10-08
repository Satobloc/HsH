# SANDBOXED — Ravel: From the 2025 SAT scattering archive to a covariant black-hole scattering benchmark
**Date:** 2026-10-08 · **Status:** candidate geometry / independently computed Einstein-GR benchmark · **not** SAT derivation, not observational detection · **Revision:** 2 after internal hostile pass

## Abstract
The June–August 2025 SAT scattering archives contain a normalized two-history toy sum (1+exp[-Tell_f^2]) and a phenomenological short-range gravitational softening. Neither supplies a momentum-dependent, unitary physical S-matrix or a completed covariant metric. We test one minimal, **explicitly assumed** Einstein-GR completion, compute its exact null circular-orbit capture threshold and its first-post-Minkowskian deflection, and find an independently derived mismatch with the archived lensing heuristic. In the selected completion, weak ray deflection changes at order ((ell/b)^2), whereas the differential scattering cross-section **at fixed small angle** first changes at order ((ell/b)^4); thus selecting the wrong observable conceals the leading core signal. No uniquely SAT-specific physical correction has been demonstrated.

## Sources and provenance
Project onboarding freshly inspected: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`; accompanying Common onboarding, symbol/citation/workflow/Reference Desk surfaces. Reference Desk and HSH_RESOURCES `HQ/THE_WAR_ROOM/DECLARATION.txt` overview-read; `indexes/ai_source_index/HSH_TOOLKIT.md`, `HQ/TOOL_CHEST.md`, `info/TOOLKIT_DIGESTION.md` triaged. Declaration's linked resources treated as routing only; **PRIOR_ART not entered**. GitHub exact-file reads and bounded code search were used after inspecting repo-local `tools/search_archive_content.py` (Mercer_Searcher). The Mercer search engine itself was not run across a local three-repository corpus because such a corpus was not materialized in this runtime. No Mersearch-completeness claim.

**Substantively read historical SAT archive, exact paths:**
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/2025 scatter amp.txt.txt`, contiguous first 600 lines returned (28,300 characters): original toy layers, code assumptions, and self-audit. Its dimensional check explicitly questions an inconsistency and still marks “Pass.”
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SATO-scattering.txt`, entire 3,374-character technical draft: topological transition proposal, schematic “S-matrix”.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2025-8-24 STATUS OVERVIEW.txt`, first 250 lines (11,232 characters): `1+e^{-T ell_f²}`, alpha_top=1, admits momentum-carrying legs missing and suggests Plummer potential.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/🧱🪢BLACK HOLES.txt`, first 400 lines (23,691 characters): GR black-hole thermodynamics plus proposed flux microphysics; used solely as a historical comparator.

**Substantively read current HsH September-30 dump, exact paths:**
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SDFA.txt`, first 500 lines, full 11,232-character SAT status import.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ADFA.txt`, first 650 lines, full 9,650-character list of candidate softening/lensing benchmarks and heuristic coefficients.

Use the project `⟦TYPE:KEY·LOC⟧` citation convention in downstream publications; these paths and coverage provide resolvable primary anchors; no source summary is promoted to mathematical authority.

## Audit gate 1: recover actual scattering content
The 2025 model uses an Euclidean bending-weight (exp[-(T/2)int (y'')^2 ds]) in a fixed-endpoint planar small-slope configuration, and an assigned reconnection vertex (exp[-Tell_f^2]alpha_{m top}). A two-channel Monte Carlo reproduces the *assigned* sum (1+exp[-Tell_f^2]) when (alpha_{m top}=1). This is an algorithm check, not a physical 2-to-2 graviton amplitude: it lacks external momenta, Lorentz-invariant state normalization, analytic continuation/phase, optical theorem, and a proven UV limit of quantum observables. The early self-audit erroneously calls the bending-weight dimensions correct even while noting: (int(y'')^2 ds) has dimensions L^{-1}, so its prefactor has dimensions L if the exponent is dimensionless. The separate vertex exponent (Tell_f^2) requires (T) dimensions L^{-2}. A *single* unqualified T cannot perform both roles. Namespace them as LOCAL bending length and LOCAL reconnection inverse-area coefficient; their connection requires derivation.

The archived candidate static potential (Phi=-GM/sqrt{r^2+ell_f^2}) and lensing heuristic ((1+ell_f^2/b^2)^{-3/2}) were not proven from the scattering sum. The historical `ell_f` can describe a loop or resolved coil rather than a material core radius; **do not identify it with the test scale `ell` below**.

## Local notation and standard 4D baseline
Use geometric units (G=c=1); (M) is the geometrized asymptotic mass/length, (r) is **areal radius**, (ell>0) is a LOCAL hypothetical regularization scale, (b=L/E) is asymptotic impact parameter, (alpha) is standard null deflection, and (arphi) azimuth. (ell) has no assigned particle-scale value. Metric signature ((-+++)); standard Einstein field equations (G_{mu
u}=8pi T_{mu
u}).

A spherical static Lorentzian line element (not a default deduction of SAT's preferred 4D Euclidean framing):
[
ds^2=-A(r)dt^2+B(r)dr^2+r^2(dartheta^2+sin^2artheta darphi^2).
]
A candidate **covariant completion** uses
[
B=A^{-1},qquad A(r)=1-rac{2m(r)}r,qquad
m(r)=Mrac{r^3}{(r^2+ell^2)^{3/2}}.
	ag{1}
]
This is a standard Einstein-GR class of smooth anisotropic source metrics; it is not a prediction extracted from the earlier SAT curvature action. It reduces to exact Schwarzschild at (ell=0) for (r>0).

The Einstein equations determine—not assume—the required anisotropic stresses:
[
ho=rac{3Mell^2}{4pi(r^2+ell^2)^{5/2}},quad
p_r=-ho,quad
p_t=rac{3Mell^2(3r^2-2ell^2)}{8pi(r^2+ell^2)^{7/2}}.
	ag{2}
]
They have nonzero extent outside the horizon, so this is **not** a vacuum modification to Schwarzschild. It may equally be an ordinary effective matter profile. The microscopic origin of these pressures is an unsolved constitutive problem. (ho+p_t=15Mell^2r^2/[8pi(r^2+ell^2)^{7/2}]geq0); the weak energy condition is satisfied for this idealized source. Central Kretschmann scalar is (K(0)=96M^2/ell^6), finite for (ell>0).

### Nontrivial failure: finite Newton potential does not imply finite curvature
If one instead inserts the archive's exact Plummer potential into (A_{m naive}=1-2M/sqrt{r^2+ell^2}) and **also** sets (B=A_{m naive}^{-1}) in areal-radius coordinates, the curvature diverges:
[
K_{m naive}sim rac{16M^2}{ell^2r^4},quad r	o0.
]
This is a precise counterexample to the idea that finite (Phi(0)) by itself resolves a black-hole curvature singularity. The two metrics have different (1/r^3) far-field corrections ((+3Mell^2/r^3) versus (+Mell^2/r^3)). The full spacetime and its stress must be specified.

## Covariant null geodesics and weak-angle scattering
For (1), conservation gives (E=Adot t), (L=r^2dotarphi), (b=L/E) and null radial equation
[
dot r^2=E^2-rac{L^2A(r)}{r^2}.
	ag{3}
]
With (u=1/r), differentiation gives the **exact** orbit equation
[
u''(arphi)+u=rac{3Mu^2}{(1+ell^2u^2)^{5/2}}.
	ag{4}
]
First order in (M/b), insert (u_0=cosarphi/b) on ([-pi/2,pi/2]). The outgoing angular shift is
[
alpha_{m 1PM}(b)=rac{3M}{b}int_{-pi/2}^{pi/2}
rac{cos^3arphi,darphi}{[1+(ell/b)^2cos^2arphi]^{5/2}}
=oxed{rac{4M}{b}left(1+rac{ell^2}{b^2}ight)^{-2}}.
	ag{5}
]
The integral is exact in (ell/b) at first post-Minkowskian order; (alpha_{m GR,1PM}=4M/b). Its leading fractional correction is (-2(ell/b)^2), rather than the archived (-3(ell/b)^2/2). This **does not prove the archive formula wrong for every possible model**; it proves that its coefficient cannot be asserted without specifying covariant field content.

Numerical high-precision quadrature matches the closed form at (ell/M=0.2,b/M=1000):
- quadrature (0.003999999680000019199998976000051199997542)
- analytic (0.003999999680000019199998976000051199997542)
- archived heuristic (0.003999999760000011999999440000025199998891)

An independent exact null-geodesic integral (not 1PM) gives at (ell/M=0.2):
- (b/M=100:) core (0.04122219338183593), Schwarzschild (0.04122253974927365), relative (-8.40238	imes10^{-6}); first-order predicts (-7.99995	imes10^{-6}).
- (b/M=1000:) core (0.00401182348743593), Schwarzschild (0.00401182380992536), relative (-8.03847	imes10^{-8}); first-order predicts (-7.99999952	imes10^{-8}).
The residual is consistent with higher-order (M/b) terms; all results are calculations, not observations.

### An observable-selection surprise: ray cross-section suppression
For small-angle classical ray scattering, (dsigma/dOmega=(b/sinalpha)|db/dalpha|). Write (q=ell^2/b^2) and use (5). At **fixed observed small angle** the differential cross-section ratio is
[
rac{(dsigma/dOmega)_{m core}}{(dsigma/dOmega)_{m GR,1PM}}
=rac{1}{(1+q)^3(1-3q)}
=1+6q^2+O(q^3),
	ag{6}
]
on the monotone weak-angle branch, with (qll1), (alphall1). Crucially the order (q) terms cancel in the Jacobian. At (ell/M=0.2,b/M=100), deflection differs by (-7.99995	imes10^{-6}), whereas the *fixed-angle ray differential cross-section* differs by only (+9.60	imes10^{-11}) in the 1PM model. This is a classical null-ray result, **not** a quantum S-matrix or measured brightness. It gives a precise rule: use deflection at independently controlled (b) before attempting to infer core properties from uncalibrated flux.

## Strong-field photon scattering / capture
A circular null orbit obeys (rA'-2A=0), giving exactly
[
(r_{m ph}^2+ell^2)^{5/2}=3Mr_{m ph}^4,qquad
b_c=rac{r_{m ph}}{sqrt{A(r_{m ph})}}.
	ag{7}
]
For (ell/Mll1):
[
rac{r_{m ph}}M=3-rac{5}{6}left(rac{ell}{M}ight)^2+O(ell^4/M^4),
quad
rac{b_c}{3sqrt3 M}=1-rac16left(rac{ell}{M}ight)^2+O(ell^4/M^4).
	ag{8}
]
Numerical roots:
| `ell/M` | `r_ph/M` | `b_c/M` | fractional `b_c` shift | fractional `pi b_c²` capture change |
|---:|---:|---:|---:|---:|
| 0 | 3 | 5.196152422706632 | 0 | 0 |
| 0.05 | 2.997914782637599 | 5.193985702853465 | -0.0004169854 | -0.0008337970 |
| 0.10 | 2.991636365243449 | 5.187465547425237 | -0.0016717899 | -0.0033407850 |
| 0.20 | 2.966171464017047 | 5.161077577220873 | -0.0067501572 | -0.0134547497 |
| 0.40 | 2.857978017922430 | 5.050075107598604 | -0.0281125924 | -0.0554348669 |

An event horizon exists in this family when (ell/Mle 4/(3sqrt3)approx0.76980036). For larger (ell) it is not an ordinary black-hole test. A distant critical impact parameter is not automatically the diameter of a bright accretion ring; source emission, inclination, spin, plasma, and imaging must be modeled.

## Precision criterion: not a fit
Nathan requested ambition toward **0.00000000001% fractional difference = (10^{-13})**. This is a *design target*, not today's telescope precision and not achieved observational agreement.

From (8), hypothetical (|Delta b_c/b_{c,m GR}|<10^{-13}) implies (ell/Mlesssimsqrt{6	imes10^{-13}}=7.74597	imes10^{-7}) **conditional on this one model and Schwarzschild parameters fixed**. From (5), (|Deltaalpha/alpha|<10^{-13}) implies (ell/blesssimsqrt{10^{-13}/2}=2.23607	imes10^{-7}). These are design inequalities, **not empirical upper limits**. A finite-scale SAT model could be indistinguishable from GR at this level if (ell) is tiny, without gaining explanatory power.

## Secondary system: planetary ring scattering
Standard 4D mapping for a ring grain follows a timelike worldline in a local freely falling tetrad. In a Keplerian **rotating** Hill frame (a Newtonian local limit, not a new Lorentzian metric), relative centerline displacements satisfy
[
ddot x-2Omegadot y-3Omega^2x=f_x,quad
ddot y+2Omegadot x=f_y.
	ag{9}
]
Candidate finite-core/contact adjustment: add a force that is exactly zero when grain separation exceeds their summed radii and derives from a normalized contact energy (U_c), with internal director dynamics and dissipation only at real encounters. It cannot affect purely gravitational distant passes unless the model adds a separately derived long-range field. This is a **useful null discriminator** against unconstrained “worldtube interaction at any 4D proximity.” Particle sizes, restitution, spin, optical depth, velocity distribution, and collisions are needed before a numerical Saturn ring wake prediction is possible. No observational Saturn ring data were fitted this run.

## Hostile internal audit and revision record
1. **Metric nonuniqueness:** many stress profiles/modified-gravity models share a chosen short-range potential; this is one forward map, not an SAT derivation. Added (2), pressure/matter degeneracy, and explicit warning.
2. **Singularity sleight of hand:** finite Plummer Newton potential alone is insufficient. Added explicit divergent (K_{m naive}) control.
3. **No physical quantum scattering:** historical `1+exp` normalized path sum is not an S-matrix; identified external-momentum, phase, optical-theorem gaps.
4. **Unobservable overprecision:** target (10^{-13}) does not equal real-world error; inequalities are conditional.
5. **Metric source extends outside hole:** included nonvacuum caveat; black-hole comparison is not clean “quantum-only near horizon”.
6. **Shadow ≠ EHT ring:** observational forward model required.
7. **Not a novel solution relative to regular-BH GR:** all present calculated modifications are ordinary Einstein GR under a chosen anisotropic stress. Claim of revolutionary new physics is withheld.
8. **Scope of exactness:** equation (5) exact in `ell/b` **only at first order M/b**. Added independent full-geodesic control and separated 1PM from exact.
9. **Observable selection:** added order-`ell^4` cross-section suppression, including domain of monotonicity.

## Reviewer test and decision gates
Give each reviewer this document plus **one different archival comparator**; ask a hostile, agenda-free verdict better/worse with a proof, citation, error audit, and proposed replacement. Reviewer response is **not yet received**. Accept improvements only when independently checked. Publication gate: (i) derive stress tensor from explicit finite-core action, (ii) propagate perturbations and verify stability/hyperbolicity, (iii) match lensing, shadow, and Newtonian sources without changing meaning of `ell`, (iv) compare one genuinely held-out empirical system with a sourced uncertainty model, and (v) supply a proper scattering amplitude before claiming S-matrix finiteness.

**Recommended next test:** derive Einstein tensor directly from the most economical H(s)H finite-core elastic/worldtube action and ask whether (p_r=-ho) and (p_t(r)) in (2) arise without inserted radial constitutive functions. Negative answer invalidates the proposed SAT interpretation while leaving this GR benchmark intact.

**Reproducibility:** local solver and numerical JSON plus Class-P graph are included in the associated task response; GitHub review requests will cite this document. The GitHub path alone is not evidence of running the solver.

**Signature:** Ravel (no user's signet)
