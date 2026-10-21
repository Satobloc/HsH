# Whirligig R/Q | Selectable equation adapters

**Status:** SANDBOXED / OPERATIONAL BROWSER INPUT LIBRARY (not a mathematical equivalence claim)  
**Date:** 2026-10-17  
**Browser implementation:** `PUBLIC_SITE/instruments/whirligig/index.html`  
**Implementation commit:** `0cf005a95051ce046be71a04f01c60a3a166ad1e`  
**Source engine reference:** `tools/whirligig_rq/README.md`, `whirligig.py`

## Design

Each input must provide an explicit dimensionless periodic *scalar representative* `f(λ)`, with λ ranging from zero to 2π and a periodic closed result. The instrument applies independent R and Q selection, R/Q **display** gain, and a Q sampling phase. The source's scalar value changes the spherical polar aperture through the existing bounded mapping, preserving opposite E/W hemispheres. It is **not** a universal invertible map from a field equation, metric, representation, wavefunction or solution space to a 3D curve.

Distinct input equations are mapped to the same sphere using an explicitly chosen adapter, not assumed to be isomorphic. Geometry coupling remains unchanged: independent source curves, simultaneous equal-fraction arc-length traversal, one variable-length crossbar, one perpendicular projecting elbow, minimum shared return clock, torus-wall Curvy Lisa output. The numerical comparison readout displays root-mean-square difference between the two **ungained scalar profile samples**, not an equation-isomorphism criterion or field-theory test.

## Catalog

| Code | Mathematical object | Specific selected closed representative | Epistemic scope |
|---|---|---|---|
| `harm_r` | synthetic harmonic R | cos(2λ)+(3/11)sin(3λ) | demonstration |
| `harm_q` | synthetic harmonic Q | sin(3λ)+(1/6)cos(5λ) | demonstration |
| `u1_phase` | U(1) relative phase | Re exp(i[λ+0.25 sin(2λ)]) | fixed-reference gauge phase; **not gauge invariant** |
| `su2_character` | SU(2) fundamental character | ½Tr diag(exp(iφ),exp(−iφ))=cos φ, φ=2λ+0.35sin λ | group path only; not an SU(2) Yang–Mills field |
| `su3_character` | SU(3) fundamental character | (1+2cos φ)/3, φ=2λ+0.25sin(3λ) | diagonal group path; not QCD dynamics or a Wilson loop |
| `gw_plus` | linearized vacuum GR wave | h₊/h₀=cos(2λ) | TT-gauge wave component, phase-normalized |
| `gw_cross` | linearized vacuum GR wave | h×/h₀=sin(2λ) | TT-gauge component, not gauge-independent complete spacetime |
| `schwarz_orbit` | Schwarzschild timelike circular geodesic | x/r₀=cos λ at equatorial r₀=8M | coordinate x projection, λ is **orbital phase**, not proper time |
| `schwarz_lapse` | Schwarzschild metric lapse | 10[√(1−2M/r(λ))−√(1−2/8)], r/M=8+1.5cos λ | prescribed radial scan, **not a geodesic** |
| `kerr_drag` | Kerr equatorial ZAMO frame dragging | ω(r)=2Ma/(r³+a²r+2Ma²); a/M=0.5; r/M=8+cos λ; f=ω(r)/ω(8M)−1 | prescribed radial scan, **not an orbit** |
| `qm_rabi` | two-level Schrödinger solution | H=(ℏΩ/2)σₓ, Pₑ=sin²(λ/2); 2Pₑ−1=−cos λ | ideal resonant system, λ=Ωt |
| `qm_spin` | spin-½ Larmor precession | H=(ℏω/2)σz; ⟨σₓ⟩=cos λ | ideal initial +x state, λ=ωt |
| `qm_coherent` | quantum harmonic oscillator coherent state | ⟨x⟩/A=cos(3λ) | selected expectation value, ωt=3λ |
| `qm_interference` | coherent two-energy-state superposition | interference factor cos(ΔEt/ℏ)=cos(3λ) | phase interference factor only, not the full probability density |

**Important gauge distinction:** the trace of a chosen group element is a class function under conjugation, but these chosen paths are *not* derived from a gauge connection integrated along physical closed spacetime loops. Do not present them as gauge-invariant Yang–Mills Wilson-loop measurements or solutions to the gauge field equations.

**Important GR distinction:** a selected metric is an exact gravitational solution in its stated idealized setting, but sampling one metric component along an arbitrarily imposed periodic radius does not automatically yield a geodesic or solve a new Einstein field equation. Only the stated Schwarzschild circular-orbit model uses a selected timelike geodesic.

