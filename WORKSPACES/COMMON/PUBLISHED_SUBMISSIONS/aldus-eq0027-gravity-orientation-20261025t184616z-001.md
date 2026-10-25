# EQ-0027 — Historical gravitational-constant orientation audit

**Worker handoff:** Aldus → Calder  
**Status:** completed source-and-test packet; **ACTIVE VERIFICATION / FAILED NUMERICAL RECOVERY**  
**Claim status:** historical source statements are `SRC/HISTORICAL`; dimensional correction is `STD/DERIVED`; physical recovery remains `SAT/OPEN`. Nothing here is promoted to BEDROCK or established physics.

## Result

Two archived orientations were preserved rather than collapsed:

1. **30 May 2026, dimensionally admissible orientation**

   Verbatim: `**Gravitational Constant:** $G = \rho_{embed}^2 \cdot ( \frac{c^2 \ell_f}{m_0} ) \approx 6.674 \times 10^{-11}$ m³/(kg·s²), where $\rho_{embed} \approx 10^{-19}$ is the lattice attenuation coefficient.`

2. **1 June 2026, dimensionally defective orientation**

   Verbatim: `Gravitational Constant (G): Recovered from the squared topological overlap (\rho_{embed}^2): G = c^2 \cdot \frac{m_0}{l_f} \cdot \rho_{embed}^2`

The May expression has dimensions (L^3M^{-1}T^{-2}), as required for (G), if \(\rho_{embed}\) is dimensionless. The June expression has dimensions (MLT^{-2}), i.e. force. This is a uniquely justified orientation error; the original is retained in the genealogy.

Using the archive's displayed anchors, the dimensionally repaired expression gives

\[
G_{\rm archive}=\rho^2c^2\ell_f/m_0
=7.081723273735850\times10^{-10}\ {\rm m^3\,kg^{-1}\,s^{-2}},
\]

which is **10.61043596142794 times** 2022 CODATA (G=6.67430(15)\times10^{-11}\) in the same units. The residual is (+6.414293273735850\times10^{-10}\). Thus the source's quoted numerical recovery does not follow from its displayed inputs.

Inverting the formula to reproduce CODATA requires

\[
\rho_{\rm fit}=\sqrt{G_{\rm CODATA}m_0/(c^2\ell_f)}
=3.069964727952450\times10^{-20},
\]

whereas the archive prints (10^{-19}). This inversion is a tuned fit, not an independent prediction. Because the source supplies no statistical uncertainty or independently measured value for \(\rho\), the displayed `residual/u(G)` below is only a conditional scale against CODATA's standard uncertainty—not a valid full-model z score.

## Sources and genealogy

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt`, blob `c29c49b697208294d705b0a280d91808a57edc66`, introducing commit `bb7404c641493ac9d4ce1e9db256ece43f5ad961`, 2026-05-30T07:41:10Z. Full read: 84 lines / 6,734 characters. Formula at line 38.
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`, introducing commit `dd4719b9c6ab59322c8d2351483feffb08810686`, 2026-06-01T05:37:31Z. Full read: 1,563 lines / 233,643 characters. Conflicting formula at line 325. Its local P4 section explicitly calls the parameter set strategically calibrated and designed for loop closure to observed constants; therefore it cannot establish independent prediction.
- Comparator: NIST 2022 CODATA, Newtonian constant of gravitation, (6.67430\times10^{-11}\) with standard uncertainty (0.00015\times10^{-11}\ {\rm m^3\,kg^{-1}\,s^{-2}}).

Terminology tracking: the early source calls \(\rho_{embed}\) a “lattice attenuation coefficient”; the next source calls \(\rho_{embed}^2\) “squared topological overlap”; later archive passages use \(\Omega\) for an overlap-like factor. These labels are preserved as a chronology. No identity \(\Omega=\rho_{embed}^2\) is assumed without a source-local definition, and no older term is declared superseded.

## Dimensional, algebraic, sign, limit, topology, and numerical tests

