# Crullerverse degree-two folds and temporal monotonicity gate
Date: 2026-10-22. Status: SANDBOXED exact theorem + executed numerical fixture; not physical particle derivation.

## Provenance
Read HsH `WORKSPACES/MERIDIAN/SANDBOX_2026-10-22_CRULLER_TEMPORON_DEGREE_INTEGRABILITY_GATE.md`, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md`, and checked shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`. Orson owns pending slot. Additional direct HSH_RESOURCES code search for 'Temporon', 'Bosonic Time', 'time wavefront' gave no matches; NOT a full Mersearch.
Local Python/SciPy executed `cruller_degree_fold_20261022.py`; figure `cruller_fold_gate_20261022.png` generated locally, NOT included in this GitHub commit.

## Geometry
For circle-valued slice phase, p_A(u)=2u+A sin(3u) mod 2pi, 0<=u<2pi. Lift p_A(u+2pi)=p_A(u)+4pi, so degree m=2. Derivative p'_A=2+3A cos(3u). All local crossings positive if |A|<2/3; local folds emerge only for |A|>2/3. Actual footprint-pair changes occur only when the chosen sheet phase passes a fold critical value, so the threshold does not guarantee more intersections at a fixed sheet.

For regular target p=1.5 modulo 2pi, executed root-find across winding lifts yields:
A=.4: n=2, n+=2 n-=0, signed degree 2.
A=.7: n=2, n+=2 n-=0, signed degree 2 (folds exist but do not cross target).
A=1.7: n=4, n+=3 n-=1, degree 2.
A=2.5: n=6, n+=4 n-=2, degree 2.
A=5.0: n=10, n+=6 n-=4, degree 2.
This is non-physical scalar phase map, not a 4D finite-core embedded coil. A single connected domain with many footprints is mathematically possible; the original cosmic geometry must establish the relevant phase map and its degree.

## Critical temporal monotonicity obstruction
If an electronic trajectory is future-directed timelike for an effective Lorentzian structure, and T is a genuine global time function with timelike gradient, T strictly increases along that trajectory. It cannot meet the same level set T=t twice. Thus multi-footprint one-electron ideas cannot be justified by following ONE future-directed timelike material curve forward through a genuine Cauchy timeslice, absent a different mechanism. Possible distinct cases to test:
(A) one global coil which is *spatially multiply branched* through a single timeslice with different material histories, requiring finite-worldtube definition;
(B) a periodic circle-valued **phase**, not a global causal time function, with degree m>1; then check CTC/causality issues;
(C) multiple physically independent resolving sheets, not just different values of T; needs physical derivation;
(D) backwards-in-effective-time segments analogous to Wheeler, with standard causality constraints.
Do not assert the toy winding degree immediately means two actual electrons per cosmic wrap, or that a negative crossing must equal positron.

## Next gates
Use actual Cruller return map Q and marked material flow. Specify whether slice-phase is a true time function, periodic angle, or independent material resolver. Derive transverse intersection count for an immersed/embedded finite-core worldtube on actual 3D section. Revisit historical temporon fluctuations subject to Frobenius n wedge dn=0 and causal direction constraints. Distinguish 2025 archive labels from a verified origin date. 
