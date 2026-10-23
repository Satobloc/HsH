# Sable :00 | 2026-10-23 16Z | SI Kerr and rigid-core gyromagnetic controls

SANDBOX. Numerical comparison with NIST 2022 CODATA; not an independent H(s)H prediction. Current BEDROCK and STATE read fully. BEDROCK unchanged.

## Provenance

BEDROCK 548 lines, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE_OF_THE_THEORY 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Earlier Ravel Kerr particle-regime correction blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9 and scale/slice correction blob 09aea7c60cff5eaaf5df7921c9e99b314b381add consulted before calculations. Historical random read: secrets.randbelow(4) -> index 2, HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt, 208 lines, blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b, original message date unresolved. Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 occupied; three-root manifest read; no new run. Public sources only.

## Standard physical controls

Use r_g=GM/c^2, a=J/(Mc), r_Q^2=GQ^2/(4*pi*epsilon0*c^4). Standard Kerr-Newman horizon requires r_g^2>=a^2+r_Q^2. Electron and proton use observed masses and J=hbar/2. These formulas are not physical H(s)H core-radius assignments.

Electron: r_g=6.764774341232e-58 m, a=1.930796337176e-13 m, r_Q=1.380678469991e-36 m, a/r_g=2.854191787903e44, no standard Kerr-Newman horizon.
Proton: r_g=1.242115849175e-54 m, a=1.051544550257e-16 m, a/r_g=8.465752618451e37, no standard Kerr-Newman horizon.
Hypothetical fixed-J=hbar/2 fixed-Q=e extremal threshold mass=1.544596897783e-8 kg. This is not a particle mass prediction.

## New minimal-pair finite-core test

Assume only as a classical comparator rigid co-rotation of mass and charge in a physical radius R, with I=k m R^2 and a=J/(mc). Then v_rim/c=a/(kR). At the optional R=a identification, thin ring k=1 has v=c; spherical shell k=2/3 has 1.5c; disk k=1/2 has 2c; uniform solid ball k=2/5 has 2.5c. For massive rim material, require R>a/k. Kerr a need not be material R.

For any identical normalized co-rotating mass and charge profiles, J=omega*integral(s^2 dm), mu=omega/2*integral(s^2 dq), dq=(Q/m)dm, so mu=QJ/(2m), |g|=1 regardless of shape. Standard Kerr-Newman asymptotic field gives |g|=2, distinct from a rigid co-distributed material model. NIST 2022 CODATA observed electron |g|=2.00231930436092(36). Classical |g|=1 comparator fails; Kerr/Dirac |g|=2 differs by the known QED anomaly. Numerical electron magnetic moments: classical 4.637005032869e-24 J/T, Kerr/Dirac 9.274010065738e-24 J/T, observed 9.284764691700e-24 J/T.

Executed seeded Monte Carlo of 240000 uniform oblate-ellipsoid interior points (q=0.1): I/(m A_eq^2)=0.399988302 versus analytic 0.4, co-distributed |g|=1.000000000000, inferred rim speed=2.487665727c for A_eq approximately a. All executable assertions passed. Numerical controls are not a relativistically consistent rigid material model when v>=c.

## Gate

MATHEMATICALLY CLEARED only for the stated standard Kerr-Newman, rigid-body and gyromagnetic comparator equations. Simple co-distributed rigid charged electron core at R=a: CODATA_COMPARED_FAIL / rejected. H(s)H Kerr-associated finite-core dynamics, material radius, charge distribution, responsive-medium coupling, and cross-sector candidacy remain UNRESOLVED. No independently predicted H(s)H CODATA observable, no parameter fitting, no BEDROCK promotion. Full runnable Python, output, two Class P plots, and source genealogy are in the originating ChatGPT conversation archive.
