# Mercer source-and-test packet: the historical SAT gravitational-recovery chain

**Status:** tentative archive audit; not BEDROCK, not established physics, and not an independent prediction.  Selected worker: Mercer. Next handoff: Ravel.

## Result

The recovered chain contains three different quantities that have all been described as attenuation:

1. an older **linear** coefficient multiplying a raw gravitational scale;
2. an amplitude-like `rho_embed` whose **square** enters `G`;
3. a later `Omega_total` multiplying `c^2(m0/ell_f)`.

They cannot be identified without an explicit map. The squared-rho expression

`G = rho_embed^2 * c^2 * ell_f / m0`

has the correct SI dimensions. However, it does **not** reproduce 2022 CODATA when the other archived values are enforced. With `ell_f=0.7937 fm`, `rho_embed=1e-19`, and the archived `m0=1.0073e-27 kg`, it gives `7.081723273736e-10`, which is `10.6104359614` times CODATA. If `m0` is instead derived from the archived linked relation `hbar=m0*c*ell_f*B`, the prediction is `3.842466583441e-10` for `B0=3/(4*pi)` or `3.891357389770e-10` for `Bstable=0.24177`, factors `5.75710798652` and `5.83036032209` high.

The later expression

`G = c^2 * (m0/ell_f) * Omega_total`

has force dimensions if `Omega_total` is dimensionless. It can have dimensions of `G` only if `Omega_total` carries `m^2 kg^-2`. The archived number `9.4e-40` has no recorded units in the recovered passage, so this branch fails the dimensional gate as written. It is retained, not silently corrected.

## Source record and reading extent

