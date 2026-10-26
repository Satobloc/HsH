# SAT/UI vs 3C-SiC: source-to-source technical comparison

**October 26, 2026**  
**Protocol:** comparison written only **after** freezing `SAT-UI-BLIND-20261026-001`. The executable browser/Python model contains no effective masses, band gaps, carrier mobilities or fitted semiconductor constants.  
**Scope:** one external peer-journal article supplied by the user, set beside three historical SAT documents and the separate *SAT Geometric Solvers* description. Other papers in the bibliography were **not** independently re-analyzed here. This is a method comparison and a specific gap audit, not an independent SAT prediction test.

## Document identities and evidence classes

| Work | Identity / status | What it supplies | Not supplied |
|---|---|---|---|
| SAT UNODROP | Historic SAT evaluation package, archived in `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT UNODROP.txt` | Stripped-down master action, user-prescribed test protocol, UI equation, historic benchmark claims | Executed derivations establishing semiconductor observables; unique numerical interaction law |
| ONE FILE SAT 2 | 19-page historical PDF; extracted text in SAT archive, original hash supplied by archive extractor | Same minimal master action/UI, plus later proposed physical interpretations | General electronic Hamiltonian, independently calibrated defect species model |
| SAT CORE — UI CONFIG | SAT historical UI/SAT mathematics document | `X(s)=q(s)R(s)x0`, six SO(4) planes, quadratic kinetic/bending and time-normal couplings | Complete variational boundary conditions or rigorous calibration to semiconductors |
| SAT GEOMETRIC SOLVERS | Archival proposal for separating mathematical solvers from their physical applications | Two relative frames; scale and rotations; forward/inverse/variational roles; sources of excess freedom | A unique 3C-SiC carrier transport derivation |
| Agesa et al., Aug. 2026 | *Advances in Materials Physics and Chemistry* 16, 309–332, DOI:10.4236/ampc.2026.168018; uploaded 24-page PDF | Crystallographic 3C-SiC structure, 128-atom defect supercells, PBEsol/PAW DFT, effective band masses, Boltzmann-based carrier transport and calibrated mobility tables | A parameter-free geometry-only theory; independently measured new devices in the submitted PDF |

## Detailed side-by-side geometry / equations / assumptions / observables

| Aspect | SAT/UI source mathematics | Agesa et al. (2026) | Direct assessment |
|---|---|---|---|
| Primitive geometric object | Two relative 4D frames, or a trajectory `X=qR x0` with `R∈SO(4)` | Zinc-blende crystal 3C-SiC, space group F-43m, a 2-atom primitive basis | Different objects. A vector trajectory is not the crystal structure. |
| Symmetry | General SO(4) frame rotations, relative scale; local gauge SO(3) if only point direction is observed | FCC *Bravais* lattice with a two-species tetrahedrally coordinated basis; crystal point group `T_d`, not full SO(4) | FCC packing intuition helps specify a crystalline scaffold; isotropic overlapping spheres do not uniquely encode silicon/carbon chemistry. |
| Construction | `X(s)=q(s)R(s)x0`, dimensionless until calibrated | `4×4×4` replicated 2-atom primitive cell = 128 atoms, distinct substitutions and antisites | SAT/UI currently lacks lattice basis/periodicity/atom labels/defect occupancy rules. |
| Native invariant | `q=|X|`, `u=X/q`, `|X'|²=q'²+q²|u'|²`; global SO(4) isometry | Translational Bloch symmetry and the crystal Brillouin zone | UI invariant is valid but too weak to select any `E(k)` or band crossing. |
| Energy functional | Historic `T|X'|²/2 + κ|X''|²/2 + α(X'·n)² + V_int`; coefficients and interaction unspecified | Electron density functional under PBEsol, pseudopotentials, BFGS relaxation, plane-wave cutoff | Not the same type of energy; assigning SAT curve-bending effort to DFT electronic energy without proof adds a new postulate. |
| Equation of motion | For a fixed director, `κX''''−TX''−2αn(n·X'')+∇V_int=0` | Self-consistent electronic structure solved numerically; energies of bands at wavevector `k` | The UI Euler–Lagrange equation is underdetermined until `V_int`, boundary data and coefficients are independently set. |
| Electronic curvature | No `ε_i(k)` derived; curvature of a drawn worldline is not automatically a band Hessian | `1/m*_{αβ}=(1/ℏ²) ∂²ε/∂kα∂kβ` (Eq.6, paper p.10) | Mapping geometric curvature to reciprocal-space band curvature is the missing physics. A qualitative analogy is not a prediction. |
| Defect stability | No species-resolved chemical potentials | `E_f=E_defect−E_pristine+ΣΔn_i μ_i` (Eq.2, p.4) | Distinct material-energy model. Need independently specified atomic chemistry, reference energies and thermodynamic boundary conditions. |
| Transport law | None derived from source UI alone | `Σ_ab(ε)=Ω^{-1}Σ_{ik} v_a v_b τ δ(ε−ε_ik)` (Eq.1, p.4), with CRTA then empirical-like relaxation-time scaling | No prediction of μ(T,n) until `ε(k)`, occupations and scattering lifetimes follow from SAT without importing targets. |
| Parameters | Dimensionless form does not eliminate `T`, `κ`, `α`, `V_int`, a length/time scale, or director construction | Crystal scale/basis/pseudopotentials, exchange-correlation approximation, carrier concentration, phenomenological τ and power-law exponents | Neither is automatically zero-parameter. The DFT paper states many inputs; SAT has multiple *unspecified*, not eliminated, degrees of freedom. |
| Empirical anchoring | Requested blind stage has **no empirical values**. All mathematical tests are tautology/identity/rotation QA | Selected relaxation-time baseline and power laws calibrated to target mobility; DFT structural parameters from COD | Empirical comparison is postponed. Fitted targets cannot count as independent predictions. |
| Claim scope | Wide physics unification claims appear in historical archives; UI mapping is a formal geometric tool | Narrow semiconductor engineering claims, some extrapolated from calculations | SAT physical claims not established by mapping alone; paper is a computational materials study, not experimental realization. |

