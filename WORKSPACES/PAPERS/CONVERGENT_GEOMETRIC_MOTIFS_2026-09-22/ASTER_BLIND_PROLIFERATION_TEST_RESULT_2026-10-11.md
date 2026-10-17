# GRURPLE-A — Blind external-literature proliferation test result — 2026-10-11

**Worker:** Aster  
**Question:** Does a blinded random arXiv physics control support Paper A's residual field-level phrase “recent proliferation of structurally convergent motifs”?  
**Protocol:** `ASTER_BLIND_PROLIFERATION_TEST_PROTOCOL_2026-10-11.md`  
**Frozen protocol commit:** `97c98edb4ffaf72a08cdc7ad18bd9ed3b5c0d7c9`  
**Frozen blind-score artifact:** `ASTER_BLIND_PROLIFERATION_SCORES_FROZEN_2026-10-11.md`  
**Frozen score commit:** `2835c36331aff531ae033935555715ce606b6c98`  
**Status:** `UNBLINDED_RESULT_COMPLETE`

## Bottom line

**The random control does not support the word “proliferation.”**

Confirmed Paper-A-style compound structures were:

| year | confirmed / 100 | rate |
|---|---:|---:|
| 2024 | 1 | 1% |
| 2025 | 3 | 3% |
| 2026 | 1 | 1% |

The frozen ambiguous holonomy case (XR185) belongs to **2024**. Counting it in a permissive sensitivity analysis changes the sequence to:

[
2%, 3%, 1%
]

which is even less compatible with a 2024→2026 rise.

Therefore the appropriate disposition under the predeclared decision rule is:

> **NO SUPPORT for a field-wide proliferation claim in this control.**

This does **not** weaken Paper A's selected-example structural-convergence thesis.

## Blinding integrity

Before unblinding:
- the scoring protocol was committed;
- the semantic labels were committed;
- the primary confirmed set was frozen as exactly:
  [
  {mathrm{XR017,XR068,XR084,XR140,XR287}};
  ]
- XR185 was frozen as ambiguous and excluded from the primary count;
- Aster had not opened the year/category/author/arXiv key.

The withheld key was opened only after commit `2835c36331aff531ae033935555715ce606b6c98`.

No primary label was changed after unblinding.

## Unblinded confirmed cases

| blind id | year | arXiv | primary domain | title |
|---|---:|---|---|---|
| XR287 | 2024 | 2403.02575 | cond-mat.mes-hall | *Topological protection revealed by real-time longitudinal and transverse studies* |
| XR068 | 2025 | 2508.13147 | cond-mat.mes-hall | *Strain-induced Ettingshausen effect in spin-orbit coupled noncentrosymmetric metals* |
| XR084 | 2025 | 2506.18664 | cond-mat.soft | *Shaping boundaries to control and transport topological defects in colloidal nematic liquid crystals* |
| XR140 | 2025 | 2503.17568 | cond-mat.mtrl-sci | *Long-range magnetic perturbations at Bi2Te3/Cr2Te3 interfaces induced by chemical diffusion and proximity effects* |
| XR017 | 2026 | 2608.27445 | cond-mat.mes-hall | *Band's Geometry Origin of Quantum Spin Transport Phenomena* |

Ambiguous:
- XR185 — 2024 — arXiv:2409.01278 — cond-mat.mes-hall — *Redshift as a stretching factor in rotating graphene wormholes*.

## Statistical read

### 2024 vs 2026

Primary table:

[
egin{array}{c|cc}
 & 	ext{compound} & 	ext{not compound}\
hline
2024 & 1 & 99\
2026 & 1 & 99
end{array}
]

Two-sided Fisher exact:
- odds ratio = **1.0**
- (p=1.0)

Risk difference:
[
1%-1%=0 	ext{percentage points}.
]

Risk ratio:
[
RR=1.0.
]

Exact 95% binomial interval for 1/100 is approximately:
[
0.025%	ext{ to }5.446%.
]

There is no directional signal to defend.

### 2024 vs 2025

Two-sided Fisher exact for 1/100 vs 3/100:
- odds ratio (approx 0.327) when 2024 is first row;
- (papprox0.621).

