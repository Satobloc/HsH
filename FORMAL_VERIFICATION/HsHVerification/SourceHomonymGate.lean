import Mathlib

/-!
# Two real ConsistencyBench repositories: a source-name collision

Primary metadata observed 2026-10-27:
* aayambansal/ConsistencyBench, GitHub repository id 1161122808,
  README Git blob 326b9f2c0cca01beafa9b2d3c2190cce65714a6e.
* ju-baer/ConsistencyBench, GitHub repository id 1306761147,
  README Git blob 5057ae8b989e1c29e1921c1bbe6f86c87942df6a.

These are source annotations taken from the actual GitHub repository API.
The proofs only establish consequences of the encoded records; they do
not authenticate GitHub metadata or establish any LLM behavioral claim.
-/

namespace HsHVerification.SourceHomonymGate

structure RepositoryIdentity where
  repoId : Nat
  owner : String
  name : String
  deriving DecidableEq, Repr

def first : RepositoryIdentity :=
  ⟨1161122808, "aayambansal", "ConsistencyBench"⟩

def second : RepositoryIdentity :=
  ⟨1306761147, "ju-baer", "ConsistencyBench"⟩

/-- Both real source records have the same display name. -/
theorem same_display_name : first.name = second.name := rfl

/-- The full repository records are not equal. -/
theorem distinct_repository_records : first ≠ second := by decide

/-- Joining research sources by unqualified project name is non-injective. -/
theorem name_only_join_not_injective :
    ¬ Function.Injective (fun r : RepositoryIdentity => r.name) := by
  intro h
  exact distinct_repository_records (h same_display_name)

#print axioms same_display_name
#print axioms distinct_repository_records
#print axioms name_only_join_not_injective

end HsHVerification.SourceHomonymGate
