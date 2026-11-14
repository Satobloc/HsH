# Elias Kern h822:s3 | Candidate-freeze coherence and worldtube evidence gate

**Date:** 2026-11-14  
**Nominal slot:** 06:36Z  
**Run key:** `REVROT3-19-20261011:822:s3`  
**Ring selection:** Elias Kern (index 9) → Nadir Voss (index 10)  
**Disposition:** SOURCE-GROUNDED TRACK A RECONSTRUCTION / CANDIDATE-FREEZE VERSION-MIXING COUNTEREXAMPLE / NO POC-PR CHANGE / TRACK B STILL PENDING / PUBLICATION SUBMITTED_NOT_VERIFIED

## 1. Authority, identity, and scope

The deterministic ring calculation gives (h=822), (seq=5h+3=4113), and (4113\bmod19=9). The selected label is Elias Kern; the next label is Nadir Voss. This is a rotation label, not authentication of a ChatGPT instance, human identity, model, or thread.

The existing-thread-first search did not establish an authenticated current Elias thread. The only located direct Nathan instruction is the 2026-09-24 13:47 ET Track A assignment preserved in Elias and Tern inboxes: Elias operates and documents the sandboxed TOP/CENTRAL/BRANCH/HYDRA/THREADING prototype on bounded real workflow problems, independently but in communication with Sable and Tern's Track B. The raw originating conversation/message UUID and a standalone signed specialist charter remain unrecovered. This run is a source-grounded reconstruction, not historical-Elias participation.

The prototype read-first document explicitly says it is a sandboxed POC, not production authority, a settled architecture, or theory authority. Track A may exercise and propose revisions; it does not install project-wide workflow law. Track B independently decides KEEP / MODIFY / TEST / REJECT / DEFER. The current ELIAS-2224 EvidenceLedger/subject-scope disposition remains pending. The separate October 30 sticky-lifecycle response is not that disposition. Therefore no POC, PR, adapter, production, or Track B state was changed.

## 2. Live source snapshot and source boundary

Pre-work HsH main snapshot: `c60956832f4bf6d06777deb61120ea8a3300a7a5`.

Read before work:
- `BEDROCK.md`, including BR-006 and BR-008.
- Steering Charter 2026-10-26 and Phase Steering.
- Three Paper Campaign 2026-10-26.
- `NEW_INSTANCE_START_HERE.md`, Mersearch worker instructions, and the switchboard prototype read-first document.
- Revival Rotation V3, live worker workspaces/inboxes, task-branch graph, current receipts, and the existing Track A/Track B coordination record.
- HsH, SAT archive, and HSH_RESOURCES root READMEs.
- Elias's current workspace and historical direct-instruction record.

The V3 revival file is the available rotation control; the guessed V4 filename was not found and was not substituted. The immediate h822:s2 predecessor packet was not visible in the pre-start branch read. That is recorded as not yet available, not as evidence of non-execution or refusal.

HSH_RESOURCES was read only within the Elias-authorized prototype boundary: read-first, POC design, and the exact demo source. No private URL or code excerpt is included in the public submission. The internal report retains only the repository-relative source locator and blob identity needed for recovery.

### Exact prototype sources

- `info/WORKFLOW_SWITCHBOARD_PROTOTYPE_READ_ME_FIRST.md`, Git blob `e6b6bd6d413cddfcf43b37b1b1f01317c48caf86`.
- `info/WORKFLOW_SWITCHBOARD_POC.md`, Git blob `0a708813bac6e1e7dc763779ed080b6d7e27fd42`.
- `tools/workflow_switchboard_demo.py`, Git blob `49988a769389b2baf264a27d596ba7c3ff822b36`.

The POC design document specifies a synchronized recurrence:

```text
construct N → freeze hash H_N
       ├→ math(H_N)
       ├→ provenance(H_N)
       └→ adversarial(H_N)
             ↓ merge H_N
         construct N+1
```

It expressly warns that clock synchronization is not state synchronization and calls for a shared freeze/version ID.

The executable candidate state at source lines 171–184 contains an `id`, `stage`, and `checks` dictionary, but no freeze ID. The check aggregator at lines 266–271:
1. obtains the active candidate's `checks` dictionary;
2. merges new results with `checks.update(results)`;
3. checks only whether the three required check names exist; and
4. sets `checked_pass` when their stored status strings are all `pass`.

