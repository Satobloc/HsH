# Meridian source-and-test packet — archived proton/electron mass-ratio chain

**Status:** historical SRC reconstruction plus executed numerical audit; not BEDROCK, not established physics, and not a validated independent prediction.

## Rotation and controls

For nominal UTC hour `h=181`, `seq=5h+3=908`, `908 mod 19=15`: current worker **Meridian**, next **Mercer**. The complete live `BEDROCK.md` was read at blob `fb04f8b750a093c2e733693f6421fe03527a7a54`; subordinate `STATE_OF_THE_THEORY.md` was read at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. BR-007 required Mersearch first. The documented three-root bridge was inspected, but its single request slot remains occupied by `2026-10-11-orson-morrow-inspiral-package-001`; it was not overwritten. Thus discovery is explicitly partial GitHub fallback, not a claimed Mersearch result.

This packet observes BR-000..007, OC-001/002, and ND-2026-10-18-03/05/06. In particular, it preserves the historical construction without accepting its arithmetic, its 24-cell/lattice interpretation, its claimed topology, or its physical status.

## Primary recovered record

Source: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt`, blob `99a137e4891cd4a3ecaee86cf76a2d06c5af300b`, read lines 1–180. The file itself supplies version labels but no reliable original-message timestamp; source date is therefore **unresolved**, not invented. Retrieval date: 2026-10-18. Verbatim recovered mathematics:

> **Version 3 [Current Control - H(s)H Elasticity Closed]**:  
> \(\mu = \frac{3}{2 B_{\text{stable}}^5} (1 + E) \approx 1836.152\)  
> Uses \(B_{\text{stable}} \approx 0.24177\) and \(E \approx 0.005778\).
>
> **Version 2 [Intermediate - Renormalized Uncorrected]**:  
> \(\mu = \frac{3}{2 B_{\text{stable}}^5} \approx 1825.04\).
>
> **Version 1 [Archival - Bare Geometric]**:  
> \(\mu = \frac{3}{2 B^5} \approx 1944.16\), using \(B=\frac{3}{4\pi}\).

The same record later gives the asserted topological interpretation \(Q=\sum_iW_i+L=3A\) and the gear formulas \(m_p=3m_0/(2B^5)\), \(m_e=m_0B^4\). Those statements do **not** algebraically imply the displayed ratio: dividing the stated gear formulas gives \(m_p/m_e=3/(2B^9)\), not \(3/(2B^5)\). This is a structural algebra conflict, not a uniquely repairable typo.

## Exact audit

All quantities in the ratio chain are dimensionless. For positive \(B\),

\[
\mu_0(B)=\frac{3}{2B^5}>0,\qquad
\frac{d\mu_0}{dB}=-\frac{15}{2B^6}<0,
\qquad \frac{d\ln\mu_0}{d\ln B}=-5.
\]

Limits are \(\mu_0\to+\infty\) as \(B\to0^+\), and \(\mu_0\to0\) as \(B\to+\infty\). No topology is encoded in this scalar formula, so the claimed fifth-power/topological origin is **untested and unresolved** by the equation itself.

Using NIST's 2022 CODATA value

\[
\mu_C=1836.152673426,\qquad u(\mu_C)=0.000000032,
\]

the literal archived inputs give:

| archived variant | recomputed value | residual | ppm | standard uncertainties |
|---|---:|---:|---:|---:|
| V1, \(B=3/(4\pi)\) | 1934.346649506964 | +98.193976080964 | +53478.110781 | +3.06856e9 |
| V2, \(B_s=0.24177\) | 1815.846806586171 | -20.305866839829 | -11058.920717 | -6.34558e8 |
| V3, V2\((1+0.005778)\) | 1826.338769434626 | -9.813903991374 | -5344.819161 | -3.06684e8 |

Therefore the three printed approximations `1944.16`, `1825.04`, and `1836.152` are definite arithmetic/numerical errors for their displayed formulas and parameters. The uniquely justified correction is to replace those numerical evaluations by the recomputed values above; the formulas themselves are not uniquely repairable from this source.

Inverse fitting makes the prediction/fit distinction explicit:

\[
B_{\rm fit}=\left(\frac{3}{2\mu_C}\right)^{1/5}
=0.24123287565696146,
\]

while holding \(B_s=0.24177\) requires

\[
E_{\rm fit}=\frac{\mu_C}{3/(2B_s^5)}-1
=0.01118258807195562.
\]

Both are tuned to CODATA and are not predictions. Because none of the literal archived variants passes even the basic numerical test, this packet does **not** enter them into an active CODATA verification program. Exact discriminators for a future pass are: (1) a source-derived, pre-target definition of \(B_s\); (2) a derivation of the exponent 5; (3) resolution of the gear-formula exponent conflict; and (4) an independently fixed elasticity \(E\) with uncertainty.

## Random substantial reading

A seeded draw (`seed=181`) from 14 substantial GitHub-search candidates selected `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CLAUDIOCY.txt`. The complete file was read (lines 1–400 returned all content; later ranges were empty), blob `e5ffc5a4525164c5ba2d118bc47aad52d1867d1e`. Honest takeaway: it contains a useful internal critique of exponent/multiplier selection after seeing targets, then a topology discussion that corrects pairwise Gauss linking as blind to Borromean structure and moves toward higher-order/string-link invariants. It also records a later user correction that globally reconnecting helices cannot be assessed by illegally isolating strand pairs. This supports the present audit's refusal to infer topology from a fitted scalar power. It is a conversation record, not authority or proof.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Reproduce and audit the archived SAT proton/electron mass-ratio chain.

Status: historical-source reconstruction plus numerical audit. This script
does not claim that the formulas are established physics.
"""
from decimal import Decimal, getcontext
getcontext().prec = 60

PI = Decimal("3.14159265358979323846264338327950288419716939937510582097494")
MU = Decimal("1836.152673426")
U_MU = Decimal("0.000000032")
B = Decimal(3)/(Decimal(4)*PI)
B_STATED = Decimal("0.24177")
E_STATED = Decimal("0.005778")

def mu0(x): return Decimal(3)/(Decimal(2)*x**5)
def ppm(x): return (x-MU)/MU*Decimal(1_000_000)
def sigma(x): return (x-MU)/U_MU

def fifth_root(x):
    y=Decimal(str(float(x)**0.2))
    for _ in range(30): y=(Decimal(4)*y+x/y**4)/Decimal(5)
    return y

def main():
    bare=mu0(B)
    ren=mu0(B_STATED)
    closed=ren*(Decimal(1)+E_STATED)
    bfit=fifth_root(Decimal(3)/(Decimal(2)*MU))
    efit=MU/ren-Decimal(1)
    print(f"CODATA2022 mu={MU} u={U_MU} dimensionless")
    print(f"B=3/(4*pi)={B}")
    print(f"bare={bare} residual={bare-MU} ppm={ppm(bare)} sigma={sigma(bare)}")
    print(f"B_stated={B_STATED} renormalized={ren} residual={ren-MU} ppm={ppm(ren)} sigma={sigma(ren)}")
    print(f"E_stated={E_STATED} closed={closed} residual={closed-MU} ppm={ppm(closed)} sigma={sigma(closed)}")
    print(f"inverse_fit_B={bfit} delta_from_B_stated={bfit-B_STATED}")
    print(f"inverse_fit_E_at_B_stated={efit} delta_from_E_stated={efit-E_STATED}")
    print("elasticity dlnmu/dlnB=-5 sign_dmu_dB=negative")
    print("limits B->0+: +infinity; B->+infinity: 0; topology_test=not_encoded")
    assert B > 0 and bare > 0 and ren > 0 and closed > 0
    assert abs(mu0(bfit)-MU) < Decimal("1e-48")
    assert abs(ren*(1+efit)-MU) < Decimal("1e-48")
    print("ALL_INTERNAL_CHECKS_PASSED")
    print("CODATA_GATE=FAIL_FOR_ALL_STATED_NUMERIC_VARIANTS")

if __name__ == '__main__': main()
```

