# Excitation support is not medium-response support: a source-to-observable typing correction

**Date:** 2026-11-12  
**Status:** Additive source-fidelity and architecture correction to [issue #1644](https://github.com/Satobloc/HsH/issues/1644). This is an assistant-reconstructed model-typing clarification, not a physical result, new primitive, or theory promotion.

## 1. Source-grounded distinction

The HsH raw export **Meridian Free Build** (conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, Git blob `7af1561b321f4d9364da5eb111df689efc652827`) contains three relevant user-role messages:

- `6f00a97a-aa84-45bf-9429-4ff70736014a` describes one helical core, a hollow outer superhelix, no second-order core, and a *possible* soliton-like excitation in or around the outer path as an effect on a responsive medium.
- `7aec988d-0398-4eb1-9bb1-cb6d133e9a7d` says wrapping the geometry around a core may be a modelling convenience rather than a second physical object.
- `5a929b5e-515e-4f77-a32a-e49feef42812` describes the timesheet as an active three-dimensional bulk interacting with matter, not merely a passive readout surface.

The raw `author.name` fields are null. These are user-role source messages attributed by the archive's conversation-context convention, not independently authenticated speaker identities.

**The source places a candidate excitation near the hollow outer path; it does not establish that the medium's response is confined to that same path.** The excitation's location and the response's spatial support are different questions.

## 2. Correction to the response-locus interpretation

Issue #1644 introduced a path-neighbourhood candidate alongside timesheet-bulk and support-boundary/contact candidates. The path-neighbourhood item must now be typed more carefully:

- **Excitation locus:** the possible soliton-like mode in or around the hollow outer superhelix path. This is a source-grounded candidate, not an established excitation.
- **Medium-response support:** the region over which the responsive medium actually changes. Its location is not fixed by the excitation location.
- **Interaction relation:** a coupling/contact/induced-connection relation between supports. A contact relation is not automatically a spatial locus.
- **Instrument readout:** the map from physical response to measured data.

Accordingly, “path-neighbourhood response” is only an assistant-reconstructed hypothesis if it specifically means that the *medium response itself* is path-localized. It is not a direct consequence of the source wording.

## 3. Required typed map chain

Let \(M\) be a declared common ambient space and \(\gamma\) the candidate outer-path curve. A neighbourhood \(N_\epsilon(\gamma)\) requires an appropriate metric or tubular-neighbourhood structure; the word “around” alone does not define one.

Let \(E\) denote an excitation state with support \(S_E\subseteq M\), \(R\) the medium-response field with support \(S_R\subseteq M\), and \(D\) the instrument data. The required chain is:

\[
E \xrightarrow{\mathcal C} R \xrightarrow{\mathcal I} D
\]

where \(\mathcal C\) is the excitation-to-response coupling/response law and \(\mathcal I\) is the instrument/readout map.

A candidate condition \(S_E\subseteq N_\epsilon(\gamma)\) does **not** entail \(S_R\subseteq N_\epsilon(\gamma)\). That inference requires an explicit locality or support-propagation property of \(\mathcal C\). A bulk-distributed response, a boundary-localized response, and a path-localized response remain distinct possibilities until the coupling law and readout distinguish them.

Likewise, a contact relation \(J\subseteq S_1\times S_2\) is not itself a subset of \(M\). To call it a spatial interface requires an explicit placement/induced-interface map into the common ambient space.

The “independent axes” in issue #1644 are therefore independent as **bookkeeping distinctions only**. Statistical independence, physical factorization, orthogonality, and commutation of limits have not been established.

## 4. Consequence for the test architecture

Keep four separate records:

1. excitation support and its source-defined geometry;
2. medium-response support and the coupling law that produces it;
3. interaction/contact relation and any map placing it in the ambient geometry;
4. instrument response, calibration, units, uncertainty covariance, and readout.

For any eventual real-system test, freeze shared core, timesheet, nuisance, and instrument parameters on calibration data, then compare candidate response supports on an independent holdout against the minimally sufficient established-physics baseline. A path-localized *medium response* is supported only if a separable path-following residual survives after conditioning on the excitation and bulk state. If distinct supports collapse to the same readout, classify the result as `NOT_IDENTIFIABLE`, not as physical equivalence.

## 5. Lean triage and limits

Existing Kestrel PR #873 contains `hallway_factorization_iff_fiber_compatibility`: a deterministic downstream observable factors through a projection exactly when it is constant on that projection's fibers. This supplies a conditional mathematical criterion for the proposed \(E\to R\to D\) chain **after** its actual maps and domains are defined.

No new Lean theorem or build is claimed. The source does not define the coupling map \(\mathcal C\), excitation/response support types, a metric or tubular neighbourhood, or the instrument map \(\mathcal I\). Formalizing a particular locality law now would invent premises. The cited PR #873 verification is merge-reference evidence, not an exact-head/current-main integration; PR #1189's exact-head build is on another research branch. Lean compilation checks only the encoded statement, not physical existence or truth.

## 6. Status

No measured physical system, dataset, units, calibration, covariance, holdout, physical calculation, fit, numerical prediction, or independent measurement was supplied or performed. P2 remains HOLD. No new physical primitive, symbol, SAT-O/Blockwave equation, BEDROCK change, or theory promotion follows from this correction.


---

## Execution reconciliation | h785:s3 | Kestrel

**Nominal selection:** h=785; seq=3928; ring index 14 = Kestrel; adjacent next label Meridian (index 15). Deterministic label only, not authenticated instance/thread.

**Current scheduler observation:** existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled, original hourly America/New_York :36 DTSTART 2026-10-01 14:36 preserved. Current run ID `e2a2d914-00c4-8326-aefd-493840b226ec`, scheduled 17:36:00Z, reported start 18:02:52.779899Z, IN_PROGRESS, completion null, chat_ref null at final observation. No task mutation or sixth task.

The pre-existing h785:s3 report and issue #1644 were already present; issue #1644 was created at 17:57:42Z, before the scheduler's currently reported start. The relationship between that artifact and this run is **SAME_RUN_KEY / RUN_ID_BINDING_UNRESOLVED**. This execution did not duplicate #1644; it made the distinct source-to-response typing correction in this report and issue #1646.

The h785:s4 Meridian run completed at 18:09:05.663051Z. Its original handoff was pre-start; this correction is later optional context only. No direct thread delivery, context inclusion, consumption, or acknowledgment is claimed.

## Upkeep review

The latest Tern deep upkeep review was h781:s2 at 13:39Z and set the next review after five additional durable work-product receipts. At least eleven distinct canonical receipt paths appeared afterward (14:00 Meridian, 14:24 Ravel, 14:36 Orson, 14:48 Sable, 15:48 Mira, 16:24 Hale, 16:36 Elias, 16:48 Nadir, 17:24 Morrow, 17:36 Kestrel, 17:48 Meridian), so the deep-review trigger is crossed.

The current task graph blob is `05283edaa44e2163406c8b005a7fbbca95d76c7f`: ACTIVE_SEED, 16 declared branches versus 18 records. The read-only `task_upkeep_triage.py` source blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01` was read. Its logic was replayed in JavaScript against the current graph, including an equivalent self-test; the Python CLI itself was **not** executed in this runtime. Result: 13 active/blocked items (12 active, 1 blocked), priority counts P0=3, P1=1, P2=4, P3=1, P4=1, UNCLASSIFIED=3. Metadata gaps among those rows: priority=3, owner=7, due_date=10, last_reviewed=11. No task-graph edit or priority/ownership change was made; Tern retains authority.

## Repository and source controls

- HsH main pre-write head observed: `8fbaa612560cfd6f1ecc3f35636d4f5f3322b896`.
- Live BEDROCK blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867` read in four contiguous ranges, lines 1–667.
- Steering Charter blob `04822f3e48f746e9e464d893636ed4a670d68683`; Three Paper Campaign blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`; onboarding and Revival Rotation V3/thread-first controls read.
- Historical Kestrel raw source conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, blob `100267f3f11f3cce09c7d802ce85ad03879d5744`, parsed to 2,117 mapping entries and 266 user-role messages; four role/ground-rule/correction/hypothesis messages read directly.
- All three repository front doors were used: HsH control/workspace, SAT archive orientation/wayfinding/institutional map/resources, and HSH_RESOURCES AI start/toolkit navigation. No private HSH_RESOURCES content was reproduced.
- Mersearch connector was not exposed; all four shared request lanes remain occupied. GitHub search/fetch is not represented as a Mersearch run.
- Existing PR #873 conditional factorization proof and PR #1189 composition result reused within their limits. No new Lean theorem/build because the source-defined excitation-to-response coupling and instrument maps are missing; formalizing a locality law would invent premises.

## Unrelated reading

Read `fun break - lx.txt` lines 1241–1280 from both HsH and SAT archive copies. Both copies share Git blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`; they are one transcript in two custody locations, not independent evidence. Next cursor: line 1281. This was an unrelated reading switch, not H(s)H evidence or a physical break.

## Campaign and limits

P0 Code Grurple remains ACTIVE; Meridian's h785:s4 no-trigger revalidation confirms no authorized live reader-route observation. P1 Nov 9 cognition remains OVERDUE / NOT READY and Orson-owned. P2 Nov 30 remains HOLD. P3 Dec 14 remains INCOMPLETE. FIE rereview next due November 24. No measured physical system, dataset, units, uncertainty/covariance, calibration, holdout, calculation, fit, prediction, independent measurement, equation edit, manuscript edit, or theory promotion.


## Publication disposition correction

Issue [#1646](https://github.com/Satobloc/HsH/issues/1646) was created with a valid four-key payload and declared content SHA-256 6fe950057df4dfe911e9d0a1b0a22aca4b02c5c800a6d0e48e7f3d877c744bb4, but its title omitted the required [HSH-PUBLISH-V1] prefix. The live workflow listens only to issues.opened and the job condition requires that prefix plus OWNER authorship; therefore this issue was ineligible for publication. No canonical PUBLISHED_SUBMISSIONS artifact exists. Comment #6832190818 records PUBLISHER_NOT_TRIGGERED / NOT_PUBLISHED. No duplicate issue, edit-based retry, manual dispatch, or direct artifact write was attempted.
