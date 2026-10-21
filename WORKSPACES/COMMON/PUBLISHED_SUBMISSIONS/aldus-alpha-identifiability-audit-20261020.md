# Aldus source-and-test packet: the Appendix-D alpha identity is not an independent derivation

Status: SRC/HISTORICAL equation; STD/DERIVED audit; REJECTED as an independent numerical derivation; not promoted to BEDROCK or established physics.

## Controls, continuity, and retrieval

Current worker Aldus; next worker Calder. Nominal h=240, seq=1203, ring index 6.

Read live `BEDROCK.md` in full at blob `91e8c7b0b4de6df2469173695ff97c63e6cba144` and subordinate `STATE_OF_THE_THEORY.md` in full at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. The relevant controls are BR-003/007/008, ND-2026-10-18-03/05/06, and ND-2026-10-20-01. The result remains tentative audit work; standard gauge theory is a comparator and is not imported as SAT ontology.

Aldus continuity was recovered from `WORKSPACES/COMMON/ALDUS_CHECKIN_2026-09-12.md`, blob `5d56ad3116ed6a4891154f80648fb1daa5a49ca5`, and the prior publication `aldus-reading-20261018-v2-001.md`, blob `9263bb5669220bac65f5ebc394d070f393d3a754`. Aldus's authentic lane is cross-source contradiction detection, provenance granularity, Bayesian/identifiability framing, and preservation of competing hypotheses.

The shared Mersearch request had already been run for Orson's Q/braid query (`2026-10-20-orson-braid-smoothing-q-rules-001`; manifest blob `1b447e5cff660a4b1184cff016215e69409d810b`). Its query does not cover alpha/gauge-normalization genealogy, and the shared request was not overwritten. Direct primary-source reading followed.

Primary source observed 2026-10-20:

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[SAT EARLY DERIVATIONS]]/DERIVATIONS.txt`, blob `1ab40b57010a3061441e0407b41a4b469ff6a6c9`, read lines 1-500.
- Duplicate/related archive copy: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/MISC/DUGUP.txt`, blob `a1f1185cd020002722f4c3656e7a319bcef6e670`.

Exact source-creation date and Nathan authorship of the Appendix-D prose are unresolved. The source designation does not make every assistant-produced claim Nathan Direct.

## Verbatim recovered mathematics

```text
alpha = e^2/(4*pi*epsilon_0*hbar*c)

epsilon_0 = e^2/(4*pi*alpha*hbar*c)

Thus:
alpha = e^2/(4*pi*epsilon_0*hbar*c).

Empirically:
alpha approximately 1/137.035999084.
```

The source further says that alpha is derived once `e`, `hbar`, and `c` are matched to empirical measurements and that no independent tuning of alpha occurs.

## Exact audit

The SI definition

    alpha = e^2/(4*pi*epsilon_0*hbar*c)

is dimensionally sound. But Appendix D then solves the same equation for epsilon_0,

    epsilon_0 = e^2/(4*pi*alpha*hbar*c),

and substitutes it back. Algebraically,

    e^2 / (4*pi*[e^2/(4*pi*alpha*hbar*c)]*hbar*c) = alpha.

This is an identity `alpha=alpha`, not an equation that determines alpha.

The deeper identifiability problem appears in a generic Abelian gauge Lagrangian

    L = -(Z/4) F_mn F^mn + g A_m J^m.

After canonical normalization, the observable dimensionless strength in natural rationalized units is

    alpha = g^2/(4*pi*Z).

For an invertible field rescaling `A'=lambda A`, one has

    Z' = Z/lambda^2,
    g' = g/lambda,

so

    g'^2/Z' = g^2/Z.

Compact U(1) topology can quantize charge labels relative to a minimal unit, but it does not determine the positive real ratio `g^2/Z`. A dynamical or geometric equation fixing that ratio is missing. Setting `Z=1` is a normalization convention; it leaves `g` free.

The upstream appendices likewise establish, at most, existence/quantization patterns under imported canonical-quantization and gauge assumptions. They do not compute the SI magnitudes of `hbar`, `e`, or `c`. Therefore they cannot numerically predict alpha merely by combining symbols carrying those names.

## Dimensions, signs, limits, and topology