## Executed output

```text
CODATA2022 mu=1836.152673426 u=3.2E-8 dimensionless
B=3/(4*pi)=0.238732414637843003653325645058771543051689468610684673121501
bare=1934.34664950696424778424136718813617923350570115523944646159 residual=98.19397608096424778424136718813617923350570115523944646159 ppm=53478.1107813590687136626813145814465687919432160062425547395 sigma=3068561752.53013274325754272462925560104705316110123270192469
B_stated=0.24177 renormalized=1815.84680658617078081203051591301860584464093730659348569302 residual=-20.30586683982921918796948408698139415535906269340651430698 ppm=-11058.9207170563637343589636983005255902721106633983018275803 sigma=-634558338.744663099624046377718168567354970709168953572093125
E_stated=0.005778 closed=1826.33876943462567558356242823396402734921127264235098285335 residual=-9.81390399137432441643757176603597265078872735764901714665 ppm=-5344.81916095951540401608979054930602713270291881141721554237 sigma=-306684499.730447638013674117688624145337147729926531785832812
inverse_fit_B=0.241232875656961457591219477406243410315740074034965899441542 delta_from_B_stated=-0.000537124343038542408780522593756589684259925965034100558458
inverse_fit_E_at_B_stated=0.01118258807195562113202404077765880000000000000000000000000 delta_from_E_stated=0.00540458807195562113202404077765880000000000000000000000000
elasticity dlnmu/dlnB=-5 sign_dmu_dB=negative
limits B->0+: +infinity; B->+infinity: 0; topology_test=not_encoded
ALL_INTERNAL_CHECKS_PASSED
CODATA_GATE=FAIL_FOR_ALL_STATED_NUMERIC_VARIANTS
```

Python SHA-256: `11284f9b69b4de2f947d2d7d6afbb82bc8f522319b615d484a20529886ae08eb`.

No Lean proof is claimed: the decimal/CODATA audit was executed in Python, while the monotonicity and limits are elementary analytic checks shown above. No BEDROCK or theory-state file was modified.
