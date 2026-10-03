# QUARRY XLIV — FINITE-CORE TOPOLOGY AS A SCALE-FREE GEOMETRIC COST

Status: SANDBOXED / Morrow–Kestrel silo / not canonical H(s)H.

## Provenance actually read
- Old archive: `SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt`, blob `5283ceb8d06109061543711ebe7c46954efe7ede`. Substantially read beginning section containing the collapse/topological-metastability discussion, Derrick/Skyrmion comparator, Kerr/filament discussion, and finite-topology framing. No historical constants or particle fits used.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, blob `f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4`. Substantially read solver map including ᚼ, double rotation, Three-Spheres, finite-core/tangency, torus/frame-history, and noncommuting SO(4) sections.

## New construction
For a finite tube of radius a around centerline gamma, a necessary local embedded-tube condition is a*kappa_max < 1. Therefore

    L/a > L*kappa_max.

The RHS is scale invariant. It supplies a purely geometric finite-core cost/bottleneck before introducing a new topological force. Numerical torus-curve fixtures at R=2, r=0.65 gave L*kappa_max:
(1,1)=7.354; (2,3)=17.275; (2,5)=26.903; (3,4)=24.290; (3,5)=27.809; (4,5)=31.459.
These are fixture values, not knot-class minima.

## Interpretation
Old SAT's “tangle resists collapse” can be translated into H(s)H more conservatively: topology plus finite thickness restricts admissible geometry. Shrinking at fixed core radius eventually violates tube embedding through curvature and/or self-contact. The resulting obstruction can create metastability without postulating a separate topological repulsive force.

## Important correction / attack
L*kappa_max is only a local necessary thickness bound, not the full knot thickness or ropelength. Global self-distance can dominate. The next solver must compute reach/thickness = min(1/kappa_max, half doubly-critical self-distance), then minimize L/thickness within fixed knot type. If topology can be removed through the allowed 4D worldtube configuration space without contact/reconnection, the 3D knot-sector stabilization disappears.

## Tight next test
Implement a finite-core ropelength/reach solver for closed H(s)H carriers, compare unknot/trefoil/other knot sectors, then allow the fourth coordinate continuously. Measure whether the minimum finite-core obstruction persists, weakens, or vanishes in the actual admissible 4D geometry. Couple the result to the Three-Spheres collapse coordinate and ask whether topology forces branch change before carrier extinction.
