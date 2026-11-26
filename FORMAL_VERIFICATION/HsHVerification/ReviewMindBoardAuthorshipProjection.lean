import Mathlib
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
Review-MIND formalization: a board poster is not necessarily an idea originator.

Source concept: Chang and Wang, "Adding One More Agent: How AI Team Size and
Formation Shape Productivity and Diversity in Human-AI Brainstorming Teams,"
arXiv:2611.26663v1 (2026-11-19).

The paper explicitly distinguishes the actor who proposes an idea from the
actor who records it on a shared board. Its reported human-authorship measure
counts human-posted board items. This module formalizes the information limit
of a poster-only projection.

The counterexample is a pure schema witness, not an observed event or claim
about any participant. Actor constructors are data labels, not personhood or
consciousness claims. The result does not infer the paper's unreported idea
lineage or reproduce its empirical results.
-/

namespace HsHVerification.ReviewMindBoardAuthorshipProjection

open HsHVerification.NadirProjectionCoarseGrainFactorization

inductive Actor
  | human
  | model
  deriving DecidableEq, Repr

/-- Minimal event record separating idea origin from board posting. -/
structure BoardEvent where
  originator : Actor
  poster : Actor
  deriving DecidableEq, Repr

def posterProjection (e : BoardEvent) : Actor := e.poster
def originatorReadout (e : BoardEvent) : Actor := e.originator

/-- A human-originated idea recorded on the board by the model process. -/
def humanOriginModelPoster : BoardEvent :=
  ⟨Actor.human, Actor.model⟩

/-- A model-originated idea also recorded by the model process. -/
def modelOriginModelPoster : BoardEvent :=
  ⟨Actor.model, Actor.model⟩

/-- The same poster label is compatible with different originators. -/
theorem same_poster_different_origin :
    posterProjection humanOriginModelPoster =
      posterProjection modelOriginModelPoster ∧
    originatorReadout humanOriginModelPoster ≠
      originatorReadout modelOriginModelPoster := by
  constructor <;> decide

/--
No deterministic function of poster identity alone can recover originator
identity for every event. This instantiates Nadir's existing fibre-mismatch
criterion rather than duplicating its general theorem.
-/
theorem no_origin_reconstructor_from_poster :
    ¬ ∃ recover : Set.range posterProjection → Actor,
      ∀ e, recover (imageProjection posterProjection e) =
        originatorReadout e := by
  exact no_inducedCoarseGraining_of_fiber_mismatch
    posterProjection originatorReadout id
    humanOriginModelPoster modelOriginModelPoster
    (by rfl) (by decide)

/-- Minimal richer metadata: the pair (originator, poster) retains origin. -/
def richProvenance (e : BoardEvent) : Actor × Actor :=
  (originatorReadout e, posterProjection e)

def recoverOriginator (p : Actor × Actor) : Actor := p.1

theorem rich_provenance_recovers_origin (e : BoardEvent) :
    recoverOriginator (richProvenance e) = originatorReadout e := by
  rfl

#eval posterProjection humanOriginModelPoster
#eval originatorReadout humanOriginModelPoster
#eval richProvenance humanOriginModelPoster

#print axioms same_poster_different_origin
#print axioms no_origin_reconstructor_from_poster
#print axioms rich_provenance_recovers_origin

end HsHVerification.ReviewMindBoardAuthorshipProjection
