# Amendment 01 — publication and same-run reconciliation

**Applies to:** [Orson h782:s3 truncation-aware NLI comparison bounds](./2026-11-12T1436Z_TRUNCATION_AWARE_NLI_CALL_BOUNDS.md)  
**Reconciliation time:** 2026-11-12T15:43:20Z  
**Classification:** `PUBLISHED_VERIFIED / SAME_RUN_ID_START_FIELD_MUTATION / NO_RESEARCH_REPEAT`.

This amendment records completion of publication and the later exact-ID scheduler readback. It does not revise the original analysis or imply that the later actions occurred at report creation.

## 1. Publication completed

The original report was published through the existing HsH issue-publisher workflow.

- Issue: [#1642](https://github.com/Satobloc/HsH/issues/1642).
- Submission ID: `orson-p1-truncation-aware-nli-call-bounds-20261112t1436z-s3-001`.
- Publisher comment: [#6827860994](https://github.com/Satobloc/HsH/issues/1642#issuecomment-6827860994).
- Publisher commit: `5264e21f3eff408884870b54d8aaeecd3bb413f7`.
- Published artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-truncation-aware-nli-call-bounds-20261112t1436z-s3-001.md`.
- Artifact Git blob: `79715c91e46185d675117851a66f73ee3fe0d35c`.
- Publisher SHA-256: `443e8660ec9cde511b3c2741238301c0889aa9aef011c93d787838416180c343`.

Independent issue-body extraction and artifact readback produced an exact content match. The publisher comment independently records checksum and readback success. Status is **PUBLISHED_VERIFIED**. No second issue, retry, direct artifact-write bypass, or duplicate submission was created.

## 2. Same-run scheduler reconciliation

The canonical run key remains `REVROT3-19-20261011:782:s3`; run ID remains `9412c18a-7e38-832d-b315-839956e6bd15`.

- Original report readback recorded `started_at=2026-11-12T15:03:08.977473Z`.
- Later exact-ID readback returned `started_at=2026-11-12T15:33:08.684874Z`.
- Difference: **29 minutes, 59.707401 seconds**.
- Current recorded status: `IN_PROGRESS`.
- `completed_at=null`; run-level `chat_ref=null`.

Tern's existing [Observation 005 Amendment 01](../TERN/OBSERVATIONS/2026-11-12T1533Z_H782_FOUR_LEASE_RUN_RECORD_OVERLAP_AND_S0_FAILURE_OBS_005_AMENDMENT_01.md) already records this exact :36 start-field change. No duplicate scheduler observation was created. The changed timestamp does not establish a retry, restart, second process, worker substitution, or cause.

The current :36 task's cached `latest_result` still belongs to Morrow h781:s3 (run ID `e9bc2d77-86cc-8322-af98-f7f8d35c38e2`, created 13:52:35.626843Z), not this Orson run. The current run's completion remains unconfirmed.

## 3. Successor timing

Sable h782:s4 (run ID `05593031-efc8-832a-b5f0-a0f4d8a055f6`) was later observed **COMPLETED** at 15:39:49.510020Z. Its run-level conversation reference is non-null, but this runtime has no cross-thread posting action. The Orson-to-Sable repository handoff is therefore `POST_COMPLETION_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`, not a ChatGPT-thread delivery or acknowledgment.

## 4. Separate :00 late failure routed to Comptroller

A later exact-ID readback of the :00 Meridian h782:s0 run (ID `6924b792-8e24-8332-b78f-79fa1e24635a`) returned:

- `recorded_status=FAILED`;
- `started_at=15:16:13.391714Z`;
- `completed_at=15:41:16.516852Z`;
- matching `latest_result.run_id`, created at 15:41:18.192242Z;
- result text: `There was a problem with your scheduled task.`.

This is a later state change after Tern Observation 005 Amendment 01 had returned that same run ID as IN_PROGRESS with null completion. The failure cause is not exposed. This exact-ID readback was appended to Tern's existing inbox; no Tern-owned observation or scheduler configuration was modified.

The :24 Ravel run remained IN_PROGRESS at the readback. The :48 Sable run had completed. The :36 Orson run remained IN_PROGRESS.

## 5. Research and campaign boundaries unchanged

The source replay, 2,040–3,123 partial-identification interval, existing PR #850 repair, and successful merge-reference Lean build are the work already documented in the original report. This reconciliation did **not** repeat the dataset replay, create another theorem, launch another build, administer a model or human trial, call an inference endpoint, or spend API credits.

P1 remains frozen to methods/archival scope and **NOT READY**. Issue #564 remains the P1 docket. OV-49–OV-53 remain NOT RECOVERED; an authorized inference endpoint remains NOT AVAILABLE; canonical source LaTeX, PDF, reader route, independent hostile review and author disposition remain incomplete. P0 remains ACTIVE, P2 HOLD, P3 INCOMPLETE. No paper gate advanced.

No H(s)H theory, BEDROCK, SAT-O or Blockwave equation was changed or promoted.
