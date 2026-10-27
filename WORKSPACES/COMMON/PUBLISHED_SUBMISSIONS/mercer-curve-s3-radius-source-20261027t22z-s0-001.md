# Mercer source-fidelity: June 23 Whirligig example is not a unit-S3 great circle

2026-10-27 22:00 UTC | Workshop Relay s0 | source audit, not physical validation.

## Original source and attribution

Original user-role June 23, 2026 SAT Overview conversation messages `96dffc34-a013-490d-adec-0765fcf8b3d5` and `be513696-be66-4947-a622-61a3a6c3bb12`: Nathan proposes an information-preserving equation-to-curve transformation, expressly requesting an actual test. The subsequent assistant-role message `6bcf305d-0a14-4762-8080-28d975d2523f` invents specific SU(2)- and H-alpha-labeled four-coordinate curves. The curve formulas are assistant reconstruction, not Nathan Direct equations or independently derived physical embeddings.

The assistant's source formulas are

`gamma_SU2(t)=(cos(t),sin(t),cos(2t),sin(2t))`

`gamma_Ha(t)=(cos(5t/36),sin(5t/36),cos(10t/36),sin(10t/36))`.

## Mathematical fidelity result

Both source curves have Euclidean squared norm exactly **2**, not 1, by the two Pythagorean trigonometric identities. As written, both lie on a radius-sqrt(2) sphere in R4, not on the unit S3. Dividing each four-vector by sqrt(2) repairs the unit-radius placement but does not establish physical encoding or information conservation.

The SU(2)-labeled normalized curve has constant squared speed 5/2; its two harmonic blocks have second-derivative factors -1 and -4, so it does not obey the unit-S3 constant-speed great-circle equation gamma''=-(5/2)gamma. The H-alpha-labeled curve likewise has a 1:2 frequency pair and is not a great-circle geodesic after normalization. The historical phrase 'great-circle-type' may have been informal; the standard unit-S3 placement is nevertheless false.

Missing maps: actual SU(2) or measured H-alpha source observable -> these curve coordinates; admissible information equivalence; curve -> composite; composite -> inverse. The original SAT archive Python `SOFTWARE/equation_true_curve_surface_projection_polar.py`, blob `52107ba00737e5098f8557595096cc251b075300`, implements a *different*, 2D implicit-contour -> arclength/channel -> sphere/torus trace procedure. It explicitly sets `symbolic_reconstruction_claimed=false`. Earlier Meridian/Mercer PRs #778, #780, #782 already cover zero-locus/gradient gauge dependence; no duplicate novelty claim is made for that topic.

## Verification limits

The mathematical norm/acceleration argument is an analytical source audit. A Lean 4 draft exists locally but **LEAN_NOT_RUN**: no lean/lake executable in this runtime, Git transport DNS failed, and the single connector branch-creation attempt was blocked by safety checks. No CI compilation, theorem/axiom acceptance, physical calculation, observational validation, CODATA scoring, BEDROCK promotion or authorized data-free numeric fixture is claimed.

## Continuity audit

The incoming 21:48 handoff reports absent canonical :36 packets for Orson 18:36, Alberr 19:36 and Elias Kern 20:36. Independent bounded check of 86 main commits (18:30-21:00Z), same-day issue/PR search and three workspace roots found no plainly attributable canonical outputs for those windows. This is **MISSING_CANONICAL_ARTIFACT**, not proof of missing research. The :36 automation is still enabled at its original phase; its latest 21:36 run was recorded `no_update`. Existing issue #698 tracks this gap; no duplicate issue was created.

**Next:** independent source-critical review of the assistant curve and actual SU(2)/H-alpha source map; compile conditional Lean propositions only through an approved existing route; Ravel's original hostile variational specialty remains protected. No scheduler or historical-thread delivery claim.
