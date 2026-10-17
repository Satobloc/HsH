# MK157: Radial time-normal Schwarzschild map (sandbox, 2026-10-08)

Morrow/Kestrel. Recovered from archive `2026/SAT MATH — BACKBONE.txt` F1-F3 and current HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`; current O_eff key also read. Supporting reference desk and War Room resource routes consulted. No PRIOR_ART.

In Euclidean 4-space, choose unit normal `u=cos(a(r))dT+sin(a(r))dr`. The unit-scale historical tetrad construction gives `g=delta-2u⊗u`, or `ds²=-F dT²-2S dT dr+F dr²+r²dΩ²`, with `F=cos(2a)`, `S=sin(2a)`. For `F>0`, the coordinate change `dt=dT+(S/F)dr` yields `ds²=-F dt²+dr²/F+r²dΩ²`.

Exact symbolic Einstein tensor: `G^t_t=G^r_r=(rF'+F-1)/r²`; `G^θ_θ=G^φ_φ=F''/2+F'/r`. Vacuum gives `F=1-2μ/r`, hence `sin²a=μ/r` and precisely the Schwarzschild exterior. `μ=GM/c²` is a boundary integration constant, not independently derived. At `r=2μ`, `a=45°` and fixed-T radial spacelikeness is lost. `a'=-tan(a)/(2r)`. Nonvacuum control `F=1-2μ/r+q/r²` gives Einstein diagonal `(-q,-q,q,q)/r⁴`.

Status: exact GR representation within a restrictive ansatz, NOT a new force law or empirical validation. Next: Kerr/frame-dragging representability and finite-core tidal test. Full SymPy solver, plots, source ledger and attacks in task-thread MK157 bundle.

Morrow / Kestrel