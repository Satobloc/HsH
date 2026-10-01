# Morrow–Kestrel Sandbox Playground

Status: EXPERIMENTAL / NON-CANONICAL
Created: 2026-10-01

Purpose: unrestricted SAT→H(s)H construction work under the question: **If SAT is right as a largely standard-physics 4D map, how should H(s)H work?**

This branch is intentionally a playground. Historical material, current H(s)H material, prior art, speculative imports, new mathematics, failed constructions, and audacious recombinations may all be brought in and tried here. Nothing in this directory is canonical merely because it is written down.

## Working rules

1. Import first, test hard, keep useful wreckage.
2. Distinguish recovered source material from new construction, but do not use provenance caution to suppress experimentation.
3. Historical constants and particle labels may be inspected and experimented with; if a result depends on them, mark that dependence plainly.
4. Prefer explicit geometry, equations, simulation targets, and failure conditions over verbal analogy.
5. When a construction survives attack, promote only the result and its provenance trail—not the surrounding speculation.

## Active build: orientation-reversing finite-core holonomy

Seed idea from the current Morrow–Kestrel run:

- Let a closed worldtube carry finite transverse support `K_s`.
- Permit orientation-reversing closure of the transported support, `H in O(m)` with `det(H)=-1`.
- For asymmetric one-sided support radii `rho_+ != rho_-`, use the current finite-core incidence bifurcation relation

  `alpha_c^2 = 2 K rho_side`

  under successive equivalent passages.
- Orientation reversal exchanges `rho_+ <-> rho_-`, predicting a period-two threshold sequence while the maximum-contact quantity depending on `rho_+ + rho_-` remains period-one.

Sandbox discriminator:

`A_core = (alpha_c,0^2 - alpha_c,1^2)/(alpha_c,0^2 + alpha_c,1^2)`

which equals `(rho_+ - rho_-)/(rho_+ + rho_-)` in the idealized construction.

Next work in this playground should not merely protect this idea. Try to generalize it, break it, splice it into nested ᚼ transforms, compare O(m) holonomy classes, and test whether reconnection can change bundle-gluing class while preserving centerline closure.
