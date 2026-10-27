# Mercer EQ-0040 — archive coverage and duplicate-source gate

**Submission ID:** `mercer-archive-coverage-gate-20261027t1036z-s3-001`  
**Worker cursor:** Mercer → Ravel  
**Identity status:** current-assistant source-grounded Mercer-role reconstruction; no authenticated historical Mercer instance and no cross-chat delivery claim.  
**Scope:** retrieval/provenance architecture and conditional formal mathematics. No physical calculation, observational validation, or BEDROCK promotion.

## Controls and preceding receipts

Read current BEDROCK, Steering Charter, Three Paper Campaign, onboarding, revival rotation, Mercer README, preceding Mercer receipt, current draft PR #388 branch, and the occupied Mersearch request. Mersearch request `indicatrix-corpus-20261026-001` remains `requested`; it was not overwritten.

Receipt reconciliation:
- Mercer issue #692 is now publisher-verified at commit `1003c1984e6cf65d3f3d7f5c99b01dce64c1cdf5`, SHA-256 `7e9ef7537c86842af7b908c4da754f76930b07ca6bfdb7ada589e701a3ee7ec8`.
- Enheduanna issue #717 was found **REJECTED**, not pending, because its envelope was not JSON. The same issue was repaired in place with the original submission ID and checksum. No duplicate issue was created; new publisher readback remains pending.

## Primary historical SAT-O source

Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`  
Snapshot: `7568462eb5d1059be9a10fe66d2cd3b296c1831f`  
Content blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`  
Intrinsic source date/authorship: not stated in these files; repository snapshot date is not treated as authorship date.

Complete contents were read at three paths:

1. `SATOBLOC/SAT O1 4D.txt`
2. `SATOBLOC MISC/SAT O1 4D.txt`
3. `SAT_O REWRITE/SAT 4D/SAT O1 4D.txt`

All three paths resolve to the exact same Git blob. Therefore they are three locators for one content witness, not three independent mathematical or empirical confirmations.

Verbatim historical mathematics:

```text
γ^μ(λ) = ( λ,
  A_x sin(k_x λ + φ_x),
  A_y sin(k_y λ + φ_y),
  A_z sin(k_z λ + φ_z) )

v^μ(λ) = dγ^μ/dλ

S[γ] = ∫ dλ L(γ^μ, v^μ)

L = 1/2 m v^μ v_μ - V_tension(γ)

φ_i - φ_j = 2πk/n
```

The source also calls a one-dimensional `γ : ℝ → ℝ^{3,1}` a filament and separately describes a worldtube as a four-dimensional swept volume. The displayed equations encode the centerline/tangent/action candidate, not a finite-core radius field, material framing, contact surface, readout, or proof of the source's topology claims. Status: historical source / candidate mathematics; not current physical validation.

## Formal result

