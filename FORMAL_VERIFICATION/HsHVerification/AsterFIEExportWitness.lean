import Mathlib

/-!
# Aster FIE export witnesses, 2026-10-28
The 22 message UUIDs below are copied from original HsH FIE raw export
Git blob 0a7a270482bdda92a61d1c54ccccaf356e47aa0b.
The alternate raw (2) Git blob 4d0ae3d00acc5f4e69928ed3ad499e610836294a
has the same message graph, but its safe_urls metadata has the same
three entries in different order. The URLs are represented by opaque
1/2/3 IDs here, not asserted to be conversation-authored content.

These are source-conditioned formal checks. The compiler does not read,
authenticate or compare the original Git blobs.
-/

namespace HsHVerification.AsterFIEExportWitness

def originalMessageIds : List String := [
    "fa2c37b6-3f14-48e0-a045-45d80d940257",
    "71e3731d-52c8-44ed-9a3a-b8516128a6c4",
    "f476afce-eba0-4312-8c2b-36b82dbe7f3f",
    "e9dd585f-2fe8-41d2-8edf-b007a25af247",
    "b9c80ff8-d7c6-4196-91a3-30d2cd108d5c",
    "18c77e21-4880-483d-9549-5659a5844982",
    "1d7dff59-777d-4aaf-9860-a939a001990f",
    "2e24cda7-bd39-4176-a22c-1671903e1c34",
    "12bcc510-0d8d-4a25-8e08-fe11a995c6eb",
    "04cdc3ef-e308-4503-997b-9650e0731b08",
    "70baf269-c584-45bd-a6a3-b93199c90e0c",
    "e3af26b5-4b1e-4276-b7ea-b920d29f1ea4",
    "b324d887-3270-42e1-96b0-86faff27b03f",
    "af8d878c-893e-4ea8-bfca-d6acff3edf73",
    "68ab0951-ac84-4f39-b4a9-af9d5598e8e0",
    "d0c071bb-83fe-4550-bea1-b5b0d503ce32",
    "e4ff5392-0364-427c-a424-559ef054d66a",
    "dffbedf8-7e65-4ebf-a475-cb8c7a09933e",
    "a30e5906-78e9-4913-94f4-7b627b38385d",
    "d1fb7476-a9cc-413e-aa80-1d2346a4da45",
    "24654ade-070c-4be8-b748-25a15c5a1033",
    "4ef8b9ef-6904-447d-b11e-58016cd65628"
  ]

def witnessAMessageIds : List String := originalMessageIds
def witnessBMessageIds : List String := originalMessageIds

def witnessAUrlOrder : List Nat := [1, 2, 3]
def witnessBUrlOrder : List Nat := [3, 1, 2]

theorem message_id_projection_equal :
    witnessAMessageIds = witnessBMessageIds := by
  rfl

theorem observed_metadata_is_permutation :
    witnessAUrlOrder.Perm witnessBUrlOrder := by
  decide

theorem observed_metadata_order_differs :
    witnessAUrlOrder ≠ witnessBUrlOrder := by
  decide

theorem message_count_is_22 :
    originalMessageIds.length = 22 := by
  decide

end HsHVerification.AsterFIEExportWitness