## Geometrical distinction: FCC versus zinc blende

FCC is the maximal-density Bravais sphere-packing option among cubic equal-sphere lattices. But **3C-SiC is not a pack of equal hard spheres**. Zinc blende consists of two interpenetrating FCC sublattices displaced from each other, with each atom **four nearest neighbors of the other species** in tetrahedral coordination. The FCC description refers to its translational Bravais lattice. This matters: an initial SAT contact model based on **12 identical hard-sphere contacts** would not faithfully represent the **four chemical nearest-neighbor bonds** of the material without a transparent reconstruction of its two-atom basis. Using FCC first is fine as a canonical geometry, provided we label this distinction and do not quietly insert the target's basis after viewing results.

The source documents also separate three tools: UI (dimension-general relative-frame ruler), Whirligig (constrained comparison), and Spheres (interaction/intersection engine). The blind v0.1 UI deliberately implements the first, not a presumed implementation of the others.

## Independent dimensionless relations the blind kernel actually derives

Start with the historic UI map and nothing from semiconductor data:

1. `X(s)=q(s)R(s)x0`, `R^T R=I`, `det R=1`, `|x0|=1`.
2. `u=R x0`, `u·u=1`, `u·u'=0`.
3. `X'=q'u+qu'`.
4. `|X'|²=q'²+q²|u'|²` identically, for any permitted differentiable controls.
5. For a specified interval `[a,b]`: `∫|X'|²/2 ds >= |X(b)-X(a)|²/[2(b-a)]`. Equality holds for constant-speed straight X between endpoints. This is a variational benchmark, not a material prediction.
6. If `u(s)` is observed but not the full material frame, an SO(3) stabilizer of `x0` leaves the mapped position fixed. The six rotation-plane angles cannot be inferred uniquely from one point trace.
7. For fixed director `n`, the quadratic-penalty stationarity equation is `κX''''−TX''−2αn(n·X'')+∇V_int=0`. **No unique numerical X(s)** follows until coefficient ratios, boundaries and potential are determined.

The Python and JavaScript implementations were frozen before the external comparison; no target values occur in the engine. The default dimensionless mathematical circle has `I_stretch≈π`, `I_bend≈π`, `I_director=0`; that is a **numerical identity fixture**, never a blind prediction of a physical circle or an electron property. Six Python mathematical tests passed.

## Specific paper claims and what it would take to test them independently

| Claim from external paper | Reported figure / evidence | Independent test needed | Blind SAT result |
|---|---|---|---|
| Effective hole mass drops under `N_C P_Si` co-doping | `m*_h≈0.228 m_e`; baseline supercell `≈1.833 m_e`; ~87.6% reduction using authors' fitted curvatures, Table 2 p.10 | Derive band-edge Hessian ratios from independently specified SAT geometry and chemistry; compare to measured cyclotron/optical/Hall constraints, or an independently validated band calculation | **NOT DERIVED** |
| Donor–donor co-doping produces p-type behavior | PDOS interpretation near valence-band maximum, pp.9 and 19 | Independent defect charge-state neutrality, hole population, Fermi-level alignment and electrical sign under characterized sample conditions | **NOT DERIVED** |
| `P_Si` is thermally stable dopant | BoltzTraP post-processing with selected mobility calibration targets, pp.11–16 | Pre-register a τ law from independent scattering measurements and test at held-out temperatures | **NOT DERIVED** |
| `n≈10^18 cm^-3` offers optimal stability | Authors' computed plateau `~350–500 K`, Table 5 p.17 | Unseen material batch, Hall/conductivity vs doping and temperature, uncertainties and baseline device metrics | **NOT DERIVED** |
| Pristine band gap | PBEsol calculated `1.24 eV` vs literature measured `2.36 eV`, p.7 | Independently predicted dimensionless gap ratio, then one allowed scale choice; ensure not secretly tuned to measured gap | **NOT DERIVED** |

