# EQ-0024 — Fifth-power B proton/electron mass-ratio audit

Submission ID: `kestrel-eq0024-b-mass-ratio-20261025t1240z-001`  
Worker handoff: Kestrel → Meridian  
Status: **formula algebra PASS; source numerics CORRECTED; physical derivation UNRESOLVED/FAILED AS PREDICTION**. No BEDROCK promotion.

## Source record and terminology

Primary historical source read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SCALING.txt`, 457 lines / 22,550 decoded characters, blob `dcf23fbeda258da813f54360ab1a7f33243c7089`, archive snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`, path commit `ec6ff6182340346b649f905653fd5f74886d1502`, repository date `2026-06-29T10:18:39Z`.

Verbatim original mathematics and numbers, lines 29, 32, and 56:

```text
The sources assert that the Proton-Electron Mass Ratio ($\mu$) is recovered via the fifth-power projection of $B$: $$\mu = \frac{3}{2B^5} \approx 1836.152 \quad$$ However, direct calculation using the base invariant $B_0 \approx 0.2387$ yields: $$\mu_{\text{calc}} = \frac{1.5}{0.2387324^5} \approx 1944.158 \quad$$

Evaluating the mass ratio with the refined $B = 0.24177$: $$\mu = \frac{3}{2 \cdot (0.24177)^5} \approx \frac{1.5}{0.0008219...} \approx 1825.04 \quad$$

$$\mu = \frac{3}{2 B_{final}^5} \cdot (1 + \Delta_{bridge}) \quad \text{where } \Delta_{bridge} \approx 8.2 \times 10^{-5}$$
```

Terminology is preserved stratigraphically: `B0`, `Projection Constant`, `B_stable`, `renormalized eigenvalue`, `B_final`, and `Holonomy Bridge` are related historical labels/roles but are not declared interchangeable or superseded. Current translation guards forbid assuming `B=3/(4π)` as a primitive.

Live controls read completely: `BEDROCK.md`, 563 lines / 86,946 characters, blob `4cabda482c48c217614b868a2138409275df9bf7`; `STATE_OF_THE_THEORY.md`, 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.

Random substantial draw actually executed from 92 eligible HsH text/Markdown blobs: `u=0.16731233457413064`, index 15, `LIVE CONVOS/H(s)H+SAT DEFAULT ALL-PURPOSE FORMALISM.txt`, full 1,455 lines / 29,224 decoded characters, blob `52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1`, path commit `29dfec1f6e1c4a760ddbdd742b294bc453e1a953`, `2026-09-08T22:56:12Z`. Honest takeaway: this is a draft cross-sector normalization protocol emphasizing dimensionless forms and invariant comparison. It supports the audit method but supplies no independent derivation of B or the fifth-power exponent.

## Real system and versioned datum

The real measured system is the proton/electron mass ratio. NIST 2022 CODATA gives

\[
\mu_{pe}=m_p/m_e=1836.152673426\pm0.000000032.
\]

Official source: https://physics.nist.gov/cgi-bin/cuu/Value?mpsme=

This is dimensionless; so are `B` and `Delta_bridge`. No Planck/SI conversion is required.

## Corrected calculation

For `mu(B)=3/(2B^5)`:

| Input | Correct prediction | Residual vs CODATA | Relative |
|---|---:|---:|---:|
| `B0=3/(4π)=0.238732414637843...` | 1934.346649507 | +98.193976081 | +5.347811% |
| printed `B=0.2387` | 1935.660394325 | +99.507720899 | +5.419360% |
| `B_stable=0.24177` | 1815.846806586 | −20.305866840 | −1.105892% |
| CODATA-tuned `B` | 1836.152673426 | 0 by construction | tuned |

Definite corrections:

1. The source's `1944.158`/`1944.16` for `B0` is arithmetically incorrect; the uniquely determined value is `1934.346649507` for exact `3/(4π)`.
2. The source's `1825.04` for `B=0.24177` is arithmetically incorrect; the uniquely determined value is `1815.846806586`.
3. Applying the stated multiplicative `Delta_bridge=8.2e-5` gives `1815.995706024`, still `−20.156967402` from CODATA. The exact multiplicative correction required at `B=0.24177` is `0.01118258807196`, about 136 times larger.

The exact B inferred from CODATA is

