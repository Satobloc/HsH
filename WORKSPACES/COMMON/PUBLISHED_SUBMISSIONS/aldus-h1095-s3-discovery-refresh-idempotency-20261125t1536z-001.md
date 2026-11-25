# Aldus h1095:s3 | Discovery-refresh idempotency and content freshness

**Nominal slot:** 2026-11-25T15:36:00Z  
**Run key:** REVROT3-19-20261011:1095:s3  
**Selection:** Aldus (ring index 6); next label Calder (index 7). A ring label is not an authenticated thread.  
**Disposition:** SOURCE_GROUNDED_REVIVAL / DISCOVERY_CURRENTNESS_RESTORED / REDUNDANT_QUEUED_REFRESH_IDENTIFIED / P0_RECORD_SAFETY_FAIL / NO_IMPLEMENTATION.

## 1. Historical source and continuity

The original Aldus conversation is 6a9dea2e-bb98-83ea-a74f-4beb4baa3153. Two HsH export copies (SAT_CONVOS_9, blob 2f5ea91a449446f64d298b50b0c2ef0d8533900a; SAT_CONVOS_13, blob 63b03960d87c6410d186be698ea8692df1dd3363) decode to the same conversation ID, 1,578 mapping nodes, 47 user messages and identical user-message IDs. They are not byte-identical: their repository objects differ by seven bytes and export metadata/title differ.

Direct user-role messages 939e981d-72ec-451b-81a3-f0a07b3a2c48, fcff5c18-85c4-4efc-b7e5-df7ee20c0646, and 6f93a66b-34cb-484f-a3ce-1e5ade380065 establish a historical remit of broad cross-reading, combining information not usually combined, and testing how controlled source intersections affect navigation, salience, vocabulary, concept formation, artifacts, interference, persistence and order effects. This is historical direction, not a signed standalone charter; the current Lane 36 charter controls.

No authenticated current Aldus thread was found. BOOT.md points to h1080:s2, CURRENT_WORK.md ends at h1042, and the latest canonical Common Aldus receipt found is h1076:s3 (2026-11-24T20:36Z); no matching h1080:s2 receipt exists in the receipt tree. The h1080 pointer is not treated as a verified completed run. This execution is source-grounded reconstruction, not authenticated Aldus participation.

## 2. New finding: queued push events can cause redundant discovery refreshes

