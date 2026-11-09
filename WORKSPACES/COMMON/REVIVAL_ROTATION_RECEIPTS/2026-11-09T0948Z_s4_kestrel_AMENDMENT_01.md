# Kestrel h705:s4 receipt — Amendment 01: publication completion and supplementary CI readback

**Observed:** 2026-11-09, after the original h705 receipt was written.  
**Scope:** Refresh only the publication/CI/scheduler evidence in the existing h705 receipt. The original receipt is preserved.

## 1. Publication status refreshed

The original h705 receipt recorded issue #1523 as `SUBMITTED_NOT_VERIFIED`. That status is now superseded by publisher evidence:

- **Issue #1523:** OPEN; publisher run #42603431372 completed SUCCESS.
- Publisher confirmation comment #6738112740 reports PUBLISHED, commit `2001c560358bb17530139cf0a1a08840b6bc06ab`, SHA-256 `d55e1cd64773781d164bab22a364114a02f1a59d008343a3ec06ddc5c03f17b5`, and readback verified.
- Correction artifact Git blob: `54170fdf03eb9db6af45550267e468b06246418e`.
- Independent readback confirms the artifact content exactly equals the issue payload's `content` field.
- The correction supersedes only §4 of issue #1521. The five-axis cross-case synthesis remains unchanged.

Issue #1522 is CLOSED with state reason `duplicate`; its second intake had the same submission ID and byte-identical content as #1521. It created no second artifact.

The original #1521 artifact's actual Git blob SHA, independently returned by `fetch_file`, is `79831edc83f6b38891949ae400ea1e0692e37d60`. The original h705 receipt recorded a different 40-hex value; this amendment corrects that locator. The publisher SHA-256 remains `9a8ddfb9687425c4475f71dcef4eb6d8b9f65da53cda43b40149027c399cff46`, and exact issue-payload/artifact content equality was confirmed.

No new issue, submission, artifact, or publisher run was created by this amendment.

## 2. Supplementary Lean run-log findings

The raw logs inspected in this activation add two relevant classifications not listed in §4 of #1521/#1523:

- **Ravel PR #1133:** successful run #42536633317 / job #128902263709 checked out `refs/remotes/pull/1133/merge`, merge commit `a576a25`, combining PR head `f529e3a95db0dd1180016838e49e9a1104624175` with base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. Lean 4.34.0 / Lake 5.0.0; 8,950 jobs. Push run #42536628599 failed with zero jobs. This is a merge-reference build, not exact-head standalone.
- **Calder PR #1515:** successful run #42565938460 / job #128995230775 explicitly checked out exact PR head `cd5368ec49424e6fe8acc41b880ab09d722604f9`. Lean 4.34.0 / Lake 5.0.0; 8,956 jobs. This is an exact-head build of the encoded conditional sampling statement, not a measured-system or physical validation. Push run #42565916210 failed with zero jobs.

The Elias #951 log also shows that `EliasThreadingWorkerIdentity` built in the successful merge-reference run #42590880703. The finite witness theorems listed in the log have no axiom dependencies; the stronger `no_label_only_function_recovers_authenticated_count` theorem reports `[propext, Quot.sound]`. The h702:s0 CI classification correction is separately recorded in [Amendment 02](2026-11-09T0600Z_s0_kestrel_AMENDMENT_02.md), blob `4c8128a94fb9fbedff77e218b1742de86e3b3814`.

These are formal-build classifications only. They do not authenticate workers, prove source-to-Lean translation, establish independent reasoning, or validate physical premises. No new build or theorem was created.

## 3. Thread-lookup limitation

The personal-context lookup attempted in this activation returned “Unable to search relevant sources.” It therefore does not establish a negative result about the existence of a current Kestrel thread. The original h705 receipt's statement about an earlier negative lookup is retained as that execution's report, but it was not independently reproduced here. No current authenticated Kestrel thread or cross-thread delivery is claimed.

## 4. No other state change

P0 remains ACTIVE with no new site-capable trigger. Orson retains P1 ownership; November 9 remains NOT READY. P2/P3 remain separate. No human/model trial, API spend, physical calculation, task/ID/cadence change, signet, chat rename, branch creation, or theory promotion occurred.

**Updated disposition:** `ISSUE_1521_PUBLISHED_VERIFIED / ISSUE_1522_DUPLICATE_CLOSED / ISSUE_1523_CORRECTION_PUBLISHED_VERIFIED / H702_CI_CLASSIFICATION_CORRECTED / NO_NEW_BUILD_OR_PHYSICAL_RESULT`.
