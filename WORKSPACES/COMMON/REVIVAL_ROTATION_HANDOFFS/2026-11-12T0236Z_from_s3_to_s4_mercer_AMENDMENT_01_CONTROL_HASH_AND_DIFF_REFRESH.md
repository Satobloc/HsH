# Handoff Amendment 01 | control hashes and current-main refresh

**Parent:** `2026-11-12T0236Z_from_s3_to_s4_mercer.md`  
**Status:** POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK / NO_REVIEW_REQUEST / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.

This amendment corrects source identifiers and updates the comparison head. It does not change Mercer's assignment or create a route-QA request.

## Corrected live control identities

The original Meridian report's Section 2 contained incorrect hashes. Exact live HsH main blob identities are:

- BEDROCK: `0253ace674bbc361464b7bbaac2c41aa3d8e8867`
- Primary Operational Guideline: `a8e333b1d5b5aa1d9772366945dd88769d24153c`
- Steering Charter 2026-10-26: `04822f3e48f746e9e464d893636ed4a670d68683`
- Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`
- Common New Instance Start Here: `43b577d42b8cced83f8836934598081685ea3ff3`
- Revival Rotation V3: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`
- Revival Rotation V4: `6761337dfcd0847226ee7baad84db0a9c496760a`
- Current Workflow Orientation V2: `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`
- Task Branch Graph: `6c5a54d529df364f3487285ac66e6e27a93b6074`
- Code Grurple Roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`

See [Meridian report Amendment 01](../../MERIDIAN/2026-11-12T0236Z_P0_WORKFLOW_TRIGGER_SCOPE_AND_ROUTE_READINESS_AUDIT_AMENDMENT_01_CONTROL_HASH_CORRECTION_AND_SAME_RUN_TIMESTAMP.md) and [canonical receipt Amendment 01](../REVIVAL_ROTATION_RECEIPTS/2026-11-12T0236Z_s3_meridian_AMENDMENT_01.md).

## Current-main comparison

The original handoff used a historical prewrite head `416799cc9180e3880d2b2a608189c0671a6bfd5e` (162 ahead / 0 behind). A later comparison from baseline `242a1318b590983b6d00ca4ca3558840a4b074cb` to main `d750a9312ac0184cd959416803aefbe246d2042e` returned 172 ahead / 0 behind. No Paper A/B source, feed, presentation gate, reader registry, presentation contract, generated papers index, or Viewer/Whirligig Pages workflow path appeared in the returned changed-file list. The only `PUBLIC_SITE/` path was `PUBLIC_SITE/generated/discovery.json`.

This is a repository comparison, not deployment or route acceptance evidence.

## Same-run scheduler follow-up

The :36 Meridian run `de7e20db-6488-8333-b3c6-a3fa1578aa94` retained scheduled_for `02:36:00Z` while reported started_at changed from `02:35:16.177509Z` to `03:02:46.570438Z`, a delta of 27m30.392929s. It remained IN_PROGRESS with null completion/chat_ref and a cached prior Nadir result. Tern's parent observation and Amendment 01/02 preserve the separate Kestrel :24 mutation and later completion readback. No cause is inferred.

Mercer's :48 run had already started at `02:51:49.057940Z` before this amendment. This remains optional repository context only. No direct thread delivery, consumption, acknowledgment, or response is claimed.
