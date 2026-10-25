# Elias Kern | Calculation Relay :00 | Historical B^5 mass-ratio audit
Date 2026-10-25T04Z. Ring h=340, seq=1700, worker Elias Kern, next Nadir Voss.
STATUS: CODATA_COMPARED / FAILED for archived B choices. Not an H(s)H construction candidate, not BEDROCK, not physical truth.

## Provenance and controls
BEDROCK.md full 548 lines read, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; ND-2026-10-18-02/03, ND-2026-10-23, BR-007/008 and units/Planck control inspected.
STATE_OF_THE_THEORY.md full 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
Mersearch-first: consulted existing completed 3-repo run 2026-10-21-orson-nlm-big-haul-math-001, receipt blob 191acaf733c8e59920ca16c53ccb74d6be90f3c6, manifest 0f017d6f557d24c721e417d1fe3c49abf0653991. Scanned 13897 files/23825506 records, 34983 hits; not a new run. All four request lanes occupied; no overwrites. Bounded GitHub search and primary reads followed.
Primary 1: SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt, full 84 lines, blob c29c49b697208294d705b0a280d91808a57edc66, Section III. Filename suggests May 2026; exact original message date unverified.
Primary 2: SAT_THEORY_ARCHIVE_2023-25/2026/HOMESTRETCH/SAT CORE PACK.txt, full 50 long lines, blob ec3cd7975f49251847242199f7e49765f0c39199, Section 4. 2026 directory, exact author/date unknown.
Later corrective instruction: SAT_THEORY_ARCHIVE_2023-25/SAT 2026 HARD METHOD.txt, full 3 long lines, blob a8d8acd5578f7a73d466a9f89c43c51d6687fe6e. Nathan warns against arbitrary holonomy bridges/elastic factors and requires independent cross-sector vetting.
Random anti-tunnel read: Python secrets.randbelow(3) selected index 2 of predeclared [GEOMETRIC VISUALIZATION.txt, 2023 SPACETIME CHAT.txt, 00 PROPER DIMENSIONALITY .txt]. Read 00 PROPER DIMENSIONALITY .txt full 1386 lines in ranges 1-450/451-900/901-1386, blob e4836ca1f57e9da5996cf1eaad10ee436e49545a. Its user-authored discussion distinguishes 4D coarse-graining from additional 3D slicing. AI summaries are not proofs. All cited sources public; no private HSH_RESOURCES copied.

## Historical equation and mathematical check
Archived gear rules: m_e=m0*B^4 and m_p=3*m0/(2*B); division yields mu=m_p/m_e=3/(2*B^5). m0 mass, B dimensionless, mu dimensionless. The archival B=3/4pi ~0.23873241 notation is ambiguous; the given number uniquely disambiguates to 3/(4*pi), not (3/4)*pi. A reciprocal physical 3-ball volume has units length^-3; dimensionless 3/(4*pi) requires a unit-radius normalization. Identifying this normalized number with a physical projection angle is unproved.
Archived raw B=3/(4*pi)=0.238732414637843; stable B=0.24177; proposed bridge +0.0082%=+0.000082. May snapshot delta_elastic is unspecified; no independent physical determination of it is provided here.
NIST CODATA 2022 (database v9.0, May 2024): mp/me=1836.152673426, standard uncertainty 0.000000032, dimensionless. https://physics.nist.gov/cgi-bin/cuu/Value?mpsme%7Csearch_for=proton+mass
Raw B gives mu=1934.346649506964, residual +98.193976080964 (+5.34781108%).
Raw B plus bridge gives mu=1934.505265932224, residual +98.352592506224 (+5.35644960%): bridge worsens.
Stable B gives mu=1815.846806586171, residual -20.305866839829 (-1.10589207%).
Stable B plus bridge gives mu=1815.995706024311, residual -20.156967401689 (-1.09778275%): still fails.
Inverse B needed to match CODATA without bridge: 0.24123287565696146. This is a FIT, NOT A PREDICTION. Required delta for raw B=-0.0507633810651, for stable B=+0.0111825880720, not +0.000082. Do not insert either.
d ln(mu)/d ln(B)=-5. With no model uncertainty, residual divided by CODATA experimental standard uncertainty is only a discrepancy scale, not a model z-score.

## Fully runnable numerical reproduction (Python 3 standard library)
```python
from math import pi, log
CODATA, U = 1836.152673426, 0.000000032
B0, BS, BRIDGE = 3/(4*pi), 0.24177, 0.000082
def mu(B, delta=0):
    assert B>0
    return 3*(1+delta)/(2*B**5)
for label,B,delta in [('raw',B0,0),('raw+bridge',B0,BRIDGE),
                      ('stable',BS,0),('stable+bridge',BS,BRIDGE)]:
    x=mu(B,delta)
    print(label, 'B=',format(B,'.15f'),'mu=',format(x,'.12f'),
          'residual=',format(x-CODATA,'.12f'),
          'relative_percent=',format(100*(x/CODATA-1),'.10f'))
    assert abs(x-CODATA)>U
for B in (0.1,B0,BS,1.0):
    m0=7.123
    assert abs((3*m0/(2*B))/(m0*B**4)-mu(B))<1e-10
    assert -15/(2*B**6)<0
assert mu(1)==1.5
assert mu(2)==3/64
assert mu(1e-8)>mu(1e-4)
assert mu(1e8)<mu(1e4)
assert mu(B0,BRIDGE)>mu(B0)
assert mu(BS,BRIDGE)>mu(BS)
B_fit=(3/(2*CODATA))**(1/5)
print('inverse-fit B (not prediction)',format(B_fit,'.16f'))
print('required delta raw',CODATA/mu(B0)-1)
print('required delta stable',CODATA/mu(BS)-1)
print('PASS: algebra, signs, exact cases, limits, numerical replication')
```

## Gate and failures retained
Algebra and stated dimensionless typing PASS; mass-gear physical identification and B-to-angle mapping remain UNRESOLVED. Correcting parentheses is justified, but adjusting B or bridge to CODATA is not. Fixed historical variants have been externally compared and FAIL quantitatively. No multi-sector closure or physical verification, no BEDROCK update. Revisit only if independent geometry fixes B and the gear exponents before mass-ratio comparison.
