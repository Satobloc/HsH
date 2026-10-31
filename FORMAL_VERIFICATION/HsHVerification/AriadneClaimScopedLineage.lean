import Mathlib

/-!
Claim-scoped evidence-lineage gate, 2026-10-31.

External source input:
  WORKSPACES/ARIADNE/2026-10-31T1119Z_KIRK_READY_ROOM_SOURCE_LINEAGE_AUDIT.md
  report blob f8f3d18764fd60eebbc5b2261c6f1430ac536cc2

The source audit reports one exact LF-normalized common block of 12,598
lines: KIRK_mind.txt lines [1, 12599), READY_ROOM.txt lines [123, 12721).
The field exactNormalizedMatchAttested below is an external audit input.
Lean does not re-read the private Library exports or verify that extraction.

The contract is claim-scoped, not artifact-scoped:
* claims supported inside the verified shared core are dependent witnesses;
* a unique prefix/suffix outside that known core is not thereby independent;
* independence requires nonempty, disjoint primary-origin sets;
* contradictory shared-core and disjoint-origin records are surfaced as conflict;
* missing lineage remains unresolved, never silently promoted to independent.

This is an information/provenance theorem, not a claim about authorship,
human/LLM cognition, physical systems, or SAT/H(s)H truth.
-/

namespace HsHVerification.AriadneClaimScopedLineage

/-- One-indexed, half-open line span in a normalized artifact representation.
    The audit coordinates use LF-normalized text and Unicode-aware Python
    str.splitlines() boundaries; they are not raw byte or wc -l offsets. -/
structure LineSpan where
  firstLine : Nat
  afterLastLine : Nat
  nonempty : firstLine < afterLastLine

def Contains (outer inner : LineSpan) : Prop :=
  outer.firstLine ≤ inner.firstLine ∧
  inner.afterLastLine ≤ outer.afterLastLine

theorem contains_refl (span : LineSpan) : Contains span span := by
  exact ⟨Nat.le_refl _, Nat.le_refl _⟩

theorem contains_trans {a b c : LineSpan}
    (hab : Contains a b) (hbc : Contains b c) : Contains a c := by
  exact ⟨Nat.le_trans hab.1 hbc.1, Nat.le_trans hbc.2 hab.2⟩

/-- External source-audit record for one verified shared-content core.
    This is not a causal copy-direction or common-acquisition assertion. -/
structure SharedCoreRecord where
  leftArtifact : String
  rightArtifact : String
  leftCore : LineSpan
  rightCore : LineSpan
  exactNormalizedMatchAttested : Bool

/-- The content span supporting one claim in each artifact, if both are known. -/
structure ClaimScope where
  claimId : String
  leftSupport : Option LineSpan
  rightSupport : Option LineSpan

/-- A claim is covered by a shared core only when both support spans lie
    inside the corresponding core spans and the external audit flag is true. -/
structure SharedCoreClaim (core : SharedCoreRecord) (scope : ClaimScope) where
  leftSupport : LineSpan
  rightSupport : LineSpan
  leftScopeMatches : scope.leftSupport = some leftSupport
  rightScopeMatches : scope.rightSupport = some rightSupport
  leftWithin : Contains core.leftCore leftSupport
  rightWithin : Contains core.rightCore rightSupport
  auditPass : core.exactNormalizedMatchAttested = true

abbrev OriginSet := Finset Nat

def DisjointOrigins (left right : OriginSet) : Prop :=
  ∀ origin, origin ∈ left → origin ∈ right → False

/-- A positive independence witness requires both primary-origin sets to be
    nonempty and disjoint. An absent/empty record is not positive evidence. -/
structure DisjointPrimaryOrigins (left right : OriginSet) where
  leftOrigin : Nat
  rightOrigin : Nat
  leftOriginPresent : leftOrigin ∈ left
  rightOriginPresent : rightOrigin ∈ right
  disjoint : DisjointOrigins left right

inductive ClaimLineageStatus where
  | dependent -- shared-content: not an independent content witness for this claim; not causal ancestry
  | independent
  | unresolved
  | conflicting
  deriving DecidableEq, Repr

