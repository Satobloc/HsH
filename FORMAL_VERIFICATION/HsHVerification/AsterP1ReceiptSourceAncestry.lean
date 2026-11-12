import Mathlib

/-!
# Aster P1: seven documented review receipts share one 17-file CGD source corpus

Source-conditional formalization, not an authenticated multi-agent experiment.
Observed receipts (2026-10-29, :48 UTC): Kestrel 07, Mira 09,
Nadir Voss 10, Meridian 11, Loom 12, Aldus 13, Mercer 15.
All seven receipts report processing the original 17 CGD model files
from aayambansal/ConsistencyBench, pinned by Orson's source manifest
Git blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9.
The seven receipts were fetched individually on 2026-10-29.
The missing Sable 08:48 canonical receipt is NOT included.

Each SourceFile index represents one of the actual 17 immutable Git blobs.
The mapping is an EXPLICITLY ASSUMED source-to-code transcription.
Lean does not inspect the receipts, Git blobs, experiment independence,
model identity, semantic validity, or cognitive claims.
-/

namespace HsHVerification.AsterP1ReceiptSourceAncestry

-- Source-verified receipt index: 0 Kestrel, 1 Mira, 2 Nadir Voss,
-- 3 Meridian, 4 Loom, 5 Aldus, 6 Mercer.
abbrev Receipt := Fin 7

abbrev SourceFile := Fin 17

-- Source-conditional representation of the seven inspected receipt claims.
def observedSources (_r : Receipt) : Finset SourceFile := Finset.univ

theorem receipt_count : Fintype.card Receipt = 7 := by decide

theorem each_receipt_uses_seventeen (r : Receipt) :
    (observedSources r).card = 17 := by
  simp [observedSources]

theorem any_two_receipts_share_seventeen (a b : Receipt) :
    ((observedSources a) ∩ (observedSources b)).card = 17 := by
  simp [observedSources]

theorem source_read_edges :
    (Finset.univ : Finset Receipt).sum
      (fun r => (observedSources r).card) = 119 := by
  decide

theorem distinct_source_files :
    ((Finset.univ : Finset Receipt).biUnion observedSources).card = 17 := by
  have h : (Finset.univ : Finset Receipt).biUnion observedSources =
      (Finset.univ : Finset SourceFile) := by
    ext x
    constructor
    · intro _
      exact Finset.mem_univ x
    · intro _
      exact Finset.mem_biUnion.mpr
        ⟨(0 : Receipt), Finset.mem_univ _, Finset.mem_univ _⟩
  rw [h]
  simp

#print axioms receipt_count
#print axioms each_receipt_uses_seventeen
#print axioms any_two_receipts_share_seventeen
#print axioms source_read_edges
#print axioms distinct_source_files

end HsHVerification.AsterP1ReceiptSourceAncestry