- Live `Satobloc/HsH/BEDROCK.md`: full sequential read, blob `91e8c7b0b4de6df2469173695ff97c63e6cba144`. Controlling checks used here include BR-007 (Mersearch-first), BR-008 (coordinate/measurement artifacts), ND-2026-10-18-03 (history recovery and CODATA verification), ND-2026-10-20-01 (native near-Minkowski build before law assignment), and the no-promotion/no-substitution controls. No BEDROCK text was edited.
- Live subordinate `Satobloc/HsH/STATE_OF_THE_THEORY.md`: full sequential read, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Mercer continuity: `WORKSPACES/MERCER/CONTINUITY_HANDOFF_2026-10-09_CONVERSATION_CUTOFF.md`, full read, blob `b3a1487a10f36dbbbaa6eb02074b0fda0091d8b1`.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt`, full returned file (requested lines 1-160), blob `c29c49b697208294d705b0a280d91808a57edc66`, dated by filename May 2026. It preserves the original equations and numerical claims.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_CONCEPTS__May2026.txt`, full returned file (requested lines 1-420), blob `47660297bec8e95c1d2e3e9a727cec63793d14b5`, dated by filename May 2026. It supplies `m0≈1.0073e-27 kg` and calls `rho_embed≈1e-19` a statistical lattice filter.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Misc HsH-SAT/SAT STUFF.txt`, lines 1-80, blob `7a32c1215a6c701955e5c74161497ac843c6802c`. Internal conversation marker: “Monday, May 18”; year is not stated in the returned passage. It preserves the linked `hbar`, `G`, `rho_embed`, and `m0` statements.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt`, sequentially requested through lines 1-2100 with focused reread of 1381-1460 and 1541-1620, blob `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`; header says Nov. 15, 2024, but the file is a later mixed transcript. It explicitly records the old `G_raw` arithmetic error and the change from about `1e-21` to about `1e-16` for a *linear* attenuation branch.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026 MATH REVAMP TAKE 1.txt`, targeted reads 1-500, 1200-2700, and 2701-2760, blob `399e194475ba55294202ea175b9f5d56f227c3c5`, dated 2026. Lines 2601-2700 preserve `G=c²(m0/ell_f)Omega_total`, `Omega_total≈9.4e-40`; lines 2701-2760 classify it as candidate recovery and warn that otherwise it functions like inserted attenuation.
- Individual archive round: `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Bogothian perspective analysis — raw.json`, lines 1-220, blob `2f98cd9710070c7af4a7df6e943571f641dd108d`. Honest takeaway: this is alternate-history/fictional worldbuilding containing source-assisted and generated historical extrapolation. It has no authority for SAT/H(s)H physics; private residential material encountered elsewhere in the same archive family was neither extracted nor republished.

The shared Mersearch request slot was occupied by an unrelated live request, so it was not overwritten. Repository code search was used as the explicitly disclosed fallback; no Mersearch result is claimed.

## Verbatim mathematical record

From `MAY_2026_SNAPSHOT.txt`:

```text
ℏ = m_0 c ℓ_f B ≈ 1.054 × 10^-34 J·s.
G = ρ_embed^2 · (c^2 ℓ_f / m_0) ≈ 6.674 × 10^-11 m³/(kg·s²),
where ρ_embed ≈ 10^-19 is the lattice attenuation coefficient.
```

From `2026 MATH REVAMP TAKE 1.txt`, lines 2601-2700:

```text
Archive:
G=c²(m_0/ℓ_f)Ω_total
Ω_total≈9.4×10^-40
```

From `SAT PRE-H(s)H TIGHTENING.txt`, lines 1381-1460, preserving the file's own correction:

```text
Finding: The "convincing" alignment of the 10^-21 factor is predicated on a
calculation error in the initial tension. If the math is corrected, the
required attenuation is 10^-16, which breaks the "Power-of-Twelve" link.
```

That last correction belongs to the older linear branch `G_observed=G_raw*rho_embed`; it is **not** a justified replacement for the amplitude `rho_embed` in the later squared-rho formula.

## Algebra and dimensional audit

Let `[M]`, `[L]`, `[T]` denote mass, length, and time dimensions. Then

`[c]=L T^-1`, `[ell_f]=L`, `[m0]=M`, and `[rho_embed]=1` in the recovered squared-rho presentation. Therefore

`[rho_embed^2 c^2 ell_f/m0] = L^3 M^-1 T^-2 = [G]`.

The linked Planck relation has

`[m0 c ell_f B] = M L^2 T^-1 = [hbar]`

when `B` is dimensionless. Eliminating `m0` gives

`m0 = hbar/(c ell_f B)`

and

`G_linked = rho_embed^2 c^3 ell_f^2 B / hbar`.

This is the independent cross-check: once `rho_embed`, `ell_f`, and `B` are fixed, `G` is no longer separately adjustable through `m0`.

For the second branch, if `Omega_total` is dimensionless,

`[c^2(m0/ell_f)Omega_total] = M L T^-2`,

which is force, not `G`. The missing dimension is

`[Omega_total] = [G]/[c^2 m0/ell_f] = L^2 M^-2`.

### Sign, limits, topology, and identifiability

- `G(rho)=G(-rho)`: the sign of `rho_embed` is unidentifiable.
- `rho_embed -> 0` gives `G -> 0`; `ell_f -> 0` gives `G -> 0`; `m0 -> 0+` makes the formula diverge.
- With positive `ell_f,m0`, the squared-rho branch cannot produce negative `G`.
- The formula contains no topological invariant. Calling `rho_embed` a lattice or overlap filter does not itself derive it from topology.
- For any positive target `G*`, choosing `rho_embed=sqrt(G* m0/(c^2 ell_f))` fits it exactly. Thus agreement after choosing `rho_embed` is a tuned fit unless `rho_embed` is independently derived and frozen before comparison.

## CODATA-2022 test

Comparison values: `c=299792458 m/s` exact; `hbar=1.054571817...e-34 J s` exact; `G=6.67430(15)e-11 m^3 kg^-1 s^-2`. The historical source supplies no uncertainties for `ell_f`, `rho_embed`, `m0`, or `B`; therefore the displayed “CODATA-only z” values are diagnostics, not valid total-significance claims.

| Case | Calculated value | Ratio to CODATA | Relative residual | Required `rho_embed` |
|---|---:|---:|---:|---:|
| archived `m0=1.0073e-27 kg` | `7.081723273736e-10` | `10.6104359614` | `+9.610435961428` | `3.069964727952e-20` |
| `m0` from `hbar`, `B0=3/(4pi)` | `3.842466583441e-10` | `5.75710798652` | `+4.757107986517` | `4.167713072543e-20` |
| `m0` from `hbar`, `Bstable=0.24177` | `3.891357389770e-10` | `5.83036032209` | `+4.830360322086` | `4.141448854045e-20` |

The required `rho_embed` values are posterior fits. They are not predictions.

For the second branch, inserting the archived numbers as written yields `1.072189903048e-34`, but its unit is newtons if `Omega_total` is dimensionless, so comparing that number to CODATA `G` is invalid. To restore dimensions and match CODATA with archived `m0`, `Omega_total` would have to be `5.851427981336e-16 m^2 kg^-2`, not a bare `9.4e-40`.

## Disposition against live BEDROCK

- **Pass:** the squared-rho expression is dimensionally valid and has clear sign/limit behavior.
- **Fail:** the linked archived values do not reproduce CODATA; the claimed near-equality is not numerically self-consistent.
- **Fail as written:** the `Omega_total` expression lacks the units needed to be `G`.
- **Unresolved:** the old linear attenuation, later squared amplitude, and `Omega_total` overlap have no demonstrated conversion map.
- **Conflict with current controls:** the explanatory lattice is not a current primitive; `m0`, `ell_f`, `B`, and the attenuation/overlap factor remain unrecovered under the current native hierarchy. Assigning Newtonian gravity before constructing the native near-Minkowski metric/measurement map would violate ND-2026-10-20-01 and BR-008.

No correction is promoted. The only uniquely justified corrections here are arithmetic/dimensional statements: the archived numbers do not yield the displayed `G`, and a dimensionless `Omega_total` cannot repair the second formula.

## Exact discriminator for continuation

Before another CODATA comparison, derive one of these from current primitives without using `G` as an input:

1. an amplitude `rho_amp` with a proof that power/force suppression is `rho_amp^2`; or
2. a linear suppression `rho_force`; or
3. a dimensionful overlap `Omega_total` with units `m^2 kg^-2`.

Then freeze it, freeze `ell_f` and `m0`, and predict `G`. Until that happens, the branch is a parameterized recovery, not an independent prediction.

## Executed Python source

```python
#!/usr/bin/env python3
from dataclasses import dataclass
from math import pi, sqrt

