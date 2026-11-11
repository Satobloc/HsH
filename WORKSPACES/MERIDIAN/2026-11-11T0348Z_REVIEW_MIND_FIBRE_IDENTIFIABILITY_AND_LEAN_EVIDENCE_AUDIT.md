# Meridian h747:s4 | Review-MIND: archive-projection identifiability and Lean evidence audit

**Disposition: SOURCE-BOUND COGNITIVE-PROVENANCE REVIEW COMPLETE; EXISTING FACTORIZATION THEOREM REPLAYED; CROSS-LANE LEAN EVIDENCE DISTINGUISHED; ORSON P1 PROTECTED; NO P0 RE-ENTRY OR THEORY PROMOTION.**

## 1. Rotation, occurrence, and identity boundary

The controlling scheduled occurrence is **2026-11-11T03:48:00Z**.

- Nominal UTC hour: h = 747.
- seq = 5(747)+4 = 3739.
- 3739 mod 19 = 15.
- Selected ring label: **Meridian**, index 15.
- Successor: **Mercer**, index 16.
- Run key: `REVROT3-19-20261011:747:s4`.

The exact :48 automation remains enabled under task ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with its original hourly America/New_York :48 VEVENT and prompt unchanged.

The latest ID-specific scheduler readback reports:

- Run ID: `defd5db1-8c38-8321-b38c-9144fd932cd1`.
- scheduled_for: `2026-11-11T03:48:00Z`.
- latest started_at: `2026-11-11T04:12:35.932857Z`.
- recorded status: `in_progress`.
- completed_at: null.
- chat_ref: null.

The same run ID was previously observed with started_at `03:44:33.236384Z`. The latest field is 28m02.696473s later. This is a same-run-ID start-field mutation, not evidence of a retry, restart, duplicate execution, or backend cause. Tern's existing inbox and the Kestrel h747:s3 handoff already contain this exact 04:12 observation; **no duplicate scheduler note was added**.

The task-level last_run_time remains `03:35:21.935216Z`, and latest_result belongs to the older Nadir h746:s4 run `2a909d52-23e0-832a-ab0e-f80593547021`, not the current Meridian occurrence. It is not attributed to this run. No authenticated current Meridian conversation was established.

## 2. Historical specialist authority and active boundary

No standalone, direct Nathan-authored Meridian role-charter file was recovered. The historical remit was reconstructed from original user-role messages in the two raw Meridian exports:

- `d21e251df093013903cc19789ded562f83b6e6ea`
- `7af1561b321f4d9364da5eb111df689efc652827`

The current Meridian `TRIAL_CHECKPOINT.md`, `SOLVER_HARNESS/README.md`, and historical continuity spine were also read. The source-grounded remit is geometric-solver work around Whirligig/Donut, UI/TX, Three Spheres, HAGALAZ, exact maps/operators/representations, reproducible controls, failure analysis, and independent comparison with Mercer. The harness requires sharing frozen contracts and outputs while keeping implementation reasoning siloed.

That broad historical remit is currently narrowed by the live Code Grurple assignment: **Meridian is limited to Paper A accepted-R1 presentation support**, subordinate to P0. HAGALAZ remains backseat; the solver harness is sandbox-only. No authorized browser/Sites editor/owner-preview context or new P0 re-entry trigger was found. No route probe, manuscript change, solver implementation, or P0 ownership change was made.

The selection label is not an authenticated ChatGPT instance or historical thread. No cross-thread participation or delivery is claimed.

## 3. Main result: an archive-projection identifiability criterion

### 3.1 Existing Nadir theorem: actual exact-head replay

I independently inspected Nadir's existing `NadirWitnessCarryingComposition.lean` in PR #1189 and fetched the actual Actions job log.

- PR: #1189, open/draft/unmerged.
- PR head: `58520f72b728f70e38c2e20192f439df9f334d92`.
- Merge commit recorded in PR metadata: `4911522718fa04a1224cacf917a7d2360783e56d`.
- Actions run: #42953033586.
- Job: #130301572681.
- Lean 4.34.0; Lake 5.0.0; 8,956 build jobs.
- The workflow explicitly checked out the PR head and asserted expected checkout ref = actual checkout commit = `58520f72b728f70e38c2e20192f439df9f334d92`. The environment's GITHUB_SHA was the merge commit, but the explicit checkout-identity assertion passed.
- No `sorryAx`, bare `admit`, or compiler error was found in the captured log.
- Tests, lint, nanoda/Leanchecker, and global axiom audit were skipped or disabled.

The new module proves that a deterministic range-to-range factorization exists exactly when the target map is constant on every fibre of the observed projection. It also proves uniqueness on the projected image and composes two such induced maps while carrying the intermediate image witness.

Captured theorem-specific axiom outputs:

| Theorem | Axioms |
|---|---|
| `inducedRangeMap_factors` | `Classical.choice` |
| `rangeFactorization_iff_fiberwise` | `Classical.choice` |
| `inducedRangeMap_unique` | `Quot.sound` |
| `twoStage_witness_carrying_composition` | `Classical.choice` |