/-- Evidence is attached to one claim scope. It carries both possible
    dependence evidence and any positive disjoint-origin evidence so a
    contradiction cannot be hidden by choosing only one field. -/
structure ClaimLineageEvidence
    (core : SharedCoreRecord) (leftOrigins rightOrigins : OriginSet) where
  scope : ClaimScope
  sharedCore : Option (SharedCoreClaim core scope)
  disjointPrimaryOrigins :
    Option (DisjointPrimaryOrigins leftOrigins rightOrigins)

def classify {core : SharedCoreRecord} {leftOrigins rightOrigins : OriginSet}
    (e : ClaimLineageEvidence core leftOrigins rightOrigins) : ClaimLineageStatus :=
  match e.sharedCore, e.disjointPrimaryOrigins with
  | some _, some _ => .conflicting
  | some _, none => .dependent
  | none, some _ => .independent
  | none, none => .unresolved

theorem disjoint_origin_witnesses_are_nonempty_and_disjoint
    {leftOrigins rightOrigins : OriginSet}
    (w : DisjointPrimaryOrigins leftOrigins rightOrigins) :
    leftOrigins.Nonempty ∧ rightOrigins.Nonempty ∧
      DisjointOrigins leftOrigins rightOrigins := by
  exact ⟨⟨w.leftOrigin, w.leftOriginPresent⟩,
    ⟨w.rightOrigin, w.rightOriginPresent⟩, w.disjoint⟩

theorem classify_independent_iff
    {core : SharedCoreRecord} {leftOrigins rightOrigins : OriginSet}
    (e : ClaimLineageEvidence core leftOrigins rightOrigins) :
    classify e = .independent ↔
      e.sharedCore.isNone = true ∧
      e.disjointPrimaryOrigins.isSome = true := by
  cases e with
  | mk scope shared disjoint =>
    cases shared <;> cases disjoint <;> simp [classify]

theorem classify_unresolved_iff
    {core : SharedCoreRecord} {leftOrigins rightOrigins : OriginSet}
    (e : ClaimLineageEvidence core leftOrigins rightOrigins) :
    classify e = .unresolved ↔
      e.sharedCore.isNone = true ∧
      e.disjointPrimaryOrigins.isNone = true := by
  cases e with
  | mk scope shared disjoint =>
    cases shared <;> cases disjoint <;> simp [classify]

theorem independent_requires_disjoint_primary_origins
    {core : SharedCoreRecord} {leftOrigins rightOrigins : OriginSet}
    (e : ClaimLineageEvidence core leftOrigins rightOrigins)
    (h : classify e = .independent) :
    ∃ witness : DisjointPrimaryOrigins leftOrigins rightOrigins,
      e.disjointPrimaryOrigins = some witness := by
  have h' := (classify_independent_iff e).mp h
  cases hd : e.disjointPrimaryOrigins with
  | none =>
      simp [hd] at h'
  | some witness =>
      exact ⟨witness, rfl⟩

/-! Actual claim-scope coordinates transcribed from the source audit.
    Spans are one-indexed and half-open. The normalized common block itself
    was externally verified; these declarations do not re-run that comparison. -/

def kirkCommonCore : LineSpan := ⟨1, 12599, by omega⟩
def readyRoomCommonCore : LineSpan := ⟨123, 12721, by omega⟩
def kirkUniqueSuffix : LineSpan := ⟨12599, 12763, by omega⟩
def readyRoomUniquePrefix : LineSpan := ⟨1, 123, by omega⟩
def readyRoomUniqueSuffix : LineSpan := ⟨12721, 12722, by omega⟩

def kirkReadyRoomCore : SharedCoreRecord :=
  { leftArtifact := "KIRK_mind.txt"
    rightArtifact := "READY_ROOM.txt"
    leftCore := kirkCommonCore
    rightCore := readyRoomCommonCore
    exactNormalizedMatchAttested := true }

def sharedCoreScope : ClaimScope :=
  { claimId := "claim-supported-within-12,598-line-shared-core"
    leftSupport := some kirkCommonCore
    rightSupport := some readyRoomCommonCore }

