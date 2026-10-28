import Mathlib

/-!
Orson Vay, cognition-method split audit, 2026-10-28 13Z.

Original public source:
- aayambansal/ConsistencyBench sample JSON,
  Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d;
- full JSON, Git blob 3171d2899fd1eb4292794df5952514666b0e2f43.

The source-pinned replay in
WORKSPACES/ORSON_VAY/CODE/2026_10_28_repeated_prompt_replay.py
reports 81 exact repeated-question-text groups in the sample, all crossing
distinct benchmark set IDs. This file formalizes only the resulting split
criterion: disjointness by set ID does not imply disjointness by prompt text.

Lean does NOT authenticate those source counts, establish that any actual
train/calibration/holdout split was used, or prove empirical model leakage.
It checks the stated conditional set-theoretic implications only.
-/

namespace HsHVerification.OrsonSplitLeakage

/-- Cross-split disjointness after projecting records to a chosen key. -/
def CrossSplitDistinct {Record Key : Type*}
    (key : Record → Key) (calibration holdout : Set Record) : Prop :=
  ∀ c ∈ calibration, ∀ h ∈ holdout, key c ≠ key h

/-- One equal-key witness crossing the split refutes key-level disjointness. -/
theorem overlap_witness_refutes_cross_split
    {Record Key : Type*} (key : Record → Key)
    (calibration holdout : Set Record) (c h : Record)
    (hc : c ∈ calibration) (hh : h ∈ holdout)
    (hsame : key c = key h) :
    ¬ CrossSplitDistinct key calibration holdout := by
  intro hdistinct
  exact hdistinct c hc h hh hsame

/--
A calibration/holdout pair can be separated by benchmark set ID while
leaking the exact prompt identity. Therefore set-ID separation alone is
not a sufficient prompt-level leakage guard.
-/
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

/--
Any deterministic downstream representation that factors only through
exact prompt text is equal on a cross-split repeated-prompt pair.
-/
theorem prompt_factor_equal
    {Record Prompt Feature : Type*}
    (prompt : Record → Prompt) (feature : Prompt → Feature)
    (c h : Record) (hsamePrompt : prompt c = prompt h) :
    feature (prompt c) = feature (prompt h) :=
  congrArg feature hsamePrompt

/--
Contrapositive audit rule: prompt-level cross-split disjointness rules out
an exact repeated-prompt witness crossing calibration and holdout.
-/
theorem prompt_disjoint_blocks_crossing
    {Record Prompt : Type*}
    (prompt : Record → Prompt) (calibration holdout : Set Record)
    (hsafe : CrossSplitDistinct prompt calibration holdout)
    (c h : Record) (hc : c ∈ calibration) (hh : h ∈ holdout) :
    prompt c ≠ prompt h :=
  hsafe c hc h hh

#print axioms overlap_witness_refutes_cross_split
#print axioms set_id_split_does_not_force_prompt_split
#print axioms prompt_factor_equal
#print axioms prompt_disjoint_blocks_crossing

end HsHVerification.OrsonSplitLeakage
