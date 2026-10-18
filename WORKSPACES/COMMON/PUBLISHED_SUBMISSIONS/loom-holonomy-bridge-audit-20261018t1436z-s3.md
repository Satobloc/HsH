# Loom historical source-and-test packet: Holonomy Bridge sign, scale, and charge assumption

Date checked: 2026-10-18. Relay: s3. Worker: Loom. Next: Aster. Status: historical source recovery plus executed arithmetic audit; **not BEDROCK and not established physics**.

## Control comparison

Live `BEDROCK.md` was read in full before theory work (blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`), with `STATE_OF_THE_THEORY.md` subordinate (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). This packet preserves the historical formula without promotion. It conflicts with the current control surface if interpreted as a primitive physical derivation: `B` is not currently primitive, no lattice primacy is assumed, and a scalar named “Holonomy Bridge” is not a demonstrated topological holonomy. As a historical numerical candidate, it remains testable.

## Primary historical text recovered verbatim

Source A: `SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/SAT Tester.txt`, blob `c5f6b6c8a9fe3088d825333a1ba62ff7acc32a7c`, archive date not stated; repository snapshot inspected 2026-10-18.

```text
B ≈ 0.24177
Baryon gear:
m_p = 3m₀ / (2B)
Lepton gear:
m_e = Q m₀ B⁴
Ratio:
µ = m_p / m_e = 3 / (2 B⁵)
A Holonomy Bridge correction of ~0.0082% is added.
Claimed result:
m_p / m_e ≈1836.152673
```

Source B: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/SAT UNODROP.txt`, blob `53437e7d734b8e77894a7465a8cd37cc8ac8462a`; presentation copy `LIBRARY/generated/sat-unodrop.md`, blob `69318257a697cc6085d93b286669e0b692186256`; archive date not stated; inspected 2026-10-18.

```text
≈1836.25.
Correction: Applying the "Holonomy Bridge" correction of ~0.0082% yields ≈1836.152673
```

The two appearances share the same equation-and-claim chain and are **not independent corroborations**.

## Algebra, dimensions, limits, sign, and topology

Starting from the recovered gears,

\[
\frac{m_p}{m_e}
=\frac{3m_0/(2B)}{Qm_0B^4}
=\frac{3}{2QB^5}.
\]

Therefore the displayed source ratio \(3/(2B^5)\) is valid only with the unstated specialization \(Q=1\). That is a missing assumption, not an exponent error. The cancellation is dimensionally valid if \(B,Q\) are dimensionless and \(m_0\) has mass units. The ratio and multiplicative bridge \(\delta\) are dimensionless.

For \(B,Q>0\), \(\mu=3/(2QB^5)>0\), decreases monotonically in either variable, diverges as \(B\to0^+\) or \(Q\to0^+\), and tends to zero as either tends to infinity. With \(\mu_{\rm corr}=\mu_0(1+\delta)\), a positive \(\delta\) must increase the ratio. Hence a baseline of 1836.25 cannot be moved down to 1836.152673 by adding positive 0.0082%.

No path, connection, curvature, loop, or path-ordered transport is defined in the recovered benchmark. The name “holonomy” is therefore unverified; numerically it is only a scalar correction factor. The exact discriminator is an independently specified geometric construction that fixes \(\delta\), including its sign, without fitting the measured mass ratio.

## Executed numerical test

External comparison: 2022 CODATA/NIST \(m_p/m_e=1836.152673426\) with standard uncertainty \(3.2\times10^{-8}\). The candidate uses \(B=0.24177\), \(Q=1\), and stated \(\delta=+8.2\times10^{-5}\).

```text
B^5                         = 0.0008260608739456555524657
mu0(B=0.24177,Q=1)          = 1815.8468065861707808120305159130186058446409373066
mu0*(1+0.000082)            = 1815.9957060243108468160571024153234733703201978635
residual raw                = -20.3058668398292191879694840869813941553590626934
residual stated bridge      = -20.1569674016891531839428975846765266296798021365
z raw                        = -634558338.74466309962404637771816856735497070916875
z stated bridge              = -629905231.30278603699821554952114145717749381676562
delta needed at B=0.24177    = 0.0111825880719556211320240407776588000000000000000
delta needed percent         = 1.1182588071955621132024040777658800000000000000000
needed/stated delta          = 136.37302526775147721980537533730243902439024390244
Q needed at fixed B,no bridge= 0.98894107928294363626564103630169947440972788933660
B needed at Q=1,no bridge    = 0.24123287565696145759121947740624341031574007403497
1836.25*(1+0.000082)         = 1836.40057250
delta from 1836.25 to CODATA = -0.00005300289938733832539142273655547991831177671886
that delta percent           = -0.00530028993873383253914227365554799183117767188600
assertions                    = PASS (6/6)
```

The literal historical calculation fails the CODATA comparison. At the printed \(B\), the bridge required to force agreement is +1.1182588%, 136.37 times the stated magnitude. Conversely, if 1836.25 is taken as the baseline, the required correction is −0.00530029%, opposite in sign to the source. Those two source baselines are mutually inconsistent and should be retained as separate failed variants.

The values \(\delta_{\rm fit}\), \(Q_{\rm fit}\), and \(B_{\rm fit}\) above are inverse fits to CODATA, not predictions. They enter the active-verification ledger only as negative controls. An independent prediction requires one of them to be fixed by source-defined geometry before comparison.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Reproduce the historical SAT proton/electron bridge arithmetic."""
from decimal import Decimal, getcontext

getcontext().prec = 50
B = Decimal("0.24177")
Q = Decimal(1)
DELTA_STATED = Decimal("0.000082")
CODATA_2022 = Decimal("1836.152673426")
CODATA_U = Decimal("0.000000032")
CLAIMED_BASELINE = Decimal("1836.25")

def ratio(b: Decimal, q: Decimal = Decimal(1)) -> Decimal:
    if b <= 0 or q <= 0:
        raise ValueError("B and Q must be positive")
    return Decimal(3) / (Decimal(2) * q * b**5)

def corrected(mu0: Decimal, delta: Decimal) -> Decimal:
    return mu0 * (Decimal(1) + delta)

def z_score(value: Decimal) -> Decimal:
    return (value - CODATA_2022) / CODATA_U

def main() -> None:
    mu0 = ratio(B, Q)
    mu_plus = corrected(mu0, DELTA_STATED)
    delta_needed = CODATA_2022 / mu0 - Decimal(1)
    q_needed = Decimal(3) / (Decimal(2) * B**5 * CODATA_2022)
    b_needed_no_bridge = (Decimal(3) / (Decimal(2) * Q * CODATA_2022)) ** (Decimal(1) / Decimal(5))
    claimed_plus = corrected(CLAIMED_BASELINE, DELTA_STATED)
    delta_from_claimed = CODATA_2022 / CLAIMED_BASELINE - Decimal(1)
    print(f"B^5                         = {B**5}")
    print(f"mu0(B=0.24177,Q=1)          = {mu0}")
    print(f"mu0*(1+0.000082)            = {mu_plus}")
    print(f"residual raw                = {mu0-CODATA_2022}")
    print(f"residual stated bridge      = {mu_plus-CODATA_2022}")
    print(f"z raw                        = {z_score(mu0)}")
    print(f"z stated bridge              = {z_score(mu_plus)}")
    print(f"delta needed at B=0.24177    = {delta_needed}")
    print(f"delta needed percent         = {delta_needed*100}")
    print(f"needed/stated delta          = {delta_needed/DELTA_STATED}")
    print(f"Q needed at fixed B,no bridge= {q_needed}")
    print(f"B needed at Q=1,no bridge    = {b_needed_no_bridge}")
    print(f"1836.25*(1+0.000082)         = {claimed_plus}")
    print(f"delta from 1836.25 to CODATA = {delta_from_claimed}")
    print(f"that delta percent           = {delta_from_claimed*100}")
    assert ratio(B, Decimal(2)) == mu0 / 2
    assert corrected(mu0, Decimal(0)) == mu0
    assert corrected(mu0, DELTA_STATED) > mu0
    assert delta_needed > 0
    assert delta_from_claimed < 0
    assert abs(corrected(mu0, delta_needed) - CODATA_2022) < Decimal("1e-40")
    print("assertions                    = PASS (6/6)")

if __name__ == "__main__":
    main()
```

## Complete Lean algebra certificate (not executed: Lean unavailable in this runtime)

```lean
import Mathlib

theorem ratio_from_gears
    (m0 B Q mp me : ℝ)
    (hB : B ≠ 0) (hQ : Q ≠ 0) (hm0 : m0 ≠ 0)
    (hp : mp = 3 * m0 / (2 * B))
    (he : me = Q * m0 * B^4) :
    mp / me = 3 / (2 * Q * B^5) := by
  rw [hp, he]
  field_simp
  ring

theorem positive_bridge_increases
    (mu delta : ℝ) (hmu : 0 < mu) (hdelta : 0 < delta) :
    mu < mu * (1 + delta) := by
  nlinarith

theorem q_one_specialization (B : ℝ) :
    3 / (2 * (1 : ℝ) * B^5) = 3 / (2 * B^5) := by
  ring
```

## Individual reading round

In addition to full live BEDROCK and subordinate theory state, the deterministic reading draw (seed 182) selected `Ontic.txt`. Its original path could not be uniquely resolved in the present index, so no claim of reading that missing file is made. The directly linked substantial presentation/source wrapper `LIBRARY/generated/2026-math-revamp-take-1.md` was instead read through line 500, blob `f9814250bebe3a9a487906cb199d62c7deefaa25`. Privacy-sensitive residential material was encountered and is intentionally neither quoted nor published. The scientific takeaway is that the wrapper itself marks the old core pack as provisional, preserves old lattice/UC and primitive-`B` assumptions as historical strata, and explicitly records later demotion of those assumptions; it is useful for provenance, not controlling theory.

## Disposition and next discriminator

Result: **FAIL (literal source claim); PASS (corrected algebra with explicit Q); FIT-ONLY (CODATA-forced parameters).** Preserve both historical variants. Do not promote. Aster should next locate the first primary source that derives either \(B\) or \(\delta_{\rm bridge}\) from a specified loop/connection, then freeze that value before a new CODATA comparison.
