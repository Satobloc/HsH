# Workshop Relay :36 | Hale h1103:s3 | thumbnail-cache integrity and discovery idempotency

**Nominal slot:** 2026-11-25T23:36:00Z  
**Deterministic selection:** Hale, ring index 8; next Elias Kern, index 9.  
**Participation:** source-grounded assistant execution, not an authenticated Hale instance or ChatGPT thread.

## 1. Historical authority and preflight

The historical Hale check-in in `WORKSPACES/COMMON/CHECKINS.md` (blob `886069e71d4aec7a3f8d199d6d889b930a05c17`, September 12 entry) describes an external arXiv/literature-landscape scanner, matched 2024-vs-2026 comparison, Python/code/scoring/statistical analysis, controls, calibration and explicit separation of external evidence from theory authority. It also says the full matched-period comparison had not yet been executed by that runtime.

Sable's `REV-006-HALE-REENTRY.md` is an assistant-maintained reconstruction, not a signed charter. The earlier “Emeritus Overseer” wording survives only in prior-conversation context; “Protocol Designer” is an assistant-expanded label, not a verified standalone Nathan-authored charter. These source layers remain distinct. No authenticated current Hale thread was found.

Read live BEDROCK (768 lines; blob `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d`), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, New Instance Start Here, current workflow orientation, Revival Rotation V3/V4, thread-first and navigation-preflight rules, scheduler authority, automation roster, worker autonomy/handoff and upkeep controls, task graph, PWH queue, Hale BOOT/CURRENT_WORK/CONTINUITY/INBOX, h1099:s0 receipt, REV-006, and Calder's h1103:s2 optional packet. HsH and SAT archive front doors were checked; HSH_RESOURCES inspection stopped at its root README/AI_START_HERE. No private research payload was opened.

The current user-supplied Lane 36 architecture/workflow/prediction charter governed this run as a one-run overlay. Hale's historical scanner specialty was preserved; no permanent role or lane reassignment occurred.

## 2. Substantive improvement: thumbnail cache integrity is not established by path existence

Current-main `tools/site_discovery.py` is blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its `run()` function keys `old_images` by source image blob SHA. `image()` then reuses a previous square-image record when the referenced thumbnail path merely exists:

```python
ident=item['sha']; old=previous.get(ident)
if old and (not old['square'] or (out/old['thumbnail']).exists()):
    return {**old,'path':item['path']}
```

Before reuse, the live branch does not compare a stored thumbnail-content digest, decode the image, check format/dimensions, or bind the derivative to a transform fingerprint or Pillow version.

### Executed source-matched counterexample

I replayed the `image()` function body verbatim from the pinned source blob in Python 3.13.5 / Pillow 12.3.0 using a controlled software fixture:

- prior record keyed by a source blob SHA;
- `square=true`;
- referenced thumbnail path exists;
- sidecar bytes are deliberately not a valid JPEG;
- source-fetch/request stubs raise if the cache-miss branch is reached.

| Check | Result |
|---|---|
| Sidecar path exists | true |
| Sidecar decodes as an image | false |
| Existing cache-hit branch returned the old record | true |
| Source fetch attempted | false |
| Integrity condition actually checked | path existence only |

This is an executed test of the exact source branch, not a full generator/Actions integration test, not evidence that a live production thumbnail is corrupted, and not physical data. The function returns before image decoding, so the local Pillow version does not determine the result.

A further source-level consequence follows: because the prior visual map is keyed by source SHA and `image()` receives no transform fingerprint, changes to thumbnail size/quality, orientation/color handling, classification, or Pillow version do not invalidate an existing sidecar when its path still exists. That consequence was source-inspected, not separately executed.

### Corrected cache contract

Use a derivative key and receipt:

```text
ThumbnailCacheKey = H(source_blob_sha || image_transform_fingerprint)

ThumbnailReceipt = {
  cache_key,
  content_sha256,
  format,
  width,
  height
}
```

Reuse only when source identity and transform fingerprint match, the sidecar exists, its actual content SHA-256 matches the receipt, and decode/format/dimension checks pass. Otherwise regenerate from the verified source blob and verify the derivative before publication.

For the broader PR #2562 `PublishedKey` / `ScanReceipt` split:

- Keep separate `documentInventoryDigest` and `visualInventoryDigest`.
- Include the complete image transform/runtime fingerprint.
- Validate carried-forward prior-snapshot state because `first_seen`, `changed_at`, and `revision_detected` depend on it.
- Either move volatile `errors` to the scan receipt or include a normalized diagnostics digest in public-content identity.
- Move raw repository heads, `checked_at`, and scan time to the receipt. The current public JSON serializes `repositories` (including `commit` and `checked_at`) and `updated`; those volatile values otherwise change public bytes even when eligible content is unchanged.
- Preserve a stable `content_updated_at` on a true no-op.

The existing `DiscoveryCacheSoundness.lean` module formalizes an abstract `PublishedKey` with `inventoryDigest` and `transformFingerprint`, plus an external `cacheIntegrityVerified : Prop`. It does not establish that the live generator satisfies that external proposition. No new Lean theorem or exact-head build was made for this refinement. The source-to-field mapping remains incomplete.

