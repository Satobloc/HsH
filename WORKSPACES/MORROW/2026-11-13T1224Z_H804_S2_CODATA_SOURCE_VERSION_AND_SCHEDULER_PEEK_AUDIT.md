# Morrow h804:s2 | CODATA source/version custody and scheduler peek reconciliation

**Nominal:** 2026-11-13T12:24:00Z  
**Run key:** `REVROT3-19-20261011:804:s2`  
**Selection:** h=804; seq=5(804)+2=4022; 4022 mod 19 = 13.  
**Selected label:** Morrow, ring index 13.  
**Successor:** Kestrel, ring index 14.  
**Disposition:** SOURCE-CUSTODY-ONLY / CODATA 2022 VERSION RECONFIRMED / 2026 ADJUSTMENT NOT YET PUBLICLY RELEASED / FOUR MERSEARCH LANES OCCUPIED / :00 FAILURE AND :24 EARLY START ROUTED TO TERN / NO THEORY INTEGRATION / NO PHYSICAL CALCULATION / NO TASK MUTATION.

## 1. Identity and controlling Morrow authority

The deterministic label is not authentication of a historical Morrow instance or current Morrow thread. No authenticated current Morrow thread was established. This is source-grounded assistant work in the Morrow workspace.

Historical source:
- Conversation: `6a9ee7ca-d340-83ea-b99d-6a3097429f36`.
- Raw export blob: `ee394b446b2e36d35fd1e5ecd004685c0422457b`.
- Parsed mapping: 697 nodes; 17 user-role messages.

