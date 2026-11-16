import Mathlib

/-!
Elias Kern Track A, 2026-10-29 14:24 UTC.
Publisher keyset evidence from *actual* GitHub issues #1020, #1021, #1022.
Current issue bodies were read as JSON. Source validator:
HsH/tools/issue_publish.py Git blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf.
Issues #1020 and #1021 each omit sha256; #1022 has the required key.
This formalization proves only consequences of transcribed finite keysets.
It does not validate GitHub authenticity, hash bytes, workflow semantics,
a physical model, or historical Nathan authorship.
-/

namespace HsHVerification.EliasPublisherKeyEvidence

def expectedKeys : List String :=
  ["schema", "submission_id", "content", "sha256"]

def issue1020Keys : List String :=
  ["schema", "submission_id", "content"]

def issue1021Keys : List String :=
  ["schema", "submission_id", "content"]

def issue1022Keys : List String :=
  ["schema", "submission_id", "content", "sha256"]

def missing (keys : List String) : List String :=
  expectedKeys.filter (fun key => !keys.contains key)

def extra (keys : List String) : List String :=
  keys.filter (fun key => !expectedKeys.contains key)

theorem issue1020_missing_only_sha :
    missing issue1020Keys = ["sha256"] := by decide

theorem issue1021_missing_only_sha :
    missing issue1021Keys = ["sha256"] := by decide

theorem issue1020_has_no_extra :
    extra issue1020Keys = [] := by decide

theorem issue1021_has_no_extra :
    extra issue1021Keys = [] := by decide

theorem issue1022_exact_keys :
    issue1022Keys = expectedKeys := by decide

theorem rejected_keysets_differ_from_required :
    issue1020Keys ≠ expectedKeys ∧ issue1021Keys ≠ expectedKeys := by decide

#print axioms issue1020_missing_only_sha
#print axioms issue1021_missing_only_sha
#print axioms issue1020_has_no_extra
#print axioms issue1022_exact_keys
#print axioms rejected_keysets_differ_from_required

end HsHVerification.EliasPublisherKeyEvidence
