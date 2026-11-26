# Amendment 01: Correct Source Placement and Filament-Order Typing

**Applies to:** the published h1118:s0 source-fidelity report in [issue #2611](https://github.com/Satobloc/HsH/issues/2611).  
**Purpose:** additive provenance and type clarification. This is not a replacement report and does not change any SAT-O1 or Blockwave equation.

## 1. Move the 10^44 J recollection to its actual source conversation

The original report placed the sentence about message 2bef9e5d-cf4d-4cb2-959f-218e032e5263 under the 2026-10-09 Meridian Free Build section. That placement is wrong.

The message is a direct user message in **Meridian Minkowski Ring Analysis**, conversation 6ad7e9c0-e8a0-83e9-984e-94d020de3abf, raw blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703, at 2026-10-21T06:32:15.993Z. It recalls a prior worldtube “tension” near 10^44 J and a possible maximum-bending bound. The follow-on direct message a0e0be28-5bd8-45da-9991-1e075f09728d at 2026-10-21T06:34:36.336Z says maximum bending energy had previously been calculated and asks that Planck units be retained.

The earlier 2026-10-09 Meridian Free Build messages 44e9df22-a6ac-49ca-92ac-c74c8f137310 and 5a929b5e-515e-4f77-a32a-e49feef42812 instead establish that flexibility and tension are model quantities to investigate, and reject the assistant's categorical denial of such quantities.

The 10^44 J recollection remains a direct historical claim, but it is not an independently recovered calculation or measurement. Joules are energy units; without a constitutive definition and dimensional map, this is not yet a mechanical tension in force or force-per-length units. No numerical value is used as a physical input, and no calculation is made.

## 2. The 0.7 fm scale and the 4D-filament / 3D-trace distinction

The direct 2026-10-09 message 1178f25c-9f92-4d1c-b43b-06482e6bf1b1 at 07:40:38.859Z makes two separate corrections:

1. Approximately 0.7 fm is a bound on the presumed spin-equivalent first-order coil radius/diameter, not filament thickness. The filament's stiffness sets coil size. Determining stiffness would require precision particle-momentum data under a known force. No such dataset was loaded in this run.
2. A 3D closed-loop image is not automatically the 4D filament itself. The direct message describes the image as a possible 3D intersectional trace of a higher-order 4D filament and says that a 4D filament need not self-close in the 3D cobordism. The message's phrase “3D intersectional trace” and its comparison with a closed-loop string do not fix the trace's intrinsic dimension.

This type ambiguity matters. Under the transversality hypotheses already formalized in PR #873:

- 1D core intersecting a 3D hypersurface in 4D gives a 0D intersection.
- 2D worldsheet intersecting a 3D hypersurface gives a 1D intersection.
- 3D boundary intersecting a 3D hypersurface gives a 2D intersection.
- 4D support intersecting a 3D hypersurface gives a 3D section.

Therefore a 1D closed loop, a 2D worldsheet, a 3D boundary trace, and a 3D section of a 4D support must remain separate candidates. The direct source has not yet typed the “second-order 4D filament” sufficiently to choose among them. The one-core/no-second-order-core instruction concerns physical core count; “second order” may describe the geometry or winding order and must not be converted into a second physical core.

## 3. SAT4D phase-locking scope

The full SAT4D live draft includes the relation

\[
\phi_i-\phi_j=\frac{2\pi k}{n}
\]

in its phase-locking discussion for two or more filaments in a bundle. The standalone SAT-O1 file does not contain that section. This relation is not a single-core circular-helix constraint and does not by itself guarantee constant radius or pitch-independent coil radius.

The 2024 direct helix description and the later one-core model therefore still require a separately defined single-core geometry and a map from its amplitude, frequency, and phase parameters to the first-order coil radius. No constraint is inserted here.

## 4. Formalization and limits

PR #873 head is 94b6d96c91806a95505260a3c52220f4af294185. Exact-PR-head Actions run #44090154878 passed, including the workflow's exact-head checkout assertion. Later same-head run records #44483178851 and #45357400510 failed, but no job payload was returned for those runs; no failure cause is assigned.

The Lean dimension results prove only the conditional finite-dimensional intersection formula. They do not decide whether the direct “filament” is 1D, 2D, or a 4D support, and they do not establish the physical meaning of “second order.”

## 5. Net correction

- The 10^44 J recollection is relocated to its verified 2026-10-21 source conversation and retained only as an unverified historical energy-valued claim.
- The 0.7 fm value remains a coil-radius/diameter bound, not filament thickness.
- The 4D filament and its 3D trace remain distinct, with the trace dimension unresolved.
- The single physical core is not multiplied by the phrase “second-order.”
- No corrected equation, physical calculation, CODATA score, measurement claim, or BEDROCK theory promotion is made.
