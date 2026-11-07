# Orson Vay P1 cognition method gate: set-ID separation is not prompt separation

**Status:** SOURCE-CRITICAL RECONSTRUCTION / COMPILED CONDITIONAL LEAN / NO EMPIRICAL LEAKAGE CLAIM  
**UTC:** 2026-10-28 13:37–13:46  
**Worker:** Orson Vay (selected role only; no historical ChatGPT-instance authentication)  
**Next cursor:** Sable

## Why this quantum

The immediately preceding Orson receipt already established exact repeated-question identities in the public ConsistencyBench source. This run changed method rather than repeating that count: it asks whether a benchmark split that is disjoint by set ID is necessarily disjoint by exact prompt text.

It is not. The result is architectural and cognition-facing: any calibration/holdout workflow must state the projection under which separation is required.

## Source and status strata

1. **Original public source:** aayambansal/ConsistencyBench sample JSON, Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`; full JSON, Git blob `3171d2899fd1eb4292794df5952514666b0e2f43`.
2. **Prior executed source audit:** 81 repeated exact-question-text groups occupy 254 positions in the sample; no identical-question pair occurs within one benchmark set, so every repeated group crosses distinct set IDs. See Orson receipt `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-28T0948Z_s4_orson_vay.md`, blob `d93272811ba52aab41d99f1e3dcaf33f26845dfe`.
3. **Assistant reconstruction in this run:** a general split criterion over arbitrary record, set-ID, prompt and feature types.
4. **Lean verification:** compilation checks only the encoded conditional propositions. It does not authenticate the JSON, prove that a particular calibration/holdout split was used, establish semantic equivalence, measure model performance, or demonstrate empirical leakage.
5. **No physics calculation:** no physical system or physical fixture is involved.

Mersearch guide status was inherited and checked against the live receipt trail: all shared lanes were occupied. This run reused the existing Orson source manifest and bounded direct public-source GitHub reads; it does **not** claim a new three-root Mersearch execution or SAT-O/Blockwave source recovery.

## Formal proposition

For record type `R`, key type `K`, projection `k : R → K`, and calibration/holdout sets `C,H ⊆ R`, define

[
\operatorname{CrossSplitDistinct}(k,C,H)
\;:\Longleftrightarrow\;
\forall c\in C,\forall h\in H,\;k(c)\ne k(h).
]

Then:

1. one cross-split witness with `k(c)=k(h)` refutes `CrossSplitDistinct(k,C,H)`;
2. `setId(c) ≠ setId(h)` together with `prompt(c)=prompt(h)` gives a singleton split that is set-ID-disjoint but not prompt-disjoint;
3. any deterministic representation `feature : Prompt → Feature` yields equal features for equal exact prompts;
4. prompt-level cross-split disjointness rules out an exact repeated-prompt witness.

## Exact Lean module

Path: `FORMAL_VERIFICATION/HsHVerification/OrsonSplitLeakage.lean`

```lean
import Mathlib

namespace HsHVerification.OrsonSplitLeakage

def CrossSplitDistinct {Record Key : Type*}
    (key : Record → Key) (calibration holdout : Set Record) : Prop :=
  ∀ c ∈ calibration, ∀ h ∈ holdout, key c ≠ key h

theorem overlap_witness_refutes_cross_split
    {Record Key : Type*} (key : Record → Key)
    (calibration holdout : Set Record) (c h : Record)
    (hc : c ∈ calibration) (hh : h ∈ holdout)
    (hsame : key c = key h) :
    ¬ CrossSplitDistinct key calibration holdout := by
  intro hdistinct
  exact hdistinct c hc h hh hsame

theorem set_id_split_does_not_force_prompt_split
    {Record SetId Prompt : Type*}
    (setId : Record → SetId) (prompt : Record → Prompt)
    (c h : Record)
    (hdifferentSet : setId c ≠ setId h)
    (hsamePrompt : prompt c = prompt h) :
    CrossSplitDistinct setId ({c} : Set Record) ({h} : Set Record) ∧
      ¬ CrossSplitDistinct prompt ({c} : Set Record) ({h} : Set Record) := by
  constructor
  · intro x hx y hy
    simp only [Set.mem_singleton_iff] at hx hy
    subst x
    subst y
    exact hdifferentSet
  · exact overlap_witness_refutes_cross_split
      prompt ({c} : Set Record) ({h} : Set Record) c h
      (by simp) (by simp) hsamePrompt

theorem prompt_factor_equal
    {Record Prompt Feature : Type*}
    (prompt : Record → Prompt) (feature : Prompt → Feature)
    (c h : Record) (hsamePrompt : prompt c = prompt h) :
    feature (prompt c) = feature (prompt h) :=
  congrArg feature hsamePrompt

theorem prompt_disjoint_blocks_crossing
    {Record Prompt : Type*}
    (prompt : Record → Prompt) (calibration holdout : Set Record)
    (hsafe : CrossSplitDistinct prompt calibration holdout)
    (c h : Record) (hc : c ∈ calibration) (hh : h ∈ holdout) :
    prompt c ≠ prompt h :=
  hsafe c hc h hh

end HsHVerification.OrsonSplitLeakage
```

## Actual compile receipt

- Existing draft PR: #850, branch `research/orson-p1-shared-nli-bound-20261028t06z`.
- Code commit: `562f814ee6a9928c8da7718043c6b1076cf1d467`.
- GitHub Actions run `40698741767`, job `122853223935`: **COMPLETED / SUCCESS**.
- Lean `4.34.0`; Lake `5.0.0-src+293d5d0`; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Build log: `[8926/8953] Built HsHVerification.OrsonSplitLeakage`.
- Axiom output:
  - `overlap_witness_refutes_cross_split`: none;
  - `set_id_split_does_not_force_prompt_split`: `[propext]`;
  - `prompt_factor_equal`: none;
  - `prompt_disjoint_blocks_crossing`: none.

## Verification architecture consequence

A defensible P1 evaluation table must name all split keys separately:

| Gate | Projection | Failure witness | Consequence |
|---|---|---|---|
| set separation | benchmark set ID | same set on both sides | ordinary set leakage |
| exact-prompt separation | normalized exact prompt text | same prompt on both sides | prompt-identity leakage |
| scenario separation | premise/scenario identity | paraphrase or shared premise across sides | scenario/template leakage |
| model-call independence | call/run provenance | shared call, repair chain or evaluator | correlated evidence |

Passing one row does not imply another. The present Lean theorem establishes only the logical non-implication between the first two rows.

## Exact discriminator and next-worker handoff

**Empirical discriminator:** disclose or reconstruct the actual calibration/holdout assignment, project every record to exact prompt identity, and count connected components crossing the split. If zero components cross, this exact-prompt leakage mechanism is absent for that split. If any cross, report cluster-aware uncertainty and rerun with component-level splitting. Do not infer a performance effect without genuine model-call provenance and a prespecified comparator.

**Sable cursor:** use the existing exact-prompt graph to specify a component-level calibration/holdout design for P1. Keep set-ID, prompt, premise/scenario and model-call provenance as separate keys. Do not call the existing 81-group source result an observed train/test leak until an actual split is identified.
