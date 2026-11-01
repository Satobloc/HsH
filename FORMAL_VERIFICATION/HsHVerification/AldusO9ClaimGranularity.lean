import Mathlib

/-!
# Aldus: claim-granular public-exposure chronology

This module formalizes a bounded, source-transcribed evidence ledger associated
with HsH issue #1000 and its 2026-10-31 addendum.

The ledger distinguishes:
* broad SAT-framework exposure from O9-specific claims;
* a repository commit from verified public availability;
* exact claim presence from a transcript candidate;
* public exposure from Nathan-authored public attribution.

Source anchors:
* O9 two-firsts issue #1000 and published artifact
  aldus-o9-two-firsts-public-exposure-20261029t10z-s0-001.md.
* NotebookLM-derived compilation:
  SATOBLOC/SATOBLOCK_CONCEPT_DEVELOPMENT.txt,
  blob 4cb18dabbe1f0c42c76a7b9124075a61a434905e;
  repository commit b543eb3fbf16e50500ceadad83dc9a7dc0759e5b,
  2025-10-27T00:40:28Z.
* Mass O9 path:
  SAT O Core Modules/O9.txt,
  blob 676ce08c09226e4bde5a4d8efa3d7f4da228a1d8;
  path commit c2d7dfe845cb0255385c8c690bbc9d36bae46f31,
  2025-10-27T01:13:03Z.
* Spotify catalog episode spotify:episode:5EJAZZacCKKiFPkvG2Ag83,
  release date 2026-06-09. The saved creator/admin SRT contains an
  auto-transcribed O9 graviton filename at 00:30:57.560-00:31:01.320.
  Catalog metadata verifies episode identity/release date, not the
  transcript wording or exact spoken audio.

The two 2025 repository commit timestamps are exact Git metadata. Their
difference is 1,955 seconds (32 minutes 35 seconds). This is path/commit
ordering, not source-creation order, author identity, or first-public order.
Historical repository visibility at those commits is not established. The prior #1000 broad-SAT date 2025-02-02 is now source-verified through the public Spotify episode catalog and description; it remains distinct from every O9-specific T0.

The 2026-06-09 Spotify episode is publicly catalogued, but the O9 filename
claim is only present in the saved auto-transcript candidate. The exact audio
phrase has not been independently checked here.

The finite ledger is intentionally conservative. A returned `none` means
no qualifying witness in THIS BOUNDED LEDGER; it does not prove that no
historical public exposure exists elsewhere. These theorems do not establish
source authenticity, authorship, public visibility at an earlier commit,
transcript accuracy, first-ever exposure, or any physical proposition.
-/

namespace HsHVerification.AldusO9ClaimGranularity

inductive Claim where
  | satFramework
  | o9MassModuleIdentity
  | o9MassFormulaFragment
  | o9GravitonFilename
  | o9GravitonTopic
  | o9GravitonEquation
  deriving DecidableEq, Repr

inductive WitnessKind where
  | publicEpisodeDescription
  | notebookLmDerivative
  | repositoryMassModule
  | spotifyCatalogTranscript
  deriving DecidableEq, Repr

inductive Visibility where
  | verifiedPublic
  | historicalVisibilityUnknown
  deriving DecidableEq, Repr

inductive ContentStatus where
  | verified
  | transcriptCandidate
  deriving DecidableEq, Repr

inductive Attribution where
  | roleVerifiedNathan
  | publisherFirstPersonNotRoleVerified
  | transcriptSpeakerUnknown
  | derivativeAuthorUnknown
  deriving DecidableEq, Repr

structure Witness where
  sourceFamily : Nat
  kind : WitnessKind
  claim : Claim
  dateKey : Nat
  visibility : Visibility
  content : ContentStatus
  attribution : Attribution
  deriving Repr

def satGroundZero : Witness :=
  { sourceFamily := 4
    kind := .publicEpisodeDescription
    claim := .satFramework
    dateKey := 20250202
    visibility := .verifiedPublic
    content := .verified
    attribution := .publisherFirstPersonNotRoleVerified }

def notebookMassLabel : Witness :=
  { sourceFamily := 1
    kind := .notebookLmDerivative
    claim := .o9MassModuleIdentity
    dateKey := 20251027
    visibility := .historicalVisibilityUnknown
    content := .verified
    attribution := .derivativeAuthorUnknown }

def notebookMassFormulaFragment : Witness :=
  { sourceFamily := 1
    kind := .notebookLmDerivative
    claim := .o9MassFormulaFragment
    dateKey := 20251027
    visibility := .historicalVisibilityUnknown
    content := .verified
    attribution := .derivativeAuthorUnknown }

def notebookGravitonFilename : Witness :=
  { sourceFamily := 1
    kind := .notebookLmDerivative
    claim := .o9GravitonFilename
    dateKey := 20251027
    visibility := .historicalVisibilityUnknown
    content := .verified
    attribution := .derivativeAuthorUnknown }

def notebookGravitonTopic : Witness :=
  { sourceFamily := 1
    kind := .notebookLmDerivative
    claim := .o9GravitonTopic
    dateKey := 20251027
    visibility := .historicalVisibilityUnknown
    content := .verified
    attribution := .derivativeAuthorUnknown }

