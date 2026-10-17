# OV-20261008-13 — A measured coordinate can manufacture apparent memory
**Author:** Orson Vay. **Status:** SANDBOXED / LOCAL:OV13. **Date:** 2026-10-08. **No physical validation or canonical adoption claimed.**

## One result
A fixed four-dimensional helical centerline, sampled at equally spaced axial intersections, gives a scalar detector record that appears to require two previous observations, even though the complete measured transverse position advances by a first-order rigid rotation. No unanchored rotating frame, hidden particle property, or dynamical memory has been introduced.

## Actual source coverage / provenance
1. **SAT old archive**, `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THOUGHTS — from scratch .txt`, lines **1081–1390**, read as contiguous source: Nathan's user turns propose (++++) coiled worldlines, persistent versus transient excitations, and tentative precession/observability; neighboring assistant turns repeatedly upgrade tentative mechanisms into categorical claims. This is an archived 2026 conversation, **not evidence of a 2003–2004 date**. The assistant's claims are not Nathan-authored facts. ⟦PROV:SAT-THOUGHTS·L1081–1390⟧
2. **SAT old archive**, `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Worldlines.txt`, lines **1–400**, read: historical assistant-produced particle-worldline taxonomy and macroscale ensemble/blackout constructions, with explicit numerical constants. Those labels and constants are **not imported**. ⟦PROV:SAT-WORLDLINES·L1–400⟧
3. **HsH**, `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, lines **1–370**, read: Euclidean four-space, finite-core worldtubes, UI rotation/scale and physical interaction proposals; this is a September 30 transport path, while the text begins **7/4/2026**. The summary contains unresolved/inconsistent formulae and is **not adopted wholesale**. ⟦PROV:HSH-MANIFOLDS·L1–370⟧
4. Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, reference desk, Common controls, Mersearch release notes and symbol registry reviewed. HSH_RESOURCES packet and War Room declaration **overview/triaged**, no quarantined `PRIOR_ART` read. Stable Mersearch is `mersearch-stable-1.0`; corpus-wide scan **not claimed** because no full checkout/index was available in this runtime. Exact known files were directly read through the GitHub connector instead.

## Explicit geometry and derivation
**All symbols LOCAL:OV13.** Let the actual measured transverse centerline coordinates of a single constant-pitch helical worldtube at equally spaced axial intersections be
`x_n = R cos(n δ + φ), y_n = R sin(n δ + φ)`.
Here `R` is physical radial distance from the straight helix axis; `δ=2π Δs/P` is the geometric rotation per sampled axial distance `Δs`, where `P` is the axial pitch; `φ` specifies a physically anchored initial radius position. A finite core can surround the centerline; this test is for the *centerline/intersection-centroid position*, not total flux or an invented material director.

The cosine addition identity gives
`x_(n+1) - 2 cos(δ) x_n + x_(n-1) = 0`.
Thus the scalar measurement is second-order, although the pair of physical coordinates `(x_n,y_n)` follows an ordinary first-order planar rotation. If only `x_n` is observed, the two states with the same x but opposite y generally have different next x. Apparent 'memory' can therefore arise from unobserved **concrete geometry**, without any non-Markovian physics.

A second, stronger distinction: scalar x alone cannot identify chirality. Helices with `(δ,φ)` and `(-δ,-φ)` yield **identical x at all samples**. Two transverse probes instead measure the signed area of successive actual radii:
`x_n y_(n+1) - y_n x_(n+1) = R² sin(δ)`.
The sign is a chirality discriminator given a fixed physically defined axial orientation and transverse handedness. It is a relational area, not an independent 'frame rotation'.

A uniform detector averaging x over an axial width `w` yields
`x̄(s) = R sinc(π w/P) cos(2πs/P + φ)`, with `sinc(z)=sin(z)/z`.
This leaves the same recurrence but makes the *signed lateral modulation* vanish when `w=P`. This is a detector null, **not disappearance of the tube, of all coupling, or of total intensity**. Sweeping aperture width should show a zero and sign reversal in this particular channel.

## Scripted numerical checks
Reproducible script: `orson_ov13_geometry_observer.py` (available as accompanying task-thread attachment); results JSON and Class-P figures accompany it.
Synthetic fixture `R=1`, `δ=0.37` rad/sample, `φ=0.23` rad, 501 points, no fitted SAT constant.
- Noiseless scalar one-lag holdout RMSE: **0.2569595**.
- Two-lag holdout RMSE: **1.03e-14**; coefficients **[1.8646546912120685, -1]**, matching `[2cos(0.37), -1]`.
- Full transverse 2D first-order update max error **2.38e-14**.
- Swept area `R² sinδ = 0.361615431965`; max residual **2.24e-14**.
- Scalar chirality mirror max difference **0**.
- Uniform aperture width 2.1 sample intervals attenuates amplitude to **0.9750337821**, but recurrence max residual remains **2.68e-14**.
- First modulation null at `w=P=16.9815819113` sample spacings; computed transfer **3.90e-17**.
- In 300 noise realizations with independent Gaussian coordinate noise σ=0.02, one-lag mean RMSE **0.258398**, two-lag mean RMSE **0.046245**, two-lag better in **300/300**.
- Failure control: a deliberately drifting pitch makes constant-coefficient recurrence RMSE **0.214718**. This falsifies the *constant-pitch fixture*, not all H(s)H.

## Cognition dataset: unsupported claim amplification
Source pair ⟦PROV:SAT-THOUGHTS·L1215–1260⟧: Nathan proposes that precession **might** make the structure inaccessible/unobservable; assistant asserts **zero intersection** with 3D reality without defining a finite-core worldtube or measurement operator. Another source pair in the same region: tentative historical 'tug' along worldlines becomes an assistant claim that it **explains** flat galaxy rotation curves. Both are candidates for a claim-strengthening annotation dataset, not proof of intentional deception. Proposed tags: source role, modal strength, concrete geometric anchor, defined observation operator, claim imported from model versus user, and missing calculation. Human-review source adjacency before scoring.

## Outside literature (consulted *after* deriving the fixture)
The relation to delay-state reconstruction is established mathematical territory. Stark, Broomhead, Davies & Huke, **Delay Embeddings for Forced Systems II: Stochastic Forcing**, *J. Nonlinear Science* (2003), DOI [10.1007/s00332-003-0534-4](https://doi.org/10.1007/s00332-003-0534-4); and Botvinick-Greenhouse et al., **Measure-Theoretic Time-Delay Embedding** (2024), DOI [10.48550/arXiv.2409.08768](https://doi.org/10.48550/arXiv.2409.08768). **Abstract-level comparison only.** No claim of novelty for the Chebyshev recurrence or delay embedding. ⟦SRC:Stark2003·abstract⟧ ⟦SRC:BotvinickGreenhouse2024·abstract⟧

## Failure conditions / next test
The clean two-lag relation fails for variable pitch, variable radius, superposed strands, uneven sampling, nonlinear contact response, or unknown time-varying detector kernels. A single-channel null cannot imply geometric absence. Next: apply the same fit to finite-core worldtube intersection *areas* under independently calibrated aperture motion, and compare whether signed modulation zeros move with apparatus width while total intersection measure remains positive. Add a preregistered scalar-chirality indistinguishability test and two-channel swept-area control.

**Boundary:** historical source construction = coiled 4D worldlines and finite cores; derived here = explicit observational recurrence/area/null tests; speculative interpretation = possible relevance to H(s)H readout, macroscopic 'memory', or apparent state change. Nothing is a physical claim.
