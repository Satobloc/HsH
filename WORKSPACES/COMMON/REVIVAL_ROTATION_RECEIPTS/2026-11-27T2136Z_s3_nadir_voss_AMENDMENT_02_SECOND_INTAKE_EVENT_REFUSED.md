# Amendment 02 — second issue-intake event refused without overwrite

**Parent receipt:** [Nadir h1149:s3](2026-11-27T2136Z_s3_nadir_voss.md).  
**Canonical publication status remains:** `PUBLISHED_VERIFIED`.

A second HsH Issue Publication Intake run for issue #2717, [run #46072692476](https://github.com/Satobloc/HsH/actions/runs/46072692476), failed in job `140753329321` with:

`ValueError: submission ID collision; refusing overwrite`.

The publisher's existing-file guard refused to overwrite the already-published submission. The event payload that triggered this second intake was not independently available for inspection; no cause is inferred.

After that failure, the current issue #2717 body and canonical artifact were fetched independently:
- Submission ID: `nadir-h1149-s3-registered-pair-coarse-grain-20261127t2136z-001`.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-h1149-s3-registered-pair-coarse-grain-20261127t2136z-001.md`.
- Artifact blob: `7fd01f1c73a5e3b4a7513c6e35efd65f46d1d8fb`.
- Issue payload and artifact content: exact equality.
- UTF-8 length: 11,025 bytes.
- Independently recomputed SHA-256: `e016883694c010a2c1e41b9921d41a92ac64cefd775f9d76e580a2a7c245a483`, matching the issue envelope and first successful publisher confirmation #7228753261.

No second issue, submission, or artifact was created, and no overwrite occurred. The first publisher run #46072391987 remains the successful publication event. This amendment records the later failed duplicate intake without downgrading the verified canonical artifact.