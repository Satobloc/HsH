# Ravel Review-MIND | S2 covariance-identifiability and typed observable-map gate
Nominal 2026-10-29 00:48 UTC; h=432:s4, Ravel selected, Orson Vay next. Source-grounded current assistant, NOT authenticated historical Ravel conversation.

## Measured system and provenance
S2 around Sgr A*, GRAVITY Collaboration (2020), A&A 636 L5, DOI 10.1051/0004-6361/202037813, Table E.1. Jointly fitted marginal inputs: M=4.261+/-0.012 million solar masses, R0=8246.7+/-9.3 pc, a_ang=125.058+/-0.041 mas, e=0.884649+/-0.000066. Joint covariance/posterior unavailable. c and AU exact SI; solar GM=1.3271244e20 m^3/s^2 IAU nominal convention. These are fitted, not held-out data.

## Source-critical model boundary
The assumed Euclidean marked-lift apsis comparator is assistant reconstruction, NOT an original SAT-O equation, H(s)H native Minkowski metric, worldtube mechanism, or independently validated prediction. Historical SAT.4D Deployment Guidelines (July 2025), SAT_THEORY_ARCHIVE_2023-25, blob 6a1ef773c40f805aace5fd61e3584ba50c21241d, instead prints gamma^mu(lambda), u^mu(x), theta_4(x), S_mu_nu=nabla_mu u_nu+nabla_nu u_mu.

## Executed source-fit sensitivity
For r_p=a_ang*R0*(AU/1000)*(1-e), v_p^2=GM(1+e)/r_p, kappa=(GM/r_p^2)/(c^2+v_p^2), q=v_p^2/c^2:
E_M=1/(1+q); E_R0=E_a_ang=-(2+q)/(1+q); E_e=e*[2/(1-e)-2q/((1+q)(1-e^2))].
Nominal kappa=1.9852517340229287e-17 m^-1; q=0.0006663061010722. Log elasticities: M +0.99933414, R0 -1.99933414, angular semimajor axis -1.99933414, e +15.33296540. Four marginal-error fractional contributions: +0.0028143651, -0.0022546967, -0.0006554775, +0.0011439291. Counterfactual zero-correlation linearized fractional SD=0.00383960058 (0.38396%). With unknown valid correlations, only a broad mathematical fractional SD envelope [0,0.00686846835] (0 to 0.68685%) follows from the four marginals. This is NOT a joint CI or actual uncertainty estimate. Angular semimajor axis and distance enter this scalar comparator only as a product, so they are not separately identifiable from kappa alone. Full astrometric likelihood may identify them.

Decimal, independent mpmath, SymPy Jacobian and finite-difference tests executed. Compact source exactly replayed and git-hash matched: WORKSPACES/RAVEL/CODE/s2_covariance_agnostic_sensitivity_20261029.py, blob 3a28ca788291b6836ab27fa0b7edcea4f469ce03. Full report: WORKSPACES/RAVEL/2026-10-29_0048Z_S2_SENSITIVITY_COVARIANCE_AND_MIND_QC.md, draft PR #899. Four additional source-conditional Lean theorems submitted, new-head compilation PENDING at submission; no successful compile claimed here.

## Cross-lane adversarial QC
Mercer's Tang et al. 2023 (DOI 10.1038/s41467-023-38787-w) source-specific proof correctly rejects treating a same-event fitted 140.8 um radius as independent prediction of 140.6 um projected half-separation. But direct same-kind equality is too restrictive as a GENERAL comparison gate: a frozen independent ring-radius prediction could be mapped through a typed, calibrated forward projection to the measured observable. A bare independentPrediction enum is also insufficient provenance. Review COMMENT submitted to existing PR #897 (review ID 5691591135), without modifying Mercer's source-specific proof.

Orson's Nov9 cognition paper, Nov30 P2 real-system paper, Dec14 P3 full theory remain separate, with review/reader and physics-evidence gates OPEN. No BEDROCK promotion, physical H(s)H prediction, sixth task, cadence change, or historical cross-thread delivery.
