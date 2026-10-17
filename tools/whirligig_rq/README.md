# Whirligig R/Q Engine: rolling sphere, gimbals, two equations, Curvy_Lisa

**Version:** experimental v0.1, 11 October 2026  
**Status:** SANDBOXED engineering reconstruction. Mathematical/procedural tool, not a proof of a physical isomorphism.

This is a working, configurable **two-equation** mechanism drawn from the historical R/Q / Great Annulum / W_obble / W_iggle / Curvy_Lisa description, together with the archived continuous Navier–Stokes Whirligig Python predecessor. It generates equation curves on a sphere, carries them inside a rolling ball constrained by a torus, uses two genuine orthogonal gimbal hinges to select curve endpoints, constructs the R–Q crossbar and a rotation-minimizing plane perpendicular to it, then intersects a rotating pen ray with the **actual torus quartic** to generate Curvy_Lisa.

**Source provenance:**
- [*FINDING THE DONUT*, pp. 23–27](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/FINDING%20THE%20DONUT%20(nolat).txt), March 2026.
- [*THE_WHIRLIGIG*](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/HsH-SAT%20Roundup%203/THE_WHIRLIGIG.txt).
- [Existing continuous NS Whirligig source](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/continuous_ns_whirligig_solver%20%281%29.py), independently specifying the sphere's moving contact frame, Bishop connector, torus-wall ray casting, and a Navier–Stokes test setup.
- [*WHIRLIGIG -- REDEFINING SUCCESS*](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/WHIRLIGIG%20--%20REDEFINING%20SUCCESS.txt): a **constructive existence** goal for a back hallway, not a demand for one unique universal derivative.
- Original source distinguishes 3D mechanical toy geometry from actual four-dimensional systems. This code does too.

## Run

```bash
python -m pip install -r requirements.txt
python whirligig.py --input example_equations.json --out output --search
python plot_mechanics.py --input example_equations.json --out mechanics_snapshot.png --gif rolling_whirligig.gif
python validate_mapping.py --input example_equations.json --out mapping_validation.json
python -m pytest -q
```

`--input` is optional: a two-harmonic-pair demonstration is built in.

## Input equation adapters

Two independent specs are supplied as `R` and `Q` in a JSON file. Every adapter records its representation choice, physical units remain those of the caller, and original numerical coordinates are preserved apart from the sphere carrier. **No universal faithful parameterization exists for arbitrary symbolic equations without specifying a solution branch, observables, and a parameter interval.** Accordingly the tool supports:

| Kind | Example | What is done | Limits |
|---|---|---|---|
| `expression` | `0.5*cos(2*t)+0.1*sin(5*t)` | Scalar function encoded reversibly in sphere latitude; azimuth is `t` | Functions must be finite on the interval. Periodicity tested, not fabricated |
| `parametric` | `{"components":["cos(t)","sin(t)"]}` | 2D trajectory via reversible stereographic embedding; 3D trajectory radialized with magnitude preserved separately | 3D radial projection loses magnitude in its sphere output |
| `implicit` | `x*x/2.25+y*y-1=0` written as `x*x/2.25+y*y-1` | Extract largest closed real zero contour and stereographically lift | Grid approximate; must set bounding box and a suitable branch |
| `ode` | `{"rhs":["y","-x"],"initial":[1,0]}` | Numerically integrates a 1–3 dimensional ODE and embeds the path | May not close; only specified initial-value solution is represented |
| `sampled` | `{"path":"path.csv"}` | Arclength-resamples a closed 2D/3D numeric curve | Intended for PDE/GR/field equations solved upstream; refuses open CSV curves |

Expression parsing is AST-restricted: arithmetic and common NumPy scalar mathematical functions only. No `eval()`, attribute access, user code import, or arbitrary shell expression execution.

For a PDE, differential geometry equation, non-Euclidean metric, or symbolic Schwarzschild geodesic, **first choose a solution and chart** and pass the resulting parametric/CSV path. This prevents smuggling an arbitrary metric into a falsely universal polar-projection routine. Keep the full source equation and domain as metadata outside the low-dimensional carrier.

## Exact selected-contact rolling law

Let the torus have major radius `R` and tube/minor radius `a`. Let the sphere have radius `b<a` and travel on a center circle of radius

\[
\rho=R+a-b,\qquad C(\psi)=\rho(\cos\psi,\sin\psi,0).
\]

The selected contact on the outer equator is

\[
P(\psi)=(R+a)(\cos\psi,\sin\psi,0)=C+b\mathbf e_r.
\]

For rolling without slip at this **isolated chosen point**, the laboratory angular velocity obeys

\[
\boldsymbol\omega=-\frac{\rho}{b}\dot\psi\mathbf e_z,
\quad \dot C+\boldsymbol\omega\times(b\mathbf e_r)=0.
\]

Define the Great-Annulum body contact angle

\[
\gamma(\psi)=\frac{R+a}{b}\psi.
\]

Let `W(ψ)` be the orthonormal world frame `(e_r,e_phi,e_z)` and `B(γ)` the body-frame triad `(r_annulus,t_annulus,n_annulus)`. The **actual orientation** is

\[
\mathcal Q(\psi)=W(\psi)B(\gamma)^T\in SO(3).
\]

`P=C+Q b r_annulus` is tested point by point. A whole-revolution orientation closes when the contact gearing `g=(R+a)/b` is integral. The historical *even multiple* condition is satisfied by choosing `g=6` by default:

