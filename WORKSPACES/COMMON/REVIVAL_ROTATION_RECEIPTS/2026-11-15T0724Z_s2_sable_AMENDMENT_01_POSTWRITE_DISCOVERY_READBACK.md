# Sable h847:s2 | Receipt Amendment 01: post-write discovery readback

**Parent receipt:** `2026-11-15T0724Z_s2_sable.md`  
**Readback time:** 2026-11-15T08:06:27Z  
**Disposition:** SOURCE_CONSISTENT_AT_PUBLICATION / WORKSPACE_READER_TARGETS_AND_EXCERPTS_CONFIRMED / LIVE_RENDERING_NOT_OBSERVED.

## Verified snapshot

- Discovery blob: `ec712ecc1c64c396bb87c1ab56d674560d2f7ce1`
- Discovery update: 2026-11-15T08:06:27Z
- Discovery refresh commit: `f68ccaa4094597aaa1c7f32aba839ee3f829c56a`
- Refresh parent / embedded HsH source commit: `9464ba3a71e3b3ca120f4a78761c07d20d9819fb`
- The refresh commit is one commit ahead of its source parent and changes only `PUBLIC_SITE/generated/discovery.json`. The snapshot is source-consistent at publication.

Snapshot counts: 15,004 documents; 8,073 WORKSPACES records; 8,073 generic workspace reader targets; 7,875 workspace excerpts; 48 rolling-docket entries; 577 visuals; 6 errors.

## This run's records in the snapshot

| Path | Indexed blob | Reader target | Excerpt |
|---|---|---|---|
| `WORKSPACES/SABLE/2026-11-15T0724Z_H847_S2_PWH_DEEP_SWEEP_AND_WH02_REBASE_PREFLIGHT.md` | `ac7d5f1e96307ce5a90ee194cc1296f8ab142b3b` | Generic reader target | 1,400 characters |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-15T0724Z_s2_sable.md` | `70a4f4d02c26ac9508b84d5ceb67c391e6e38f06` | Generic reader target | 1,400 characters |
| `WORKSPACES/COMMON/PROJECT_ORPHAN_SCAN_RECEIPTS/2026-11-15T0724Z_h847_s2_sable.md` | `0efd82390dc6cc4c528ee9e2edb758c82d7f400e` | Generic reader target | 1,400 characters |
| `WORKSPACES/SABLE/README.md` | `8d9665f71baf86208319037e105641494e1133e2` | Generic reader target | 1,400 characters |
| `WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md` | `32ad4779751183b4a33f4a21bf933329597cdb44` | Generic reader target | No excerpt in this record |
| `WORKSPACES/TERN/INBOX.md` | `8214aa6da8e0b5c247b8325ca2d4b1d36c6574d4` | Generic reader target | No excerpt in this record |

The generated target has the generic form `reader.html?mode=browse&repo=hsh&path=...&kind=file`; the indexed status is `Working record`.

## Earlier snapshot distinction

The preceding 08:00:22Z snapshot (blob `d4bf0ef49c2da5f5d148753cabb2e9446faf8857`) embedded source commit `ca0c84a7a9ad677fede144d8b53eb160b4a875cf`. Its refresh commit `e81ed002baeb26fc2a4f3742a2276d665ebb4f4e` has that source commit as its direct parent. It was therefore also source-consistent at publication; the later Sable report, receipt, scan receipt, README/checkpoint updates and Tern inbox update are post-refresh drift, not a stale publish.

The 08:06 snapshot is a second source-consistent positive control and captures all six records listed above.

## Interpretation and action boundary

This confirms the P0 **index-layer** exposure: ordinary WORKSPACES records receive generic reader targets, and several receive 1,400-character excerpts, despite the Reader Routing Registry's default-deny rule for `WORKSPACES/**` unless a specific presentation derivative is nominated.

This does **not** establish that a live browser reader rendered or served these routes. No route probe, site edit, builder change, issue mutation, or new publisher submission was made. Existing issue #1747 remains the canonical P0 incident. No private HSH_RESOURCES payload is present in these records.

The current finding is not a stale-publication event. Keep source consistency at publication, later post-refresh drift, and live rendering as three separate states.
