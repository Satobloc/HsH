# Calculation Relay :48 | Enheduanna | 2026-10-24T20Z

Task: calc48-20261024T20Z-enheduanna-jarlskog-loop-001
Status: INTERNALLY_CHECKED algebraic incompatibility; historical joint CKM/Jarlskog equality REJECTED; PDG_2026_COMPARED. No BEDROCK promotion.

## Original source and genealogy
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, lines 161-177, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1. Later executable HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_calculator.py, Git blob 54d91ac574879836d1d770703cb894704c69512e, preserves both formula branches. SAT 2026/SAT MATH - BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f, is a secondary compilation. Original conversation authorship/date unverified.

## Exact source equations, no retuning
B=3/(4*pi), S=0.262065 (stipulated).
theta12=B*(1-B^2); theta23=B^2*(1-S); theta13=B^3*S.
J_eff=(3/4)*theta12*S*(1-S).
J_shadow=J_eff*B^5.
J_angle=theta12*theta23*theta13*sin(3*pi/2).

Algebra proves J_shadow=-(3/4)*J_angle for any B,S where these expressions are defined. Therefore the asserted equality of the two branches fails by a factor of 3/4 and by sign, independently of B and S. Changing a parameter cannot repair this identity.

## Reproduced numeric results
B=0.2387324146378430; theta12=0.2251262985488370 rad; theta23=0.0420572518037485 rad; theta13=0.0035656868128654 rad.
J_eff=0.0326523637790456.
J_shadow=+2.5320459329796047e-5.
J_angle=-3.3760612439728063e-5.
Standard unitary CKM matrix using the same angles and delta=3*pi/2 gives J_exact=-3.259247005867086e-5. Quartet identity and unitarity were verified numerically with errors below 2e-70.

## External reference
PDG 2026 CKM review section 12.4, revised March 2026: J=(3.16 +0.13/-0.11)e-5; delta=1.154 +/-0.025 rad. Source: https://pdg.lbl.gov/2026/reviews/rpp2026-rev-ckm-matrix.pdf
Magnitude-only reference residuals: shadow -6.2795406702e-6 (-5.71 times the lower PDG uncertainty); angle-product +2.1606124397e-6 (+1.66 times upper); exact CKM +9.9247005867e-7 (+0.76 times upper). These are reference-only residual ratios, not calibrated statistical significances: no model uncertainty or correlations supplied. The stipulated delta=3*pi/2 differs from the PDG standard-phase value by the shortest circular distance -2.7247963268 rad. CKM J is not a CODATA recommended quantity, so this is PDG_2026_COMPARED, not CODATA_COMPARED.

## Separate dependent mass-law check
The source's gear masses mp=3*m0/(2*B), me=m0*B^4 imply mu=3/(2*B^5). Its later 'corrected master' masses mp=3*m0*B^-1*S*(1+bridge), me=m0*B^4*S*(1+bridge) imply mu=3/B^5, exactly twice the gear ratio. The common bridge factor cancels. Which mass branch is operative remains UNRESOLVED; no coefficient was silently changed.

All source expressions retained. Exact SymPy identities, 1000 deterministic grid trials, a directly constructed unitary 3x3 CKM matrix and mpmath 70-digit forward evaluation passed. Full executable and JSON results preserved in the conversation evidence packet. The comparison does not establish H(s)H physical validity.
