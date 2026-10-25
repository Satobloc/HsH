# EQ-0019 — Archived S3 / hydrogen-ladder construction

Worker: Aster. Handoff: Ariadne. Date: 2026-10-24 (Eastern).

Status: **HISTORICAL SOURCE-PRESERVING AUDIT; S3 SPECTRUM AND DIMENSIONS PASS; THE 1/n^2 HYDROGEN LAW IS INSERTED RATHER THAN DERIVED; ARCHIVED NUMBER FAILS 2022 CODATA BY 99.7954%; PROPOSED alpha REPAIR FAILS; ACTIVE CODATA COMPARISON / RETAINED FAILURE; NOT H(s)H BEDROCK; NOT AN H(s)H CANDIDATE; NOT ESTABLISHED PHYSICS.**

## Source and genealogy

Mersearch-first was attempted by inspecting the shared request surface. It remains occupied by request `2026-10-21-orson-nlm-big-haul-math-001`, status `requested`, so this packet used bounded direct GitHub reads and records no claim of comprehensive retrieval.

1. The earliest surfaced genealogy lead is the existing Mersearch result `indexes/mersearch_requests/2026-10-06-orson-rq-hidden-symmetry-ancestry-002/SEARCH_RESULTS.md`: `archive/Ontology and Math Check — raw.json`, message `1d6f200b-6685-4273-a480-8a4a056a73e3`, timestamp `2026-03-17T16:33:52.125610Z`. Its excerpt explicitly records the conflict `E_kin proportional to n^2` versus the experimental hydrogen ladder `E_n proportional to 1/n^2`. This is a locator, not a substitute for the unavailable raw message.
2. Exact restatement read in full: `DEVELOPMENT_FULL_CONVOS/QUANTUM GRAVITY.txt`, 117 lines / 7,107 characters, blob `ad108b3e9e40f1948dd25b337eec191bdc5bf180`; read 2026-10-24. Repository-current locator commit during read: `7caa3e50a59fcecc5c56ad0bddb3718c1a162c28` (2026-10-25T02:28:57Z). Authorship/date of the mathematical text itself is not authenticated by that display commit.
3. Later generated audit/correction record read for the operative repair claim: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt`, blob `33785afb8d46804122d79056b952169f99b325e2`. It reports the uncalibrated `E_1 approx -4.46e-21 J`, recognizes an approximately 500-fold miss, then claims an emergent `alpha_eff ~ ell_f/r_mode -> 1/137` snaps the answer to `-13.6 eV`. The exact formula and numeric repair are tested below.
4. A competing later roundup form states `E_n proportional to hbar^2 l(l+2)/(2mR^2)`. That is the ordinary increasing Laplacian spectrum, not the inverse `1/n^2` ladder. The two forms are preserved as competing historical constructions; neither silently supersedes the other.

Verbatim exact restatement:

```text
Laplace-Beltrami operator on S^3 produces discrete eigenvalues:
$$\nabla^2_{S^3} f = -\lambda_l f, \quad \lambda_l = \frac{l(l+2)}{R^2}$$
...
Topological tension $T_{topo}$ converts the vibrational frequency into a physically observable energy:
$$E_n = -\frac{\hbar \omega}{2} \left(\frac{\ell_f^2}{R^2} \frac{1}{n^2}\right)$$
Discrete $n$-dependent levels reproduce the Hydrogen energy ladder without invoking Coulomb forces: the spacing is purely geometric.
```

Later proposed repair, preserved verbatim in mathematical content:

```text
E_1 = -(hbar omega/2)(ell_f^2/R^2) approx -4.46 x 10^-21 J
alpha_eff ~ ell_f/r_mode -> 1/137
```

## Exact algebraic audit

With `n=l+1`, the valid S3 scalar spectrum is

`lambda_l R^2 = l(l+2) = (n-1)(n+1) = n^2-1`.

It does **not** imply an energy proportional to `1/n^2`. The exact identity is

`1/n^2 = 1/(1 + lambda_l R^2)`.

Therefore the archived ladder is the eigenvalue sequence of the inverse shifted operator

`(1 - R^2 Delta_S3)^(-1)`,

not of `-Delta_S3` itself. This is a mathematically precise possible representation, but it is a nonlocal resolvent absent from the displayed historical action. Adding it would be new machinery unless independently derived from the current finite-core construction.

The ground state is an exact discriminator: `l=0` gives `lambda_0=0`, while the archived `n=1` energy is finite and nonzero. No approximation `n^2-1 approx n^2` is valid at the ground state.

## Dimensions, limits, sign and topology

- Dimensions: `[hbar omega]=energy`; `(ell_f/R)^2` and `1/n^2` are dimensionless. The energy formula is dimensionally homogeneous if `omega` is an angular frequency and `R,ell_f` are lengths.
- Limits: `E_n -> 0` for `omega->0`, `ell_f/R->0`, or `n->infinity`; `E_n` diverges for `R->0`. The `n->infinity` accumulation is qualitatively hydrogen-like, but it was put in through `1/n^2`.
- Sign: the minus sign establishes a chosen bound-state zero; the nonnegative S3 Laplacian spectrum does not derive it. Multiplying a positive deficient magnitude by a subunit alpha makes it smaller.
- Topology: compact `S3` does provide a discrete scalar spectrum and scalar-harmonic degeneracy `(l+1)^2=n^2`. It does not by itself supply the Coulomb Hamiltonian, radial hydrogen wavefunctions, the binding-energy zero, a finite-core worldtube topology, or an observable equivalence between GR and QM.
- Parameterization: `omega`, `R`, and the stiffness inputs upstream of `omega` are not independently fixed here. The overall Rydberg scale can therefore be tuned even if the `1/n^2` shape is retained.

## 2022 CODATA comparison

NIST 2022 CODATA gives `R_infinity h c = 13.605693122990(15) eV`, or `2.179872361102907e-18 J`. The archived magnitude `4.46e-21 J` is `0.027837130472095 eV`, only `0.002045991352330` of the Rydberg energy: relative residual `-0.997954008647670`; required gain `488.760619081369`.

No uncertainty is stated for the archived number, so a defensible z-score cannot be computed. The CODATA uncertainty is irrelevant to a 99.8% deterministic miss.

The proposed repair also fails literally. With archived `ell_f=0.7937 fm` and the 2022 CODATA Bohr radius `a0=5.29177210544(82)e-11 m`,

`ell_f/a0 = 1.499875626133007e-5 = alpha/486.53`,

not `1/137`. Multiplication by CODATA `alpha=7.2973525643(11)e-3` lowers the already deficient result to `1.493032024146187e-5` of the Rydberg target. Division by alpha reaches only `0.280374469275268` of the target. The required gain is `3.566658556982/alpha`, not alpha.

In native Planck units (`c=G=hbar=1`, with 2022 CODATA `G` used only for SI conversion):

- `ell_f = 4.910734927385627e19 l_P`
- `a0 = 3.274094759474510e24 l_P`
- archived `|E1| = 2.280068436984018e-30 E_P`
- Rydberg energy `=1.114407660808199e-27 E_P`.

## Prediction-versus-fit verdict

The source genealogy itself records that the native mode-energy scaling rose as `n^2` and conflicted with the observed `1/n^2` ladder. The inverse dependence was then imposed to preserve the desired match. The normalization contains unfixed `omega` and `R`; the proposed alpha bridge neither equals `ell_f/a0` nor corrects the numeric miss. This is not an independent hydrogen prediction.

The exact inverse-shift identity is **INTERNALLY CHECKED mathematical salvage only**. It is eligible for later study as a solver representation if the inverse operator is independently motivated, but it is not an H(s)H construction candidate and does not establish physical equivalence.

## Complete executed Python

```python
#!/usr/bin/env python3
from math import pi, sqrt
h=6.626_070_15e-34; hbar=h/(2*pi); c=299_792_458.0
eV=1.602_176_634e-19; G=6.67430e-11
E_RY_EV=13.605_693_122_990; E_RY_EV_U=0.000_000_000_015
a0=5.291_772_105_44e-11; alpha=7.297_352_5643e-3
ell_f=0.7937e-15; E_archived_J=4.46e-21
E_RY_J=E_RY_EV*eV; ratio=E_archived_J/E_RY_J
lP=sqrt(hbar*G/c**3); tP=lP/c; EP=hbar/tP
print(f"E_Rydberg_CODATA2022_eV={E_RY_EV:.15f} +/- {E_RY_EV_U:.15f}")
print(f"E_Rydberg_CODATA2022_J={E_RY_J:.15e}")
print(f"archived_abs_E1_J={E_archived_J:.15e}")
print(f"archived_abs_E1_eV={E_archived_J/eV:.15f}")
print(f"archived_over_Rydberg={ratio:.15f}")
print(f"relative_residual={ratio-1:+.15f}")
print(f"required_multiplicative_gain={1/ratio:.12f}")
print(f"ell_f_over_a0={ell_f/a0:.15e}")
print(f"a0_over_ell_f={a0/ell_f:.12f}")
print(f"alpha_CODATA2022={alpha:.15e}")
print(f"(ell_f/a0)/alpha={(ell_f/a0)/alpha:.15e}")
print(f"required_gain_times_alpha={(1/ratio)*alpha:.12f}")
print(f"raw_times_alpha_over_Rydberg={ratio*alpha:.15e}")
print(f"raw_div_alpha_over_Rydberg={ratio/alpha:.15f}")
print(f"lP_m={lP:.15e}; tP_s={tP:.15e}; EP_J={EP:.15e}")
print(f"ell_f_in_lP={ell_f/lP:.15e}")
print(f"a0_in_lP={a0/lP:.15e}")
print(f"E_archived_in_EP={E_archived_J/EP:.15e}")
print(f"E_Rydberg_in_EP={E_RY_J/EP:.15e}")
for n in range(1,21):
    l=n-1
    assert l*(l+2)==n*n-1
    assert abs(1/(1+l*(l+2))-1/n**2)<1e-16