**Important QM distinction:** phase, expectation value, and population probability are different objects. Each input explicitly states which is sampled. Do not equate scalar trace similarity with quantum-state equivalence.

## User interface

- Two independent selectors: **Equation R / East** and **Equation Q / West**, each containing all 14 profiles.
- Ten named pair presets for same-sector and cross-sector exploration.
- Swap R ↔ Q without claiming invariance of the crossbar/elbow output under swap.
- Equations and clear provenance/scope text visible adjacent to each selector.
- Original demonstration remains the default and reproduces the former coefficients when display gains are 0.55 and 0.60.
- Q sampling phase applies to the chosen Q input before the sphere projection.
- Source groups and formula labels are authored static data. No `eval` of user-supplied mathematics or dynamic execution of arbitrary expressions.
- Exported SVG reflects the selected composite elbow-tip trace.

## Verification and remaining work

The HTML file was independently read back from GitHub after its committed write. A stubbed JavaScript DOM/canvas test executed all 14 profiles on the R selector and all 14 on Q, tested all ten pair presets, independent swap, opposite hemisphere membership, numerical connector–elbow perpendicularity, and numerical torus-wall intersection existence. Maximum orthogonality residual over tested R/preset configurations was below 4.1e−16; all 1,651 samples in each tested configuration had an elbow–torus intersection. The **Q selector** likewise produced zero missing hits or E/W violations in the same baseline mechanical configuration.

These are executed geometry smoke tests **not** browser/visual-acceptance tests, and are not formal verification of the chosen mathematical adapters. Full browser usability, semantic mathematical review, and deployed ChatGPT Sites publication remain unverified.

Next steps: add optional parameter controls with domain/unit checking for each representative; standardize a serialized source specification compatible with the Python engine; separately validate higher-dimensional and nonperiodic solution branches without forcing fake closure; and test whether the experimental composite curves preserve source invariants beyond similar appearance.

## 2026-10-21 UPDATE: 42-profile unfiltered comparison library (supersedes 14-only summary)

The current browser implements the 14 earlier demonstration, gauge, GR, and QM profiles **plus 28 new mathematical representatives**. The selector groups now include **Best-known series (11)** and **Often overlooked series (17)**, alongside the original sector groups. The groups are editorial and exhaustive within this defined library; “best-known” and “often overlooked” are not objective rank, rarity, or significance assessments.

**Best-known:** Newtonian oscillator, Kepler ellipse, Maxwell vacuum wave, Fourier heat mode, Laplace disk harmonic, Schrödinger infinite-well eigenfunction scan, wave-equation standing mode, special-relativistic Lorentz factor, Planck spectrum, Maxwell–Boltzmann speed distribution, Fermi–Dirac occupation.

**Often overlooked:** Jacobi theta₃, Legendre P₄, Chebyshev T₅, Bessel J₀ (numerical quadrature), Clausen Cl₂ (truncated Fourier series), Re Li₂ (truncated power series), 2D Dirac Berry-curvature scan, Mathieu equation coefficient (not a Mathieu solution), KdV sech² soliton (periodic spatial scan, not a periodic traveling solution), sine–Gordon kink scan, Burgers viscous-shock profile scan, Morse potential, Lennard–Jones 12–6 potential, Kitaev-chain Bogoliubov band, Pöschl–Teller well, Fresnel C (numerical quadrature), U(1) Wilson phase for a **specified** family of fluxes.

Each named profile displays its explicit formula, the sampled quantity, and what is NOT implied. A prescribed closed sampling path is *not* equivalent to claiming an inherently nonperiodic solution becomes periodic. The current UI has **no user-supplied arbitrary code evaluation**. The synthetic and physical examples are never declared automatically equivalent by curve appearance.

**Uncurated traversal:** `Next pair in series` deterministically walks all unordered pairs of the chosen set in lexicographic order, with a visible index; counts are 55 familiar, 136 overlooked, or 861 among all 42. This avoids auto-selecting outputs for beauty, similarity, or expected theory claims. Manual R/Q selection and original named pairs are preserved.

**Source and tests:** [Current GrAnn mechanism plus complete test record](../../../tools/whirligig_rq/GRANN_INNER_WALL_ROTATIONAL_LOCK_2026-10-21.md). 42 scalar representatives verified finite and closed under `f(0)=f(2π)`, with 84 complete R- and Q-side apparatus configurations and 117,684 samples meeting torus-wall, E/W, and perpendicularity numerical checks. The figure-of-merit is not a GR–QM/gauge equivalence proof; deployed browser QA remains unverified.
