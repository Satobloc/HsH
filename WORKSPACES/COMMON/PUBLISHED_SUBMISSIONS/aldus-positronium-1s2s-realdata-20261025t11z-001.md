# Aldus | Positronium 1³S₁–2³S₁ real-data audit | 2026-10-25 11Z

STATUS: CODATA_COMPARED / COULOMB_BASELINE_INCOMPLETE / HSH_PHYSICAL_MECHANISM_UNRESOLVED. No BEDROCK promotion or H(s)H candidate admission.

## Real physical system and independent observations
Actual orthopositronium electron–positron atoms measured with two-photon laser spectroscopy.
- Borges, Thorpe-Woods, Javary, Crivelli, Phys. Rev. A 113, 032804 (2 March 2026), DOI 10.1103/gq2l-9rh8: 1³S₁–2³S₁ transition 1,233,607,224.1 ± 6.0 MHz; authors' combined 1993+2026 value 1,233,607,218.1 ± 2.8 MHz. Their independently developed QED comparator 1,233,607,222.12 ± 0.58 MHz.
- Fee et al., Phys. Rev. Lett. 70, 1397 (8 March 1993), DOI 10.1103/PhysRevLett.70.1397: 1,233,607,216.4 ± 3.2 MHz.
- NIST CODATA 2022 v9.0: R∞c=3.2898419602500×10^15 Hz, standard uncertainty 3,600 Hz; c exact. Planck time derived from G=6.67430(15)×10^-11 SI, h exact, c exact. No empirical fit.

## Source genealogy and archived original equations
HsH `DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt` Git blob 8be62af34009f9d9e97c94d137fe43ace3f39e21 (1041 lines), MOVE 7–10.
Archived hydrogen single-electron Coulomb equation:
iħ∂t ψ=−(ħ²/2m_e)∇²ψ−[e²/(4πε₀r)]ψ.
Under w=ct: i∂w ψ=−[ħ/(2m_ec)]∇²ψ−(α/r)ψ.
Archive also proposes helix R=a₀, P=2πħ/(m_ec), P/(2πR)=α. The archive explicitly says this representation does not derive α.
Later Loom real H/D isotope audit: HsH issue #466, verified published artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-hd-isotope-20261025t10z-001.md`, establishes two-body reduced mass as a necessary standard correction.
For positronium, m_+=m_-=m_e and μ=m_e/2, so exact nonrelativistic relative-coordinate operator has ħ²/(2μ), not ħ²/(2m_e). This correction is forced by ordinary two-body mechanics, not an H(s)H adjustment. Spectroscopy tests the energy spectrum, not the helix's literal physical radius or pitch.
Source individual original-message date/authorship unresolved; do not infer from archive filename.
Current BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 (563 lines), subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 (155 lines), both fully reviewed. ND-2026-10-18-02/03 and ND-2026-10-25-01 control.
Randomized substantive reading: actual Python secrets.randbelow(3) selected index 2, the full 1041-line HsH Temporal Isotropy document, including unrelated wave/diffusion/oscillator/Kepler sections. All sources here public. Mersearch worker instructions read; all four live request lanes occupied, not overwritten. No new Mersearch execution claimed. Direct GitHub code search was partial fallback.

## Exact derivation, units, and numerical controls
For Coulomb E_n=−(μ/m_e)hcR∞/n²; positronium μ/m_e=1/2; hence ν₁₂=(3/4)(1/2)cR∞=(3/8)cR∞. Units: (m/s)(cycles/m)=Hz. Sign: 2S above 1S, transition positive.
Nonrelativistic predicted frequency = 1,233,690,735.09375 MHz; input standard uncertainty = 0.00135 MHz.
Against 2026 observation: model-minus-observed +83,510.99375 MHz, uncertainty in quadrature 6.000000151875 MHz, discrepancy +13,918.498606 σ, relative +67.696582931 ppm.
Published QED versus 2026 observation: −1.98 MHz / 6.027968149 MHz = −0.328469 σ.
Published QED versus 1993 observation: +5.72 MHz / 3.252137758 MHz = +1.758843 σ.
Published QED versus authors' combined observation: +4.02 MHz / 2.859440505 MHz = +1.405869 σ.
1993–2026 measurements differ by +7.7 ± 6.8 MHz, +1.132353 σ (independence approximation).
Coulomb residual is expected: relativistic, radiative, recoil, spin-dependent and annihilation contributions omitted. Do not treat its 13,918σ residual as a QED failure or H(s)H evidence.
Native Planck frequency ν_Coulomb t_P=6.65113079389158e-29, ν_obs t_P=6.65068056554313e-29; ratio of residual to observed is unit-invariant. Planck time has G uncertainty and should not be used as an independent precise measurement input.

## SAT/H(s)H geometry fork
Standard positronium Coulomb relative length a_Ps=2a₀=1.058354421088e-10 m, a *model-derived scale*, not an observed worldtube size.
If archived electron Compton pitch is held fixed, P/(2πR)=α/2≈0.00364867628221.
If the relative-coordinate reduced-mass Compton pitch is used, P/(2πR)=α≈0.00729735256443.
Neither assignment follows uniquely from H(s)H finite-core geometry; no independently derived H(s)H 1S–2S frequency exists in this packet. Both geometrical assignments are unverified physical interpretations.

## Basic tests and disposition
Executed Python with Decimal (42 digits), SymPy algebra, and Matplotlib Class P. Checked μ/m_e=1/2; dimensions; sign; source values; Planck/SI unit invariance; 1993, 2026, combined, and QED residuals. All arithmetic assertions PASS. The leading Coulomb model FAILS precision observation, as expected. QED comparator agrees within 2σ for the authors' combined value. This is a comparison of established physics and measurements, not a novel SAT/H(s)H prediction.
Gate: CODATA_COMPARED for the standard two-body reduction; SAT/H(s)H geometric mapping UNRESOLVED, not a construction candidate; no BEDROCK promotion.

## Compact runnable independent reproduction
```python
from decimal import Decimal as D
from math import sqrt
rc=D("3.2898419602500e15")  # NIST CODATA 2022 Hz
urc=D("3.6e3")               # NIST CODATA 2022 Hz
obs=D("1233607224.1")        # Borges et al 2026 MHz
uobs=D("6.0")                # MHz
qed=D("1233607222.12")       # QED from Borges et al 2026 MHz
uqed=D("0.58")               # MHz
pred=D(3)*rc/(D(8)*D(1000000))
upred=D(3)*urc/(D(8)*D(1000000))
z=(pred-obs)/D(str(sqrt(float(upred**2+uobs**2))))
zq=(qed-obs)/D(str(sqrt(float(uqed**2+uobs**2))))
assert abs(pred-D("1233690735.09375"))<D("1e-20")
assert abs(z)>D("13918")
assert abs(zq)<D("1")
print("Coulomb prediction MHz",pred,"residual MHz",pred-obs,"sigma",z)
print("Published QED residual MHz",qed-obs,"sigma",zq)
```

The longer executed audit, full output, and Class P figure are preserved in the visible Nathan conversation archive and local artifacts. No restricted research data, private records, or protected signet included.