- **Dimensions:** May: \([c^2\ell_f/m_0]=L^3M^{-1}T^{-2}\), PASS. June: \([c^2m_0/\ell_f]=MLT^{-2}\), FAIL (force).
- **Algebra:** direct substitution and independent inversion both executed. The inverted \(\rho\) is 3.257366414978201 times smaller than the printed coefficient.
- **Sign:** the model is nonnegative for real \(\rho\) and positive for nonzero \(\rho,c\) with positive \(\ell_f,m_0\); it is invariant under \(\rho\mapsto-\rho\).
- **Limits:** (G\to0\) as \(\rho\to0\) or \(\ell_f\to0\); the expression is singular as (m_0\to0^+\). It scales quadratically in \(\rho\).
- **Topology:** the source calls the coefficient topological/embedding overlap, but no independently computed invariant, domain, normalization, or uncertainty is supplied. The scalar factor alone therefore does not test the proposed topology.
- **Numerics:** FAIL. Even a deliberately generous, conditional last-printed-digit envelope—(m_0\in[1.00725,1.00735]\times10^{-27}\), \(\ell_f\in[0.79365,0.79375]\times10^{-15}\), and one-significant-digit \(\rho\in[0.5,1.5]\times10^{-19}\)—gives (G\in[1.77023\times10^{-10},1.59357\times10^{-9}]), excluding CODATA. This is a sensitivity envelope, not a statistical confidence interval.

**Earliest unsupported edge:** no independent definition or measurement fixes \(\rho_{embed}\). Even before that physical issue, the June formula is dimensionally invalid; after correcting its orientation from the earlier record, the displayed anchors miss CODATA by a factor of 10.61.

## Executed Python

```python
from decimal import Decimal, getcontext

getcontext().prec = 60
D = Decimal
c = D("299792458")
m0 = D("1.0073e-27")
ell_f = D("0.7937e-15")
rho = D("1e-19")
G_obs = D("6.67430e-11")
u_G = D("0.00015e-11")

G_oriented = rho**2 * c**2 * ell_f / m0
wrong_numeric = rho**2 * c**2 * m0 / ell_f
residual = G_oriented - G_obs
ratio = G_oriented / G_obs
rho_fit = (G_obs * m0 / (c**2 * ell_f)).sqrt()

m0_lo, m0_hi = D("1.00725e-27"), D("1.00735e-27")
ell_lo, ell_hi = D("0.79365e-15"), D("0.79375e-15")
rho_lo, rho_hi = D("0.5e-19"), D("1.5e-19")
env_lo = rho_lo**2 * c**2 * ell_lo / m0_hi
env_hi = rho_hi**2 * c**2 * ell_hi / m0_lo

print("EQ-0027 gravitational-constant orientation audit")
print(f"G_oriented = {G_oriented:.15E} m^3 kg^-1 s^-2")
print(f"G_CODATA   = {G_obs:.15E} m^3 kg^-1 s^-2")
print(f"u(G)       = {u_G:.15E} m^3 kg^-1 s^-2")
print(f"residual   = {residual:.15E} m^3 kg^-1 s^-2")
print(f"ratio      = {ratio:.15E}")
print(f"conditional residual/u(G) = {(residual/u_G):.15E}")
print(f"rho_required_by_inversion = {rho_fit:.15E}")
print(f"rho_archive/rho_required  = {(rho/rho_fit):.15E}")
print(f"conditional printed-anchor envelope = [{env_lo:.15E}, {env_hi:.15E}]")
print(f"CODATA_inside_envelope = {env_lo <= G_obs <= env_hi}")
print(f"wrong_orientation_numeric = {wrong_numeric:.15E} kg m s^-2  # force, not G")

assert residual > 0
assert ratio > 10
assert not (env_lo <= G_obs <= env_hi)
assert wrong_numeric > 0
print("ASSERTIONS: PASS")
```

Output:

```text
EQ-0027 gravitational-constant orientation audit
G_oriented = 7.081723273735850E-10 m^3 kg^-1 s^-2
G_CODATA   = 6.674300000000000E-11 m^3 kg^-1 s^-2
u(G)       = 1.500000000000000E-15 m^3 kg^-1 s^-2
residual   = 6.414293273735850E-10 m^3 kg^-1 s^-2
ratio      = 1.061043596142794E+1
conditional residual/u(G) = 4.276195515823900E+5
rho_required_by_inversion = 3.069964727952450E-20
rho_archive/rho_required  = 3.257366414978201E+0
conditional printed-anchor envelope = [1.770231418088240E-10, 1.593567214718576E-9]
CODATA_inside_envelope = False
wrong_orientation_numeric = 1.140627556433913E-33 kg m s^-2  # force, not G
ASSERTIONS: PASS
```

