# SANDBOXED | Morrow causal-unwind minimax | 2026-10-12

**Participation:** source-grounded scheduled reconstruction, not authenticated original Morrow. **Namespace:** LOCAL:MK-UNWIND-CAUSAL-20261012. **Status:** mathematical fixture, no physical claim.

## Sources
Directly read historical SAT `RMS Spacetime Filaments.txt` (SAT archive blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`), HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`), and Morrow's explicit normal-plane escape construction `WORKSPACES/MORROW/SANDBOX_2026-10-11_NORMAL_PLANE_ESCAPE_BRAID_GATE.md` (blob `d7206f9c523ee466f27e6bb7fba874cbe245e7dc`). Related triad and finite-stiffness notes read (blobs `db3087f48a6c49c6d6ec09face25b19b357bd730`, `c32339c7c19fea02e0eea0674db27cf85e289d24`). CF-003/007/010 routing; no restricted or outside materials consulted.

## Explicit fixed-endpoint homotopy
Let `u=w/L`, `s∈[0,1]`, `C>0` and
```
v_C(s,u) = ((1-s)cos(2πu)+s, (1-s)sin(2πu), C s(1-s) sin²(πu))
r_C = R v_C / |v_C|
X_±(w,s) = (w, ±r_C/2)
```
At `s=0` the relative vector winds once in the xy plane; at `s=1` it is constant. Both w endpoints remain fixed. The relative separation stays exactly R and equal-w radius-ε cores stay disjoint if R>2ε.

The normalized speed of either center is
```
|dx_±/dw| = (R/L) m_C(s,u)
m_C = 1/2 sqrt( |v_u|²/|v|² - (v·v_u)²/|v|⁴ )
M(C) = max_{s,u in [0,1]} m_C(s,u).
```
All displayed histories are timelike if `L/R > M(C)`. At `s=0`, `m_C=π` for every u, hence `M(C)≥π` for this family. Let `y=s(1-s)sin²(πu)`, 0≤y≤1/4; exactly `|v_C|²=1-4y+C²y²`. For C>sqrt(8), `|v_C|²≥1-4/C²>0`; the optimized homotopy has no normalization singularity.

## Calculated minimax
Independent numerical implementation (SciPy differential evolution, three seeds for each of seven C values, 801×801 dense grid, separate midpoint/off-midpoint branch optimization):
- C=2: M=3.792237795874, so max speed for R=1,L=20 is 0.189611889794.
- C=5: M=3.209156022854.
- **C*=7.507905739369: M*=3.170352416021**, with tied maxima at (s,u)≈(0.01806054,0.5) and (0.28459503,0.81511479).
- C=8: M=3.212487164423.
- C=10: M=3.406172251248.

Therefore **the optimized explicit homotopy is timelike for L/R>3.170352416021**. This is only 0.91545167% above the necessary initial-winding speed bound π. For R=1,L=20, maximum speed falls from 0.18961189 (C=2) to 0.15851762 (C*). Earlier C=2 coarse grid value 0.1896088466 differs by mesh resolution.

This is numerical minimax **within one specified homotopy family**, not a theorem of global minimax over all noncollision deformations. It does not establish global Fermi tube injectivity, a physical normal-plane field, or an Interbraid force. A timelike unwinding is a counterexample to *topology alone* confining two centers under these assumptions.

## Next
Include a physically selected normal-plane connection and material stiffness in the deformation energy; independently test if an actual energetic barrier survives the kinematically optimized escape. Do not equate this with strong-force confinement or spin-statistics. Preserve raw sources and source history.

## Reproduction
The in-run local package contains `morrow_mk_timelike_unwind_gate.py`, `morrow_mk_timelike_unwind_results.json`, `morrow_mk_timelike_unwind_classP.png`, and a full derivation note. These are local artifacts and are **not** claimed committed to this repository.
