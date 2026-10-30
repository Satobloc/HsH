# Loom | 4D-to-3D projection-angle source-fidelity audit

**Run:** 2026-10-30T04:00Z, h=460, seq=2300  
**Status:** source discrepancy established; first Lean CI failed; repair committed; replacement CI not yet visible. No physical validation or BEDROCK promotion.

## Finding

A historical SAT transcript asks how a direction in Euclidean 4-space projects into a selected 3D, 2D, or 1D subspace. The assistant correctly observes that the fourth basis vector projects to zero when the 3D subspace is its orthogonal complement, then contradicts that result with a projection-length formula using the wrong angle convention.

For a unit vector u and subspace V:
- If alpha is the angle between u and V, then ||P_V u|| = cos(alpha).
- If delta is the tilt away from the unit normal to V, then ||P_V u|| = sin(delta).
- An in-plane projected direction exists only if P_V u is nonzero; an in-plane angle additionally needs a reference vector in V.

The historical assistant used sin(theta) while defining theta as the angle between the vector and the 3D subspace. That is the complementary-angle error. Its own earlier zero-projection observation makes the contradiction explicit.

## Source genealogy and provenance

Primary historical transcript: Satobloc/SAT_THEORY_ARCHIVE_2023-25/DOMAIN_WALL_REINTERPRETATION.txt
- Git blob: dcbf59b35000728fe0ed7e8ff995ba6b0bedb813; 1,902 lines; 69,824 characters.
- HsH mirror: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_8/DOMAIN_WALL_REINTERPRETATION.txt, same Git blob SHA. It is a mirror, not independent corroboration.
- Header attributes the dialogue to Nathan McKnight, but the file is a flattened text upload with no raw message UUIDs, author.role fields, or authenticated turn metadata. Statements remain historical speaker-attributed, not raw-role-authenticated Nathan Direct.
- Provenance audit identifies upload commit c1a60f7e78bddf22cbfb8c9165dd7b76fddb811e at 2026-01-15T20:44:05Z. Upload time is not conversation time.

At line 1475, the speaker-attributed correction rejects an internal dimension or compactification and describes the +1 as spacelike and associated with preferred/induced motion. At line 1524, time is described as the direction of expansion and 0.24 rad is posed as a candidate geometric interpretation. At line 1699, that placement is explicitly framed as an internal hypothesis.

Derivative excerpt: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/PARTICLE_BURSTS.txt, Git blob 692ca0a8c00d9f66ade36791101f817dfdf1cbe8. It repeats the same material and is not independent evidence.

Later synthesis: Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT PREDICTIONS — ROUNDUP 1.txt, Git blob bf5459a8c0984242a11bfaa632cd8d07a5a1f4d6. It recognizes the 4D-orientation versus 3D-projection distinction but supplies no exact map; raw role attribution was not verified.

The exact October 21 message summarized elsewhere as “Time distance is spatial distance” and “the inherent motion along the w vector” was not recovered as a raw export or message UUID in the checked HsH chronology or GitHub archive. The October 29 TOPLESS GEOMETRIC INTAKE is an abbreviated index note, not a verbatim substitute. Status: SOURCE_RECOVERY_BLOCKED.

## Original proposition versus assistant reconstruction

Historical speaker-attributed propositions: no extra compact dimension; fourth direction spacelike; preferred/induced motion direction; time described as expansion direction; 0.24 rad posed as a candidate geometric interpretation, not established as one.