Descriptively, 2025 is higher, but the sample is far too sparse to treat that bump as a robust trend.

Exact 95% binomial interval for 3/100 is approximately:
[
0.623%	ext{ to }8.518%.
]

### 2025 vs 2026

Two-sided Fisher exact for 3/100 vs 1/100:
- (papprox0.621).

Again, no robust difference.

## Category structure

All **five** confirmed cases are in condensed-matter categories.

Any-cond-mat representation in the random sample was:

| year | any cond-mat / 100 | confirmed compounds |
|---|---:|---:|
| 2024 | 34 | 1 |
| 2025 | 26 | 3 |
| 2026 | 30 | 1 |

Thus the small 2025 bump is **not** simply caused by a larger condensed-matter share that year. But because every confirmed hit comes from condensed matter, these data cannot support a **physics-wide** proliferation claim.

Within the broad any-cond-mat denominator, the descriptive rates are approximately:
- 2024: 1/34 = 2.9%
- 2025: 3/26 = 11.5%
- 2026: 1/30 = 3.3%

This is a mid-period bump, not a monotonic rise.

## Frozen lexical motif diagnostics

The secondary lexical screen, which is not the semantic endpoint, also fails to show a general monotonic rise:

| motif | 2024 | 2025 | 2026 |
|---|---:|---:|---:|
| G: geometry/topology | 21 | 17 | 18 |
| T: evolution/transport | 24 | 36 | 22 |
| C: closure/holonomy/recurrence | 2 | 2 | 2 |
| O: orientation/chirality/TR | 5 | 13 | 4 |
| E: effective/generated distinction | 44 | 52 | 53 |

Only the broad E vocabulary rises monotonically, and by itself it is far too generic to support Paper A's compound architecture.

Notably:
- C is flat;
- G is slightly lower in 2026 than 2024;
- O peaks in 2025 and is lower in 2026 than 2024;
- T peaks in 2025 and falls below 2024 in 2026.

The semantic and lexical diagnostics agree on the key point: **there is no 2024→2026 proliferation signal for the compound motif package in this sample.**

## What this test does and does not show

### It does show

The accepted R1's field-wide wording is not earned by this available random control.

### It does not show

It does not show that:
- the selected comparison papers are uninteresting;
- their conjunction is common or trivial;
- Paper A's structural synthesis is wrong;
- no narrower subfield trend exists;
- the selected recent programmes fail to converge structurally;
- the external literature has no longer-term historical trend outside 2024–2026.

The test is deliberately broad and low-powered: 100 random physics abstracts per year.

## Manuscript consequence

Paper A should keep **“structural convergence”** for the selected-example comparison but remove **“proliferation”** as a field-trend claim.

Two surgical replacements are sufficient.

Current:
> “The relevant observation is the recent proliferation of structurally convergent motifs: ...”

Recommended:
> **“The relevant observation is the co-occurrence, across the selected recent programmes, of structurally convergent motifs: ...”**

Current:
> “The proliferation of these motifs is therefore worth recording without inflating it into validation.”

Recommended:
> **“Their co-occurrence across the selected recent programmes is therefore worth recording without inflating it into validation.”**

This makes the paper **more exact without making it less ambitious**. The hot-paper claim is the structural conjunction among the selected programmes and its relation to SAT, not an unsupported sociology-of-physics trend claim.

## Decision

`TERN-A-02 RESIDUAL DEFECT CONFIRMED BY BLIND CONTROL`.

Recommended action:
- preserve accepted R1 unchanged as the accepted historical blob until the Originator chooses to reopen;
- if/when a successor revision is issued, apply the two wording changes above;
- do not add a paragraph about this control to Paper A unless there is a separate reason to discuss field prevalence.

## Next cursor

The random corpus is more useful next as a **null comparator for conjunction rarity**, not as a trend detector:
- estimate how often the full Paper-A compound architecture appears at all in broad physics;
- compare that base rate with the deliberately selected Paper-A comparator set;
- avoid turning a selected-case paper into a bibliometrics paper unless the null comparison materially changes the argument.