Direct user-role sources read from the raw blob:
- `402ade01-7116-4efb-9b14-31e477754458`, 2026-09-08T03:25:36.187Z: provisional Team Archivist remit, broader-corpus appraisal, a short flexible action plan, and GitKeeper coordination.
- `934e87de-4e61-4622-a0ea-e5047aa235c6`, 2026-09-13T00:11:10.939Z: explicit stop on theory work and quarantine of unique theory-bearing artifacts.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557`, 2026-09-13T15:31:22.757Z: later archive/maintenance/training/reconstruction trial invitation. It permits bounded archive maintenance, source comparison, chronology/provenance work, theory-material reading and note-taking, and mathematical/equation checking. It does **not** expressly lift the theory-integration stop or authorize physical prediction, fitting, paper development, or BEDROCK promotion.

The separate Morrow+Kestrel “Ok, good. Continue” message remains scoped to its existing Normal-Plane Escape Gate branch; it is not a general release. The live Morrow README and trial checkpoint retain the same boundary. The current Lane 24 charter is treated as a project research direction, not a silent repeal of Morrow's worker-specific stop.

Accordingly, this run performed source custody and workflow provenance only. No theory integration, physical calculation, fit, prediction, equation correction, Lean rerun, paper work, or BEDROCK promotion occurred. No standalone signed Nathan-authored Morrow specialist charter was recovered; “Team Archivist” is a provisional direct-user role, not proof of current instance identity.

## 2. Fresh CODATA source/version custody check

This is a source-version and methodology check, not a numerical comparison.

### Current official NIST state

NIST's current Fundamental Physical Constants portal still identifies the **2022 CODATA recommended values** as the latest available set. It reports:
- NIST Standard Reference Database 121;
- data-content last update: May 2024;
- version history: Web Version 9.0, updated 2024-05-09;
- the next regular adjustment is CODATA 2026;
- eligible input data must have been discussed in a publication preprint or publication before 2026-12-31.

Primary public sources:
- NIST constants portal: https://physics.nist.gov/cuu/Constants/index.html
- NIST version history: https://physics.nist.gov/cuu/Reference/versioncon.shtml
- 2022 CODATA paper: https://doi.org/10.1063/5.0279860
- NIST-hosted paper PDF: https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf

The 2022 paper was published online 2025-09-16 in *Journal of Physical and Chemical Reference Data* 54, 033105 (2025), DOI 10.1063/5.0279860. Its abstract states that the 2022 adjustment uses theoretical and experimental data available through 2022-12-31. The current NIST portal does not expose a 2026 recommended-values release. This is a public-version observation, not a claim that the 2026 adjustment process is inactive.

### What the 2022 recommendation actually represents

The 2022 paper documents a least-squares evaluation of 133 input data and 79 adjusted constants, giving 54 degrees of freedom. The initial adjustment, before uncertainty expansion factors, had chi-square 109.6 and a reported 0.001% probability for 54 degrees of freedom. The final adjustment applies expansion factors of 1.7 to input data in Tables XI, XII and XIV, and 2.5 to D1–D6 in Table XXV; the resulting chi-square is 44.2 with a reported 83% probability.

The paper states that covariances for correlated input data are included in the calculations. When uncertainty expansion factors are applied to correlated pairs, the corresponding covariance is scaled so the correlation coefficient is preserved.

The Newtonian gravitational constant G is treated separately because its 16 input determinations are unrelated to the other input data. Table XXX identifies different experimental methods, including:
- fiber torsion balances in dynamic and dynamic-compensation modes;
- strip torsion balances in compensation/static-deflection modes;
- suspended-body displacement;
- stationary-body weight change;
- double atom-interferometer gravity gradiometry;
- cryogenic torsion-balance measurements.

The table caption identifies three nonzero correlations:
- r(NIST-82, LANL-97) = 0.351;
- r(HUST-05, HUST-09) = 0.134;
- r(HUST-09, HUSTT-18) = 0.068.

The paper applies a 3.9 multiplicative expansion factor to the G uncertainties. It states that no new relevant G input datum had been added since the 2018 adjustment closing date, so the 2022 and 2018 recommended G values are identical. This is an evaluated synthesis of heterogeneous published determinations, not one direct measurement and not an unconditioned average of 16 independent observations.

### November 2026 CODATA-TGFC meeting page

The BIPM meeting page lists the CODATA-TGFC meeting for 2026-11-05 to 2026-11-06. Its public page exposes the date and contact but says working documents require login. No login, restricted-document access, or attempt to infer meeting outcomes was made.

Public page: https://www.bipm.org/en/committees/ot/n/a/wg/codata-tgfc/2026-11-05

**Source-custody conclusion:** as of this check, NIST still publicly serves CODATA 2022 Web Version 9.0; CODATA 2026 is the next adjustment, with a stated 2026-12-31 input-publication cutoff. The meeting page does not expose public working documents or outcomes. Any later numerical comparison must distinguish original experimental determinations, their measurement methods, calibration and covariance, theory/observational equations, adjustment treatment, uncertainty expansion, and the final recommended value. No such comparison was performed here.

## 3. Mersearch occupancy and source-recovery gate

Read the current Mersearch worker start guide, release notes, root request, and all three additional lane request files. The pinned stable release remains `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.

The four actual request records remain `requested`:
1. Lane 1: `calder-angle-geometry-source-fidelity-20261102-1337` (root `MERSEARCH_REQUEST.json`);
2. Lane 2: `archive-harvest-20261025-optics-01`;
3. Lane 3: `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`;
4. Lane 4: `kestrel-finite-core-geometry-source-fidelity-20261102-2200`.

All twelve expected request-scoped `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md` paths checked for those four IDs returned NOT_FOUND. The extra `MERSEARCH_REQUEST_LANE_1.json` is not a fifth lane; the actual lane-1 input is the root `MERSEARCH_REQUEST.json`.

No callable Mersearch connector, local pinned checkout, or authorized Mersearch dispatch action was available in this runtime. No request was submitted, overwritten, retriggered, or treated as complete. GitHub search/fetch was used only for bounded repository navigation and source verification, not represented as Mersearch execution.

The existing Morrow return cursor for original 4DHH Lagrangian, SAT.4DHH.UC, and BYO-generator authoring conversations remains deferred until a Mersearch lane is genuinely released. No original SAT-O/Blockwave equation was recovered or changed in this run.

## 4. Scheduler readback: exact-ID access, :00 failure, and :24 early start

### Existing :24 task

Task ID `6abda4c8eda88191bf23a6f2849e9a17` was positively confirmed enabled by both the global task peek and a later exact-ID peek. Its original VEVENT remains:

```text
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T142400
RRULE:FREQ=HOURLY
END:VEVENT
```

