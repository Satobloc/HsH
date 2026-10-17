# OV-20261008-17 — Concrete return-neck inversion

## Source-grounded starting point
Nathan's current instruction: map real dynamics first using only explicit primitives. For H(s)H, treat the ER bridge/worldtube, Kerr-like ring/core, possible near-core shell/interface, and universal return geometry as candidates to be distinguished rather than collapsed into labels.

Historical/project sources inspected this run:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt`, opening ~500 lines and surrounding inversion construction.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/HsH COSMOTOPOLOGY.txt`, opening ~500 lines.
- `Satobloc/HsH/synthesis/CURRENT_SYNTHESIS.md`, finite-core/Kerr-ER sections.
- `Satobloc/HsH/WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md`, Kerr-ring / worldtube-neck / particle-mouth passage.
- Current front door, Reference Desk, workflow orientation, Mersearch architecture, HSH_RESOURCES Tool Chest and routing packet.
- HSH_RESOURCES `KERR/` directory surveyed after the internal construction. PRIOR_ART not opened.

## Minimal closed geometry
Begin with one concrete transverse measure: the worldtube's transverse radius `r(phi)` along a closed return coordinate `phi`.

Use a smooth closed profile that is exactly self-dual under literal radius inversion:
`r(phi) = sqrt(a R) exp[-lambda cos(phi)]`,
where `lambda = (1/2) ln(R/a)`.

Then:
- `r(0)=a` (minimum neck),
- `r(pi)=R` (maximum bulk/opening),
- `r(2pi)=a`,
- `r(phi+pi) = a R / r(phi)` exactly.

Thus the half-cycle shift is the literal inversion with scale `L^2=aR`.

For the physical cross-sectional area `A=4 pi r^2`,
`d ln A / d phi = 2 lambda sin(phi)`.

Therefore:
- `0<phi<pi`: area increases, a concrete exhaling/widening leg.
- `pi<phi<2pi`: area decreases, a concrete swallowing/narrowing leg.
- half-cycle inversion flips the sign of this expansion exactly.

A single closed return geometry therefore contains both operations. They need not be separate ontological mechanisms.

## Forced consequences
1. If a particle worldtube is globally closed and possesses a genuine minimum neck and maximum bulk radius, any smooth traversal from minimum to maximum and back necessarily contains both widening and narrowing portions.
2. Literal inversion `r -> aR/r` exchanges those portions and fixes the geometric-mean radius `sqrt(aR)`.
3. Swallow versus exhale can be defined without arrows or frames: it is the sign of the derivative of an actual transverse area along an oriented history.
4. The inversion geometry alone does NOT identify `a` with the Kerr ring, an ER mouth, or a Fermi boundary. Those are separate candidate assignments.

## Fermi-limit fork
Two minimal hypotheses remain:
- Ring-hard-limit: the minimum admissible transverse radius is the Kerr/core-ring scale.
- Shell-hard-limit: an outer genuine material/interface shell defines the exclusion radius instead.

The immediate discriminator is the actual closest-approach/contact radius. If an outer shell is physical, exclusion/contact should occur before core-ring contact.

## Failure condition
This fixture fails as an H(s)H mechanism if the actual ER/Kerr worldtube cannot be assigned a smooth closed transverse measure with a minimum/maximum pair, or if its physical metric makes the literal inversion incompatible with the candidate geodesic/causal structure.

## Next solver
Replace the scalar radius profile by an explicit Kerr/ER cross-section with separately tracked:
1. core ring radius,
2. ER throat/mouth area,
3. outer deformable shell/interface if present.

Then test whether the half-cycle inversion can map the full geometry, not merely one radius.
