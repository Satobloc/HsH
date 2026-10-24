# Calculation Relay :00 | Sable | 2026-10-24 11:00 UTC
## Quantum 23: Historical SAT B^5 proton/electron ratio and geometry gate
**Status: CODATA_COMPARED, FAILED for fixed raw B0. No physical candidacy or BEDROCK promotion.**

### Governing controls and provenance
BEDROCK.md complete 548 lines, Git blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE_OF_THE_THEORY.md complete 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Nathan Direct ND-2026-10-18-02/03, BR-007/008, and Oct 22–23 correction-first and Factory Floor gates apply.
Historical SAT primary: SAT_THEORY_ARCHIVE_2023-25/2026/HOMESTRETCH/SAT CORE PACK.txt, blob ec3cd7975f49251847242199f7e49765f0c39199, 50 lines, mass gear formulas line 31. SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f, 1563 lines, conflicting formulas lines 60, 307, 1248. SAT_THEORY_ARCHIVE_2023-25/SCALING.txt, blob dcf23fbeda258da813f54360ab1a7f33243c7089, 457 lines, correction claims lines 25–56. Later correction HsH/WORKSPACES/COMMON/PLAYGROUND_MASS_SECTOR_2026-10-01.md, blob 276eda2a886c80c3650e33b0e3cf4ad9633b6cda, 270 lines, explicitly FRACTURED/OPEN and corrected bare value 1934.34665. These are archived assistant/mixed documents, not all Nathan Direct.
Mersearch: existing three-repository request 2026-10-21-orson-nlm-big-haul-math-001 manifest 0f017d6f557d24c721e417d1fe3c49abf0653991; receipt 191acaf733c8e59920ca16c53ccb74d6be90f3c6; shared request occupied. No new Mersearch run. In this turn direct search preceded inspection of Mersearch, a BR-007 sequencing deviation recorded rather than concealed. Actual secrets.randbelow(4)=2 selected SAT MATH — BACKBONE for independent archive reading; complete file retrieved, programmatic 1563-line scan, inspected relevant and unrelated portions. Public sources only.

### Original equations, dimensional and algebraic test
Historical gear equations m_e=m0 B^4 and m_p=3m0/(2B) imply exactly m_p/m_e=3/(2B^5). All quantities dimensionally coherent for B dimensionless and m0 a mass. The exponent and prefactor are NOT independently derived from a specified H(s)H action. Other archival variants sqrt(3)/(2B^5) and sqrt(3/(2B^5)) conflict with this gear derivation.
B0=3/(4*pi)=0.238732414638. Unit 3-ball volume 4*pi/3, unit 2-sphere area 4*pi: V/A=1/3, NOT 3/(4*pi). Rather, 3/(4*pi)=1/V. For radius R, V/A=R/3, not a dimensionless universal constant without normalization. This corrects the archival verbal geometry claim, not the independently defined B0 itself.

### CODATA benchmark (versioned)
NIST 2022 CODATA proton-electron mass ratio mp/me=1836.152673426 with standard uncertainty 0.000000032, dimensionless. Source: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme%7Csearch_for=proton+mass (2022 adjustment, released 2024). Model uncertainty not specified; measurement-sigma residuals below are diagnostic only, NOT a statistically complete model test.

| Input | Calculated ratio | Residual model-CODATA | Relative residual |
|---|---:|---:|---:|
| exact B0, no bridge | 1934.346649506964 | +98.193976080964 | +5.34781108% |
| Bstable=0.24177 | 1815.846806586170 | -20.305866839830 | -1.10589207% |
| Bstable and stated delta=8.2e-5 | 1815.995706024310 | -20.156967401690 | -1.09778275% |
| B0 and stated delta | 1934.505265932223 | +98.352592506223 | +5.35644960% |

The archive's B0 result 1944.158 is numerically wrong; later HsH correction 1934.34665 is right. The archive's Bstable result 1825.04 is ALSO wrong: actual 1815.846806586. The asserted delta=8.2e-5 cannot close the gap; delta required at Bstable is +0.011182588072, 136.373 times stated. At B0, required delta is -0.050763381065.
Inverting CODATA to find Bfit=(3/(2 mu_CODATA))^(1/5)=0.241232875657 is a FIT, not a prediction. This differs from B0 by +1.04739066%. Do not relabel it a derived eigenvalue.

### Exact checks, limits and fail-rigid cross-sector consequence
Symbolic d ln(mu)/d ln(B)=-5. B->0+ gives infinity; B->infinity gives zero. At B0, 1% B decrease raises ratio 5.15357128%, and 1% increase lowers it 4.85343124%.
The archival Cabibbo readout theta12=B(1-B^2) changes from 0.225126298549 rad (B0) to 0.227637882767 rad (Bstable), shift +0.002511584218 rad. At inverse-fitted B it is 0.227194738482 rad, shift +0.002068439933 rad. This is cross-sector propagation only, not a PDG/experimental verification.
A first executed verifier failed an assertion inherited from the archive's wrong 1825.04 claim. The failed run was retained; the verifier was corrected to assert disagreement and passed. This is not smoothing.

### Gate ledger
PASS: algebra of mass gear ratio; dimensions; exact B0; corrected unit-ball normalization; signs, limits, derivatives, numeric replication, cross-sector propagation.
FAIL: archived B0=1944.158; Bstable=1825.04; bridge producing 1836.152; archive claim V/A=3/(4*pi); unqualified 0% CODATA deviation.
UNRESOLVED: derivation of 3/2, exponent five, finite-core action and elastic/holonomy correction, independence of Bstable, 4D physical mass mechanism.
CODATA_COMPARED (FAILED): raw exact B0 conditional formula. Inverse fit is NOT an independent prediction. MATHEMATICALLY CLEARED only for conditional algebra and elementary geometry. NOT A TENTATIVE H(s)H CANDIDATE. No BEDROCK write.

### Minimal independent runnable numerical verifier (Python 3 stdlib)
```python
import math
B0=3/(4*math.pi)
mu_ref=1836.152673426
sigma=3.2e-8
def mu(b,delta=0): return 3/(2*b**5)*(1+delta)
assert math.isclose((4*math.pi/3)/(4*math.pi),1/3)
assert math.isclose(1/(4*math.pi/3),B0)
for name,b,d in [('raw',B0,0),('stable',.24177,0),('stable+bridge',.24177,8.2e-5)]:
    v=mu(b,d)
    print(name,v,'residual',v-mu_ref,'measurement_sigma',(v-mu_ref)/sigma)
b_fit=(3/(2*mu_ref))**(1/5)
print('inverse-fit B (NOT prediction)',b_fit)
print('delta required stable',mu_ref/mu(.24177)-1)
for b in [B0,.24177,b_fit]:
    print('cross-sector theta12',b*(1-b*b))
assert abs(mu(B0)-1934.346649506964)<1e-9
assert abs(mu(.24177)-1815.846806586170)<1e-9
assert abs(mu(.24177,8.2e-5)-mu_ref)>20
```

Full executed SymPy/NumPy/Matplotlib verifier, failed-run log, complete literal output, and two Class P figures retained in the conversation archive and local bundle. Executed verifier SHA256 ed92f5731a10665ff1dea87d855e4e27bcc7531676678f862e4f1faf6dd794c9; output SHA256 7c49a6f6563078efe393f51450d3840160751501be6d5fc700e20df0049385aa.