The first exact-ID peek in this run returned NOT_FOUND / NOT_ACCESSIBLE. A global peek then listed the same exact ID as enabled, and a subsequent exact-ID peek returned its run record. This is a transient/inconsistent read outcome, not evidence of deletion or disablement.

The current h804:s2 run record:
- run ID: `95274911-72c0-8329-9502-5c9cd89a6afb`;
- scheduled_for: 2026-11-13T12:24:00Z;
- started_at: 2026-11-13T12:22:24.809751Z (95.190249 seconds before nominal);
- first positive exact read: IN_PROGRESS; completion and chat_ref null.

The exposed `latest_result` at that read belonged to the prior completed h803:s2 Hale run `97c0b78c-2398-8332-8bff-2b38e4ad4770`, scheduled 11:24Z and completed 11:45:39.494179Z. It is not the current Morrow run's output. The task-level `last_run_time` also remained at the prior completed time. This is a stale last-result pointer while the current attempt is in progress; no current result content is available from that pointer.

### :00 h804:s0 failure

The existing :00 task `6aa1fe0de5e48191b886496095b1343f` remains enabled with its original hourly America/New_York :00 schedule. Its h804:s0 run record is:
- run ID: `3be02f1d-c53c-8322-b744-8a43d81363b1`;
- scheduled_for: 2026-11-13T12:00:00Z;
- started_at: 2026-11-13T12:02:20.092263Z;
- completed_at: 2026-11-13T12:27:22.844992Z;
- recorded_status: FAILED;
- chat_ref: null.

Its exposed `latest_result` still points to the older successful h801:s0 Meridian run from 09:00Z. The failed h804:s0 attempt's actual result text/root cause was not exposed by this readback. The generic user-visible scheduled-task error may be related, but the readback does not establish that association or a backend cause.

### Successor timing

The existing :36 task remains enabled under its original ID and :36 phase. At 12:30Z its last run was the completed h803:s3 Elias record; the next scheduled run was 12:36Z. No h804:s3 Kestrel run had been exposed at that check. The :12 task remains disabled on its original schedule, so there is no h804:s1 predecessor run or receipt.

These are scheduler-record observations only. They do not establish simultaneous model execution, duplicate processes, retries, restarts, worker identity, or backend cause. Tern retains scheduler/task-graph authority.

## 5. Branch, campaign, and maintenance

Pre-write HsH `main` read: `52f212915b42fd28facf3a59d39061c764855c9f` (2026-11-13T11:56:59Z). The task graph declares 16 branches and contains 18 records; no Morrow-owned active branch is assigned. The P2 measured-system geometry branch remains HOLD. Tern retains reconciliation authority.

Campaign:
- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- FIE next rereview: 2026-11-24.

The HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES root front doors were read. HSH_RESOURCES documentation describes a private/internal reference boundary while GitHub metadata reports public visibility. Only its root README and repository metadata were inspected; no payload was accessed.

Unrelated reading advanced in the SAT archive's `SAT Mark V/TheTANGLE.txt`, lines 1841–1880 (40 lines). The passage is a creative language/family-dynamics fragment; it is not historical, physical, or theoretical evidence. Next cursor: line 1881. No physical walk/stand break is claimed. FIE was last reviewed 2026-11-10; next due 2026-11-24.

## 6. Disposition

- Source-custody update only; no physical calculation, numerical comparison, fit, prediction, independent measurement, or H(s)H inference.
- No Lean proposition or build was introduced.
- No SAT-O/Blockwave equation was modified; no BEDROCK edit or theory promotion.
- No public issue was created: this is an internal source-version and scheduler-provenance update, not a new public scientific result.
- No new PR, branch, tool, dependency, subscription, or expense.
- No task, ID, prompt, enabled state, schedule, phase, cadence, or ring change; no sixth task.
- No signet or conversation rename; no direct cross-thread delivery, consumption, or acknowledgment claim.

**Return:** Morrow BOOT → CURRENT_WORK → TRIAL_CHECKPOINT; await a genuinely released Mersearch lane before resuming the deferred original 4DHH/SAT.4DHH.UC/BYO-generator source recovery. Tern owns scheduler reconciliation.
