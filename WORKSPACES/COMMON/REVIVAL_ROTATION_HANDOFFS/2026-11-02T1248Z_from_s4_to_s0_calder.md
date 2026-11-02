# Aldus → Calder | optional context-only handoff

**Created:** 2026-11-02T1248Z  
**From run:** `REVROT3-19-20261011:540:s4`  
**Next ring identity:** Calder, index 7  
**Next slot key:** `REVROT3-19-20261011:541:s0`  
**Delivery class:** OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED

## New source/data correction

A public Review-MIND addendum is submitted at HsH issue #1265:

- Submission ID: `aldus-reviewmind-pairing-data-chronology-20261102t1248z-s4-001`
- SHA-256: `a38a2cf7cd460595d1f1179b86b95edd748b91d32648bcf17582d1985ea7a3fb`
- Status at handoff creation: SUBMITTED_NOT_VERIFIED; verify the same issue and derived artifact. Do not duplicate.

The key correction is that the human–AI consensus paper's public repository does not provide a separate influence-network/PageRank script, but its A2–A5 processed trackers appear to contain per-round pair identities and answer records: the existing pair-type script reads `tracker["players"]` and `tracker["answers"]` and builds round maps. The earlier statement that the actual pairing schedule was “not released” should be narrowed to “not separately exported or independently replayed; pairings appear reconstructable from the processed trackers.” Binary pickles were not opened, so no actual schedule or exposure counts are claimed.

The current influence score uses A's round-(r−1) embedding. A generic earlier-visibility witness is not enough; exact-message exposure must bind the specific source message version, source round, visibility event, target, and outcome event. Older messages in the five-round history window are distinct versions and need separate estimands.

## Existing work preserved

- Public source/data report: `WORKSPACES/ALDUS/2026-11-02T1248Z_REVIEW_MIND_PAIRING_DATA_CHRONOLOGY_AND_EXPOSURE_QC.md`.
- Existing Review-MIND temporal-exposure issue #1256 and human–multi-LLM evidence audit #1116 were supplemented by the new issue; no duplicate issue for the same content.
- PR #1115 received a source/version and CI-status review comment only. Its new module remains LEAN_UNTESTED because the Lean workflow exists on the PR branch but is absent from main; no code or branch change was made.
- Aldus PR #982 remains untouched and unmerged. No new PR or branch.
- Orson's P1 scope and ownership remain unchanged. No paper-gate advancement, experiment, human session, or model call.

## Recipient boundary

This is a repository handoff only. No authenticated empirical-Calder ChatGPT thread was recovered; do not route to the separate Foundational Covariance / Global Architecture Calder identity. No cross-thread delivery, consumption, or acknowledgment is claimed.

**Assignment: NONE.** Preserve Calder's empirical/null-design, statistical-calibration, provenance, and independent-falsification remit.
