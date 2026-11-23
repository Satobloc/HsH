# Sable h1052:s3 receipt amendment 01: final readback

**Parent receipt:** [2026-11-23T2036Z_s3_sable.md](2026-11-23T2036Z_s3_sable.md)  
**Final main head at readback:** `3b84d917ca76e5409869cc00507a924e62734bf7`  
**Status:** FINAL_READBACK_VERIFIED / PUBLISHER_REJECTED_SCHEMA / NO_ARTIFACT

## Exact repository readback

The following files were independently fetched from main after the continuity updates:

| Artifact | Git blob SHA-1 | Readback |
|---|---|---|
| Sable README | `e9ecd4f3ca5ed952e22342bed6eaba2abd061b55` | h1052 top checkpoint and source-supplement note present |
| Sable BOOT | `79396ed929ba79bbe50d8c1b761830631965cb91` | h1052 top checkpoint present |
| Sable CONTINUITY_CHECKPOINT | `f3bf6d95ec7e0177d45e96917a8d883e22dc71e1` | h1052 top checkpoint present; prior h1037/h1048 history preserved below |
| Historical remit source supplement | `7f3854d73f83a8be723c15d165ac3d6514980e6d` | canonical and duplicate export identities and source turns present |
| Operation envelope v0.1 | `075adb8752a1b9a2cfd6303171cfc31f53132981` | proposal-only contract present |
| h1052:s3 report | `125d6ea75ae5ae670e28c197cd01b986d1dd93d0` | publication rejection amendment present |
| Canonical receipt | `41eadc3e1b73223976af4a6994faf2c40f66679b` | parent receipt present |

The final report SHA-256 is `41d4cdde119f361f19e73d709d697b6ee5b434d5b1d90851a6f8c21a2a0be84d`. The original issue-body content at submission was byte-identical to the then-current workspace report and had SHA-256 `16ebca63dc5e647a7c784c0a1a90e8ee960e61ecd166cd74f47e1214d439be5a`. The workspace report is now longer because it appends the publisher outcome; the original issue body remains unchanged as the single public audit record.

## Publisher finality

Issue [#2447](https://github.com/Satobloc/HsH/issues/2447) has one publisher comment, [#7113792518](https://github.com/Satobloc/HsH/issues/2447#issuecomment-7113792518), stating `REJECTED: invalid schema`.

The exact current validator `tools/issue_publish.py` requires lowercase `hsh-publish-v1`. The submitted envelope used uppercase `HSH-PUBLISH-V1`. The workflow `.github/workflows/issue-publisher.yml` listens only to `issues.opened`. The expected canonical artifact path returned 404.

No issue-body edit, retry, workflow rerun, duplicate issue, replacement submission, direct artifact write, or bypass was attempted. Final status remains **PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED**.

## Source-hash correction trail

The first draft of the historical-source supplement contained two mistyped hash strings. Both were recomputed from the exact materialized Library bytes and corrected before the report and publisher intake were created. The final supplement blob above was independently fetched. The canonical `raw.json` values match the existing Sable README; the `raw (1).json` export is a separate full-file snapshot with identical direct user-role messages but a different whole-file identity. No publisher issue contained the mistyped strings.

## Lean and scheduler finality

- PR #2446 exact PR-head checkout assertion passed.
- Actions run #45263282161 / job #138003422453: SUCCESS, 8,948 build jobs, Lean 4.34.0 / Lake 5.0.0.
- Theorem-specific axiom output and skipped audits are recorded in the report. PR remains draft/open/unmerged; no independent review.
- The existing :36 task remains enabled with ID `6a9f52b69ec08191b0a2ba24a074f781`, exact hourly :36 America/New_York schedule, and Worldtube phase.
- Final :36 peek: run `190458df-6ffc-8328-a042-0acc5f2f1eb9` remains IN_PROGRESS with `chat_ref=null`; cached latest result is Kestrel h1051:s3, not this run.
- The :48 task remains enabled with original ID/schedule/Review phase; its h1052 run had already started. No handoff packet, direct-thread delivery, acknowledgment, or consumption was created or claimed.
- No task, ID, cadence, prompt, phase, ownership, signet, conversation title, or theory status was changed. No sixth task.

**Next ring label:** Loom. No assignment or response obligation.
