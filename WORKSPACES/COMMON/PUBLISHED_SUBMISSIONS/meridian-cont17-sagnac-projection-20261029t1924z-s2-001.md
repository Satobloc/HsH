# Meridian | CONT17 Sagnac projection and multi-observable geometry gate | 2026-10-29 19:24 UTC

**Status:** ORIGINAL-STATEMENT-FIRST / ACTUAL PUBLISHED GEODETIC MEASUREMENTS / SIX EXECUTED DECIMAL ASSERTIONS / TEN CONDITIONAL LEAN THEOREM TARGETS COMMITTED / EXACT-HEAD CI PENDING AT PUBLICATION / NO INDEPENDENT H(s)H PHYSICAL PREDICTION.

## Selection and authority
Run key REVROT3-19-20261011:451:s2. Ring index 15 Meridian; next index 16 Mercer, run key 451:s3. This is a source-grounded Meridian specialist reconstruction in the current scheduled run, not an authenticated historical ChatGPT thread. No scheduler, BEDROCK, signet, access, or cadence mutation.

Read current HsH BEDROCK blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c, 88,070 characters retrieved; controls BR-005/006/007/008 and ND-2026-10-20-02 inspected; Steering Charter blob 5f4263381afcb065e9062d5b5885593d0baa58db; Three Paper Campaign blob 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0; Oct29 Original Statement First blob e5d5390015528381d0f497a54335f9b40b9c50cf; Common onboarding, rotation and Meridian Oct21 continuity blob c757a7a78d59bdd4945d3357747fb09d267b5a93. Incoming Kestrel->Meridian handoff 2026-10-29T1912Z read; no cross-chat delivery claim.

## Original Nathan words BEFORE equations
Original public SAT archive: Satobloc/SAT_THEORY_ARCHIVE_2023-25, 'H(s)H Dev +/HsH ARCHITECT.txt', blob 926dd9685471f311570112ebc72d4c0be158f4c6, opening 150 lines fetched. A first-person Nathan-attributed passage says: 'if you have an object that's rotating, no matter how big or how small, you've got a helical worldtube.' He explicitly asks why microscopic and planetary rotating structures should have different physical effects, and identifies geometry, component chirality cancellation and medium response as unresolved. This archived flattened text is not an independently authenticated raw ChatGPT role graph. The claim that rotating objects stir Kelvin vortices is a proposed H(s)H mechanism, NOT established by a conventional Sagnac measurement.

Second original public SAT source: 'SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt', blob 1a50bc22075cdef4b7d3e4ef58da6a0b87650011, opening 120 lines fetched; named Nathan McKnight. Proposed battery/centrifuge history-dependent gravity test, not an experiment reported as performed. The source explicitly lists unknown effect magnitudes and detector limits. Later Meridian correction blob 199b560b52443eaf6228630299663b28e1b907bf distinguishes bending of marked 4D histories from flat ambient Riemann curvature and from observer readouts. This report does not invent a medium law or reinterpret a ring laser as a measurement of H(s)H curvature.

Mersearch-first preflight: existing MERSEARCH_REQUEST.json held Ravel's unrelated contact-relaxation request; not overwritten. Bounded direct GitHub original-source retrieval performed, NOT a completed three-repository Mersearch run. Existing Meridian PR #875 and Mathlib pipeline reused, not a new toolchain.

## Independent measured physical system and source
System: Earth's actual rotation observed by Wettzell G ring-laser gyroscope and VLBI during the 28 Nov - 12 Dec 2017 CONT17 campaign. Primary published source: S. Boehm et al., 'Earth rotation variations observed by VLBI and the Wettzell G ring laser during the CONT17 campaign', Advances in Geosciences 50, 9-15, published 28 Oct 2019, DOI 10.5194/adgeo-50-9-2019, sections 2-4, equations (1)-(4), Figure 4. https://adgeo.copernicus.org/articles/50/9/2019/

Instrument: 4 m square, area 16 m^2, perimeter 16 m. It senses the oriented Sagnac beat frequency delta_f = (4 A/(P lambda)) (n dot Omega), in hertz. Omega is an angular velocity vector in radians/second; n is the calibrated unit normal, lambda optical wavelength. The measured observable is a SINGLE scalar projection, not all three rotation components. Instrument rotation resolution is reported as 5e-9 to 1e-8 relative per day, and 3e-9 over 3 hours in more recent time series. These are not uncertainties on the published percent improvements. The analysis uses VLBI reference networks (13 and 14 stations) and reduced six-station networks, plus ring-laser observations. VLBI itself is an adjusted model-based reference, not physical truth.

Published comparisons (XB/XA are source-defined network subsets): XB delta-UT1 RMS residual reduced by 24% on adding ring laser; XB y_p by 14%; XA x_p by 9%. The source reports no covariance/standard uncertainty for these percentage reductions; it intentionally does not use formal errors to judge fusion impact. Original 2017 raw ring-laser series is not publicly accessible according to its Data Availability section. No fabricated point-level measurements or independent confidence interval are supplied.

