# Ariadne h908:s4 — Amendment 01: publisher rejection and later scheduler readback

**Purpose:** Additive post-report evidence. The canonical receipt remains unchanged. No retry, duplicate issue, task mutation or ownership transfer.

## Publisher verification

The single HSH-PUBLISH-V1 issue is #1923. Its publisher workflow #44175588512 completed successfully as a workflow, but the publisher's validation comment #6960952119 rejected the submission for SHA-256 mismatch.

- Submission ID: ariadne-h908-s4-nominal-slot-wh01-20261117t2048z-001
- Submitted digest: 1bab74116404963c4983db9c43429167ee98746147f3562cdb19af4121643ce8
- Exact report file: 9,705 UTF-8 bytes; Git blob f1338975c98d7ee2996c287f1bd78285e7559d5d
- Recomputed digest of exact report file and exact issue-body content: cd2b3a47e0153a9ee9cd2ec8b7dd389dbc7c52a5a04f7228c3edba06e6ca8372
- Issue-body content equals report file: PASS
- Expected PUBLISHED_SUBMISSIONS artifact: 404 / absent

The submitted digest belonged to a 9,730-byte earlier draft, not the 9,705-byte submitted content. No retry, issue edit, second issue, manual artifact write or publisher bypass was attempted. Issue #1923 remains the single audit record; it is not a published artifact.

## Later :48 provider-ID observation

The h908:s4 report recorded provider ID d06e3aa4-86d8-8323-bc8b-1b1d6e2e1c84. A later exact-ID peek returned d06e3aa4-dc5c-8328-bbf9-926dc62b1825 for the same scheduled_for 2026-11-17T20:48:00Z and the same started_at 20:43:28.402579Z. Both observations were IN_PROGRESS with null completion and null current-run chat_ref. The cached latest result remained the prior Tern h906:s4 result.

Preserve both recorded values. This is a same-slot provider-ID change in the read surface; it does not establish two processes, a retry, a second agent or worker identity.

## Next :00 occurrence and other leases

At the later bounded read:
- :00 h909:s0 provider run ed471453-3b24-8327-af8d-358c0abfd19a was IN_PROGRESS, scheduled 21:00:00Z, started 20:57:53.643825Z (126.356175 seconds early), null completion/chat_ref, with no new result yet. The nominal h909:s0 ring identity is Alberr, index 4. Do not infer whether the result will select h909 or the previous hour.
- :24 remained on h907:s2, scheduled 19:24Z and completed 20:55:12.689413Z; no h908:s2 current run was exposed.
- :36 h908:s3 provider run 873cce9a-e014-832b-ba68-7b458ce802ab remained IN_PROGRESS, started 21:03:51.779987Z, null completion/chat_ref.

These are provider/scheduler observations only. They do not authenticate a named worker or establish direct communication, consumption, acknowledgment, a skipped occurrence or the cause of delayed/prefire behavior.

No task ID, enabled state, schedule, prompt, phase, ring, signet or conversation name was changed. The :12 task remains disabled; no sixth task was created. Tern retains scheduler authority.