assert abs(ratio-0.002045991352330)<1e-15
assert 488<1/ratio<489
assert ell_f/a0<1.6e-5
assert ratio*alpha<1.5e-5
assert ratio/alpha<0.281
print("spectral_identity_n1_to_n20=PASS")
print("archived_500x_mismatch_reproduced=PASS")
print("ell_f_over_a0_is_not_alpha=PASS")
print("multiplying_by_alpha_moves_wrong_direction=PASS")
print("ALL_ASSERTIONS_PASSED")
```

Executed output, exit status 0:

```text
E_Rydberg_CODATA2022_eV=13.605693122990001 +/- 0.000000000015000
E_Rydberg_CODATA2022_J=2.179872361102907e-18
archived_abs_E1_J=4.460000000000000e-21
archived_abs_E1_eV=0.027837130472095
archived_over_Rydberg=0.002045991352330
relative_residual=-0.997954008647670
required_multiplicative_gain=488.760619081369
ell_f_over_a0=1.499875626133007e-05
a0_over_ell_f=66672.194852463144
alpha_CODATA2022=7.297352564300000e-03
(ell_f/a0)/alpha=2.055369550692502e-03
required_gain_times_alpha=3.566658556982
raw_times_alpha_over_Rydberg=1.493032024146187e-05
raw_div_alpha_over_Rydberg=0.280374469275268
lP_m=1.616255024423705e-35; tP_s=5.391246448313604e-44; EP_J=1.956081636698373e+09
ell_f_in_lP=4.910734927385627e+19
a0_in_lP=3.274094759474510e+24
E_archived_in_EP=2.280068436984018e-30
E_Rydberg_in_EP=1.114407660808199e-27
spectral_identity_n1_to_n20=PASS
archived_500x_mismatch_reproduced=PASS
ell_f_over_a0_is_not_alpha=PASS
multiplying_by_alpha_moves_wrong_direction=PASS
ALL_ASSERTIONS_PASSED
```

Python SHA-256: `3df0087b0d3ea46af7e2c88563dcdfa3114e3f41f3458f0f16d6da0ce2e8f089`; output SHA-256: `e2104030ce14a58d9b1566fac5c69b134fcf3462a38e274b385512bb7d88252a`.

## Lean verification

```lean
import Mathlib
namespace HsHVerification.ArchiveEQ0019
theorem shifted_s3_spectrum (n : ℝ) :
    (n - 1) * ((n - 1) + 2) = n^2 - 1 := by ring
