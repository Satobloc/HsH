# Tern Rook | Mersearch lane-dispatch identity correction

**Run key:** `REVROT3-19-20261011:511:s3`  
**Selection:** Tern Rook (ring index 12)  
**Next:** Morrow (ring index 13)  
**Disposition:** `ASTER_LANE3_DISPATCH_CONFIRMED / MANIFEST_PENDING / LEAN_CI_PENDING`

## Rotation

For nominal UTC hour (h=511):

`seq = 5×511 + 3 = 2558`, and `2558 mod 19 = 12`.

The fixed ring selects Tern Rook, with Morrow next. This is deterministic label selection, not authentication of a historical Tern instance.

The Enheduanna `h511:s2 → h511:s3` context packet was read and consumed. Its paired receipt was independently read back. The :24 scheduler record later showed completion at 07:29:22.616969Z; the receipt's earlier `in_progress` wording is an earlier observation.

## Material correction: Aster's lane-3 request was dispatched

The earlier Aster receipt amendment 02 incorrectly classified Actions run `41278156840` as Calder's shared-request run. It inspected only the generic lane-1 workflow and missed the dedicated lane-3 workflow.

The actual run record identifies:
- Workflow: **Mersearch Request Bridge Lane 3**
- Workflow path: `.github/workflows/mersearch-request-bridge-lane-3.yml`
- Event: `push`
- Run: `41278156840`
- Job: `124764453899`
- Run head: `60555504423e744b90f8864c3bccef23eb9f9105`
- Request ID: `aster-june-2025-disclosure-source-lineage-20261101-0536`

At that run head, the lane-3 request contained the matching request ID and marker `requested`. The lane-3 workflow's path filter and validation step read that lane-3 request file. The run is therefore bound to Aster's lane-3 request, not Calder's lane-1 request.

At the latest bounded inspection, 2026-11-01T07:43:39Z, the job and step **Run Mersearch** were `in_progress`; manifest, compact-receipt and publication steps had not started. No search completion or request-scoped receipt is claimed.

**Correct state: `DISPATCHED / RUNNING / MANIFEST_NOT_YET_AVAILABLE`.**

## Four-lane dispatch topology

The repository contains four distinct dispatch paths:

| Lane | Workflow | Request input |
|---|---|---|
| 1 | `mersearch-request-bridge.yml` | `MERSEARCH_REQUEST.json` |
| 2 | `mersearch-request-bridge-lane-2.yml` | `MERSEARCH_REQUEST_LANE_2.json` |
| 3 | `mersearch-request-bridge-lane-3.yml` | `MERSEARCH_REQUEST_LANE_3.json` |
| 4 | `mersearch-request-bridge-lane-4.yml` | `MERSEARCH_REQUEST_LANE_4.json` |

Each lane-specific workflow has its own path filter and concurrency group. The generic workflow is lane 1, not the sole dispatcher for all four lanes.

The current lane-3 request file has a static marker `staged_not_dispatched`, but the actual run evidence contradicts that marker. The run used an earlier request snapshot at its recorded head. The marker is not an execution-state machine. Use the workflow run, matching request ID, and eventual request-scoped manifest/receipt as execution evidence.

Run status for lanes 1, 2 and 4 was not established in this bounded audit. No claim that those searches are running or complete is made.

## Privacy residual

The in-flight run was triggered from a pre-sanitization request revision. The current request file is sanitized, but the running workflow may carry its earlier query into the public run manifest. No raw source identifiers are reproduced here. The earlier request commit is already in public Git history. No cancellation operation was available; cancellation or suppression is not claimed. Do not duplicate the search or rewrite repository history. Inspect the exact manifest before declaring publication complete.

## Scheduler readback

All five original task IDs and stored hourly America/New_York phases were checked individually:

| Phase | Existing task ID | Enabled |
|---|---|---:|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | yes |
| :12 | `6aa61b3b2e4081918927a35b61007acc` | **no** |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | yes |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | yes |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | yes |

The :12 disabled state and unknown reason were already recorded in the Common active-automation roster at 03:52Z; this run independently confirmed it. The :12 task was not re-enabled. The :36 task remains enabled with its exact original ID, schedule, phase and prompt unchanged. No sixth task or scheduler mutation occurred.

## Lean formalization

The existing Tern draft PR #824 was inspected before extending it. A new module was added to its existing branch:

`FORMAL_VERIFICATION/HsHVerification/TernH511Lane3DispatchEvidence.lean`

The module encodes the ring calculation, separates request markers from execution status, and formalizes the finite request-ID/path binding for the Aster lane-3 run. The root aggregator imports it.

Branch head: `795ce38551138513b71baa7c43c0e55f585d970e`.

GitHub Actions run **#41286076089** was created for PR #824 at 07:45:52Z but remained `pending` at the last check. **No Lean compilation success is claimed.** The PR remains open, draft and unmerged, based on `infra/lean4-verification-20261023`. Lean can verify only the encoded finite propositions, not authenticate GitHub metadata, establish historical worker identity, guarantee search completion, or validate physical theory.

## Boundaries and next cursor

- BEDROCK and theory status unchanged; no SAT-O or Blockwave equations modified.
- No physical calculation, fit, prediction or measurement.
- No new tool, dependency, automation, task, ID, schedule, phase or cadence.
- Code Grurple remains active; P1 November 9, P2 November 30 and P3 December 14 remain separate.
- Unrelated reading: *Practical Talks by an Astronomer*, source blob `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`, lines 653–692. Next cursor: 693.
- FIE review is not due; last full review October 27.

**Next operations:** verify run #41278156840 and require its manifest request ID to match Aster's request; inspect the manifest for the pre-sanitization query residual; verify Lean run #41286076089 and its actual job log; preserve the :12 disabled state unless Nathan explicitly authorizes a change.
