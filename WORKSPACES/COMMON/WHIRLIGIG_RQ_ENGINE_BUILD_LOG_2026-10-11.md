# SANDBOXED: two-equation R/Q Whirligig mechanical build, 2026-10-11

**Status:** executable local engineering reconstruction, 13 passing Python tests, NOT the complete historic 4D annulum specification, not a GR–QM proof. This is a genuine successor to the narrow Clifford-torus/elastic calculation. User's active task: make the Whirligig a configurable two-equation geometry engine with exact rolling/gimbals, measured closure and a filter for smooth candidate translations.

## Sources actually inspected

- [Finding the Donut, pp. 23–27](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/FINDING%20THE%20DONUT%20(nolat).txt): R and Q independently drawn on a sphere, anchor geometry, i_r / i_q, perpendicular pinned plane axes, GrAnn, W_obble connector midpoint, W_iggle perpendicular plane, rotational vector V, rolling sphere confined to a donut, P_ivot, Donomphulon and Curvy_Lisa on torus.
- [Historical THE_WHIRLIGIG](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/HsH-SAT%20Roundup%203/THE_WHIRLIGIG.txt): fourth-order variational dynamical version, geodesic/spectral targets.
- [Existing continuous Navier–Stokes Whirligig Python source](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/continuous_ns_whirligig_solver%20%281%29.py): reference mechanics for hemisphere curve encodings, body/world contact frames, Bishop connector, and torus wall intersection.
- [Whirligig Redefining Success](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/WHIRLIGIG%20--%20REDEFINING%20SUCCESS.txt): a search for *one* constructive common realization, not necessarily a unique algebraic derivative.

## Implemented mechanism

**Equation input adapters**: AST-safe scalar f(t)→invertible spherical latitude; 2D parametric trajectories→reversible stereographic lift; 3D trajectories→radialization with original radii preserved; closed implicit F(x,y)=0 contour extraction; 1–3-dimensional IVP ODE integration; numeric closed-curve CSV for more complex equations. No unsupported 'any equation automatically' promise: a PDE/Schwarzschild metric requires a selected solution, parameters, observables and chart before low-dimensional encoding.

**Selected-contact rolling constraint**: torus major R, tube minor a, ball radius b<a, circle of sphere centers of radius ρ=R+a−b. Let e_r(ψ) be the outward radial vector and C=ρ e_r. Contact point P=C+b e_r=(R+a)e_r. No-slip at this isolated contact demands ω_z=−(ρ/b) ψ_dot. Define GrAnn body phase γ=(R+a)ψ/b and orientation matrix Q(ψ)=W(ψ)B(γ)^T∈SO(3), with W=(e_r,e_φ,e_z) and B=(r_GrAnn,t_GrAnn,n_GrAnn). Then P=C+Q b r_GrAnn; selected-contact velocity vanishes **analytically**. Even integer gear g=(R+a)/b yields historic 'even circuits of GrAnn per outer torus revolution' and exact orientation closure. Default R=1.6, a=.55, gear=6, b=.3583333333, ρ=1.7916666667.

**Physical limitation**: when b=a the torus and sphere have a whole meridional set of contacts; no-slip at all such contacts is overconstrained. A separately selectable equal-radius **historical rendering** is supported, but must NOT be certified as isolated-contact rigid-sphere rolling. The documented GrAnn has a self-intersection/self-tangent not defined by an analytic curve in the historical text: this build uses a great circle as its explicit surrogate, not a false claim to have reconstructed an unspecified special curve.

**Dual gimbal**: independent orthogonal internal Ry(pitch) and Rx(roll) hinges, periodic angles, with optional single rigid SO(3) alignment of R point/tangent at parameter 0 and Q point/tangent at an independent half-circuit phase; the intervention and matrix are saved.

**Wobble/Wiggle/Curvy_Lisa**: two world endpoints carried on rolling sphere, connector D=Q_world−R_world, W_obble midpoint, W_iggle perpendicular to D, Bishop (parallel-transport/minimum-rotation) normal basis, rotating pen in plane, *smallest positive real root* of implicit torus quartic for first forward intersection. Output is the traced geometric candidate Curvy_Lisa.