It does not compare candidate IDs, freeze IDs, source hashes, or check-run identities. The existing seven-assertion self-test at lines 331–339 has no candidate-freeze coherence assertion. The prior h784 byte-for-byte 7/7 self-test does not cover this condition; the full POC self-test was not rerun in this turn.

## 3. New source-derived counterexample

I executed a minimal Python replay of the exact `apply_checks` method body from source lines 266–271, using synthetic candidate IDs and freeze labels. This is a targeted method replay, not a byte-for-byte execution of the entire POC script.

### Mixed-freeze sequence

1. Candidate A / freeze H_A receives a passing `math_check`.
2. The active candidate ID changes to candidate B.
3. Candidate B / freeze H_B receives passing `adversarial_audit` and `provenance_prior_art` results.
4. The aggregator returns `checked_pass`.

The stored check records retain freeze IDs `[H_A, H_B, H_B]`, while the active candidate is B.

A second probe passes all three checks on H_A, changes only the candidate ID to B, and observes that the stage remains `checked_pass` with all stored checks still bound to H_A.

A same-freeze H_B control also returns `checked_pass`, as expected.

**Classification:** source-derived software counterexample to the documented version-coherence contract. It is not an observed production event, a full-POC test-suite run, a workflow deployment failure, a physical fixture, or an empirical result.

## 4. Required architecture improvement

The candidate-check merge needs an explicit immutable candidate-freeze identity.

### Proposed contract

- Define a content-derived `candidate_freeze_id` for the exact candidate package.
- Bind each check receipt to that freeze ID, check kind, status, method, output digest, and reviewer/exposure record.
- Preserve stale results append-only for audit, but exclude them from the active candidate's required-check set.
- A candidate revision creates a new freeze ID and an empty active-check set; prior checks remain historical.
- `checked_pass` is permitted only when all required check kinds pass against the current freeze ID.
- Reviewer/source independence is a separate evidence axis. A common freeze does not prove independent review, and different reviewer labels do not prove independent exposure.

For a physical geometry candidate, the frozen package should additionally bind:
- exact original SAT-O/Blockwave equation source blobs and dates;
- corrected equations as separate, non-overwriting artifacts;
- the worldtube/timesheet/projection/composition-map version;
- shared parameter and solver manifests;
- calibration and holdout split manifests;
- dataset, units, uncertainty/covariance, and preprocessing provenance.

This is a proposed workflow contract, not an implemented schema or a new theory premise.

### Software acceptance matrix

| Hypothesis | Shared frozen inputs | Observable | Comparator | Falsification condition |
|---|---|---|---|---|
| A candidate passes only when math, provenance, and adversarial checks all target one immutable version | Candidate ID + freeze digest + source/map/parameter manifest | Candidate stage | Current `apply_checks` merge | Any mixed or stale freeze still yields `checked_pass` |
| A candidate revision invalidates prior active checks without erasing history | New freeze digest; prior receipts retained as historical | Active-check set and stage | Current mutable `checks` dictionary | Candidate changes while old `checked_pass` remains active |
| Independence is not inferred from version agreement | Reviewer identity/exposure witnesses separate from freeze ID | Independence status | Same-freeze check set alone | A same-freeze result is represented as independently reviewed without an independent witness |

Calibration/holdout fields are not applicable to the synthetic software replay. They are mandatory proposed fields for a later real-data test; no physical dataset was used here.

## 5. Worldtube and source-authority consequence

BEDROCK BR-006 is ND + WB as a framework-internal premise, not demonstrated physics. The recovered October 17 source chain distinguishes:
- Nathan Direct message `4d62333e-9a90-4aee-a3cf-2513149fe84e` at 07:49:42.233Z: each completed release revolution adds braid history; long-term planetary-system rotation is expected to approach galactic rotation-curve behavior.
- Nathan Direct message `c293bf0e-6a8a-4f59-8e9a-c76ebb12a1f1` at 07:51:09.865Z: interbraid constrains the possible configurations of continuously interlocked worldtubes.
- Assistant message `e7001fa7-1b3e-41a3-bdb7-5cbd06eee29f` at 07:49:43.228Z: first introduction of the scalar (B(t)) relation.
- Subsequent user request and approval of the BR-006 wording are separately recorded in the Hale source-recovery receipt and the P3 braid-history-to-worldtube audit.

The scalar (B(t)) relation must not be relabeled Nathan Direct merely because it follows immediately after a direct premise. The candidate freeze must bind source role/ancestry and exact equation provenance as separate fields.

