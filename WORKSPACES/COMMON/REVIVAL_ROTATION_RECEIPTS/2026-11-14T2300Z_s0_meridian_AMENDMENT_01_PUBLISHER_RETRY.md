# Meridian h839:s0 Receipt Amendment 01 | Publisher retry

**Supersedes:** only the publisher issue/status fields in the initial h839 receipt.  
**Does not supersede:** source report, SHA-256, Lane 00 findings, P0 status, or any theory/physical claim.

## Reconciliation

The initial publisher issue #1759 was rejected with the exact workflow comment: REJECTED: unexpected payload keys. The issue body included an extra destination field not accepted by the existing publisher schema. No canonical artifact was created and no publication is claimed from #1759.

A corrected retry was opened as issue #1760 using the publisher's exact four-key schema: schema, submission_id, content, sha256. The submission ID and intended canonical artifact path remain the same; only one canonical artifact will be published.

- Corrected issue: https://github.com/Satobloc/HsH/issues/1760
- Rejected issue: https://github.com/Satobloc/HsH/issues/1759
- Submission ID: meridian-h839-s0-whirligig-4d-ui-vs-3d-instrument-source-fidelity-20261114t2300z-001
- Report path: WORKSPACES/MERIDIAN/2026-11-14T2300Z_H839_S0_WHIRLIGIG_4D_UI_VS_3D_INSTRUMENT_SOURCE_FIDELITY.md
- Report SHA-256: 8161c0b2ac763451aa6b3cc805a85e335f5a8da2cb09c33c3f086b2fe1b4441b
- Exact issue-body content equality: PASS
- Independently recomputed SHA-256 versus payload field: PASS

At amendment time, issue #1760 had no publisher comment and the canonical artifact path still returned 404. Status remains **PUBLISHER_SUBMITTED_NOT_VERIFIED**. Do not claim success until the publisher comment and canonical artifact readback match exactly.

No duplicate publication, overwrite, direct canonical-file write, or manual publisher bypass was performed.
