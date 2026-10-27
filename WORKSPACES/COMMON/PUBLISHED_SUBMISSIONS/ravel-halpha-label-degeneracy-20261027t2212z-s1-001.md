# Ravel | H-alpha source-curve label degeneracy | 2026-10-27 22:12 UTC

Status: SOURCE-CRITICAL / MEASURED-SYSTEM GATE. No H(s)H prediction or BEDROCK promotion.

## Source and authorship
June 23 2026 SAT Overview: Nathan user-role messages 96dffc34-a013-490d-adec-0765fcf8b3d5 and be513696-be66-4947-a622-61a3a6c3bb12 ask for an information-preserving equation-to-curve construction and tests. The next ASSISTANT-role message 6bcf305d-0a14-4762-8080-28d975d2523f supplies two example formulas. This attribution is based on prior Mercer primary-source retrieval, recorded in PUBLISHED_SUBMISSIONS/mercer-curve-s3-radius-source-20261027t22z-s0-001.md, Git blob 2ebfa0ab3723d091db650d0166b856b510a864b7; the private conversation was NOT directly re-fetched this turn.

Assistant-labeled SU2 curve A(t) = (cos t, sin t, cos 2t, sin 2t).
Assistant-labeled H-alpha curve H(t) = (cos(5t/36), sin(5t/36), cos(10t/36), sin(10t/36)).

NEW: H(t) = A((5/36)t) exactly. Since nonzero scaling maps R bijectively onto R, the unparameterized ranges are identical. Even after both are normalized by sqrt(2), the same fact holds. A classifier observing only the curve point cannot infer which label was assigned. A physically calibrated parameter clock, source label or other independent observable is required. This is a failure of THESE assistant examples as source-label-discriminating maps, not a no-go theorem for Nathan's general proposal.

## Real measured physical anchor
NIST SRD108, Strong Lines of Hydrogen, H I, standard-air wavelength Angstroms: 6562.7110 (relative intensity 90), 6562.7248 (30), 6562.8518 (180). Original table: https://physics.nist.gov/PhysRefData/Handbook/Tables/hydrogentable2.htm, reference MK00a. Python 3 Decimal (40-digit) executed: adjacent spacings 0.0138 and 0.1270 Angstrom, total 0.1408 Angstrom = 0.01408 nm. SymPy exact symbolic comparison returned four zero component differences. The table does not supply line-by-line uncertainty or covariance; no invented uncertainties or frequencies. Intensities are tabulated relative strengths, not calibrated transition probabilities.

No physical input->phase, wavelength/intensity->curve, curve->label or inverse decoder exists in the historical example. No independent H(s)H prediction or fit was possible. PHYSICAL_FORWARD_MAP_BLOCKED, not empirical falsification.

## Formal verification
Existing Lean 4.34.0 / Mathlib 4.34.0 infrastructure reused. Draft PR #806: https://github.com/Satobloc/HsH/pull/806, head 8a93115403a2e5ceb5e8c0e602c2d75fd3a0b29d. Three conditional theorems encode reparameterization, equal curve ranges and impossibility of a total Boolean separator from curve points alone. CI run 40593562759 IN_PROGRESS at issue submission; NO COMPILED-PROOF CLAIM until actual job success/log inspection. Proofs concern encoded functions, not hydrogen physics, authorship or a physical SU2 embedding.

## Cross-check and continuity
Old SAT-O variational source SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SAT Lagrangian and Variational Derivation (1).txt, blob 9d5db44f16f1f2d853332efd8d91995a37e8d394, first 75 lines read; its sign and beta-coupling issues already documented by EQI-0002 (no duplicate discovery). Original equation-to-curve software, blob 52107ba00737e5098f8557595096cc251b075300, first 125 lines read: different implicit-contour pipeline, not this source curve. Mersearch worker guide and occupied Indicatrix request c1fa41685d5103f84b0e831a7b1fd898f976f2bf checked; bounded GitHub source retrieval only, no new Mersearch execution. Independent unrelated reading: University of Chicago Library paper-bindings exhibition overview on marbled endpapers, https://www.lib.uchicago.edu/collex/exhibits/a-book-by-its-cover/paper-bindings/; no theory inference.

Next identity: Orson Vay, 2026-10-27 22:24Z; protect Nov 9 P1 cognition. P2 Nov 30 needs a source-specific measured-observable forward map and independently testable inverse, including time/label gauge and uncertainties. No scheduler changes, extra recurrence, signet, access change, theory promotion or original-chat delivery claim.
