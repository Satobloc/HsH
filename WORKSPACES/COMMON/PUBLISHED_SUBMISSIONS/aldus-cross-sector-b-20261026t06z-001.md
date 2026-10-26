# Aldus | 2026-10-26T06Z | Frozen SAT B across proton/electron and CKM

Status: HISTORICAL_MATH_REPRODUCED; CROSS_SECTOR_CLOSURE_FAILED; CORRECTABLE_GEOMETRIC_IDENTITY_ONLY; NO H(s)H CANDIDACY OR BEDROCK PROMOTION.

Real systems: proton/electron rest-mass ratio, CODATA 2022 (NIST v9.0 May 2024) 1836.152673426(32); quark CKM mixing, PDG 2025 global fit sin(theta12)=0.22501(68), sin(theta23)=0.04183(+79/-69 in last five decimals), sin(theta13)=0.003732(+90/-85 in last six decimals), delta=1.147(26) rad, J=(3.12+0.13-0.12)e-5. PDG values are fit outputs, not independent raw measurements.

Primary SAT: SAT_THEORY_ARCHIVE_2023-25/CP CLOSURE.txt, blob 4c4525504e32b5cded85a68ea60660e1579871ee; /Crit.txt, blob 6a3d2fbc45e99a5163326e18847f54169527f46f; /SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089. Later prior audit: .[AI_FILES]/LLM_WORKSPACES/Argus/XW-004_CKM_CP_AUDIT.md, blob b7dc0f60a8ba63d83761aa4485719240a448c75a. Historical files mix AI text; do not attribute equations to Nathan without message provenance. Original composition date unresolved; Argus reports first Git ingest of CP CLOSURE on 2026-06-29.

Freeze B=3/(4*pi), S=0.2621 (historical unverified input). Archived theta12=B(1-B^2), theta23=B^2(1-S), theta13=B^3*S; J_eff=3/4 theta12*S*(1-S), J_projected=J_eff*B^5, J_CKM_approx=theta12*theta23*theta13*sin(270deg), mu=3/(2*B^5). All dimensionless, in native c=G=hbar=1; no dimensional conversion required.

Executed SymPy + independent mpmath: B=0.238732414637843; theta=(0.225126298548837,0.042055257042946,0.003566163026928); J_projected=+2.53226398939851e-5, J_CKM_approx=-3.37635198586468e-5, exact standard CKM angle expression=-3.25952803972773e-5. The source's claim that the two J routes match is false even in magnitude. Measured PDG J=+3.12e-5 in the standard CKM convention; phase=1.147 rad, not 270 degrees. The source's 270-degree phase is also used in distinct leptonic constructions; sector conflation unresolved. The sine-vs-angle ambiguity matters: sin(theta12)=0.2232294754, not the source's direct comparison 0.2251263 with PDG sin(theta12).

Mass ratio from same frozen B: 1934.346649506964, residual +98.193976080964 (+5.3478111%) vs CODATA 2022; no independent fit or bridge. Exact identity: 3/(2*(3/(4*pi))^5)=512*pi^5/81.

Separate source error in Crit.txt line 65: (4*pi*R^3/3)/(4*pi*R^2)=R/3 [length], NOT 3/(4*pi). The unique correction is R/3 (or V/(A*R)=1/3). This repairs the arithmetic only; it does NOT authorize replacing SAT's B throughout with 1/3 or interpreting a unit sphere as a measured physical system.

Gate: source numerical routes reproduced; exact algebra/units PASS; printed geometric equality FAIL (unique arithmetic correction); physical mass ratio FAIL; CKM phase/J closure FAIL; no independent H(s)H prediction; NO ACTIVE CODATA PROMOTION. Do not tune S, B or phase to rescue the result. Preserve both failure and later corrective work. This is a cross-sector control, not a replacement model.

Reference: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme ; https://pdg.lbl.gov/2025/reviews/rpp2025-rev-ckm-matrix.pdf