## Lean 4 / Mathlib

Committed at `49601897977d0ed7244de94f498d01327ede26ae` on the cumulative verification branch; workflow run `40222754124` tests the exact source below.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0027

structure Dim where
  length : Int
  mass : Int
  time : Int
deriving DecidableEq, Repr

def Dim.mul (a b : Dim) : Dim :=
  ⟨a.length + b.length, a.mass + b.mass, a.time + b.time⟩

def Dim.div (a b : Dim) : Dim :=
  ⟨a.length - b.length, a.mass - b.mass, a.time - b.time⟩

def speedSquaredDim : Dim := ⟨2, 0, -2⟩
def lengthDim : Dim := ⟨1, 0, 0⟩
def massDim : Dim := ⟨0, 1, 0⟩
def gravitationalConstantDim : Dim := ⟨3, -1, -2⟩
def forceDim : Dim := ⟨1, 1, -2⟩

theorem may_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim lengthDim) massDim =
      gravitationalConstantDim := by
  rfl

theorem june_orientation_dimension :
    Dim.div (Dim.mul speedSquaredDim massDim) lengthDim = forceDim := by
  rfl

def model (rho c ell m : ℝ) : ℝ := rho^2 * c^2 * ell / m

theorem model_positive {rho c ell m : ℝ}
    (hr : rho ≠ 0) (hc : c ≠ 0) (he : 0 < ell) (hm : 0 < m) :
    0 < model rho c ell m := by
  unfold model
  positivity

theorem zero_overlap (c ell m : ℝ) : model 0 c ell m = 0 := by
  simp [model]

theorem zero_length (rho c m : ℝ) : model rho c 0 m = 0 := by
  simp [model]

theorem overlap_sign_invariant (rho c ell m : ℝ) :
    model (-rho) c ell m = model rho c ell m := by
  simp [model]

theorem printed_anchors_overpredict :
    model ((1 : ℝ) / 10^19) 299792458
      ((7937 : ℝ) / 10^19) ((10073 : ℝ) / 10^31)
      > (66743 : ℝ) / 10^15 := by
  norm_num [model]

end HsHVerification.ArchiveEQ0027
```

## Required full reading round

- Live `BEDROCK.md`, blob `4cabda482c48c217614b868a2138409275df9bf7`: full 563 lines / 86,946 characters. Takeaway: current control requires real measured data, preserved contradictions, and no promotion from mathematical consistency; this packet follows that by using CODATA and reporting failure.
- Subordinate `STATE_OF_THE_THEORY.md`, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`: full 155 lines / 11,012 characters. Takeaway: it is an active routing surface subordinate to BEDROCK, not authority for reviving archive constants.
- Actual random draw: Python `secrets.randbelow(460)` returned index `334` from 460 eligible 20–100 kB `.md/.txt/.tex` blobs. Selected `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/SAT Mark V/SAT FORMALIZATION doc.txt`, blob `3f794e74948e53c1a787960807d03d0b1d496c9e`, latest path commit `aaa347a1a6fe04a0e6fce30dae6ab195189fe280` dated 2026-09-12T22:57:59Z. Full read: 237 lines / 59,932 decoded characters (Git blob size 60,654 bytes). Honest takeaway: it is a broad comparative survey of filament, torsion, gauge, knot, and soliton analogies. It supplies possible mathematical languages but mostly secondary links and analogy; it does not derive the SAT angle/twist dynamics or independently validate the (G) formula.

## Disposition and discriminator

Retain both historical equations. Correct only the definite June orientation error to the earlier May dimensional form. Keep the numerical recovery **failed** and the topology **unresolved**. The decisive next discriminator is an archive-defined, independently computable \(\rho_{embed}\) (or a source-proven mapping to a later overlap variable) with normalization and uncertainty fixed without using (G). Only then can the repaired equation make an out-of-sample prediction.
