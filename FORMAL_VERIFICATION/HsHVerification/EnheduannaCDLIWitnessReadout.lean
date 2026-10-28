import Mathlib

/-!
# Two physical CDLI witnesses: typed source observations
These are source-conditioned claims transcribed from CDLI records
P346194 (UET 6, 109) and P346195 (UET 6, 110), read 2026-10-28.
They are NOT a paleographic verification of photographs, an ancient
authorship proof, or a physical SAT/H(s)H calculation.

P346194 obv. 5: en-me-en en#-he2-<du7>-an#-na# [...]
P346194 obv. 19: en-he2-du7-an-na-me-en a-ra-zu ga-mu-ra-du11?
P346195 obv. 2': im#-ma#-an-si im-ma-diri#-[...] nin# UN-gal ma-ra#-[...]
-/ 

namespace HsHVerification.EnheduannaCDLIWitnessReadout

inductive Artifact where
  | p346194
  | p346195
  deriving DecidableEq, Repr

inductive Locus where
  | firstName
  | secondName
  | line138Terminal
  deriving DecidableEq, Repr

inductive ReadingState where
  | partlyRestored
  | writtenUnbracketed
  | terminalUnpreserved
  deriving DecidableEq, Repr

def artifact : Locus → Artifact
  | .firstName => .p346194
  | .secondName => .p346194
  | .line138Terminal => .p346195

def reading : Locus → ReadingState
  | .firstName => .partlyRestored
  | .secondName => .writtenUnbracketed
  | .line138Terminal => .terminalUnpreserved

theorem first_name_is_partly_restored :
    reading .firstName = .partlyRestored := by rfl

theorem second_name_is_written_unbracketed :
    reading .secondName = .writtenUnbracketed := by rfl

theorem terminal_verb_unpreserved_in_selected_artifact :
    reading .line138Terminal = .terminalUnpreserved := by rfl

theorem two_name_loci_one_artifact :
    artifact .firstName = artifact .secondName := by rfl

theorem terminal_locus_different_artifact :
    artifact .line138Terminal ≠ artifact .secondName := by decide

#print axioms first_name_is_partly_restored
#print axioms second_name_is_written_unbracketed
#print axioms terminal_verb_unpreserved_in_selected_artifact
#print axioms two_name_loci_one_artifact
#print axioms terminal_locus_different_artifact

end HsHVerification.EnheduannaCDLIWitnessReadout
