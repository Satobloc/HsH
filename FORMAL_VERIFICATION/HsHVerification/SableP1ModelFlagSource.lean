import Mathlib
/-!
Sable P1 source-locked per-model checker/key-error diagnostic.
17 ORIGINAL archived CGD model-output files, each 300 sets, 850
checker-eligible (later-position) records, all 17 original Git blobs
independently fetched and parsed 2026-10-29 16:24 UTC.
Source manifest: HsH WORKSPACES/ORSON_VAY/CODE/
2026_10_28_cgd_revision_balance_replay.py (blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9).
External dataset: aayambansal/ConsistencyBench, original results Git blobs.
Values are SOURCE-KEY proxy confusion counts, NOT semantic NLI ground truth.
Lean proves properties of the transcribed counts only.
-/
namespace HsHVerification.SableP1ModelFlagSource
structure Counts where
  tp : Nat
  fp : Nat
  fn : Nat
  tn : Nat
  deriving Repr, DecidableEq

def observed : List Counts := [
  ⟨156, 229, 123, 342⟩, -- gpt-4o
  ⟨82, 293, 73, 402⟩, -- gpt-4.1
  ⟨236, 173, 99, 342⟩, -- gemini-2.5-pro
  ⟨138, 276, 129, 307⟩, -- claude-opus-4.6
  ⟨130, 236, 139, 345⟩, -- claude-3.5-sonnet
  ⟨271, 205, 208, 166⟩, -- claude-sonnet-4.5
  ⟨198, 193, 254, 205⟩, -- claude-sonnet-4.6
  ⟨191, 193, 216, 250⟩, -- deepseek-v3.2
  ⟨334, 146, 206, 164⟩, -- gemini-2.0-flash
  ⟨223, 198, 106, 323⟩, -- gemini-2.5-flash
  ⟨167, 170, 249, 264⟩, -- gpt-5-mini
  ⟨128, 206, 162, 354⟩, -- gpt-5.2
  ⟨140, 181, 205, 324⟩, -- gpt-5
  ⟨224, 241, 135, 250⟩, -- llama-3.1-70b
  ⟨185, 180, 258, 227⟩, -- llama-3.3-70b
  ⟨203, 223, 120, 304⟩, -- o3
  ⟨87, 266, 189, 308⟩ -- qwen-2.5-72b
]

def flagMoreKeyWrong (c : Counts) : Bool :=
  decide (c.tp * (c.fn + c.tn) > c.fn * (c.tp + c.fp))
def flagLessKeyWrong (c : Counts) : Bool :=
  decide (c.tp * (c.fn + c.tn) < c.fn * (c.tp + c.fp))

def add (a b : Counts) : Counts :=
  ⟨a.tp+b.tp, a.fp+b.fp, a.fn+b.fn, a.tn+b.tn⟩

def pooled : Counts := observed.foldl add ⟨0,0,0,0⟩

theorem source_has_seventeen_models : observed.length = 17 := by decide
theorem each_model_has_850_eligible :
    ∀ c ∈ observed, c.tp+c.fp+c.fn+c.tn = 850 := by decide
theorem observed_pooled_counts :
    pooled = ⟨3093,3609,2871,4877⟩ := by decide
theorem model_sign_partition :
    (observed.filter flagMoreKeyWrong).length = 14 ∧
    (observed.filter flagLessKeyWrong).length = 3 := by decide
theorem all_model_signs_strict :
    ∀ c ∈ observed, flagMoreKeyWrong c = true ∨ flagLessKeyWrong c = true := by decide
#print axioms source_has_seventeen_models
#print axioms each_model_has_850_eligible
#print axioms observed_pooled_counts
#print axioms model_sign_partition
#print axioms all_model_signs_strict
end HsHVerification.SableP1ModelFlagSource
