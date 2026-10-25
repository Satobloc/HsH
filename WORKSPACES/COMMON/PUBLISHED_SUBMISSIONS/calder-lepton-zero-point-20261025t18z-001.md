# Calder | Calculation Relay :48 | 2026-10-25T18Z

Task ID: calc48-20261025T18Z-calder-lepton-zero-point-001. h=354; seq=1774; worker Calder; successor Hale.

## Result
REJECTED: historical simultaneous assertions K_tau=0 and m_star=9e17 GeV under m_i=m_star exp(-lambda K_i). INTERNALLY_CHECKED: unique gauge/index-shift identity and archived arithmetic. CODATA_COMPARED: 2022 muon mass and muon/electron ratio. PDG_2026_COMPARED: tau mass. Physical H(s)H mass mechanism UNRESOLVED; no theory promotion.

## Recovered genealogy
HsH DEVELOPMENT_FULL_CONVOS/SAT 09SEP25 REFORMULATION.txt, Git blob b78177e8fc81dec4816aa3b3d7a4f131946b97a6, appendix B lines 665-715: m_i=m_star exp(-lambda K_i), lambda=0.1045, K_e=78, K_mu=27, K_tau=0. The source explicitly chooses integer counts using measured lepton masses, then claims m_star approximately 9e17 GeV. It also says shifting K absorbs m0 into lambda, which is algebraically wrong: the shift changes the intercept, not lambda. The same source explicitly chooses a hypothetical fourth-lepton gap 39 to match its earlier approximately 105 GeV claim; no independent geometric count is shown.

SAT [[[SAT_2025_DERIV]]].txt, blob 2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1, lines 5117-5119, explicitly labels the 51/27 rung slope a fit. HsH Constant derivations .txt, blob 3be8193a4c01f42582b4f1aa4eec5fd4d5a1f8c4, lines 25-31, repeats fitted mass ratios. Original dated Nathan-authored geometric derivation of these integers not yet found.

## Measured system, inputs and executed test
NIST CODATA 2022 muon mass-energy 105.6583755 +/- 0.0000023 MeV; muon/electron ratio 206.7682827 +/- 0.0000046. PDG 2026 tau mass-energy 1776.93 +/- 0.09 MeV. Derived electron energy from CODATA ratio: 0.51099895071092545 MeV; CODATA covariance not retrieved. Sources: https://physics.nist.gov/cgi-bin/cuu/Value?mmusme ; https://physics.nist.gov/cgi-bin/cuu/Value?eqmmuc2mev ; https://pdg.lbl.gov/2026/listings/rpp2026-list-tau.pdf

For K_tau=0, m_star=m_tau=1.77693 GeV exactly. The separately printed 9e17 GeV is 5.064915331498708e17 times larger. To obtain that scale at lambda=0.1045 requires a common index-origin shift C=390.107980881, not an integer. Nearest integer shift C=390 gives m_star=8.899014811410176e17 GeV, 1.1221% below the printed scale. The exact identity K_i'=K_i+C, m_star'=m_star exp(lambda C) leaves all three masses unchanged. It cannot be treated as an independent high-energy prediction.

Using the historical lambda and K with measured tau anchor: muon prediction 105.75683349161 MeV, residual +0.0931852%; electron prediction 0.51254971650733 MeV, residual +0.3034773%. With the archive's own historical tau input 1776.86 MeV, the formula gives electron 0.51252952523353 MeV (not its claimed 0.5108) and muon 105.75266732955 MeV (not claimed 105.66). These are arithmetic contradictions, not theory-level uncertainty tests. Lambda uncertainty and full covariance not supplied, so no calibrated z-score.

Archive-specified hypothetical fourth-lepton gap 27 yields 29.8560 GeV; gap 39 yields 104.6255 GeV, both conditional on the measured tau anchor and unverified rung assignment. Neither is an independent prediction. No experimental exclusion is asserted.

70-digit mpmath execution: ALL ASSERTIONS PASS (gauge algebra and reproduction, not physical validity). Executed script SHA-256: 7bf0818fd468f944a417be5d7306944060b33f1f86dc654f0222fb5751d313b3. Full code, results JSON, stdout and precision plot retained in the relay conversation.

## Controls and handoff
Live BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines) and STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines) read. Mersearch worker guide blob 82ffe3ebd837de1d997af78b04d411481f75158e; four request lanes occupied; no overwrite or Mersearch execution; bounded GitHub fallback, HSH_RESOURCES private content not used. Actual Python secrets.randbelow(2) drew index 1: SAT podcast Making AI Music Weird.srt, blob 26bd5b4ac6dbca0617c9a289c4741409de09c94e, 3971 lines fetched and six separated passages inspected; unrelated discussion of fictional cyborg beauty and generated music. No private material or protected signet published.

Hale: locate independent physical K origin or m_star. The fitted integer labels alone cannot fix the absolute mass scale; preserve Aster's prior mass-ratio failure and do not tune.
