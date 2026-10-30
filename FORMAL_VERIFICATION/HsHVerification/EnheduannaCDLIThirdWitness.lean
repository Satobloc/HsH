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

inductive TerminalReadout where
  | du11 | du2ud | du8 | unpreserved
  deriving DecidableEq, Repr

def terminal : EditorialSurface → TerminalReadout
  | .cdliComposite => .du11
  | .helle2022 => .du2ud
  | .cdliP464307 => .du8
  | .cdliP346195 => .unpreserved

theorem composite_and_helle_differ :
    terminal .cdliComposite ≠ terminal .helle2022 := by decide

theorem third_artifact_differs_from_composite :
    terminal .cdliP464307 ≠ terminal .cdliComposite := by decide

theorem third_artifact_differs_from_helle :
    terminal .cdliP464307 ≠ terminal .helle2022 := by decide

theorem lacuna_not_a_positive_terminal_reading :
    terminal .cdliP346195 = .unpreserved := by rfl

def helleReportedCounts : List Nat := [4, 3, 1, 1]

theorem helle_reports_nine_readings :
    helleReportedCounts.foldl (· + ·) 0 = 9 := by decide

#print axioms three_name_loci
#print axioms two_distinct_name_artifacts
#print axioms same_tablet_for_first_two
#print axioms third_name_is_different_tablet
#print axioms composite_and_helle_differ
#print axioms third_artifact_differs_from_composite
#print axioms third_artifact_differs_from_helle
#print axioms lacuna_not_a_positive_terminal_reading
#print axioms helle_reports_nine_readings

end HsHVerification.EnheduannaCDLIThirdWitness
