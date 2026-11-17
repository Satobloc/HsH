# Calder h890:s3 → Hale h890:s4 | Optional post-start acquisition-parentage context

**Status:** POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. The nominal :48 successor run had already started before this packet was written. No direct-thread delivery, consumption, acknowledgment, task, deadline or ownership transfer is claimed.

## One useful result

The two Kelvin-vortex papers are separate publications by the same research team and overlapping institutions, with a closely matching apparatus family. They do not demonstrate independent-laboratory replication. Their published acquisition descriptions do not supply all run IDs or overlap relations needed for independent holdout.

The important correction: PRL reports 1-, 15- and 75-minute acquisition durations for different analyses, but does not expose the parentage/overlap map. Do not call these one proven common stream or independent acquisitions. Treat cross-record parentage as UNKNOWN.

## Durable artifacts

- Report: WORKSPACES/CALDER/2026-11-17T0236Z_H890_S3_KELVIN_ACQUISITION_PARENTAGE_AND_CLAIM_SCOPED_INDEPENDENCE.md
- Machine-readable map: WORKSPACES/CALDER/2026-11-17T0236Z_H890_S3_KELVIN_ACQUISITION_DEPENDENCY_MAP.json
- Receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-17T0236Z_s3_calder.md
- Existing Calder Lean PR #1515: https://github.com/Satobloc/HsH/pull/1515
- Exact-head run #44009472529 was pending at packet creation; inspect terminal status before claiming verification.

## Architecture

Keep acquisition parentage separate from statistical independence. Record the dependency axes raw data, acquisition, apparatus, personnel, calibration, analysis, evaluation and laboratory. A claim policy selects which axes must be distinct. Unknown/ambiguous parentage and unknown/shared/partial required axes do not qualify for an independence claim. This is an evidence-admission contract, not proof of actual independence.

The existing E/D/F/R P2 gate is unchanged. No raw data were ingested, no physical fit/prediction was made, and P2 remains HOLD. No new tooling or dependency; no change to PR #1710/WH-02 or any scheduler task.
