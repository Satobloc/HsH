# P0 visible-disclosure crosswalk for Code Grurple

**Run:** `REVROT3-19-20261011:1040:s3`  
**Worker label:** Mercer, ring index 16; next label Ravel, index 17  
**Classification:** assistant-authored independent Paper A/B presentation QA; not Nathan Direct, not a formal PR review, and not a theory premise.  
**Disposition:** `FORMALIZATION_REFINEMENT_REQUIRED / NO_CODE_CHANGE / LIVE_ROUTE_NOT_OBSERVED`

## 1. Authority and scope

The nominal :36 slot is 2026-11-23T08:36Z, so `h=1040`, `seq=5h+3=5203`, and `5203 mod 19=16`. The current Code Grurple roster assigns Mercer **Papers A+B presentation QA only**; Tern retains P0 release/standdown authority and Meridian owns implementation. Manuscript content, renderer, site, and deployment were not changed.

The historical Mercer source is the raw `Quantum Gravity and Experiments` conversation (`6a3a2037-1a90-4f8d-8c20-35b8f4c7c6f4`), blob `d828fef5352045cb4d9486fdbeabd04043c4c119`; direct user remit message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` at 2026-10-01T20:56:07Z. That historical research remit is superseded here by the current P0 QA assignment. No separately signed Mercer charter or authenticated current Mercer thread was found; the current run's `chat_ref` is null. This is repository-grounded assistant work, not participation by a historical Mercer instance.

## 2. New finding: internal integrity is not visible disclosure

The current P0 source policy requires the reader to preserve source identity, date, status, and provenance. The Code Grurple roster additionally requires visible SANDBOX classification and visible review/provenance affordances. See:

- [`CODE_GRURPLE_ROSTER.md`](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md), lines 19, 28, 53–55; blob `cc96c0bfafc95c54e7960899c7306031e5abce17`.
- [`PRESENTATION_GATE.md`](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_GATE.md), lines 15, 38, 50; blob `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.

At PR #1471 head `60df9a77d938689910a96640cb649eb9f462fa58`, `ReaderAcceptanceChecks` contains 12 Boolean checks. It includes `artifactProvenancePinned`, `audienceCalibratedPrefacePresent`, and `technicalReaderPointersPresent`, but no separate `reviewStateVisible`, `reviewStateMatchesFeed`, `provenanceAffordanceVisible`, or `provenanceTargetMatchesPinnedSource` fields. The associated `RouteObservationWitness` carries a capture digest and binding flags, but no typed visible-disclosure witness. Module blob: `82e38343f307f32e846d9758fbd4d65f6a73c812`.

These are not interchangeable properties:

- `artifactProvenancePinned` is an internal source/derivative integrity assertion; it does not prove that a reader sees a provenance affordance.
- `technicalReaderPointersPresent` does not prove that a source/review provenance link is visible or points to the pinned source.
- `audienceCalibratedPrefacePresent` proves presence, not that the displayed review state is correct.
- A capture digest proves the captured object's integrity, not that the required status and provenance disclosures appear within it.

The prior Meridian semantic-anchor work already covers the two SANDBOX markers. This report does not reopen that visual test. The new delta is the missing formal distinction for **review-state disclosure and visible provenance affordance**, including their bindings to canonical feed/source identity.

## 3. Minimal logical witness

An assistant-side Boolean counterexample was evaluated against the exact 12-field predicate: set all 12 current fields to `true`, including `artifactProvenancePinned`, `audienceCalibratedPrefacePresent`, and `technicalReaderPointersPresent`, while setting the absent disclosure conditions to false. The current predicate evaluates `true`; an extended predicate requiring visible review state and visible, correctly bound provenance evaluates `false`.

This is a logical coverage witness reconstructed from the source predicate, not a Lean run, not a counterexample to the existing Lean theorem, and not an observation of a live page. It shows that the present abstraction can accept a state that fails the full roster-level disclosure contract.

## 4. Proposed typed refinement

Add a `VisibleDisclosureWitness` to the route observation, with at least:

- `sandboxClassificationVisible` (retain the already documented semantic-anchor test);
- `reviewStateVisible`;
- `reviewStateMatchesFeed`;
- `provenanceAffordanceVisible`;
- `provenanceTargetMatchesPinnedSource`.

Require the disclosure witness as part of `readerAcceptanceChecksPass` / route acceptance, and add a theorem that an accepted route implies every required disclosure condition. Add negative regressions for missing review state, a review state that disagrees with the pinned feed, a missing provenance affordance, and a provenance target that differs from the pinned source blob.

The current feed deliberately distinguishes the papers: Paper A is `sandbox_staged_accepted_r1`; Paper B is `sandbox_posted_reviewed_r1`. The reader must preserve the appropriate state for each paper rather than normalizing both to a generic sandbox label. Paper B's `site_version=34` and 2026-09-23 `posted_date` are feed metadata, not proof of a current deployment or route. Paper A has no `site_version` or `posted_date`; neither absence nor presence substitutes for a route witness.

