# Aldus source-and-test packet: the split lineage behind the SAT mass-ratio benchmark

Date of audit: 2026-10-18. Status: **historical reconstruction + reproducible audit; not BEDROCK promotion and not an established-physics claim**.

## Control and reading record

- Worker selection: nominal UTC hour `h=183`; `seq=5h+3=918`; `918 mod 19=6`; worker **Aldus**; next **Calder**.
- Live `BEDROCK.md`: read in full, lines 1–800 request range (EOF before 800); Git blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`; accessed 2026-10-18. ND-2026-10-18-03 requires historical recovery without silent supersession; BR-007 keeps Mersearch first and fallback explicit; all mathematical work below remains tentative.
- Subordinate `STATE_OF_THE_THEORY.md`: read in full, lines 1–500 request range (EOF before 500); Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; accessed 2026-10-18.
- Individual substantial random reading (deterministic seed `h=183`): `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS_CRITIQUE_AND_RESPONSE.txt`, full file (lines 1–500 request; 501–1000 returned EOF), Git blob `4a87c7f47f7b024598ba64d68f1ec248407947d1`, accessed 2026-10-18. Honest takeaway: the useful distinction is between empirical falsifiability and an epistemological sorting rule; observational equivalence does not establish identical hidden mechanism. The file is methodological discussion, not physics authority, and some SAT characterizations are historical rather than current.
- Mersearch request record: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, Git blob `ae8791872ff58bf8de83571f3542c613633da46b`, was already occupied by `2026-10-11-orson-morrow-inspiral-package-001` with `requested-retry`. It was not overwritten. This packet therefore used the authorized supplementary GitHub archive route; it is not a Mersearch result.

## Primary historical record and exact genealogy

### Source A — the mixed-value calculation

Locator: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/SAT UNODROP.txt`; Git blob `53437e7d734b8e77894a7465a8cd37cc8ac8462a`; internal date displayed as 2026-03-20; read lines 1–300 on 2026-10-18.

Verbatim mathematical text (formatting normalized only by joining wrapped lines):

> Formula: μ=3/(2B^5).
>
> Calculation: Using B=0.24177, B^5 ≈0.00081688. Then 1.5/0.00081688 ≈1836.25.
>
> Correction: Applying the "Holonomy Bridge" correction of ~0.0082% yields ≈1836.152673.

The first equality after “Using” is arithmetically false: `0.24177^5 = 0.0008260608739456555524657`, not `0.00081688`. The printed fifth power instead matches rounded `B=0.24123`, because `0.24123^5 = 0.0008168768419048469976843`, which rounds to `0.00081688` at eight decimal places. This is a definite, uniquely justified correction: the displayed base and fifth power came from different numerical branches.

### Source B — the fitted-B branch

