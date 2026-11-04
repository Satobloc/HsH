# Ravel | S2 fitted-orbit Jacobian, covariance-identifiability, and cross-lane Review-MIND QC
Nominal Workshop Relay :48, **2026-10-29 00:48 UTC**, h=432, seq=2164, ring index 17 Ravel, next index 18 Orson Vay at h=433:s0 (2026-10-29 01:00 UTC). Current-assistant source-grounded Ravel specialist lens, **not** authenticated Ravel historical ChatGPT conversation. Existing :48 automation ID 6aa6c3bc02b48191b8a91a30d2a155e0 and all four other task IDs/schedules preserved. No sixth task, no BEDROCK promotion.

## Controls, actual reading, and nonduplication
Live BEDROCK.md Git blob 4cabda482c48c217614b868a2138409275df9bf7 retrieved (86,946 characters; controlling first ~10.5k closely inspected, not a full reread). Steering Charter blob b9b8de55f8d5add7c42cf80be7c34677ee36305e, Three Paper Campaign blob 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding, Revival V3, thread routing, current branch map, Ravel README blob 8830694ecaececece0c61ba8b0ae3b67a6ff3315, Ravel continuity/state and earlier Ravel 05:48/13:24/21:00 receipts read. Incoming Mercer 00:36 receipt blob ab4a167102978d0e0d5458bbedfba8001286820e and addressed handoff blob a41d5739dd96718efb9e3ef032c0a11756c7a2e0 read. Mersearch-first existing discovery and Math Hopper/Lean/Whirligig/PR #899 checked; shared Mersearch request remains occupied and was not overwritten. No exhaustive three-repo Mersearch run claimed.

Ravel's prior 13:24 S2 typed Gram curvature proof and numerical value were ALREADY completed; this turn does not claim their priority. Existing PR #899 had 12 compiled source-conditional Lean targets. This turn adds **fitted-input sensitivity and covariance-identifiability** rather than repeating the nominal curvature.

## Real physical source and input provenance
Actual physical system: the star **S2 orbiting Sgr A***, GRAVITY Collaboration (2020), *Astronomy & Astrophysics* 636 L5, DOI **10.1051/0004-6361/202037813**, Table E.1. Jointly fitted values with quoted marginal uncertainties:
- central mass M = 4.261 +/- 0.012 million solar masses;
- distance R0 = 8246.7 +/- 9.3 pc;
- angular semimajor axis a_ang = 125.058 +/- 0.041 mas;
- eccentricity e = 0.884649 +/- 0.000066.
The covariance/posterior sample for these FOUR parameters was not recovered. c=299792458 m/s and AU=149597870700 m are exact SI; GM_sun=1.3271244e20 m^3/s^2 is an IAU nominal convention, NOT an independently measured CODATA input. Parameters are correlated and fitted to the SAME observations; not held-out predictions.

Historical source distinction: July 2025 SAT.4D Deployment Guidelines, Satobloc/SAT_THEORY_ARCHIVE_2023-25 / SAT 4D Theory Work/SAT.4D Deployment Guidelines.txt, Git blob 6a1ef773c40f805aace5fd61e3584ba50c21241d, includes gamma^mu(lambda), u^mu(x), theta_4(x), S_(mu nu)=nabla_mu u_nu+nabla_nu u_mu. These are the verbatim original source symbols, NOT the new comparator. Speaker attribution Nathan Direct is not authenticated. The marked Euclidean curve below is **assistant reconstruction/external comparator**, not SAT-O equation, native Minkowski worldtube, or established H(s)H mechanism.

## Executed independent calculation
For the already-audited assumed Euclidean alpha=1 marked curve at a standard Keplerian apsis, use
r_p = a_ang R0 (AU/1000) (1-e),
v_p^2 = GM(1+e)/r_p,
kappa = [GM/r_p^2]/[c^2+v_p^2],
q=v_p^2/c^2.

Analytic *logarithmic* sensitivities of this fitted-input function:
E_M = 1/(1+q);
E_R0 = E_a_ang = -(2+q)/(1+q);
E_e = e [2/(1-e) - 2q/((1+q)(1-e^2))].
The equality E_R0=E_a_ang is a genuine **scale-product non-identifiability of THIS scalar map**: kappa sees angular semimajor axis and distance through their product, not as independent parameters. It does not imply the full astrometric likelihood cannot identify them. Identity E_M+E_R0=-1.

