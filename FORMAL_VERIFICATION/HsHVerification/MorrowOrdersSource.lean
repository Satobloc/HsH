import Mathlib

/-!
Morrow source-identity audit, 2026-10-28T20:12Z.
Observed historical text, not an empirical particle measurement:
Satobloc/SAT_THEORY_ARCHIVE_2023-25/ORDERS.txt
Git blob 1f9cec2b7468a87e689239d7b0d00f8e8ad825a5.

The opening reads "Q=3 is a quark" while a later list reads
"electron, quark: Q=1". The source also assigns Q=1 to photons and
neutrinos. These statements may involve different resolutions or a
terminological slip. The code formalizes ONLY conditional source-
translation constraints, not a physically correct particle taxonomy.

Other derivative copies:
_AUTO_EXTRACTED_TEXT/Orders and Q numbers.txt blob
5a1d72f012dcbd5bbf2681593bba005c15741d1e
_AUTO_EXTRACTED_TEXT/Orders and Q numbers 2.txt blob
b2e6c72fcb91b94252092523df90268de92a1693
-/ 

namespace HsHVerification.MorrowOrdersSource

inductive SourceKind where
  | quark | nucleon | photon | neutrino | electron
  deriving DecidableEq, Repr

structure CountClaim where
  subject : SourceKind
  count : Nat
  locator : String
  deriving DecidableEq, Repr

def openingQuark : CountClaim :=
  ⟨.quark, 3, "ORDERS.txt opening Q=3 is a quark"⟩

def tableQuark : CountClaim :=
  ⟨.quark, 1, "ORDERS.txt electron, quark Q=1"⟩

def incompatible (a b : CountClaim) : Prop :=
  a.subject = b.subject ∧ a.count ≠ b.count

/-- The two quoted statements disagree if "quark" is one fixed source type. -/
theorem two_source_quark_claims_incompatible :
    incompatible openingQuark tableQuark := by
  simp [incompatible, openingQuark, tableQuark]

/-- No single unqualified counting function can realize both readings
    on the same source-kind argument. -/
theorem no_unqualified_quark_count
    (q : SourceKind → Nat)
    (hOpening : q .quark = 3)
    (hTable : q .quark = 1) : False := by
  omega

/-- Even a consistent Q=1 assignment to photon and electron cannot
    identify a particle category from the scalar count alone. -/
theorem count_alone_noninjective
    (q : SourceKind → Nat)
    (hPhoton : q .photon = 1)
    (hElectron : q .electron = 1) :
    ¬ Function.Injective q := by
  intro hinj
  have h : SourceKind.photon = SourceKind.electron :=
    hinj (hPhoton.trans hElectron.symm)
  cases h

/-- Distinct transient species can share the source's Q=1 assignment.
    This does not establish any physical equivalence. -/
theorem photon_neutrino_count_noninjective
    (q : SourceKind → Nat)
    (hPhoton : q .photon = 1)
    (hNeutrino : q .neutrino = 1) :
    ¬ Function.Injective q := by
  intro hinj
  have h : SourceKind.photon = SourceKind.neutrino :=
    hinj (hPhoton.trans hNeutrino.symm)
  cases h

#print axioms two_source_quark_claims_incompatible
#print axioms no_unqualified_quark_count
#print axioms count_alone_noninjective
#print axioms photon_neutrino_count_noninjective

end HsHVerification.MorrowOrdersSource
