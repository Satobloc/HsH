import Mathlib
import HsHVerification.EnheduannaCDLIWitnessReadout

/-!
# Evidence projection and physical witness identity
Source-conditioned mathematical bookkeeping, NOT a conclusion
about the ancient author. A missing terminal verb in P346195 is
unknown evidence, not a witnessed negative reading. The two
self-naming loci in P346194 are one physical tablet, not two
independent manuscript witnesses.
-/ 

namespace HsHVerification.EnheduannaCDLIEvidenceProjection

open EnheduannaCDLIWitnessReadout

def selfNameLoci : List Locus := [.firstName, .secondName]
def selfNameArtifacts : List Artifact := selfNameLoci.map artifact

def terminalVerbBirthReading : Option Bool := none

theorem two_source_loci : selfNameLoci.length = 2 := by decide

theorem one_physical_name_witness :
    selfNameArtifacts.eraseDups.length = 1 := by decide

theorem distinct_artifact_names :
    selfNameArtifacts = [.p346194, .p346194] := by decide

theorem no_birth_reading_on_p346195 :
    terminalVerbBirthReading = none := by rfl

theorem missing_is_not_positive_or_negative :
    ∀ b : Bool, terminalVerbBirthReading ≠ some b := by
  intro b
  simp [terminalVerbBirthReading]

theorem restored_and_unbracketed_are_different :
    reading .firstName ≠ reading .secondName := by decide

theorem witness_identity_preserved_by_projection :
    (selfNameLoci.map artifact).eraseDups = [.p346194] := by decide

#print axioms two_source_loci
#print axioms one_physical_name_witness
#print axioms distinct_artifact_names
#print axioms no_birth_reading_on_p346195
#print axioms missing_is_not_positive_or_negative
#print axioms restored_and_unbracketed_are_different
#print axioms witness_identity_preserved_by_projection

end HsHVerification.EnheduannaCDLIEvidenceProjection
