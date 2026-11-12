# Optional Review-MIND QC | Enheduanna PR #1619 | source-exposure model

**Status:** OPTIONAL_CONTEXT_ONLY / NOT_FORMAL_PR_REVIEW / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER / NO_DIRECT_THREAD_DELIVERY.

## Scope and verification

This is a separate assistant QC pass on the existing formalization, not an authenticated independent agent or human review.

- PR: https://github.com/Satobloc/HsH/pull/1619
- Current PR head: 9b576c86cf37a06bab767cbcddc9d769379a8c53
- Actual base branch: infra/lean4-verification-20261023 at c7dc2c483f50ae03fc7a7c530829170135e18d92
- Comparison against the actual base: 3 commits ahead, 0 behind. A comparison against main is not the relevant PR integration comparison because this PR targets the infrastructure branch.
- PR remains OPEN / DRAFT / UNMERGED.
- The target module blob at PR head and the two checked-out merge references is identical: fb6a147ec7640bada1fb8e512b9e27d711e44f4d.
- Actions runs #43137274286 and #43138042440 both succeeded on merge-reference commits; each built 8,945 jobs using Lean 4.34.0 / Lake 5.0.0 and Mathlib revision 5ed2965256430c3649e86755f9576b54eca72435.
- The second run's theorem-specific #print axioms output for source_attestation_does_not_determine_context_exposure is [propext]. This is not a global axiom audit.
- Tests, lint, nanoda and leanchecker were skipped. No committed lake-manifest.json was found at PR head. A separate Vercel daily-rate-limit failure is not a Lean failure.

## What the theorem establishes

The existing theorem is a valid constructive countermodel: the same source attestation/read extent can coexist with two distinct context snapshots that differ on whether the source is included. It supports the narrow claim that source attestation alone does not determine context exposure.

## Modeling limits worth considering

1. ContextSnapshot contains runId, snapshotId and includedSources : Set Source, but exposedIn tests only whether a.source belongs to includedSources. The attestation's digest, locator and read extent are not bound to the included item. A path/source identity could therefore stand for multiple content versions.
2. The theorem accepts runWith and runWithout separately and does not require equality. It does not establish that two snapshots of the same execution can differ.
3. The current module is a minimal set-level countermodel, not a complete message/span-level exposure witness or provenance graph. It does not establish output uptake, causal influence or authenticated subject identity.

## Optional refinement

Introduce an exact exposure reference carrying at least source identity, digest, message ID and span/locator; let each context snapshot contain a set of those exact references. Add a same-run variant that fixes one run and varies only two distinct snapshot IDs. Keep source attestation, audit-read event, context-exposure witness, output-uptake witness, causal-influence evidence and authenticated-subject evidence as separate typed records.

A schematic same-run proposition is:

For one fixed run r and distinct snapshot IDs s₁ ≠ s₂, there can exist snapshots c₁ and c₂ with c₁.runId = c₂.runId = r, while exact exposure membership differs.

This extension is PROPOSED / NOT_COMPILED. No source code, PR, branch, review or CI run was changed or created. The existing theorem's Lean result does not establish historical context exposure or the truth of any physical or psychological premise.

## Source boundary

The source-layer census and Nadir's existing witness-type firewall (#1618) were read. This note adds only the narrower same-run/content-addressed exposure question; it does not replace the existing witness taxonomy or Orson's cognition research.

Orson retains sole ownership of P1 and the November 9 cognition paper. No model trial, human-subject experiment or behavioral result is claimed.