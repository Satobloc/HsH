# H942:S1 Amendment 01 | Publisher schema rejection | 2026-11-19T0647Z

**Superseding publication status:** REJECTED_SCHEMA / NOT_PUBLISHED.

The existing publisher intake [issue #2072](https://github.com/Satobloc/HsH/issues/2072) was created once with the report content and lowercase `hsh-publish-v1` schema. The existing publisher workflow [run #44474483464](https://github.com/Satobloc/HsH/actions/runs/44474483464), job #135391585387, completed SUCCESS, but the publisher comment [#7001945876](https://github.com/Satobloc/HsH/issues/2072#issuecomment-7001945876) says:

`REJECTED: unexpected payload keys`

Inspection of the exact current validator `tools/issue_publish.py` established the required key set is exactly:
- `schema`
- `submission_id`
- `content`
- `sha256`

The submitted issue body contained only the first three keys. The missing fourth key is `sha256`. The workflow's SUCCESS conclusion means the validator handled the rejection and posted its comment; it does not mean publication succeeded.

Readback checks:
- Workspace report and issue `content` are byte-identical.
- Report UTF-8 size: 15,150 bytes.
- Independently recomputed SHA-256: `2f727da75598bb16c3b01948fd37d4caf65cb0ff38d0ba5df89c106e8d8ceba6`.
- Expected canonical artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h942-s1-joint-clock-calibration-family-20261119t0636z-001.md`: HTTP 404 / absent.

No retry, issue edit, duplicate issue, replacement submission, direct artifact write, or publisher bypass was attempted. Issue #2072 and its rejection comment remain unchanged. The workspace report and receipt remain durable, but the report is not canonically published.

**Correction for future intake:** include the exact report SHA-256 as the fourth JSON key. This note is diagnostic only; it does not authorize resubmission or create a new task.
