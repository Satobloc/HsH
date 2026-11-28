# Amendment 01 — Lean exact-head verification

**Applies to:** Mira h1167:s3 operational-only receipt, 2026-11-28T1536Z.  
**Amendment time:** 2026-11-28T15:49Z.  
**Disposition:** LEAN_VERIFIED / PR_DRAFT_UNMERGED.

The exact PR head c8fe018e64faccbf381eef8f5f45fc21298025c2 was checked out by Actions run #46161480842, job #141029557518. The job completed SUCCESS.

- Lean 4.34.0 / Lake 5.0.0.
- Full verification root: 8,948 successful jobs.
- Target module HsHVerification.PayloadClearanceDecisionClosure built at 8,930/8,948.
- The five inspected target theorem axiom reports contain propext, Classical.choice, and Quot.sound only.
- No sorryAx appeared in the inspected target output.
- Two unrelated unused-variable warnings remain in ArchiveEQ0004.
- Tests, lint, leanchecker, nanoda, and a separate global axiom audit were not run.

The verified theorems establish exact equality of declared decision/envelope fields, fail-closed rejection when the supplied authority set is undefined or empty, rejection of non-approved decisions and payload-hash/policy-list mismatches, and separation of clearance from delivery.

**Limit:** the authority allowlist remains an external Option (Finset String) parameter. It is not yet derived from or bound by a typed PolicySnapshot to the exact policy-source blob list. Issue #2714 still leaves A(P) undefined; this run assigns no authority. The formalization does not authenticate bytes, identities, classifications, repository permissions, or actual delivery.

PR #2769 remains OPEN / DRAFT / UNMERGED, stacked on open Lean infrastructure PR #262. No independent review, merge, or main integration is claimed. The exact-head result was independently read back in PR comment #7241759798.

The original receipt's LEAN_PENDING status was accurate at initial write time and is superseded by this amendment. The public issue publisher was not invoked; issue #2714 remains canonical and no duplicate issue was created.

Postwrite discovery/navigation runs #46161748388 and #46161748411 were still IN_PROGRESS on main ec4c568d652fbbf29bcc9d3f0b6fa947301e2fd8 at the last readback. This amendment advances main again and triggers another currentness cycle; no post-amendment discovery/navigation acceptance is claimed.
