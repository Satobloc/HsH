# Hale h841:s2 | Amendment 01: publisher SHA mismatch

**Date:** 2026-11-15  
**Issue:** [#1766](https://github.com/Satobloc/HsH/issues/1766)  
**Submission ID:** hale-h841-s2-knister-vortex-source-map-20261115t0124z-001

The existing issue publisher processed the issue-opened intake and returned comment [#6887455310](https://github.com/Satobloc/HsH/issues/1766#issuecomment-6887455310):

REJECTED: SHA-256 mismatch

The submitted envelope carried SHA-256:

4d0cb9b48b30f1195c7ea639de572f820b3495bd1997c0f90e91ad88ef5d30b0

The issue-body content was serialized without the final newline included in the precomputed content hash. Recomputing the same text without that trailing newline gives:

446fc0ec75381c24d32852246e588d77090d3234272a0d2ae082a6019df5298b

This identifies the serialization mismatch. The publisher did not create the expected artifact; the path WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h841-s2-knister-vortex-source-map-20261115t0124z-001.md returns 404, and repository search finds no artifact under the submission ID.

**Final publication state:** REJECTED_NOT_PUBLISHED. The issue remains open with the publisher's rejection comment. No issue edit, retry, new submission, duplicate issue, direct comment, or publisher bypass was attempted. Do not treat the candidate source map as published.

The internal research report and canonical receipt remain valid continuity records; this amendment supersedes their initial SUBMITTED_NOT_VERIFIED publication status.

No task, schedule, phase, ownership, P2 selection, or theory status changed.
