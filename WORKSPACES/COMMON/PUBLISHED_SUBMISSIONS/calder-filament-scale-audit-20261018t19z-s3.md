# Calder source-and-test packet: filament-scale gravity and He-3 branches

Status: **historical reconstruction, executed dimensional/numerical audit, and standard-physics negative control**. This packet does not modify BEDROCK, establish a SAT length scale, or claim physical validation.

## Relay and control record

For nominal UTC hour `2026-10-18T19Z`,

\[
h=187,\qquad \mathrm{seq}=5h+3=938,\qquad 938\bmod 19=7.
\]

Current worker: **Calder**. Next: **Hale**.

Read before calculation:

- `Satobloc/HsH/BEDROCK.md`, complete through EOF; Git blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`.
- `Satobloc/HsH/STATE_OF_THE_THEORY.md`, complete through EOF; Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- `WORKSPACES/SABLE/INSTANCE_STRATIGRAPHY.md`, including `REV-005 — Calder`; blob `65de3c8e7e348755ef8fc6c3cffa67ea2d305221`.

Calder's recovered lane is adversarial empirical/statistical checking, null design, representation/covariance attention, and explicit exposure accounting. Current conversation access remains unverified; this packet uses that method without claiming chat delivery or restored jurisdiction.

Mersearch-first status: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, remains occupied by request `2026-10-11-orson-morrow-inspiral-package-001` with status `requested-retry`. It was not overwritten. Direct primary-source GitHub reading was therefore the recorded fallback; no Mersearch result is claimed.

The prior Aster publication was independently closed at the start of this run: issue #155 contains the Action receipt for commit `0e1a025ffbe7f72a8275f36ebec65af336c210a6`, and file readback matched SHA-256 `2f782b8b8360af410ed21cfd00aef861b367f263b7c573efe67a83d9f450468c`.

## Individual reading round

A deterministic draw using Python `random.Random(187)` over six verified substantial archive paths selected `PAXBOOK.txt`. I read lines 1-500 of `Satobloc/SAT_THEORY_ARCHIVE_2023-25/PAXBOOK.txt`; Git blob `1f8ecc5cb319246bcf73d0d269b87c21efde4aba`. The file continues, so this is a bounded substantial read, not full ingestion.

Privacy-safe takeaway: this is a retrospective conversation about an early personal notebook, mixing productivity flowcharts, creative writing, travel, language learning, and structural/philosophical speculation. It contains personal details and third-party information, so none are reproduced here. The relevant methodological lesson is that the record repeatedly separates a practical algorithm (task triage) from later interpretation; this supports Calder's insistence on testing the operation actually specified rather than a polished retrospective gloss.

## Recovered equation genealogy

All source dates below are honest: the archive paths identify the 2026 source family, but the fetched text does not state a finer creation date. Retrieval date is `2026-10-18`. Recurrence is not independent support.

### Variant A: inverse-square backbone

Verbatim equation:

```text
G/c^4 → 8π/ell_f^2
```

Locator: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, F2, section 7, “Gravitational Metric Anchor”; blob `1854995be3311f565739f2be64269cbb0385a82f`.

### Variant B: square retrodiction

Verbatim equation:

```text
G/c^4 → 8π ell_f^2
```

Locators:

- `SAT 2026 ROUNDUP DOCS/2026 BIG PAPER.txt`, “Newtonian Retrodiction” and later “Scale Anchor”; blob `5b5fe5ef35fe179910dc606babde8b547dd53ef6`.
- `PREDICTIONS/PREDICTION REASSESSMENT.txt`, section 3, explicitly classified there as “Known Wrong (Hard Fractures)”; blob `baa0921f14e4094d7dc82591828f66d8320ac6ca`.

### Executable implementation of Variant B

Verbatim code comments and equation:

```python
# ell_f from G:
# ell_f(G) = sqrt(G/(8*pi*c^4))
```

Locator: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_calculator.py`; blob `54d91ac574879836d1d770703cb894704c69512e`.

The inversion is algebraically consistent with Variant B if the arrow is treated as equality. It is inconsistent with Variant A. This packet does not choose between them by silently rewriting history; it tests both.