@dataclass(frozen=True)
class Dim:
    kg: int = 0
    m: int = 0
    s: int = 0
    def __mul__(self, other): return Dim(self.kg+other.kg,self.m+other.m,self.s+other.s)
    def __truediv__(self, other): return Dim(self.kg-other.kg,self.m-other.m,self.s-other.s)
    def __pow__(self, n): return Dim(self.kg*n,self.m*n,self.s*n)

ONE=Dim(); MASS=Dim(kg=1); LENGTH=Dim(m=1); TIME=Dim(s=1)
C_DIM=LENGTH/TIME; HBAR_DIM=MASS*LENGTH**2/TIME
G_DIM=LENGTH**3/(MASS*TIME**2)

def g_rho(rho,c,ell,m0): return rho**2*c**2*ell/m0
def m_from_hbar(hbar,c,ell,B): return hbar/(c*ell*B)
def rho_required(G,c,ell,m0): return sqrt(G*m0/(c**2*ell))
def omega_required(G,c,ell,m0): return G*ell/(c**2*m0)

def report(label,value,target,sigma):
    residual=value-target
    print(f"{label}: {value:.12e}")
    print(f"  ratio_to_CODATA = {value/target:.12g}")
    print(f"  relative_residual = {residual/target:+.12e}")
    print(f"  CODATA-only z = {residual/sigma:+.12e}")

def main():
    ell=0.7937e-15; rho=1.0e-19; m0_archive=1.0073e-27
    B0=3.0/(4.0*pi); Bstable=0.24177; omega_archive=9.4e-40
    c=299_792_458.0; hbar=1.054_571_817e-34
    G=6.67430e-11; uG=0.00015e-11
    dim_g_rho=ONE**2*C_DIM**2*LENGTH/MASS
    dim_g_omega=C_DIM**2*MASS/LENGTH*ONE
    omega_dim_needed=G_DIM/(C_DIM**2*MASS/LENGTH)
    print("DIMENSION TESTS")
    print("rho^2 c^2 ell/m0 has G dimensions:",dim_g_rho==G_DIM,dim_g_rho)
    print("c^2(m0/ell)Omega with dimensionless Omega has G dimensions:",dim_g_omega==G_DIM,dim_g_omega)
    print("Omega dimension required for second formula:",omega_dim_needed)
    print("\nARCHIVED INPUTS")
    print(f"ell = {ell:.12e} m\nrho = {rho:.12e}\nm0_archive = {m0_archive:.12e} kg")
    print(f"B0 = {B0:.12e}; Bstable = {Bstable:.12e}")
    print("\nDIRECT ARCHIVE m0 TEST")
    direct=g_rho(rho,c,ell,m0_archive); report("G(rho=1e-19, archive m0)",direct,G,uG)
    print(f"rho required after fixing archive m0 = {rho_required(G,c,ell,m0_archive):.12e}")
    print("\nLINKED hbar -> m0 -> G TESTS")
    for name,B in (("B0",B0),("Bstable",Bstable)):
        m0=m_from_hbar(hbar,c,ell,B); linked=g_rho(rho,c,ell,m0)
        print(f"{name}: m0_from_hbar = {m0:.12e} kg")
        report(f"{name}: linked G",linked,G,uG)
        print(f"  rho required = {rho_required(G,c,ell,m0):.12e}")
    print("\nSECOND ARCHIVE FORMULA")
    g2=c**2*(m0_archive/ell)*omega_archive
    print(f"c^2(m0/ell)Omega_archive = {g2:.12e} [force if Omega dimensionless]")
    print(f"numerical ratio to CODATA G = {g2/G:.12e} (unit comparison invalid)")
    print(f"Omega required with units m^2/kg^2 = {omega_required(G,c,ell,m0_archive):.12e}")
    eps=1e-6
    assert abs(g_rho(rho*(1+eps),c,ell,m0_archive)/direct-(1+eps)**2)<1e-14
    assert g_rho(-rho,c,ell,m0_archive)==direct
    assert g_rho(0,c,ell,m0_archive)==0
    assert g_rho(rho,c,2*ell,m0_archive)==2*direct
    assert g_rho(rho,c,ell,2*m0_archive)==0.5*direct
    assert abs(g_rho(rho_required(G,c,ell,m0_archive),c,ell,m0_archive)/G-1)<1e-15
    print("\nASSERTIONS: PASS (rho-even sign, rho->0, ell/m0 scaling, exact fitted-rho identity)")

