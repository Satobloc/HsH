import Mathlib

/-!
# CDLI third-witness and editorial readout separation

Data transcribed from actual CDLI P346194, P346195, P464307,
CDLI composite Q000623, and Helle's 2022 annotated edition.
These are source-CONDITIONAL propositions. Compilation checks the
formal encoding; it does not authenticate cuneiform, establish
ancient authorship, or test SAT/H(s)H physics.
-/
namespace HsHVerification.EnheduannaCDLIThirdWitness

inductive Artifact where
  | p346194 | p346195 | p464307
  deriving DecidableEq, Repr

inductive NameLocus where
  | p194Obv5 | p194Obv19 | p307Col2_27
  deriving DecidableEq, Repr

def artifactOf : NameLocus → Artifact
  | .p194Obv5 => .p346194
  | .p194Obv19 => .p346194
  | .p307Col2_27 => .p464307

def nameLoci : List NameLocus :=
  [.p194Obv5, .p194Obv19, .p307Col2_27]

def namedArtifacts : List Artifact := nameLoci.map artifactOf

theorem three_name_loci : nameLoci.length = 3 := by decide

theorem two_distinct_name_artifacts :
    namedArtifacts.eraseDups.length = 2 := by decide

theorem same_tablet_for_first_two :
    artifactOf .p194Obv5 = artifactOf .p194Obv19 := by rfl

theorem third_name_is_different_tablet :
    artifactOf .p307Col2_27 ≠ artifactOf .p194Obv19 := by decide

inductive EditorialSurface where
  | cdliComposite | helle2022 | cdliP464307 | cdliP346195
  deriving DecidableEq, Repr

inductive TerminalVariant where
  | du11 | du3 | du2ud | du8
  deriving DecidableEq, Repr

/-- Preservation is separate from the positive lexical variant. -/
inductive TerminalEvidence where
  | attested (variant : TerminalVariant)
  | unpreserved
  deriving DecidableEq, Repr

def terminal : EditorialSurface → TerminalEvidence
  | .cdliComposite => .attested .du11
  | .helle2022 => .attested .du2ud
  | .cdliP464307 => .attested .du8
  | .cdliP346195 => .unpreserved

theorem composite_and_helle_differ :
    terminal .cdliComposite ≠ terminal .helle2022 := by decide

theorem third_artifact_differs_from_composite :
    terminal .cdliP464307 ≠ terminal .cdliComposite := by decide

theorem third_artifact_differs_from_helle :
    terminal .cdliP464307 ≠ terminal .helle2022 := by decide

theorem lacuna_not_a_positive_terminal_reading :
    terminal .cdliP346195 = .unpreserved := by rfl

/-- Helle 2022, line 138: source-reported manuscript distribution.
    This is not an independent collation performed by this module. -/
def helleReportedCounts : List (TerminalVariant × Nat) :=
  [(.du11, 4), (.du3, 3), (.du2ud, 1), (.du8, 1)]

def helleReportedTotal : Nat :=
  helleReportedCounts.foldl (fun total entry => total + entry.2) 0

theorem helle_reports_four_variant_classes :
    helleReportedCounts.length = 4 := by decide

theorem helle_reports_nine_readings :
    helleReportedTotal = 9 := by decide

theorem helle_reports_du3_in_three_manuscripts :
    (.du3, 3) ∈ helleReportedCounts := by decide

#print axioms three_name_loci
#print axioms two_distinct_name_artifacts
#print axioms same_tablet_for_first_two
#print axioms third_name_is_different_tablet
#print axioms composite_and_helle_differ
#print axioms third_artifact_differs_from_composite
#print axioms third_artifact_differs_from_helle
#print axioms lacuna_not_a_positive_terminal_reading
#print axioms helle_reports_four_variant_classes
#print axioms helle_reports_nine_readings
#print axioms helle_reports_du3_in_three_manuscripts

end HsHVerification.EnheduannaCDLIThirdWitness