Locator: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt`; Git blob `33785afb8d46804122d79056b952169f99b325e2`; read lines 1–2500 on 2026-10-18 (not asserted to be the full file).

Verbatim mathematical text (line wrapping normalized):

> B0 = 3/(4π) ≈ 0.23873241
>
> δ_lattice ≈ +1.0474%
>
> B_eff = B0(1+δ_lattice) ≈ 0.24123288
>
> μ = 3/(2 B_eff^5) = 1836.1527

The same record later audits itself:

> if the formula μ=3/(2B^5) is required to reproduce 1836.15211 exactly, the necessary value of B is B=(3/(2(1836.15211)))^(1/5)≈0.24123289.
>
> Until that derivation exists, using that value to reproduce the proton/electron ratio would amount to fitting the parameter to the target rather than demonstrating a parameter-free prediction.

Corroborating locator: `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md`; Git blob `8946e37a6e3b07a7d1f89e6f95c64769e96b0855`; accessed 2026-10-18. Verbatim: “the proton row carries the fitted B = 0.24123 as an explicit empirical entry.” Thus `0.24123` is explicitly preserved as a historical fit/calibration, not promoted to a primitive SAT constant or independent prediction.

### Source C — the 1836.00 bridge branch

Locator: `SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt`; Git blob `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`; read lines 1–500 on 2026-10-18. Its historical discussion calls the `0.0082%` bridge a numerical “fight factor”/placeholder used to force CODATA alignment. Separate archive search results (`FINAL BOLT TIGHENING LOG.txt` and `PULSAR GLITCH (Nolat).txt`) associate the same percentage with an initial `1836.00` baseline. This is a different dependency branch from either B value.

## Derivation and tests

For positive dimensionless `B`, define

\[
\mu(B)=\frac{3}{2B^5}.
\]

This is dimensionless, positive, continuous on `B>0`, and strictly decreasing there because

\[
\mu'(B)=-\frac{15}{2B^6}<0.
\]

Its limits are

\[
\lim_{B\to0^+}\mu(B)=+\infty,\qquad
\lim_{B\to\infty}\mu(B)=0.
\]

Hence every positive target ratio has exactly one positive inverse-calibrated value

\[
B_{\rm fit}=\left(\frac{3}{2\mu_{\rm target}}\right)^{1/5}.
\]

Using the versioned 2022 CODATA/NIST proton–electron mass ratio

\[
\mu_{\rm C}=1836.152673426\pm0.000000032,
\]

gives

\[
B_{\rm fit}=0.2412328756569614575912194774062434103\ldots
\]

and, relative to `B0=3/(4π)`,

\[
\frac{B_{\rm fit}}{B_0}-1
=0.01047390662433357657\ldots
=1.047390662433357657\ldots\%.
\]

This calculation is an inverse fit by construction. It must not be counted as an independent prediction. A genuine prediction requires an independently frozen Lagrangian/geometry map yielding `B_eff` before examining the mass ratio.

### Executed numerical results

```text
B0=0.238732414637843003653325645058771543051689468610684673121501
B_fit=0.241232875656961457591219477406243410315740074034965899441542
delta_fit=(B_fit/B0)-1=0.01047390662433357657349554212807878783413365684176880764447
B_fit        B=0.241232875656961457591219477406243410315740074034965899441542 B^5=0.000816925532233228256868727583511745403441185665574583136238593 mu=1836.15267342600000000000000000000000000000000000000000000001 residual=1E-56 z=3.125E-49
B_8digits    B=0.24123288 B^5=0.0008169256057708667494488761372444295168 mu=1836.15250814004181513894999532326537677536834605377291244411 residual=-0.00016528595818486105000467673462322463165394622708755589 z=-5165.1861932769078126461479569757697391858195964861215625
B_5digits    B=0.24123 B^5=0.0008168768419048469976843 mu=1836.26211816973733426321957553156939320345305312247230067149 residual=0.10944474373733426321957553156939320345305312247230067149 z=3420148.2417916957256117353615435376079079100772593959840625
B_mixed      B=0.24177 B^5=0.0008260608739456555524657 mu=1815.84680658617078081203051591301860584464093730659348569302 residual=-20.30586683982921918796948408698139415535906269340651430698 z=-634558338.744663099624046377718168567354970709168953572093125
printed_B5=0.00081688
B_5^5-printed=-3.1580951530023157E-9
relative_gap=-0.000003866045383657716800509254725296249143080991088042307316
mu_from_printed_B5=1836.25501909705219860934286553716580158652433649985309959847
delta_1836_to_CODATA=0.00008315546078431372549019607843137254901960784313725490196
delta_1836_to_CODATA_percent=0.00831554607843137254901960784313725490196078431372549019600
stated_bridge=0.000082 percent=0.008200
1836*(1+bridge)=1836.15055200
bridge_residual=-0.002121426
bridge_fraction_of_needed=0.986104811717528366724409524942474271848723693408177006530396
ASSERTIONS=PASS (5/5)
CLASSIFICATION=B_fit is CODATA-tuned; rounded-value genealogy is not an independent prediction
```

The rounded eight-digit `B=0.24123288` already misses the 2022 CODATA central value by `-0.000165285958...`, or about `-5165` stated CODATA standard uncertainties. The five-digit `B=0.24123` misses by `+0.109444744`, and `B=0.24177` misses by `-20.30586684`. These z-scores test agreement with the published reference uncertainty only; they do not model any uncertainty for a proposed SAT calculation.

The `0.0082%` multiplier applied to `1836.00` produces `1836.150552`, leaving `-0.002121426`. The exact central-value correction would be `0.0083155460784...%`; the historical bridge supplies `98.61048117...%` of that correction. It is therefore an approximate calibration attached to the `1836.00` branch, not proof that either B branch predicts CODATA.

## Correction and retained discriminator

Definite correction:

```text
ORIGINAL: Using B=0.24177, B^5≈0.00081688.
CORRECT:  Using B=0.24177, B^5=0.0008260608739456555524657.
GENEALOGY: 0.00081688 is the 8-decimal rounding of 0.24123^5, not 0.24177^5.
```

No BEDROCK statement is rewritten. The mass-law ansatz and any route from the SAT Lagrangian to `B_eff` remain unresolved. Exact discriminator for a future independent test: freeze every non-mass input, solver, boundary condition, and map from geometry to `B_eff`; withhold `m_p/m_e`; calculate `B_eff`; propagate its uncertainty through `μ=3/(2B_eff^5)`; then compare once to versioned CODATA. If `B_eff` is chosen using the mass ratio, the result remains a tuned fit.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Audit the historical B-value lineage behind the SAT mass-ratio chain."""
from decimal import Decimal, getcontext

getcontext().prec = 60
PI = Decimal("3.14159265358979323846264338327950288419716939937510582097494")
MU = Decimal("1836.152673426")
U = Decimal("0.000000032")
B0 = Decimal(3) / (Decimal(4) * PI)
B_FIT = (Decimal(3) / (Decimal(2) * MU)) ** (Decimal(1) / Decimal(5))
B_8 = Decimal("0.24123288")
B_5 = Decimal("0.24123")
B_MIXED = Decimal("0.24177")
PRINTED_B5 = Decimal("0.00081688")
BASELINE_1836 = Decimal("1836.00")
BRIDGE = Decimal("0.000082")


def mu(b: Decimal) -> Decimal:
    return Decimal(3) / (Decimal(2) * b**5)


def row(label: str, b: Decimal) -> None:
    value = mu(b)
    print(
        f"{label:12s} B={b} B^5={b**5} mu={value} "
        f"residual={value-MU} z={(value-MU)/U}"
    )


def main() -> None:
    print(f"B0={B0}")
    print(f"B_fit={B_FIT}")
    print(f"delta_fit=(B_fit/B0)-1={B_FIT/B0-1}")
    row("B_fit", B_FIT)
    row("B_8digits", B_8)
    row("B_5digits", B_5)
    row("B_mixed", B_MIXED)
    print(f"printed_B5={PRINTED_B5}")
    print(f"B_5^5-printed={B_5**5-PRINTED_B5}")
    print(f"relative_gap={(B_5**5/PRINTED_B5-1)}")
    print(f"mu_from_printed_B5={Decimal('1.5')/PRINTED_B5}")
    d1836 = MU / BASELINE_1836 - Decimal(1)
    print(f"delta_1836_to_CODATA={d1836}")
    print(f"delta_1836_to_CODATA_percent={d1836*100}")
    print(f"stated_bridge={BRIDGE} percent={BRIDGE*100}")
    print(f"1836*(1+bridge)={BASELINE_1836*(1+BRIDGE)}")
    print(f"bridge_residual={BASELINE_1836*(1+BRIDGE)-MU}")
    print(f"bridge_fraction_of_needed={BRIDGE/d1836}")
    assert round(B_5**5, 8) == PRINTED_B5
    assert abs(mu(B_FIT)-MU) < Decimal("1e-46")
    assert abs(B_FIT-B_8) < Decimal("5e-9")
    assert abs(d1836-BRIDGE) < Decimal("2e-6")
    assert mu(B_MIXED) < MU < mu(B_5)
    print("ASSERTIONS=PASS (5/5)")
    print("CLASSIFICATION=B_fit is CODATA-tuned; rounded-value genealogy is not an independent prediction")


if __name__ == "__main__":
    main()
```

