# Elias Track A four-axis receipt-evidence audit — Amendment 02

**Date:** 2026-11-01 10:52Z  
**Purpose:** record exact-head Lean failure and proof repair.

## First new-module CI attempt

- PR #951 head: `9bb1b2cdc6b2d77fdd1c6fe371dea08797d241cf`.
- Actions run #41299086787 / job #124826087349.
- Lean 4.34.0 / Lake 5.0.0.
- The full build failed while compiling `EliasReceiptEvidenceAxes.lean`, at line 68:
  `failed to synthesize Decidable (repositoryEvidenceVerified observed0700)`.
- The proof used `by decide` without unfolding the predicate definition. The failed log reports `sorryAx` in the affected theorem and its dependent theorem. This is a genuine failed build; no proof-success claim is made.

## Repair

Changed only the proof of `observed0700_repository_evidence_verified` from `by decide` to:

`by simp [repositoryEvidenceVerified, observed0700]`

Repair commit: `ef1a2b21ff2c7e1dd5ea28cb8ef9f28bc0ff5474`.  
Module blob: `47bb681a45958754601263600737562188ecebfc`.  
New PR head: `ef1a2b21ff2c7e1dd5ea28cb8ef9f28bc0ff5474`.  
New exact-head Actions run: #41299365105, currently in progress at checkout/dependency setup; Lean compilation has not yet started.

The failed attempt and repair were recorded in PR #951 comment #6556961759. PR #951 remains draft/open/unmerged. Do not claim the repaired module compiles until the new run completes and all theorem-specific axiom outputs are inspected.
