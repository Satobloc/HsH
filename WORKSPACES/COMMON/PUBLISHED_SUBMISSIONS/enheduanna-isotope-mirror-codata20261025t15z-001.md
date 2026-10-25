# Enheduanna :48 | Tritium/helion mirror-lab mass gap, CODATA 2022
Task: calc48-20261025T15Z-enheduanna-isotope-mirror-001
Date: 2026-10-25 15:00 UTC nominal hour.
STATUS: CODATA_COMPARED. REJECTED: archived identification of 18.6 keV beta endpoint as triton-minus-helion nuclear rest-mass gap. UNRESOLVED: SAT modulus and composite mass law.

## Measured system and versioned inputs
Actual beta decay: triton (3H nucleus) -> helion (3He nucleus) + electron + antineutrino.
NIST CODATA 2022 adjustment, database v9.0, published May 2024:
Triton rest energy 2808.92113668(88) MeV; helion rest energy 2808.39161112(88) MeV; electron rest energy 0.51099895069(16) MeV. All three are measured/adjusted physical quantities, not HsH predictions.
Sources: https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf ; https://physics.nist.gov/cgi-bin/cuu/Value?mh= ; https://physics.nist.gov/constants
Atomic isotope masses from NIST isotope table: tritium 3.0160492779 u; helium-3 3.0160293201 u. CODATA u*c^2=931.49410372 MeV. https://pml.nist.gov/cgi-bin/Compositions/stand_alone.pl
KATRIN distinguishes beta endpoint from atomic mass difference and includes atomic/molecular state effects: https://www.katrin.kit.edu/publikationen/DesignReport2004-12Jan2005.pdf

## Historical source genealogy
SAT_THEORY_ARCHIVE_2023-25/HsH CLASSIC AUDIT.txt, Git blob 42b7957ad8a509a03fe15205e1f858669e261833, opening section "The Mirror Lab Derivation" asserts "approximately 18.6 keV differential between identical Q=9 configurations", then Delta m = m0 * B(Q) * (B * |J_eff|) and a purported elasticity E about 0.57%. Its own later audit, lines 220-272, ALREADY finds E absent from the equation and the stated ratio inconsistent; do not claim that older correction as new.
HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, table 1.2 and section 6, gives m_He3 = Q*m0*B^(-1)*S(Q,n)*(1+Delta_bridge), Q=3A, m0=1.007276e-27 kg, B=3/(4*pi), S approximately 0.262065, Delta_bridge=8.2e-5.
SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/FINAL.txt, blob 69f6da01ea4b0a336a4ed5b7ac0a12c781619f32, scorecard instead gives m_He3 = (Q*m0/(2B))*S. These alternatives differ by factor two. Original dated Nathan-authored equation derivations not verified; compilations are locators, not independent proofs.

## Executed real-data calculation (Python decimal, 65-digit working precision)
Nuclear rest-mass difference:
 (m_t-m_h)*c^2 = 2808.92113668-2808.39161112 = 0.52952556 MeV = 529.52556 keV.
Free-nucleus beta-decay available kinetic energy before recoil/neutrino mass:
 Q_free = (m_t-m_h-m_e)*c^2 = 0.52952556-0.51099895069 = 0.01852660931 MeV = 18.52660931 keV.
NIST rounded neutral-atom masses instead give:
 Q_atomic = (3.0160492779-3.0160293201)*931.49410372 = 0.018590573023223016 MeV = 18.590573023223016 keV.
The 18.6 keV endpoint is NOT the nuclear mass difference. Nuclear difference / 18.6 keV = 28.469116129. Atomic/electronic binding and daughter final-state/recoil corrections matter for precise endpoint comparison. Do not compare 18.5266 keV directly to 18.6 keV as if they were the same observable.
Conservative sums of individual CODATA marginal energy uncertainties (not joint 1-sigma due to unknown correlations): nuclear gap <=0.00176 keV, Q_free <=0.00192 keV. These are not claimed experimental endpoint uncertainties.

Historical helion mass formula, conditional use of its printed m0, S and Delta, Q=9:
 m_table=Q*m0/B*S*(1+Delta)=9.952317867021063e-27 kg.
 m_half=Q*m0/(2B)*S=4.975750921934933e-27 kg.
 m_half_bridge=4.976158933510532e-27 kg.
 CODATA helion mass=5.0064127862e-27 kg.
 Table residual +98.7914%; half-with-bridge residual -0.604302%.
These are CALIBRATED/CONDITIONAL outputs, NOT independent zero-parameter predictions. The factor-two discrepancy is not corrected by selecting the closer variant. The S(Q,n) function, delta, m0 origin, and the mechanical E law remain unverified.
Existing audit's arithmetic independently reproduced:
 B*|J_eff| with |J_eff|=0.033 is 0.0078781696830;
 (18.6 keV/2808.39161112 MeV)/(B*|J_eff|)=0.0008406785114 = 0.08406785114%, NOT 0.57%. E does not appear in Delta m formula and cannot be solved for.
The mass-gap correction follows exactly from standard beta-decay mass-energy accounting; it is NOT a novel HsH mechanism.

## Reproducible minimal code
```python
from decimal import Decimal as D, getcontext
getcontext().prec=65
Et,Eh,Ee=map(D,['2808.92113668','2808.39161112','0.51099895069'])
gap=Et-Eh
Q_free=gap-Ee
Q_atomic=(D('3.0160492779')-D('3.0160293201'))*D('931.49410372')
B=D(3)/(D(4)*D('3.141592653589793238462643383279502884197169399375105820974944'))
m0,S,bridge,Q=D('1.007276e-27'),D('0.262065'),D('8.2e-5'),D(9)
m_table=Q*m0/B*S*(1+bridge)
m_half=Q*m0/(2*B)*S
assert gap==D('0.52952556')
assert Q_free==D('0.01852660931')
assert m_table> D('5.0064127862e-27') > m_half
print(gap,Q_free,Q_atomic,m_table,m_half)
```
Local executed full script: enheduanna_isotope_mirror.py SHA256 fa1fc827d27f5a7be04771bf8ba7b535bcbe869a6695e0ffae3413999f9366ec. Actual run ALL ASSERTIONS PASS.

## Scope, controls and privacy
Real data used, no invented scale or free-data toy. Native Planck-mass conversion also executed with CODATA G and hbar; this is unit normalization only, not independent closure. Dimensional accounting passes for rest energies; topology: Q=9 cannot distinguish isobaric 3H and 3He without an additional independently derived charge/composition-sensitive variable.
BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 and subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 fetched and reviewed. Mersearch guide read; all four request lanes occupied; no new Mersearch run claimed. Bounded GitHub source search fallback; HSH_RESOURCES not searched. Random unrelated archive reading: Making AI Music Weird.srt, blob 26bd5b4ac6dbca0617c9a289c4741409de09c94e, full fetched and 13:50-15:21 plus beginning/end inspected; discusses ant-colony emergence and AI music, not nuclear evidence. No personal or private archive excerpts or protected signet.
No BEDROCK promotion, no fitted parameter substitution, no protected file mutation.
