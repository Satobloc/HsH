# EQ-0028 — Homecoming Circuit / Dirac-CP phase-lock audit

**Handoff:** Tern Rook → Morrow  
**Status:** `SRC/HISTORICAL`; internal numerical closure fails; empirical comparison is mixed; no BEDROCK or established-physics promotion.

## Result

The historical construction associates a full Homecoming Circuit with 1080° = 6π radians, 72 phase snaps of Φ≈0.246 rad, and a Dirac CP phase lock at exactly 270° = 3π/2. Its displayed quantities do not close:

\[
72(0.246)=17.712\ \mathrm{rad}=1014.822846735714^\circ,
\]

which is short of 1080° by

\[
1.137555921538759\ \mathrm{rad}=65.177153264286^\circ.
\]

If 72 equal snaps are required to make 6π, the required snap is uniquely

\[
\Phi_{72}=\frac{6\pi}{72}=\frac{\pi}{12}
=0.261799387799149\ \mathrm{rad}=15^\circ,
\]

6.422515% above the printed 0.246 rad. Yet 1080° mod 360° = 0°, while 270° = 3π/2; therefore even this closure correction does not derive the claimed CP phase. A separate, explicitly defined nonlinear holonomy map would be required.

No unique correction is made: changing Φ, changing the snap count, or supplying a nonlinear map are inequivalent repairs. The original source itself notices the 1015°/1080° discrepancy and calls Φ a nonlinear correction, but supplies no map that can be tested.

## Preserved source record

1. `MAY_2026_SNAPSHOT.txt`, complete read 84/84 lines, 6,734 characters; blob `c29c49b697208294d705b0a280d91808a57edc66`; introducing commit `bb7404c641493ac9d4ce1e9db256ece43f5ad961`, 2026-05-30.

   Verbatim:

   ```text
   4.  **The Homecoming Circuit:**
       A full trifold rotation ($1080^\circ$ or $6\pi$ rad) involving 72 phase snaps is required to restore baseline holonomy and satisfy the **Dirac CP Phase Lock** at exactly $270.0^\circ$ ($3\pi/2$ rad).
   ```

2. `SAT_CONCEPTS__May2026.txt`, complete read 38/38 lines, 5,103 characters; blob `47660297bec8e95c1d2e3e9a727cec63793d14b5`; commit `f3886b982b9bb5a9e809cd09538d722fc19fa2ae`, 2026-05-30.

   Verbatim:

   ```text
   1080° Homecoming Circuit: A full trifold rotation involving 72 discrete phase snaps required to synchronize spatial motion with internal holonomy and satisfy the Dirac CP phase lock.
   ```

3. `Filament onto.txt`, complete read 1,732/1,732 lines, 103,710 characters; blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`; path commit `ec6ff6182340346b649f905653fd5f74886d1502`, 2026-06-29.

   Preserved mathematical excerpt:

   ```text
   Dirac CP Phase Lock: The integration of rotational torsion Ω over the S... manifold:
   ∮ ∇θ⋅dℓ= ... rad (270.0...)
   Homecoming Circuit: A full structural reset requires a trifold rotation (1080...) involving exactly 72 phase snaps.
   Total Rotation=72×0.246 rad≈17.712 rad≈1015...
   Note: 1080... is exactly 6π rad. The discrepancy between 1015... (from 72Φ) and 1080... identifies Φ as a non-linear correction required for holonomy restoration rather than a simple division of the circle.
   ```

4. Archive index `..MATHEMATICAL_REPOSITORY`, complete read 866/866 lines, 27,777 characters; blob `1b6876db3f871bfa25157ac024d66d8239082ff1`. ENTRY 014 retains the Homecoming/Dirac-CP item and separately flags phase-count mismatch risk.

These are historical source statements. The old lattice and phase-snap terminology is retained as genealogy and is not substituted for the current SAT/H(s)H primitive hierarchy.

## Physical comparison — NuFIT 6.1 (2025)

The relevant versioned physical dataset is NuFIT 6.1, which incorporates oscillation data available through November 2025. CODATA does not provide a Dirac CP phase; a CODATA residual here would be a category error.

For the NuFIT 6.1 IC24 fit with Super-K atmospheric data, the parameter table reports:

| Ordering | best-fit δCP | asymmetric 1σ interval | reported 3σ range | residual of 270° |
|---|---:|---:|---:|---:|
| Normal | 212° | +26° / −36° | 125°–365° | +58° |
| Inverted | 274° | +22° / −25° | 203°–335° | −4° |

Thus 270° lies inside both reported 3σ ranges and is close to the inverted-ordering best fit, but it is not an exact ordering-independent central value. The side-width diagnostics are +2.230769 for normal ordering and −0.16 for inverted ordering. They are not Gaussian z-scores: δCP is periodic and its likelihood is non-Gaussian.

This is an external comparison, not a tuned fit. The archived value is fixed at 270° before the NuFIT 6.1 comparison. However, the archive construction does not algebraically derive that value from its 72-snap arithmetic.

## Executed Python

```python
from decimal import Decimal, getcontext