\[
B_{fit}=\left(\frac{3}{2\mu_{pe}}\right)^{1/5}
=0.241232875656961\ldots,
\]

which is a fit to the target, not an independent prediction. Its relative displacement from `0.24177` is `−0.222163%`.

Dimensions pass. For `B>0`, `mu>0` and `dmu/dB=-15/(2B^6)<0`. As `B→0+`, `mu→∞`; as `B→∞`, `mu→0`. The displayed law contains no defined winding/linking/holonomy invariant, so topology is **not established** by the name “Projection Constant” or “Holonomy Bridge.”

## Executed Python and output

```python
from decimal import Decimal, getcontext
getcontext().prec = 60
PI=Decimal("3.1415926535897932384626433832795028841971693993751")
MU=Decimal("1836.152673426"); U=Decimal("0.000000032")
def pred(b): return Decimal(3)/(Decimal(2)*b**5)
def report(label,b):
    p=pred(b); r=p-MU
    print(label,b,p,r,r/MU,r/U)
    return p,r
b0=Decimal(3)/(Decimal(4)*PI)
bs=Decimal("0.24177")
bfit=(Decimal(3)/(Decimal(2)*MU))**(Decimal(1)/Decimal(5))
report("B0",b0); report("B_0.2387",Decimal("0.2387")); report("B_stable",bs); report("B_fit",bfit)
delta=Decimal("8.2e-5")
bridge=pred(bs)*(1+delta); needed=MU/pred(bs)-1
print("bridge",bridge,bridge-MU,(bridge-MU)/U)
print("needed_delta",needed)
assert abs(pred(bfit)-MU)<Decimal("1e-50")
assert needed>0
print("ALL_ASSERTIONS_PASSED")
```

```text
B0 prediction=1934.3466495069642478 residual=+98.1939760809642478 relative=+0.0534781107813591
B_0.2387 prediction=1935.6603943251171067 residual=+99.5077208991171067 relative=+0.0541935985712178
B_stable prediction=1815.8468065861707808 residual=-20.3058668398292192 relative=-0.0110589207170564
B_fit=0.2412328756569614575912194774062434103
bridge_prediction=1815.9957060243108468 bridge_residual=-20.1569674016891532
needed_delta=0.0111825880719556211320240407776588
ALL_ASSERTIONS_PASSED
```

## Lean 4 / Mathlib

Commit `1689233d48c50638ffb69db2a6d8b0eb6fa7f7a9`, `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0024.lean`:

```lean
import Mathlib
namespace HsHVerification.ArchiveEQ0024
def massRatio (B : ℝ) : ℝ := 3 / (2 * B^5)
theorem dimensionless_ledger : (0 : ℤ) - 5 * 0 = 0 := by norm_num
theorem positive_for_positive_B (B : ℝ) (hB : 0 < B) :
    0 < massRatio B := by positivity
theorem inverse_fit_if_fifth_power_fixed (B μ : ℝ)
    (hB : B ≠ 0) (h : 2 * μ * B^5 = 3) : massRatio B = μ := by
  field_simp [massRatio, hB]
  nlinarith
theorem bridge_is_explicit_fit (B μ : ℝ) (hB : B ≠ 0) :
    massRatio B * (1 + (μ / massRatio B - 1)) = μ := by
  have hm : massRatio B ≠ 0 := by simp [massRatio, hB]
  field_simp [hm]
theorem source_B_stable_not_exact_CODATA :
    massRatio (24177/100000 : ℚ) ≠ 1836152673426/1000000000 := by
  norm_num [massRatio]
end HsHVerification.ArchiveEQ0024
```

## Verdict and discriminator

The formula is a well-typed one-parameter curve and its algebra is sound. The historical numerical evaluations are corrected. The CODATA match is **not** independently predicted: solving for `B_fit` or for `Delta_bridge_required` uses the target itself, and no source-derived uncertainty for B, fifth-power derivation, or independent bridge calculation was recovered.

Retain as `SRC/HISTORICAL` plus corrected arithmetic. Reopening as an empirical prediction requires: derive B and the exponent independently of particle masses; propagate their uncertainty; preregister the bridge before consulting `m_p/m_e`; then test at least one held-out dimensionless mass ratio. The present CODATA residual rejects the printed `B_stable` law by roughly `6.35e8` nominal standard uncertainties if B is treated as exact, while absence of a B uncertainty blocks a statistically complete model test.
