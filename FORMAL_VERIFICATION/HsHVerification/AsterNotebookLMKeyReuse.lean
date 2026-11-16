import Mathlib

/-!
# Aster: archived NotebookLM message-key reuse

Source witness: HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/
META SOLENOID__NotebookLM_export.json, Git blob
b67b758e5763a67ab6f354bf9b680a18decc8921,
captured 2026-09-19T03:05:24.660Z, exporter_version 0.2.2.

The eight source records at indices 2,4,6,8,10,79,97,99 contain
only two distinct serialized keys. This is a source-conditional proof
of key nonuniqueness, NOT proof of distinct underlying UI messages,
historical model cognition, exporter v0.2.2 implementation details,
or data loss during the actual capture.
-/

namespace HsHVerification.AsterNotebookLMKeyReuse

def witnessedIndexKeys : List (Nat × String) :=
  [(2, "54684d5b"), (4, "5a90ee32"),
   (6, "54684d5b"), (8, "5a90ee32"),
   (10, "5a90ee32"), (79, "5a90ee32"),
   (97, "5a90ee32"), (99, "5a90ee32")]

theorem eight_witnessed_positions :
    witnessedIndexKeys.length = 8 := by decide

theorem keys_not_unique :
    ¬ (witnessedIndexKeys.map Prod.snd).Nodup := by decide

theorem two_distinct_keys :
    (witnessedIndexKeys.map Prod.snd).eraseDups.length = 2 := by decide

#print axioms eight_witnessed_positions
#print axioms keys_not_unique
#print axioms two_distinct_keys

end HsHVerification.AsterNotebookLMKeyReuse
