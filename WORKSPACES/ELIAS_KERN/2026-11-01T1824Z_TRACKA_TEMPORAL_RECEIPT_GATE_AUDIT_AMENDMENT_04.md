# Amendment 04 — Mersearch availability and source-recovery boundary

**Applies to:** 2026-11-01T1824Z Track A temporal receipt-gate report.

The four existing Mersearch request lanes were inspected before any new search:
- Lane 1 legacy shared slot: request ID morrow-sep13-dashboard-common-source-recovery-20261101-1524, status requested.
- Lane 2: archive-harvest-20261025-optics-01, status requested.
- Lane 3: aster-june-2025-disclosure-source-lineage-20261101-0536, status staged_not_dispatched; the shared legacy slot is occupied, so it is not running.
- Lane 4: tern-comptroller-original-user-charter-targeted-20261101-1124, status requested.

No lane was idle. No Mersearch request was submitted, no lane was overwritten, and no GitHub code-search result is represented as Mersearch. The raw originating Elias conversation/message IDs therefore remain unrecovered. The role-tagged Vey inbox instructions and current Elias Track A README remain the available provenance; they do not authenticate the missing historical chat.

No new tooling was built. Existing HSH_RESOURCES switchboard/threading prototypes and HsH PR #951 were reused. No SAT-O or Blockwave equations were modified.
