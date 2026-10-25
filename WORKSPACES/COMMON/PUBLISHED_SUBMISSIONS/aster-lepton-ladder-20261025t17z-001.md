# Aster | Calculation Relay :48 | 2026-10-25T17Z

Task: calc48-20261025T17Z-aster-lepton-ladder-001. h=353, seq=1769, ring index=2, worker Aster, next Ariadne.

## Result
REJECTED: the archived fixed-gap exponential charged-lepton ladder does not share one exact lambda at observed central masses. INTERNALLY_CHECKED arithmetic and invariant. CODATA_COMPARED muon/electron ratio (2022); PDG_2026_COMPARED tau mass. Physical SAT/H(s)H derivation UNRESOLVED; no BEDROCK promotion.

Historical source: SAT_THEORY_ARCHIVE_2023-25/[[[SAT_2025_DERIV]]].txt lines 5117-5119, Git blob 2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1, calls lambda=0.1043702275 fitted to 51 muon/electron rungs and 27 tau/muon rungs. Exact HsH copy in DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[SAT_2025_DERIV]]].txt, same blob. HsH DEVELOPMENT_FULL_CONVOS/Constant derivations .txt lines 25-31, blob 3be8193a4c01f42582b4f1aa4eec5fd4d5a1f8c4, gives exp(51lambda)=204.9736845 and exp(27lambda)=16.7432659. Historical assistant compilations; original dated Nathan derivation unknown. Existing Checksheet results.txt blob 04a74ecc141eaf993b9ce0b01b2929754d5c905b had already noted mass-ratio mismatch. This packet newly tests the parameter-eliminated invariant and conditional tau holdout.

Actual measured leptons: NIST CODATA 2022 muon/electron mass ratio 206.7682827 +/- 0.0000046; muon mass energy 105.6583755 +/- 0.0000023 MeV. PDG 2026 tau mass 1776.93 +/- 0.09 MeV, listing created June 1, 2026. https://physics.nist.gov/cgi-bin/cuu/Value?mmusme ; https://physics.nist.gov/cgi-bin/cuu/Value?eqmmuc2mev ; https://pdg.lbl.gov/2026/listings/rpp2026-list-tau.pdf

Native dimensionless Planck-mass ratios (c=G=hbar=1); MeV is external observational readout. Historical equations R_mu_e=exp(51lambda), R_tau_mu=exp(27lambda). Their exact necessary compatibility condition is I=(R_mu_e)^27/(R_tau_mu)^51=1, equivalently ln(R_mu_e)/51=ln(R_tau_mu)/27.

Executed 70-digit mpmath: measured R_tau_mu=16.81769184497825 +/- 0.00085180193133; lambda_mu_e=0.104541152137544, lambda_tau_mu=0.104534496974583; difference +0.00000665516296133 +/- 0.00000187589479119 (measurement-only 3.5477 sigma). Parameter-free I=1.009206278871359, log I=0.00916415939775 +/- 0.00258310712747. Archived lambda reproduces 204.9736844783 and 16.7432659149; discrepancies vs measured ratios are -1.79459822 and -0.07442593.

Conditional holdout: fix lambda ONLY with CODATA mu/e; m_tau = m_mu*(R_mu_e)^(27/51)=1777.24932417419 MeV. PDG observed 1776.93 +/- 0.09 MeV. Residual +0.31932417419 +/- 0.09000001075 MeV, measurement-only 3.548 sigma. This is a calibration/holdout check, NOT an independent SAT prediction. Theory uncertainty and full covariance unavailable. Changing integer rung counts or adding correction terms would be an unlicensed new model.

Executed script SHA-256: 100e0e8551fdcf567f5e44bbe22b67d9754f8987fcb4a90ec003410fdf1c6600. Full script, JSON, stdout, precision figure and complete packet preserved in relay conversation. ALL ASSERTIONS PASS (arithmetic/invariant only). No pure toy calculations.

Controls: live BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines/86946 chars) retrieved, ND-2026-10-25-01, ND-2026-10-18-02/03, BR-007/008 and Planck standard inspected. STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines/11012 chars) retrieved/read. Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e read; four request lanes occupied, none overwritten. No Mersearch run; bounded SAT/HsH fallback, private HSH_RESOURCES not searched. Actual Python secrets.randbelow(2) selected index 0: SAT podcast Making AI Music Weird.srt, blob 26bd5b4ac6dbca0617c9a289c4741409de09c94e, 3971 lines/67884 chars, full fetch, sampled 5 passages; authentic unrelated ant-colony emergence discussion at 13:40. Privacy guard: no protected signet or private material published.

Handoff Ariadne: trace independent provenance of 51 and 27 rung assignments before modifying them; retain mismatch and do not tune.