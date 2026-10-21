# Aster source-and-test packet: Einstein coupling and the 1.84 scale pivot

**Status:** historical-source excavation plus reproducible audit; tentative research, not BEDROCK, not established physics.  
**Worker:** Aster. **Next:** Ariadne. **Audit date:** 2026-10-21 UTC.

## Result

The historical statement

```text
R_{μν} − 1/2 R g_{μν} = 8π ℓ_f² T_{μν}.
```

together with `G/c^4 → 8π ℓ_f²`, **fails dimensionally in SI when
\(T_{\mu\nu}\) retains the ordinary stress-energy units**. The standard coefficient is
\(8\pi G/c^4\), whose dimensions are \(M^{-1}L^{-1}T^2\). Multiplying by
stress-energy \(ML^{-1}T^{-2}\) gives curvature \(L^{-2}\). Multiplying the same
tensor by \(\ell_f^2\) instead gives \(MLT^{-2}\), a force. This is a definite
failure of the formula as written; it is not repaired by comparing bare decimal
values. A valid length-squared coupling would require an explicit geometrization
or rescaling map for \(T_{\mu\nu}\), which the audited passage does not supply.

The separate 1.84 arc-to-axial construction is algebraically consistent:
\[
B_0={3\over4\pi},\qquad
\ell_{\rm action}={\hbar\over m_0cB_0}=1.462800948377\ {\rm fm},
\]
\[
\Xi={\ell_{\rm action}\over\ell_{\rm axial}}=1.843014928029,\qquad
\theta=\arccos(\Xi^{-1})=57.139928372184^\circ.
\]
But this is **not an independent CODATA prediction**: \(\hbar\) is used to solve
for \(\ell_{\rm action}\), and \(\theta\) is then defined from the ratio. With the
archived axial value directly in \(\hbar=m_0c\ell B_0\), the result is only
\(0.542589202503\,\hbar\), a \(-45.74107975\%\) residual. No source uncertainty
was supplied, so no defensible z-score exists.

## Source record and terminology chain

All locators below were read from public repository `Satobloc/HsH` on
2026-10-21. SHA values are Git blob SHAs, not claims about original authorship date.

1. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 2/SAT4DHHUC.txt`,
   blob `2e1e163771dda9bd1132290ce758ef6d80a6d0fb`, lines 1–500 read. The
   conversation record contains, verbatim:

   ```text
   Newtonian Retrodiction: Gravity is not a field but the statistical "back-pull" of filament strain, retrodicting G via G/c^4 → 8π ℓ_f^2.
   ```

   The later module in the same record states:

   ```text
   R_{μν} − 1/2 R g_{μν} = 8π ℓ_f² T_{μν}.
   ```

   Authorship caution: this is a mixed conversation/pasted-module record. The
   mathematical wording is preserved as source text, but is not promoted here as
   uniquely Nathan-authored.

2. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, embedded date
   `7/4/2026`, blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, lines
   1–220 read. It changes the description into the “1.84 Arc-to-Axial Pivot” and
   states \(\Xi=1/\cos(\text{ᚼ}_4)\approx1.843\), contrasting about 1.46 fm with
   about 0.79 fm.

3. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt`, blob
   `99a137e4891cd4a3ecaee86cf76a2d06c5af300b`, lines 1–220 read. It preserves
   the later terminology `ell_axial ≈ 0.7937 fm`,
   `ell_arc = ell_axial/cos(57.1°) ≈ 1.461 fm`, and labels \(\Xi\approx1.841\).
   The catalog’s own “Current/Intermediate/Archival” labels are historical
   metadata, not present authority.

