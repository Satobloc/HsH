import Mathlib

/-!
# Aster: filename/byte-length metadata is not an artifact identity

This module formalizes a narrow provenance rule.

An `Artifact` carries an opaque identity tag in addition to its filename
and byte length. The metadata projection forgets that tag. The theorem
shows that this projection is not injective in general: equal filename and
length do not, by themselves, prove byte identity.

The Boolean identity tag is an abstract mathematical witness, not a
cryptographic digest and not an assertion that any two concrete files differ.
The evaluations below use observed attachment metadata only. They do not
establish a byte-for-byte match to an archive candidate.
-/

namespace HsHVerification.AsterAttachmentMetadata

structure Artifact where
  filename : String
  byteLength : Nat
  identityTag : Bool
  deriving DecidableEq, Repr

def metadata (a : Artifact) : String × Nat :=
  (a.filename, a.byteLength)

theorem metadata_projection_not_injective :
    ¬ Function.Injective metadata := by
  intro hinj
  have hmeta :
      metadata (⟨"x", 0, false⟩ : Artifact) =
      metadata (⟨"x", 0, true⟩ : Artifact) := rfl
  have heq :
      (⟨"x", 0, false⟩ : Artifact) = ⟨"x", 0, true⟩ :=
    hinj hmeta
  have hne :
      (⟨"x", 0, false⟩ : Artifact) ≠ ⟨"x", 0, true⟩ := by
    intro h
    cases h
  exact hne heq

theorem exact_identity_implies_same_metadata
    (a b : Artifact) (h : a = b) :
    metadata a = metadata b := by
  cases h
  rfl

-- Actual metadata values recovered from a user-role attachment manifest.
-- These evaluations do not establish byte identity or transfer time.
#eval metadata ⟨"SAT LAYMAN.txt", 24587, false⟩
#eval metadata ⟨"SAT 22Jun25.pdf", 5381173, false⟩
#eval metadata ⟨"FINAL.pdf", 495821, false⟩

#print axioms metadata_projection_not_injective
#print axioms exact_identity_implies_same_metadata

end HsHVerification.AsterAttachmentMetadata
