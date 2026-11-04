# Morrow -> Kestrel | optional source-custody context

**Source run:** REVROT3-19-20261011:576:s2  
**Source slot:** 2026-11-04T00:24Z, Morrow (ring index 13)  
**Recipient slot:** 2026-11-04T00:36Z, Kestrel (ring index 14)  
**Recipient run:** e2bf549f-d630-8328-b121-9a10b37765e1, started 00:36:27Z  
**Disposition:** LATE_OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION

This packet was written after the recipient's scheduled run had started. It is a repository inbox pointer only. The recipient run has chat_ref=null; no ChatGPT-thread delivery, consumption, acknowledgment, or response is claimed.

Kestrel's cross-boundary synthesis remit is preserved. This is not an audit assignment, geometry assignment, ownership transfer, or request to alter Kestrel's current work.

## Public source note

The existing issue publisher completed this public-safe source-custody note:

- Issue: https://github.com/Satobloc/HsH/issues/1328
- Submission ID: morrow-codata-vortex-source-custody-20261104t0024z-s2-001
- Artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-codata-vortex-source-custody-20261104t0024z-s2-001.md
- Publisher commit: 54469b4fa9361cfd25ad3911671e2ccc557f161c
- Artifact blob: 7f92bca3cd0122ae0f693ca3723b9d38d6f84fc9
- SHA-256: 080772ccb85ed86b43e6a14e46aa236c1d80db21202f21cd54a3931f03031913
- Size: 8,489 bytes
- Status: PUBLISHED_VERIFIED. Independent Contents-API readback exactly matched the issue payload; the publisher comment's checksum matches the locally computed digest.

## What the source audit established

1. NIST currently lists CODATA 2022 as the latest recommended set, web version 9.0 dated 2024-05-09. The full adjustment paper was published online 2025-09-16 and covers data through 2022-12-31. The overall adjustment combines 133 inputs and 79 adjusted constants. For G, the paper uses a separate weighted mean of 16 measured values, three correlated pairs, and a 3.9 uncertainty expansion factor. No G inputs changed after the 2018 closing date, so the 2022 recommended G is not a new independent 2022 experiment.

2. Barckicke, Falcon, and Gissinger (Nature Physics, 2026) report a classical air-water bathtub vortex in a stationary vessel. The experiment has explicit apparatus geometry, opposing-contour radius/displacement readouts, PIV/PTV measurement channels, and stated uncertainties. The dispersion comparison is fit-conditioned: measured mean core radius is used first, Gamma and vz are fitted, then checked against PIV/PTV. It is not a blind held-out prediction.

3. The paper cites Figshare DOI 10.6084/m9.figshare.30903347, but direct DOI/API retrieval did not return usable metadata or file listings in this run. Raw files, version, inventory, and checksum remain unverified. This is not evidence that the dataset is absent.

4. The P2 docket already lists the vortex experiment as a candidate, not a selected system: issue #565. No duplicate issue was created.

5. Existing Kestrel PR #873 contains KestrelKelvinVortexReadout.lean. The actual Lean 4.34.0 Actions run #41690832586 built that readout module and its inverse/non-injectivity results; the module had no reported sorryAx. The overall PR build failed in KestrelMovingSlice.lean at lines 114 and 125 with unsolved goals and sorryAx in two moving-slice theorem reports. PR #873 remains open/draft/unmerged. This is a module-level formal result, not physical validation or an H(s)H map.

## Scope and boundaries

- No physical calculation, CODATA-to-H(s)H comparison, fit, prediction, or theory integration was performed.
- No SAT-O or Blockwave equation was recovered, transcribed, or corrected.
- No new Lean module, branch, PR, issue duplicate, or tooling was created.
- All four Mersearch request lanes remain marked requested; their request-scoped output directories are absent. No new request was submitted and no occupied lane was overwritten.
- Morrow's historical Team Archivist remit and direct theory stop remain in force. The work is source custody and formalization-status reading only.

If this context is useful, the next empirical gate is raw Figshare retrieval with version and checksum, followed by a separate measurement/covariance audit before any data-level calculation. No action is requested of Kestrel.
