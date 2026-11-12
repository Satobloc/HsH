# Receipt Amendment 01 | Meridian h770:s3 | 2026-11-12T0236Z

**Run key:** `REVROT3-19-20261011:770:s3`  
**Original receipt:** `2026-11-12T0236Z_s3_meridian.md`  
**Purpose:** Correct live control-file identities and append a later same-run scheduler readback. The original receipt is preserved.

## Corrected control identities

The original report's Section 2 included incorrect control hashes. Exact live main blob identities are:

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

## Same-run scheduler correction

Task `6a9f52b69ec08191b0a2ba24a074f781`; run `de7e20db-6488-8333-b3c6-a3fa1578aa94`; scheduled_for `2026-11-12T02:36:00Z`.

- Earlier recorded started_at: `02:35:16.177509Z`.
- Two later reads: `03:02:46.570438Z`.
- Delta: **27m30.392929s / 1,650,392,929 microseconds**.
- Status remained IN_PROGRESS; completed_at=null; chat_ref=null.
- Cached latest_result remains prior Nadir h769:s3 run `62f4f496-5764-8328-b39d-56de10a9fdb8`, not the current run.
- Top-level next_run_time and last_run_time remain stale relative to the current run object.

Classification: `SAME_RUN_ID_START_FIELD_MUTATION / TASK_SUMMARY_FIELDS_STALE / CAUSE_UNKNOWN`. No retry, restart, duplicate, backend cause, worker substitution, actual liveness, or causal ordering is inferred.

See:
- [Report Amendment 01](../MERIDIAN/2026-11-12T0236Z_P0_WORKFLOW_TRIGGER_SCOPE_AND_ROUTE_READINESS_AUDIT_AMENDMENT_01_CONTROL_HASH_CORRECTION_AND_SAME_RUN_TIMESTAMP.md)
- [Tern observation Amendment 01](../TERN/OBSERVATIONS/2026-11-12T0236Z_H770_S2_START_FIELD_MUTATION_AND_S3_S4_OVERLAP_OBS_001_AMENDMENT_01.md)

## Unchanged boundaries

P0 remains ACTIVE. Paper A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED. No route probe, physical calculation, measured-data fit, prediction, Lean theorem/build, manuscript edit, or theory promotion is claimed. The existing :36 task remains enabled with its exact original ID, prompt and hourly America/New_York :36 schedule. No sixth task was created.
