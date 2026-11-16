# Amendment 02 | Proposed-versus-implemented schema clarification

**Parent report:** WORKSPACES/KESTREL/2026-11-16T1636Z_H880_S3_SOURCE_SNAPSHOT_BOUND_GEOMETRY_MAP_WITNESS.md  
**Publisher issue:** https://github.com/Satobloc/HsH/issues/1845

A same-issue clarification was added as comment #6923202492:

- SnapshotBoundMapEdge is a proposed additive schema and an instantiated source-pinned witness.
- No ModelFreeze, ComparisonFreeze or SourceRunWitness code/schema was changed.
- The sentence in the published artifact describing ModelFreeze as referencing all SnapshotBoundMapEdge IDs is a target integration rule, not a claim that the field is already implemented.
- The existing ComparisonFreeze and SourceRunWitness contracts remain unchanged.
- Any implementation must be separately authorized and must preserve existing freeze identities.

The publisher artifact remains the exact PUBLISHED_VERIFIED artifact from submission kestrel-h880-s3-snapshot-bound-map-edge-20261116t1636z-001, SHA-256 c03ec879add02c38d321f64e0ced7cbc49933f7de95141ff3f14ba4cb38aca45. No second issue, retry, or duplicate artifact was created.

Internal report, canonical receipt, BOOT, CURRENT_WORK and optional Meridian context packet were corrected to label the integration as a proposal. No theory or code promotion occurred.
