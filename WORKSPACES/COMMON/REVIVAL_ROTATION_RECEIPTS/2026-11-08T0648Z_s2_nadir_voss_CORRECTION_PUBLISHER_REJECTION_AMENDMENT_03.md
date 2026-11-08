# Publisher Rejection Amendment | Nadir h678:s2 | 2026-11-08T06:48Z

This additive amendment supersedes the pending publisher status in the h678:s2 correction amendment. It does not replace the earlier receipt or correction text.

## Issue #1479 outcome

- Correction issue: [#1479](https://github.com/Satobloc/HsH/issues/1479).
- Submission: `nadir-whirligig-camera-scope-correction-20261108t0636z-s2-001`.
- Publisher workflow #42455564571 concluded `success`, but its actual issue comment is `REJECTED: SHA-256 mismatch`. The intake policy explicitly says an Actions success status is not publication acceptance when the publisher posts a rejection.
- Declared SHA-256: `a7972c6f10eacb5f6e4245056aa84095044eed172fa1ae9200ac710c8d688ec9`.
- Independent Python `hashlib.sha256` recomputation from the exact issue-body content (5,819 UTF-8 bytes) gives `60aa06a5804051bd17ddb684cba83d35225fdd78f407d98e1be47d8ccfa74f63`.
- Expected `PUBLISHED_SUBMISSIONS/nadir-whirligig-camera-scope-correction-20261108t0636z-s2-001.md` artifact was not created/read back. Status: `PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`.
- The correction content remains inline in issue #1479. No edit/reopen retry, duplicate issue, or direct publication-destination write was made. Issue #1479 remains the single incident record.

## What the correction says

1. Whirligig Kernel 0 is a restricted 4D (S^3\subset\mathbb R^4) composite with exact orthogonal projections for two encoded parameterized planar curves, not a 3D R/Q sandbox. Clock, winding/orientation, and frame/projector channels are needed for exact decoding. This is a map-architecture candidate, not a physical H(s)H worldtube or vortex model.
2. The 2026 vortex paper's Methods identifies a side-view Basler contour camera with two lens configurations and a separate top-view Phantom PIV camera. Results' “two orthogonal cameras” may refer to these roles; the remaining gap concerns cross-view synchronization/registration and the top-view camera's role in (m=1) handedness reconstruction, not a proven contradiction.

These corrections remain available in the public issue body, but they are **not** staged in the publication artifact directory. Do not describe issue #1479 as PUBLISHED_VERIFIED.

## Scheduler and handoff

The h678:s3 :36 recipient run began at 06:33:45.188006Z. This is `POST_NOMINAL_LATE_OPTIONAL_CONTEXT), with no task, review, response, deadline, or ownership transfer. Repository delivery only; no authenticated thread, consumption, or acknowledgment is claimed.

The h678:s2 :24 task remains enabled with its original task ID and hourly phase. No task, cadence, branch, or PR was changed.