getcontext().prec = 60
D = Decimal
PI = D("3.1415926535897932384626433832795028841971693993751")

# Archive construction.
phi = D("0.246")          # rad per phase snap
n = D(72)                 # phase snaps
target_turn = D(6) * PI   # 1080 degrees
delta_archive_deg = D(270)

total_rad = n * phi
total_deg = total_rad * D(180) / PI
required_phi = target_turn / n
shortfall_rad = target_turn - total_rad
shortfall_deg = shortfall_rad * D(180) / PI
wrapped_total_deg = total_deg % D(360)
wrapped_target_deg = D(1080) % D(360)

# NuFIT 6.1 (2025), IC24 with SK-atm, degrees.
# The +/- values are asymmetric 1-sigma intervals; pulls below are diagnostics,
# not Gaussian z-scores because delta_CP is periodic and likelihoods are non-Gaussian.
fits = {
    "NO": {"best": D(212), "minus": D(36), "plus": D(26),
           "lo3": D(125), "hi3": D(365)},
    "IO": {"best": D(274), "minus": D(25), "plus": D(22),
           "lo3": D(203), "hi3": D(335)},
}

def circular_residual_deg(pred, best):
    return (pred - best + D(180)) % D(360) - D(180)

print("EQ-0028 Homecoming/Dirac-CP audit")
print(f"72*Phi = {total_rad:.15f} rad = {total_deg:.15f} deg")
print(f"6*pi   = {target_turn:.15f} rad = 1080 deg")
print(f"shortfall = {shortfall_rad:.15f} rad = {shortfall_deg:.15f} deg")
print(f"Phi_required_for_72_snaps = {required_phi:.15f} rad")
print(f"relative_Phi_change = {(required_phi/phi-1):.15f}")
print(f"(72*Phi) mod 360 = {wrapped_total_deg:.15f} deg")
print(f"1080 mod 360 = {wrapped_target_deg} deg")
print(f"archive_delta_CP = {delta_archive_deg} deg")
print(f"wrapped_total_minus_delta_CP = {wrapped_total_deg-delta_archive_deg:.15f} deg")

for ordering, fit in fits.items():
    residual = circular_residual_deg(delta_archive_deg, fit["best"])
    side_sigma = fit["plus"] if residual >= 0 else fit["minus"]
    diagnostic_pull = residual / side_sigma
    inside_3sigma = fit["lo3"] <= delta_archive_deg <= fit["hi3"]
    print(
        f"{ordering}: best={fit['best']} deg; residual={residual} deg; "
        f"side_width_pull={diagnostic_pull:.12f}; "
        f"inside_reported_3sigma={inside_3sigma}"
    )

