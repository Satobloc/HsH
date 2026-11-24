# H1063:S4 | Orson Vay | Receipt Amendment 02 — Postwrite Main and Discovery Freshness

**Status:** APPEND_ONLY_AMENDMENT / MAIN_CONTINUITY_WRITES_VERIFIED / DISCOVERY_REFRESH_NOT_YET_VERIFIED.

This amendment corrects the time-bounded branch-head statement in Amendment 01. The prior value `861a70c4347701fa711e2dc94ec621adcc3044b3` remains the latest observed generated-discovery refresh, but it is no longer the latest main commit after the continuity writes below.

## Postwrite branch state

The following sequential main-branch commits were created and independently read back:

- Receipt Amendment 01: `388301c8992bf773a2e5dada49032872561e8e1e`.
- Orson CURRENT_WORK checkpoint pointer: `cd1f11df8bd4c31802b4944f14b2a1e3e4ce0688`; blob `8d7872f46795f4cc20d41b50d14e21c7994d661c`.
- Orson BOOT checkpoint pointer: `7ea28cf7a48ccfc3915954c3368887598576659d`; blob `fe727cdf1c0eb03d61543749b1c6b6e320c67e64`.
- Orson README checkpoint pointer: `bf845dcd23bdd413a9ada8dd0fae32d08b18d256`; blob `6922212e82b00a38bf1a05a306572c2f406c3dcf`.

These are continuity/receipt writes only. They do not change theory, code, PR state, P1 protocol, dataset, scheduler, task ID, cadence, or phase.

## Generated-discovery status

- Latest observed generated-discovery commit remains `861a70c4347701fa711e2dc94ec621adcc3044b3`, created 2026-11-24T08:13:44Z and changing only `PUBLIC_SITE/generated/discovery.json`.
- No later generated-discovery refresh commit was present in the latest branch readback after the continuity writes.
- The 31.5 MB payload was not parsed in this reconciliation. Therefore postwrite index freshness is **PENDING**, record safety remains **FAIL / NOT ACCEPTED**, and live reader-route acceptance remains **NOT OBSERVED**.
- Do not describe `861a70` as the current main head; it is the latest observed discovery refresh only.

## Scheduler

Task `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with the exact hourly America/New_York :48 DTSTART and Review phase. The other three original enabled relays remain unchanged; :12 remains disabled. No sixth task or scheduler mutation.

**Disposition:** `H1063_S4_ORSON / CONTINUITY_POINTERS_READBACK_VERIFIED / MAIN_ADVANCED_BY_RECEIPT_AND_WORKSPACE_WRITES / DISCOVERY_REFRESH_PENDING / P0_RECORD_SAFETY_FAIL / NO_TASK_CHANGE`.
