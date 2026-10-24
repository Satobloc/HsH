# EQ-0017 — Archived 17 mK helium lambda-window construction

Worker: Nadir Voss. Handoff: Enheduanna. Date: 2026-10-24.

Status: **HISTORICAL SOURCE-PRESERVING AUDIT; DIMENSIONS AND SCALAR ALGEBRA PASS; THE 17 mK RESULT IS INVERSE-TUNED/POSTDICTIVE; PHYSICAL IDENTIFICATION FAILS; ACTIVE VERIFICATION ONLY; NOT H(s)H BEDROCK; NOT ESTABLISHED PHYSICS.**

## Provenance and terminology chain

Later source read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/GNEW 2.txt`, 531 lines / 38,053 characters, Git blob `2588c591264b6c6cfd7846cac7fc3e46b05e4de8`, archive snapshot/tree `8d49183464ad8fb2411d5b8e13c6408eecd39e18`; path commit `ec6ff6182340346b649f905653fd5f74886d1502`, repository date 2026-06-29T10:18:39Z. Exact construction: lines 219–287.

Earlier ancestor read completely: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THOUGHTS — Mechwaall.txt`, 1,174 lines / 131,400 characters, blob `5e0f2fd4a8b1f4a344dfa9ac84f09211151ad74d`, path commit `dd4719b9c6ab59322c8d2351483feffb08810686`, repository upload date 2026-06-01T05:37:31Z. Relevant construction: lines 541–650. Repository dates are locators, not asserted authorship dates.

Verbatim later mathematics:

```text
T_c = 2.170 K
B = 3/(4π) ≈0.238732 rad
J_eff = -3.3 × 10^-2
Delta_T = T_c * B * |J_eff|
T_low = T_c - ΔT/2
T_high = T_c + ΔT/2
```

The earlier ancestor explicitly records the dependence on the already supplied outcome:

```text
# Standard T_lambda for He-4 is ~2.17K, He-3 doesn't have a lambda point in the same way
# but undergoes superfluid transitions at mK scales.
# Using the user's provided 17mK as the output to find the scaling.
T_benchmark=2.17 # He-4 Lambda point as a rough scaling proxy
```

It also says that an unprimed calculation still needs vertex coordinates, the ghost-coupling term, and holotype spacing; later it takes `J_eff ≈ -3.3e-2` as provided. The later `GNEW 2.txt` restatement calls the expression first-principles and closed. Both stages are retained; the later label does not erase the earlier inverse-scaling record.

## Reproduction

For

`ΔT(T,J)=T·(3/(4π))·|J|`,

literal archive inputs give:

```text
B=0.238732414637843
archive_width_K=0.017095628212216
archive_width_mK=17.095628212216
archive_residual_mK=+0.095628212216
archive_target_tolerance_pass=True
T_low_K=2.161452185894
T_high_K=2.178547814106
recovered_width_mK=17.095628212216
```

The source's ±0.15 mK test passes, but no provenance for that tolerance was found.

The inverse value needed to reproduce exactly 17 mK is

`|J_required| = 0.017/(2.170·B) = 0.032815407134`.

The selected `0.033` is only 0.5625% above that inverse-fit value:

```text
J_required_archive=0.032815407134
chosen_over_required_archive=1.005625188954
```

This numerical proximity, combined with the ancestor's explicit comment “using ... 17mK as the output to find the scaling,” makes the result postdictive rather than independent.

## Dimensions, algebra, limits, sign, topology, numerics

- **Dimensions:** `T` carries kelvin; `B=3/(4π)` and `J_eff` are dimensionless, so `ΔT` carries kelvin. Radians are dimensionless in SI. Dimensional consistency passes.
- **Algebra:** the symmetric bounds recover the width exactly: `(T+ΔT/2)−(T−ΔT/2)=ΔT`. The formula is also exactly invertible for `J`, so a result cannot be independent unless `J_eff` was fixed without the target.
- **Limits:** `J→0`, `B→0`, or `T→0` gives `ΔT→0`; the dependence is linear in all non-absolute factors.
- **Sign:** `|J_eff|` makes `ΔT(J)=ΔT(−J)`. The negative sign therefore contributes nothing to this calculation; it cannot test a CP-sign claim.
- **Topology:** this scalar product contains no topological space, invariant, continuity map, winding/braid data, or derivation from SAT/H(s)H geometry. A numerical appearance of `3/(4π)` is not a topology test.
- **Numerics:** the decimal reproduction is stable. Replacing 2.170 K by the NIST helium-4 lambda point 2.1768 K changes the result to 17.149199766061 mK, still inside the source's unsupported 0.15 mK envelope by only 0.000800 mK.

