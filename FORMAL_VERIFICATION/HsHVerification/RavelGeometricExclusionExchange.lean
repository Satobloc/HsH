import Mathlib

/-!
# Ravel: geometric hard-core exclusion does not select fermionic exchange parity

## Source boundary

Nathan Direct, Ravel / Syncmathcek conversation
`6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`, raw export SHA-256
`b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`:

- User message `c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e`,
  2026-09-07T08:28:03.333Z: proposes Kerr-core / ultimate exclusion,
  coil semi-permeability / ordinary-Pauli-like exclusion, shell /
  closed-string, and shell-deformation / string-vibration correspondences.
  The wording is exploratory, not an established equivalence.
- User message `496a15ea-0263-459d-b815-908f52155b90`,
  2026-09-07T10:06:12.842Z: distinguishes the reduced 3D diagram,
  full 4D bulk, and actual 4D view with a 3D slice.

The current Ravel source-fidelity report records the correspondence as a
hypothesis requiring a state-space and exchange/statistics map:
`WORKSPACES/RAVEL/2026-11-23T0500Z_H1037_S0_KERR_CORE_COIL_PERIODICITY_PAULI_STRING_FIDELITY.md`.

## Formal question

Does a bare hard-core condition (zero amplitude on the coincident
configuration diagonal) determine fermionic exchange antisymmetry?

No. The finite two-label configuration space below supplies two nonzero
amplitudes with the same hard-core condition: one is exchange-even and
the other exchange-odd. Thus diagonal exclusion alone does not select the
fermionic sign. Conversely, exchange-odd antisymmetry forces diagonal
vanishing over the encoded real scalar field.

This is an abstract finite algebraic counterexample, not a physical
fixture, a Hilbert-space model, a spin-statistics derivation, or evidence
that the H(s)H core is bosonic or fermionic. The actual geometric-core to
quantum-state map, exchange action, spin structure, and measured
consequences remain unspecified.

Lean checks only these exact conditional statements.
-/

namespace HsHVerification.RavelGeometricExclusionExchange

abbrev Configuration := Fin 2 × Fin 2

/-- Exchange the two configuration labels. -/
def exchange (x : Configuration) : Configuration :=
  (x.2, x.1)

/-- Minimal hard-core analogue: amplitude vanishes on the coincidence diagonal. -/
def HardCore (psi : Configuration → ℤ) : Prop :=
  ∀ i : Fin 2, psi (i, i) = 0

/-- Exchange-even (symmetric) amplitude. -/
def ExchangeEven (psi : Configuration → ℤ) : Prop :=
  ∀ i j : Fin 2, psi (exchange (i, j)) = psi (i, j)

/-- Exchange-odd (antisymmetric) amplitude. -/
def ExchangeOdd (psi : Configuration → ℤ) : Prop :=
  ∀ i j : Fin 2, psi (exchange (i, j)) = -psi (i, j)

/-- A nonzero exchange-even amplitude that vanishes on coincidence. -/
def hardCoreEvenWitness (x : Configuration) : ℤ :=
  if x.1 = x.2 then 0 else 1

/-- A nonzero exchange-odd amplitude that also vanishes on coincidence. -/
def hardCoreOddWitness (x : Configuration) : ℤ :=
  if x = ((0 : Fin 2), (1 : Fin 2)) then 1
  else if x = ((1 : Fin 2), (0 : Fin 2)) then -1
  else 0

theorem exchange_involutive (x : Configuration) :
    exchange (exchange x) = x := by
  cases x
  rfl

theorem exchangeOdd_forces_hardCore
    (psi : Configuration → ℤ)
    (hOdd : ExchangeOdd psi) :
    HardCore psi := by
  intro i
  have h := hOdd i i
  simp [exchange] at h
  linarith

theorem hardCoreEvenWitness_hardCore :
    HardCore hardCoreEvenWitness := by
  intro i
  simp [hardCoreEvenWitness]

