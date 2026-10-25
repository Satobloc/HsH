# Mercer :00 | Measured parapositronium lifetime in alpha-SiO2 | 2026-10-25

REAL SYSTEM: Delocalized singlet electron-positron bound states in crystalline alpha-SiO2, not a numerical fixture.
MEASUREMENT: Saito and Hyodo, Physical Review Letters 90, 193401 (2003), DOI 10.1103/PhysRevLett.90.193401: 156 +/- 4 ps (one standard uncertainty). https://pubmed.ncbi.nlm.nih.gov/12785944/
INPUTS: NIST CODATA 2022 alpha=0.0072973525643(11); electron rest energy 8.1871057880(26)e-14 J; a0=5.29177210544(82)e-11 m; h exact 6.62607015e-34 J s. https://physics.nist.gov/cuu/Constants/
ARCHIVE: SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt, git blob ec0697d8b4a7d2a9a674c7500f72665676b76702, 145 lines read. Annihilation as chirality/symmetry-restoration/ripple; NO quantitative decay law.
LATER MATHEMATICS: HsH/DEVELOPMENT_FULL_CONVOS/H(s)H TEMPORAL ISOTROPY.txt, blob 8be62af34009f9d9e97c94d137fe43ace3f39e21, 1041 lines retrieved, MOVE 7/8 lines 369-480 examined. Hydrogen i dpsi/dw=-(lambda_bar_C/2) Laplacian psi -(alpha/r)psi. Positronium relative mass mu=m_e/2 is an established two-body correction, not an HsH annihilation derivation.
LATER CHECKPOINT: HsH/WORKSPACES/COMMON/RESEARCH_CHECKPOINT_2026-10-17_INTERBRAID_TO_ANNIHILATION.md, blob 3ef69f2cf28bc7609251b4028cd404035e175c59, 47 lines read, no derived annihilation rate.
CONTROLS: BEDROCK.md 563 lines SHA 4cabda482c48c217614b868a2138409275df9bf7, STATE_OF_THE_THEORY.md 155 lines SHA b5958a1056c2541f00ab4f3477d8acc32426cfe9, both full read. Mersearch four lanes occupied, none overwritten, no new Mersearch run. Direct source read preceded lane inspection (procedural sequencing failure). Actual secrets.randbelow(3) selected archive index 0, the 145-line SATv source, including unrelated gravity and boson sections. Public source only.

STANDARD QED CONTROL, not SAT prediction:
Gamma0 = alpha^5*(m_e*c^2)/(2*hbar), units 1/s.
Gamma1 = Gamma0*(1+(pi^2/4-5)*alpha/pi), one-loop vacuum QED (truncated). Reference: Adkins et al., Phys Rev A 68, 032512 (2003), DOI 10.1103/PhysRevA.68.032512.
QED vacuum leading lifetime = 124.4941970130 ps.
QED vacuum one-loop lifetime = 125.2309016065 ps.
Observed alpha-SiO2 lifetime = 156 +/- 4 ps.
Observed minus vacuum one-loop = +30.7690983935 ps = +7.69227 sigma (experiment uncertainty dominates).
Observed in-medium decay rate = 6.4102564103e9 s^-1.
Conditional contact density ratio Gamma_med/Gamma_vac = 0.8027621898 +/- 0.0205836459.
Under a further Coulomb-like cubic contact model, a_eff/a_Ps = 1.0759804083 +/- 0.0091964137. Neither a_eff nor contact density is directly measured.
SIGN FALSIFIER: a model where the medium ONLY adds nonnegative decay channels gives Gamma_med>=Gamma_vac and tau_med<=tau_vac. Observed tau_med>tau_vac: FAIL at 7.69 sigma. A changed bound-state contact/annihilation kernel is needed; the experiment identifies medium screening as its interpretation.
This is NOT a failure of vacuum QED: experiment and comparator are in different environments. No HsH rate, spin-selection amplitude, or material constitutive response has been derived.

REPRODUCIBLE PYTHON (requires mpmath):
```python
import mpmath as m
m.mp.dps=60
D=m.mpf
a=D('0.0072973525643'); ua=D('1.1e-12')
M=D('8.1871057880e-14'); uM=D('2.6e-23')
h=D('6.62607015e-34'); hb=h/(2*m.pi)
obs=D('156'); uobs=D('4')
g0=a**5*M/(2*hb)
A=m.pi**2/4-5
g1=g0*(1+A*a/m.pi)
t0=D('1e12')/g0
t1=D('1e12')/g1
u_g=m.sqrt((g0/a*(5+6*A*a/m.pi)*ua)**2+(g1/M*uM)**2)
ut=t1*u_g/g1
z=(obs-t1)/m.sqrt(uobs**2+ut**2)
q=t1/obs
uq=q*m.sqrt((ut/t1)**2+(uobs/obs)**2)
ell=(obs/t1)**(D(1)/3)
uell=ell*m.sqrt((ut/t1)**2+(uobs/obs)**2)/3
assert g1<g0 and obs>t1 and z>7
print('tau0 ps',m.nstr(t0,18))
print('tau1 ps',m.nstr(t1,18))
print('obs_minus_vac ps',m.nstr(obs-t1,18))
print('sigma',m.nstr(z,18))
print('conditional_contact_ratio',m.nstr(q,18),'u',m.nstr(uq,12))
print('conditional_length_ratio',m.nstr(ell,18),'u',m.nstr(uell,12))
```

TESTS: dimensions PASS, sign FAIL for extra-decay-only model, numerical sensitivity derivative relative error 1.99e-12, actual measured inputs, no fitting. Uncertainties from CODATA treated as independent approximation; no full covariance; observational error dominates.
GATES: standard QED comparator CODATA_COMPARED; added-positive-decay-only hypothesis REJECTED for this measured system; SAT/HsH annihilation mechanism UNRESOLVED; NOT a HsH candidate; no BEDROCK promotion.
