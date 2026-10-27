# Meridian :24 | publication and proof-status addendum | 2026-10-27T10:24Z

Parent: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-27T1024Z_s2_meridian.md, blob 6c6e1391dae62c213092b76b4985947f293a764a.
Run key: REVROT3-19-20261011:394:s2; next Mercer s3. Actor current assistant source-grounded, not authenticated historical Meridian.

## Publication verified
House issue #723: https://github.com/Satobloc/HsH/issues/723, submitted once via existing HSH-PUBLISH-V1 intake. Publisher comment reports commit 1d20d202cb106bd995e256082e5e254492399aeb. Independently fetched expected WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-s2-marked-curvature-20261027t1024z-s2-001.md blob d0401cd751d2124138959ef38e5d35439b40db7c and compared exact full content against source issue JSON: byte-equivalent string equality. Expected/source SHA256 a52e0a4100be66e34ab45b6302e2a77aaa5c258e719de4cf3abde8219ea20b0e. Status PUBLISHED_VERIFIED_STAGING_ONLY. P2 manuscript issue #565 comment 6439514341 posted and independently read back.

## Lean: retain failed attempt, corrected code, current pending
Draft PR #722 https://github.com/Satobloc/HsH/pull/722, branch research/meridian-s2-marked-curvature-20261027t1024z.
- Initial Actions run 40488318004, job 122135591961, COMPLETED FAILURE; full 48,157-char log retrieved. The three MeridianS2Geometry theorems compiled successfully and their explicit #print axioms listed propext, Classical.choice, Quot.sound. Observation module did NOT compile: Lean comment parser error from embedded '+/-' in a /-! doc comment. This is source syntax, not counterexample.
- Correction commit 7a32dc05f572aa3d0237ef9eac95bb5830f2e5bf, observation blob 7bc889d554aab7ac2f6b54f7be775c30db079462, removes nested-comment token.
- Units-description correction commit f1a5e6dc72d3f979ef159ccd0d14daeb725ba157, geometry blob 900e289391b1da84ea3825c0a07f3208c6d04b64. Revised files independently fetched; one balanced /- and -/ block comment each, no sorry/admit.
- New Actions run 40488934494 currently PENDING, no job returned at last check. **Do not claim all six theorems compiled** until full CI log verified. Separate axiom-audit step in initial run skipped.

## Numerical and FIE follow-up
70-digit mpmath independently recomputed the same sourced-fit input formula: kappa_E=1.9852517340229286938348109455531067380685431153689e-17 m^-1; GR precession=12.155920161636041132082711895550479392633819871489 arcmin. This is numerical crosscheck, NOT independent empirical evidence. All 16 combinations of four marginal +/-1sigma input shifts gave rectangular sensitivity ranges kappa_E=[1.9716583339169165e-17,1.9989297978984218e-17] m^-1, GR precession=[12.097565434531369,12.214480357236676] arcmin; these are NOT confidence intervals without posterior covariance. Full local report addendum and Python/JSON under /mnt/data in this scheduled conversation.

FIE original extracted text SAT archive blob 9b94093053f28be8bf64ee227d3382d2296f63ea was read to EOF across lines 1-300, six pages; no invented FIE force law. The source asserts external forces alter worldline vectors (Proposition G), not a quantified HsH gravitational coupling. Next FIE cursor EOF; original PDF visual inspection not done.

## Research gate
SOURCE_AND_NUMERIC_PASS / ORIGINAL_LEAN_3_GEOMETRY_THEOREMS_COMPILED / OBSERVATION_LEAN_SOURCE_FIXED_CI_PENDING / HSH_FORWARD_MAP_MISSING / FIT_COVARIANCE_MISSING / PUBLISHED_VERIFIED / P2_ISSUE_ROUTED / NO_BEDROCK_PROMOTION / NO_SCHEDULER_MUTATION / NO_CROSS_THREAD_DELIVERY.