**Closure** checked distinctly for source endpoints, ball orientation (SO(3)), R/Q connector, pen-frame holonomy and Curvy_Lisa positions/tangents/curvature. An explicit, recorded Bishop-holonomy phase compensation closes the pen if desired; uncompensated run is an essential negative control. Closure alone is never a mathematical isomorphism claim.

**4D support**: separate exact SO(4) six-plane Universal Indicatrix companion `y(s)=r(s)R(s)x0` with skew-exponential rotations. It is not yet coupled to 3D physical rolling and is not advertised as a complete 4D contact mechanism.

## Executed numerical results

**13/13 Python tests pass**, including malicious-expression rejection, stereographic inverse, exact gimbal/roll orthogonality, source invertibility, nonperiodic-input and irrational/noninteger-gear negative controls, ODE oscillator, implicit circle, smooth-candidate search, historic equal-radius degeneracy, SO(4) orthogonality, paired source-anchor alignment, and fourth-order grid convergence.

Synthetic input R=0.55 cos2t + 0.15 sin3t, Q=0.6 sin3t + 0.1 cos5t:

| Diagnostic | Result |
| --- | ---: |
| Analytic no-slip selected contact | 0 exactly |
| Numerical rolling-velocity residual, n=128 | 2.14823e−4 |
| Same, n=256 | 1.34990e−5 |
| Same, n=512 | 8.44822e−7 |
| SO(3) sphere orientation closure | 1.73e−15 |
| Torus implicit residual | 8.53e−14 |
| R/Q independently phased anchor point/tangent mismatch after alignment | 2.89e−17 / 1.42e−16 |
| Curvy_Lisa positional closure with recorded holonomy compensation | 8.55e−16 |
| Curvy_Lisa unit tangent closure | 0.00117 |
| Without holonomy compensation, position closure defect | ~1.09 |
| +1% R amplitude causes output RMS change | 0.0028668 |
| +1% Q amplitude causes output RMS change | 0.0090273 |

All figures are dimensionless mechanical tests, not measured physical observables.

**Automated search:** 60 trial combinations (four even annulum gears × five pen winding rates × three gimbal settings) saved **without discarding failures**; 24 satisfy heuristic smoothness criteria in the source-anchor-aligned version. Penalize near-degenerate sphere clearance; score first-derivative closure, curvature roughness, curvature-percentile, and low-order Fourier approximation errors. The best aligned trial: even gear 6, pen winding 4, first/second hinge turns (0,1), an actual closed and smooth trace. These criteria are engineering filters, not derived physical laws.

**Test harness source** built and executed in conversation container:
`whirligig.py` (R/Q engine + ranking), `ui4d.py` (SO(4) companion), `test_whirligig.py`, `plot_mechanics.py`, `validate_mapping.py`, three example JSONs, source/derived data and generated images/GIF. **The complete tested source is now committed in [tools/whirligig_rq](https://github.com/Satobloc/HsH/tree/main/tools/whirligig_rq)**, including engine, six-plane SO(4) companion, tests, plotting/validation tools, requirements, three example inputs, README and results ledger. Eleven out of eleven repository text files were independently fetched back and verified **exactly identical** to the local transfer bytes. The local results, figures, data and animated GIF are additionally available as a generated conversation ZIP.

## Next computational priorities

1. Obtain precise historic GrAnn mathematical constraints from archive; implement a self-intersecting annulum instead of a gratuitous surrogate, with pin/tangent tests.
2. Couple six-plane 4D UI transforms to the two-target sphere/gimbal/contact controls without confusing 3D visual carrier and four-dimensional construction.
3. Find actual equations for Curvy_Lisa transformation under known source-to-target maps, measure joint dynamical residuals and inverse reconstruction; do *not* infer isomorphism from closure.
4. Advance discrete candidate ranking to smooth constrained optimization, including nondifferentiability detection at root switches and semi-analytic arc-length/jacobian regularity tests.
5. Recover original user-specified source equations and compare held-out Kepler↔hydrogen / Schwarzschild deformation tests in separate typed sectors.
6. Add repository CI and obtain hostile mechanical review from other workers before treating the code as a shared production solver.

## Related independent Mersearch note

The separate `2026-10-11-orson-morrow-inspiral-package-001` Mersearch manifest confirms a pinned three-repository run at `mersearch-stable-1.0`, but its results were reported by Tern as malformed/blank via connector retrieval. **Do not infer Paper A presence from that manifest alone.** It was not used as evidence for this build.