- `R=1.6`, `a=0.55`, `b=(R+a)/6=0.358333...`, `rho=1.791666...`.
- A five-point fourth-order finite-difference check of the no-slip velocity converges to zero under grid refinement, while the underlying analytic identity is exact.
- With `b=a` (the originally described limiting sphere size), ball and torus tube share a nonisolated meridional contact set. The program **can render that mode** when `allow_degenerate_contact=true`, but explicitly does **not certify unique-contact rolling**; imposing no slip at every contact point would be overconstrained.

## Gimbal, connector and pen

The input R endpoint is acted on by an internal `Ry(pitch)` hinge; the Q endpoint by an independent `Rx(roll)` hinge. Their axes are perpendicular **by exact construction**. Hinge angles use integer-period rotations with optional sinusoidal modulations. The sphere's physical `SO(3)` rotation is separate from these **internal coordinate controls**. The two endpoints are transported into the lab frame with the exact `Q(ψ)` orientation above.

`W_obble=(R_world+Q_world)/2` is the connector midpoint, and `W_iggle` is the plane perpendicular to the connector. A minimal-rotation Bishop frame supplies its two orthonormal axes. The pen rotates in that plane. Its **first forward** intersection with the torus is found by solving the torus implicit quartic and selecting its smallest positive real root, not by approximating a torus-looking curve.

Optional `align_source_anchors` rotates one source curve **by a single rigid SO(3) alignment**, mapping an off-phase point and tangent on Q to a point and tangent on R. This is a transparent representation intervention, **not an isomorphism proof**, and it is logged with the alignment matrix and both residuals.

An optional Bishop-holonomy correction adjusts the pen's phase around the full circuit. The correction is recorded, and may be disabled: the program does not silently assert that an uncompensated trace must close.

## Results and automatic smoothness search

The `--search` scan varies **four even annulum gear ratios**, pen rotation rates, and independently chosen gimbal rotations. It preserves **all sixty** ranked candidates in `ranked_candidates.json`, including failures; it also saves the selected best candidate's full reproducible arrays, metrics and precision geometry figures. The ranking favors:

- valid mechanical contact, SO(3) orientation and torus quartic intersections;
- nondegenerate sphere/tube clearance;
- both input-equation closures and full orientation closure;
- C¹ seam closure, low curvature variation, low curvature percentile, low high-frequency Fourier tail.

These smoothness thresholds are **engineering filters**, not physical selection laws. C² seam mismatch is reported separately, and smooth candidates must not be mistaken for solutions to the source equations on the other side of their chosen projections. Explicit held-out source-equation residual tests are required before a proposed back hallway is accepted.

For the supplied synthetic two-harmonic pair with independently aligned anchors:

| Diagnostic | Observed |
|---|---:|
| selected contact velocity (analytic) | `0.0` |
| selected contact velocity, 128 samples | `2.14823e-4` |
| selected contact velocity, 256 samples | `1.34990e-5` |
| selected contact velocity, 512 samples | `8.44822e-7` |
| ball-frame closure | `1.73e-15` |
| torus implicit residual | `8.53e-14` |
| Curvy_Lisa positional seam | `8.55e-16` |
| C¹ seam (tangent difference) | `0.00117` |
| R anchor point and tangent gaps | `2.89e-17`, `1.42e-16` |
| response to +1% R amplitude | `0.00287` RMS output shift |
| response to +1% Q amplitude | `0.00903` RMS output shift |

The tests include intentionally nonperiodic inputs and nonintegral rolling gear, both of which must fail the relevant closure checks. Thirteen automated tests passed in the first checked build.

## Files

- `whirligig.py`: generalized two-equation 3D mechanical engine, parsers, closure checks, finite-clearance rolling, search.
- `ui4d.py`: separate, exact six-plane `SO(4)` Universal Indicatrix representation using `y(s)=r(s)R(s)x0`; **not yet coupled to 3D rigid-ball mechanics**.
- `plot_mechanics.py`: precision-drawn sphere/gimbal/annulum/connector/pen figures and optional GIF.
- `validate_mapping.py`: finite-difference grid convergence and independent source-equation perturbations.
- `test_whirligig.py`: 11 regression/negative tests.
- `example_equations.json`: two independent scalar formula inputs with optional anchor alignment.
- `example_ode_vs_implicit.json`: harmonic oscillator versus an ellipse equation.
- `example_historical_limit.json`: equal-radius historical rendering with explicit degeneracy diagnostic.
- `demo/`, `aligned_demo/`: retained 60-run candidate sweeps and selected-best numerical arrays and plots.

## Remaining work

1. **Historic Great Annulum:** source says a self-intersecting annulum with antipodal self-tangent, but does not give its analytic curve. This release makes an explicit great-circle choice. Recover and test the intended self-intersecting annulum before calling this exact historical reconstruction.
2. **4D rolling/gimbal lift:** the sphere/torus apparatus implements the explicitly described **3D toy version**. The separate `ui4d.py` provides its honest SO(4) representation layer, not a fabricated four-dimensional contact geometry.
3. **Joint dynamical derivations:** embedding an equation into a polar curve is not equivalent to deriving an invariant relation from two different equations. Implement input-specific residual or observable maps and compare against held-out predictions in both sectors.
4. **Continuous optimization:** current candidate search is discrete, not a variational or interval-arithmetic global search. Upgrade with constrained smooth optimization, holonomy loops, singularity branch resolution, and complexity/energy budgets.
5. **Metrology and units:** use dimensionless toy geometry until source physical scales and constraints are specified. Do not import GR coefficients into an assumed definition of the engine.

**Research handling:** mathematical apparatus should be assessed independently of speculative framing; no physical claim is inferred from geometric representability alone. Attribution: SAT/H(s)H user and archive research, with original sources linked above; free reuse with citation to source where appropriate.
