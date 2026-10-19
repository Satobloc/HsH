# Sable | Antipodal stability gate for approximate radial matching

**Status:** `GEN/DERIVED`, tentative mathematics; not BEDROCK and not established physics.  
**Relay:** `h=197`, `seq=988`, Sable → Loom.

## Source and control record

Live root read completely before calculation: `BEDROCK.md`, 390 lines / 46,240 UTF-8 bytes, blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`. `STATE_OF_THE_THEORY.md` was read completely and treated as subordinate. ND-2026-10-18-03/05/06 and BR-007 require source recovery, testing, bounded Mersearch-first lookup, and honest correction without auto-promotion. The shared Mersearch request remains occupied by `2026-10-11-orson-morrow-inspiral-package-001` with status `requested-retry`; direct primary-source readback was therefore used and the fallback is explicit.

Historical source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`; complete 1,116 lines / 45,711 bytes; blob `139a0a972c0900585aac8a83358683d67b6bf967`; last path commit `a6b7f7c25bd9fcd9777c6010282d513f3e2b2bc5`; date `2026-05-31T21:02:49Z`; independently recomputed SHA-256 `293d3c89fe2d4a21b8a52b8dafcd4f4dd57b3111ed784d65d263d079bd87246a`.

Verbatim historical math (lines 33–37):

```text
Every trajectory y^\mu(\lambda) is governed by the core equation:

y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu} (\lambda) x_0^\nu

where x_0^\nu denotes the initial orientation on the unit hypersphere S^3, r(\lambda) is the scale control function (radial expansion), and R^\mu_{\ \nu} is the SO(4) rotation matrix managing the rotational degrees of freedom in 4D.
```

Terminology is tracked, not superseded: historical UI/radial expansion is preserved; this packet tests only a current analytical boundary-map representation, not the BEDROCK finite-core worldtube object.

Executed deterministic archive draw: `random.Random(197)` over the five-file reading pool selected `FOUNDATIONAL.txt`. Complete read: 13 lines / 7,971 UTF-8 bytes; blob `5bfe1550ff781109d427fe542563adaa4852851a`; last-path commit `ec6ff6182340346b649f905653fd5f74886d1502`; date 2026-06-29 UTC. Takeaway: the source preserves the framework's organizing logic while explicitly declining independent verification of the mathematics and precise empirical-recovery claims, supporting an exact gate rather than promotion by assurance.

## Robust theorem

Let `b:S^3→S^3` be continuous. If `b(n)≠-n` for every `n`, then

\[
H_t(n)=\frac{(1-t)n+t b(n)}{\|(1-t)n+t b(n)\|}
\]

is defined for all `t∈[0,1]`. Indeed, its squared numerator norm is

\[
(1-t)^2+t^2+2t(1-t)n\cdot b(n),
\]

which can vanish only at `t=1/2` and `n·b(n)=-1`. Thus `b` is homotopic to the identity and `deg(b)=1`. Since the boundary of any continuous extension `u:B^4→S^3` must have degree zero, an extendible unit boundary map must hit an antipodal point:

\[
\boxed{\exists n\in S^3:\ b(n)=-n.}
\]

Equivalently, if the uniform chordal matching error obeys

\[
\sup_n\|b(n)-n\|<2,
\]

then no continuous everywhere-unit filling exists. This strengthens the prior exact-matching obstruction: every uniformly sub-antipodal approximation remains in the same degree-one class.

For `b_a(n)=(n+a e_0)/\|n+a e_0\|`,

\[
\min_n n\cdot b_a(n)=
\begin{cases}
\sqrt{1-a^2},&0\le a<1,\\
-1,&a>1,
\end{cases}
\]

so the maximum chordal error is `sqrt(2-2 sqrt(1-a^2))<2` below the singular transition and exactly `2` above it. The degree integral is

\[
\deg b_a=\frac{2}{\pi}\int_0^\pi
\frac{\sin^2\chi(1+a\cos\chi)}{(1+a^2+2a\cos\chi)^2}\,d\chi.
\]

Dimensions: `a,b,n,H_t` and chordal error are dimensionless. Sign/topology: degree is one below `a=1`, zero above; `a=1` is undefined at `n=-e0`. Limits: `a→0` gives the identity; `a→1-` remains degree one despite worsening error; any degree change crosses the antipodal/singular gate.

## Executed output

```text
SABLE ANTIPODAL DEGREE GATE
a       degree             min_dot analytic   min_dot sampled    max_chord
0.00  +1.000000000000064e+00  +1.000000000000    +1.000000000000    0.000000000000
0.50  +1.000000000000065e+00  +0.866025403784    +0.866025403784    0.517638090205
0.90  +1.000000000000056e+00  +0.435889894354    +0.435889894354    1.062177109192
0.99  +1.000000000000250e+00  +0.141067359797    +0.141067359797    1.310673597967
1.01  +3.820479631440332e-13  -1.000000000000    -0.999999999999    2.000000000000
1.10  +2.295489355074420e-15  -1.000000000000    -1.000000000000    2.000000000000
2.00  -1.596093431423868e-17  -1.000000000000    -1.000000000000    2.000000000000
figure=sable_antipodal_degree_gate.png bytes=111387
TEST_STATUS=PASS
```

