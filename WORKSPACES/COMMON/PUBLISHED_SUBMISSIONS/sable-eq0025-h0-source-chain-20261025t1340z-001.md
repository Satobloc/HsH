# EQ-0025 — Archived `H0=71.2` source-chain audit

Submission ID: `sable-eq0025-h0-source-chain-20261025t1340z-001`  
Worker handoff: Sable → Loom  
Status: **source recovery PASS; dimensions/algebra/numerics PASS; independent-prediction claim UNRESOLVED/FAILED ON THE RECOVERED RECORD; no BEDROCK promotion.**

## Source record, preserved rather than superseded

Primary public transcript read completely: `__SAT_Public_Record_Transcripts/Debating A.I. On Science - String Gravity Predictions H0=71.2.txt`, 4,934 lines / 86,947 decoded characters, blob `c66d5a56f87e33aa161a934ea495849ce8a17152`, archive snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`, path commit `33168c0a40d419da0c8f670ec6a7519944c45460`, repository date `2026-09-04T20:41:13Z`; internal publication line: `Published: May 18, 2026 at 2:02 PM`.

Verbatim recovered wording, transcript lines 3561–3562 and 3591–3602:

```text
the Hubble constant purely as a
projective resistance limit.

when it runs the
numbers on the mechanical limit
of the 4D to 3D projection, the
geometric limit lands at exactly
71.2 kilometers per second per
megaparsec.
```

The same transcript, lines 3651–3666, frames a future measured value of exactly `71.2` as external validation. The complete transcript contains no displayed equation or independently enumerated input chain for recovering `71.2`; this is a source-record finding, not a claim that no derivation can exist elsewhere.

A related historical construction was also read completely: `PROP Q.txt`, 3,905 lines / 131,204 decoded characters, blob `9dd962dca961fdc523346c0483bd6c169b9e5154`, the same archive snapshot, path commit `ec6ff6182340346b649f905653fd5f74886d1502`, repository date `2026-06-29T10:18:39Z`. Verbatim mathematics, lines 738, 740, 760, 764, and 768:

```text
Using your SAT-preferred ballpark H_0=71.2\ \mathrm{km\,s^{-1}\,Mpc^{-1}}:
H_0 = 2.31\times10^{-18}\ \mathrm{s^{-1}}
L_H=c/H_0≈1.30×10^26 m
H_0 L_H=c
c/L_H=H_0
```

This preserves the historical construction under its original terms. It also fixes its logical direction: `PROP Q` explicitly inserts `71.2`; the subsequent `c/H0` arithmetic is a consistency calculation conditional on that input, not an independent recovery of it.

Current controls read completely: `BEDROCK.md`, 563 lines / 86,946 characters, blob `4cabda482c48c217614b868a2138409275df9bf7`; `STATE_OF_THE_THEORY.md`, 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.

Random substantial draw actually executed from 460 eligible HsH text/Markdown/TeX blobs: `u=0.12820128008411225`, index 58, `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/McKnight_et_al_SAT_Whitepaper_Number_One_02Jun25.txt`, full 2,273 lines / 84,733 decoded characters, blob `51573fa3ee5c98a6a75720288942334523058df9`, path commit `aaa0511fa46a0f8afe2324df02084cd1dafccd1f`, repository date `2026-10-02T06:54:09Z`. Honest takeaway: the June 2025 whitepaper repeatedly claims first-principles, no-input derivations while also marking metric functions, constants, and scales as provisional or still to be derived. It contains no `H0`, `Hubble`, or `71.2` string. It is therefore important genealogy for the rhetoric and provisional dependency pattern, but supplies no missing `71.2` derivation.

## Measurement comparison (not CODATA)

`H0` is a cosmological parameter, not a CODATA recommended constant. The comparison therefore uses two versioned, method-distinct measurements:

- Planck 2018, under base ΛCDM: `67.4 ± 0.5 km s^-1 Mpc^-1`.
- SH0ES 2022 distance ladder: `73.04 ± 1.04 km s^-1 Mpc^-1`, including systematic uncertainty.

These are not collapsed into a single fitted target. Planck is model-conditional and SH0ES is a local distance-ladder determination. Their quoted central values differ by `4.8876σ` if the quoted errors are treated as independent, so an inverse-variance average would conceal the very tension at issue.

For proposed `H0=71.2`:

| Comparator | Residual | Relative residual | Quoted-σ residual |
|---|---:|---:|---:|
| Planck 2018 base ΛCDM | `+3.8` | `+5.637982%` | `+7.6000σ` |
| SH0ES 2022 | `−1.84` | `−2.519168%` | `−1.76923σ` |

The proposal lies between the central values, but it is not their midpoint: `(67.4+73.04)/2=70.22`, so `71.2` is `0.98` higher and 67.38% of the way from the Planck central value to the SH0ES central value. “Between” is not a derivation and does not resolve the measurement tension.

## Dimensions, limits, sign, topology

`H0` has dimension `T^-1`. Thus `H0 L` has velocity dimension `L T^-1`, `1/H0` is a time, and `c/H0` is a length. With `H0>0`, both are positive. The conditional identity `H0(c/H0)=c` holds for every nonzero `H0`; it cannot select `71.2`. The limits are `1/H0,c/H0 → +∞` as `H0→0+`, and both approach zero as `H0→+∞`.

The recovered wording “4D to 3D projection” and “projective resistance limit” does not specify a map, domain/codomain, invariant, boundary condition, or measure. No topology test beyond type checking is possible from this record. That missing structure is retained as unresolved, not silently supplied.

## Executed Python and output

```python
#!/usr/bin/env python3
"""EQ-0025: audit the archived H0=71.2 source chain."""
from decimal import Decimal, getcontext
getcontext().prec = 40
D = Decimal
H_PROP=D("71.2"); PLANCK=D("67.4"); PLANCK_SIGMA=D("0.5")
SH0ES=D("73.04"); SH0ES_SIGMA=D("1.04")
MPC_M=D("3.0856775814913673e22"); C=D("299792458"); JULIAN_YEAR_S=D("31557600")
def residual(label, reference, sigma):
    delta=H_PROP-reference
    print(f"{label}: delta={delta} km s^-1 Mpc^-1; relative={100*delta/reference:.8f}%; z={delta/sigma:.8f}")
