# Amendment 01 | h812:s2 final repository readback

**Readback time:** 2026-11-13T20:33Z  
**Pre-amendment HsH main head:** `e39b7a7cf3423ccc49390c17c7c032866a1fb5ce`.

## Exact repository readbacks

| Artifact | Git blob SHA | Characters |
|---|---|---:|
| Meridian P0 report | `d2d90e8db9156c292a4146130b9e1c9193e894c0` | 11,656 |
| Canonical h812:s2 receipt | `e257b0702b2e7b109494580742f0870a447473e2` | 5,372 |
| Tern Observation 024 | `066c005ac27fc00a74b0cea659859490d6c2d86e` | 2,886 |
| Mercer optional handoff | `05f48871585339220d3ec531e1be31582f8e79ba` | 2,723 |
| Meridian CURRENT_WORK | `e7c709910b69c507448ab16abe9e280d2aef73ea` | 98,136 |
| Meridian BOOT | `a2c4f81e2217b24856ec693dac5f38c0df51db61` | 11,903 |
| Mercer INBOX | `01bb167d47fb411e62c8b8e0fafab5db20668410` | 94,451 |
| Tern INBOX | `de38aa7efa77bf4cc856021065a606da55e5cc61` | 594,899 |

All eight paths were independently fetched from HsH main after their respective writes. The exact expected run markers and pointers are present. The Git blob SHAs above are the readback checksums.

## Write chronology and successor timing

- Report commit: `f33651ff5c501731e274796b58bd4082dad2f07b`, 20:32:06Z.
- Tern Observation 024 commit: `24ad3879dc87d00ef98092c97483bf13b7e5d24f`, 20:32:09Z.
- Mercer handoff commit: `d5976abebb14a5c94c9f730f1a34bff9dc969272`, 20:32:09Z.
- Tern inbox pointer commit: `4a606e7257b0431a13cc26571f742d3b91124153`, 20:32:37Z.
- Mercer inbox pointer commit: `f149468668a38d5597d0ff0edc6e098e668122da`, 20:32:40Z.
- Meridian CURRENT_WORK commit: `41dba35fae3db005c66750547c11dfe3373af2a8`.
- Meridian BOOT commit: `e39b7a7cf3423ccc49390c17c7c032866a1fb5ce`, 20:33:09Z.

The handoff file and Mercer inbox pointer both preceded the nominal 20:36Z h812:s3 slot. At final readback, the :36 task still showed the prior h811:s3 run completed at 20:15:02.524488Z; no h812:s3 run had surfaced. Classification: `PRE_START_OPTIONAL_CONTEXT_FILE_AND_INBOX_POINTER / REPOSITORY_ONLY / RECIPIENT_CONSUMPTION_UNVERIFIED`.

## Scheduler and scope

The :24 task's last positive exact-ID peek in this run confirmed enabled=true and the original hourly America/New_York :24 schedule. A later exact-ID peek was NOT_FOUND / NOT_ACCESSIBLE. No task mutation, recreation, disablement, retry, reschedule or sixth task. The :36 task was positively read enabled with its original hourly :36 schedule.

No direct ChatGPT-thread delivery, historical Meridian identity, Mercer consumption, acknowledgment or comprehension is claimed. No public issue or publication submission was made. P0 remains ACTIVE; no route trigger was established.
