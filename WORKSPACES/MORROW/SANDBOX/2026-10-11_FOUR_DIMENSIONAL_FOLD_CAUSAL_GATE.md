# Morrow/Kestrel | Four-dimensional finite-core fold and causal-transversality gate
**2026-10-11 | SANDBOXED | LOCAL:MK-FOLD4D | not canonical**

## Primary-source provenance
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt`, blob `6d117838153e554b247b33308f573a3b3509e073`, **lines 1–220 actually read**. Nathan's sphere deformation, intersection-circle, pressure, axis-wobble, and handedness proposals; assistant text distinguished.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/coupled_filament_timesheet_bridge.py.txt`, blob `eca7929806caa5617cea6deb3457b357e7a7ebb6`, **complete 4,299-character Python file read**; moving-wavefront helix and tilted-sheet multiplicity fixture.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATv TIME_WAVEFRONT.txt`, blob `fe1a6f603798c31fa4e5bf704bb31cbcc5ec4ce9`, **complete 3,400-character file read**; forward-wavefront principle vs tentative drag.
- Reviewed Common front door, current 2026-10-10 Cross-Formalism Index, symbol controls, reference desk, War Room declaration, and 2026-10-05 supporting-resource packet as navigation only. No prohibited source entered. Exact-path retrieval, not a corpus-wide Mersearch claim.

## New calculation: normal 3-ball tube in R4
In Euclidean `(x,y,z,w)`, take a local centerline `gamma(s)=(s,kappa*s²/2,0,0)` and wavefront `Sigma_b={y=b}`. Define a radius-`epsilon` tube by Euclidean normal 3-balls, **not** an external carrier. Its exact 3D wavefront-section volume is

```
V(b,epsilon)=pi ∫ [1-kappa*b+3*kappa²*s²/2]
  * [epsilon²-(b-kappa*s²/2)²*(1+kappa²*s²)]_+ ds.
```

At the quadratic tangency `b=0`:

```
V(0,epsilon)=(8*pi/5)*sqrt(2/kappa)*epsilon^(5/2)+O(epsilon^(7/2))
dV/db|b=0=(4*pi/3)*sqrt(2/kappa)*epsilon^(3/2)+O(epsilon^(5/2)).
```

Thus the **4D tube contact volume exponent is 5/2**, while the earlier 3/2 exponent can reappear in a contact-gradient/force candidate. No force is derived unless a physical energy law is supplied. For `kappa=1,epsilon=.02`, exact volume `0.000404963627282`, leading prediction `0.000402123859659`; at `epsilon=.0005`, ratio `1.000178519`. Independent integration using the wavefront coordinate `x` agrees to `3.3e-15` relative.

For `epsilon=.02`, exact `dV/db|0=0.0168532817373` vs leading `0.0167551608191`. The signed centerline intersections change from 0 to a (-,+) pair at `b=0`, net signed index remains zero. Finite-core **first contact** occurs at `b=-epsilon`, centerline fold at `b=0`, and **section neck pinch** at `b=+epsilon` in this local fixture.

## Crucial failure: causal transversality
If `Sigma_b` is a level set of a global time function with timelike gradient in induced Lorentzian geometry, any future-timelike worldline obeys `dt(T)>0`. The fold requires `dt(T)=0`. The parabola's `t=y=kappa*s²/2` reverses time direction across `s=0` and **is not an admissible future-timelike particle centerline**.

Exact causal control: `gamma_v(s)=(t=s,x=v*s,y=0,z=0)`, `|v|<1`, flat induced Minkowski `g=diag(-1,1,1,1)`, wavefront `t=b`. Its Euclidean normal-3-ball section is an ellipsoid of volume

```
V_causal=(4*pi/3)*epsilon³*sqrt(1+v²).
```

For `epsilon=.02,v=.6`, `V_causal=0.0000390794146907`. **The fold enhancement disappears** for a causal centerline. Hence the 5/2 result is valid geometry but should be assigned to an auxiliary intersection carrier, material shell director, or another non-worldline object until a physically consistent coupling is derived.

## Failure/next solver
No physical normal-core metric or contact coefficient; no reciprocal traction law; no braid invariant or particle statistic. Next: keep a timelike centerline and integrable wavefront, attach an independently evolving finite shell/director, and test whether its internal contact fold retains the 5/2 volume and 3/2 derivative without violating causal transversality. Only then compare with the fifth-power wavefront boundary traction.

Local executable report/solver and five Class P figures preserved in the automation's task-thread artifact bundle; repository checkpoint is deliberately concise.