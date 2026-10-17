# Meridian sandbox: foliation-exchange mass invariant (2026-10-08)

**Status:** SANDBOXED, standard-GR identity tested, no new physical claim. **Namespace:** LOCAL:MERIDIAN-FOLIATION-EXCHANGE; standard GR notation otherwise. No historical SAT constants fitted.

## Sources actually read
- Original archive `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, fetched lines 1–440 and 250–570 (overlap). Used the 4D rotation/UI/tetrad mapping as a *historical generated synthesis*, not proof.
- Live HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 1–600, particularly Frobenius/ADM time-normal proposals at ~120–140. Mixed conversation, authorship not homogenized.
- Live HsH `🔑/🔑.md`, opening current conceptual correction.
- Controlling `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and material onboarding/control pointers, `REFERENCE_DESK/README.md`, Mersearch release guidance, and 5 Oct HSH_RESOURCES routing. In HSH_RESOURCES inspected `HQ/THE_WAR_ROOM/DECLARATION.txt` (opening 100 lines), `indexes/ai_source_index/HSH_TOOLKIT.md`, `info/TOOLKIT_DIGESTION.md`, `HQ/TOOL_CHEST.md`, `!_HSH_RESOURCES_INDEX.md`, `info/NATHAN_PREFERENCES/BOOT.md`, and openings of the Einstein/Minkowski texts. The remaining directories/War Room links were routed via the reference desk, not individually ingested. No PRIOR_ART/quarantine entered. HSH_RESOURCES BigBook index path was unavailable; HsH's `WORKSPACES/COMMON/REFERENCE_DESK/SAT26_BIGBOOK_INDEX_2026-10-05.md` was read instead.

## Exact derivation
In spherical GR with areal radius `r`, unit timelike foliation normal `n`, induced spatial metric `h`, and Misner–Sharp mass `m` (geometrized units):

`2m/r = 1 - g^{-1}(dr,dr) = 1 - |D r|_h² + [n(r)]²`.

The intrinsic angular sectional curvature is `k_tan=(1-|D r|_h²)/r²`; the angular extrinsic-curvature eigenvalue obeys `b=K^θ_θ=±n(r)/r`. Thus

**`2m/r³ = k_tan + b²`.**

This is an exact **refoliation invariant** within spherical symmetry, not a new mass-generation mechanism.

## Three controls
- Static Schwarzschild: `k_tan=2M/r³`, `b=0`. Its spatial scalar curvature is zero despite nonzero sectional curvature.
- Painlevé–Gullstrand Schwarzschild: `ds²=-dt²+(dr+sqrt(2M/r)dt)²+r²dΩ²`; flat spatial metric, `k_tan=0`, `b²=2M/r³`, `m=M`. The extrinsic eigenvalues are `(-b/2,b,b)`, so vacuum Hamiltonian constraint holds.
- Milne Minkowski: `r=t sinhχ`, `k_tan=-1/t²`, `b²=1/t²`, so `m=0`. This directly resolves the prior Milne negative-curvature obstruction at the 3+1 level.

## Continuous exchange and falsifier
For `t_p=T+p F(r)`, `F'=sqrt(2M/r)/(1-2M/r)`, `0≤p≤1`, `q=2M/r<1`:
- `k_tan/(2M/r³)=(1-p²)/(1-p² q)`;
- `b²/(2M/r³)=p²(1-q)/(1-p² q)`.
Sum equals **1** exactly for all exterior `r,p`.

For arbitrary stationary flat-slice radial shift `V(r)`, `K^r_r=V'`, `K^θ_θ=V/r` and the Hamiltonian constraint gives `16πρ=2(rV²)'/r²`. Vacuum requires `V²=2M/r`; generic shifts fail. Momentum constraint vanishes identically in this restricted ansatz.

## Reproducibility and next cursor
SymPy exact symbolic checks and 10,000 numerical samples passed; worst relative mass error `1.229e-15`. Local artifacts: `verify_foliation_exchange.py`, `verification.txt`, Class P plots `foliation_exchange_fractions.png` and `milne_schwarzschild_comparison.png`; downloadable package provided in task thread.

**H(s)H discriminator:** any proposed ᚼ solver must preserve the mass/curvature invariant under legitimate refoliation, not attribute mass uniquely to spatial bending or normal turning. Test next on time-dependent spherical dust (LTB) with full constraints, then assess nonspherical Kerr. Keep physical torsion interpretations separate from ADM extrinsic curvature.