4. Live controls read in full before the audit:
   `BEDROCK.md`, blob
   `91e8c7b0b4de6df2469173695ff97c63e6cba144`; and subordinate
   `STATE_OF_THE_THEORY.md`, blob
   `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
   Aster continuity was read at
   `WORKSPACES/ASTER/CONTINUITY.md`, blob
   `dff047e7d725d517044cbf176c4187c209f8b383`, and the source-grounded
   reentry file at blob `7d8a57addef8c17a2bab67aa96d25e637cc8b5ad`.

### BEDROCK comparison

- BEDROCK’s current finite-core entry says historical
  \(\ell_f\sim0.7937\) fm generally denotes a first-order helical coil radius,
  not intrinsic filament thickness; no numerical model scale is an established
  electron radius.
- Therefore the source’s direct use of \(\ell_f^2\) as an Einstein coupling is
  not authorized by BEDROCK and, independently, fails the SI test above.
- BR-003/BR-004 and ND-2026-10-18-03 require this result to remain a
  source-preserving audit. No BEDROCK text was rewritten or promoted.
- OC-001 (Q/smoothing law) and OC-002 (responsive medium) remain open; neither
  can be used as an unshown unit-conversion mechanism.

## Dimensional proof, limits, sign, and topology

Using exponent triples \((M,L,T)\):
\[
[G]=(-1,3,-2),\quad[c^4]=(0,4,-4),\quad
[T_{\mu\nu}]=(1,-1,-2),\quad[\ell^2]=(0,2,0).
\]
Hence
\[
[G/c^4]=(-1,-1,2),\quad[(G/c^4)T_{\mu\nu}]=(0,-2,0),
\]
but
\[
[\ell^2T_{\mu\nu}]=(1,1,-2)\ne(0,-2,0).
\]

For the helix relation \(\ell_{\rm arc}=\ell_{\rm axial}/\cos\theta\):

- it is defined only for \(\cos\theta\ne0\);
- \(\theta\to0\) gives \(\Xi\to1\);
- \(\theta\to(\pi/2)^-\) gives \(\Xi\to+\infty\);
- for an oriented projection beyond \(\pi/2\), the signed ratio changes sign,
  while physical lengths require an absolute-value convention;
- the secant relation is local metric geometry. It does not by itself prove a
  winding number, knot class, global topology, or Hagalaz dynamics.

## Versioned CODATA comparison

Inputs are 2022 CODATA values as served by NIST: \(c=299792458\ {\rm m\,s^{-1}}\)
exact; \(\hbar=1.054571817\ldots\times10^{-34}\ {\rm J\,s}\) exact; and
\(G=6.67430(15)\times10^{-11}\ {\rm m^3\,kg^{-1}\,s^{-2}}\). The archived
\(\ell_{\rm axial}=0.7937\) fm and \(m_0=1.0073\times10^{-27}\) kg have no
uncertainties in the audited passages.

Actual numerical output:

```text
DIMENSIONS (M,L,T exponents)
G/c^4              = (-1, -1, 2)
(G/c^4) T_mn       = (0, -2, 0)
ell_f^2 T_mn       = (1, 1, -2)
NUMERICS
G/c^4              = 8.262717639698037E-45 ± 1.86E-49 s^2 kg^-1 m^-1
8pi G/c^4          = 2.076647442844972E-43 ± 4.67E-48 s^2 kg^-1 m^-1
8pi ell_ax^2       = 1.583261387329363E-29 m^2
bare-number ratio  = 7.624122201312715E+13  [not a physical residual: units differ]
sqrt(G/(8pi c^4))  = 1.813182530614707E-23 [unit is not metre]
HELIX/ACTION CHAIN
B0=3/(4pi)         = 2.387324146378430E-1
ell_action         = 1.462800948376842E-15 m = 1.462800948377 fm
Xi                  = 1.843014928029283
theta               = 57.139928372184 deg
hbar_axial          = 5.721992811678648E-35 J s
hbar_axial/hbar     = 0.542589202502711
m0_required(axial)  = 1.856468937003897E-27 kg
```

The bare-number ratio is printed only to demonstrate why decimal matching is
meaningless across different dimensions. The action-chain zero residual at
\(\ell_{\rm action}\) is tuned/definitional. The axial evaluation is the
independent cross-check against the same \(\hbar\) relation and fails by 45.7%.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Reproduce the Aster dimensional and filament-scale audit."""
from decimal import Decimal, getcontext
import math

getcontext().prec = 50
D = Decimal
c = D("299792458")
hbar = D("1.054571817e-34")
G = D("6.67430e-11")
uG = D("0.00015e-11")
ell_ax = D("0.7937e-15")
m0 = D("1.0073e-27")
pi = D(str(math.pi))
B0 = D(3) / (D(4) * pi)

dim_G = (-1, 3, -2)
dim_c4 = (0, 4, -4)
dim_Tmunu = (1, -1, -2)
dim_ell2 = (0, 2, 0)
def sub(a, b): return tuple(x-y for x, y in zip(a, b))
def add(a, b): return tuple(x+y for x, y in zip(a, b))
dim_G_over_c4 = sub(dim_G, dim_c4)
dim_standard_rhs = add(dim_G_over_c4, dim_Tmunu)
dim_archived_rhs = add(dim_ell2, dim_Tmunu)

kappa_no_8pi = G / c**4
u_kappa_no_8pi = uG / c**4
kappa_E = D(8) * pi * kappa_no_8pi
u_kappa_E = D(8) * pi * u_kappa_no_8pi
archived_coeff = D(8) * pi * ell_ax**2
bare_ratio = archived_coeff / kappa_E
ell_pretend = (G / (D(8)*pi*c**4)).sqrt()

ell_action = hbar / (m0*c*B0)
Xi = ell_action / ell_ax
theta_deg = math.degrees(math.acos(float(D(1)/Xi)))
hbar_ax = m0*c*ell_ax*B0
ax_fraction = hbar_ax / hbar
m0_required = hbar / (c*ell_ax*B0)

assert dim_standard_rhs == (0, -2, 0)
assert dim_archived_rhs == (1, 1, -2)
assert abs((D(1)/D(str(math.cos(math.radians(theta_deg))))) - Xi) < D("1e-14")

print("DIMENSIONS (M,L,T exponents)")
print("G/c^4              =", dim_G_over_c4)
print("(G/c^4) T_mn       =", dim_standard_rhs)
print("ell_f^2 T_mn       =", dim_archived_rhs)
print("NUMERICS")
print(f"G/c^4              = {kappa_no_8pi:.15E} ± {u_kappa_no_8pi:.2E} s^2 kg^-1 m^-1")
print(f"8pi G/c^4          = {kappa_E:.15E} ± {u_kappa_E:.2E} s^2 kg^-1 m^-1")
print(f"8pi ell_ax^2       = {archived_coeff:.15E} m^2")
print(f"bare-number ratio  = {bare_ratio:.15E}  [not a physical residual: units differ]")
print(f"sqrt(G/(8pi c^4))  = {ell_pretend:.15E} [unit is not metre]")
print("HELIX/ACTION CHAIN")
print(f"B0=3/(4pi)         = {B0:.15E}")
print(f"ell_action         = {ell_action:.15E} m = {(ell_action/D('1e-15')):.12f} fm")
print(f"Xi                  = {Xi:.15f}")
print(f"theta               = {theta_deg:.12f} deg")
print(f"hbar_axial          = {hbar_ax:.15E} J s")
print(f"hbar_axial/hbar     = {ax_fraction:.15f}")
print(f"m0_required(axial)  = {m0_required:.15E} kg")
```

