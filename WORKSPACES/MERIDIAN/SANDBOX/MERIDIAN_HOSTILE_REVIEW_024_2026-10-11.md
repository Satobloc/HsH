# Meridian ◈ | Hostile review checkpoint 024 | 2026-10-11

Assignment: [Issue #23](https://github.com/Satobloc/HsH/issues/23). Manuscript: `WORKSPACES/COMMON/SANDBOXED_PAPERS/WHIRLIGIG_CLIFFORD_TORUS_ELASTIC_BACK_HALLWAY_2026-10-08.md`. **Recommendation: MAJOR REVISION.** SANDBOXED, not an endorsement of physical validity.

## Independent numerical replication
For H=(cos 2s,sin 2s,cos 3s,sin 3s)/sqrt(2), solve the 2π-periodic linear response
`(.02 D^4 + I + 20 H(s)H(s)^T) h = cos(s)e1`.
A separately implemented dense Fourier fourth-derivative matrix and direct 4N×4N solve returned:

| N | coordinate-3 mode-2 amplitude | coordinate-1 mode-3 amplitude | residual 2-norm |
|--:|--:|--:|--:|
| 32 | 0.14955851240472168 | 0.07535009021916736 | 2.53e-13 |
| 64 | 0.14955851240475898 | 0.07535009021908323 | 7.23e-12 |
| 128 | 0.14955851240599122 | 0.07535009021918589 | 2.57e-10 |

Matches manuscript's independent 64-point values 0.1495585124046117 and 0.07535009021914847. Increasing raw residual at N=128 is consistent with fourth-derivative matrix conditioning; don't assert monotone raw-residual convergence. Independent computation also confirms base-orbit action J=7.330592297886425 vs author's 7.330592297886421.

## Mathematical assessment
- The E-L equation `κH''''+2λ(|H|²−R²)H+k(H−G)=0` and exact inverse forcing `G*=H+(κ/k)H''''` are correct for the specified 2π-periodic fourth-order functional.
- At this fixed-radius orbit, second variation `∫[κ|η''|²+k|η|²+4λ(H·η)²]ds` is coercive for κ,k>0, λ≥0. State the periodic H² function space and distinguish strict local minimization from global convexity/uniqueness.
- `R²|H''|²−|H'|⁴=a²b²(m²−n²)²` holds for the specified constant-speed angular parameter, not arbitrary reparameterizations of an unparameterized curve.
- Beam/Winkler `1/(1+αj⁴)` correspondence is standard and restricted to the base orbit where shell force vanishes. Inverse forcing makes a desired orbit stationary; by itself it predicts no independent physical response.
- The S³≅SU(2) matrix identification and Spin(4)≅SU(2)×SU(2) cover are standard. A single SU(2) factor is not the complete arbitrary SO(4) UI transformation.
- Strongest result is the linearized half-turn selection theorem: P=diag(1,1,-1,-1), H(s+π)=PH(s), and T h(s)=P h(s+π) commute with the Hessian operator. For f=cos(s)e1, Tf=−f, so plane 1 has only odd and plane 2 only even Fourier harmonics. This EXCLUDES forbidden modes but does not guarantee every allowed mode nonzero; λ=0 or a b=0 are decoupling controls.

## Historical source audit
Read `SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/THE_WHIRLIGIG.txt` (substantial opening including action, EL, helix consistency passages): historical first-order Euler–Lagrange expression omits second-derivative contribution before later correcting itself; quartic penalty is mislabeled a Lagrange multiplier; negative λ conclusion for an unforced helix is not a stable positive quartic-penalty construction. Current positive-λ inverse-forced solution repairs mathematical consistency but only by constructing G after H.
Read `SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/4DHH LAGRANGIAN (nolat).txt` pages 1–4: broad SU(2)/metric/coupling assertions are speculative and NOT consequences of this action.
Read `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` complete returned text: establishes 4D-filament/time-wavefront conceptual motivation, not quantitative validation.

## Comparator and review limitations
**Better or worse than the published paper? Why or why not?** Provisional: worse on established scholarly context/novelty and breadth, better on narrow reproducibility of the specified synthetic operator and clear mode-amplitude benchmark. Full text of T. Asselmeyer-Maluga, *Symmetry* 11 (2019) 1298, DOI 10.3390/sym11101298, was not obtained. No full-text scholarly comparison or priority determination claimed. Author's own local scripts were not executed; independent reconstruction used a separate dense spectral solver.

## Required rewrite and falsifier
Center paper on linearized symmetry-selected cross-plane sidebands; describe inverse-forced torus as a test fixture and beam transfer as restricted operator correspondence. A physical test requires independently commanded/measured G and independently measured κ,k,λ, plus blind second-mode prediction. Mathematical numerical falsifier: a correctly assembled independent spectral/FEM solve violating parity exclusion, or failing to recover mode-2 coordinate-3 amplitude near 0.1495585124 for the declared fixture, invalidates the numerical/theorem implementation. No GR-QM, Navier-Stokes or novel physical equivalence follows.

Desk-safe abstract: 'For a periodic fourth-order curve functional with radial and target penalties, we construct inverse-forced two-frequency stationary solutions and derive their second variation. The linearized shell coupling has a half-period equivariance that excludes specified cross-plane Fourier harmonics and permits others. A restricted on-shell Fourier transfer matches the standard Euler–Bernoulli beam on a Winkler foundation. Independent spectral computations reproduce the predicted sideband pattern. No new physical equivalence or experimental validation is claimed.'

— Meridian ◈
