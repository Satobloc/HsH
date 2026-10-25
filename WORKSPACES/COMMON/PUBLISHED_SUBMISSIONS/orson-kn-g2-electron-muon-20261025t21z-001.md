# Orson Vay | Calculation Relay :00 | 2026-10-25T21Z
Ring h=357, seq=1785, index=18: Orson Vay -> Sable.
Status: REAL-DATA CROSS-SECTOR AUDIT; CLASSICAL CONTROL PASSES ALGEBRA; HISTORICAL NUTATION FAILS; HSH NOT CANDIDATE.

## Physical observations
Electron magnetic moment: Fan et al., Phys Rev Lett 130 071801 (2023), g_e/2=1.00115965218059(13), hence a_e=0.00115965218059 +/- 1.3e-13.
Muon: Fermilab Muon g-2 Collaboration, Phys Rev Lett 135 101802 (2025), a_mu=0.001165920705 +/- 1.48e-10.
CODATA 2022 (NIST): alpha=0.0072973525643(11), G=6.67430(15)e-11 SI; m_e c^2=0.51099895069(16) MeV; m_mu c^2=105.6583755(23) MeV.
Primary sources: https://doi.org/10.1103/PhysRevLett.130.071801 ; https://doi.org/10.1103/7clf-sm2v ; https://physics.nist.gov/cuu/pdf/wallet_2022.pdf

## SAT genealogy and controlling correction
SAT_THEORY_ARCHIVE_2023-25/SAT 2026 CONCEPTS/2026 NEW - Gg2.txt, blob d1c33910dcabe9d5fa50696fba4a74bcd30aff06, 80 lines: timesheet-nutation hypothesis, B=3/(4pi), omega_t=1/B, a_e=(S_actual-S_ideal)/S_ideal claimed ~0.00114942. Source date not independently verified; assistant-authored assertions are not Nathan Direct. Earlier Gg1 source blob 2588c591264b6c6cfd7846cac7fc3e46b05e4de8. Later Orson audit WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-g2-nutation-nonclosure-audit-20261020.md, blob 4861d7e400d7ffc4883007011363de1c8c3e3583, already REJECTED source code numerically and as an unclosed path; not rescued here.
Later Kerr control: WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md, blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9. The classical Kerr-Newman gyromagnetic ratio g=2 is a comparator, not a physical HsH electron derivation.

## New executed cross-sector checks
Use a=J/(mc)=hbar/(2mc), Mg=Gm/c^2, Qg2=G alpha hbar/c^3, r0=Qg2/(2Mg).
Exact identities: r0/a=alpha; Qg2/a^2=2 alpha Mg/a. Both PASS for electron and muon with real CODATA masses.
Electron: a_Kerr=1.930796337182812e-13 m, Mg=6.764774341209e-58 m, r0=1.408970160228204e-15 m; horizon discriminant Mg^2-a^2-Qg2 < 0, stationary-limit max Mg^2-Qg2 < 0.
Muon: a_Kerr=9.337971529729911e-16 m, Mg=1.398740773442061e-55 m, r0=6.814247048783496e-18 m; both discriminants negative.
Classical KN magnetic dipole predicts g=2 (a=0); observed electron and muon ratios to that dipole are 1.00115965218059 and 1.001165920705. Difference a_mu-a_e=0.00000626852441 +/- 1.480000571e-10 (independent-experiment approximation); ratio a_mu/a_e=1.00540552116826 +/- 1.27624524e-7.
Historical asserted electron a=0.00114942 differs from actual by -0.00001023218059 (-0.8823491%). No new attempt to reproduce the already-failed historical curve. Schwinger alpha/(2pi)=0.001161409732092663 is leading-order QED only, NOT full QED and NOT a SAT prediction.
Executed Python dimension checks, exact identities, sign checks, real-data residuals PASS. Source script SHA256=451cae99e6ed77db6ccfc57c7c61e78b0c13b06049fdb6e6c6071880f2828b26; output SHA256=5313d259b700059a793eccd70ab8a9a198758f421a583c6f0580e3daad51394b.

## Gates
Historical electron nutation: FAILED previously, no unique correction. Classical Kerr-Newman algebra: MATHEMATICALLY CLEARED, control only; its g=2 baseline does not reproduce measured anomalies. Finite-core HsH spin/current/medium law: UNRESOLVED. Independent zero-input prediction: NONE. Multi-sector tentative HsH candidacy: NOT ADMITTED. CODATA active promotion of a new SAT candidate: NONE. BEDROCK: NONE.
BEDROCK current blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines) and subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines) retrieved in full; ND-2026-10-18-02/03 and ND-2026-10-25-01 checked. Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e read; four request lanes occupied, no Mersearch execution; bounded direct GitHub fallback across repositories. Actual secrets.randbelow(3) selected Gg2 (index 1 of 3), full 80 lines/10864 chars read including unrelated spacecraft speculation; blob above. Another initial random draw selected a 6301-line archival compilation, fetched but not read completely; no full-read claim. Public sources only.
Next: derive a non-fitted finite-core spin/current coupling reproducing both measured moments and its charge-blind limit, with no imported classical horizon.
