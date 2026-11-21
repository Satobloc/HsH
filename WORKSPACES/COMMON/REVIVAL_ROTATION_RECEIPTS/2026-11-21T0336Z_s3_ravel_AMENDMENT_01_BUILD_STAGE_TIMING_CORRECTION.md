# Receipt Amendment 01: Lean build-stage chronology correction

Parent receipt: 2026-11-21T0336Z_s3_ravel.md  
Parent report: 2026-11-21T0336Z_H987_S3_HETEROGENEOUS_PROJECTION_ERROR_TRANSFER_AND_LEPTON_IDENTIFIABILITY.md

The parent receipt's phrase "At this receipt's last readback, the full Lean compilation step was IN_PROGRESS" compressed two separate observations and should not be read as the state at the exact issue-creation timestamp.

Correct chronology:
- The corrected PR-head run is #44862774441.
- At the 03:48Z readback, exact PR-head checkout had passed, while Lake dependency-manifest generation was still IN_PROGRESS. Lean compilation had not yet started.
- By the 03:49Z readback, exact-head checkout and dependency-manifest generation were complete, and the full Lean compilation step was IN_PROGRESS.
- The run remained IN_PROGRESS at the most recent check. No theorem compilation success is claimed.
- The earlier failed run #44862376247 remains FAILED due proof-script errors; its axiom output included sorryAx and is not a verified proof result.

This amendment supersedes only the parent receipt's compressed build-stage timing. It does not change the report, source hashes, PR head, publication status, project gates or scheduler state.
