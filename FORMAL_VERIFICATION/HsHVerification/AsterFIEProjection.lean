import HsHVerification.AsterFIEExportWitness

/-!
# Projection and full-record distinction
Formalizes that two records may agree on message IDs and have equivalent
unordered URL metadata while remaining different serialized records.
No claim about historical authorship or underlying physical premises.
-/

namespace HsHVerification.AsterFIEProjection

structure ExportProjection where
  messageIds : List String
  urlOrder : List Nat
  deriving DecidableEq

def witnessA : ExportProjection :=
  ⟨AsterFIEExportWitness.witnessAMessageIds,
   AsterFIEExportWitness.witnessAUrlOrder⟩

def witnessB : ExportProjection :=
  ⟨AsterFIEExportWitness.witnessBMessageIds,
   AsterFIEExportWitness.witnessBUrlOrder⟩

theorem message_projection_equal :
    witnessA.messageIds = witnessB.messageIds := by
  exact AsterFIEExportWitness.message_id_projection_equal

theorem metadata_unordered_equal :
    witnessA.urlOrder.Perm witnessB.urlOrder := by
  exact AsterFIEExportWitness.observed_metadata_is_permutation

theorem serialized_projection_not_equal :
    witnessA ≠ witnessB := by
  intro h
  have hOrder : witnessA.urlOrder = witnessB.urlOrder :=
    congrArg ExportProjection.urlOrder h
  exact AsterFIEExportWitness.observed_metadata_order_differs hOrder

end HsHVerification.AsterFIEProjection
