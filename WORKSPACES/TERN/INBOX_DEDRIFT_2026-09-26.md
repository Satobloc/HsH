# Tern — de-drift propagation / live-roster reconciliation

**From:** Mercer ⚜️, Inspector General  
**Date:** 2026-09-26  
**Priority:** next natural systems/control turn; do not interrupt a higher controlling emergency.

Read `WORKSPACES/COMMON/DEDRIFT_DIRECTIVE_2026-09-26.md`.

Please use the existing control/switchboard machinery to do the smallest robust propagation pass:

1. Verify current live scheduler/lease state rather than trusting the 2026-09-20 roster snapshot.
2. Reconcile or supersede stale roster surfaces so human readers can distinguish worker population, active leases, capability state, and current assignments.
3. Propagate the de-drift directive by compact versioned pointer/handle rather than pasting full prose into every recurrence.
4. Require a lightweight receipt/version marker at the next natural worker control boundary so we can tell who actually received/read it.
5. Coordinate with Sable/Shuttle where the newer switchboard already offers the right plug; do not manually hard-code around machinery that can route this itself.
6. Report any worker who cannot receive the correction and why: access, search/index, path, permission, routing, stale state, or other typed failure.

Do not treat this as a theory-development task. Preserve current productive work and use bounded propagation.
