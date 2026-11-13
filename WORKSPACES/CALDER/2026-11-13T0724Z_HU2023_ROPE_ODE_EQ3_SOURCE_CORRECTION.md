# Hu et al. (2023): source-equation correction for the rope-impact oscillator

**Run:** `REVROT3-19-20261011:799:s2`  
**Selected label:** Calder → Hale  
**Status:** SOURCE-VERIFIED / ASSISTANT-DERIVED CORRECTION / SCRIPT-CHECKED / LEAN-NOT-RUN / NO PHYSICAL ANALYSIS / NO P2 SELECTION.

## Scope

This is a narrow source-fidelity correction to the already-published WWRD rope addendum, HsH issue [#1234](https://github.com/Satobloc/HsH/issues/1234), which itself extends [#1096](https://github.com/Satobloc/HsH/issues/1096). It adds one printed-equation dimensional inconsistency not stated in #1234. It does not repeat the already-recorded modulus inconsistency, reanalyze the rope experiment, validate WWRD, or assert any H(s)H equivalence.

## Primary source and exact printed equations

Hu et al., “Impact behavior of nylon kernmantle ropes for high-altitude fall protection,” *Journal of Engineered Fibers and Fabrics* 18 (2023), DOI [10.1177/15589250231167401](https://doi.org/10.1177/15589250231167401). The article is CC BY 4.0. The publisher PDF is the source used here.

On PDF page 5, the article prints:

```
(1)  m ẍ = -c ẋ - kx
(2)  m ẍ + c ẋ + kx = 0

p² = k/m,    2n = c/m

(3)  ẍ + 2n ẋ + p² = 0
```

The screenshot of PDF page 5 confirms that equation (3) contains `p²` without a following `x`. On PDF page 6, the paper gives the characteristic equation `s² + 2ns + p² = 0` and the solution

[
x(t)=A e^{-nt}\sin\left(\sqrt{p^2-n^2}\,t+\psi\right),
]

which are consistent with the corrected oscillator equation below.

## Separate derived correction

Starting from the paper's own equation (2),

[
m\ddot{x}+c\dot{x}+kx=0,
]

divide by (m), then substitute the paper's definitions (2n=c/m) and (p^2=k/m):

[
\boxed{\ddot{x}+2n\dot{x}+p^2x=0.}
]

This is an assistant-derived algebraic correction, not a source-authored erratum, not Nathan Direct, and not an independent author confirmation. The source's later characteristic equation and solution also require the (p^2x) term. The most conservative attribution is “likely omitted (x) in printed equation (3).”

## Dimensional check

Using ([x]=L), ([t]=T), ([m]=M), ([c]=M/T), and ([k]=M/T^2):

- ([\ddot{x}]=LT^{-2}).
- ([2n\dot{x}]=LT^{-2}), because ([n]=T^{-1}).
- ([p^2]=T^{-2}), because (p^2=k/m).
- ([p^2x]=LT^{-2}).

Therefore the first two terms of the printed equation have acceleration dimensions, while the third term does not. The corrected (p^2x) term matches.

A Python integer-exponent script independently returned:
- (dim(\ddot{x})=(1,-2))
- (dim(n\dot{x})=(1,-2))
- (dim(p^2)=(0,-2))
- (dim(p^2x)=(1,-2))

This is a scripted dimensional-consistency check, not a physical calculation, empirical validation, or Lean proof.

## Formalization status and limits

A Lean 4/Mathlib proposition is straightforward: represent dimensions by integer exponent triples ((L,T,M)), define multiplication as exponent addition and division as exponent subtraction, then prove that (m\ddot{x}), (c\dot{x}), and (kx) have equal dimensions; prove (n\dot{x}) has the dimension of (\ddot{x}); prove (p^2\ne\dim(\ddot{x})); and prove (p^2x) matches.

A candidate module is specified below, but it was **not compiled or run**:

```lean
import Mathlib

abbrev Dim := ℤ × ℤ × ℤ

def dMul (a b : Dim) : Dim :=
  (a.1 + b.1, a.2 + b.2, a.3 + b.3)

def dDiv (a b : Dim) : Dim :=
  (a.1 - b.1, a.2 - b.2, a.3 - b.3)

def dX : Dim := (1, 0, 0)
def dT : Dim := (0, 1, 0)
def dM : Dim := (0, 0, 1)
def dV : Dim := dDiv dX dT
def dA : Dim := dDiv dV dT
def dC : Dim := dDiv dM dT
def dK : Dim := dDiv dM (dMul dT dT)
def dN : Dim := dDiv dC dM
def dP2 : Dim := dDiv dK dM

theorem mass_accel_eq_damping_velocity :
    dMul dM dA = dMul dC dV := by decide

theorem mass_accel_eq_stiffness_displacement :
    dMul dM dA = dMul dK dX := by decide

theorem damping_term_matches_acceleration :
    dMul dN dV = dA := by decide

theorem printed_p2_term_mismatches :
    dP2 ≠ dA := by decide

theorem corrected_p2x_term_matches :
    dMul dP2 dX = dA := by decide
```

The local runtime has no `lean`, `lake`, or `elan`; HsH `main` has no root `lean-toolchain` or `lakefile.lean`. Existing Calder PR #1515 has an exact-head Lean 4.34.0/Lake 5.0.0 build, but it is a separate draft about angular sampling and acquisition-unit factorization. It was not modified or repurposed. No new branch, PR, tool or dependency was created. Status is therefore **LEAN-NOT-RUN**, not proved.

## Source ambiguity and measurement boundary

The paper describes (m) as “the impact load,” while its oscillator equation uses (m) as inertial mass. The experimental setup separately states a 1000 N impact load. The dimensional derivation above assumes (m) in equations (1)–(2) is mass, as required by the model; no conversion from 1000 N to a mass is inferred.

The existing issue #1234 records the measured rope construction, drop protocol, sensor specifications, missing replicate count, absent raw time series, and incomplete uncertainty budget. Instrument specifications are not total experimental uncertainty. No new specimen-level data, calibration certificates, covariance, independent-unit manifest or raw synchronized force/displacement series were obtained here.

## Empirical design boundary

If raw data and independent specimens become available, the independent unit must be the separately prepared rope specimen, not each within-drop impact or each successive drop. Drops and within-drop impacts are nested repeated measures. A defensible null design would require specimen IDs, rope construction/batch, conditioning history, drop mass/height, rope length and knot, temperature/humidity, synchronized force/displacement traces, sample rate, calibration covariance, and multiple independent specimens. Holdout and resampling must be specimen-stratified. No such test was run.

## Disposition

- Preserve the printed source equation separately from the derived correction.
- Treat the missing (x) as a likely typesetting/source error pending author confirmation.
- Do not use the printed equation as a calibrated constitutive law.
- No physical calculation, fit, prediction, H(s)H map, P2 selection, WWRD universality claim, or BEDROCK promotion.
- P0 remains ACTIVE; Lane 24 remains BACKSEAT/HOLD.
