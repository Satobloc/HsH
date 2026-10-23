# Equation Intake 0002 | First independent audit + Mersearch receipt
**Date:** 2026-10-23. **Status:** historical equation audit, not H(s)H candidate or physical validation.

## Search status
The preexisting shared Mersearch request `2026-10-21-orson-nlm-big-haul-math-001` has a *completed* request-specific manifest and receipt in `indexes/mersearch_requests/2026-10-21-orson-nlm-big-haul-math-001/`. Manifest blob `0f017d6f557d24c721e417d1fe3c49abf0653991`; receipt blob `191acaf733c8e59920ca16c53ccb74d6be90f3c6`. Stable pinned engine `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`; repo commits archival `8394f761d94fb2869266cb5b377a320ab4cfb235`, HsH `0dbd2349abd28cd0941f4a3f898e60b14d8afc5a`, resources `63a28e8ae5467641220a692cb8476694c9664c7d`. Scanned 13,897 files / 23,825,506 records; 34,983 hits; 1,627 distinct paths. Hit counts by root archive 3,468; HsH 30,113; resources 1,402. The receipt is a search navigation sample, not 34,983 distinct mathematical equations. Shared request preserved unchanged, and **this worker did not start the run**. Resource-root detailed hits are not reproduced publicly. Follow raw sources before genealogy conclusions.

## EQI-001 / EQI-002: source-defined historical action, decisive algebraic audit
Direct historical source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/FREEFORM DISCUSSION/SAT Lagrangian and Variational Derivation.txt` blob `9d5db44f16f1f2d853332efd8d91995a37e8d394`. Its displayed Lagrangian:
```
L = 1/2 (∇θ)^2 - μ² cos(3θ) + λ (u·u+1)
    + α ∇μuν ∇^μu^ν
    + β (∇μθ)(∇^μ u^ν)u_ν
```
Historical printed theta field equation: `□θ+3μ² sin(3θ)-β ∇μ[(∇^μu^ν)u_ν]=0`.

**Independent sign audit:** With `L=+1/2 (∇θ)^2 - μ²cos(3θ) + β∇θ·A` and `A^μ=(∇^μu^ν)u_ν`, Euler–Lagrange gives
```
∂L/∂θ = +3μ² sin(3θ);
∂L/∂(∇μθ) = ∇^μθ+β A^μ;
=> □θ − 3μ²sin(3θ) + β∇μA^μ = 0 .
```
Thus the historical theta equation shown in that document has BOTH the potential and β divergence signs opposite to its own displayed action under the standard E–L convention. **This conclusion is conditional on the L exactly as displayed, with no extra overall signature sign inserted into its kinetic term.** Neither equation is automatically current H(s)H. Independent SymPy verification in this turn evaluated `dL/dtheta=+3μ²sin(3θ)`, `dL/dp=p+βA`.

**More consequential structural simplification:** Metric compatibility implies
```
A^μ = u_ν ∇^μu^ν = (1/2)∇^μ(u_ν u^ν).
```
Therefore the β coupling is proportional to `∇θ·∇(u²)` and is identically zero *when the unit-norm constraint is imposed pointwise*. SymPy independently checked this identity in a 1+1 signature toy metric; the tensor identity holds with compatible connection in arbitrary dimension. The subtlety: imposing constraints **before versus after varying** can change off-shell equations; the multiplier λ must be retained, and any β-induced u equation must be examined jointly and for boundary terms. No claim yet that the complete constrained action is physically equivalent after eliminating β; only on-constraint value is zero and theta on-shell divergence source vanishes if ∇(u²)=0 everywhere.

**Result:** historical theta equation internally inconsistent with displayed action (conditional sign audit); β contribution is constraint-related rather than an unconstrained new coupling. **NOT mathematically cleared as an exact original action+equations pair.** Proceed with complete constrained variation, test coupling redundancy by integration by parts / λ redefinition and boundary terms, check historical later corrections in same-family primary files. Preserve old printed equation verbatim for genealogy.

## More source-recognition from completed Mersearch receipt
Search receipt has likely duplicate passages in `archive/COMPOSITE 1.txt`, `archive/JETSTREAMS 2.txt`, and `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/COMPOSITE 1.txt` at sample `line:29664`; no deduplication or identical SHA asserted here. Samples refer to early SAT Lagrangian, braid smoothing, helium-3, and Rydberg as dimensional anchor. Retrieve exact source ranges and classify origin vs retrospective summary before reuse.

## Diagram / physics typing guard
Current diagram contains 3 persistent RGB tubes, axial `w`, separate Kerr rings, time slice, gravitational/ergosurface/horizon annotations, disturbances and Kelvin vortices, vibrational modes. **Geometric drawing grammar ≠ identification of Kerr's exact event horizon with the Schwarzschild radius** (rotating Kerr horizon location depends on spin and angle/readout). Image labels are not equations. Equations must identify which geometric object/metric/section they describe.

## Follow-on intake lanes
H0 variational: historical later-correction discovery on EQI-001/2; H1 formal SO(4) / UI operators; C0 Kerr finite core/medium; E0 Maxwell, Navier–Stokes, Kerr benchmarks; X0 cross-sector dependency graph. Anyone may select a lane and record the claim/work/result while working; lanes are not assigned permanently to named workers. No change to BEDROCK and no candidacy promotion.