BR-006 requires cumulative braid history and an interbraid constraint on admissible worldtube configurations. It does not, by itself, supply a finite-core radius, a particular twist variable, a contact-surface construction, a constitutive tension law, a unique projection, or a numerical radial rotation-curve law. Those remain derivation and test obligations. The shape hierarchy still requires explicit projection and composition maps with domain, codomain, compatibility, and readout conditions.

No physical system, measured dataset, units/uncertainty bundle, fit, prediction, independent measurement, or falsification threshold was available or used in this workflow test. No physical calculation was performed. No SAT-O or Blockwave equation was modified.

## 6. Formalization status

A Lean target is straightforward to state: if a candidate is `checked_pass`, every required check record must have status `pass` and carry the current candidate freeze ID; changing the freeze must invalidate the active check set while preserving old receipts as history.

The existing PR #951 formalization was inspected, including `EliasRouteBudgetCoverage.lean` and `EliasWorldtubeEvidenceWitnessGate.lean`. The latter binds artifact locators/digests, source classification, source-to-formal trace, build evidence, and independent translation review, but does not bind the three candidate checks to one candidate freeze. PR #951 remains OPEN / DRAFT / UNMERGED. The current ELIAS-2224 Track B disposition is still pending.

No local Lean, Lake, or Elan executable was present. No Lean module was created, compiled, or run. No new PR, branch, POC patch, adapter, production schema, or CI dispatch was made. Lean proof of a future typed contract would validate only the formalized state-machine property, not the source-to-formal translation or any physical premise.

## 7. Mersearch, tooling, and repository coverage

No callable Mersearch action was exposed in this runtime. All four canonical Mersearch request files were fetched and remain `requested`:
1. `calder-angle-geometry-source-fidelity-20261102-1337`;
2. `archive-harvest-20261025-optics-01`;
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`;
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`.

No request was overwritten, retriggered, or replaced. Bounded GitHub search was used across HsH, the SAT archive, and HSH_RESOURCES as a fallback, not represented as a Mersearch execution or exhaustive search.

Existing switchboard POC, PR #951, PR #1133, and prior Math Hopper/Whirligig/Lean work were considered. SciSpace is available but was unnecessary for this software-contract question. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 8. Campaign and maintenance

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY; Orson Vay remains sole owner. No new Orson trial or study was initiated.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor-paper gate: missed / NOT READY.
- November 30 major-paper and December 14 full-theory gates remain separate.
- FIE was last reviewed November 10; next review November 24. No early rereview was due.

Unrelated reading advanced through the SAT archive's `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 701–740. Next cursor: **741**. This was a deliberate unrelated reading break, not a physical break or scientific result.

## 9. Publication and continuity

Public-safe summary submitted through the existing issue publisher:
- Issue #1727: [Candidate-freeze coherence counterexample](https://github.com/Satobloc/HsH/issues/1727).
- Submission ID: `elias-tracka-candidate-freeze-coherence-20261114t0636z-s3-001`.
- Embedded SHA-256: `2313e850e6b26a1aa31af15e05f2a1dc9287a0a0111b8f52b4b30c02a64c8618`.
- The issue envelope contains exactly the required four keys and the embedded digest matches the drafted content. At the final pre-close read, publisher comment and fixed-destination artifact were not yet visible.
- Status: **SUBMITTED_NOT_VERIFIED**. Do not retry, duplicate, or bypass the publisher. Carry this issue/submission ID to a later readback.

The next ring label is Nadir Voss. An optional geometry-test context packet is prepared as repository-only context, not a Track A assignment, task, review request, deadline, response obligation, or ownership transfer. Nadir's finite-core remit remains controlling. The separate Track B packet is optional context for the existing ELIAS-2224 record only; it creates no new review request.

No authenticated current Elias thread, direct cross-thread delivery, recipient consumption, or acknowledgment is claimed.

## 10. Final disposition

**The new result is a version-coherence counterexample in the sandboxed workflow aggregator.** It shows that three individually passing checks can be combined into a false composite pass when they refer to different candidate freezes. The appropriate repair is an immutable candidate-freeze binding with stale-result preservation and a strict same-freeze acceptance predicate. Implementation remains blocked pending independent Track B disposition.

No task, scheduler, cadence, prompt, phase, task ID, signet, or conversation name was changed. No sixth task was created.
