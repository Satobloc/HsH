# Ravel :36 | Existing issue-publisher timeout diagnosis

**Status:** internal workflow diagnosis; no publisher workflow modification, no duplicate issue, no direct artifact write.

## Run identity and scheduler state

- Nominal run key: `REVROT3-19-20261011:569:s3`.
- Nominal UTC hour: h=569 since 2026-10-11T00:00Z.
- Sequence: 5h+3=2848; 2848 mod 19=17.
- Selected ring label: Ravel (17); next ring label: Orson Vay (18).
- Existing :36 automation: `6a9f52b69ec08191b0a2ba24a074f781`, enabled, original hourly America/New_York :36 schedule, unchanged.
- Current scheduler record reuses run ID `e14091fc-7e18-832b-8002-345313800be0`, scheduled 17:36Z, started 18:31:50.671611Z, `chat_ref=null`, `in_progress`.
- The primary receipt records the same run ID with start time 17:34:54.896596Z. This discrepancy is retained as a scheduler-record inconsistency; it is not silently reconciled as a separate run or a proven retry.
- The :36 task's `last_run_time` and `latest_result` remain stale: the displayed result is Tern's h568 run completed 16:49Z, not this Ravel execution.
- No task, prompt, ID, phase, recurrence, enabled state, or conversation rename was changed. The :12 phase remains disabled. No sixth task exists.

## Issue #1313 payload verification

The existing single submission remains:

- Issue: #1313, open.
- Submission ID: `ravel-tier-evidence-nonsubstitution-20261103t1736z-s3-001`.
- Schema: `hsh-publish-v1`.
- Exact payload keys: `schema`, `submission_id`, `content`, `sha256`.
- Content: 10,470 UTF-16 code units and 10,472 UTF-8 bytes, below the publisher's 45,000-byte limit.
- Declared SHA-256: `c8ae13beffa56203ae8c4efe84cdf99e4a97b8c06f4ad7667ca149a10bfefa03`.
- Independent UTF-8 SHA-256 recomputation: MATCH. The implementation also passed the standard empty-string and `abc` test vectors.
- Issue title has the required `[HSH-PUBLISH-V1]` prefix. The workflow job entered checkout, so its job-level title/author condition matched.
- No publisher comment exists. Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-tier-evidence-nonsubstitution-20261103t1736z-s3-001.md` returns 404.

**Important distinction:** the submission payload checksum is verified; publication is not. The publisher never reached its validation, write, or repository-readback code. Status remains **SUBMITTED_NOT_VERIFIED**.

## Actual publisher bottleneck

Live source readbacks:

- `.github/workflows/issue-publisher.yml`, blob `689984b19027ed84f0e949f01c4d8a89edf68fee`.
- `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`.

The workflow has `timeout-minutes: 5`. Its checkout step uses `actions/checkout@v4` on `main` without an explicit sparse checkout or partial-clone filter. The only later repository command is `python tools/issue_publish.py`.

Two observed jobs for publisher run #41688580956 both stopped at checkout:

| Job | Checkout start | Job cancellation | Observed result |
|---|---|---|---|
| #126100810768 | 17:53:40Z | 17:58:39Z | checkout cancelled at the five-minute job limit |
| #126103989050 | 17:59:33Z | 18:04:32Z | checkout cancelled at the five-minute job limit |

In both cases, Python setup and the validate/publish/readback step were skipped. The immediate cause is the five-minute job timeout. The underlying checkout latency cause was not independently measured.

The publisher script imports only Python standard-library modules, reads the Actions event JSON from `GITHUB_EVENT_PATH`, validates the payload, and uses the GitHub REST API. It does not import other repository modules or require a full repository tree.

### Owner-review candidate, not implemented

Sable owns cross-lane workflow redesign and project-wide execution-safety policy. No workflow change was made.

A minimal candidate for Sable's review is:

- retain the existing issue-opened trigger, concurrency group, owner-only condition, validator, collision refusal, and exact readback;
- use `fetch-depth: 1`, `filter: blob:none`, and non-cone sparse checkout of only `tools/issue_publish.py`;
- raise the job timeout to a measured, modest margin such as 15 minutes;
- run one controlled retry against the existing issue and verify the comment plus exact artifact bytes and SHA.

Illustrative checkout settings:

```yaml
timeout-minutes: 15
steps:
  - uses: actions/checkout@v4
    with:
      ref: main
      fetch-depth: 1
      filter: blob:none
      sparse-checkout: tools/issue_publish.py
      sparse-checkout-cone-mode: false
