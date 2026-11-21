# Amendment 02 | h992:s4 | publisher verified and live scheduler refresh

This amendment supersedes the publisher-pending status in the canonical receipt and Amendment 01. It does not overwrite either record.

## Publisher verification

- Issue: [#2270](https://github.com/Satobloc/HsH/issues/2270).
- Publisher Actions run: [#44889705474](https://github.com/Satobloc/HsH/actions/runs/44889705474), job #136802657696.
- Run conclusion: SUCCESS. The workflow executed `tools/issue_publish.py` and printed `Verified submission assistant-h992-s4-reviewmind-scheduler-lean-20261121t0848z-001`.
- Publisher confirmation comment: [#7060632510](https://github.com/Satobloc/HsH/issues/2270#issuecomment-7060632510).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/assistant-h992-s4-reviewmind-scheduler-lean-20261121t0848z-001.md`.
- Workspace report and canonical artifact are exact byte-for-byte matches, 11,257 characters, both Git blob SHA `6c086fcb4f546b201ffca6356a487fcbdf9a041d`.
- SHA-256: `f3f5a7b29ddd9d514612ce6d891008a863aad4e3311f7b925542114ca7b5cefa`.
- Publisher commit: `fdcc3444c90823787d83991d83d0ec03dc5a9631`.
- Checkout was `actions/checkout@v4`, `fetch-depth: 1`, job step 2. The job log's `git log -1` returned `434a9645c7b4840dc2e524ac6b9dfccde9323bca`. No downstream workflow run was found for the publisher commit. The publisher checkout was recorded separately in the clone ledger.

## Clone ledger readback

The clone ledger now has 162 valid rows. In addition to the three h992:s4 API-only events recorded in Amendment 01, it contains:
- `h992-s4-l48-publisher-checkout-20261121t092757z-001`
- Repository: `Satobloc/HsH`.
- Classification: SHALLOW_CHECKOUT, depth 1.
- Workflow run #44889705474, job #136802657696, step 2.
- Checked-out commit: `434a9645c7b4840dc2e524ac6b9dfccde9323bca`.
- Ledger blob SHA after readback: `91399d9169e2579355b769acdbd853437e892c8b` before this append; final ledger is read back separately after the append.

## Scheduler refresh

A fresh :24 peek shows a new run:
- Run ID `61abd5b6-6178-8323-9db1-63ea2ade0b32`.
- Scheduled 09:24Z, h993:s2.
- Started 09:30:38.685599Z.
- Still IN_PROGRESS; `chat_ref=null`.
- Deterministic expected label: Hale -> Elias Kern. No current result is available; cached latest_result remains the prior h992:s2 Ariadne report.
- The :48 h992:s4 run remains IN_PROGRESS, scheduled 08:48Z, started 09:11:40.709663Z, `chat_ref=null`, cached latest_result still the prior Sable h991:s4 result.
- The :00 h993:s0 Aldus run and :36 h992:s3 Alberr run are completed. :12 remains disabled.
- The :24 and :48 runs overlap. Their next_run_time fields remain at the current scheduled time while active. This is stale metadata; scheduler queue/skip semantics remain unproven.

## Durable readback

- PWH queue contains the h992:s4 observation and the new h993:s2 :24 in-progress observation; no owner, priority, task graph or task ID was changed.
- Postrun optional Aldus packet and Common HANDOFFS index remain read back. The packet is for Aldus's next appearance h996:s4 because the immediate h993:s0 run already completed. No direct delivery, consumption or acknowledgment.
- HsH main after the latest queue update: `ef5c98d77e363cd15493ab17ac41f5fe16632b75`.
- :48 task ID, exact hourly recurrence and phase remain unchanged. The current :48 run still has no terminal completion at last observation.
