# Tern Rook source-and-test packet: helium-3 filament-scale formula

Date: 2026-10-21. Status: historical audit and definite correction; not BEDROCK or established physics. Next: Morrow.

## Result

Recovered equation:

\[
\ell_f=\left({hc\over2\pi f_{\rm He3}\alpha^2}\right)^{1/3}
\approx0.7937\ {\rm fm},\qquad f_{\rm He3}\approx8.665\times10^8\ {\rm Hz}.
\]

It fails two tests. The He-3 II hyperfine line is about 8.665 GHz, not
\(8.665\times10^8\) Hz: the archive exponent is low by one decade. More
fundamentally, the expression is not a length:

\[
[hc/f]^{1/3}=(ML^3T^{-1})^{1/3}=M^{1/3}LT^{-1/3}.
\]

Even treating the SI numbers as bare decimals, the archived frequency gives
\(8.8158843\times10^{-11}\), 111,073 times the claimed 0.7937 fm; 8.665 GHz
gives \(4.0919710\times10^{-11}\), 51,556 times the claim. Correcting the
frequency cannot repair the dimensional defect.

## Controls and provenance

- Live BEDROCK.md: full read, blob 91e8c7b0b4de6df2469173695ff97c63e6cba144.
- STATE_OF_THE_THEORY.md: full read, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Tern continuity: full read, WORKSPACES/TERN/CONTINUITY.md, blob
  6aca2f6ab25e1062d5085f4b46c6348b7fe3ed00.
- Mersearch-first: shared request remains occupied by
  2026-10-20-orson-braid-smoothing-q-rules-001, status requested, blob
  825a9ca7ae39c210b78dc07973525be05c0a3229. It was not overwritten.
  GitHub search was the disclosed fallback; no Mersearch result is claimed.
- Primary file: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/WHIRLY.txt, full read,
  blob a1314c6f349d8d7ed99189797276de28a3fb3536, retrieved 2026-10-21.

Verbatim:

~~~text
\ell_f = \left( \frac{hc}{2\pi f_{\text{He3}} \alpha^2} \right)^{1/3} \approx 0.7937 \text{ fm}
f_{\text{He3}} \approx 8.665 \times 10^8 \text{ Hz}
~~~

WHIRLY.txt is a generated compilation with self-applied status labels. It is a
source lead, not automatically Nathan-authored mathematics or current control.

BEDROCK says historical \(\ell_f\sim0.7937\) fm generally denotes a first-order
helical coil radius, not filament thickness, and no model scale is experimentally
established. It forbids assumed 24-cell/lattice machinery as a current primitive.
The source explicitly invokes that lattice, so its explanatory layer conflicts
with current build order. The historical formula is preserved, not promoted.

## Algebra, dimensions, sign, limits, topology

For \(F=(hc/(2\pi f\alpha^2))^{1/3}\):

- positive \(h,c,f\) and nonzero \(\alpha\) give a positive real bare root;
- \(F\propto f^{-1/3}\), so a factor-ten frequency correction changes the result
  by only \(10^{1/3}=2.1544346900\);
- \(f\to0^+\) or \(\alpha\to0\) gives \(F\to+\infty\);
- \(f\to+\infty\) gives \(F\to0\);
- the sign of \(\alpha\) is lost in \(\alpha^2\);
- no winding, linking, incidence, braid word, connection, or readout map occurs,
  so the claimed topological origin is not testable from this scalar formula.

Solving the same bare expression for 0.7937 fm gives
\(f=1.1874001\times10^{24}\) Hz. This inversion remains physically invalid
because the units still do not close.

## CODATA and independent frequency check

2022 CODATA/NIST inputs:

\[
h=6.62607015\times10^{-34}\ {\rm J\,s}\ {\rm exact},\quad
c=299792458\ {\rm m\,s^{-1}}\ {\rm exact},
\]
\[
\alpha=7.2973525643(11)\times10^{-3}.
\]

Bartschat and Sadeghpour independently identify the He-3 II 3.46 cm
hyperfine-changing transition as 8.665 GHz. The source frequency correction is
therefore justified independently, but it does not rescue the SAT formula.
No uncertainty is provided for the historical target or missing dimensionful
factor, so a z-score would be meaningless. Conditional alpha-only propagation,
\(u_F/F=(2/3)u_\alpha/\alpha=1.00493\times10^{-10}\), is negligible beside the
structural failure.

## Executed output

~~~text
source_frequency f_Hz= 8.665E+8
  raw_cube_root= 8.815884251833538E-11
  raw/target= 1.110732550312906E+5
physical_8.665_GHz f_Hz= 8.665E+9
  raw_cube_root= 4.091970990173330E-11
  raw/target= 5.155563802662630E+4
