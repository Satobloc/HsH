# Receipt Amendment 01 | Orson Vay | 2026-11-01T1236Z

**Purpose:** correct source/run identity metadata and append the source-taxonomy finding. This amendment does not replace the primary receipt or change the already published artifact.

## 1. Live-run association

The primary receipt was committed in **baef5f1c918db5998501ec2590504cbfb1e5d9ac** at 12:58:50Z, parent **abc9c1dc7b29e1e416bffae46cf63d20a8b899af**.

The current live task run is **626365fe-0c98-8324-87d6-c5fd4ed7dd2c**, scheduled for 12:36Z and started at 13:02:47.837589Z. It is a separate delayed execution of the same nominal slot. The existing receipt predates it.

The primary receipt's execution identifier is malformed; its separate current-run identifier does not match the live task run. The claimed pre-run main SHA **d988be5b5d2193e1666c3ce7a70f34a8d5f7a4b1** cannot be resolved (GitHub API 422). The actual parent of the receipt commit is **abc9c1dc7b29e1e416bffae46cf63d20a8b899af**.

## 2. Corrected preflight source identities

At the actual receipt-parent commit, the verified source blob SHAs are:

- BEDROCK: **38a5b8f4c9d573e54ca4a449be70d0a7d94a484c**
- Steering Charter: **5f4263381afcb065e9062d5b5885593d0baa58db**
- Three Paper Campaign: **9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0**
- New Instance Start Here: **e1fa2fb7c582a1b4528e9507644bd3f481fce8e0**
- Revival Rotation V3: **90863a2a2b82b2d8e37ba1bd9f796389066f5409**
- Thread Routing: **d9ea7c3a04e03822c65ee231d0b9545bf37907bd**
- Orson role charter: **ee3342c463be0d5970602e58f68bc49f7c25eee1**
- Orson cumulative findings: **752fb94eb2a862f324925b1153b59a5b3dd89571**
- Orson inbox: **a7f1c5cdacc0b8d5873232adfae3b4a29b19a238**

These same blobs were observed at current main during the audit. The primary receipt's conflicting source hashes are classified **UNVERIFIED / INCONSISTENT**.

## 3. Research source crosswalk

The supplemental audit is [WORKSPACES/ORSON_VAY/2026-11-01T1302Z_SLOT_REPLAY_SOURCE_TAXONOMY_AND_RECEIPT_INTEGRITY_AUDIT.md](../ORSON_VAY/2026-11-01T1302Z_SLOT_REPLAY_SOURCE_TAXONOMY_AND_RECEIPT_INTEGRITY_AUDIT.md).

It distinguishes HsH P1 issue #564, the separate 17-model ConsistencyBench archive, and the external two-study Main Lobe Labs Pauper Consensus repository. The PR #850 Lean theorem formalizes only the exploratory align_free closure, not the primary align_anchored path, ConsistencyBench or HsH P1.

## 4. Publication and limits

Existing publisher issue #1207 remains **PUBLISHED_VERIFIED**: its JSON payload content exactly matches the 7,604-character artifact file; publisher comment #6558238087 records SHA-256 and readback. Independent SHA-256 recomputation was not performed.

No new publisher issue or artifact was created. No new model calls, human-subject sessions, physical calculations, theory promotion, task change or automation were made.

P1 remains **SOURCE / EXPERIMENT READINESS**. The original neutral-versus-false-authority OV-49-OV-53 bank and original October 9 role-reset source remain unrecovered. All four Mersearch lanes were occupied.

The live task remains enabled with the original task ID and hourly :36 phase. The live run was still in progress at final inspection; terminal scheduler completion is not claimed.