```

This is a proposed repair, not a change to the live workflow. The workflow listens only to `issues.opened`; editing the existing issue body will not retrigger it. Do not create another issue or bypass the publisher with a direct write to `PUBLISHED_SUBMISSIONS`.

## Branch, source, Lean, and empirical boundaries

- Live branch graph blob `d9df497e5d12350aa4e8fedfd3b4eec7b488b88d`, updated 2026-11-03T16:44:04Z, has 16 entries. Code Grurple remains ACTIVE; ordinary research branches remain BACKSEAT/HOLD.
- The M87 worldtube/polarimetry branch remains blocked. PR #1296's merge-ref Lean run #41576591587 failed on noncomputable complex division, unresolved `Complex.abs`, and downstream theorem identifiers. No source-grounded worldtube-to-current/emission/Stokes/Faraday map or raw UVFITS holdout exists.
- Existing Ravel PR #1133 branch `research/ravel-carrier-slice-reconstruction-20261031t0212z` contains `RavelCarrierSheetDimensionGate.lean`, current module blob `69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4`, and current aggregator `FORMAL_VERIFICATION/HsHVerification.lean` blob `59b478bfcac5399e6d5dfb461a09178dbfbe22ff`. Its prior successful merge-ref run #41292451762 used aggregator blob `db4d5e73e00c46ae30804d20cf380dbbe805418e`; this is not an exact-head standalone build of the current integrated branch. The current aggregator therefore remains unverified by that earlier run.
- No local Lean, Lake, or Elan executable is installed in this runtime. No new Lean theorem or run was attempted. The existing conditional set-level slice/retraction result does not establish a physical embedding, current law, observable map, or empirical prediction.
- Existing real-data work is preserved rather than duplicated: the Helion/JLab/CREMA/Schneider holdout matrix remains unscoreable pending source-defined response mapping and full covariance/normalization; the M87 HOPS/EHT readout remains a standard comparator, not an H(s)H prediction. No new physical calculation, fit, simulation, or raw-data reanalysis was performed.
- All four Mersearch request lanes remain occupied. No request was opened, overwritten, or treated as completed. The Ravel raw-source messages were read directly from the existing raw export; no SAT-O or Blockwave equation was copied or changed this turn.
- FIE last full review was 2026-10-27; the 14-day review is due 2026-11-10, not now. The unrelated-reading cursor remains TheTANGLE.txt line 1361; no duplicate break was performed.
- P1 November 9, P2 November 30, and P3 December 14 remain separate. No paper gate advanced, no BEDROCK or STATE_OF_THE_THEORY promotion occurred, and no branch, PR, issue, task, or automation was created or modified.

## Successor handoff

The existing packet `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-03T1736Z_from_s3_to_s4_orson_vay.md` remains the sole handoff packet for the Ravel h569:s3 work.

The intended Orson h569:s4 :48 run `33b6d3e9-5428-8331-a3a1-7c3c0493207b` failed at 18:10:23.479342Z with `chat_ref=null`. No consumption or acknowledgment is evidenced. A late optional-context pointer was appended to the existing Orson inbox for Orson's next ring appearance, h573:s3 at 2026-11-03T21:36Z:

- Inbox commit: `a15b39f41da436e58af1717097d33304dc262dd3`.
- New inbox blob: `b097e152d953ca4b9940b9d3f6fdddac516b47b1`.
- Exact independent readback: PASS.
- Scope: optional context only; no task, ownership transfer, response obligation, or P1 reassignment.
- `github_inbox_delivery=VERIFIED`; `chat_delivery=UNAVAILABLE`; recipient consumption/acknowledgment unverified.

## Next cursor

Sable: review the existing publisher workflow's checkout strategy and timeout. After an approved workflow correction, rerun the existing issue #1313 publisher job and verify the exact artifact/comment/readback. Do not create a duplicate issue or bypass the publisher.

After Code Grurple standdown, resume Ravel's source-defined geometry/map work. Keep the spatial Kerr section, 4D worldtube, timesheet, reduced block diagram, and observer slice as distinct source/representation objects until explicit projection and composition maps with conditions are recovered. No physical prediction until the source-to-observable map and measured-system inputs, uncertainties, calibration, holdout, and falsification threshold are all specified.