**Potential precision route:** Without knowing an energy or lattice scale, predict a **dimensionless** band-curvature ratio for two configurations from an independently determined SAT spectral operator. Then, if a common energy and length unit applies, the effective-mass ratio is the inverse curvature ratio. This would be an actual blind test. But it requires the spectral operator, which the recovered minimal SAT action does **not** supply. Neither `SO(4)` rotations nor geometric line curvature alone is a substitute.

## Internal consistency issues in the external paper (review, not SAT validation)

1. **Primitive-cell effective-mass swap.** Text on paper p.10 gives pristine electron `0.3806 m0` and hole `0.4352 m0`; Table 2 on that same page gives electron `0.435 m0` and hole `0.381 m0`. Determine whether the columns or prose are reversed. The scanned original page confirms the inconsistency.
2. **Band folding vs effective mass.** The authors attribute a large change in pristine hole effective mass (`~0.435` to `1.833 m0`) to representing the same pristine material with a 128-atom supercell. Mere Brillouin-zone folding changes representation, not physical effective mass at the same extremum. A band-unfolding, state matching, directional Hessian and degeneracy audit is needed. Distinct band fitting choices could explain the numbers, but are not spelled out.
3. **Reciprocal sampling equivalence claim.** A 4×4×4 real-space supercell with a 2×2×2 k-grid corresponds nominally to 8×8×8 primitive reciprocal-grid resolution, not **strictly** 9×9×9. Convergence may still be similar; strict equality is not supported by the cited grid counts.
4. **Calibration vs prediction.** Page 11–13 specifies experimentally targeted initial mobility values and defect-dependent scattering power laws; the headline transport curves inherit those targets. This limits independent predictive interpretation. The authors themselves call their absolute results semi-empirical in the conclusion (p.18).
5. **Charge/sign reversal.** `N_C P_Si` produces p-type behavior despite both isolated dopants being donors in the model. This requires more than qualitative PDOS, particularly self-consistent carrier concentrations and charge compensation under dopant charge states.
6. **Reproducibility and uncertainty.** The PDF documents selected cutoffs, relaxation times and outputs, but does not itself provide complete QE input decks, PAW files, k-paths, band-state matching procedures and independent replicated sample measurements. Do not infer their existence or absence elsewhere from this PDF alone.

A caution about the simple `σ=neμ` relation: Table 3's nitrogen case at 300 K reports μ=1000 cm²/(V s) and conductivity 16.62 S/cm for n=10^17 cm^-3, whereas the simple drift relation gives about 16.02 S/cm. This is a ~3.7% numerical difference and could involve a Hall-factor convention; treat it as a clarification question, not conclusive arithmetic refutation.

## Pre-registered future comparison, without answer leakage

**Model input channel:** structurally independent measurements of the crystalline lattice and atomic species; their source dates, units, uncertainties and hashes recorded *before* looking at the tests. No post hoc dopant or mobility values may be used to choose SAT coefficients.

**Allowed output channel:** dimensionless predictions of electronic band curvature ratios, bandgap ratios, defect-energy ordering, symmetry-class degeneracies and an explicitly derived transport ratio if a scattering model exists. These must be generated solely by a frozen action plus a non-target calibration rule.

**Baselines:** recognized symmetry/band-folding equalities; an independently specified electron band theory; simple material-independent or naive scaling null models. **Do not** call a coincidence a success unless it outperforms meaningful comparators.

**Accuracy:** use uncertainty-adjusted residuals, independent observables, multiple defect configurations, and **one** advance-frozen comparison. Report unresolved missing physics as `BLOCKED`, calculated failures as `FAIL`, and success only for independently generated predictions with documented provenance. A repeated tune/retest cycle requires new unseen targets.

### Verdict

The independent UI instrument is now executable and mathematically checked at the geometric level. It has **not** inferred any semiconductor effective mass, bandgap, doping response, carrier mobility or chemical identity. Therefore the side-by-side study presently offers a well-defined **physics bridge gap**, not a close match or mismatch. The next meaningful construction is not to fit the published values but to derive a 3C-SiC-relevant, species-sensitive spectral operator from the historical SAT filament/intersection action using source-independent assumptions and data. Until then, the correct result is **NOT DERIVED**.

## Links / page locators

- [Agesa et al. PDF](https://content.scirp.org/pdf/ampc_1511055.pdf), pp.3–4 structural+transport method, pp.7–10 band structure and effective masses, pp.11–13 scattering calibration, pp.16–18 mobility plots, p.18 limitations.
- [SAT UNODROP](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20UNODROP.txt).
- [ONE FILE SAT 2 (extracted text)](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/ONE%20FILE%20SAT%202.txt).
- [SAT CORE — UI CONFIG](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI%20CONFIG.txt).
- [SAT GEOMETRIC SOLVERS](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20GEOMETRIC%20SOLVERS.txt).
- [Existing HsH UI Mapper](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py).