## Versioned standards and the isotope discriminator

NIST IR 8474 (August 2023) identifies the low-pressure helium-4 lambda point as 2.1768 K. It does not supply a universal 17 mK transition width. With that input:

```text
nist_he4_width_mK=17.149199766061
nist_he4_residual_mK=+0.149199766061
J_required_nist=0.032712896675
```

The 2026 Particle Data Group CKM review gives the standard Jarlskog invariant

`J = (3.16 +0.13/-0.11) × 10^-5`.

The archive calls its quantity an effective “Jarlskog Shadow,” so identity with the standard invariant must not be assumed. The exact discriminator is nevertheless decisive:

- if `J_eff` is intended to be the standard Jarlskog invariant, it is too large by a factor 1044.3038 and fails the versioned standard;
- if it is a distinct effective parameter, the reviewed source gives no independently derived definition, units map, or measurement for it.

Substituting the standard 2026 PDG value into the archive formula gives:

```text
pdg_standard_J_width_mK=0.016421657958
pdg_width_asym_mK=+0.000675574536/-0.000571639992
archive_Jeff_over_PDG_J=1044.303797468
target_over_PDG_width=1035.218249198
```

This is about three orders of magnitude below 17 mK. CODATA is not the relevant authority for either a helium phase-transition temperature or the CKM invariant; NIST ITS-90 thermometry and the versioned PDG review are the appropriate comparators here.

The physical label is also mixed. The archived 2.17 K benchmark is helium-4's lambda transition. A 2024 helium-3 experiment at 22 bar reports an A–B transition near 2.20 mK, and emphasizes pressure, field, confinement, and stochastic nucleation. Thus the calculation does not predict a helium-3 transition by multiplying a helium-4 benchmark. A 2003 orbital helium-4 experiment measured specific heat from 22 mK below the transition to 4 μK above; that 22 mK is a measurement span, not evidence for a universal 17 mK window.

## Complete Python test

```python
#!/usr/bin/env python3
from math import pi

B = 3.0 / (4.0 * pi)
T_ARCHIVE_K = 2.170
T_NIST_HE4_K = 2.1768
J_EFF = -3.3e-2
TARGET_K = 17.0e-3
PDG_J = 3.16e-5
PDG_J_PLUS = 0.13e-5
PDG_J_MINUS = 0.11e-5

def width(T_K: float, j: float) -> float:
    return T_K * B * abs(j)

archive_width = width(T_ARCHIVE_K, J_EFF)
nist_width = width(T_NIST_HE4_K, J_EFF)
j_required_archive = TARGET_K / (T_ARCHIVE_K * B)
j_required_nist = TARGET_K / (T_NIST_HE4_K * B)
pdg_width = width(T_NIST_HE4_K, PDG_J)
pdg_width_plus = width(T_NIST_HE4_K, PDG_J + PDG_J_PLUS)
pdg_width_minus = width(T_NIST_HE4_K, PDG_J - PDG_J_MINUS)
t_low = T_ARCHIVE_K - archive_width / 2.0
t_high = T_ARCHIVE_K + archive_width / 2.0

print(f"B={B:.15f}")
print(f"archive_width_K={archive_width:.15f}")
print(f"archive_width_mK={archive_width*1e3:.12f}")
print(f"archive_residual_mK={(archive_width-TARGET_K)*1e3:+.12f}")
print(f"archive_target_tolerance_pass={abs(archive_width-TARGET_K) <= 0.15e-3}")
print(f"T_low_K={t_low:.12f}")
print(f"T_high_K={t_high:.12f}")
print(f"recovered_width_mK={(t_high-t_low)*1e3:.12f}")
print(f"nist_he4_width_mK={nist_width*1e3:.12f}")
print(f"nist_he4_residual_mK={(nist_width-TARGET_K)*1e3:+.12f}")
print(f"J_required_archive={j_required_archive:.12f}")
print(f"J_required_nist={j_required_nist:.12f}")
print(f"chosen_over_required_archive={abs(J_EFF)/j_required_archive:.12f}")
print(f"pdg_standard_J_width_mK={pdg_width*1e3:.12f}")
print(f"pdg_width_asym_mK=+{(pdg_width_plus-pdg_width)*1e3:.12f}/-{(pdg_width-pdg_width_minus)*1e3:.12f}")
print(f"archive_Jeff_over_PDG_J={abs(J_EFF)/PDG_J:.9f}")
print(f"target_over_PDG_width={TARGET_K/pdg_width:.9f}")
print(f"sign_erasure={width(T_ARCHIVE_K,J_EFF)==width(T_ARCHIVE_K,-J_EFF)}")
print(f"zero_J_limit={width(T_ARCHIVE_K,0.0):.1f}")
print(f"zero_T_limit={width(0.0,J_EFF):.1f}")

assert abs((t_high - t_low) - archive_width) < 1e-15
assert abs(width(T_ARCHIVE_K, J_EFF) - width(T_ARCHIVE_K, -J_EFF)) < 1e-15
assert abs(T_ARCHIVE_K * B * j_required_archive - TARGET_K) < 1e-15
assert abs(archive_width - TARGET_K) <= 0.15e-3
assert abs(J_EFF) / PDG_J > 1000.0
```

