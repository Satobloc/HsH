# Alberr packet: archived B^5 proton/electron mass-ratio audit

Status: **SRC/HISTORICAL -> tested FAIL / retain unresolved**. No BEDROCK promotion and no established-physics claim.

## Controls and retrieval

The live `BEDROCK.md` was read in full (441 lines / 62,982 characters; blob `54b893a1b10206f088f54dae961cc03d37012bac`) and `STATE_OF_THE_THEORY.md` was read in full (155 lines / 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`). Alberr's README and inbox were read in full, together with both 2026-10-17 reach checkpoints. Alberr's current autonomy/self-reconstruction controls were preserved; the chosen work follows his demonstrated exact-geometry and counterexample style without treating him as historical Einstein.

Mersearch was checked first. Its live request surface was occupied by Ravel request `2026-10-11-ravel-contact-relaxation-hysteresis-001`, blob `255cfceaf82fb82eb4b39dfc620a8c6fb715ed94`, and was not overwritten. Disclosed fallback: GitHub primary-source search followed by full sequential file retrieval.

The controlling BEDROCK guards directly conflict with importing this archive construction: `B=3/(4*pi)` cannot be assumed primitive; direct mass control by a single angle/charge is barred; lattice, Z3, bridge coefficients, and repeated metrological language do not establish a derivation.

## Historical source and original mathematics

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SCALING.txt`  
Extent read: all 457 lines / 22,550 characters.  
Blob: `dcf23fbeda258da813f54360ab1a7f33243c7089`.  
Path commit: `ec6ff6182340346b649f905653fd5f74886d1502`, 2026-06-29T10:18:39Z.

Verbatim archived equations and numerical claims:

\[
B_0=\frac{3}{4\pi}\approx0.2387324,
\qquad
\mu=\frac{3}{2B^5}\approx1836.152.
\]

The source says direct use of `B0` gives `1944.158`, says `B_stable=0.24177` gives `1825.04`, and later states

\[
\mu=\frac{3}{2B_{stable}^5}(1+\Delta_{bridge}),
\qquad \Delta_{bridge}\approx8.2\times10^{-5},
\]

claiming that this “snaps” the result to `1836.152`.

Terminology tracking without supersession: `Projection Constant`, `renormalized Projection Constant`, `stabilized eigenvalue`, and `Holonomy Bridge` are successive labels in this file for the same target-facing chain. Their historical occurrence is preserved; none is treated as a current primitive.

## Algebra, dimensions, limits, and identifiability

For

\[
\mu(B,\delta)=\frac{3(1+\delta)}{2B^5},
\]

both sides are dimensionless, so the unit test passes. For `B>0` and `delta>-1`, `mu>0`, and

\[
\frac{\partial\mu}{\partial B}=-\frac{5\mu}{B}<0.
\]

The limits are

\[
\lim_{B\to0^+}\mu=+\infty,
\qquad
\lim_{B\to\infty}\mu=0.
\]

One mass-ratio datum identifies only `(1+delta)/B^5`; `B` and `delta` are continuously non-identifiable. Explicitly, any positive `B` can be made exact with

\[
\delta_{fit}=\frac{2\mu_{target}B^5}{3}-1.
\]

This is a fit identity, not a prediction.

## Versioned CODATA verification

Comparator: 2022 CODATA/NIST proton-electron mass ratio

\[
\left(\frac{m_p}{m_e}\right)_{2022}
=1836.152673426\pm0.000000032.
\]

Executed high-precision output:

```text
ARCHIVED PROTON/ELECTRON MASS-RATIO AUDIT
CODATA_2022 = 1836.152673426 +/- 3.2E-8
B0 = 3/(4*pi) = 0.238732414637843003653325645058771543051689468610684673121501
mu(B0) = 1934.34664950696424778424136718813617923350570115523944646159
relative_error_B0_percent = 5.34781107813590687136626813145814465687919432160062425547400
B_stable = 0.24177 (no source uncertainty)
mu(B_stable) = 1815.84680658617078081203051591301860584464093730659348569302
relative_error_Bstable_percent = -1.10589207170563637343589636983005255902721106633983018275800
source_delta = 0.000082
mu(B_stable,source_delta) = 1815.99570602431084681605710241532347337032019786345262635884
delta_needed_at_Bstable = 0.01118258807195562113202404077765880000000000000000000000000
delta_needed/source_delta = 136.373025267751477219805375337302439024390243902439024390244
B_fitted_to_CODATA_no_bridge = 0.241232875656961457591219477406243410315740074034965899441542
B_fitted_uncertainty_from_CODATA_only = 8.40828993443052421696452429888584265284676345000484408768803E-13
dmu/dB_at_Bstable = -37553.1870493893117593586986787653266708988074886585077903177
data_only_z_B0 = 3068561752.53013274325754272462925560104705316110123270192469
data_only_z_Bstable = -634558338.744663099624046377718168567354970709168953572093125
data_only_z_source_bridge = -629905231.30278603699821554952114145717749381676710542628625
dimension_test = PASS (all ratios dimensionless)
sign_test = PASS: B>0 and delta>-1 imply mu>0; dmu/dB<0
limit_B_to_0_plus = +infinity
limit_B_to_infinity = 0
identifiability = FAIL: one datum fixes only (1+delta)/B^5
prediction_status = FIT/CANDIDATE, not independent prediction
plot = alberr_mass_ratio_audit.png
```

The source contains three definite arithmetic failures: its `B0` result is not `1944.158`; its `B_stable` result is not `1825.04`; and the stated bridge yields `1815.995706`, not `1836.152`. The bridge needed at `B=0.24177` is `0.0111825881`, 136.37 times the stated bridge.

The displayed z-scores are data-only diagnostics because the source supplies no uncertainty for `B` or `delta`; they are not valid combined model/data significances. The exact CODATA-fitted value `B=0.24123287565696...` demonstrates how the target can be inverted into the parameter. No independent holdout prediction remains in the source chain.

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
"""Audit archived mu=3/(2 B^5)*(1+delta) against 2022 CODATA."""
from decimal import Decimal, getcontext
from pathlib import Path
import argparse

getcontext().prec = 60
D = Decimal
PI = D("3.14159265358979323846264338327950288419716939937510582097494")
MU = D("1836.152673426")
MU_U = D("0.000000032")
B_STABLE = D("0.24177")
DELTA_SOURCE = D("0.000082")

def mu_of(b, delta=D(0)):
    return D(3) * (D(1)+delta) / (D(2) * b**5)

def fifth_root(x):
    y = D(str(float(x) ** 0.2))
    for _ in range(30):
        y = (D(4)*y + x/y**4)/D(5)
    return y

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("--plot",type=Path)
    a=ap.parse_args()
    b0=D(3)/(D(4)*PI)
    mu0=mu_of(b0)
    mus=mu_of(B_STABLE)
    mub=mu_of(B_STABLE,DELTA_SOURCE)
    delta_needed=MU/mus-D(1)
    b_fit=fifth_root(D(3)/(D(2)*MU))
    b_fit_u=b_fit*MU_U/(D(5)*MU)
    sensitivity=-D(5)*mus/B_STABLE
    z0=(mu0-MU)/MU_U
    zs=(mus-MU)/MU_U
    zb=(mub-MU)/MU_U
    rel0=(mu0/MU-D(1))*D(100)
    rels=(mus/MU-D(1))*D(100)
    print("ARCHIVED PROTON/ELECTRON MASS-RATIO AUDIT")
    print(f"CODATA_2022 = {MU} +/- {MU_U}")
    print(f"B0 = 3/(4*pi) = {b0}")
    print(f"mu(B0) = {mu0}")
    print(f"relative_error_B0_percent = {rel0}")
    print(f"B_stable = {B_STABLE} (no source uncertainty)")
    print(f"mu(B_stable) = {mus}")
    print(f"relative_error_Bstable_percent = {rels}")
    print(f"source_delta = {DELTA_SOURCE}")
    print(f"mu(B_stable,source_delta) = {mub}")
    print(f"delta_needed_at_Bstable = {delta_needed}")
    print(f"delta_needed/source_delta = {delta_needed/DELTA_SOURCE}")
    print(f"B_fitted_to_CODATA_no_bridge = {b_fit}")
    print(f"B_fitted_uncertainty_from_CODATA_only = {b_fit_u}")
    print(f"dmu/dB_at_Bstable = {sensitivity}")
    print(f"data_only_z_B0 = {z0}")
    print(f"data_only_z_Bstable = {zs}")
    print(f"data_only_z_source_bridge = {zb}")
    print("dimension_test = PASS (all ratios dimensionless)")
    print("sign_test = PASS: B>0 and delta>-1 imply mu>0; dmu/dB<0")
    print("limit_B_to_0_plus = +infinity")
    print("limit_B_to_infinity = 0")
    print("identifiability = FAIL: one datum fixes only (1+delta)/B^5")
    print("prediction_status = FIT/CANDIDATE, not independent prediction")
    if a.plot:
        import numpy as np
        import matplotlib.pyplot as plt
        bs=np.linspace(0.237,0.246,600)
        ys=3/(2*bs**5)
        fig,ax=plt.subplots(figsize=(7.2,4.3))
        ax.plot(bs,ys,label=r"$3/(2B^5)$")
        ax.axhline(float(MU),color="black",ls="--",label="2022 CODATA")
        ax.axvline(float(b0),color="tab:orange",label=r"$3/(4\pi)$")
        ax.axvline(float(B_STABLE),color="tab:red",label="archived 0.24177")
        ax.axvline(float(b_fit),color="tab:green",label="CODATA-fitted B")
        ax.set_xlabel("B (dimensionless)")
        ax.set_ylabel(r"$m_p/m_e$ (dimensionless)")
        ax.grid(alpha=.25)
        ax.legend(fontsize=8)
        fig.tight_layout()
        fig.savefig(a.plot,dpi=180)
        print(f"plot = {a.plot}")

if __name__ == "__main__": main()
```

Python SHA-256: `90b621f70555647e54a49c629f69c1bca6236147b608d97ce5fc014c953321b6`.

## Complete Lean 4 / Mathlib source

```lean
import Mathlib

/- Algebra only. This does not establish the archived physical interpretation. -/

theorem mass_ratio_positive
    (B delta : ℝ) (hB : 0 < B) (hd : -1 < delta) :
    0 < 3 * (1 + delta) / (2 * B^5) := by
  positivity

theorem mass_ratio_single_combination
    (B₁ B₂ d₁ d₂ : ℝ)
    (hB₁ : B₁ ≠ 0) (hB₂ : B₂ ≠ 0)
    (h : (1+d₁) / B₁^5 = (1+d₂) / B₂^5) :
    3 * (1+d₁) / (2*B₁^5) = 3 * (1+d₂) / (2*B₂^5) := by
  calc
    3 * (1+d₁) / (2*B₁^5) = (3/2) * ((1+d₁)/B₁^5) := by field_simp; ring
    _ = (3/2) * ((1+d₂)/B₂^5) := by rw [h]
    _ = 3 * (1+d₂) / (2*B₂^5) := by field_simp; ring

theorem tuned_delta_exact
    (B mu : ℝ) (hB : B ≠ 0) (hmu : mu ≠ 0) :
    3 * (1 + (2*mu*B^5/3 - 1)) / (2*B^5) = mu := by
  field_simp
  ring

theorem fifth_power_required
    (B mu : ℝ) (hB : B ≠ 0) (hmu : mu ≠ 0)
    (h : mu = 3 / (2*B^5)) :
    B^5 = 3 / (2*mu) := by
  field_simp at h ⊢
  nlinarith
```

Lean SHA-256: `298ac881c321393672bf437d0bf6c37074d7d7cce4b37989b63a4e46d8f1abba`. Lean was unavailable in this runtime, so compilation success is not claimed. The Python program and plot executed.

## Random substantial reading

The executed random draw selected `MILLENIUM PRIZE.txt` from 557 eligible 8–40 kB text blobs. All 284 lines / 17,349 decoded characters were read. Blob `9eb3371fec8af9b04dfa4ea57e6cafe179a0a48a`; path commit `6a1af2cf80204223a32ba23cc195463e417267cd`, 2026-09-04T21:11:10Z.

Honest takeaway: this is a heuristic research-opportunity ranking, not mathematics toward any Millennium proof. It explicitly defines “Whirlability” as likelihood of exposing structure or lemmas rather than proof probability, and repeatedly warns that finite numerical pattern finding cannot prove global statements. Its most useful discipline is that warning; its percentage scores have no stated calibration dataset and must not be interpreted probabilistically.

## Verdict and exact recovery discriminator

**FAIL / RETAIN UNRESOLVED.** The archived expression is dimensionally legal but numerically miscomputed, non-identifiable, and target-calibrated. The earliest unsupported edge is the unexplained selection of the fifth power and prefactor `3/2`; the later `B_stable`, fine-structure correction, and bridge are additional target-facing degrees of freedom.

Recovery requires a timestamped pre-CODATA derivation that independently fixes the exponent, prefactor, `B`, and every correction, propagates their uncertainties, and predicts at least one mass ratio not used anywhere in their selection. Without that independent holdout, exact agreement is algebraic inversion rather than prediction.

Handoff to Mira: search for a pre-target derivation that fixes the exponent five and prefactor 3/2 from a declared geometry; if found, evaluate a second particle mass ratio with every parameter frozen.