def massModulePathWitness : Witness :=
  { sourceFamily := 2
    kind := .repositoryMassModule
    claim := .o9MassModuleIdentity
    dateKey := 20251027
    visibility := .historicalVisibilityUnknown
    content := .verified
    attribution := .derivativeAuthorUnknown }

def spotifyGravitonFilenameCandidate : Witness :=
  { sourceFamily := 3
    kind := .spotifyCatalogTranscript
    claim := .o9GravitonFilename
    dateKey := 20260609
    visibility := .verifiedPublic
    content := .transcriptCandidate
    attribution := .transcriptSpeakerUnknown }

def boundedWitnesses : List Witness :=
  [satGroundZero, notebookMassLabel, notebookMassFormulaFragment, notebookGravitonFilename,
   notebookGravitonTopic, massModulePathWitness, spotifyGravitonFilenameCandidate]

def qualifiesAsVerifiedPublic (w : Witness) : Bool :=
  decide (w.visibility = .verifiedPublic ∧ w.content = .verified)

def qualifiesAsCandidatePublic (w : Witness) : Bool :=
  decide (w.visibility = .verifiedPublic ∧ w.content = .transcriptCandidate)

def qualifiesAsNathanPublic (w : Witness) : Bool :=
  qualifiesAsVerifiedPublic w &&
    decide (w.attribution = .roleVerifiedNathan)

def datesFor (c : Claim) (qualifies : Witness → Bool) : List Nat :=
  (boundedWitnesses.filter
    (fun w => decide (w.claim = c) && qualifies w)).map (fun w => w.dateKey)

def minOption (a b : Option Nat) : Option Nat :=
  match a, b with
  | none, x => x
  | x, none => x
  | some x, some y => some (Nat.min x y)

def earliest (xs : List Nat) : Option Nat :=
  xs.foldl (fun acc x => minOption acc (some x)) none

def publicT0 (c : Claim) : Option Nat :=
  earliest (datesFor c qualifiesAsVerifiedPublic)

def candidatePublicT0 (c : Claim) : Option Nat :=
  earliest (datesFor c qualifiesAsCandidatePublic)

def nathanPublicT0 (c : Claim) : Option Nat :=
  earliest (datesFor c qualifiesAsNathanPublic)

/-! Exact Git commit times, converted from the cited UTC commit timestamps. -/

def notebookCompilationCommitSeconds : Nat := 1761525628
def massModulePathCommitSeconds : Nat := 1761527583

theorem notebook_derivative_commit_precedes_mass_path_commit :
    notebookCompilationCommitSeconds < massModulePathCommitSeconds := by
  decide

theorem derivative_to_mass_path_commit_gap_seconds :
    massModulePathCommitSeconds - notebookCompilationCommitSeconds = 1955 := by
  decide

/-! Multiple O9 claims occur in one derivative witness family. They are not
independent source witnesses merely because they name different claims. -/

theorem notebook_mass_and_graviton_claims_share_one_witness_family :
    notebookMassFormulaFragment.sourceFamily =
      notebookGravitonFilename.sourceFamily := by
  rfl

/-! Claim-granular public-exposure results for the bounded ledger. -/

theorem broad_sat_public_t0_in_bounded_ledger :
    publicT0 .satFramework = some 20250202 := by
  decide

theorem broad_sat_has_no_role_verified_nathan_public_t0_in_bounded_ledger :
    nathanPublicT0 .satFramework = none := by
  decide

theorem o9_mass_module_has_no_verified_public_t0_in_bounded_ledger :
    publicT0 .o9MassModuleIdentity = none := by
  decide

theorem o9_mass_formula_fragment_has_no_verified_public_t0_in_bounded_ledger :
    publicT0 .o9MassFormulaFragment = none := by
  decide

theorem o9_graviton_topic_has_no_verified_public_t0_in_bounded_ledger :
    publicT0 .o9GravitonTopic = none := by
  decide

theorem o9_graviton_equation_has_no_verified_public_t0_in_bounded_ledger :
    publicT0 .o9GravitonEquation = none := by
  decide

theorem o9_graviton_filename_is_candidate_not_verified_t0 :
    publicT0 .o9GravitonFilename = none ∧
    candidatePublicT0 .o9GravitonFilename = some 20260609 := by
  decide

#print axioms notebook_derivative_commit_precedes_mass_path_commit
#print axioms derivative_to_mass_path_commit_gap_seconds
#print axioms notebook_mass_and_graviton_claims_share_one_witness_family
#print axioms broad_sat_public_t0_in_bounded_ledger
#print axioms broad_sat_has_no_role_verified_nathan_public_t0_in_bounded_ledger
#print axioms o9_mass_module_has_no_verified_public_t0_in_bounded_ledger
#print axioms o9_mass_formula_fragment_has_no_verified_public_t0_in_bounded_ledger
#print axioms o9_graviton_topic_has_no_verified_public_t0_in_bounded_ledger
#print axioms o9_graviton_equation_has_no_verified_public_t0_in_bounded_ledger
#print axioms o9_graviton_filename_is_candidate_not_verified_t0

end HsHVerification.AldusO9ClaimGranularity