print("EQ-0025 H0=71.2 source-chain numerical audit")
print("Units: H0 in km s^-1 Mpc^-1 unless otherwise stated")
midpoint=(PLANCK+SH0ES)/2
fraction=(H_PROP-PLANCK)/(SH0ES-PLANCK)
measurement_tension=(SH0ES-PLANCK)/(PLANCK_SIGMA**2+SH0ES_SIGMA**2).sqrt()
print(f"unweighted endpoint midpoint={midpoint}")
print(f"71.2-midpoint={H_PROP-midpoint}")
print(f"fraction from Planck endpoint toward SH0ES endpoint={fraction:.10f} (midpoint would be 0.5)")
residual("Planck 2018 base-LambdaCDM",PLANCK,PLANCK_SIGMA)
residual("SH0ES 2022 distance ladder",SH0ES,SH0ES_SIGMA)
print(f"Planck-SH0ES separation using quoted independent sigmas={measurement_tension:.8f} sigma")
z_planck=(H_PROP-PLANCK)/PLANCK_SIGMA; z_shoes=(H_PROP-SH0ES)/SH0ES_SIGMA
print(f"diagnostic-only sum(z^2) at 71.2={z_planck**2+z_shoes**2:.8f} (do not interpret as a combined fit)")
h_si=H_PROP*D(1000)/MPC_M; t_s=1/h_si; t_gyr=t_s/JULIAN_YEAR_S/D(1e9)
length_m=C/h_si; length_gpc=length_m/MPC_M/D(1e3)
print(f"H0_SI={h_si:.16E} s^-1")
print(f"Hubble_time=1/H0={t_s:.16E} s = {t_gyr:.10f} Gyr")
print(f"Hubble_length=c/H0={length_m:.16E} m = {length_gpc:.10f} Gpc")
print(f"identity_check H0_SI*(c/H0_SI)-c={(h_si*length_m-C):.3E} m s^-1")
assert PLANCK < H_PROP < SH0ES and midpoint==D("70.22") and H_PROP!=midpoint
assert h_si>0 and t_s>0 and length_m>0 and abs(h_si*length_m-C)<D("1e-25")
print("PASS: ordering, midpoint, sign, units, and conditional identity checks")
```

```text
EQ-0025 H0=71.2 source-chain numerical audit
Units: H0 in km s^-1 Mpc^-1 unless otherwise stated
unweighted endpoint midpoint=70.22
71.2-midpoint=0.98
fraction from Planck endpoint toward SH0ES endpoint=0.6737588652 (midpoint would be 0.5)
Planck 2018 base-LambdaCDM: delta=3.8 km s^-1 Mpc^-1; relative=5.63798220%; z=7.60000000
SH0ES 2022 distance ladder: delta=-1.84 km s^-1 Mpc^-1; relative=-2.51916758%; z=-1.76923077
Planck-SH0ES separation using quoted independent sigmas=4.88756123 sigma
diagnostic-only sum(z^2) at 71.2=60.89017751 (do not interpret as a combined fit)
H0_SI=2.3074348540843879E-18 s^-1
Hubble_time=1/H0=4.3338168279373136E+17 s = 13.7330368214 Gyr
Hubble_length=c/H0=1.2992455993690903E+26 m = 4.2105682303 Gpc
identity_check H0_SI*(c/H0_SI)-c=-1.000E-31 m s^-1
PASS: ordering, midpoint, sign, units, and conditional identity checks
```

Python SHA-256: `74a04cbde74827eeace0d5e4432b9ad334de015bcc8d5e33b4d86999e3c44900`.

## Lean 4 / Mathlib

Commit `8762f221f20cd5f8a4282e015c50f4e29d692791`, `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0025.lean`:

```lean
import Mathlib
namespace ArchiveEQ0025
def proposed : ℚ := 712 / 10
def planck : ℚ := 674 / 10
def shoes : ℚ := 7304 / 100
theorem proposed_between : planck < proposed ∧ proposed < shoes := by
  norm_num [planck, proposed, shoes]
