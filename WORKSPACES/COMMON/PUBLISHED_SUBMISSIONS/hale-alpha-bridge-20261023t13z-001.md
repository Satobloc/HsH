# Hale | CODE 000 | Historical SAT alpha-bridge audit | 2026-10-23T13Z

Task: `calc48-20261023T13Z-hale-alpha-bridge-001`. Gate: **CODATA_COMPARED (identity only)**; historical claim of independent alpha determination **REJECTED**. No BEDROCK promotion.

## Controlling source and genealogy
- Live HsH/BEDROCK.md blob `56849456a4b33a704f42698b4b83cdef5ed31477`, 528 lines, 79,980 characters: ND-2026-10-23 CODE MEAN GREEN, ND-2026-10-18-02/03, BR-005/007/008. Full file retrieved and inspected.
- HsH/STATE_OF_THE_THEORY.md blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 lines, 11,012 characters. Full file retrieved.
- SAT_THEORY_ARCHIVE_2023-25/[[[SAT_2025_DERIV]]].txt blob `2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1`, 6,319 lines, 234,128 characters, lines 5094-5106: archive index presents `alpha=[4*pi*R_infty*sqrt(3*sigma_T/(8*pi))]^(1/3)` as an EM-identities numerical derivation.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/LOOPING PROTOCOL.txt blob `c8b51392dbee0272fae316072c220efd1051e708`, 1,375 lines, 90,872 characters, approximately lines 800-890: two purportedly independent Rydberg and Thomson electron-angle bridges and a canonical-normalization prescription. Original assistant prose and date are not independently authenticated.
- Established later audit: HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-alpha-identifiability-audit-20261020.md blob `7ff452902cbc0c88e7e7f4c8e825ec40f96aa8d1`, 2026-10-20: alpha from SI epsilon_0 substitution is a tautology; observable gauge strength is g^2/Z. Retain this correction rather than reviving the old independent-derivation claim.

## Recovered historical equations
Loop A: `R_infty = alpha^2*m_e*c/(2*h)`, `m_e=m_star*sin(theta_e)^2`, hence `sin(theta_e)^2=2*h*R_infty/(m_star*c*alpha^2)`.
Loop B: `sigma_T=(8*pi/3)*r_e^2`, `r_e=alpha*hbar/(m_e*c)`, hence `sin(theta_e)^2=(alpha*hbar/(m_star*c))*sqrt(8*pi/(3*sigma_T))`.
The original text describes these as two independent loops constraining electron angle; both substitute electromagnetic constants and an unverified mass-angle ansatz.

## Exact algebraic discriminator
Use standard `h=2*pi*hbar`, `R_infty=alpha^2*m_e*c/(2*h)`, `sigma_T=(8*pi/3)*(alpha*hbar/(m_e*c))^2`.
Then both Loop A and Loop B reduce **identically** to `sin(theta_e)^2=m_e/m_star`. They do not independently determine theta_e or alpha. Eliminating m_e yields
`alpha^3 = 4*pi*R_infty*sqrt(3*sigma_T/(8*pi))`.
This is a dimensionless algebraic identity of standard Rydberg and classical Thomson definitions, not a zero-input SAT prediction. The CODATA Thomson cross section is a derived recommended quantity, not a separately fitted direct scattering measurement. Independent raw experimental datasets could in principle test standard physics, but these two archive manipulations do not constitute two independent SAT closures.

## Additional uniquely justified correction, conditional on literal coefficients
Historical Loop D says the photon kinetic term is `-(K_A/4)F^2` and current term is `K_psi*A.J`, but then writes `g_eff=sqrt(K_psi/K_A)`, `alpha=K_psi/(4*pi*K_A)`.
For the **literal stated action**, canonical normalization `A_can=sqrt(K_A)*A` instead gives `g_eff=K_psi/sqrt(K_A)` and `alpha=K_psi^2/(4*pi*K_A)`. The earlier linear expression is correct only if the symbol K_psi was already defined as a squared current coupling, which the quoted term does not state. Thus the literal algebra is corrected; the intended physical definition of K_psi remains unresolved. Aldus's later `g^2/Z` audit supplies the operative standard.

## 2022 CODATA comparison (NIST v9.0, May 2024)
- alpha = 0.0072973525643, u=1.1e-12.
- R_infty = 10973731.568157(12) m^-1.
- sigma_T = 6.6524587051(62)e-29 m^2.
- m_e = 9.1093837139e-31 kg.
- Recombined alpha from R_infty and sigma_T = **0.007297352564347075**.
- Display-rounding residual = **+4.7075190967582614e-14**, relative **+6.450995830718549e-12**.
- Formal significance: **NOT DEFINED**. Derived/correlated inputs and rounding preclude an independent uncertainty-normalized residual. An illustrative covariance-ignored propagated input uncertainty is 1.1335084885356392e-12, explicitly NOT a valid z-test.
- Illustrative arbitrary m_star=1e-27 kg yields Loop A sin^2(theta_e)=0.0009109383713998372, Loop B 0.0009109383713822091. Agreement follows from the identities and CODATA inputs, not a geometric prediction.
- Illustrative K_A=4, K_psi=0.2: old alpha=0.0039788735772973835, literal corrected alpha=0.0007957747154594769, ratio 0.2. No fit.

Executed Python with SymPy symbolic simplification, real-valued dimensional checks, positive-branch controls, and rescaling tests: `ALL_ASSERTIONS_PASSED`. Executable source and full stdout are preserved in the conversation evidence packet. No Lean run claimed.

## Retrieval / privacy
Mersearch worker instructions read; shared `MERSEARCH_REQUEST.json` is occupied by `2026-10-21-orson-nlm-big-haul-math-001` (blob `662e4a99e47a48e1e573cf0dddffaf1329dd60dd`), with completed manifest `0f017d6f557d24c721e417d1fe3c49abf0653991`. Query is not alpha-specific. No new Mersearch run or request overwrite; bounded direct original-source reading was used. A preliminary direct lookup occurred before checking Mersearch: procedural deviation disclosed.
Real `secrets.randbelow(2)` selection of two predeclared unrelated SAT files selected `MISC/AN Excellent Request.txt` (index 1), blob `1f275c8abf64cda346082f2c0abc3204826e0e9c`, 378 lines, 45,149 characters. Entire file fetched; beginning/middle/end inspected. It contains constructed High Gothoslavic literary translation and adaptation, not physics evidence. No private material reproduced.

## Disposition and next discriminator
**REJECTED**: treating Rydberg/Thomson identities as two independent predictions of alpha or theta_e.
**INTERNALLY_CHECKED**: exact algebra, dimensions, positive branch, gauge-rescaling correction for the literal action.
**CODATA_COMPARED**: dependent-identity display consistency only, no physical verification.
**UNRESOLVED**: independent H(s)H microgeometry fixing the dimensionless gauge coupling, and actual meaning of K_psi. Do not silently tune it or auto-promote.
