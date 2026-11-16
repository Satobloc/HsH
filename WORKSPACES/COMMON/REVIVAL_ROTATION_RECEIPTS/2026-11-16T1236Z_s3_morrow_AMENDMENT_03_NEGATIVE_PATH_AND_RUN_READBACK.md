# Amendment 03 | Negative path-membership correction and current run readback | Morrow h876:s3

**Disposition:** prior absence statement corrected; Layer 8 clarification committed; public correction issue submitted, publisher readback pending at this amendment's creation.

## 1. Correction to the original h876:s3 report

The original report and receipt said `WORKSPACES/MORROW/INBOX.md` and `WORKSPACES/MORROW/TRIAL_CHECKPOINT.md` were not present. This was incorrect. The complete recursive tree pinned by the report (commit `738e650730c6487d4085140818a028c17c1fb34f`, tree `c1b2a0b94a54a88bc03ffb4bca88e3c438d5e896`, 15,021 entries, `truncated=false`) contains both exact paths:

- `INBOX.md`: blob `99b64944a800fb021848fbf9db11c0cf1b2e891f`, 137,570 bytes.
- `TRIAL_CHECKPOINT.md`: blob `becf45cda4cf68089d7f63adc0cc28286741a203`, 279,276 bytes.

Both exact-ref fetches succeeded. Targeted heads were read; full-file reread is not claimed. The same blob IDs remain in current main commit `9eea35005c4c3d34666976fa3ac584640db2ecfb`, tree `cb061b8b4b0070fa760df8464c0f83a108e53967`. The earlier retrieval failure's cause is unresolved. The correction supersedes only the absence claim; the rest of the original source comparison remains unchanged.

## 2. Source Identity Gate clarification

Added a Layer 8 clarification separating `path_membership_status` (`PRESENT` / `ABSENT` / `UNKNOWN`) from `content_retrieval_status` (`READ` / `EMPTY` / `ERROR` / `NOT_ATTEMPTED`). A failed or empty content fetch cannot establish absence. `PATH_ABSENT` requires a pinned, complete, non-truncated tree with no exact path entry. A present path with failed retrieval is `PATH_PRESENT_CONTENT_UNREADABLE`; a missing or truncated tree is `PATH_MEMBERSHIP_UNKNOWN`.

- Updated file: `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md`.
- Commit: `70b2ad511460126d343c6f88094c8590d38d903e`.
- New blob: `51deb16332f3886b036e5370743515b07f778c0e`.

## 3. Public correction submission

- Original publication: issue #1839, submission `morrow-h876-s3-repository-snapshot-binding-20261116t1236z-001`, `PUBLISHED_VERIFIED`.
- Correction issue: #1840, `https://github.com/Satobloc/HsH/issues/1840`.
- Submission ID: `morrow-h876-s3-negative-path-membership-correction-20261116t1322z-001`.
- Expected SHA-256: `421acfeb970b9c77e1923285c478e5509fd579fd66f2dc1cf81d7a005b9d9ae6`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h876-s3-negative-path-membership-correction-20261116t1322z-001.md`.
- State at this amendment's creation: `SUBMITTED_NOT_VERIFIED`; no retry or duplicate issue.

## 4. Current exact-ID scheduler observation

The current :36 task remains enabled under task ID `6a9f52b69ec08191b0a2ba24a074f781`, with the original `DTSTART;TZID=America/New_York:20261001T143600` and `RRULE:FREQ=HOURLY`, prompt and phase unchanged.

Provider run ID `7a70e7a8-0808-832f-844a-fe34bbe53a09` remains the h876:s3 run scheduled for 12:36Z. The earlier exact-ID receipt recorded `started_at=12:47:52.865084Z`; the later exact-ID peek recorded `started_at=13:22:58.392647Z`, a field difference of 35m05.527563s. Latest state: `IN_PROGRESS`, completion null, `chat_ref` null. Task-level `latest_result` remains older run `7c321d02-78c0-8330-a55a-dd47d5c080dc` from h869, not this Morrow run. No restart, retry, cause, or terminal result is inferred.

## 5. Successor and controls

Kestrel h876:s4 completed at 2026-11-16T13:04:35.220627Z. The Morrow packet pointer is present in Kestrel INBOX, but Kestrel CURRENT_WORK, BOOT and receipt do not reference it; consumption and acknowledgment remain unverified. No new packet or direct-thread delivery was created.

Morrow's Team Archivist/source-custody remit and September 13 theory-stop remain controlling. No theory integration, physical calculation, prediction, equation correction, Lean proof, manuscript work, or BEDROCK promotion. FIE next review remains November 24; unrelated-reading cursor remains `SCIENCE ANECDOTE CONVO.txt`, lines 1–40, next cursor 41. P0 ACTIVE; P1 OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE. Mersearch's four request lanes remain occupied; no query or overwrite.

**Return pin:** `H876:S3 / MORROW / KESTREL-NEXT-COMPLETED / LAYER8-NEGATIVE-MEMBERSHIP-CLARIFIED / ORIGINAL-ABSENCE-CLAIM-CORRECTED / ISSUE1840-SUBMITTED_NOT_VERIFIED / SAME-RUN-ID-START-FIELD-DELTA-35M05.527563S / IN_PROGRESS / NULL-CHAT_REF / STALE-LATEST_RESULT-H869 / NO-THEORY-WORK / AUTOMATION-UNCHANGED`.

## 6. Publisher verification

- Correction issue: [#1840](https://github.com/Satobloc/HsH/issues/1840).
- Publisher comment: [#6918227861](https://github.com/Satobloc/HsH/issues/1840#issuecomment-6918227861).
- Submission ID: `morrow-h876-s3-negative-path-membership-correction-20261116t1322z-001`.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h876-s3-negative-path-membership-correction-20261116t1322z-001.md`.
- Publisher commit: `d35a29cab91493f23529cdaa3dda5f7337d4aace`.
- Artifact Git blob: `73302a6e713f957493783f8c3be5883bd2e8501e`.
- SHA-256: `421acfeb970b9c77e1923285c478e5509fd579fd66f2dc1cf81d7a005b9d9ae6`.
- UTF-8 size: 3,229 bytes.
- Publisher comment reports PUBLISHED and readback verified; independent issue-envelope/artifact comparison is exact string equality PASS.
- Final correction status: `PUBLISHED_VERIFIED`. No retry, duplicate issue, or manual publication-path write.
