# EQ-0006 — D3 topological-mass audit

**Worker:** Mira  
**Status at early submission:** ALGEBRA PASS / DIMENSIONAL MASS CLAIM FAIL / BORROMEAN PAIRWISE COUNT FAIL / WRITHE-INVARIANT CLAIM FAIL / LEAN CI PENDING / NOT AN H(s)H CANDIDATE

## Primary historical source

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `SAT O Derivations/CODE-LOCKED DERIVS.txt`
- Locator: D3, summary lines 33–40 and expanded D3 lines 117–160
- Blob: `783b05d39d59bf854b92090e15d205e6823b51c8`
- File commit: `d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc`
- Commit date: `2025-10-27T01:15:21Z`
- Retrieval extent: complete file, 17,692 decoded characters / 448 split lines

Verbatim historical mathematics:

```tex
\ell_f = \left( \frac{2A}{T} \right)^{1/3}, \quad m_0 = \frac{T}{\ell_f}, \quad m(Q) = \frac{m_0}{Q}
Q = L_{\rm wind} + L_{\rm link} + W_{\rm writhe}
Q_{\rm neutrino}=1,\quad Q_{\rm meson}=2,\quad Q_{\rm baryon}=3.
\textbf{Borromean link (n=3):} triple-link invariants sum to 3 \Rightarrow Q=3.
```

The source also prints

```tex
Q=2 \Rightarrow m \approx 0.3968 A^{-1/3}T^{4/3},\qquad
Q=3 \Rightarrow m \approx 0.2646 A^{-1/3}T^{4/3}.
```

## Surviving algebra

Substitution is correct:

\[
m_0=\frac{T}{(2A/T)^{1/3}}
=2^{-1/3}A^{-1/3}T^{4/3}.
\]

Thus the exact coefficients are `2^(-1/3)/2 = 0.396850262992...` and
`2^(-1/3)/3 = 0.264566841995...`; the printed decimals are rounded correctly.

## Definite failures and corrections

1. If `T` is ordinary mechanical tension, `[T]=M L Tau^-2`, and `ell_f` is a
   length, the first equation forces `[A]=M L^4 Tau^-2`. Then
   `[T/ell_f]=M Tau^-2`, a spring constant, not mass. If `A` is instead standard
   bending rigidity with units force times length squared, the cube root has
   dimension `L^(2/3)`, not length. No unique mass repair follows. A mapping
   such as `T ell_f/c^2` would add an unprovided physical premise.

2. Borromean rings have all three pairwise Gauss linking numbers zero. Their
   nontriviality is detected by a higher invariant such as the Milnor triple
   invariant, whose magnitude is one under a standard normalization—not by
   pairwise invariants summing to three. Therefore the quoted implication is
   false as written.

3. Writhe is geometric and generally real-valued, not a topological integer.
   It changes continuously under smooth embedded deformations. Therefore a sum
   containing raw writhe is not automatically a quantized topological charge.

4. The formula is singular at `Q=0`; positive `m0` gives negative values for
   negative `Q`; and `m(Q)->0` as positive `Q->infinity`. A physical domain and
   orientation/sign convention are missing.

5. Pairwise linking of one-dimensional closed curves must be stated on a 3D
   slice. It is not a stable invariant of freely moving curves in full R4.

## Current terminology/status translation

Later `H(s)H 2026 STARTUP DOCS.txt`, blob
`68200d849152dcb0c4fc1814f8b1789d499ebca8`, lines 1651 and 1657–1659,
states that the fixed `Q<=3` rule and Borromean assignment are not current
primitives and that mass is not currently a fixed-Q formula. D3 is retained as
historical construction material; it is not declared superseded or erased.

## Executed Python output

