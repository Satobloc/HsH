import Mathlib

/-!
Meridian Review-MIND, 2026-10-29 11:48Z.
SOURCE-CONDITIONAL, not a model experiment or a physical theory proof.
Original 17 CGD model-output JSON blobs in aayambansal/ConsistencyBench,
as pinned in Orson's source-locked replayer (Git blob
a2e21227dda53d867afcef771060fd39f8d6ae47).
All 1,150 question occurrences aligned by set ID, index, text and key.
Provider grouping from each original model_id string.
An eligible model pair has no "unclear" at either stage for either model.
The observed counts are encoded assumptions; Lean does not parse the JSON.
-/

namespace HsHVerification.MeridianProviderPartition

structure Counts where
  eligible : Nat
  initial : Nat
  final : Nat

def within : Counts := ⟨24721, 19720, 19950⟩
def across : Counts := ⟨113190, 83077, 82931⟩
def all : Counts := ⟨137911, 102797, 102881⟩

/-- Family codes follow the source manifest: Anthropic 0, DeepSeek 1,
Google 2, OpenAI 3, Meta 4, Qwen 5. o3 (index 15) is OpenAI. -/
def provider (i : Nat) : Nat :=
  if i < 4 then 0 else if i = 4 then 1 else
  if i < 8 then 2 else if i < 13 then 3 else
  if i < 15 then 4 else if i = 15 then 3 else 5

def sameProviderSlots : Nat :=
  (Finset.range 17).sum (fun i =>
    ((Finset.range 17).filter (fun j => i < j ∧ provider i = provider j)).card)

theorem source_family_slots : sameProviderSlots = 25 := by
  decide

theorem source_family_complement : 136 - sameProviderSlots = 111 := by
  decide

theorem eligible_partition : within.eligible + across.eligible = all.eligible := by
  norm_num [within, across, all]

theorem initial_partition : within.initial + across.initial = all.initial := by
  norm_num [within, across, all]

theorem final_partition : within.final + across.final = all.final := by
  norm_num [within, across, all]

theorem within_change_positive :
    (within.final : Int) - within.initial = 230 := by
  norm_num [within]

theorem across_change_negative :
    (across.final : Int) - across.initial = -146 := by
  norm_num [across]

theorem total_change_positive :
    (all.final : Int) - all.initial = 84 := by
  norm_num [all]

theorem signed_partition_identity (a₀ a₁ b₀ b₁ : Int) :
    (a₁ + b₁) - (a₀ + b₀) = (a₁ - a₀) + (b₁ - b₀) := by
  ring

theorem observed_signed_partition :
    ((within.final : Int) - within.initial) +
    ((across.final : Int) - across.initial) =
    ((all.final : Int) - all.initial) := by
  norm_num [within, across, all]

#print axioms source_family_slots
#print axioms source_family_complement
#print axioms eligible_partition
#print axioms initial_partition
#print axioms final_partition
#print axioms within_change_positive
#print axioms across_change_negative
#print axioms total_change_positive
#print axioms signed_partition_identity
#print axioms observed_signed_partition

end HsHVerification.MeridianProviderPartition