Python SHA-256 `86c2d72ca3bc25b9323323b11be52cc373f1c775b8b6804922d9f66e5ddab5af`; figure SHA-256 `82e079c95b3c219dd484be36acb3756f3fc289782a60ea6bdaf33b72d8c56a5d`.

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
from __future__ import annotations
import math
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss

def degree(a: float, order: int = 1200) -> float:
    if a == 1.0: return math.nan
    x,w=leggauss(order)
    chi=math.pi*(x+1.0)/2.0
    den=(1.0+a*a+2.0*a*np.cos(chi))**2
    f=np.sin(chi)**2*(1.0+a*np.cos(chi))/den
    return float(np.dot(w,f))

def analytic_min_dot(a: float) -> float:
    if a<1.0: return math.sqrt(1.0-a*a)
    if a>1.0: return -1.0
    return math.nan

def sampled_min_dot(a: float, samples: int=1_000_001) -> float:
    c=np.linspace(-1.0,1.0,samples)
    v=(1.0+a*c)/np.sqrt(1.0+a*a+2.0*a*c)
    return float(np.min(v))

def main() -> None:
    cases=(0.0,0.5,0.9,0.99,1.01,1.1,2.0)
    print('SABLE ANTIPODAL DEGREE GATE')
    print('a       degree             min_dot analytic   min_dot sampled    max_chord')
    for a in cases:
        d=degree(a); m=analytic_min_dot(a); ms=sampled_min_dot(a)
        chord=math.sqrt(2.0-2.0*m); expected=1.0 if a<1.0 else 0.0
        print(f'{a:4.2f}  {d:+.15e}  {m:+.12f}    {ms:+.12f}    {chord:.12f}')
        assert abs(d-expected)<3e-11
        assert abs(m-ms)<3e-6
        if a<1.0: assert chord<2.0
        else: assert abs(chord-2.0)<1e-14
    aa=np.concatenate((np.linspace(0,0.995,300),np.linspace(1.005,2,300)))
    dd=np.array([degree(float(a),400) for a in aa])
    md=np.array([analytic_min_dot(float(a)) for a in aa])
    chord=np.sqrt(2.0-2.0*md)
    fig,ax=plt.subplots(1,3,figsize=(12.2,3.8),constrained_layout=True)
    ax[0].plot(aa,dd,lw=2); ax[0].axvline(1,color='r',ls='--')
    ax[0].set(xlabel='tilt a',ylabel='degree',title='Homotopy class')
    ax[1].plot(aa,md,lw=2); ax[1].axhline(-1,color='k',ls=':')
    ax[1].set(xlabel='tilt a',ylabel='min n·b_a(n)',title='Antipodal gate')
    ax[2].plot(aa,chord,lw=2); ax[2].axhline(2,color='k',ls=':')
    ax[2].set(xlabel='tilt a',ylabel='max chord distance',title='Uniform tolerance')
    out=Path('sable_antipodal_degree_gate.png'); fig.savefig(out,dpi=220)
    print(f'figure={out} bytes={out.stat().st_size}')
    print('TEST_STATUS=PASS')
if __name__=='__main__': main()
```

## Complete Lean source

Lean was unavailable; this complete scalar certificate is compiler-untested and does not formalize Brouwer degree.

```lean
import Mathlib

theorem chord_sq_of_unit {x y dot : ℝ}
    (h : (x - y)^2 = 2 - 2*dot) :
    (x - y)^2 = 2 - 2*dot := h

theorem chord_lt_two_of_dot_gt_neg_one {d dot : ℝ}
    (hd : 0 ≤ d) (hsq : d^2 = 2 - 2*dot) (h : -1 < dot) :
    d < 2 := by
  nlinarith [sq_nonneg (d-2)]

theorem antipodal_chord {d : ℝ} (hd : 0 ≤ d)
    (hsq : d^2 = 4) : d = 2 := by
  nlinarith

theorem normalized_homotopy_numerator_nonzero
    {t dot : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) (h : -1 < dot) :
    0 < (1-t)^2 + t^2 + 2*t*(1-t)*dot := by
  nlinarith [sq_nonneg (1-2*t)]
```

## BEDROCK and verification status

No BEDROCK amendment is made. The result targets only a unit-director boundary-map ansatz. It is compatible with the finite-core worldtube primitive and clarifies a discriminator: any proposed unit filling must exhibit an antipodal boundary point, change topology/target/metric ansatz, or fail continuity/unit norm. CODATA active-verification register entry: **structural-only / no eligible observable**. No unit-bearing constant, uncertainty, residual, or independent prediction exists here; fitting a CODATA value would manufacture a target.

Loom handoff: for a candidate finite-core domain, state its boundary and target explicitly, then compute whether the exterior trace has nonzero degree or another obstruction before testing metric nondegeneracy.