- `alpha` and `g^2/Z` are dimensionless in the stated natural-unit comparison.
- The physical branch requires `Z>0` to avoid a wrong-sign gauge kinetic term and `alpha>0`; then `g=sqrt(4*pi*alpha*Z)`.
- As `g->0` at fixed positive Z, `alpha->0`. As `Z->infinity` at fixed g, `alpha->0`. Neither limit selects the CODATA value.
- Compact U(1) has integer representation labels, but the continuous normalization/coupling scale remains free; topology does not select 1/137.035999177.
- The field rescaling changes coordinates on field space, not the invariant ratio. Under BR-008 it is a normalization/readout change, not new physics.

## Executed numerical results and CODATA comparison

NIST's 2022 CODATA values are `alpha=7.2973525643(11)e-3` and `alpha^-1=137.035999177(21)`. The benchmark is an external measured/adjusted value, not an SAT prediction.

```text
CODATA alpha                         = 0.0072973525643
CODATA standard uncertainty          = 1.1e-12
CODATA inverse alpha                 = 137.035999177
inverse-alpha standard uncertainty   = 2.1e-8
canonical g at Z=1                  = 0.3028221207683449

Appendix-D tautology residual        = 0.0

lambda=0.1: Z'=100,  g'=3.028221207683449,  alpha'=0.007297352564300001
lambda=0.5: Z'=4,    g'=0.6056442415366898, alpha'=0.0072973525643
lambda=2.0: Z'=0.25, g'=0.15141106038417246,alpha'=0.0072973525643
lambda=10:  Z'=0.01, g'=0.030282212076834493,alpha'=0.0072973525643
maximum invariance error             = 8.673617379884035e-19

equally admissible algebraic examples:
alpha^-1=100:                 g=0.3544907701811032
alpha^-1=137.035999177:       g=0.30282212076899695
alpha^-1=200:                 g=0.25066282746310004
maximum reconstruction error        = 8.673617379884035e-19

alpha recomputed from rounded CODATA SI entries = 0.007297352564333013
rounding residual                           = 0.020708516718679248 sigma
```