Assistant reconstruction: proposes P_detect = cos^2(0.24) ≈ 0.945, calls the complement approximately 5.5% undetectable, invents about 10–20 cumulative filament-segment crossings (“let's say”), and extrapolates P_detect = cos^(2n)(0.24) and H_observed = H_true / sqrt(1 - f_misaligned). It also writes f_misaligned = 1 - cos^2(n theta_4), later uses ||proj_3D(v)|| = sin(theta) while defining theta as angle to the 3D subspace, and proposes “observed misalignment = 4D rotation angle × sin(projection angle)” without specifying a rotation plane.

These are assistant-generated response-model equations, not recovered SAT-O/Blockwave equations. No measured path, crossing count, dataset, uncertainty, detector model, or physical coupling operator is supplied. The 10–20 count is an invented fixture, not empirical input.

The two accumulation rules cos^(2n)(delta) and cos^2(n delta) are not generally equivalent. At n=2 and delta=0.24 rad they give 0.8901874596 and 0.7867599930. This is a pure mathematical comparison, not a physical prediction. Also cos^2(0.24)=0.9434974614, not 0.945; the complement is 5.6503%, not 5.5%.

The speaker asks for 100 degrees minus 13.8 degrees = 86.2 degrees. The arithmetic is correct. The assistant attributes a 100-degree baseline to an “orthogonal + expansion” reference and maps 86.2 degrees to the roughly 85% dark-matter share of total matter without deriving either mapping. It later switches to a 90-degree baseline and obtains 76.2 degrees without defining a transformation between reference frames. An angle is not a matter fraction.

## Corrected geometry

Let E4 = V plus span{n}, with V=span(e1,e2,e3) and n=e4 the unit normal. For unit u, let alpha=angle(u,V) and delta=angle(u,n) on the chosen acute-angle branch:

||P_V u|| = cos(alpha) = sin(delta)
|<u,n>| = sin(alpha) = cos(delta)

For u=n, alpha=90 degrees, delta=0, and P_V u=0. No projected direction or in-plane angle exists. For u=sin(delta)v+cos(delta)n, with unit v in V, the projection is sin(delta)v. A nonzero in-plane angle needs a reference vector q in V.

Pure geometric illustration, not measured physics, for delta=0.24 rad:
- delta = 13.750987 degrees; alpha = 76.249013 degrees.
- projection norm = sin(delta) = 0.2377026264; squared = 0.0565025386.
- normal-component squared = cos(delta)^2 = 0.9434974614.
If 0.24 rad instead means angle to the subspace, the projection norm is cos(0.24)=0.9713379749. The conventions differ sharply. The shared cos^2 value is not a photon-detection probability.

## Lean formalization

Draft PR #1076: https://github.com/Satobloc/HsH/pull/1076  
Branch: research/loom-projection-angle-fidelity-20261030t0400z  
Base: infra/lean4-verification-20261023  
Repaired head: 96ab1588cff77f421af1d4d37a961de37491334b  
Module blob: c923aa0a7def55d5edf8f89f7cdf71408d387c9a  
Initial CI run: https://github.com/Satobloc/HsH/actions/runs/41001478042 (FAILED).

The module encodes six conditional propositions: the fourth axis projects to zero; squared norm decomposes into spatial and normal components; the tilted coordinate vector is unit; its projected squared norm is sin^2(delta); the component squares sum to one; and coherent angle accumulation differs from multiplying independent per-step cos^2 factors.

The first run exposed noncomputable Real definitions and proof-script sequencing issues. The code was repaired and committed, but replacement exact-head CI was not yet visible. Compilation is not claimed. The source contains no sorry, admit, or locally declared axiom. The replacement job log and theorem-specific #print axioms reports must be inspected. Successful compilation would prove only coordinate identities, not source attribution, physical meaning of 0.24 rad, or photon coupling.

## Glossary

- E4: Euclidean 4D ambient vector space.
- V: selected 3D spatial subspace.
- n: unit normal to V, represented by e4.
- P_V: orthogonal projection onto V.
- alpha: angle between vector and subspace.
- delta: tilt away from the subspace normal.
- beta: in-plane angle relative to a chosen reference vector.
- 0.24 rad: historical candidate angle/phase value; physical referent unresolved.
- P_detect: assistant-proposed factor, not a derived SAT law.

## Discrepancy ledger

1. No raw role metadata or message UUIDs for the flattened transcript.
2. HsH mirror has the same Git blob as the SAT archive source.
3. sin(theta) used for angle-to-subspace; correct factor is cos(alpha).
4. Zero projection of normal axis contradicted by a formula giving nonzero projection at 90 degrees.
5. Angle-to-subspace, tilt-from-normal, and in-plane angle conflated.
6. Detector probability and cosmological correction lack a physical coupling derivation.
7. Invented 10–20 crossing fixture.
8. Numerical rounding: cos^2(0.24)=0.943497..., not 0.945.
9. 100-degree and 90-degree baselines switched without a map; angle-to-matter-fraction comparison unsupported.
10. Unsupported 4D-rotation-angle times sin(projection-angle) rule.
11. 0.24-rad referent unresolved.
12. October 21 raw source unrecovered.

## Next cursor

1. Recover the raw October 21 conversation and message UUID for the w-vector correction.
2. Recover any verbatim SAT-O/Blockwave equation defining w, theta_4, or 0.24 rad; none was substituted here.
3. Determine whether 0.24 rad means angle-to-subspace, tilt-from-normal, phase increment, or another typed object.
4. If it is an in-plane angle, identify the reference vector and ensure projection is nonzero.
5. Inspect replacement CI for PR #1076 and all theorem-specific axiom reports.
6. Keep detector and cosmological response laws separate until source equations and physical definitions are recovered.

**Scope:** no CODATA scoring, physical-data calculation, invented physical fixture, BEDROCK promotion, or paper-gate advancement. Existing Lean/Mathlib infrastructure was reused; no new compiler or CI workflow was built.
