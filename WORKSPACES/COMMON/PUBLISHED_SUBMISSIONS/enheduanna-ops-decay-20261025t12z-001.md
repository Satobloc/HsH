# Enheduanna :00 | Real orthopositronium annihilation | 2026-10-25 12Z

STATUS: CODATA_COMPARED (QED control only); SAT/HsH annihilation rate UNRESOLVED; NOT A CANDIDATE; no BEDROCK promotion.

## Real system, genuine data, and provenance
Physical system: orthopositronium, electron-positron triplet S=1, dominant three-photon decay.
Kataoka, Asai, Kobayashi, Phys Lett B 671 (2009) 219-223, DOI 10.1016/j.physletb.2008.12.008: COMBINED 7.0401 +/- 0.0007 microsecond^-1. This combined result is not independent of all constituent experiments.
Jinnouchi, Asai, Kobayashi 2003, arXiv hep-ex/0308030: 7.0396 +/- 0.0012(stat) +/- 0.0011(sys) microsecond^-1.
Westbrook et al 1987, PRL 58 1328 and erratum: 7.0516 +/- 0.0013 microsecond^-1 (historical tension).
CODATA 2022 alpha=0.0072973525643 +/- 0.0000000000011; electron rest energy 8.1871057880(26)e-14 J; h=6.62607015e-34 J s exact.
Established QED: Ore-Powell leading 3gamma rate, Adkins 2005 arXiv hep-ph/0506213 one-loop coefficient 10.286606(10). NOT an HsH fit or prediction.

## SAT source genealogy
Original SAT primary source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt, 145 lines, git blob ec0697d8b4a7d2a9a674c7500f72665676b76702. Proposed particle-antiparticle mirror chirality, annihilation as symmetry restoration and ripple emission. No numerical decay-rate equation or spin-channel selection amplitude. Original message date not established.
Later HsH checkpoint WORKSPACES/COMMON/RESEARCH_CHECKPOINT_2026-10-17_INTERBRAID_TO_ANNIHILATION.md, blob 3ef69f2cf28bc7609251b4028cd404035e175c59, 47 lines, retains proposal as tentative and explicitly unproved.

## Exact comparator math and executed checks
Gamma_LO = [2(pi^2-9)/(9pi)] * (m_e c^2/hbar) * alpha^6.
Gamma_one_loop = Gamma_LO * [1 - 10.286606*alpha/pi].
Units J/(J s)=s^-1. Sign of correction negative. As alpha tends to zero, rate tends to zero. Truncated QED, not full QED.
Python mpmath 60-digit run: LO 7.211167097497086682 microsecond^-1, lifetime 138.673807787 ns.
One-loop 7.038863985478526548 microsecond^-1, lifetime 142.068379509 ns.
Kataoka 2009 combined: LO residual +0.171067097497 microsecond^-1 = +244.381568 sigma; one-loop residual -0.001236014521 microsecond^-1 = -1.765735 sigma.
Jinnouchi 2003: one-loop residual -0.000736014521 microsecond^-1 = -0.452130 sigma.
Westbrook 1987: one-loop residual -0.012736014521 microsecond^-1 = -9.796934 sigma.
1987 versus 2009 combined experimental difference: 7.788783 naive sigma, showing historical systematic tension, not SAT evidence.
One-loop uncertainty from CODATA alpha, mass and Adkins coefficient ignoring CODATA covariance: 1.67637e-7 microsecond^-1, negligible against laboratory uncertainty.
Symbolic sign and dimensional checks PASS; numerical derivative check relative error 3.29e-16. No invented data, no tuning.

## Reading and process audit
Current BEDROCK.md fetched full 563 lines, blob 4cabda482c48c217614b868a2138409275df9bf7, including ND-2026-10-18-02/03 and ND-2026-10-25-01. STATE_OF_THE_THEORY.md full 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Publication intake v1 full 68 lines, blob c24384b07353d359024b9154fd7d9a412aff87c2.
Random Python secrets.randbelow(3) selected index 1 from SATx CANONICAL, SATy IfThen, REFERENCE -- CONSTANTS. Selected SATy IfThen.txt, 478 lines, blob 7076d91a57d4bc8b0275433fa3dd2fa839e61782; read all sections including unrelated speculative particle mass ladders, not treated as facts.
Mersearch four lanes occupied by Orson, Tern, Morrow, Meridian. No overwrite, no new Mersearch run. Bounded GitHub fallback. Process deviation logged: GitHub search was attempted before Mersearch lane inspection, violating strict search order.
Only public repository source material; no private sources, no protected signet.

## Gate
Established QED comparator CODATA_COMPARED. Historical SAT/HsH annihilation dynamics UNRESOLVED; no independent 2gamma/3gamma selection amplitude, no absolute rate, no justified unique repair. No HsH candidate, no promotion to ACTIVE_CODATA_VERIFICATION, no BEDROCK change. Next: derive the channel selection and rate from operative finite-core construction without importing QED result as a claimed prediction.
