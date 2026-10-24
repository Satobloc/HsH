# Tern Rook 2026-10-24 21Z | Historical SAT CP closure: full CKM gate

SANDBOXED. No BEDROCK changes or physical validation.

## Sources and provenance
BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd (548 lines), STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines); both retrieved in full, Oct 18 ND-02/03 and correction-first gates checked. Primary SAT archive CP CLOSURE.txt blob 4c4525504e32b5cded85a68ea60660e1579871ee (35 lines, complete read). First surviving ingest June 29, 2026, not composition date. Prior Argus XW-004 audit blob b7dc0f60a8ba63d83761aa4485719240a448c75a (112 lines, complete read) already identified numerical mismatch. Later SAT-TO-STANDARD 2.txt blob f32cca74bbb174bb95319d92d354abb6f368e373 distinguishes J_eff from Standard Model J.

Random reading: actual Python secrets.randbelow(4) selected index 2, 2026/SAT MATH - BACKBONE.txt (repository title uses em dash), blob 1854995be3311f565739f2be64269cbb0385a82f, 1563 lines/233643 characters. Full file fetched; substantial passages 108-145, 560-585, 720-840 inspected, including unrelated dimension-recursion and Mark IV.2 action. No line-by-line claim. Mersearch guide blob 53ff8ba46672110efebeaa7785ad1e0dd2a782af checked; four lanes all occupied, no Mersearch execution; direct public archival reads only, incomplete three-repository coverage. Source privacy: public material only.

## Recovered historical construction
B=3/(4*pi), S=0.2621, delta=270 degrees. theta12=B(1-B^2), theta23=B^2(1-S), theta13=B^3 S, all in radians. J_eff=(3/4)theta12 S(1-S); J_project=J_eff B^5; J_small=theta12 theta23 theta13 sin(delta). Archive asserts equality of the last two, full CP closure. Inputs are inherited assertions, not independently derived in this audit.

## Exact result and real execution
Substitute angles: J_small=theta12 B^5 S(1-S) sin(delta). Thus J_project/J_small=3/(4 sin(delta))=-3/4 EXACTLY at delta=270 degrees, independent of B and S whenever the product is nonzero. Signed equality requires sin(delta)=3/4, incompatible with 270 degrees; absolute equality requires |sin(delta)|=3/4.

Executed SymPy exact identity, NumPy PDG-standard V=R23 U13(delta) R12, full unitarity and quartet. For B=3/(4*pi): theta12=0.225126298549, theta23=0.042055257043, theta13=0.003566163027 rad. Note sin(theta12)=0.223229475433, not 0.225126. J_project=+2.532263989399e-5; J_small=-3.376351985865e-5; exact J from quartet=-3.259528039728e-5. |J_exact|/J_project=1.287199144076. Maximum unitarity defect=7.844e-18. Rephasing-invariant triangle apex (rho_bar,eta_bar)=(0.000242921691,-0.370715537727). Changing phase to 90 degrees flips eta and J signs but leaves rho nearly zero.

Independent NumPy direct-entry matrix verifier: 100 actually executed seeded random left/right rephasings (seed 20261024), max |delta J|=1.305e-17; CP conjugation test passed. Failures retained: first triangle area test had erroneous factor two, fixed by twice-area=|J|; first rephasing tolerance 1e-17 failed due rounding, changed to 1e-14 and actual max logged. No historical formulas silently modified.

## External diagnostic, not CODATA
PDG 2024 quark CKM global fit, section 12.4 Eqs. 12.26-12.28, https://pdg.lbl.gov/2024/download/db2024.pdf : rho_bar=0.1591+/-0.0094, eta_bar=0.3523(+0.0073/-0.0071), J=(3.12(+0.13/-0.12))e-5, delta=1.147+/-0.026 rad. SAT historical quark-standard interpretation gives marginal residuals rho=-16.90 sigma, eta=-99.04 sigma, signed J=-49.07 sigma; wrapped delta=-104.53 sigma. These are correlated global-fit marginals, NOT a joint chi-square or independent SAT predictions. CKM vs PMNS identification remains unresolved; a leptonic 270-degree phase cannot simply be substituted into quark CKM.

## Gate
INTERNALLY_CHECKED: algebraic -3/4 obstruction; unitary matrix, J quartet, triangle, rephasing and numeric checks.
REJECTED: two-route historical equality; PDG-standard quark CKM identification at 270 degrees.
UNRESOLVED: possible PMNS/internal invariant interpretation, finite-core derivation of B,S, cross-sector geometry.
NOT A TENTATIVE H(s)H CANDIDATE; NO CODATA QUANTITY; NO ACTIVE CODATA PROMOTION; NO BEDROCK WRITE.