```text
ell=(2A/T)^(1/3)=1.621672038119272
m0=T/ell=2.096601482962694
2^(-1/3)=0.793700525984100
Q=1: direct=2.096601482962694; scaling=2.096601482962694; residual=+4.441e-16
Q=2: direct=1.048300741481347; scaling=1.048300741481347; residual=+2.220e-16
Q=3: direct=0.698867160987565; scaling=0.698867160987565; residual=+2.220e-16
Q=7: direct=0.299514497566099; scaling=0.299514497566099; residual=+5.551e-17
required [A] for ell to be a length: (1, 4, -2)
[T/ell] under ordinary tension typing: (1, 0, -2)
mass dimension: (1, 0, 0)
ell dimension if A is standard bending rigidity: (0, 2/3, 0)
Hopf pairwise linking: (1,)
Borromean pairwise linking: (0, 0, 0) sum= 0 Milnor |mu123|= 1
epsilon=0.0: approximate writhe=0.000000000000
epsilon=0.1: approximate writhe=0.000018405802
epsilon=0.2: approximate writhe=0.000432880706
epsilon=0.4: approximate writhe=0.005696254921
epsilon=0.8: approximate writhe=0.029868024982
writhe convergence at epsilon=0.4: 0.005686505025 0.005694590572 0.005696872496
ALL ASSERTIONS PASS
```

The writhe fixture is a smooth embedded deformation because its `(x,y)`
projection remains the unit circle. Its continuously varying noninteger writhe
is a numerical counterexample to treating raw writhe as a topological integer.

## Lean target

Lean formalizes the surviving Q=2 and Q=3 ratio algebra, the nonzero time
exponent in the dimensional mismatch, and the impossibility that three
vanishing pairwise linking numbers sum to three. It does not formalize the
classification of Borromean links or the numerical Gauss integral.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0006

theorem q_two_ratio (m0 m2 : ℝ) (h : m2 = m0 / 2) :
    2 * m2 = m0 := by
  linarith

theorem q_three_ratio (m0 m3 : ℝ) (h : m3 = m0 / 3) :
    3 * m3 = m0 := by
  linarith

theorem time_exponent_mismatch : (-2 : ℤ) ≠ 0 := by
  norm_num

theorem borromean_pairwise_sum_not_three
    (l12 l23 l31 : ℤ)
    (h12 : l12 = 0) (h23 : l23 = 0) (h31 : l31 = 0) :
    l12 + l23 + l31 ≠ 3 := by
  omega

end HsHVerification.ArchiveEQ0006
```

## Reading round

- Live `BEDROCK.md`: complete retrieval, 548 lines / 82,842 characters; blob
  `aa5d236354258f4c4715f5cf77bff2c5db602cfd`; controlling ND-2026-10-18-03
  and promotion boundaries inspected.
- `STATE_OF_THE_THEORY.md`: complete retrieval, 155 lines / 11,012 characters;
  blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; subordinate status retained.
- Random substantial archive read: the first draw selected a short 83-line OCR
  caption record and was rejected as non-substantial. A real second
  `secrets.randbelow` draw selected
  `_AUTO_EXTRACTED_TEXT/SAT PARTICLE ZOO LAGRANGIAN (nolattice).txt`, blob
  `d3ba17b60d87c379618c2ad8cb1a9188bb2e9db9`; complete retrieval was 2,995
  lines / 124,075 characters, with the opening 5,000 characters and equation
  sections inspected. Honest takeaway: the document explicitly marks itself
  tentative and distinguishes a concrete 4D curve from a field ontology; it
  is useful as a historical parametrization/toolbox source but not as evidence
  for D3's mass typing or fixed-Q assignment.

## Gate and exact discriminator

CODATA comparison is inadmissible. No quantity has the type of mass under the
declared tension/length interpretation, and `A`, `T`, `Q`, uncertainties, and a
held-out observable are not independently supplied.

To reopen the construction, define the units and operational measurement of
`A` and `T`; specify a dimensionally valid energy-to-mass map; replace raw
writhe and the Borromean pairwise count with a declared invariant on a declared
3D slice or finite-core worldtube; and predict at least one held-out mass ratio
without using particle-family labels to set `Q`.
