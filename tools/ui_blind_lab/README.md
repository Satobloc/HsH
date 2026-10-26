# SAT Universal Indicatrix: Blind Laboratory v0.1

**Status:** Executable geometric mapping, inverse decomposition, independent action-term measurement, symbolic variational equation, and mathematical tests. **NOT a predictive semiconductor physics solver.**

## Open the laboratory

Open `index.html` in a current web browser. It is self-contained: no packages, account, network access, target values, or external JavaScript. Click **Compute geometric map** after changing the controls. The default display is a **mathematical unit-circle verification fixture**, not an observed universe or particle.

- Set the dimensionless scale `q(s)` and six independent SO(4) plane-angle functions.
- Choose the four-coordinate reference vector. The interface normalizes it.
- The program maps controls into `X(s)=q(s)R(s)x0`, displays four-coordinate projections, reconstructs `q` and `u=X/q`, and checks the radial/angular velocity decomposition.
- It shows three *separate*, unweighted action integrals `I_stretch`, `I_bend`, `I_director`, and the Cauchy-Schwarz lower bound for `I_stretch`.
- Import a CSV of a *separately obtained* 4D trajectory through **Inverse map**. The inverse cannot recover an entire unique SO(4) history without frame/director information. Three stabilizer degrees of freedom remain.
- Export CSV, dimensionless controls JSON, or a **SHA-256 verified geometry freeze**. Pure-JS SHA-256 works for local files, including browsers without WebCrypto. The snapshot itself includes no comparison-paper numbers.

### Equation syntax

`sin(s)`, `cos(2*s)`, `2*pi`, `sqrt(1+s^2)`, `exp(-s)`, `log(s+1)`, powers, arithmetic. Enter *explicit multiplication*: `2*s`, not `2s`.

## Python mathematical kernel

Requires Python 3.10+, `numpy` and `sympy`. (Tested with Python 3.13 / NumPy 2.3 / SymPy 1.14.)

```bash
python ui_kernel.py --verify
python test_ui.py
```

To analyze browser-exported controls:

```bash
python ui_kernel.py --controls-json ui_controls_dimensionless.json --output ui_analysis.json
```

The Python kernel independently implements six proper 4D planar rotations, forward map, inverse scale/direction, a minimal-frame witness for nonunique reconstruction, sampled velocity/bending/director terms, and symbolic checks. It does **not** decode an energy band or infer material parameters.

## The mathematical core and its limits

Original relative-frame conception:

`F1, F2 ~ R^4; G(s)=D(s)R(s)`, isotropic `D=q(s)I`, `R in SO(4)`.

For one unit reference direction `x0`, `X=qR x0`. Define `u=R x0`. Then `|u|=1`, hence `u . u'=0`:

`|X'|^2 = q'^2 + q^2 |u'|^2` (exact).

The historic quadratic SAT terms can be viewed as separate geometric factors:

`F[X] = ∫ [ T |X'|^2/2 + kappa |X''|^2/2 + alpha (X' . n)^2 + V_int(X) ] ds`.

For **constant n**, a position-only interaction, and coefficients independent of X, the fourth-order stationarity equation is:

`kappa X'''' - T X'' - 2 alpha n (n . X'') + grad V_int(X) = 0`.

The full equation is **not an established physical law** until the nature of `V_int`, the director field, coefficients and boundaries are specified. If n depends on position, extra derivatives appear. The historical source treats these contributions as positive geometric effort; calling F a conventional dynamical Lagrangian `K-V` would require a separate interpretation.

### Why this is not a zero-parameter band predictor

- Geometric scale/rotation alone does not define a crystalline electronic Hamiltonian, Bloch spectrum `E(k)`, electronic occupation, atomic defect species, thermal scattering lifetime or transport tensor.
- Historic SAT coefficients `T`, `kappa`, `alpha`, plus `V_int` are not eliminated or fixed by the UI. They cannot be silently assigned the numerical value 1 and called predicted.
- Six SO(4) rotation angles are present, but a **single point trace constrains only three angular directional degrees** after normalized scale is extracted. An unobservable SO(3) stabilizer is a gauge freedom, not a measured spin.
- The quadratic integrals depend on the chosen parameterization `s`; a physical invariant requires a declared natural parameter / arclength or a reparameterization invariant replacement.
- Purely formal 4D rotations do not imply semiconductor electronic transport and do not identify particle properties by themselves.

## Blind protocol

1. **SOURCE BUILD:** Only SAT primary files, general mathematics, and developer tests permitted. No numerical results from holdout papers in executable code.
2. **GEOMETRY FREEZE:** `FREEZE_MANIFEST.json` commits the code SHA-256 and default mathematical-check snapshot. Frozen version is immutable for the comparison.
3. **BRIDGE PROPOSAL:** A distinct, pre-registered physical map from geometric curves or lattice sources to Hamiltonian/band energies must be independently derived and frozen. Until then, report **NOT DERIVED**, never a successful match.
4. **INDEPENDENT INPUT:** Only independent structural or atomic measurements not used as the test target are admissible. Record provenance, uncertainty, units and fit history. The user has explicitly requested no numerical inputs for this initial stage.
5. **HOLDOUT COMPARISON:** Compare frozen predictions to external quantities with agreed, predeclared observables, baselines and tolerances. Do not tune by repeated access to target values.
6. **POST-HOC REVISION:** Allowed, but name it version 0.2+, record what was learned from holdout and move to genuinely new unseen validation targets.

`SAT_HOLDOUT_20261026` is distributed as a **separate archive** containing the paper and its SHA-256, never consumed by this code. The source has been read during this conversation; this is therefore a **computational blind** rather than a claim that the investigator is personally unaware of its contents.

## Source provenance

Primary materials retrieved from GitHub, not generated from the comparator:

- [SAT GEOMETRIC SOLVERS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20GEOMETRIC%20SOLVERS.txt): UI as dimension-general relative frame and solver; spheres optional; applications not solvers.
- [2026/SAT CORE — UI CONFIG.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI%20CONFIG.txt): `X=qR x0`, SO(4), quadratic terms. Some proposed particle-sector assignments are claims, not computational achievements.
- [SAT UNODROP.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20UNODROP.txt): stripped-down SAT master action, challenge/testing protocol, and illustrative benchmark claims; historical conversation material is NOT a validation receipt.
- [ONE FILE SAT 2 PDF extracted text](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/ONE%20FILE%20SAT%202.txt): core SAT and UI equations, speculative extensions, and previous historical tests. This is not proof of predictions.
- [HsH Meridian UI Mapper](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py): existing design precedent; our offline demonstration does not replace or modify that code.

**Scope:** This artifact is a separate, standalone prototype. It is not deployed to the live Glass Sausage Factory website or automatically merged into HsH.
