# GRURPLE-A — Compound-architecture random-corpus base rate — 2026-10-11

**Worker:** Aster  
**Source experiment:** blinded 300-abstract arXiv physics corpus, frozen Paper-A motif classifier  
**Depends on:**  
- `ASTER_BLIND_PROLIFERATION_TEST_PROTOCOL_2026-10-11.md`  
- `ASTER_BLIND_PROLIFERATION_SCORES_FROZEN_2026-10-11.md`  
- `ASTER_BLIND_PROLIFERATION_TEST_RESULT_2026-10-11.md`  
**Status:** `DESCRIPTIVE_NULL_CONTROL`

## Question

Paper A anticipates the objection:

> Isn't this just “geometry everywhere”?

The random corpus can answer one narrow version of that question:

> How often does a **single random physics abstract** instantiate the frozen compound architecture requiring substantive geometry/topology, at least one closure/orientation structure, and an explicit structural dependency to a physical/effective distinction?

It cannot tell us the probability that a deliberately selected multi-paper synthesis would arise by chance.

## Overall base rate

Frozen confirmed compounds:

[
5/300 = 1.67%.
]

Exact Clopper-Pearson 95% interval:

[
0.54%	ext{ to }3.85%.
]

Within this broad random physics sample, the strict compound architecture is therefore **uncommon at abstract level**.

This supports a limited statement:

> The conjunction is not so generic that the frozen classifier labels a large fraction of random physics abstracts.

It does **not** establish novelty, importance, SAT validation, or statistical surprise for the hand-selected Paper-A comparator set.

## Domain concentration

Every confirmed hit has at least one condensed-matter category.

Across all three years:
- abstracts with any `cond-mat.*` category: **90**
- other physics abstracts: **210**
- confirmed compounds in cond-mat: **5**
- confirmed compounds outside cond-mat: **0**

Rates:

[
5/90 = 5.56%
]

versus

[
0/210 = 0%.
]

Exact 95% intervals:
- cond-mat: approximately **1.83%–12.49%**
- non-cond-mat: **0%–1.74%**

Two-sided Fisher exact on

[
egin{array}{c|cc}
 & 	ext{compound} & 	ext{not compound}\
hline
	ext{cond-mat} & 5 & 85\
	ext{other physics} & 0 & 210
end{array}
]

gives:

[
p approx 0.00224.
]

This is a real concentration **under this classifier and sample**.

## Interpretation

The result is interesting for exactly the opposite reason from a field-wide “proliferation” story.

The strict architecture appears:
- rare in broad physics abstracts;
- concentrated in condensed-matter/materials/topological-transport contexts;
- not rising from 2024 to 2026 in the random sample.

That makes the Paper-A selection question sharper:

> Why do several deliberately selected fundamental-physics programmes collectively reconstruct neighboring pieces of an architecture that, when demanded within one random abstract, is mostly found in condensed-matter/topological-transport work?

That is a **research question**, not an inference from this control.

## Critical selection-bias firewall

Do **not** compute a p-value by treating Paper A's chosen comparator papers as a random sample.

They were selected because their structures were already noticed. Comparing “4 or 5 interesting selected papers” against a 1.67% random base rate as though the selection were blind would be invalid post-selection statistics.

The valid uses of this null are narrower:

1. rebut the claim that the compound definition labels “everything geometric”;
2. show that the classifier is selective;
3. identify domain concentration;
4. motivate a future pre-registered search over a truly independent corpus.

## Structural mismatch with Paper A

The random-corpus classifier asks whether **one abstract** contains a compound architecture.

Paper A's central object is different:
- one programme supplies topology/orientation;
- another supplies continuous quantum/classical evolution;
- another supplies closure/recurrence;
- another supplies holonomy/orientation;
- the paper constructs the conjunction across them.

Therefore the base-rate test is a **specificity control for the motif definition**, not a direct test of the synthesis probability.

## Potential future rigorous test

If this question becomes publication-critical, pre-register a second experiment:

1. freeze the five motif definitions;
2. draw random **sets of four or five papers** from matched physics subfields/years;
3. score whether each set collectively covers the full motif vector;
4. preserve the rule that each motif must be source-typed and object-level, not keyword-only;
5. compare the deliberately selected Paper-A set only as an external reference after the null distribution is frozen.

That would test **collective coverage rarity** much more directly while preserving the post-selection caveat.

## Paper-A use

No manuscript insertion is recommended at present.

If Paper A later gains a short “why this is not geometry everywhere” paragraph, the safest qualitative wording from this control is:

> A blind random-abstract control suggests that the compound motif definition is selective rather than ubiquitous, but the deliberately selected comparison set is not a random sample and no significance claim is attached to that observation.

For the current accepted R1, the better move remains simply:
- keep structural convergence;
- remove unsupported field-wide “proliferation.”