### He-3/Rydberg branch

Verbatim executable equation and defaults:

```python
F_HE3_DEFAULT = 8.665e8
ALPHA_DEFAULT = 7.2973525693e-3
ell_f = (h*c/(2*pi*f_He3*alpha^2))^(1/3)
```

Same calculator locator/blob as above. Historical/current text elsewhere associates `ell_f ≈ 0.7937 fm` with a first-order coil radius. Under live BEDROCK ND-2026-10-18-07, it is not automatically filament core thickness or an experimentally established electron radius.

## Assumptions and dimensional derivation

Use SI base exponents `(L,M,T)`:

\[
[G]=(3,-1,-2),\quad [c]=(1,0,-1),\quad [h]=(2,1,-1),\quad [f]=(0,0,-1).
\]

Then

\[
[G/c^4]=(-1,-1,2).
\]

But

\[
[\ell_f^2]=(2,0,0),\qquad [1/\ell_f^2]=(-2,0,0).
\]

Therefore neither Variant A nor Variant B is dimensionally homogeneous in SI.

For the He-3 branch, cube both sides so no fractional dimension exponents are needed:

\[
[\ell_f^3]=(3,0,0),
\]

whereas

\[
[hc/f]=(2,1,-1)+(1,0,-1)-(0,0,-1)=(3,1,-1).
\]

Thus the cube-root expression has dimensions

\[
L\,M^{1/3}T^{-1/3},
\]

not length.

The unique standard-SI completion of the Einstein coupling using a length and the already standard action scale is

\[
\frac{G}{c^4}=\frac{\ell_P^2}{\hbar c},
\qquad
\ell_P=\sqrt{\frac{\hbar G}{c^3}}.
\]

This is a **standard-physics comparator**, not a silent repair of SAT's nuclear-scale `ell_f`. Adding `\hbar c` changes the source equation's content. A natural-unit convention could hide dimensions, but it cannot then accept raw SI values for `G`, `c`, `h`, `f`, and femtometres without an explicit conversion map. No such map is supplied in these sources.

## Versioned external constants

NIST's complete **2022 CODATA adjustment** lists:

- `G = 6.67430(15) × 10^-11 m^3 kg^-1 s^-2`;
- `h = 6.62607015 × 10^-34 J Hz^-1` exact;
- `c = 299792458 m s^-1` exact;
- `alpha = 7.2973525643(11) × 10^-3`;
- `ell_P = 1.616255(18) × 10^-35 m`.

Official table: `https://physics.nist.gov/cuu/Constants/Table/allascii.txt`, header “2022 CODATA adjustment,” accessed `2026-10-18`.

## Executed numerical results

Python 3.12.14 executed successfully:

```text
DIMENSION TESTS
[G/c^4]                = Dim(L=-1, M=-1, T=2)
[ell^2]                = Dim(L=2, M=0, T=0)
[1/ell^2]              = Dim(L=-2, M=0, T=0)
[h*c/f]                = Dim(L=3, M=1, T=-1)
[ell^2/(hbar*c)]       = Dim(L=-1, M=-1, T=2)
[hbar*G/c^3]           = Dim(L=2, M=0, T=0)
dimension assertions: PASS

NUMERICAL TESTS
ell_from_G_raw          = 1.813182530615e-23
ell_He3_source_raw      = 8.815884247807e-11
ell_He3_CODATAalpha_raw = 8.815884251834e-11
asserted_ell            = 7.937000000000e-16 m
He3_raw/asserted        = 1.110732549806e+05
G_from_asserted_raw     = 1.278896597735e+05
G_from_raw/G_CODATA     = 1.916150903817e+15
Planck_calc             = 1.616255024424e-35 m
u(Planck_calc)          = 1.816207345067e-40 m
Planck_CODATA           = 1.616255000000e-35 m
u(Planck_CODATA)        = 1.800000000000e-40 m
Planck residual         = 2.442370521147e-43 m
Planck z (CODATA u)     = 0.001357
asserted/Planck         = 4.910735001593e+19
log10(asserted/Planck)  = 19.691146499
asserted-vs-Planck z    = 4.409444444444e+24

LIMIT/SIGN TESTS
He3 branch is positive for h,c,f,alpha > 0.
He3 branch scales f^(-1/3): infinity at f->0+, zero at f->infinity.
Gravity raw branch scales G^(1/2)c^(-2) and is positive for G,c>0.
All finite positive-input evaluations: PASS; dimensional interpretation: FAIL.
```

