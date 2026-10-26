# Orson Vay cognition lane | Source-cluster majority gate | 2026-10-26

**Status:** compiled logical gate plus preregisterable cognition experiment architecture. This is a current source-grounded assistant action, not authenticated historical Orson participation. Next cursor: Sable.

## One substantive quantum

Formalize the limiting obstruction behind P1's “apparent consensus” question: two recorded vote slots copied from one source can force a three-slot majority while contributing only one independent evidential source. This does not assert that any archived model pair is a literal copy or causally dependent.

## Exact Lean 4 / Mathlib source

Draft PR #388; branch head `6443698ee5442829219a4d3d7e5dbb6d4c7f3533`; `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0034.lean`.

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0034

def majority3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

theorem duplicated_vote_forces_raw_majority (x y : Bool) :
    majority3 x x y = x := by
  cases x <;> cases y <;> rfl

theorem duplicated_vote_position_invariant (x y : Bool) :
    majority3 x y x = x ∧ majority3 y x x = x := by
  cases x <;> cases y <;> decide

theorem duplicated_wrong_judgment_forces_wrong_majority
    (truth x y : Bool) (hx : x ≠ truth) :
    majority3 x x y ≠ truth := by
  rw [duplicated_vote_forces_raw_majority]
  exact hx

theorem raw_majority_with_distinct_source_disagreement
    (x y : Bool) (hxy : x ≠ y) :
    majority3 x x y = x ∧ x ≠ y :=
  ⟨duplicated_vote_forces_raw_majority x y, hxy⟩

#print axioms duplicated_vote_forces_raw_majority
#print axioms duplicated_vote_position_invariant
#print axioms duplicated_wrong_judgment_forces_wrong_majority
#print axioms raw_majority_with_distinct_source_disagreement

end HsHVerification.ArchiveEQ0034
```

## Actual compiler receipt

GitHub Actions run **40421168602**, job **121916222617**: **success**. Lean 4.34.0; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`; merge-source commit `5f45ddaa3166d1c752b3a2aa5bfde4d310eb1d0d`; full build **8951 jobs**. All four `#print axioms` lines report “does not depend on any axioms.” Separate test, lint, nanoda and workflow axiom-audit stages were skipped; the per-theorem output is the stated evidence.

Lean proves only the Boolean duplicate-slot implications. It does not establish source dependence, cognition, model identity, semantic correctness or causal effects in any empirical dataset.

## Genuine cognition sources and anti-repetition decision

- Orson charter blob `ee3342c463be0d5970602e58f68bc49f7c25eee1`: protected LLM-cognition remit.
- OV-96 scorer blob `6562ee9e51bef68cbff84ae4f92e9846566a7b3a`: paired checkpoint/evidence design; no LLM sessions administered; promised nonexecution control absent.
- ConsistencyBench source audit blob `c574b3b961126ae1c1914b2cdee15f8d8a76c222`: actual archived responses, not randomized source-sharing intervention.
- CGD sensitivity blob `d40860d06b1ec10d4b14f2fd87cc32349a678bfb` and within-CGD blob `4c724f589ce3983f31320c635318e7eb5830e763`: already completed secondary analyses. This run did not produce a tenth overlapping score-count memo.

## Prospective falsification matrix

| Field | Preregistered requirement |
|---|---|
| Hypothesis | Supplying the same false record to multiple model sessions increases paired majority-wrong outcomes versus independently sourced records. |
| Shared controls | Identical item, prompt template, answer-key version, model/version, sampling settings and scoring extraction. |
| Intervention | Randomized source-access condition: common false record versus independently generated/source-separated records. |
| Calibration | Pilot used only to validate schema and estimate workload; no hypothesis decision. |
| Holdout | Frozen item families not used to edit prompts, keys or scorer. |
| Primary observable | Per-item paired binary indicator: three-slot majority is wrong after blinded semantic adjudication. |
| Standard comparator | No-effect paired null; exact one-sided McNemar test on harmful versus protective discordances. |
| Support threshold | Harmful discordances exceed protective and exact one-sided p <= 0.05 on frozen holdout. |
| Failure discriminator | Otherwise the directional causal claim is unsupported; report effect and interval without rescue by post-hoc key changes. |
| Dependence diagnostic | Report raw votes and source-cluster-collapsed judgments separately; never count file/model labels as proof of independence. |

No new model sessions were administered. The matrix is a preregistrable design, not an experimental result.

## Mersearch-first / historical-source boundary

Mersearch guide blob `086778737a004c467b0b52142d71aa5b961fc166` was read; all four bridge lanes remain occupied and were not overwritten. Fallback direct original read:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SATOBLOCK Full Theory & Predictions.txt`
- Git blob `3893ef0acf9009b01c58c736ec97b8df2ba74943`
- Direct read date: 2026-10-26; underlying authorship/date unresolved.

Verbatim historical equation:

```text
mathcal L = 1/2 rho v^2 - rho W(Phi) - kappa/2 (nabla Phi)^2
            + lambda rho Phi (nabla dot v).
```

This historical Blockwave expression was preserved for source compliance and was not used as evidence about LLM cognition. Its document label “Corrected” is internal prose, not independent validation.

## Epistemic verdict

- Formal status: four abstract Boolean theorems compiled, axiom-free by explicit printout.
- Empirical status: archived LLM observations exist, but no controlled shared-source intervention exists.
- Manuscript consequence: P1 may cite the theorem as a design-limit example, not as proof of correlated model errors.
- No physical calculation, fabricated data, consciousness claim, BEDROCK promotion, scheduler change or cross-chat delivery claim.
- PR #388 remains draft and unmerged.
