# Executed results, 11 October 2026

## Source-pair and historical apparatus
Test R = 0.55 cos(2t)+0.15 sin(3t), Q = 0.6 sin(3t)+0.1 cos(5t). Independent source anchors optionally aligned by one constant SO(3) rotation and tangent-frame alignment. Physical sphere minor b=(1.6+0.55)/6, inside a=0.55 torus tube. Selected-contact gear six follows the original even-multiple circuit requirement.

## Sweep
Sixty combinations of the even annulum gear `4,6,8,10`, pen angular harmonic `0..4`, and gimbal turns `(0,0),(1,0),(0,1)`. Full unfiltered, reproducible results are in `aligned_demo/ranked_candidates.json`. The experimental C¹ and curvature filters accept 24 out of 60; 15 near-degenerate gear-four cases are deliberately penalized. The selected best of the aligned case is gear six, pen turn four, gimbal turn `(0,1)`; `aligned_demo/best_run/` contains its actual geometry arrays, curves and diagnostic plots. The unaligned case has 17 smooth outputs out of 60.

## Two-input mechanism verification
The separately configured demonstration passes:

- Both scalar latitude encodings invert numerically, with source residuals of order 1e-15.
- The optional source-anchor rotation aligns an off-phase R/Q pair in position and tangent direction to within 3e-17 and 1.5e-16, respectively.
- Exact analytic rolling contact velocity residual is zero.
- Numeric fourth-order finite differences of contact velocity go from 2.14823e-4 at 128 steps to 1.34990e-5 at 256, and 8.44822e-7 at 512. Approximately sixteenfold convergence after each doubling, indicating the intended fourth-order scaling.
- SO(3) orientation and torus-wall residuals remain around 1e-14 or smaller. Whole-turn ball frame closure around 1.7e-15.
- Curvy_Lisa seam position mismatch around 1e-15, C¹ normalized tangent mismatch about 0.00117 for the configured aligned pair.
- Disabling Bishop-frame holonomy compensation gives a large position mismatch (~1.09); enabling the explicit compensation closes the traced output. This is a **documented control adjustment**, not a claim of spontaneous pen closure.
- A +1% change to R produces Curvy_Lisa RMS change 0.002867; a +1% change to Q produces RMS change 0.009027. The output thus depends on **both source equations**, rather than only on the rolling frame.
- A separate oscillator ODE versus implicit ellipse-contour pair also runs and closes, confirming more than one input type.
- The strict `b=a` original limiting geometry renders and closes its selected pen trace when geared integrally but **does not qualify as unique-contact no-slip**.

## Failures that remain useful
The default pen-turn-three pair closes but fails the heuristic smoothness selection: its curvature roughness is 148.3, compared with ~8.5 for the smoother unaligned selected candidate. An explicitly nonperiodic input `R(t)=t` fails source closure, and a nonintegral roll gear fails ball-orientation closure. These negative controls are required and retained.

## Scope
**This is a tested 3D Whirligig engineering reconstruction, not the complete mathematical 4D original.** Original GrAnn is not analytically specified as a self-intersecting annulum; this release uses a sphere great circle and logs that choice. Full R/Q 4D UI coupling, canonical equation-to-polar-curve equivalence for arbitrary PDEs, derived dynamical back hallways, and externally grounded physical tests remain to be implemented.

**Nothing here establishes GR–QM identity or an isomorphism by itself.** Closure and smoothness are candidate filters. A full isomorphism requires specified source/target domains, preserved operators/invariants, and inverse/held-out reconstructions, one sector at a time.
