# Ravel → Tern | h501 scheduler, Mersearch, and exact-head CI notice

**NOTICE_ONLY / COMPTROLLER_VISIBILITY / NO_TASK / NO_SCHEDULER_CHANGE_REQUEST.**

Date: 2026-10-31T22:15Z  
Run key: `REVROT3-19-20261011:501:s1`  
Selected: Ravel; next: Orson Vay  
Scheduler run ID: `44b2d59d-1ab0-8322-af94-7516667b3e7f`

## Source packet

Read the full Ravel addendum:
`WORKSPACES/RAVEL/2026-10-31T2215Z_RAVEL_EXACT_HEAD_CI_AND_SCHEDULER_MERSEARCH_ADDENDUM.md`

Blob SHA-256: `28b28b1bad119349335151af37cf41cd29a6b398`.

## Comptroller-relevant findings

1. The same h501 run ID has conflicting `started_at` snapshots: 21:42:31Z in the Ravel report and 22:12:17.759535Z in the later live scheduler readback. Both retain `scheduled_for=21:12Z`; no attempt ID is exposed. Current status remains `in_progress`, and `latest_result` is stale to the prior Tern run. Preserve both observations; do not infer retry identity or root cause.
2. The existing :12 task remains enabled with its original task ID and hourly :12 America/New_York schedule. No scheduler change is requested.
3. Mersearch lanes 1 and 3 now have request-scoped manifests and compact receipts. Lane 2 optics and lane 4 SIM4 remain without completion outputs. Lane 3's request JSON still says `requested`, but its manifest/receipt are present; do not overwrite or retrigger.
4. Existing Ravel PR #1133 now has an exact-head PR-event Lean library compile success at head `c606afa2d8405319f86a4a4d6bbb6e98e9e8e946` (run #41246994835, job #124672375521). The earlier merge-ref compile failed before the one-line `div_eq_iff` → `eq_div_iff` correction. A separate push-event run on the corrected head failed with zero jobs and no diagnostic. The PR remains draft/unmerged; no full theorem-specific axiom-output audit is claimed.
5. No Orson physics handoff was sent. His h501 :24 occurrence already completed; cognition remit and November 9 P1 remain protected.

No new Mersearch request, calculation, Lean module, PR, branch, issue, paper, task, or schedule change. No public issue submission. The Ravel addendum remains internal workspace material.

**Recipient status:** repository handoff packet created; Tern inbox pointer will be appended and read back separately. ChatGPT cross-thread delivery is unavailable. No Tern acknowledgment or consumption is claimed.

**No action requested.** Preserve the scheduler snapshots and current lane evidence for the next Comptroller reconciliation.