## 5. Current P0 evidence

The latest discovery snapshot is blob `b097ae0e6deb5e21e028aa01a30851d5f4121f84`, 31,022,711 bytes, updated 2026-11-23T09:01:11Z. It embeds HsH source commit `706ddcdf8bf9fc626a2df7d0f35360254ca6f78c`; current main is `77f3384aded3026d7a95e6ae5914bae6dc396224`, one commit ahead with only `PUBLIC_SITE/generated/discovery.json` changed. Snapshot freshness at generation: **PASS**.

Snapshot counts: 17,427 documents; 10,495 workspace records; all 10,495 have generic reader targets; 10,252 have excerpts; zero workspace records are marked `PRESENTATION_PENDING`; 48/48 rolling-docket entries are workspace records. Paper A and Paper B both retain generic raw-workspace reader targets; Paper A has no excerpt and Paper B has a 1,400-character excerpt. Source-layer record safety: **FAIL**. Live reader-route acceptance: **NOT OBSERVED**.

All 11 protected P0 source/control objects were independently re-fetched at current main and matched their pinned blob identities. The previously recorded ordered-vector digest remains `dfc562f00530d763ec936cab7c4e2ca498f3cd87e07ab87dd7e97c6a94b5f8d5`.

- [P0 incident #1747](https://github.com/Satobloc/HsH/issues/1747), latest prior currentness update #7095706451.
- [Typed reader-target proposal #2411](https://github.com/Satobloc/HsH/issues/2411) is `PUBLISHED_VERIFIED`; its artifact SHA-256 is `3824d75f77bcbe59f9f9b04dc9c04b4a0599a8e3e96561047733ab28b66a5281`.
- [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN/DRAFT/UNMERGED. Its stale-fallback sanitizer is not on main; the new source/test blobs have not received the full module suite or `py_compile`.
- [PR #1471](https://github.com/Satobloc/HsH/pull/1471) remains OPEN/DRAFT/UNMERGED. Existing exact-head Actions run #45008989924 succeeded for head `60df9a77…`; it verifies the existing 12-check model, not this proposed disclosure extension.

No route was probed, no live rendering or deployment was inferred, and no site, feed, manuscript, renderer, PR branch, or protected P0 object was changed.

## 6. Verification and limits

The local runtime has no Lean, Lake, or Elan executable. No new Lean theorem or build was attempted because Mercer’s current assignment is independent presentation QA, not implementation. The Python Boolean witness above is not Lean verification. Meridian should implement the typed disclosure witness in the authorized formalization branch and run exact-head Lean/Mathlib CI; Mercer can then independently verify the rendered A/B disclosures only when an authorized live browser/route context is available.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, falsification threshold, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 7. Source, workflow, and campaign preflight

Read live HsH BEDROCK (blob `2629ab29a5838d933c31727455553d206577a258`), Steering Charter (`9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`), Three Paper Campaign (`2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), three-repository onboarding (`fe40260cda5ce360909f2adfd64a3cc3e2c92a05`), New Instance Start Here (`4efd2b899e3ead7785cb87b2458f758240590a94`), and V3/V4/thread-routing revival controls (`7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`, `6761337dfcd0847226ee7baad84db0a9c496760a`, `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`). Also read the SAT archive root README (`8cc300ba25a98dda803f6a0005bee9d97c3814ef`) and HSH_RESOURCES root README (`1433b65480a04b1bd4ed64e4b234c3ecf1b576f0`); no private HSH_RESOURCES payload was opened.

All four Mersearch lanes remain occupied. Lane 2 has a request-scoped manifest/receipt but no verified release; lanes 1, 3, and 4 have no request-scoped output/readback. No request was overwritten or retriggered. No local Mersearch executable, Lean/Lake/Elan installation, or repository checkout is present. No new tooling, fork, dependency, subscription, or paid endpoint was introduced.

## 8. Continuity and campaign

- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition remains OVERDUE / FROZEN / NOT READY / ORSON-OWNED.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- FIE last full review: November 20; next due December 4.
- Last unrelated-reading break: November 21; no repeat due.
- Task graph remains 18 records against 16 declared; no graph mutation.
- Existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781`, hourly America/New_York :36 schedule, Worldtube phase, and enabled state were preserved. No sixth task was created.

**Next:** route this refinement to Meridian through the existing PR discussion and retain Tern's P0 release authority. Ravel is the next ring label, but the current h1040:s4 :48 run was recorded failed with `chat_ref=null`; its cached result belongs to the preceding Tern run, not Ravel. The next eligible Ravel :48 slot is `REVROT3-19-20261011:1059:s4` (2026-11-24T03:48Z). Any repository packet is optional context for that future run, not delivery to the failed h1040:s4 execution.