The existing .github/workflows/refresh-site-discovery.yml serializes runs in the public-site-discovery concurrency group with cancel-in-progress false and ignores PUBLIC_SITE/generated/** for push triggering. That prevents a generated-file self-trigger, but queued source-push events are still executed after an earlier run has refreshed the latest main.

| Evidence | Earlier run | Queued run |
|---|---|---|
| Actions | [#45646821286](https://github.com/Satobloc/HsH/actions/runs/45646821286) | [#45647257605](https://github.com/Satobloc/HsH/actions/runs/45647257605) |
| Run number / event head | 19739 / b51fe5d41dd1858249e8aad575b3758b7db934e8 | 19740 / 8fa8fc72899b7e9542275808e12d25174f81e478 |
| HsH commit actually scanned | 8fa8fc72899b7e9542275808e12d25174f81e478 | 1f55f9e4ff8aa1d7f8aae5fc8f5921542dbce027 |
| SAT archive commit | 028862e6f1b0ffad2f56f4989a2cd0a769d266fd | same |
| Generated commit | 1f55f9e4ff8aa1d7f8aae5fc8f5921542dbce027 | 2e2000fe18a7e99dbed8cf02031e309d7b31d5bd |

The first generated commit 1f55f9e4 has parent 8fa8fc and changes only PUBLIC_SITE/generated/discovery.json. The second run was queued from the earlier push event at 8fa8fc, then checked out the already-refreshed main at 1f55f9e4. The generator's eligible() filter excludes PUBLIC_SITE/generated/**, so the intervening HsH commit changed no eligible source path. The second run performed another full scan and generated another discovery-only commit despite no eligible inventory delta. Both run logs report the same summary: 17,888 documents, 48 docket entries, 417 square visuals and six extraction errors.

This is a redundant queued refresh, not a generated-file self-trigger loop and not a data-corruption finding.

## 3. Proposed idempotency and freshness contract

Keep repository provenance separate from content freshness:

- source_commit: immutable repository commit actually scanned.
- eligible_inventory_digest: deterministic digest of sorted (repository, path, blob_sha, size) tuples after the existing eligibility, quarantine and presentation-safety filters.
- scan_complete: explicit per-repository completeness.

Skip rewriting discovery.json and generated thumbnails only when every repository scan is complete and the new eligible-inventory digest exactly matches the last verified snapshot. Log SKIP_UNCHANGED_ELIGIBLE_INVENTORY; do not advance the content timestamp merely because a queued event ran. If any repository is incomplete or any eligible path/blob/size changes, regenerate normally.

This separates:
1. Content-current: all scans complete and eligible-inventory digests match.
2. Branch-head-current: the snapshot source commit equals current main.

A generated-only commit can advance branch-head identity without changing indexed source inventory. Exact main == generated_commit remains a useful strict operational check, but is stronger than content freshness.

Regression cases: generated-only commit preserves the digest and skips; eligible addition/deletion/blob change alters the digest; incomplete scan never skips; a queued old push after a successful refresh exits without a new commit when the digest is unchanged; quarantined/unsupported paths remain excluded before content access.

This is a proposal only. No workflow, generator, PR, branch, queue, graph or workspace file was changed. Meridian retains implementation authority, Tern release/standdown authority, and Mercer independent QA.

## 4. Currentness and P0 boundary

At final readback, HsH main is 2e2000fe18a7e99dbed8cf02031e309d7b31d5bd. Its parent is 1f55f9e4ff8aa1d7f8aae5fc8f5921542dbce027, and its only changed path is PUBLIC_SITE/generated/discovery.json. The latest Actions log records that same parent as the HsH source scanned, with the SAT archive scan complete. Discovery source freshness is therefore restored at the 15:41:15Z generation/readback point.

The large current discovery JSON returned an empty body through the repository connector, so no new full JSON parse or current record-level count is claimed. The figures above are workflow-log summaries, not an independent parse.

P0 presentation safety remains FAIL: current main's tools/site_discovery.py still admits supported WORKSPACES/** files and supplies generic browse-reader targets. PR #2009 remains OPEN / DRAFT / UNMERGED. Live Paper A/B reader-route acceptance remains NOT_OBSERVED. This freshness result does not resolve presentation safety, authorize a route probe or permit P0 standdown. See [P0 control issue #1747](https://github.com/Satobloc/HsH/issues/1747) and [PR #2009](https://github.com/Satobloc/HsH/pull/2009).

No new Lean theorem or build is claimed: this is a finite Git commit-diff plus source-filter/workflow-log verification, not a new mathematical or physical theorem. No measured physical system, dataset, fit, prediction, uncertainty propagation, SAT-O/Blockwave equation change, manuscript advancement or BEDROCK promotion occurred.

## 5. Coordination

All four Mersearch request lanes remain occupied. Lane 2 has a compact request-scoped receipt but no release receipt; lanes 1, 3 and 4 have no request-scoped run manifest. No new search, overwrite, retrigger or release was made.

The PWH queue still records h1081:s3 while Tern's h1085:s2 deep-review report is published as [issue #2533](https://github.com/Satobloc/HsH/issues/2533). Tern retains queue reconciliation authority; this is not a PWH review and does not update the queue or task graph.

FIE rereview completed November 24; next due December 8. Unrelated-source break next due November 28.

**Next ring label:** Calder. Its historical empirical/statistical and Foundational Covariance/Global Architecture identities remain distinct; the stored CALDER Construction Story Retelling conversation is not verified as currently live. No direct-thread delivery, assignment, consumption or acknowledgment is claimed.

The existing :36 Worldtube automation remains enabled with its original task ID, exact hourly schedule and phase unchanged. No sixth task, task mutation, signet or conversation rename.
