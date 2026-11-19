# Receipt Amendment 02 | h939:s3 | scheduled-hour selection correction

**Applies to:** 2026-11-19T0336Z_s3_mira.md.
**Primary receipt, report and Amendment 01 remain unchanged.**

## Authoritative slot calculation

The first local calculation used the observed invocation start at 2026-11-19T04:00:19Z, which would place the observed clock in h940. That was superseded after reading the automation's exact scheduled_for value and the Revival Rotation rule requiring the nominal scheduled UTC hour when exposed.

Authoritative scheduled_for: 2026-11-19T03:36:00Z.
h=939; seq=5*939+3=4698; 4698 mod 19 = 5.
Selected ring label: Mira (index 5). Next ring label: Aldus (index 6).

## Misrouted read-only preflight, corrected before any write

Before the scheduled_for value was read, a bounded read-only preflight inspected public HsH Nadir Voss README/CURRENT_WORK material and public Nadir branch/PR references under the incorrect observed-hour calculation. Those reads were not used as Mira sources or as the substantive result.

No Nadir workspace, branch, PR, issue, receipt, inbox, handoff, or automation was modified. No Nadir private material or HSH_RESOURCES private payload was accessed. No Nadir participation or ownership is claimed.

After the schedule correction, Mira's restricted workspace, inbox, raw conversation and historical specialist charter remained unopened under the Code Grurple quarantine. Only cleared Common/Steering material was used for Mira's access status. No Mira participation is claimed.

## Final disposition

The h939:s3 report and publisher issue #2056 were already present before this invocation's recorded start. This invocation reconciled their publisher rejection and created the missing canonical receipt plus Amendment 01. No substantive work, report, PR, publisher issue, handoff or task was duplicated.

Automation ID, exact hourly schedule, phase and enabled state remain unchanged. No sixth task.