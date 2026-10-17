# Meridian sandbox: one-core arclength superhelix (2026-10-08)

**SANDBOXED; not canonical SAT/H(s)H or a physical claim.**

## Origin and provenance
- Nathan's 2026-10-08 clarification in Meridian Free Build: only **one** microscopic finite core, following the complete convoluted trajectory; a higher-order carrier is an optional mathematical gridline, not a second material tube. Constant first-order period along physical filament length is a tentative starting assumption.
- Substantially read historical `Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/THE SPHERES.txt`, lines 1–270, including Nathan's sphere/intersection, pressure/induction, trajectory, and scale constructions.
- Substantially read current `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 1–300 (returned full 6.8KB), including multiscale homogenization and geometric-mechanics interfaces.
- After deriving, compared with `Satobloc/HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`, lines 1–220 (standard helix, framed spheres, and roll-marker limitation). HSH_RESOURCES is comparison/reference, not theory authority.
- Common `NEW_INSTANCE_START_HERE.md` and Reference Desk followed; War Room declaration and HSH_RESOURCES tool/index/preference routes overviewed.

## One physical curve, arclength parameter
Define a single 4D curve `X(s)=X(0)+∫T(s)ds`, with `|T(s)|=1`. For **dimensionless sandbox** angles `β,θ,δ`, rates `Ω,ω`, and the purely mathematical orthonormal frame

```
U=(sinβ cosΩs,sinβ sinΩs,0,cosβ)
V=(-sinΩs,cosΩs,0,0)
W0=(-cosβ cosΩs,-cosβ sinΩs,0,sinβ)
W=cosδ W0 + sinδ(0,0,1,0)
T=cosθ U+sinθ[cosωs V+sinωs W]
```

The construction has one continuous filament and no material second-order carrier. `|T|=1` exactly; prescribed **reference-frame** phase period along physical arclength is `P=2π/ω`. `c`-speed traversal is an **additional dynamical hypothesis**, not derived from geometry.

Exact curvature:

```
κ²=[cosθ Ω sinβ − sinθ(ω+Ω cosβ cosδ)sin(ωs)]²
 + sin²θ cos²(ωs)[Ω²+ω²+2Ωω cosβ cosδ].
```

For `β=.55,θ=.55,δ=.60,Ω=1,ω=8`, `κ∈[4.10366674,4.99487410]` despite constant prescribed `P=π/4`. Numerical checks: unit tangent 3.33e-16, analytic curvature identity 2.13e-14, FFT derivative 3.52e-11, 100 random SO(4) rotations 5.33e-15, transverse frame reconstruction 3.89e-15.

**Gauge issue:** rotate mathematical transverse frame by arbitrary `ψ(s)`. Then `φ_new=φ−ψ`, `a_new=a+ψ'`, so `φ'+a` is invariant, but raw `φ'` is not. A frame-free first-order period needs a material marker, a reproducible spectral decomposition, or a specified transport convention. Do not make gridlines physical.

**Counterexample to naive irregularity argument:** for a *regular* circular scaffold helix with fixed `φ=8u`, the local phase density per actual filament arclength varies from 3.4260 to 3.7089 rad/length, yet **every complete winding has identical arclength**, 1.76296617, by periodicity (16 turns numerically agree to 1.7e-13). Visual asymmetry does not by itself imply unequal complete-turn periods.

**Finite-core condition:** `r_core κ_max<1` is necessary for a local nonsingular tube, not sufficient for global self-avoidance. No Kerr radius was inserted.

**Next tests:** identify an operational phase marker/scale decomposition; compare whole-turn length under a genuinely variable-curvature second-order curve; solve a finite-core regularized medium field sourced only by the single curve and test whether a hollow coarse-grained envelope emerges. A linear response alone does not establish a soliton.

**Reproducibility:** full Python solver, verification, exact derivation and Class P plots produced in the Meridian Free Build run; downloadable package `meridian_one_core_2026-10-08.zip` attached in that conversation. No historical constants fitted.