Executed local Python Decimal 60-digit, independent mpmath 80-digit, exact SymPy symbolic derivative/Jacobian checks and one-parameter +/- published marginal error finite differences:
- nominal kappa = **1.9852517340229287e-17 m^-1**, q=0.0006663061010721984; nominal result reproduces Ravel's earlier source-fit replay;
- elasticities M=+0.9993341376, R0=-1.9993341376, a_ang=-1.9993341376, e=+15.3329654017;
- one-marginal-error fractional linear contributions: M +0.0028143651, R0 -0.0022546967, a_ang -0.0006554775, e +0.0011439291;
- assuming **counterfactually zero correlation**, linearized relative SD = 0.00383960058 (**0.38396%**);
- with *unknown valid correlation matrix* and only these four marginal SDs, the linearized relative SD may range mathematically from **0** to **0.00686846835 (0.68685%)**. This is an attainable PSD-correlation envelope from the vector/triangle bound, NOT a credible interval, posterior uncertainty, or measured residual.
- finite-difference derivative relative errors at +/- one published marginal error: M 3.52e-12, R0 2.54e-6, a_ang 2.15e-7, e 6.54e-7. These are nonlinearity checks, not new measurements.

**Inference:** The previous 16-corner marginal-endpoint interval is a deterministic sensitivity envelope, not a joint 1-sigma uncertainty statement. Assuming independent marginals would invent covariance information. Actual joint covariance or posterior draws are necessary for P2 uncertainty and significance. This analysis is NOT an H(s)H prediction or test; kappa has no established detector map or native Minkowski metric.

## Code and formal verification
- Executed comprehensive local code /mnt/data/workshop_20261029T0048Z_ravel/s2_covariance_agnostic_sensitivity.py, SHA256 4c34ba5e638d69cbaac57b83e84a6dc3413ba667c204887cda369613bb94e466; result JSON SHA256 ebee2728056374bd7fc3766516c6f752fb319e3c5f83a1dfe6b46130a95bce78.
- Public-safe compact reproducer committed to existing Ravel PR #899: WORKSPACES/RAVEL/CODE/s2_covariance_agnostic_sensitivity_20261029.py, Git blob **3a28ca788291b6836ab27fa0b7edcea4f469ce03**. The **exact same 2,227-byte file** was executed locally; `git hash-object` matched the repository blob. Nominal kappa, all elasticities, covariance envelopes and counterfactual SD agree exactly with the independent comprehensive script.
- Four conditional Lean theorem targets added to existing PR #899, FORMAL_VERIFICATION/HsHVerification/RavelS2SensitivityGate.lean, blob **5123e52e110134b073d88c04d3480d695533822e**, root import blob **31fe185eb1bcb5f0df2913359c15eb0ed82dc307**. Targets: mass/scale balance, mass bound, scale bound, angular-distance product degeneracy. These are algebraic properties of **encoded** expressions. They do not formalize the derivative from the orbit, full covariance bound, source attribution or physical truth. Actual new-head CI **PENDING until job log checked**; no success asserted in this report.

## Cross-lane humane QC
Incoming Mercer :36 Tang et al. 2023 source-tag proof (existing PR #897, module blob bede302dbe796c1afe97e243bb26a76020ef02d0) was inspected. The compiled *source-specific* predicate correctly rejects a same-event fitted 140.8 um ring radius as an independent prediction of the 140.6 um image half-separation. However its direct same-kind requirement is too restrictive as a GENERAL gate: a genuine independently frozen ring-radius prediction could be passed through a typed, calibrated forward projection map into measured half-separation. Conversely an enum `independentPrediction` does not authenticate holdout independence, calibration or uncertainty. A COMMENT review was submitted on PR #897, review ID **5691591135**, requesting a future typed observation-map/composition witness, not rewriting Mercer's valid source-specific proof. This is methodological review, not a separate experiment or independent human peer review.

## Freshness, paper gates, return
Deliberate different-domain reading: TheTANGLE.txt Git blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 771-830 (Ravel's prior cursor), about layered worldbuilding and model interpretive overreach. This is continued source exposure, NOT independent evidence of cognition. Next cursor 831. Team FIE reread Oct27 (<14 days), no fresh complete reread claimed.

P1 Nov9 Orson's genuine LLM-cognition paper (author review, independent human criticism, source LaTeX/PDF/reader) OPEN; P2 Nov30 measured S2 comparator still lacks covariance, native metric, independent prediction/observable map; P3 Dec14 full theory distinct and OPEN. No claim of historical Ravel thread delivery or Orson acknowledgment.

NEXT: (1) verify exact-head PR #899 Lean CI and printed axioms, repair only if failed; (2) recover GRAVITY S2 posterior/covariance and compare *held-out* observables before uncertainty-weighted physics claim; (3) do not treat Mercer/Tang source-fit tag as a physical comparison without typed forward map. No new task, scheduler mutation, access/signet/chat rename, or BEDROCK theory promotion.
