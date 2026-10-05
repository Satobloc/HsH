# Quarry 087 — Reconnection barrier from curvature + finite-core neck cost

Status: SILOED PLAYGROUND / sandbox conjecture, not canonical SAT/H(s)H.

## Provenance actually read
- Old SAT: `2025-8-24 STATUS OVERVIEW.txt`, blob `a23e1458a882340de4f6319c7eb8a34c7f6c5ab0`, lines 1–1000 requested/read. Extracted: curvature action `S=(T/2)∫||γ¨||²dλ`; old reconnection vertex `exp[-T ell_f²] alpha_top`; alpha_top explicitly unresolved/set to 1 in the toy calculation.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H REWORK.txt`, blob `bb44ca943f9aa1d8a398239281a1c2c4b7827f21`, lines 1–1400 requested/read. Extracted: finite-core worldtube primitive; current control stack; explicit instruction to derive dynamics from available kinetic/tension/bending/interfilament terms and not repair-fit old constants.

## Independent build
For a local reconnection saddle requiring net tangent turn Theta across neck arclength ell, Cauchy–Schwarz gives
`∫κ² ds >= Theta²/ell`,
with equality at constant curvature. Thus the inherited curvature penalty gives
`S_bend >= B Theta²/(2 ell)`.
Finite core supplies a competing positive neck/line/contact cost modeled minimally as `Gamma ell`. Therefore
`S_sad(ell)=B Theta²/(2ell)+Gamma ell`.
Minimization yields
`ell_* = |Theta| sqrt(B/(2 Gamma))`,
`S_* = |Theta| sqrt(2 B Gamma)`.

## Sandbox completion
Replace the old free reconnection factor `exp[-T ell_f²] alpha_top` by a barrier computed from an actual local saddle:
`w_rec ~ exp[-S_*] × (frame/topology selection factor)`.
The old `ell_f` then becomes a derived saddle width rather than an independent reconnection knob.

## Attack / failure conditions
- If no positive finite-core neck/contact cost Gamma is derivable, the optimum runs to ell→∞ and no local reconnection scale is selected.
- If the true saddle is not approximately a fixed-turn elastica, the coefficients/form change.
- In 4D the tangent can turn through multiple normal planes; Theta must be replaced by the geodesic distance / ordered frame rotation actually required by the gluing map.
- This derives a geometric barrier, not a reconnection probability until the measure/prefactor is specified.

## Tight next solver
For two finite-core tubes with prescribed incoming/outgoing tangents and frame registry, numerically minimize the full local HsH action over reconnection patches. Compare measured `ell_*` and saddle action against the analytic scaling `ell_*∝|Theta| sqrt(B/Gamma)`, `S_*∝|Theta| sqrt(B Gamma)`. Sweep gluing-frame mismatch to see whether it adds an independent twist term or renormalizes Theta/Gamma.