Interpretation:

1. The He-3 expression's raw SI number is `1.11073×10^5` times the asserted `0.7937 fm`; the small 2022-CODATA alpha update does not repair it.
2. Feeding `0.7937 fm` through Variant B's rearrangement gives a raw `G` number `1.91615×10^15` times CODATA `G`, before even addressing incompatible units.
3. The asserted nuclear scale is `4.91074×10^19` Planck lengths, reproducing the archive's qualitative “approximately 20 orders” warning.
4. The standard comparator `sqrt(hbar*G/c^3)` agrees with NIST's rounded Planck length to `0.001357` of NIST's stated standard uncertainty. This validates the audit code and constants; it does not validate SAT's `ell_f`.
5. No uncertainty for `f_He3=8.665e8` is supplied by the historical calculator, so an honest uncertainty-normalized He-3 residual cannot be computed. The dimensional failure is prior to uncertainty propagation.

## Algebra, limits, sign, topology, and prediction classification

| Test | Result | Exact discriminator |
|---|---|---|
| Variant A algebra | unresolved branch | conflicts with Variant B by `ell_f^4`; no source rule selects it |
| Variant B algebra | pass as symbol manipulation | calculator inversion matches Variant B |
| Variant A dimensions | fail | `(-1,-1,2) != (-2,0,0)` |
| Variant B dimensions | fail | `(-1,-1,2) != (2,0,0)` |
| He-3 dimensions | fail | `[hc/f]=(3,1,-1) != [ell^3]=(3,0,0)` |
| He-3 numerical reproduction | fail | raw ratio to `0.7937 fm` is `1.11073255×10^5` |
| Positive-input sign | pass | all radicals receive positive arguments |
| Limits | finite-domain behavior explicit | `f^-1/3`, `G^1/2`, and `c^-2` scalings |
| Topology | not defined | no map from winding/linking/worldtube data to either scale formula is supplied |
| Independent prediction | absent | `ell_f` is historically anchored/retrodicted; comparator is standard CODATA identity |

The earliest unsupported edge is the asserted identification of these dimensionful expressions with a length in SI. Collective attenuation or topology cannot repair that edge until a dimensionally explicit map and independently fixed parameters are supplied.

## BEDROCK comparison and verdict

- BR-001 requires ancestry without replacement: both `ell_f^-2` and `ell_f^2` variants remain in the genealogy.
- BR-003 keeps this packet tentative; no promotion occurs.
- ND-2026-10-18-03/05 require exact source recovery and correction of mathematics rather than polished repetition; the audit does so.
- ND-2026-10-18-07 distinguishes historical coil radius from core thickness and empirical particle radius.
- The translation guards prohibit treating recurrent `ell_f` or lattice language as settled. F2's 24-cell/lattice claims therefore cannot control the current calculation.

**Gate verdict:**

- Variant A: `UNRESOLVED` as genealogy, `REJECTED` as an SI coupling equation.
- Variant B and its calculator inversion: `REJECTED` as an SI length derivation.
- He-3/Rydberg branch: `REJECTED` as an SI length derivation and failed numerical reproduction.
- Planck-length completion: `CODATA_COMPARED`, but only as `STD/DERIVED` comparator, not a SAT correction or BEDROCK candidate.