if __name__=="__main__": main()
```

## Actual Python output

```text
DIMENSION TESTS
rho^2 c^2 ell/m0 has G dimensions: True Dim(kg=-1, m=3, s=-2)
c^2(m0/ell)Omega with dimensionless Omega has G dimensions: False Dim(kg=1, m=1, s=-2)
Omega dimension required for second formula: Dim(kg=-2, m=2, s=0)

ARCHIVED INPUTS
ell = 7.937000000000e-16 m
rho = 1.000000000000e-19
m0_archive = 1.007300000000e-27 kg
B0 = 2.387324146378e-01; Bstable = 2.417700000000e-01

DIRECT ARCHIVE m0 TEST
G(rho=1e-19, archive m0): 7.081723273736e-10
  ratio_to_CODATA = 10.6104359614
  relative_residual = +9.610435961428e+00
  CODATA-only z = +4.276195515824e+05
rho required after fixing archive m0 = 3.069964727952e-20

LINKED hbar -> m0 -> G TESTS
B0: m0_from_hbar = 1.856468937004e-27 kg
B0: linked G: 3.842466583441e-10
  ratio_to_CODATA = 5.75710798652
  relative_residual = +4.757107986517e+00
  CODATA-only z = +2.116691055627e+05
  rho required = 4.167713072543e-20
Bstable: m0_from_hbar = 1.833144360471e-27 kg
Bstable: linked G: 3.891357389770e-10
  ratio_to_CODATA = 5.83036032209
  relative_residual = +4.830360322086e+00
  CODATA-only z = +2.149284926513e+05
  rho required = 4.141448854045e-20

SECOND ARCHIVE FORMULA
c^2(m0/ell)Omega_archive = 1.072189903048e-34 [force if Omega dimensionless]
numerical ratio to CODATA G = 1.606445474504e-24 (unit comparison invalid)
Omega required with units m^2/kg^2 = 5.851427981336e-16

ASSERTIONS: PASS (rho-even sign, rho->0, ell/m0 scaling, exact fitted-rho identity)
```

## Complete Lean source (not executed)

Lean was not installed in this runtime; the file below is therefore explicitly **untested**, while the Python program above was executed.

```lean
import Mathlib

noncomputable section

def gRho (rho c ell m : ℝ) : ℝ := rho^2 * (c^2 * ell / m)
def mFromHbar (hbar c ell B : ℝ) : ℝ := hbar / (c * ell * B)

theorem gRho_even (rho c ell m : ℝ) :
    gRho (-rho) c ell m = gRho rho c ell m := by
  simp [gRho]

theorem gRho_zero (c ell m : ℝ) : gRho 0 c ell m = 0 := by
  simp [gRho]

theorem gRho_nonneg
    (rho c ell m : ℝ) (hell : 0 ≤ ell) (hm : 0 < m) :
    0 ≤ gRho rho c ell m := by
  unfold gRho
  positivity

theorem linked_substitution
    (rho c ell B hbar : ℝ)
    (hc : c ≠ 0) (hell : ell ≠ 0) (hB : B ≠ 0) (hh : hbar ≠ 0) :
    gRho rho c ell (mFromHbar hbar c ell B) =
      rho^2 * c^3 * ell^2 * B / hbar := by
  field_simp [gRho, mFromHbar]
  ring

theorem fit_identity
    (G c ell m rho : ℝ)
    (hc : c ≠ 0) (hell : ell ≠ 0) (hm : m ≠ 0)
    (hfit : rho^2 = G * m / (c^2 * ell)) :
    gRho rho c ell m = G := by
  rw [gRho, hfit]
  field_simp
  ring

end
```

## One-line handoff

Ravel: construct a unit-carrying native overlap functional before any new fit; explicitly decide whether attenuation is amplitude, power/force, or dimensionful overlap, and do not reuse CODATA `G` in that derivation.