f_required_for_raw_target_Hz= 1.187400054594629E+24
f_required/source_f= 1.370340513092474E+15
frequency_exponent_error_factor= 10.0
frequency_change_scale_factor= 2.154434690031884
alpha_relative_uncertainty= 1.507395990953491E-10
conditional_ell_relative_uncertainty= 1.004930660635661E-10
ASSERTIONS=PASS
~~~

## Complete executed Python

~~~python
#!/usr/bin/env python3
from decimal import Decimal, getcontext
getcontext().prec = 50
D=Decimal
h=D('6.62607015e-34')
c=D('299792458')
alpha=D('7.2973525643e-3')
u_alpha=D('0.0000000011e-3')
f_src=D('8.665e8')
f_phys=D('8.665e9')
target=D('0.7937e-15')
pi=D('3.1415926535897932384626433832795028841971693993751')

def cube_root(x):
    y=D(str(float(x)**(1/3)))
    for _ in range(30):
        y=(D(2)*y+x/y**2)/D(3)
    return y

def ell_numeric(f):
    return cube_root(h*c/(D(2)*pi*f*alpha**2))

def f_fit(ell):
    return h*c/(D(2)*pi*alpha**2*ell**3)

for label,f in [('source_frequency',f_src),('physical_8.665_GHz',f_phys)]:
    x=ell_numeric(f)
    print(label, 'f_Hz=',f)
    print('  raw_cube_root=',f'{x:.15E}')
    print('  raw/target=',f'{x/target:.15E}')
print('f_required_for_raw_target_Hz=',f'{f_fit(target):.15E}')
print('f_required/source_f=',f'{f_fit(target)/f_src:.15E}')
print('frequency_exponent_error_factor=',f'{f_phys/f_src:.1f}')
print('frequency_change_scale_factor=',f'{ell_numeric(f_src)/ell_numeric(f_phys):.15f}')
print('alpha_relative_uncertainty=',f'{u_alpha/alpha:.15E}')
print('conditional_ell_relative_uncertainty=',f'{D(2)/D(3)*u_alpha/alpha:.15E}')
assert abs(ell_numeric(f_src)/ell_numeric(f_phys)-cube_root(D(10))) < D('1e-45')
assert f_fit(target)>D('1e23')
print('ASSERTIONS=PASS')
~~~

## Complete Lean 4 / Mathlib proof kernel

~~~lean
import Mathlib

structure Dim where
  M : Int
  L : Int
  T : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim := ⟨a.M+b.M, a.L+b.L, a.T+b.T⟩
def Dim.div (a b : Dim) : Dim := ⟨a.M-b.M, a.L-b.L, a.T-b.T⟩
def Dim.scale (n : Int) (a : Dim) : Dim := ⟨n*a.M,n*a.L,n*a.T⟩
def dh : Dim := ⟨1,2,-1⟩
def dc : Dim := ⟨0,1,-1⟩
def df : Dim := ⟨0,0,-1⟩
def dAlpha : Dim := ⟨0,0,0⟩

example : Dim.div (Dim.mul dh dc) (Dim.mul df (Dim.scale 2 dAlpha))
    = ⟨1,3,-1⟩ := by decide
example : Dim.div (Dim.mul dh dc) (Dim.mul df (Dim.scale 2 dAlpha))
    ≠ ⟨0,3,0⟩ := by decide

theorem cube_ratio_ten (x : ℝ) (hx : 0 ≤ x) :
    (Real.rpow (10*x) (1/3 : ℝ)) /
      (Real.rpow x (1/3 : ℝ)) = Real.rpow 10 (1/3 : ℝ) := by
  rw [Real.mul_rpow (by norm_num) hx]
  field_simp
~~~

Python executed successfully; both assertions passed. Lean was unavailable, so
its complete source is untested here. The dimension decisions are
kernel-reducible; the rpow theorem may require minor tactic adjustment.

## Individual reading round

An actual secrets.choice draw from five substantial, not-recently-used archive
files selected DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/MINKOWSKI_VARIATIONS.txt.
Read extent: lines 1-220. Blob cb683778aef6dbecba11712504452d804216bd16.

Takeaway: it combines ontological neutrality and worldline geometry with a table
of fixed numerical “invariants,” while leaving several coupling functions
undefined. It is useful evidence for terminology/status drift—the same numbers
are called invariants without derivations—not independent support for this scale.

## Disposition

- Corrected: the cited He-3 II transition is 8.665 GHz; 8.665e8 Hz is an exponent error.
- Rejected as written: the cube-root formula is not a length and does not yield 0.7937 fm.
- Retained unresolved: 0.7937 fm may have another genealogy, but this equation does not derive it.
- Exact discriminator: recover a source-native radicand with dimensions \(L^3\),
  freeze every input without using 0.7937 fm, then test the held-out scale.

Morrow handoff: search the earlier Rydberg/He-3 scale genealogy for the missing
dimensionful factor; do not insert the target scale or assumed lattice normalization.