These are standard Lean axioms. This is an actual exact-head compile, not a global axiom audit, complete verification suite, or independent mathematical review.

### 3.2 Kestrel comparison: successful merge-reference build, not exact-head verification

I independently checked Kestrel PR #873 and its workflow job.

- PR head: `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`.
- Merge reference: `78d45712dbdc8cc6543d50f93fb9b95e2fd4d84e`.
- Actions run: #42955799035.
- Job: #130310470259.
- Build succeeded with 8,956 jobs.
- The actual checkout/GITHUB_SHA was the merge reference `78d45712...`; the job did not contain Nadir's explicit exact-head checkout-identity assertion.

Therefore the Kestrel result is a successful **merge-reference build**. It is not equivalent in verification strength to Nadir's exact-head-asserted build. Both workflows skipped broader checks including tests, lint, nanoda/Leanchecker, and global axiom audit. No false equivalence between these CI results is asserted.

### 3.3 Proposed cognitive-provenance instantiation

The Nadir theorem suggests a precise test for claims about independent agents or source exposure.

Let:

- A map each complete execution history to its archived record.
- I map each complete execution history to the target identity partition or exposure graph.
- D be a deterministic decoder from the archived representation to that target property.

A decoder satisfying D(A(h)) = I(h) exists only if:

`A(h) = A(h')  implies  I(h) = I(h')`

for every pair of complete histories in the domain.

In words: **the property being claimed must be constant across every pair of complete histories that collapse to the same archive record.** Otherwise, the archive cannot determine that property.

This is an application proposal using the already-compiled generic theorem, not a separately formalized or compiled cognitive theorem. The current archive does not expose the complete execution-history domain needed to establish the fibre condition.

### 3.4 Actual Orson archive negative control

I independently parsed the raw Orson conversation export:

- Conversation ID: `6acb7e3a-c40c-83ea-87f1-9d87c46951cd`.
- Raw blob: `e355c539ae423455ebb62662576f818938fecc78`.
- 128 mapping nodes; 127 message objects.
- Roles: 114 assistant, 2 user, 11 tool.
- Model metadata: `gpt-6` on 123 messages; `gpt-6-thinking` on 2; 2 messages without a model slug.
- All 19 fixed ring labels appear as assistant-authored role headings. A strict role-heading signature yields 47 occurrences. Broader narrative headings were excluded from that role-heading count.

This is one archived conversation containing 19 role labels and two model slugs. It is **not** evidence of 19 independent agents, 19 authenticated ChatGPT threads, or a multi-agent group experiment. The archive does not provide a per-label execution ID, prompt hash, context digest, independent session identity, or complete source-exposure graph. The identity partition remains unresolved: the evidence supports the counts above, not a claim that there was either one agent or nineteen.

The useful methodological separation is:

1. Conversation identity.
2. Individual model invocation identity.
3. Model slug/version.
4. Human-assigned worker/role label.
5. Context and source-exposure ancestry.
6. Evaluator identity and exact input/output trace.

These are different data types. A worker label is not an execution ID; a model slug is not an agent identity; a conversation ID is not proof of independent source exposure.

### 3.5 Disconfirming experiment design, not executed

For future human-LLM or agent-group work, record one immutable provenance row per actual invocation:

- run/execution ID and conversation ID;
- message IDs and parent-message edges;
- model slug and exact version;
- prompt hash and context digest;
- source IDs and exposure timestamps;
- tool-call IDs and returned artifact hashes;
- evaluator ID, exact judge-input digest and output;
- selected prior-message/pair index;
- retry/error state and request ID.

Then compare a full provenance graph with a deliberately reduced archive view. Ask blinded reviewers to infer the identity partition and source-independence structure from the reduced view. The design is disconfirmed if the reduced representation appears sufficient only because role labels leak the intended grouping, or if two actual complete histories with the same reduced record have different identity/exposure partitions.

Human participation would require consent and privacy controls. No human session, new model trial, API call, or result was fabricated or run here.

## 4. Orson P1 protection and publication check

Orson's current role charter, P1 protocol freeze, latest h744:s3 receipt, and current work card were read.

The P1 issue #564 remains OPEN and was last updated 2026-11-04. The November 9 minor-paper gate remains **OVERDUE / NOT READY / ORSON-OWNED**. The separate requirements for revision-tracked manuscript source, independent review, and readable PDF/reader are not met. The November 11 published methods supplement does not close the paper gate.

I independently checked issue #1574 and its published artifact. The issue body is an HSH-PUBLISH-V1 JSON envelope; after parsing the envelope, its `content` field matches the 10,108-character `PUBLISHED_SUBMISSIONS` artifact exactly. This confirms the supplement's content readback. It remains a descriptive archival sensitivity analysis, not a new model trial, human study, causal judge-effect estimate, finished manuscript, or multi-agent consensus result.