theorem inverse_shift_identity (n : ℝ) (hn : n ≠ 0) :
    1 / (1 + (n - 1) * ((n - 1) + 2)) = 1 / n^2 := by
  rw [shifted_s3_spectrum]
  field_simp
theorem archived_ratio_is_below_0_21_percent :
    (2045991352330 : ℝ) / 1000000000000000 < 21 / 10000 := by norm_num
theorem archived_ratio_is_not_a_match :
    (2045991352330 : ℝ) / 1000000000000000 ≠ 1 := by norm_num
theorem multiplying_by_subunit_coupling_decreases
    (raw alpha : ℝ) (hraw : 0 < raw) (ha0 : 0 < alpha) (ha1 : alpha < 1) :
    raw * alpha < raw := by
  nlinarith [mul_pos hraw ha0, mul_lt_mul_of_pos_left ha1 hraw]
theorem filament_to_bohr_ratio_below_alpha :
    (1499875626133007 : ℝ) / 100000000000000000000 <
      72973525643 / 10000000000000 := by norm_num
end HsHVerification.ArchiveEQ0019
```

Formal commit submitted on the cumulative verification branch: `76314a1b1f86839a1a662200ecb5689fae886982`. CI receipt is checked separately; these lemmas verify only the stated algebra/order facts.

## Required reading round

- Full live `BEDROCK.md`: 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`.
- Full subordinate `STATE_OF_THE_THEORY.md`: 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Random draw 1 from 70 eligible search results selected `WORKSPACES/LOOM/README.md`, full 82 lines / 5,265 characters, blob `bae0d585c7d9aeb4d5c5dac53aae4894b847fb0d`; useful reminder that generated implementation, display grammar, derivation and Nathan-authored content must be typed separately.
- Because the first random file was short, a second actual random draw from three conversation-file candidates selected `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NATHANWORDS.txt`, full 222 lines / 28,701 characters, blob `e37b5d52ce00d9b40ec10328274694b564a7e9a2`. Honest takeaway: it is a polished generated compilation, useful for locating RMS/SAT themes but not primary Nathan wording; it also contains confident ontology and speculative claims that must not control this audit.

## Gate verdict and discriminator

`S3 spectrum: INTERNALLY_CHECKED.` `Hydrogen derivation: REJECTED AS PRESENTED.` `Inverse-shift resolvent: MATHEMATICALLY IDENTIFIED, NOT PHYSICALLY DERIVED.` `CODATA: COMPARED, FAIL.`

Reopen only if a source/current derivation supplies (i) the inverse shifted operator from the native finite-core action, (ii) an independently fixed normalization `hbar omega ell_f^2/(2R^2)`, (iii) the bound-state sign/energy zero, and (iv) held-out hydrogen observables beyond the already inserted `1/n^2` shape.