theorem endpoint_midpoint : (planck + shoes) / 2 = 7022 / 100 := by
  norm_num [planck, shoes]
theorem proposed_not_endpoint_midpoint : proposed ≠ (planck + shoes) / 2 := by
  norm_num [proposed, planck, shoes]
theorem planck_residual : proposed - planck = 38 / 10 := by
  norm_num [proposed, planck]
theorem shoes_residual : proposed - shoes = -(184 / 100) := by
  norm_num [proposed, shoes]
def hubbleVelocity (H L : ℚ) : ℚ := H * L
def hubbleLength (c H : ℚ) : ℚ := c / H
theorem conditional_identity (c H : ℚ) (hH : H ≠ 0) :
    hubbleVelocity H (hubbleLength c H) = c := by
  field_simp [hubbleVelocity, hubbleLength, hH]
def Dim := ℤ × ℤ
def dH : Dim := (0, -1)
def dL : Dim := (1, 0)
def dV : Dim := (1, -1)
theorem dimension_velocity : (dH.1 + dL.1, dH.2 + dL.2) = dV := by
  decide
end ArchiveEQ0025
```

Lean source SHA-256: `7003f270147f4b67b7cc8cd7661a7c098a890964f09cd3ee6330a6e5e4dbe9a7`. The source was committed to the cumulative draft verification branch. No Lean executable exists in the local runtime, and the repository's Lean workflow is not present on the default branch, so GitHub did not start that PR workflow; compile status is therefore **pending**, not represented as a pass. The unrelated default-branch conversation-JSON workflow created a zero-job failure and is not evidence about these lemmas.

## Verdict and exact discriminator

The source packet passes provenance recovery, units, signs, limits, arithmetic, and the conditional identity. It fails to recover an independent pre-measurement derivation of `71.2`. The number is currently `SRC/HISTORICAL` and a stated target, not established physics and not a demonstrated prediction.

Promotion requires a timestamped pre-May-18-2026 source giving the projection map, boundary conditions, all dimensionful inputs, and an equation whose evaluation yields `71.2` without importing Hubble data or a calibrating cosmology. Its uncertainty must be propagated before comparison. A preregistered value can then be tested separately against model-conditional early-universe inference and direct late-universe measurements. Until that discriminator is met, downstream use of `H0=71.2`, `c/H0`, or `H0(c/H0)=c` remains conditional rather than predictive.