def sharedCoreClaim : SharedCoreClaim kirkReadyRoomCore sharedCoreScope :=
  { leftSupport := kirkCommonCore
    rightSupport := readyRoomCommonCore
    leftScopeMatches := rfl
    rightScopeMatches := rfl
    leftWithin := contains_refl _
    rightWithin := contains_refl _
    auditPass := rfl }

def sharedCoreEvidence :
    ClaimLineageEvidence kirkReadyRoomCore (∅ : OriginSet) (∅ : OriginSet) :=
  { scope := sharedCoreScope
    sharedCore := some sharedCoreClaim
    disjointPrimaryOrigins := none }

theorem audited_shared_core_claim_is_dependent :
    classify sharedCoreEvidence = .dependent := rfl

def kirkUniqueSuffixScope : ClaimScope :=
  { claimId := "claim-supported-only-in-kirk-unique-suffix"
    leftSupport := some kirkUniqueSuffix
    rightSupport := none }

def readyRoomUniquePrefixScope : ClaimScope :=
  { claimId := "claim-supported-only-in-ready-room-unique-prefix"
    leftSupport := none
    rightSupport := some readyRoomUniquePrefix }

def readyRoomUniqueSuffixScope : ClaimScope :=
  { claimId := "claim-supported-only-in-ready-room-unique-suffix"
    leftSupport := none
    rightSupport := some readyRoomUniqueSuffix }

def kirkUniqueSuffixEvidence :
    ClaimLineageEvidence kirkReadyRoomCore (∅ : OriginSet) (∅ : OriginSet) :=
  { scope := kirkUniqueSuffixScope
    sharedCore := none
    disjointPrimaryOrigins := none }

def readyRoomUniquePrefixEvidence :
    ClaimLineageEvidence kirkReadyRoomCore (∅ : OriginSet) (∅ : OriginSet) :=
  { scope := readyRoomUniquePrefixScope
    sharedCore := none
    disjointPrimaryOrigins := none }

def readyRoomUniqueSuffixEvidence :
    ClaimLineageEvidence kirkReadyRoomCore (∅ : OriginSet) (∅ : OriginSet) :=
  { scope := readyRoomUniqueSuffixScope
    sharedCore := none
    disjointPrimaryOrigins := none }

theorem kirk_unique_suffix_outside_known_core :
    ¬ Contains kirkCommonCore kirkUniqueSuffix := by
  intro h
  norm_num [Contains, kirkCommonCore, kirkUniqueSuffix] at h

theorem ready_room_unique_prefix_outside_known_core :
    ¬ Contains readyRoomCommonCore readyRoomUniquePrefix := by
  intro h
  norm_num [Contains, readyRoomCommonCore, readyRoomUniquePrefix] at h

theorem ready_room_unique_suffix_outside_known_core :
    ¬ Contains readyRoomCommonCore readyRoomUniqueSuffix := by
  intro h
  norm_num [Contains, readyRoomCommonCore, readyRoomUniqueSuffix] at h

theorem kirk_unique_suffix_claim_remains_unresolved :
    classify kirkUniqueSuffixEvidence = .unresolved := rfl

theorem ready_room_unique_prefix_claim_remains_unresolved :
    classify readyRoomUniquePrefixEvidence = .unresolved := rfl

theorem ready_room_unique_suffix_claim_remains_unresolved :
    classify readyRoomUniqueSuffixEvidence = .unresolved := rfl

theorem missing_lineage_is_not_independence
    {core : SharedCoreRecord} {leftOrigins rightOrigins : OriginSet}
    (scope : ClaimScope) :
    classify
      ({ scope := scope, sharedCore := none,
         disjointPrimaryOrigins := none } :
        ClaimLineageEvidence core leftOrigins rightOrigins)
      ≠ .independent := by
  simp [classify]

#print axioms contains_trans
#print axioms classify_independent_iff
#print axioms independent_requires_disjoint_primary_origins
#print axioms audited_shared_core_claim_is_dependent
#print axioms kirk_unique_suffix_claim_remains_unresolved
#print axioms missing_lineage_is_not_independence

end HsHVerification.AriadneClaimScopedLineage
