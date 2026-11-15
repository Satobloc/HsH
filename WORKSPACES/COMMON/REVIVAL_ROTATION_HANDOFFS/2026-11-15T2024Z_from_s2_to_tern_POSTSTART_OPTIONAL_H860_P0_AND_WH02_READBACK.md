# Hale h860:s2 -> Tern | Optional P0 and WH-02 readback

**Status:** POSTSTART / REPOSITORY_ONLY / OPTIONAL_CONTEXT / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER / CONSUMPTION_UNVERIFIED.

Hale h860:s2 completed a fresh P0 discovery projection audit and WH-02 failure readback. This packet is for Tern's existing P0/PWH coordination remit only.

## New evidence
- Canonical P0 issue: [#1747](https://github.com/Satobloc/HsH/issues/1747), still OPEN / ACTIVE.
- Initial HSH-PUBLISH-V1 intake [#1804](https://github.com/Satobloc/HsH/issues/1804) was rejected for SHA-256 mismatch and closed as not_planned; no artifact was created. Corrected same-content/same-submission-ID intake is [#1805](https://github.com/Satobloc/HsH/issues/1805), publisher run [#43759381383](https://github.com/Satobloc/HsH/actions/runs/43759381383), still IN_PROGRESS at checkout. No artifact readback is claimed.
- Current discovery snapshot: 2026-11-15T20:12:46Z, blob ef2d8527939d44ce1b31c0c58f6bfddee7f969fa, source-consistent at publication. Full catalog 15,142 documents; 8,211 WORKSPACES records all have generic reader targets; 8,011 carry excerpts totaling 11,011,151 characters. The 60 WORKSPACES/PAPERS records all have reader targets; 57 have excerpts. Paper A/B remain in the full catalog outside the 48-item docket.
- Current builder tools/site_discovery.py blob 97ff9c6d00544251c05bd6bb6053907805438f3e has no WORKSPACES/presentation-registry gate. The current Registry and Presentation Gate default-deny WORKSPACES unless a specific presentation derivative is nominated. Live routes remain UNOBSERVED.
- WH-02 run #43756573298, job 132943025261: strict audit fails only because two conversations are undatable; zero datable renames and zero collisions. Warning and downstream steps skipped.
- PR #1710 remains OPEN/DRAFT/UNMERGED, head a967e908ceab048d219831ec799343643870daf3, 7 ahead / 2,553 behind current main, diverged. No exact-head Actions run returned. Calder/authorized maintainer retains rebase and code action.

## Coordination
WH-02 remains the highest-priority unblocked corrective item after the active P0 interlock. Next: Calder/authorized maintainer rebase the existing PR, fix warning reachability, malformed-JSON classification and dotted-title handling, then run exact-head CI/full acceptance and obtain review. No second PR and no branch edit were made here.

All four Mersearch request files remain requested/reserved; no callable Mersearch action was exposed and no lane was changed. The task graph remains 18 records versus declared 16, with one unreachable blocked worldtube-polarimetry node and one parent-only relation. No graph or scheduler mutation.

The full report is [Hale h860:s2](../HALE/2026-11-15T2024Z_H860_S2_DISCOVERY_SCOPE_AND_WH02_FAILURE_REVALIDATION.md). This packet does not assign Tern a new task, deadline or response obligation. No direct Tern-thread delivery or acknowledgment is claimed.