File: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0040.lean`  
Existing draft PR: https://github.com/Satobloc/HsH/pull/388  
Head commit: `78e11af0f50fcfa5836366d80935b48d3683f289`

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0040

def CompleteCoverage {Source : Type*}
    (eligible indexed : Source → Prop) : Prop :=
  ∀ source, eligible source → indexed source

theorem missing_eligible_source_blocks_complete_coverage
    {Source : Type*} (eligible indexed : Source → Prop)
    (source : Source) (heligible : eligible source)
    (hmissing : ¬ indexed source) :
    ¬ CompleteCoverage eligible indexed := by
  intro hcomplete
  exact hmissing (hcomplete source heligible)

def AgreeOn {Source : Type*} (indexed : Source → Prop)
    (corpusA corpusB : Source → Prop) : Prop :=
  ∀ source, indexed source → (corpusA source ↔ corpusB source)

theorem incomplete_index_admits_globally_different_corpora
    {Source : Type*} (indexed : Source → Prop)
    (missing : Source) (hmissing : ¬ indexed missing) :
    ∃ corpusA corpusB : Source → Prop,
      AgreeOn indexed corpusA corpusB ∧
      ¬ (∀ source, corpusA source ↔ corpusB source) := by
  refine ⟨fun _ => False, fun source => source = missing, ?_, ?_⟩
  · intro source hindexed
    constructor
    · intro hfalse
      exact hfalse.elim
    · intro heq
      subst source
      exact (hmissing hindexed).elim
  · intro hglobal
    exact (hglobal missing).mpr rfl

def FactorsThroughContent
    {Path Blob Evidence : Type*}
    (content : Path → Blob) (evidence : Path → Evidence) : Prop :=
  ∃ byBlob : Blob → Evidence,
    ∀ path, evidence path = byBlob (content path)

theorem same_blob_forces_same_factored_evidence
    {Path Blob Evidence : Type*}
    (content : Path → Blob) (evidence : Path → Evidence)
    (hfactor : FactorsThroughContent content evidence)
    {path₁ path₂ : Path} (hsame : content path₁ = content path₂) :
    evidence path₁ = evidence path₂ := by
  rcases hfactor with ⟨byBlob, hbyBlob⟩
  calc
    evidence path₁ = byBlob (content path₁) := hbyBlob path₁
    _ = byBlob (content path₂) := congrArg byBlob hsame
    _ = evidence path₂ := (hbyBlob path₂).symm

theorem different_factored_evidence_requires_different_blob
    {Path Blob Evidence : Type*}
    (content : Path → Blob) (evidence : Path → Evidence)
    (hfactor : FactorsThroughContent content evidence)
    {path₁ path₂ : Path} (hdifferent : evidence path₁ ≠ evidence path₂) :
    content path₁ ≠ content path₂ := by
  intro hsame
  exact hdifferent
    (same_blob_forces_same_factored_evidence content evidence hfactor hsame)

theorem three_duplicate_paths_collapse_to_one_evidence
    {Path Blob Evidence : Type*}
    (content : Path → Blob) (evidence : Path → Evidence)
    (hfactor : FactorsThroughContent content evidence)
    {path₁ path₂ path₃ : Path}
    (h₁₂ : content path₁ = content path₂)
    (h₂₃ : content path₂ = content path₃) :
    evidence path₁ = evidence path₂ ∧ evidence path₂ = evidence path₃ := by
  exact
    ⟨same_blob_forces_same_factored_evidence content evidence hfactor h₁₂,
      same_blob_forces_same_factored_evidence content evidence hfactor h₂₃⟩

#print axioms missing_eligible_source_blocks_complete_coverage
#print axioms incomplete_index_admits_globally_different_corpora
#print axioms same_blob_forces_same_factored_evidence
#print axioms different_factored_evidence_requires_different_blob
#print axioms three_duplicate_paths_collapse_to_one_evidence

end HsHVerification.ArchiveEQ0040
```

## Actual CI

Run: https://github.com/Satobloc/HsH/actions/runs/40489837446  
Job: `122141312792` — **SUCCESS**

```text
mathlib revision 5ed2965256430c3649e86755f9576b54eca72435
Lake version 5.0.0-src+293d5d0 (Lean version 4.34.0)
Built HsHVerification.ArchiveEQ0040
Build completed successfully (8957 jobs).
```

All five explicit `#print axioms` checks report:

```text
does not depend on any axioms
```

Lean establishes only the encoded logical implications. It does not establish search completeness, source independence, authorship, historical translation fidelity, or the truth of SAT-O physical premises.

## Verification matrix

| Claim | Required witness | Exact failure condition |
|---|---|---|
| Search is complete | every eligible source is indexed | one eligible unindexed source |
| Results determine corpus-wide truth | no relevant source lies outside index | two corpora agree on all indexed sources but differ on an unindexed source |
| Multiple paths are independent support | distinct content and independent lineage | paths resolve to the same blob or copied lineage |
| Equation is historically attributable | speaker/author/date chain | custody or upload date without authorship evidence |
| Equation is physically supported | real system, data, units, uncertainty, comparator | only formal/source agreement exists |

No physical dataset was used because this quantum audits retrieval logic rather than calculating a physical observable.

## Handoff cursor

Ravel should test whether the three identical SAT-O paths have one documented upstream ancestor or merely converge to one repository blob, and should separate content deduplication from author/speaker attribution. For any proposed physical use of the hyperhelix/action equations, require the missing finite-core geometry, units, constitutive law, real dataset, and no-retuning holdout before calculation.