Because the SAT candidates fail the basic internal gate, they do **not** enter ACTIVE CODATA VERIFICATION. Exact reopen conditions are: (i) an explicit unit convention and conversion map; (ii) a dimensionally homogeneous equation; (iii) a source-supported choice between `ell_f^2` and `ell_f^-2`; (iv) an independently fixed topology/attenuation map; and (v) a withheld observable not used to tune the scale.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Reproducible dimensional/numerical audit of two historical SAT scale formulas."""

from __future__ import annotations

from dataclasses import dataclass
from math import log10, pi, sqrt


@dataclass(frozen=True)
class Dim:
    """SI base exponents (L, M, T)."""

    L: int
    M: int
    T: int

    def __add__(self, other: "Dim") -> "Dim":
        return Dim(self.L + other.L, self.M + other.M, self.T + other.T)

    def __sub__(self, other: "Dim") -> "Dim":
        return Dim(self.L - other.L, self.M - other.M, self.T - other.T)

    def __mul__(self, n: int) -> "Dim":
        return Dim(n * self.L, n * self.M, n * self.T)


LENGTH = Dim(1, 0, 0)
G_DIM = Dim(3, -1, -2)
C_DIM = Dim(1, 0, -1)
H_DIM = Dim(2, 1, -1)
FREQ_DIM = Dim(0, 0, -1)

# 2022 CODATA / exact SI values.
C = 299_792_458.0
H = 6.626_070_15e-34
HBAR = H / (2.0 * pi)
G = 6.674_30e-11
U_G = 0.000_15e-11
ALPHA_2022 = 7.297_352_5643e-3
U_ALPHA_2022 = 0.000_000_0011e-3
PLANCK_LENGTH_2022 = 1.616_255e-35
U_PLANCK_LENGTH_2022 = 0.000_018e-35

# Historical calculator defaults / asserted scale.
F_HE3_SOURCE = 8.665e8
ALPHA_SOURCE = 7.297_352_5693e-3
ELL_ASSERTED = 0.7937e-15


def rel(x: float, ref: float) -> float:
    return x / ref


def main() -> None:
    dim_g_over_c4 = G_DIM - C_DIM * 4
    dim_ell2 = LENGTH * 2
    dim_inv_ell2 = LENGTH * -2
    dim_hc_over_f = H_DIM + C_DIM - FREQ_DIM
    dim_repaired_coeff = dim_ell2 - (H_DIM + C_DIM)
    dim_planck_sq = H_DIM + G_DIM - C_DIM * 3

    assert dim_g_over_c4 == Dim(-1, -1, 2)
    assert dim_g_over_c4 != dim_ell2
    assert dim_g_over_c4 != dim_inv_ell2
    assert dim_hc_over_f == Dim(3, 1, -1)
    assert dim_hc_over_f != LENGTH * 3
    assert dim_repaired_coeff == dim_g_over_c4
    assert dim_planck_sq == dim_ell2

    ell_from_g_raw = sqrt(G / (8.0 * pi * C**4))
    ell_he3_source_raw = (
        H * C / (2.0 * pi * F_HE3_SOURCE * ALPHA_SOURCE**2)
    ) ** (1.0 / 3.0)
    ell_he3_codata_alpha_raw = (
        H * C / (2.0 * pi * F_HE3_SOURCE * ALPHA_2022**2)
    ) ** (1.0 / 3.0)
    g_from_asserted_raw = 8.0 * pi * ELL_ASSERTED**2 * C**4
    ell_planck_calc = sqrt(HBAR * G / C**3)
    u_ell_planck_from_g = 0.5 * (U_G / G) * ell_planck_calc
    z_planck = (ell_planck_calc - PLANCK_LENGTH_2022) / U_PLANCK_LENGTH_2022
    z_asserted_vs_planck = (
        ELL_ASSERTED - PLANCK_LENGTH_2022
    ) / U_PLANCK_LENGTH_2022

    print("DIMENSION TESTS")
    print(f"[G/c^4]                = {dim_g_over_c4}")
    print(f"[ell^2]                = {dim_ell2}")
    print(f"[1/ell^2]              = {dim_inv_ell2}")
    print(f"[h*c/f]                = {dim_hc_over_f}")
    print(f"[ell^2/(hbar*c)]       = {dim_repaired_coeff}")
    print(f"[hbar*G/c^3]           = {dim_planck_sq}")
    print("dimension assertions: PASS")
    print()
    print("NUMERICAL TESTS")
    print(f"ell_from_G_raw          = {ell_from_g_raw:.12e}")
    print(f"ell_He3_source_raw      = {ell_he3_source_raw:.12e}")
    print(f"ell_He3_CODATAalpha_raw = {ell_he3_codata_alpha_raw:.12e}")
    print(f"asserted_ell            = {ELL_ASSERTED:.12e} m")
    print(f"He3_raw/asserted        = {rel(ell_he3_source_raw, ELL_ASSERTED):.12e}")
    print(f"G_from_asserted_raw     = {g_from_asserted_raw:.12e}")
    print(f"G_from_raw/G_CODATA     = {rel(g_from_asserted_raw, G):.12e}")
    print(f"Planck_calc             = {ell_planck_calc:.12e} m")
    print(f"u(Planck_calc)          = {u_ell_planck_from_g:.12e} m")
    print(f"Planck_CODATA           = {PLANCK_LENGTH_2022:.12e} m")
    print(f"u(Planck_CODATA)        = {U_PLANCK_LENGTH_2022:.12e} m")
    print(f"Planck residual         = {ell_planck_calc-PLANCK_LENGTH_2022:.12e} m")
    print(f"Planck z (CODATA u)     = {z_planck:.6f}")
    print(f"asserted/Planck         = {rel(ELL_ASSERTED, PLANCK_LENGTH_2022):.12e}")
    print(f"log10(asserted/Planck)  = {log10(rel(ELL_ASSERTED, PLANCK_LENGTH_2022)):.9f}")
    print(f"asserted-vs-Planck z    = {z_asserted_vs_planck:.12e}")
    print()
    print("LIMIT/SIGN TESTS")
    print("He3 branch is positive for h,c,f,alpha > 0.")
    print("He3 branch scales f^(-1/3): infinity at f->0+, zero at f->infinity.")
    print("Gravity raw branch scales G^(1/2)c^(-2) and is positive for G,c>0.")
    print("All finite positive-input evaluations: PASS; dimensional interpretation: FAIL.")


if __name__ == "__main__":
    main()
```

## Complete Lean source

No Lean executable is installed in this runtime (`command -v lean` returned empty). Therefore the following proof file is complete but **not compiler-tested here**. Its propositions are mirrored by the executed Python assertions above; no Lean success is claimed.

```lean
/- Dimensional audit mirror. This file uses only Lean core definitions. -/

structure Dim where
  L : Int
  M : Int
  T : Int
deriving DecidableEq, Repr

def add (a b : Dim) : Dim := ⟨a.L + b.L, a.M + b.M, a.T + b.T⟩
def sub (a b : Dim) : Dim := ⟨a.L - b.L, a.M - b.M, a.T - b.T⟩
def smul (n : Int) (a : Dim) : Dim := ⟨n * a.L, n * a.M, n * a.T⟩

def length : Dim := ⟨1, 0, 0⟩
def dimG : Dim := ⟨3, -1, -2⟩
def dimC : Dim := ⟨1, 0, -1⟩
def dimH : Dim := ⟨2, 1, -1⟩
def dimF : Dim := ⟨0, 0, -1⟩

-- Historical gravity formula does not equate like dimensions in SI.
example : sub dimG (smul 4 dimC) = ⟨-1, -1, 2⟩ := by decide
example : sub dimG (smul 4 dimC) ≠ smul 2 length := by decide
example : sub dimG (smul 4 dimC) ≠ smul (-2) length := by decide

-- Cubing the historical He-3 expression avoids fractional exponents.
example : sub (add dimH dimC) dimF = ⟨3, 1, -1⟩ := by decide
example : sub (add dimH dimC) dimF ≠ smul 3 length := by decide

-- SI repair used only as a standard-physics comparator.
-- [ell^2/(hbar*c)] = [G/c^4].
example : sub (smul 2 length) (add dimH dimC) = sub dimG (smul 4 dimC) := by decide

-- [hbar*G/c^3] = [ell^2], hence ell_P = sqrt(hbar*G/c^3).
example : sub (add dimH dimG) (smul 3 dimC) = smul 2 length := by decide
```

## Hale handoff

Recheck the `ell_f^-2` versus `ell_f^2` source split and seek an explicit unit/conversion convention; do not tune attenuation until dimensional closure exists.
