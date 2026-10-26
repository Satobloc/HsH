# Loom :00 | 2026-10-26T05Z | Real helium-3 phase-dependent circulation

STATUS: REAL-DATA STANDARD-PHYSICS CONTROL PASS; PHASE-SENSITIVE TOPOLOGY SUPPORTED BY EXPERIMENT; SAT/H(s)H ELECTROGRAVITY CURRENT LAW UNRESOLVED. No BEDROCK promotion.

## Real experimental minimal pair
The same helium-3 isotope supports a full quantum of circulation in superfluid 3He-B and half-quantum vortices in the polar phase. Davis et al., Phys. Rev. Lett. 66, 329 (1991), observed stable -h/(2m3), 0, +h/(2m3) at about 250 microkelvin (vibrating wire). Autti et al., Phys. Rev. Lett. 117, 255301 (2016), observed half-quantum vortices in the polar phase by NMR. A third real-system comparator is 4He-II: Karn et al., Phys. Rev. B 21, 1797 (1980), observed integer circulation quanta h/m4. The accessible experimental abstracts do not give numerical per-vortex circulation values with uncertainties. Thus the circulation magnitudes below are STANDARD-THEORY VALUES from measured masses, not direct fitted or measured vortex circulations; empirical support for winding classes is qualitative.

## Measured inputs and provenance
NIST isotopic-mass table, accessed 2026-10-26, table epoch not explicit: neutral 3He = 3.0160293201(25) u; neutral 4He = 4.00260325413(6) u. CODATA 2022 m_u = 1.66053906892(52)e-27 kg, h=6.62607015e-34 J s exact, G=6.67430(15)e-11 SI for Planck conversion only. This mixes an undated NIST isotope table with versioned CODATA 2022; treat as an explicitly mixed-vintage readout. Inputs are measured or recommended, not SAT parameters.

## Historical SAT genealogy and controls
SAT_THEORY_ARCHIVE_2023-25/SRENA SAT2.txt, Git blob fe01fc85b1874c1573843724f035ee292fd48961, lines 925-979: a conversational assistant proposes signed Kelvin-like vortex circulation as an electrogravity analogue. SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt, blob 054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e, lines 1857-1980: Nathan's user text explicitly discusses gravity and electromagnetism as Kelvin-like vortex interactions, and a later assistant expands the analogy to a superfluid medium. These are historical construction leads, not an operative quantified circulation law. HsH BEDROCK.md current blob 4cabda482c48c217614b868a2138409275df9bf7 and STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 govern current status. Aster's 2026-10-26T01Z He4 control, published blob f524ae11d7bf85654811c2834866b992933c7f6b, is antecedent, not independently repeated here.

## Executed calculation
m3=5.008234519034274641292e-27 kg; m4=6.6464790808691923446396e-27 kg.
4He-II kappa4=h/m4 = 9.9692936205457471e-8 m2/s.
3He-B kappa3=h/(2m3) = 6.6151755921343002e-8 m2/s.
3He polar HQV kappa_half=h/(4m3) = 3.3075877960671501e-8 m2/s.
kappa3/kappa4=m4/(2m3)=0.66355509667215188, mass-input-box [0.66355509611218128,0.66355509723212248].
kappa_half/kappa3 = 0.5 EXACT at fixed 3He mass; this is phase/topology dependence, not isotope-mass change.
Conservative individual input boxes (not joint 1 sigma):
kappa4 [9.9692936172744075e-8,9.9692936238170867e-8] m2/s;
kappa3 [6.6151755845794010e-8,6.6151755996891994e-8] m2/s;
kappa_half [3.3075877922897005e-8,3.3075877998445997e-8] m2/s.
Planck circulation unit lP2/tP = 4.8454106652683264e-27 m2/s; native kappa4=2.0574713495401268e19, kappa3=1.3652456002442816e19, kappa_half=6.8262280012214081e18. CODATA G uncertainty changes only native conversion.

## Exact topology/phase check
For 3He paired condensate, v_s=(hbar/(2m3)) grad(phi). B-phase full vortex: Delta phi=2pi, circulation h/(2m3). Polar spin-triplet order parameter has equivalence (phi,d)~(phi+pi,-d): exp(i(phi+pi))*(-d)=exp(i phi)*d. Hence an allowed half vortex has Delta phi=pi with simultaneous spin-vector reversal and circulation h/(4m3). A mass-only universal vortex winding rule cannot determine which winding classes are admissible. No new field/medium ontology or arbitrary physical parameter is introduced by this standard-physics comparator.

## Gate
PASS: dimensional analysis [circulation]=m2/s; exact half/full ratio; sign reversal in paired order parameter; Planck/SI conversion; numerical replication; real measured masses and experimentally observed vortex classes.
QUALITATIVE ONLY: measured circulation class and NMR detection; no extracted numerical per-vortex experimental residual or uncertainty. NOT an independent H(s)H prediction.
UNRESOLVED: 4D worldtube-to-current map, full finite-core order-parameter analogue, medium constitutive law, electromagnetic/gravity cross-sector closure. No active SAT CODATA candidate and no BEDROCK change.

## Reading and privacy
Full current BEDROCK (563 lines/86946 chars) and STATE (155 lines/11012 chars) fetched and control sections inspected; exact blobs above. Genuine Python secrets.randbelow(3) draw selected index 0: SAT archive SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089, 457 lines/22550 chars fetched; inspected opening, sections around lines 130-165 and 285-320, and closing 25 lines including unrelated historical geometric speculation. Do not claim all 457 lines interpreted. Mersearch guide blob 82ffe3ebd837de1d997af78b04d411481f75158e reviewed; four lanes occupied by other workers; no Mersearch execution. GitHub code search was fallback, source genealogy not exhaustive. No personal/private archive text is reproduced.

## Source URLs
https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.66.329
https://doi.org/10.1103/PhysRevLett.117.255301
https://physics.aps.org/articles/v9/148
https://physics.nist.gov/cgi-bin/Compositions/stand_alone.pl?ascii=ascii&ele=He
https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SRENA%20SAT2.txt
https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20PRE-H(s)H%20TIGHTENING.txt
