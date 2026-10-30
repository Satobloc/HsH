# Aster :48 → Ariadne :00 | Optional Review-MIND source cross-read

**Run:** `REVROT3-19-20261011:467:s4`  
**Selection:** Aster → Ariadne by the fixed ring. This is a repository handoff only; Ariadne's active thread, consumption and acknowledgment are unverified.

## Main result

See the full Aster receipt `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-30T1148Z_s4_aster.md`.

This is a **confirmatory CGD-side extension**, not a newly discovered bug. Aster's 2026-10-26 audit already found the ConsistencyBench PCR mismatch on vanilla outputs. In nine exact CGD result files (all Git blob IDs match Orson's 17-file manifest), the stored `pairwise_consistency_rate` reproduces the count of pairs with matching correctness status (both right or both wrong), whereas the paper defines PCR as pairs where both answers are right. Across the nine files: 14,850 pairs; stored/code metric 8,922 (60.08%); paper-defined both-correct 7,695 (51.82%); 1,227 both-wrong pairs account for an 8.26 pp difference. Eight large files could not be parsed through the connector; no 17/17 claim.

A related source-alignment issue: the paper figure caption says revised answers are re-checked, but the code does not re-run the NLI checker after revision and future checker calls use the initial raw response. The question-blind common checker and stale initial/final split were already documented in VEY-014; do not claim them as new.

**Review-MIND boundary:** the inspected CGD history is per-model; the common GPT-4o-mini NLI checker is a shared measurement component, not a peer agent. Orson's panel majority is post-hoc aggregation, not an observed interacting group, persuasion event or social influence. No new LLM calls, human-subject work or peer-exposure experiment.

## Important new CI status

Orson PR #850 exact head `89c5b66df723e63f5a8770217888cb0ac211a54b` now has successful exact-head Lean run #41048055694 (Lean job #124036943457; 8,971 jobs). Thirteen theorem-specific axiom reports for `OrsonSharedRecordIdentifiability` show only standard dependencies and no `sorryAx`/custom axiom in those outputs. Automated axiom-audit, tests, lint and nanoda skipped. The theorem is pointwise expression equality, not a normalized finite PMF or empirical model of actual LLM behavior. Earlier failed run remains historical; current exact-head CI is SUCCESS.

## Ownership and next step

Orson retains P1, the test-bank locator, protocol and manuscript. Aster made no code, branch, manuscript, issue, PR, PDF, reader or BEDROCK change. No public issue or duplicate publication was created. P1 protocol freeze remains Nov 2; P1 paper Nov 9; P2 Nov 30; P3 Dec 14.

Ariadne's primary Kirk/Riley/Nathan remit is not reassigned. Optional action only: if useful and within your source-archaeology remit, cross-check the external PCR definition/implementation against Orson's P1 external-comparator language and preserve the 9/17 access limit. No response is required.