theorem hardCoreEvenWitness_exchangeEven :
    ExchangeEven hardCoreEvenWitness := by
  intro i j
  simp [hardCoreEvenWitness, exchange, eq_comm]

theorem hardCoreEvenWitness_nonzero :
    hardCoreEvenWitness ((0 : Fin 2), (1 : Fin 2)) = 1 := by
  norm_num [hardCoreEvenWitness]

theorem hardCoreOddWitness_hardCore :
    HardCore hardCoreOddWitness := by
  intro i
  fin_cases i <;> norm_num [hardCoreOddWitness]

theorem hardCoreOddWitness_exchangeOdd :
    ExchangeOdd hardCoreOddWitness := by
  intro i j
  fin_cases i <;> fin_cases j <;>
    norm_num [ExchangeOdd, hardCoreOddWitness, exchange]

theorem hardCoreOddWitness_nonzero :
    hardCoreOddWitness ((0 : Fin 2), (1 : Fin 2)) = 1 := by
  norm_num [hardCoreOddWitness]

/--
The same hard-core diagonal condition admits nonzero exchange-even and
exchange-odd amplitudes. Therefore it does not determine exchange parity.
-/
theorem hardCore_does_not_select_exchange_parity :
    (∃ psi, HardCore psi ∧ ExchangeEven psi ∧
      psi ((0 : Fin 2), (1 : Fin 2)) ≠ 0) ∧
    (∃ psi, HardCore psi ∧ ExchangeOdd psi ∧
      psi ((0 : Fin 2), (1 : Fin 2)) ≠ 0) := by
  constructor
  · exact ⟨hardCoreEvenWitness,
      hardCoreEvenWitness_hardCore,
      hardCoreEvenWitness_exchangeEven,
      by norm_num [hardCoreEvenWitness]⟩
  · exact ⟨hardCoreOddWitness,
      hardCoreOddWitness_hardCore,
      hardCoreOddWitness_exchangeOdd,
      by norm_num [hardCoreOddWitness]⟩

/-- The even witness is explicitly not exchange-odd. -/
theorem hardCoreEvenWitness_not_exchangeOdd :
    ¬ ExchangeOdd hardCoreEvenWitness := by
  intro h
  have h01 := h (0 : Fin 2) (1 : Fin 2)
  norm_num [ExchangeOdd, hardCoreEvenWitness, exchange] at h01

/-- Quadratic diagonal of a 2×2 bilinear coefficient matrix. -/
def quadraticDiagonal (a00 a01 a10 a11 x y : ℤ) : ℤ :=
  a00 * x * x + a01 * x * y + a10 * y * x + a11 * y * y

/--
If the diagonal quadratic vanishes for every superposition (x,y), the
2×2 coefficient matrix is skew-symmetric. This is the finite-dimensional
polarization gate: a single fixed-basis diagonal test is weaker.
-/
theorem allSuperpositionDiagonalZero_forces_skew
    (a00 a01 a10 a11 : ℤ)
    (h : ∀ x y : ℤ, quadraticDiagonal a00 a01 a10 a11 x y = 0) :
    a00 = 0 ∧ a11 = 0 ∧ a01 + a10 = 0 := by
  have h00 := h 1 0
  have h11 := h 0 1
  have hsum := h 1 1
  norm_num [quadraticDiagonal] at h00 h11 hsum
  constructor
  · exact h00
  · constructor
    · exact h11
    · omega

#eval (hardCoreEvenWitness ((0 : Fin 2), (1 : Fin 2)),
       hardCoreOddWitness ((0 : Fin 2), (1 : Fin 2)))

#print axioms exchangeOdd_forces_hardCore
#print axioms hardCore_does_not_select_exchange_parity
#print axioms hardCoreEvenWitness_not_exchangeOdd
#print axioms allSuperpositionDiagonalZero_forces_skew

end HsHVerification.RavelGeometricExclusionExchange
