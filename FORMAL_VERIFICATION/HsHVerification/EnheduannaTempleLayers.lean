import Mathlib

/-!
# Enheduanna Temple Hymns: conditional layer chronology gate

Sources (read as text, not a proof of ancient authorship):
* ETCSL c.4.80.1, composite transliteration, lines 129-134:
  https://etcsl.orinst.ox.ac.uk/cgi-bin/etcsl.cgi?text=c.4.80.1&charenc=j
  These lines name Shulgi and include the addition marker `tah-hu-um`.
* Sophus Helle, "Authorship":
  https://enheduana.org/authorship/
  Identifies hymn no. 9 as a later addition, and notes the older Ur III
  witness does not preserve the final Enheduanna attribution.

Theorems concern the *conditional* proposition that a finalized text
cannot already contain a section from a strictly later era. A collection
may contain older layers plus later editing. Neither this encoding nor
Lean compilation dates the actual manuscripts or identifies an author.
-/

namespace HsHVerification.EnheduannaTempleLayers

inductive Era where
  | oldAkkadian
  | urIII
  deriving DecidableEq, Repr

inductive TextUnit where
  | hymnNine
  deriving DecidableEq, Repr

/-- This two-era precedence is a source-supplied historical ordering,
not a derived historical result. -/
def Earlier : Era → Era → Prop
  | .oldAkkadian, .urIII => True
  | _, _ => False

/-- A closed composition at `t` cannot include a layer originating strictly
after `t`, unless its later revision is admitted as a separate event. -/
def ClosedAt {Unit : Type*} (eraOf : Unit → Era) (t : Era) : Prop :=
  ∀ u, ¬ Earlier t (eraOf u)

/-- General, assumption-explicit obstruction: a genuinely later layer
refutes closure of the whole received text at the earlier time. -/
theorem later_layer_refutes_early_closure
    {Unit Time : Type*} (precedes : Time → Time → Prop)
    (layerEra : Unit → Time) (t : Time) (u : Unit)
    (hLater : precedes t (layerEra u)) :
    ¬ (∀ v : Unit, ¬ precedes t (layerEra v)) := by
  intro hClosed
  exact (hClosed u) hLater

/-- Interpret the reported Shulgi addition as a later layer.
This is a stated source premise, not proof that the edition is correct. -/
def reportedLayerEra : TextUnit → Era
  | .hymnNine => .urIII

theorem reported_addition_not_closed_in_old_akkadian :
    ¬ ClosedAt reportedLayerEra .oldAkkadian := by
  intro hClosed
  exact (hClosed .hymnNine) (by simp [Earlier, reportedLayerEra])

/-- The manuscript's collection-level attribution and an interpolation
are *different kinds of evidence*, even when both name people. -/
inductive EvidenceRole where
  | collectionAttribution
  | laterAddition
  deriving DecidableEq, Repr

inductive NamedPerson where
  | enheduanna
  | shulgi
  deriving DecidableEq, Repr

structure SourceClaim where
  role : EvidenceRole
  person : NamedPerson
  deriving DecidableEq, Repr

def colophonClaim : SourceClaim :=
  ⟨.collectionAttribution, .enheduanna⟩

def laterAdditionClaim : SourceClaim :=
  ⟨.laterAddition, .shulgi⟩

theorem claims_differ_in_evidence_role :
    colophonClaim.role ≠ laterAdditionClaim.role := by
  decide

theorem claims_do_not_have_identical_source_semantics :
    colophonClaim ≠ laterAdditionClaim := by
  decide

end HsHVerification.EnheduannaTempleLayers