assert total_rad != target_turn
assert wrapped_total_deg != delta_archive_deg
assert required_phi > phi
assert circular_residual_deg(delta_archive_deg, fits["NO"]["best"]) == D(58)
assert circular_residual_deg(delta_archive_deg, fits["IO"]["best"]) == D(-4)
print("ASSERTIONS: PASS")
```

Complete output, exit status 0:

```text
EQ-0028 Homecoming/Dirac-CP audit
72*Phi = 17.712000000000000 rad = 1014.822846735714067 deg
6*pi   = 18.849555921538759 rad = 1080 deg
shortfall = 1.137555921538759 rad = 65.177153264285933 deg
Phi_required_for_72_snaps = 0.261799387799149 rad
relative_Phi_change = 0.064225153655079
(72*Phi) mod 360 = 294.822846735714067 deg
1080 mod 360 = 0 deg
archive_delta_CP = 270 deg
wrapped_total_minus_delta_CP = 24.822846735714067 deg
NO: best=212 deg; residual=58 deg; side_width_pull=2.230769230769; inside_reported_3sigma=True
IO: best=274 deg; residual=-4 deg; side_width_pull=-0.160000000000; inside_reported_3sigma=True
ASSERTIONS: PASS
```

## Lean 4 / Mathlib formal core

Formal commit: `2f4219131ca0f196311ad2f8aeeb4178a0d319be`.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0028

def totalPhase (count phase : ℝ) : ℝ := count * phase

theorem dimensionless_ledger :
    (0 : ℤ) + 0 = 0 := by
  norm_num

theorem total_positive {count phase : ℝ}
    (hc : 0 < count) (hp : 0 < phase) :
    0 < totalPhase count phase := by
  exact mul_pos hc hp

theorem zero_count (phase : ℝ) : totalPhase 0 phase = 0 := by
  simp [totalPhase]

theorem zero_phase (count : ℝ) : totalPhase count 0 = 0 := by
  simp [totalPhase]

theorem seventy_two_printed_snaps :
    totalPhase 72 ((123 : ℝ) / 500) = (2214 : ℝ) / 125 := by
  norm_num [totalPhase]

theorem printed_total_not_six_pi :
    totalPhase 72 ((123 : ℝ) / 500) ≠ 6 * Real.pi := by
  intro h
  have hp : (3 : ℝ) < Real.pi := Real.pi_gt_three
  norm_num [totalPhase] at h
  nlinarith

theorem phase_required_if_seventy_two_close
    (phase : ℝ) (h : totalPhase 72 phase = 6 * Real.pi) :
    phase = Real.pi / 12 := by
  unfold totalPhase at h
  linarith

theorem homecoming_mod_turn_not_cp_lock :
    (1080 % 360 : Nat) ≠ 270 := by
  norm_num

theorem nufit61_normal_residual :
    (270 : ℤ) - 212 = 58 := by
  norm_num

theorem nufit61_inverted_residual :
    (270 : ℤ) - 274 = -4 := by
  norm_num

theorem predicted_inside_reported_three_sigma_ranges :
    ((125 : ℤ) ≤ 270 ∧ 270 ≤ 365) ∧
    ((203 : ℤ) ≤ 270 ∧ 270 ≤ 335) := by
  norm_num

end HsHVerification.ArchiveEQ0028
```

## Reading controls

- Live `BEDROCK.md`: complete read 563/563 lines, 86,946 characters; blob `4cabda482c48c217614b868a2138409275df9bf7`.
- `STATE_OF_THE_THEORY.md`: complete read 155/155 lines, 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Random execution: eligible population 460 substantial archive blobs; `secrets.randbelow(460) → 176`.
- Selected random file: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATx ADDENDUM (1).txt`; complete read 2,876/2,876 lines, 34,223 decoded characters / 37,829 bytes; blob `907ec14ba1d39c613cb4221f102fb8ddee3cd8df`; path commit `b5989d825064178d5d49d83a956c78da4d8c6add`, 2026-10-01.

Honest takeaway: the random file is a generated SAT.X reconstruction with flexible θ4, u, τ, and ψ scaffolds and claimed completion checklists. It is useful as a record of ambitious gauge/kink/oscillator analogies, but it supplies neither independent evidence for 72 snaps nor a derivation of δCP. Its completion labels cannot substitute for a source-stated map and held-out prediction.

## Verdict and discriminator

- **PASS:** units (angles are dimensionless), positivity/sign for positive count and phase, zero-count/zero-phase limits, direct arithmetic, circular residual calculation, and formal proof of the mismatch.
- **FAIL:** the printed 72×0.246 rad does not equal 6π; neither its wrapped angle nor 1080° modulo one turn equals 270°.
- **UNRESOLVED:** topology. No explicit manifold, connection, loop, holonomy operator, winding class, or nonlinear map is supplied at sufficient precision to derive 3π/2.
- **MIXED empirical comparison:** 270° is within both NuFIT 6.1 3σ ranges and close to the inverted-ordering best fit, but not an exact universal best fit.
- **NOT CODATA-eligible:** δCP is not a CODATA recommended constant.
- **NO PROMOTION:** retain the construction and mismatch as historical evidence only.

Exact reopening discriminator: provide a timestamped, independently evaluable map

\[
H:(n,\Phi,\text{boundary data})\mapsto
(\text{closure holonomy},\delta_{CP})
\]

that sends the source-fixed inputs `(72, 0.246 rad, boundary data)` to both `6π` closure and `3π/2` without using oscillation-fit δCP as a calibration target. Preregister the ordering, likelihood, uncertainty propagation, and held-out oscillation dataset before comparison.
