import Mathlib

/-!
# Riley-polynomial presentation dependence

Source: Teruaki Kitano and Takayuki Morifuji, "A Note on Riley Polynomials
of 2-Bridge Knots", Example 2.1. The paper gives distinct Riley polynomials
for the equivalent 2-bridge knots S(7,3) and S(7,5).

The predicate below records only the inverse-congruence witness
beta * beta' congruent to 1 modulo alpha. It is not a formalization of
knot-group equivalence, the Riley representation theorem, or the topology
of knot complements. Those are external source premises.

This module proves the arithmetic counterexample conditional on that
source criterion. It does not construct an H(s)H filament map or derive
any physical constant.
-/

namespace HsHVerification

structure TwoBridgePresentation where
  alpha : ℕ
  beta : ℕ
  rileyPolynomial : Polynomial ℤ

/-- The inverse-congruence branch of the standard 2-bridge equivalence criterion.
This is a sufficient witness for the cited pair, not the full equivalence relation. -/
def inverseBranchWitness (p q : TwoBridgePresentation) : Prop :=
  p.alpha = q.alpha ∧
    0 < p.alpha ∧
    (p.beta * q.beta) % p.alpha = 1

/-- The two source presentations and their source-stated Riley polynomials. -/
def s73 : TwoBridgePresentation :=
  ⟨7, 3, 1 - 2 * Polynomial.X + Polynomial.X ^ 2 - Polynomial.X ^ 3⟩

def s75 : TwoBridgePresentation :=
  ⟨7, 5, 1 - 2 * Polynomial.X - 3 * Polynomial.X ^ 2 - Polynomial.X ^ 3⟩

theorem s73_s75_inverse_branch :
    inverseBranchWitness s73 s75 := by
  norm_num [inverseBranchWitness, s73, s75]

theorem s73_eval_one :
    Polynomial.eval (1 : ℤ) s73.rileyPolynomial = -1 := by
  norm_num [s73]

theorem s75_eval_one :
    Polynomial.eval (1 : ℤ) s75.rileyPolynomial = -5 := by
  norm_num [s75]

theorem s73_s75_riley_polynomials_differ :
    s73.rileyPolynomial ≠ s75.rileyPolynomial := by
  intro h
  have hEval :
      Polynomial.eval (1 : ℤ) s73.rileyPolynomial =
        Polynomial.eval (1 : ℤ) s75.rileyPolynomial :=
    congrArg (fun p : Polynomial ℤ => Polynomial.eval (1 : ℤ) p) h
  rw [s73_eval_one, s75_eval_one] at hEval
  norm_num at hEval

/-- The source's raw presentation polynomial is not constant on the cited
inverse-congruence witness. A canonical representative or quotient-level
invariant would require an additional construction. -/
theorem riley_polynomial_not_invariant_on_inverse_branch :
    ¬ ∀ p q : TwoBridgePresentation,
      inverseBranchWitness p q →
      p.rileyPolynomial = q.rileyPolynomial := by
  intro hInvariant
  exact s73_s75_riley_polynomials_differ
    (hInvariant s73 s75 s73_s75_inverse_branch)

#print axioms s73_s75_inverse_branch
#print axioms s73_eval_one
#print axioms s75_eval_one
#print axioms s73_s75_riley_polynomials_differ
#print axioms riley_polynomial_not_invariant_on_inverse_branch

end HsHVerification
