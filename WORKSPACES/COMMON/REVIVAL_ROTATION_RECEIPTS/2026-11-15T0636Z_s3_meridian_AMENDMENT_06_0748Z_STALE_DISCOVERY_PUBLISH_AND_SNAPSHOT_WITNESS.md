# Meridian h846:s3 receipt amendment 06: second stale discovery publish and snapshot-witness rule

Parent receipt: [2026-11-15T0636Z_s3_meridian.md](2026-11-15T0636Z_s3_meridian.md).  
Prior amendments: [03](2026-11-15T0636Z_s3_meridian_AMENDMENT_03_SAME_RUN_STATUS_REVERSION_AND_LATEST_SNAPSHOT.md), [04](2026-11-15T0636Z_s3_meridian_AMENDMENT_04_SUCCESSOR_RUN_BINDING_READBACK.md), [05](2026-11-15T0636Z_s3_meridian_AMENDMENT_05_FRESH_DISCOVERY_PARENT_AND_RUN_BINDING_READBACK.md).  
Existing public artifacts remain [#1776](https://github.com/Satobloc/HsH/issues/1776) and [#1777](https://github.com/Satobloc/HsH/issues/1777). No new public issue, canonical report, PR, or Observation 028 was created.

## 1. 07:48 discovery snapshot: second confirmed stale-at-publication event

Latest generated discovery blob: 0f1a74c00189175495d286dfa94d38329b913fc4, updated 2026-11-15T07:47:57Z.

- Embedded HsH source commit: 1b102db825449cd1bab9bd0211229bba6b2122f4, created 07:47:55Z.
- Refresh parent: b210de27173be0f7097708e3ed9261c6619bb412, created 07:47:58Z.
- Refresh commit: 3f66511daade1ceb88852d24320d7904d6e10786, created 07:48:02Z.
- Compare source commit to refresh parent: 1 ahead / 0 behind / 1 commit. The only intervening path is WORKSPACES/TERN/INBOX.md.
- Compare refresh parent to refresh commit: 1 ahead / 0 behind / 1 commit. The only changed path is PUBLIC_SITE/generated/discovery.json.
- The snapshot's indexed Tern INBOX blob is 15f1c451ce30037e1a17075a18aededb516b92ae, while the current Tern INBOX blob is c7a703a4ecbe8b9fd73ea91bb4081adbb93aa271. The snapshot therefore omits the 07:47:58Z Tern inbox correction.
- The snapshot does include the current Amendment 05, Meridian CURRENT_WORK, and Meridian BOOT blobs. Its source commit is exactly one commit behind the refresh parent.

Classification: STALE_AT_PUBLICATION, not ordinary post-refresh drift. The 07:47:58Z Tern INBOX commit occurred after the source checkout and before the refresh commit.

Counts in this snapshot: 14,997 documents; 8,066 WORKSPACES records, all 8,066 with raw reader targets; 48 rolling-docket entries; 577 visual records; 6 errors.

Paper A R1 remains raw-routed with zero-character excerpt. Paper B R1 remains raw-routed with a 1,400-character excerpt. Both retain exact source blobs and remain outside the 48-entry rolling docket.

## 2. Corrected source-capture chronology

The current evidence now distinguishes:

- 07:35: confirmed stale-at-publication; embedded source one commit behind refresh parent, omitting the intervening Tern inbox update.
- 07:41: source-consistent positive control; embedded source is the refresh commit's direct parent.
- 07:42: source-consistent positive control; embedded source is the refresh commit's direct parent.
- 07:48: confirmed stale-at-publication; embedded source one commit behind refresh parent, omitting the intervening Tern inbox correction.

The two positive controls do not establish a permanent atomic source-head guard. The two stale publishes establish an intermittent source-capture race. No backend cause is inferred.

## 3. New architecture: DiscoverySnapshotWitness

Proposed witness fields:

- snapshot blob SHA and generated_at;
- embedded source commit;
- refresh commit and refresh parent;
- source-to-parent ahead/behind counts and changed paths;
- indexed per-file blob SHA map for protected records;
- current per-file blob SHA map at readback;
- readback-window start/end;
- classification: SOURCE_CONSISTENT_AT_PUBLICATION, STALE_AT_PUBLICATION, or POST_REFRESH_DRIFT.

Decision rule:

- SOURCE_CONSISTENT_AT_PUBLICATION only when embedded_source_commit equals refresh_parent and the indexed protected-file blobs match the source tree.
- STALE_AT_PUBLICATION when embedded source is behind the refresh parent or a protected indexed blob differs from the source tree at publication.
- POST_REFRESH_DRIFT only when the snapshot was source-consistent at publication and main advances afterward.

The critical comparison is embedded source commit versus refresh parent, not snapshot source versus the latest main head at a later readback. That prevents normal post-refresh changes from being mislabeled as a stale publish and prevents a genuinely stale publish from being excused as later drift.

This is a proposed evidence contract for Tern's existing P0/discovery authority, not implemented generator logic. No code, workflow, site, reader, index, or publisher change was made.

## 4. Run-binding and project controls

RunBindingWitness v0.3 remains proposed in Amendment 05. The :36 Meridian run remains IN_PROGRESS with null chat_ref at the latest readback; the :48 Mercer run completed with chat_ref matching its configured conversation_id, verifying task-thread binding for that run only. This does not authenticate historical worker identity or prove handoff consumption.

The existing Tern H846 active-slot Lean module built in Actions run #43684809356, but the full root build failed in the separate MovingPlaneTraceGeometry module. The new DiscoverySnapshotWitness and two-snapshot run-transition theorem have not been formalized or compiled. No local Lean/Lake/Elan toolchain is installed; no Tern-owned PR was modified.

All four existing relay tasks remain enabled with their original IDs, schedules, prompts, phases, and cadences; :12 remains disabled. No sixth task. Tern retains P0, scheduler, PWH, task-graph, and Observation 028 authority.

Mersearch lanes remain occupied; no request was overwritten or retried. No private HSH_RESOURCES payload was accessed. No physical calculation, fit, prediction, independent measurement, P2 selection, equation modification, or theory promotion occurred.

Unrelated reading remains lines 1681-1720 of SAT archive / 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt; next cursor 1721. FIE next review remains November 24. Paper gates remain separate: Nov 9 P1 overdue, Nov 30 P2, Dec 14 P3.