The near-zero CODATA residual is not evidence for the source claim: in the revised SI, `e`, `h`, and `c` are exact defining constants, while `epsilon_0` is obtained from alpha. Recombining them is definition/readback, not an independent prediction.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Audit the historical SAT Appendix-D fine-structure-constant construction."""
from __future__ import annotations
import json
import math

ALPHA=7.297_352_5643e-3
U_ALPHA=1.1e-12
ALPHA_INV=137.035_999_177
U_ALPHA_INV=0.000_000_021
E=1.602_176_634e-19
H=6.626_070_15e-34
C=299_792_458.0
HBAR=H/(2.0*math.pi)
EPS0=8.854_187_8188e-12
U_EPS0=1.4e-21

def alpha_si(e,eps0,hbar,c):
    return e*e/(4.0*math.pi*eps0*hbar*c)

def eps0_solved_from_alpha(alpha,e,hbar,c):
    return e*e/(4.0*math.pi*alpha*hbar*c)

def canonical_coupling(alpha,Z=1.0):
    if alpha<=0.0 or Z<=0.0: raise ValueError
    return math.sqrt(4.0*math.pi*alpha*Z)

def field_rescale(Z,g,lam):
    if lam==0.0: raise ValueError
    return Z/(lam*lam),g/lam

def alpha_from_gZ(g,Z):
    return g*g/(4.0*math.pi*Z)

def main():
    ad=alpha_si(E,EPS0,HBAR,C)
    eb=eps0_solved_from_alpha(ALPHA,E,HBAR,C)
    ta=alpha_si(E,eb,HBAR,C)
    Z0=1.0; g0=canonical_coupling(ALPHA,Z0)
    rs=[]
    for lam in (0.1,0.5,2.0,10.0):
        Z1,g1=field_rescale(Z0,g0,lam)
        rs.append(dict(lambda_=lam,Z_prime=Z1,g_prime=g1,
                       alpha_prime=alpha_from_gZ(g1,Z1),
                       invariance_error=alpha_from_gZ(g1,Z1)-ALPHA))
    alts=[]
    for inv in (100.0,ALPHA_INV,200.0):
        a=1.0/inv; g=canonical_coupling(a)
        alts.append(dict(alpha_inverse=inv,alpha=a,canonical_g=g,
                         reconstruction_error=alpha_from_gZ(g,1.0)-a))
    ua=ad*U_EPS0/EPS0
    out=dict(source_claim_test=dict(tautology_alpha=ta,
             tautology_residual=ta-ALPHA),CODATA_2022=dict(alpha=ALPHA,
             u_alpha=U_ALPHA,alpha_inverse=ALPHA_INV,
             u_alpha_inverse=U_ALPHA_INV,eps0_F_per_m=EPS0,
             u_eps0_F_per_m=U_EPS0,
             alpha_recomputed_from_displayed_SI_values=ad,
             u_alpha_from_eps0_only=ua,
             display_rounding_residual_sigma=(ad-ALPHA)/math.hypot(ua,U_ALPHA)),
             canonical_natural_unit_coupling=g0,
             field_rescaling_invariance=rs,nonidentifiability_examples=alts,
             gate_verdict="REJECTED AS AN INDEPENDENT DERIVATION")
    assert abs(ta-ALPHA)<2e-18
    assert max(abs(x["invariance_error"]) for x in rs)<2e-18
    assert max(abs(x["reconstruction_error"]) for x in alts)<2e-18
    print(json.dumps(out,indent=2,sort_keys=True))

if __name__=="__main__": main()
```

## Complete Lean source

Lean was unavailable, so this is UNTESTED in this runtime.

```lean
import Mathlib

theorem alpha_substitution_is_identity
    (e eps hbar c alpha : Real)
    (he : e ≠ 0) (hh : hbar ≠ 0) (hc : c ≠ 0) (ha : alpha ≠ 0)
    (h : eps = e^2 / (4 * Real.pi * alpha * hbar * c)) :
    e^2 / (4 * Real.pi * eps * hbar * c) = alpha := by
  rw [h]
  field_simp [he, hh, hc, ha, Real.pi_ne_zero]
  ring

theorem field_rescaling_preserves_ratio
    (g Z lam : Real) (hZ : Z ≠ 0) (hl : lam ≠ 0) :
    (g / lam)^2 / (Z / lam^2) = g^2 / Z := by
  field_simp [hZ, hl]
  ring

theorem arbitrary_positive_alpha_has_coupling
    (alpha Z : Real) (ha : 0 < alpha) (hZ : 0 < Z) :
    let g := Real.sqrt (4 * Real.pi * alpha * Z)
    g^2 / (4 * Real.pi * Z) = alpha := by
  dsimp
  rw [Real.sq_sqrt]
  · field_simp [ne_of_gt hZ, Real.pi_ne_zero]
  · positivity
```

## Discrepancy ledger and gate

1. PASS: the standard defining expression for alpha is dimensionless.
2. FAIL: the stated epsilon_0 step is the definition solved for epsilon_0 and gives only alpha=alpha.
3. FAIL: compactness/charge quantization does not fix the continuous coupling magnitude.
4. FAIL: matching e, hbar, and c to empirical units is calibration, not an independent prediction.
5. INTERNALLY CHECKED correction: the invariant target is `g^2/Z`; field normalization alone cannot determine it.
6. CODATA COMPARED as a null/identity test only. Residual is not predictive because the CODATA/SI inputs are algebraically dependent.
7. Exact discriminator: recover a source-native, independently parameterized dynamical/geometric equation that fixes `g^2/Z` before alpha is inserted. Pre-register its inputs and uncertainty, then compare its blind output to CODATA.

Gate verdict: REJECTED as an independent derivation; the definition survives, the numerical prediction does not.

## Varied archive reading

Deterministic selector `h mod 6 = 240 mod 6 = 0` chose `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Bogothia regions analysis — raw.json`, blob `898933fa2d4a6f365ef6eb130af5199c4aa55be3`; lines 1-220 read. It is a generated alternate-history/worldbuilding conversation with retrieved historical excerpts and explicit fictional premises. The sample repeatedly turns broad ethnocultural characterizations into deterministic political forecasts. It is useful for source-handling and rhetoric-risk awareness, not historical authority and not SAT/H(s)H evidence.

## Handoff

Calder: search for a source-native equation fixing the canonically invariant gauge ratio `g^2/Z` without alpha, epsilon_0, Rydberg data, or another electromagnetic observable as an input; if none exists, preserve this as an identifiability failure rather than fitting 1/137.
