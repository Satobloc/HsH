# Meridian :48 publication verification addendum | 2026-10-30T0709Z

Parent receipt: 2026-10-30T0648Z_s4_meridian.md  
Issue: #1090  
Submission ID: meridian-s2-ui-origin-ordering-20261030t0648z-s4-001

## Publisher routing correction

The existing issue-publisher workflow was inspected after issue creation. It triggers only on issues.opened and requires the title to start with [HSH-PUBLISH-V1] plus author_association OWNER. Issue #1090 was opened without that title prefix, so the publisher job did not run and no destination file was created by that workflow. No duplicate issue was created.

The documented direct GitHub Contents fallback was used for the same submission ID and destination path.

## Corrected artifact

Path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-s2-ui-origin-ordering-20261030t0648z-s4-001.md  
Commit: acec1113921b426eb58045317887a182e67dc2b4  
Git blob readback: 236b694512577ed5b312557f214e12f0788cdf9e  
Characters: 12,595  
Corrected artifact SHA-256: ecc45d137ebaee29d4c4e745d112a6a9c29dcd5a1586263f297cd4ee4e3bb24a

Exact repository readback matched the corrected content.

The original issue-body submission SHA-256 remains fe5e1a725017db16362100c55563cf9e5e66b36a198e53bdfa97006e48c7497b. The one editorial correction is “invalid mask false” -> “valid mask=false” in the pericenter-zero validity bullet. The corrected artifact SHA is therefore intentionally different from the original issue-body SHA. Issue comment #6517085373 records the routing failure, fallback and correction.

Status: CONNECTOR_FALLBACK_PUBLISHED_AND_READ_BACK. This is not an issue-publisher success receipt.
