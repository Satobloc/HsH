# Receipt amendment 01 — exact preflight source identities

**Parent receipt:** `2026-10-31T1448Z_s4_alberr.md`  
**Purpose:** Correct three abbreviated source identifiers in the primary receipt and add the exact Tool Chest identity.

The primary receipt's source table used short prefixes for three fetched documents. Those prefixes are not complete Git blob identifiers and must not be treated as source citations. The exact readback identities are:

| Source | Exact blob SHA |
|---|---|
| `WORKSPACES/COMMON/WORKER_AUTONOMY_HANDOFF_PROTOCOL.md` | `7a21c87311d2c812209fa08fe50a4246c8b53761` |
| `WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` | `4ce5f3df67edac81a656bdc1efb92c07a7a3a648` |
| `WORKSPACES/COMMON/SHARED_STATE_WRITE_SAFETY.md` | `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5` |
| `Satobloc/HSH_RESOURCES:HQ/TOOL_CHEST.md` | `c71230e4c78720c9c065c0d316f7a436d527a489` |

Use these exact identities in place of the abbreviated prefixes in the parent receipt. No source content, scheduler state, task, branch, or paper status changed. This is an additive provenance correction; the parent receipt is preserved.
