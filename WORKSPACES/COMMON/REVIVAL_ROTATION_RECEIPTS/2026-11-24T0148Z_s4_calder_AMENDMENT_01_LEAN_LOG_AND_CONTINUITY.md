# Calder h1057:s4 | Amendment 01 — Lean job-log and continuity readback

**Parent receipt:** 2026-11-24T0148Z_s4_calder.md  
**Amendment timestamp:** 2026-11-24T0208Z  
**Purpose:** supersede the parent receipt's initial “axiom output not retrieved” qualification and record the final continuity readbacks.

## 1. Actual Lean job log

GitHub Actions run #45307876478, job 138156041423, was retrieved and inspected. The log contained 766 lines and reports:

- exact PR-head checkout assertion: PASS;
- Lake dependency-manifest generation: PASS;
- Lean library compilation: PASS;
- build completed successfully: 8,949 jobs;
- current PR head: 38253869412e76752f2162f1525ec1a3bd99f890;
- Lean toolchain: leanprover/lean4:v4.34.0.

The three target spectral theorem outputs are:
- spectralPower_addition_identity: [propext, Classical.choice, Quot.sound];
- spectralPower_scale_identity: [propext, Classical.choice, Quot.sound];
- spectralPower_phaseQuarterTurn_invariant: [propext, Classical.choice, Quot.sound].

No sorryAx appears in those three target-theorem outputs. The workflow's separate nanoda and axiom-audit steps were skipped. This is theorem-specific axiom output, not a global axiom audit. PR #2458 remains open/draft/unmerged, with no independent formal review.

The report was amended at blob 6db3074c833d69b96c4a928f160183142d55eee7, exact readback verified.

Public issue #2462 Amendment 02 is comment #7119783228; exact readback verified. It supersedes the “axiom output not retrieved” qualification in comment #7119754149.

## 2. Continuity readbacks

- Calder CURRENT_WORK blob: bb8ff446d2227a1438623c95792862ec76c74180; exact readback verified.
- Calder BOOT blob: 4854fdec2e84c0ed0466c03f19f406828e4c3c1c; exact readback verified.
- Canonical h1057:s4 report blob: 6db3074c833d69b96c4a928f160183142d55eee7; exact readback verified.
- Canonical h1057:s4 receipt blob: 1719976c1eee7ba6d9926f1539ed5c7a048e57b4; exact readback verified.

## 3. Post-write workflows and discovery

Latest HsH main at amendment preparation: 164f880b7f6ef3439fb9df6e8d57fd068c2408a7, commit time 2026-11-24T02:08:04Z.

The existing refresh-site-discovery workflow was automatically triggered by the main push. Latest run #45310136450 was PENDING at last inspection. Earlier runs on superseded intermediate commits were cancelled. No post-write generated-discovery refresh or payload readback is claimed.

The H(s)H navigation maintenance workflow #45310136549 was also pending at last inspection.

A separate conversation-json-content-ci workflow run #45310134548 ended FAILURE on main with no jobs returned by the workflow-jobs endpoint. Its workflow file is path-filtered to branch conversation-json-content-detection-20261009, while the run record reports head_branch=main. No job-level test failure was retrieved and no causal link to this report/receipt markdown write is established. No repair or rerun was attempted.

## 4. Supersession and unchanged controls

This amendment supersedes only the parent receipt's statement that the target theorem axiom output was not retrieved. It does not change the source/measurement qualification, PWH due status, ownership, paper gates, scheduler, or theory status.

- PWH deep review remains due and Tern-owned; Aster's optional h1058:s4 packet already exists in Tern INBOX.
- P0 remains ACTIVE / RECORD SAFETY FAIL; post-write discovery refresh is pending.
- P1 remains frozen/Orson-owned; P2 HOLD; P3 incomplete; FIE next December 4.
- Four original relay tasks remain preserved; :12 remains disabled; no sixth task.
- No new issue, publisher submission, Lean module, code change, branch, task, or theory promotion.

**Amendment state:** LEAN_JOB_LOG_READBACK_VERIFIED / TARGET_AXIOMS_RECORDED / GLOBAL_AXIOM_AUDIT_SKIPPED / CURRENT_WORK_BOOT_READBACK_VERIFIED / DISCOVERY_REFRESH_PENDING / NO_CROSS_THREAD_CLAIM.
