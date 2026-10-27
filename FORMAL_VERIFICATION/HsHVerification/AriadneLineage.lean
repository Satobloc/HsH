import HsHVerification.AriadneChronology

/-!
# Ariadne: source-lineage temporal gate

A dependency path is a chain of directed edges, each requiring its source
to be available no later than the derived artifact's fixed timestamp.
The condition is *explicit*: this module does not assume every real
podcast is immutable or that a published episode could never be edited.
An edit/republication introduces a new artifact/version and a new timestamp.

This gate tests the disputed inference that the already-published Jan 21
episode was derived from the specific Jan 22 Kirk request.
It does not exclude older shared source materials.
-/

namespace HsHVerification.AriadneLineage

open HsHVerification.AriadneChronology

inductive Artifact where
  | jan22KirkRequest
  | jan21PublishedEpisode
  deriving DecidableEq, Repr

def timestamp (offsetHours : ℤ) : Artifact → ℤ
  | .jan22KirkRequest => kirkRequestUtcMinute
  | .jan21PublishedEpisode => publicationUtcMinute offsetHours

/-- A finite path of source-to-derivative edges. -/
inductive SourcePath {α : Type} (edge : α → α → Prop) : α → α → Prop where
  | refl (x : α) : SourcePath edge x x
  | step {a b c : α} (ab : edge a b) (bc : SourcePath edge b c) :
      SourcePath edge a c

/-- Timestamp monotonicity propagates along every finite source path,
provided it holds for each individual dependency edge. -/
theorem source_path_monotone {α : Type} (edge : α → α → Prop)
    (t : α → ℤ) (edge_monotone : ∀ {a b}, edge a b → t a ≤ t b)
    {a b : α} (path : SourcePath edge a b) : t a ≤ t b := by
  induction path with
  | refl x => exact le_refl _
  | step ab bc ih =>
      exact le_trans (edge_monotone ab) ih

/-- Under an immutable-publication model, no source path can run from
the later Jan 22 request to the already-published Jan 21 episode.
This is not a finding about any *earlier* Kirk material. -/
theorem no_immutable_podcast_path (offsetHours : ℤ)
    (lo : -12 ≤ offsetHours) (hi : offsetHours ≤ 14)
    (edge : Artifact → Artifact → Prop)
    (edge_monotone : ∀ {a b}, edge a b →
       timestamp offsetHours a ≤ timestamp offsetHours b) :
    ¬ SourcePath edge .jan22KirkRequest .jan21PublishedEpisode := by
  intro path
  have hpath := source_path_monotone edge (timestamp offsetHours) edge_monotone path
  have hbefore := publication_before_later_request offsetHours lo hi
  exact (not_le_of_gt hbefore) hpath

#print axioms source_path_monotone
#print axioms no_immutable_podcast_path

end HsHVerification.AriadneLineage