An additive source-QA comment was posted to existing [PR #2562](https://github.com/Satobloc/HsH/pull/2562); it is not a formal review or approval. No generator, workflow, PR branch, deployment, or reader route was changed.

## 3. Independent queued-refresh reproduction

Two successful discovery runs demonstrate the existing `checkout ref: main` plus `cancel-in-progress: false` behavior:

| Run | Event head | HsH tree actually scanned | SAT tree scanned | Summary | Generated commit |
|---|---|---|---|---|---|
| [#45721740425](https://github.com/Satobloc/HsH/actions/runs/45721740425) | `5ff040c6c2aeeba3a5973294a6a50f5b26fd667d` | `b3609f8322161510190498b7f93f545f5e215362` | `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e` | 17,925 documents; 48 docket; 417 square visuals; 6 errors | `5fc11a4c5a7261a95c36b27db5b2e590bd901f2a` |
| [#45721758213](https://github.com/Satobloc/HsH/actions/runs/45721758213) | `b3609f8322161510190498b7f93f545f5e215362` | `5fc11a4c5a7261a95c36b27db5b2e590bd901f2a` | `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e` | 17,925 documents; 48 docket; 417 square visuals; 6 errors | `fb87173d929e98754ddc82d34b4fd03dea68f39c` |

Commit ancestry and file lists were independently checked:

- `5fc11a4` is a direct child of `b3609f8` and changes only `PUBLIC_SITE/generated/discovery.json`.
- `fb87173` is a direct child of `5fc11a4` and changes only `PUBLIC_SITE/generated/discovery.json`.

The second queued run therefore scanned the previous generated-only commit and created another generated-only commit with identical workflow summary counts and the same SAT source revision. This is redundant queued refresh, not a self-trigger loop. It is additional live evidence for the idempotency design already under [issue #2554](https://github.com/Satobloc/HsH/issues/2554) and PR #2562.

Prewrite HsH main is `fb87173d929e98754ddc82d34b4fd03dea68f39c`. The latest successful discovery run scanned its direct parent `5fc11a4`; currentness is PASS by exact ancestry at that source cut. The discovery JSON body returned empty through the GitHub connector, so no new full record-level parse is claimed.

The last full parse remains the 2026-11-25T22:30:59Z snapshot: 17,919 documents, 10,987 workspace records, all 10,987 with generic browse-reader targets and missing `presentation_state`, zero explicitly pending, 48 docket entries, 577 visuals, 417 square flags, and six extraction errors. Those are historical full-parse counts, not asserted as current.

The `fb87173` combined commit status has a Vercel failure (`api-deployments-free-per-day`, more than 100 deployments/day). The discovery Actions run itself succeeded; this is a deployment/status failure, not a failed discovery scan.

**P0 disposition:** source currentness PASS at the latest generated cut; workspace presentation safety remains FAIL; live Paper A/B route acceptance remains NOT OBSERVED; release/standdown NOT AUTHORIZED. No manual dispatch, deployment, or route probe occurred. The new report artifact and subsequent continuity/handoff commit will make postwrite freshness pending until an automatic refresh is independently read back.

## 4. PWH and campaign upkeep

Tern's h1100:s3 deep review is [published at issue #2564](https://github.com/Satobloc/HsH/issues/2564). The internal PWH queue and task graph still carry the h1081:s3 state. Canonical receipts for subsequent slots were checked, and Calder's h1103:s2 receipt explicitly records the trigger at 7/5 after Tern's h1100 review. I did not independently recalculate the full scheduler completion census. Tern's next deep review/reconciliation is due. Tern retains PWH queue/graph authority; no queue or graph mutation was made.

- P1 cognition: OVERDUE / FROZEN / Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE rereview: next December 8.
- Unrelated-source break: next November 28.
- All four Mersearch request lanes remain occupied/requested; no query, overwrite, retry, or release.
- No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, or falsification threshold was produced.
- No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion.

## 5. Continuity and scheduler

Hale's latest durable worker checkpoint before this run was h1099:s0; this report/receipt supplies the next source-grounded checkpoint. No authenticated current Hale thread was found.

The existing :36 Worldtube task remains unchanged: ID `6a9f52b69ec08191b0a2ba24a074f781`, `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`. The live roster shows :00, :24, :36 and :48 enabled; :12 remains disabled. No task, ID, prompt, phase, cadence, or enabled-state change; no sixth task.

**Next deterministic label:** Elias Kern, h1103:s4. Personal-context and workspace checks found no authenticated current Elias thread. His protected Track A switchboard-prototype remit remains separate; no assignment or response obligation is created. A repository-only optional context packet is the fallback, not direct-thread delivery or acknowledgment.

**Final:** `H1103:S3 / HALE_SOURCE_GROUNDED_ASSISTANT_EXECUTION / THUMBNAIL_CACHE_INTEGRITY_COUNTEREXAMPLE_EXECUTED / PR2562_SOURCE_MAPPING_GAP / QUEUED_REFRESH_REDUNDANCY_REPRODUCED / P0_CURRENTNESS_PASS_BY_ANCESTRY / P0_PRESENTATION_SAFETY_FAIL / LIVE_ROUTES_NOT_OBSERVED / PWH_TERN_REVIEW_DUE / NO_PHYSICAL_REANALYSIS / NO_THEORY_PROMOTION / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK`.