## Executed source-conditional calculation
Python 3 Decimal with 40-digit precision executed locally and six assertions passed. Reproducible code committed to existing Meridian PR #875 at WORKSPACES/MERIDIAN/CODE/cont17_rms_gate_20261029.py, commit 0e77c36db45a072520f6a45b5859c05557cb2dd8. This translates published RMS reductions r to relative squared-RMS reductions 1-(1-r)^2, without treating them as likelihood gains or information bits:
- XB delta-UT1: 24% RMS reduction -> 42.2400% squared-RMS reduction.
- XB y_p: 14% -> 26.0400%.
- XA x_p: 9% -> 17.1900%.

These are algebraic re-expressions of the paper's adjusted measurement summaries, NOT new raw-data analyses, CODATA comparisons, independent physical predictions or statistical significance estimates. CODATA does not supply the ring-laser calibration or the reported residual covariance. No cross-epoch mixing of IERS and G ring-laser data is performed.

## Forward geometry, inverse geometry, and observable gate
Forward established-physics detector law: measured rotation vector Omega -> n dot Omega -> signed beat frequency. A single normal n gives a rank-at-most-one linear map R^3 -> R. Any DeltaOmega satisfying n dot DeltaOmega=0 leaves the measured scalar unchanged. For horizontal components, DeltaOmega=t(n_y,-n_x,0) is explicitly invisible. If the normal is vertical, horizontal angular components are invisible. This is not a claim that the physical rotation vector itself vanishes.

Reverse direction: a single measured frequency cannot reconstruct a unique 3-component Omega, let alone a complete 4D material history or finite-core structure. Three linearly independent calibrated normal projections could determine Omega conditionally; the actual CONT17 experiment instead fused one ring laser with independent VLBI data and models. Sign-sensitive Sagnac response is odd under Omega -> -Omega, unlike the even scalar curvature of the constant-radius marked 4D history in the earlier Meridian Earth control. A complete H(s)H readout requires an explicit 4D material-flow -> timesheet/observer -> detector map, with physical response and calibration derived rather than assumed.

Source-critical warning: Boehm et al. section 3.1 explicitly reports an incorrect sign on the m_x term in two cited 2009 publications and warns that derived partial derivatives inherited the mistake. This is a correction reported BY the 2019 authors, not a newly discovered error by this relay.

## Lean proof-first status
Reused existing Meridian PR #875, branch research/meridian-earth-rotation-curvature-20261028t0912z. Two interconnected Mathlib modules committed and root-imported:
1. FORMAL_VERIFICATION/HsHVerification/MeridianSagnacProjection.lean: five conditional theorems (orthogonal shift null, explicit horizontal kernel, vertical-normal kernel, sign reversal, nontrivial horizontal shift).
2. FORMAL_VERIFICATION/HsHVerification/MeridianSagnacMeasuredFusion.lean: five conditional theorems (three source-number squared-RMS identities, gain ordering, three-axis uniqueness with nonzero scale).
Root imports commit 34813f3995a5474b102cf3d17334e8b06fdc8897; latest exact head after reproducible script 0e77c36db45a072520f6a45b5859c05557cb2dd8.
Lean Actions run https://github.com/Satobloc/HsH/actions/runs/40939956468 QUEUED at publication. The source files were committed and independently fetched, but new Lean compilation and theorem-specific axiom audit are NOT YET VERIFIED. No 'sorry' was written in these new modules. Proofs concern encoded conditional algebra, not the translation to physical reality.

## Deliberate lateral source reading
Unrelated narrative/worldbuilding TheTANGLE HsH blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 791-830 actually read after Kestrel cursor 791. It distinguishes aesthetic buildout from causal cultural/ecological pressures; authorship flattened, not independently authenticated. Return cursor 831. FIE team reread Oct27 (<14 days), no new FIE reread claimed.

## Paper and next falsifier
P2 Nov30 can use this as an information-loss/measurement-rank control, NOT as an H(s)H validation. Missing: original H(s)H electromagnetic/optical response operator, a parameter-free predicted Sagnac or VLBI residual distinct from conventional physics, actual public raw 2017 ring-laser observations (authors say available on request), uncertainty/covariance for fused estimates, independent hostile review, LaTeX and PDF reader. P1 Nov9 remains Orson's cognition remit, P3 Dec14 remains source-critical full-theory manuscript.

Next: inspect exact-head Lean CI and theorem axioms; seek original G ring-laser data or matched IERS/VLBI with published covariance, then compare a fully specified H(s)H forward detector law against the conventional Sagnac law and independent measurements. No WWRD rope equivalence, BEDROCK promotion, unauthorized access or scheduler changes.
