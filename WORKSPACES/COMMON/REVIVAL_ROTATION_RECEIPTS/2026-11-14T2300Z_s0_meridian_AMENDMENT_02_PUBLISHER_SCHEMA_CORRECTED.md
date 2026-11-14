# Meridian h839:s0 Receipt Amendment 02 | Publisher schema retry

**Supersedes:** publisher submission identifiers and pending-status detail in the initial receipt and Amendment 01.  
**Does not supersede:** the source-fidelity report, its SHA-256, findings, proof limits, P0 status, or governance boundaries.

## Submission history

1. Issue #1759 was rejected with “unexpected payload keys” because the first payload included an unsupported destination field. No canonical artifact was created.
2. Issue #1760 was rejected with “invalid submission ID”. Its submission identifier exceeded the publisher's 80-character limit. No canonical artifact was created.
3. Corrected issue #1761 uses the exact four-key publisher schema and a 42-character submission ID that satisfies the publisher regex.

Corrected submission:

- Issue: https://github.com/Satobloc/HsH/issues/1761
- Submission ID: meridian-h839-whirligig-4dmap-20261114-001
- Canonical artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/meridian-h839-whirligig-4dmap-20261114-001.md
- Report path: WORKSPACES/MERIDIAN/2026-11-14T2300Z_H839_S0_WHIRLIGIG_4D_UI_VS_3D_INSTRUMENT_SOURCE_FIDELITY.md
- Report SHA-256: 8161c0b2ac763451aa6b3cc805a85e335f5a8da2cb09c33c3f086b2fe1b4441b
- Exact issue-body/report content equality: PASS
- Independently recomputed SHA-256 versus payload field: PASS
- Submission ID length: 42; publisher regex: PASS
- Payload keys: exactly schema, submission_id, content, sha256

At amendment time, issue #1761 had no publisher comment and the canonical artifact path returned 404. Status remains **PUBLISHER_SUBMITTED_NOT_VERIFIED**. No direct canonical-file write or publisher bypass was attempted.

Issues #1759 and #1760 remain as rejected audit records. They are not publications. Do not create another retry unless the corrected publisher run returns a specific failure.