Python SHA-256: `2a45839786ce4b3418e8f36da04920c512335c76d90047b2170abd46d4454bcc`.

## Complete Lean test

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0017

def window (T B j : ℝ) : ℝ := T * B * |j|

theorem symmetric_bounds_recover_width (T d : ℝ) :
    (T + d / 2) - (T - d / 2) = d := by
  ring

theorem sign_is_erased (T B j : ℝ) : window T B (-j) = window T B j := by
  simp [window]

theorem zero_coupling_limit (T B : ℝ) : window T B 0 = 0 := by
  simp [window]

theorem zero_temperature_limit (B j : ℝ) : window 0 B j = 0 := by
  simp [window]

theorem inverse_fit_reproduces_target
    (T B target : ℝ) (hT : T ≠ 0) (hB : B ≠ 0) :
    T * B * (target / (T * B)) = target := by
  field_simp [hT, hB]

theorem archived_tolerance_accepts :
    |(17095628212216 : ℝ) / 1000000000000000 - 17 / 1000| ≤
      15 / 100000 := by
  norm_num [abs_of_nonneg, abs_of_nonpos]

theorem standard_J_substitution_is_not_17mK :
    (16421657958 : ℝ) / 1000000000000000 < 17 / 1000 := by
  norm_num

end HsHVerification.ArchiveEQ0017
```

Lean SHA-256 before CI: `2e19d512baf8083d69ca15ab1cfb35862c06670612d382971ede3b92bcc8f426`. Status at initial publication: `LEAN_UNTESTED`; GitHub CI is required because local Lean is unavailable.

## Classification and reopening discriminator

Classification: **inverse-tuned/postdictive scalar match**. The arithmetic passes, but it is not an independent prediction and carries no tested topology. Retain in active verification; do not promote.

Exact reopening discriminator: before examining a held-out dataset, define `J_eff` from SAT/H(s)H primitives with a unit-safe map and uncertainty; specify isotope, pressure, field, confinement, and operational definition of “window”; preregister the tolerance; then predict a new transition-width observable without reusing its target. The result must distinguish helium-3 from helium-4 and outperform a conventional critical-phenomena baseline. Failure to supply an independently fixed `J_eff` leaves the construction tunable.

## Required reading round

Live `BEDROCK.md`: full 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Subordinate `STATE_OF_THE_THEORY.md`: full 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Shared Mersearch request blob `662e4a99e47a48e1e573cf0dddffaf1329dd60dd` remained occupied by `2026-10-21-orson-nlm-big-haul-math-001` and was not overwritten.

Fresh random draw: candidate set was 85 archive-root `.txt`/`.md` files sized 20,000–250,000 bytes, excluding the packet's primary source and the immediately previous random file; `Math.random()=0.30117485623157303`, index 25, selected `GITOPSY.txt`. It was read completely: 1,538 lines / 63,268 characters (63,268 repository bytes), blob `8966d34e1579a0957729e7a56fded605d0f7a80f`, path commit `ab5340fd6e6fdf58049616d30be6572083f6d7a8`, repository upload date 2026-09-04T19:59:02Z. Honest takeaway: this is a concatenated software snapshot for a temporal-memory system—filesystem projection, extraction tests, conflict policies, embeddings/configuration, CLI setup, schema migration, and flat-vs-temporal retrieval benchmarking. Its useful connection to this audit is methodological rather than physical: it distinguishes observations, assertions, current facts, timestamps, and conflict resolution, exactly the provenance separation missing when an earlier target-conditioned parameter is later relabeled “first-principles.” It supplies no evidence for the helium formula.

## External references

- Particle Data Group, 2026 CKM review: https://pdg.lbl.gov/2026/reviews/rpp2026-rev-ckm-matrix.pdf
- NIST IR 8474, August 2023: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=956186
- Autti et al., helium-3 nanofluidic transitions (2024): https://link.springer.com/article/10.1007/s10909-024-03146-6
- Lipa et al., helium-4 specific heat near the lambda point (2003): https://arxiv.org/abs/cond-mat/0310163
