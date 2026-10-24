# CODE 000 | Mercer :48 | 2026-10-24T21Z

Task: calc48-20261024T21Z-mercer-ckm-observable-type-001

Status: CODATA_COMPARED (mass); PDG_2026_COMPARED (CKM); angle-versus-sine interpretation UNRESOLVED. No physical validation or BEDROCK promotion.

## Original historical formulas
Source: HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, lines 148-177, git blob 02312fbb23167e8ce1c996451199ee0e498437b1.
Parallel SAT source: SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f.
B=3/(4*pi); S=0.262065; mu=3/(2*B**5); theta12=B*(1-B**2); theta23=B**2*(1-S); theta13=B**3*S; delta=3*pi/2; J_shadow=(3/4)*B**6*(1-B**2)*S*(1-S).
Original source calls theta12 an angle in radians. PDG 2026 instead quotes sin(theta12). Comparing them as identical numbers is an observable-type error. Source compilation is not an authenticated original-conversation timestamp.

## Exact algebra
For B>0, d(mu)/dB=-15/(2*B**6)<0. CODATA-inverse B=(3/(2*mu_CODATA))**(1/5) is unique as an INVERSE FIT, not a prediction.
J_shadow/(theta12*theta23*theta13)=3/4 exactly.
For 0<=S<=1, J_shadow<=(3/16)*B**6*(1-B**2), equality S=1/2.

## Reproduced numerical results
NIST CODATA 2022 mu=1836.152673426(32); PDG CKM 2026 |Vus|=0.22517 +/- 0.00068; |J|=(3.16 +0.13 -0.11)*10^-5.
Raw B=0.238732414637843: mu=1934.346649506964, residual +98.193976080964.
With the source theta12 interpreted as an ANGLE in radians, exact CKM |Vus|=0.223228056351, residual -2.856 reference sigma.
With theta12 interpreted instead as sin(theta12), exact CKM |Vus|=0.225124867403, residual -0.066 reference sigma. These are competing interpretations, not a uniquely justified correction.
Inverting CODATA mu gives Bfit=0.24123287565696145759121947740624341 (FIT). At fixed source S, J_shadow=2.6919632992419794e-5, residual against PDG -4.255 reference sigma (no theory uncertainty supplied). To fit PDG central J_shadow with Bfit requires S=0.34837562112328 or 0.65162437887672, versus source S=0.262065. These are INVERSE FIT diagnostics and must not be promoted.
At Bfit, the exact CKM |Vus| is 0.225243716945 for angle interpretation and 0.227193201012 for sine interpretation.
PDG standard phase delta=1.154 +/- 0.025 rad; source 3*pi/2 rad. Phase agreement is not established.

## Verification and boundaries
SymPy exact identities; 70-digit mpmath, full complex 3x3 CKM matrix, unitarity residual <1e-60, 1000 deterministic sign tests. An initial script assertion had a sign mistake; corrected assertion only, no parameter changes. Reference sigma ratios are diagnostics, not a combined chi-square; PDG global-fit correlations and missing theory uncertainties preclude that. All B and S powers are dimensionless; historical 'rad' labels require observable typing. No CODATA reference exists for CKM J; it was compared with PDG 2026.
Sources: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme and https://pdg.lbl.gov/2026/reviews/rpp2026-rev-ckm-matrix.pdf
Mersearch: consulted existing verified three-repository Orson receipt (request 2026-10-21-orson-nlm-big-haul-math-001); no fresh search, all four lanes occupied. Original dated source genealogy remains unresolved.
Privacy: public-safe derived math only, no restricted/private material or signet.

Next: recover a primary dated derivation specifying whether theta_ij are angles or their sines; test the same B and S across mass, CKM magnitudes and phase without tuning.
