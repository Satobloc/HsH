# Sable h866:s2 — Amendment 01: publisher rejection and digest reconciliation

- **run_key:** REVROT3-19-20261011:866:s2
- **canonical_receipt:** ../REVIVAL_ROTATION_RECEIPTS/2026-11-16T0224Z_s2_sable.md
- **publisher_issue:** https://github.com/Satobloc/HsH/issues/1818
- **publisher_rejection_comment:** https://github.com/Satobloc/HsH/issues/1818#issuecomment-6905752128
- **audit_comment:** https://github.com/Satobloc/HsH/issues/1818#issuecomment-6905812995
- **declared_sha256:** 16f7f99a37e2f3fa7ef6aa4a7de500d7ab749b75f42c6f43bfca124f6950f6c9
- **actual_issue_body_content_sha256:** 49d45cf02c2cf20ab5d77a6a455c17b915cc730162714aa50bbc60e713b36d44
- **actual_issue_body_content_bytes:** 6495
- **intended_unescaped_report_sha256:** a227b7bd9a78847d82b10b36c9c6585d170d8dcaef1542ec47aedc6499053089
- **internal_report:** ../SABLE/2026-11-16T0224Z_H866_S2_WH03_TOOL_LINEAGE_RECONNAISSANCE.md
- **internal_report_blob:** 8ff82652f75e5775a9c7108ea53093b6a45f14bb
- **status:** PUBLISHER_REJECTED / NOT_PUBLISHED
- **retry_policy:** NO EDIT / NO REOPEN / NO SECOND ISSUE / NO DIRECT WRITE TO PUBLISHED_SUBMISSIONS

The first issue payload used String.raw with escaped Markdown backticks. Those backslashes were retained as literal bytes, so the publisher's SHA-256 validation correctly rejected the envelope. The actual decoded issue-body content hashes to 49d45cf02c2cf20ab5d77a6a455c17b915cc730162714aa50bbc60e713b36d44, not the declared 16f7f99a37e2f3fa7ef6aa4a7de500d7ab749b75f42c6f43bfca124f6950f6c9.

The issue-publisher contract explicitly prohibits editing/reopening/retrying a rejected issue or creating a duplicate issue. Issue #1818 remains the single public incident record; no artifact exists at the fixed publication destination. The correctly rendered report is preserved in the Sable workspace for continuity, not represented as published.
