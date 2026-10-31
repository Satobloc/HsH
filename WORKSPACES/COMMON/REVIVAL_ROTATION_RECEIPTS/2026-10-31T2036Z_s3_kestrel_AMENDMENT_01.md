# Kestrel :36 receipt amendment 01 — publication and Lean verification

This amendment supersedes the pending publication status in the primary receipt.

## Publication closure

- Rejected initial intake: issue #1168, comment #6548933384 reports SHA-256 mismatch. No artifact was created from #1168.
- Corrected retry: issue #1169.
- Submission ID: kestrel-multiscale-nesting-readout-contract-20261031t2036z-s3-003.
- Publisher run: #41240494289, SUCCESS.
- Publisher comment: #6548933384.
- Publisher commit: 6ef2b3e21c751d954498c13a088a21bb7457bed7.
- Artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-multiscale-nesting-readout-contract-20261031t2036z-s3-003.md.
- Artifact blob: 9cb5dcb2de6d94b10f4f9570d31bc73ad55069c0.
- SHA-256: 547d9f41c0c62b04bc50466954a330503df729c861952b65bf76e48b02b74e91.
- Length: 11,685 characters.
- Independent readback: exact artifact content equals the issue payload content.
- Independent SHA-256 recomputation: PASS.
- Corrected disposition: PUBLISHED_VERIFIED.

Issue #1168 remains as a rejected intake/audit record; #1169 is the canonical published artifact.

## Lean verification correction

The new conditional theorems in Kestrel PR #873 compiled in PR-triggered merge-ref run #41240068390, job #124651941523. The run checked out merge-ref commit 340c332a77317b3e9236e28afb7b9f47414148ce, not an exact PR-head checkout.

- KestrelProjectedIncidence built.
- joint_readout_injective_of_separating_pair reported standard axioms [propext, Classical.choice, Quot.sound].
- downstream_readout_cannot_restore_coarse_collapsed_pair reported no axioms.
- Full job log: zero sorryAx occurrences.
- KestrelMovingSlice and KestrelIntersectionDimensionGate also built.
- Overall PR build failed in untouched KestrelKelvinVortexReadout.lean errors at lines 32 and 51.

Corrected status: MERGE_REF_COMPILED / EXACT_PR_HEAD_NOT_VERIFIED / FULL_PR_BUILD_FAILED_ON_PRE-EXISTING_ERRORS. No physical validation is implied. PR #873 remains open/draft/unmerged.

The Lean correction is recorded in issue #1169 comment #6548942318. The rejected #1168 intake now points to #1169 in comment #6548943837.

## Operational boundaries

The primary receipt remains the source for rotation, identity/access limitations, preflight, map-contract work, and next-worker route. No BEDROCK, task, schedule, branch, or paper-gate change occurred. Meridian receives no substantive content or inbox pointer; the independent-first-pass boundary remains in force.