## Complete Lean 4 / Mathlib proof kernel

```lean
import Mathlib

structure Dim where
  M : Int
  L : Int
  T : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim := ⟨a.M+b.M, a.L+b.L, a.T+b.T⟩
def Dim.div (a b : Dim) : Dim := ⟨a.M-b.M, a.L-b.L, a.T-b.T⟩
def dG : Dim := ⟨-1, 3, -2⟩
def dc4 : Dim := ⟨0, 4, -4⟩
def dStress : Dim := ⟨1, -1, -2⟩
def dEll2 : Dim := ⟨0, 2, 0⟩
def dCurvature : Dim := ⟨0, -2, 0⟩
def dForce : Dim := ⟨1, 1, -2⟩

example : Dim.mul (Dim.div dG dc4) dStress = dCurvature := by decide
example : Dim.mul dEll2 dStress = dForce := by decide
example : Dim.mul dEll2 dStress ≠ dCurvature := by decide

theorem arc_axial_secant
    (ellArc ellAx cosTheta : ℝ)
    (hArc : ellArc = ellAx / cosTheta)
    (hAx : ellAx ≠ 0) (hCos : cosTheta ≠ 0) :
    ellArc / ellAx = 1 / cosTheta := by
  rw [hArc]
  field_simp

theorem action_arc_recovery
    (hbar m c B ellArc : ℝ)
    (hm : m ≠ 0) (hc : c ≠ 0) (hB : B ≠ 0)
    (hdef : ellArc = hbar / (m*c*B)) :
    m*c*ellArc*B = hbar := by
  rw [hdef]
  field_simp

#eval Dim.mul (Dim.div dG dc4) dStress
#eval Dim.mul dEll2 dStress
```

Python 3 executed successfully with all assertions passing. Lean was not installed
in this runtime, so the Lean source is complete but not runtime-certified here.

## Required individual reading round

- BEDROCK: full live file, blob
  `91e8c7b0b4de6df2469173695ff97c63e6cba144`.
- Subordinate theory state: full file, blob
  `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Deterministic archive draw initially selected
  `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Boxful of Light Ep2 — raw.json`,
  but the connector returned no readable content; no reading was claimed.
  Readable fallback:
  `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Cleaned-up inventory list — raw.json`,
  lines 1–220, blob `51c9ed6e603497245725c7e096e5530d8fa9e249`.
  Honest takeaway: it is an inventory-cleanup/personal-project conversation, useful
  for provenance and privacy boundaries but not a source of SAT mathematical
  authority. No personal contents are reproduced here.

## Disposition and exact discriminator

- **Definite correction:** replace no equation in the historical record. Annotate
  the displayed SI coupling as dimensionally invalid unless a source supplies a
  declared map \(\widetilde T_{\mu\nu}=\mathcal G(T_{\mu\nu})\) such that
  \([\widetilde T_{\mu\nu}]=L^{-4}\) (or another convention making
  \(\ell_f^2\widetilde T_{\mu\nu}\) curvature).
- **Retain unresolved:** the 1.84 helix relation passes its algebraic test but is
  presently a fitted/readout identity, not an independent prediction.
- **Exact future discriminator:** publish the rescaling/geometrization map,
  including units and normalization, then predict a quantity not used to select
  \(\ell_f,m_0,B,\theta\). Compare that held-out prediction with versioned data
  and propagated uncertainty.

**One-line handoff to Ariadne:** seek the earliest primary passage that defines
the units and normalization of the tensor on the right-hand side; without that
map, preserve the coupling failure and treat the secant pivot only as local helix
geometry.