The supplement correctly distinguishes 850 eligible later-question rows from 1,150 total rows, the five-model exact orchestrator intersection (5 of 6 configured models), and the 17-file archive-wide panel with unresolved run lineage. The common GPT-4o-mini judge is fixed across conditions; its causal contribution cannot be identified from that panel. No independent reviewer, source-LaTeX package, or readable P1 paper PDF/reader was established by this check.

Orson retains sole P1 ownership. No P1 scope, branch, manuscript, PR, or paper gate was changed.

## 5. Geometric interpretation and physical-observable boundary

Kestrel's scale-location contract keeps distinct four loci: generator-parameter scaling, finite-core profile/thickness, braid/constituent organization, and parent/child/coarse-graining/readout. These cannot be collapsed into one scalar merely because the same phrase “scale factor” is used.

Nadir's theorem is a useful composition template only after every projection and composition map has an explicit domain and codomain and the relevant fibre-constancy condition is stated. The current formalization uses total functions. A physical application may need to restrict the maps to explicitly declared admissible-state subtypes; if a map is partial, its admitted domain and the next-map domain must be explicit. The range witness proves image membership and supports deterministic composition. It does not prove injectivity, losslessness, invertibility, or physical equivalence.

This is a common mathematical pattern between information and geometry, **not an equivalence between cognitive systems and physical structures**. No source-defined SAT4D, worldtube/timesheet, braid, or HAGALAZ map was instantiated in Lean here.

The CREMA muonic-³He charge-radius anchor cited in the Kestrel materials is not a braid-envelope radius. No raw spectroscopy/covariance package or independently defined map from that observable to a finite-core/braid quantity was established. No physical calculation, fit, prediction, or observational validation was performed. P2 remains HOLD. WWRD climbing-rope mechanics remains a first-blush heuristic, not a physical equivalence.

No SAT-O or Blockwave equation was transcribed, corrected, or changed in this run.

## 6. Live workshop state and controls

- HsH branch used: `main`.
- Latest observed main commit at this check: `de5d5510b8ce8f352454fedb0c4a4ed5b46bbded`, a public-display discovery refresh only.
- Task graph blob: `628fa5eba8da29a083271a545050ae3c90739bec`; updated 2026-11-10T17:06Z; branch_count=16, actual branch records=18. Tern retains reconciliation ownership; no graph edit was made.
- P0 Code Grurple remains ACTIVE. Meridian's assignment remains Paper A accepted-R1 presentation support only. Both Paper A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED; no browser/Sites editor context, owner preview, deployment identity, or new P0 trigger was found. No route probe.
- P1 November 9 remains overdue/not ready and Orson-owned.
- P2 November 30 remains HOLD.
- P3 December 14 remains incomplete.
- FIE was reviewed 2026-11-10; next review due 2026-11-24.
- Meridian's last unrelated reading break was 2026-11-09, *The Importance of Being Earnest*, lines 984-1462; next cursor 1463. No repetitive reread was added.
- The four current Mersearch request files remain `requested`: Lane 1 `calder-angle-geometry-source-fidelity-20261102-1337`; Lane 2 `archive-harvest-20261025-optics-01`; Lane 3 `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`; Lane 4 `kestrel-finite-core-geometry-source-fidelity-20261102-2200`. No Mersearch connector/action is exposed in this runtime, and no new request, overwrite, or retrigger was made. Known raw exports were followed directly by their pinned blob SHAs; that is not represented as a Mersearch search.
- Existing solver harness remains SANDBOX and subordinate to P0. Math Hopper/Lean PR and Whirligig materials were checked as existing resources; no new tooling, fork, subscription, dependency, or API spend was introduced.
- Mercer h748:s0 had already completed and produced a later optional packet to Ravel. Any handoff from this h747:s4 report is therefore late optional repository context only.

The Mercer h748:s0 publication correction for issue #1580 reports a rejected publisher comment and no artifact. That is Mercer's existing submission, not this report. No duplicate issue, direct-write bypass, or retry was attempted.

## 7. Disposition and next cursor

This run contributes a source-bound bridge between the existing fibre-factorization theorem and cognitive provenance: **identity, exposure, and feedback claims are recoverable from an archive only when the target property is constant on the archive projection's fibres.** The Orson archive provides a real negative control against equating role-label count with independent-agent count.

The cognitive instantiation remains a proposed mapping, not a new Lean theorem or an empirical group result. Nadir's exact-head build and Kestrel's merge-reference build remain distinctly classified. Orson's P1 remains protected and NOT READY. No physical calculation, P0 re-entry, paper-gate advancement, theory promotion, branch creation, PR, public issue, or Mersearch request was made.

**Next exact operation:** keep Meridian within Paper A accepted-R1 presentation support while P0 is active; do not reopen HAGALAZ from this review. For future cognitive experiments, require the invocation/provenance manifest before making agent-count, independence, feedback, or consensus claims. For any geometric hierarchy, instantiate the existing factorization theorem only after source-defined maps, admissible domains, units, and fibre conditions are explicit.

No task, ID, schedule, phase, cadence, signet, or conversation name was changed. No sixth task was created.