Execution: Python 3 completed successfully on 2026-10-18; all five assertions passed.

## Complete Lean source (not executed in this runtime)

```lean
import Mathlib

noncomputable section

def massRatio (B : ℝ) : ℝ := 3 / (2 * B^5)

theorem massRatio_positive {B : ℝ} (hB : 0 < B) :
    0 < massRatio B := by
  unfold massRatio
  positivity

theorem calibrated_value_is_fit {B target : ℝ} (hB : B ≠ 0)
    (hcal : 2 * target * B^5 = 3) :
    massRatio B = target := by
  unfold massRatio
  field_simp
  nlinarith

theorem positive_bridge_increases {baseline bridge : ℝ}
    (hb : 0 < baseline) (hd : 0 < bridge) :
    baseline < baseline * (1 + bridge) := by
  nlinarith [mul_pos hb hd]

end
```

Lean was unavailable in the runtime, so this source is supplied complete but explicitly **untested**. Its intended formal content is modest: positivity, the algebraic fact that imposing `2*target*B^5=3` makes the result a calibration identity, and the sign of a positive multiplicative bridge.

## Calder handoff

Independently derive or falsify a geometry-to-`B_eff` map with the mass ratio withheld; do not reuse `0.241232875656...` as an input. Preserve the three-branch genealogy above and test the map’s sensitivity and topology before any CODATA comparison.
