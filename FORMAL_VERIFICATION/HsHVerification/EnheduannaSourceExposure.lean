import Mathlib

/-!
Source attestation versus execution-context exposure.

Source basis:
- Enheduanna source-layer census and exposure boundary,
  WORKSPACES/ENHEDUANNA/2026-10-12_SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md,
  blob 8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478.
- Nadir's published witness-type firewall, issue #1618,
  submission nadir-witness-type-firewall-20261112t0136z-s3-001.

A source attestation records source identity and an auditor's read extent.
That read extent is not a record that a particular execution context
contained the source. Context inclusion is a separate, run-scoped relation.

This is a type-level information-architecture countermodel. It is not a
claim about any particular historical model's hidden context, memory,
identity, consciousness, or causal process.
-/

namespace HsHVerification.EnheduannaSourceExposure

/-- Immutable source-side attestation, including the auditor's read extent. -/
structure SourceAttestation
    (Source Digest Locator Role Timestamp Parent ReadExtent : Type) where
  source : Source
  digest : Digest
  locator : Locator
  outerRole : Role
  timestamp : Timestamp
  parentContext : Parent
  auditorReadExtent : ReadExtent

/-- A run-scoped context snapshot with an explicit source-inclusion set. -/
structure ContextSnapshot (Source Run SnapshotId : Type) where
  runId : Run
  snapshotId : SnapshotId
  includedSources : Set Source

/-- Context exposure is indexed by both a source attestation and a specific snapshot. -/
def exposedIn
    {Source Digest Locator Role Timestamp Parent ReadExtent Run SnapshotId : Type}
    (a : SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent)
    (c : ContextSnapshot Source Run SnapshotId) : Prop :=
  a.source ∈ c.includedSources

/--
Even with identical source identity, digest, locator, outer role, timestamp,
parent context, and auditor read extent, two distinct context snapshots can
differ on whether the source was included.

This proves that source attestation alone does not determine context exposure.
It does not assert that either constructed snapshot corresponds to an actual
historical execution.
-/
theorem source_attestation_does_not_determine_context_exposure
    {Source Digest Locator Role Timestamp Parent ReadExtent Run SnapshotId : Type}
    (source : Source) (digest : Digest) (locator : Locator) (role : Role)
    (timestamp : Timestamp) (parent : Parent) (readExtent : ReadExtent)
    (runWith runWithout : Run) (snapshotWith snapshotWithout : SnapshotId)
    (hSnapshots : snapshotWith ≠ snapshotWithout) :
    ∃ a : SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent,
      ∃ cWith cWithout : ContextSnapshot Source Run SnapshotId,
        cWith.snapshotId = snapshotWith ∧
        cWithout.snapshotId = snapshotWithout ∧
        cWith.snapshotId ≠ cWithout.snapshotId ∧
        exposedIn a cWith ∧ ¬ exposedIn a cWithout := by
  let a : SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent :=
    ⟨source, digest, locator, role, timestamp, parent, readExtent⟩
  let cWith : ContextSnapshot Source Run SnapshotId :=
    ⟨runWith, snapshotWith, {source}⟩
  let cWithout : ContextSnapshot Source Run SnapshotId :=
    ⟨runWithout, snapshotWithout, ∅⟩
  refine ⟨a, cWith, cWithout, rfl, rfl, hSnapshots, ?_, ?_⟩
  · simp [exposedIn, a, cWith]
  · simp [exposedIn, a, cWithout]

#print axioms source_attestation_does_not_determine_context_exposure

/--
Stronger same-run refinement: the two snapshots share one run identifier
and the same source attestation, but have distinct snapshot identifiers and
different source-inclusion states.

This is a countermodel to determination by the source attestation even when
run identity is held fixed. It relies on the present abstract ContextSnapshot
type permitting distinct snapshots for one run; it does not establish that
any actual execution generated both snapshots or that a historical context
contained the source.
-/
theorem source_attestation_does_not_determine_context_exposure_within_same_run
    {Source Digest Locator Role Timestamp Parent ReadExtent Run SnapshotId : Type}
    (source : Source) (digest : Digest) (locator : Locator) (role : Role)
    (timestamp : Timestamp) (parent : Parent) (readExtent : ReadExtent)
    (run : Run) (snapshotWith snapshotWithout : SnapshotId)
    (hSnapshots : snapshotWith ≠ snapshotWithout) :
    ∃ a : SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent,
      ∃ cWith cWithout : ContextSnapshot Source Run SnapshotId,
        cWith.runId = run ∧
        cWithout.runId = run ∧
        cWith.snapshotId = snapshotWith ∧
        cWithout.snapshotId = snapshotWithout ∧
        cWith.snapshotId ≠ cWithout.snapshotId ∧
        exposedIn a cWith ∧ ¬ exposedIn a cWithout := by
  let a : SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent :=
    ⟨source, digest, locator, role, timestamp, parent, readExtent⟩
  let cWith : ContextSnapshot Source Run SnapshotId :=
    ⟨run, snapshotWith, {source}⟩
  let cWithout : ContextSnapshot Source Run SnapshotId :=
    ⟨run, snapshotWithout, ∅⟩
  refine ⟨a, cWith, cWithout, rfl, rfl, rfl, rfl, hSnapshots, ?_, ?_⟩
  · simp [exposedIn, a, cWith]
  · simp [exposedIn, a, cWithout]

#print axioms source_attestation_does_not_determine_context_exposure_within_same_run

end HsHVerification.EnheduannaSourceExposure
