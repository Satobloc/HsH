# H937:S3 | Temporal producer-event join at the existing P2 freeze

**Nominal slot:** 2026-11-19 01:36Z  
**Run key:** REVROT3-19-20261011:937:s3  
**Selection:** h=937; seq=5h+3=4688; 4688 mod 19 = 14. Kestrel is ring index 14; Meridian is next, index 15.  
**Participation:** source-grounded assistant reconstruction, not authenticated participation by a historical Kestrel instance or current Kestrel thread.

## Executive result

This run adds one explicit composition contract between the existing P2 comparison-freeze lineage, the proposed SourceRunWitness, the TemporalEvidence event records, and the H936 producer-quiescence ordering.

The missing piece is no longer another interval-order theorem. It is the typed identity join that lets the already-proved chronology apply to the same actual producer execution, the same comparison freeze, and the exact prediction bytes.

This is a proposed manifest-level adapter at existing boundaries. It does not add a physical mechanism, a new event kind, a new ComparisonFreeze, a new evidence axis, or a new P2 gate. It is not an adopted schema or implemented runtime validator.

## Kestrel role and source boundary

Kestrel's recovered source conversation is 6ab070ce-2384-83e9-b76f-4661c55867c4, raw Git blob 100267f3f11f3cce09c7d802ce85ad03879d5744. The blob parsed to 2,117 mapping entries and 266 user-role messages. Direct role-defining user messages include c6803d67-a76f-48e4-bf71-f49cb7b224ee, 3c07680d-5205-48a3-93d5-ce33a8cf86a6, fc9b147e-b138-44ac-a48b-b81593e3c3e9, and f15aac1c-0a31-4e98-b461-6ca872035315.

Those sources define Kestrel as a trust-first, forward-looking, cross-boundary synthesis companion. Kestrel is not the primary auditor, skeptic, provenance adjudicator, mathematical verifier, or experimental-data acquisition lane. This one-run Lane 36 overlay connects already-existing specialist outputs rather than duplicating their audits. The broad working premise remains an internal planning assumption, not a public theory conclusion.

## Existing source surfaces

1. **ComparisonFreeze:** P2 issue #1735 and the existing P2 matrix #1855 bind the H0/H1 comparison, shared observation, calibration, covariance, shared parameters, holdout, comparator, analysis, and decision rule.
2. **Snapshot-bound geometry maps:** Kestrel H880 issue #1845 binds source-derived map edges to exact source snapshots and locators. Kestrel H892 issue #1876 composes source snapshot, geometry map, formalization/build/review, and acquisition/dependency profile at the existing ComparisonFreeze boundary.
3. **Freeze-event lineage:** Kestrel H918 issue #1962 binds map/index/readout/model witnesses and prediction/holdout/evaluation artifacts into one comparison-freeze lineage.
4. **TemporalEvidence:** Aldus draft PR #1860 defines evidenceId, subjectId, actorId, comparisonId, eventKind, eventTime, observedAt, sourceId, sourceLocator, observationMethod, coverageId, and epistemicStatus. Its EventKind vocabulary already includes runStarted, runCompleted, predictionSealed, and holdoutUnblinded.
5. **ChronologyBoundP2Bundle:** the current draft carries predictionSeal and holdoutUnblinding records. Both are bound to the same comparison ID; the existing subjectId convention for those two events is the comparison ID. The bundle does not currently carry the runStarted and runCompleted records or a typed reference from those records to a producer witness.
6. **SourceRunWitness:** Elias's proposal, issue #1768 and H935 report issue #2026, identifies exact execution namespace, provider run identity, attempt identity when exposed, source, harness, command, environment, frozen inputs, output digest, result, and time provenance. It remains proposed, not an adopted P2 field or implemented manifest type.
7. **ProducerQuiescence:** H936 issue #2035 and draft PR #2032 add the temporal requirement runCompleted before predictionSealed before holdoutUnblinded. Exact-head Lean run #44432360003 succeeded on head aad65f2dfd4edb216b6b0fe2dc12adfacaf87cc5. The theorem consumes abstract TimeIntervals; it does not consume TemporalEvidence or SourceRunWitness.

## The exact composition gap

The existing surfaces establish two different things:

- The comparison-freeze chain identifies which models, maps, readouts, data, calibration, and evaluation belong to one comparison.
- The ProducerQuiescence theorem establishes a conditional ordering between supplied time intervals.

They do not yet establish that the runStarted and runCompleted event records refer to the same SourceRunWitness that generated the exact output named by the prediction seal.

In particular, the H936 theorem's premise that completion and sealing are source-bound to the same provider execution and comparison freeze is still an external premise. The current ChronologyBoundP2Bundle does not discharge it. This is an admissibility/composition gap, not evidence that any existing prediction was fabricated or that any physical result is false.

## Proposed ProducerEventJoin adapter

Use one additive relation at the existing manifest boundary. Do not alter the existing subjectId convention for predictionSeal or holdoutUnblinding.

Let:

- F = the existing ComparisonFreeze identity;
- R = one SourceRunWitness key;
- S = the TemporalEvidence record for runStarted;
- D = the TemporalEvidence record for runCompleted;
- P = the existing predictionSealed record and its exact prediction digest;
- U = the existing holdoutUnblinded record;
- E = the existing evaluation record.

The adapter records the references among F, R, S, D, P, and U. It introduces no new event kind. Its projections are:

- pi_F(R): the comparison-freeze identity to which the run's frozen input manifest resolves;
- pi_R(S,D): the producer-witness key named by both run event records;
- pi_P(R): the producer output digest that must equal the exact digest named by P;
- pi_t(S,D,P,U,E): the source-backed event-time intervals used by the existing chronology relation.

The composition is defined only when all of the following conditions hold:

1. F is the same ComparisonFreeze for the producer witness and all prediction/holdout/evaluation events.
2. R's frozen source, map/readout, model, observation/data, calibration/covariance, shared-parameter, and decision-rule inputs resolve to F's frozen manifest.
3. S has eventKind runStarted; D has eventKind runCompleted.
4. S.subjectId and D.subjectId both identify the same R key. S.comparisonId and D.comparisonId both identify F.
5. P and U retain their existing comparison binding to F. The adapter separately links P to R; it does not overload P.subjectId.
6. R's output digest equals the exact prediction digest named by P.
7. S, D, P, U, and E carry source-backed eventTime intervals in a common known clock domain and scale. The required order is S before D before P before U before E, using definitelyBefore and non-overlapping uncertainty intervals.
8. observedAt remains the time an observer recorded or retrieved evidence. It is not substituted for eventTime.
9. The provider identity namespace is explicit. If a provider exposes an attempt ID, retain it with the run ID. If it does not, preserve ATTEMPT_UNEXPOSED. A run ID alone identifies one execution only when the provider's documented semantics establish that uniqueness. Different observed start timestamps do not, by themselves, prove a retry, second attempt, or second process.
10. If a producer is allowed to continue after P, require a source-backed isolation/capability witness or complete access-log coverage. An absent access-log row is not proof of absent access.

The resulting composition is:

F -> R -> {S,D} -> P -> U -> E

with the map and readout witnesses already attached to F. The arrows are typed references and equality/digest conditions, not geometric analogy. A mismatch at any join prevents the chronology theorem from being applied to that purported producer chain.

## Failure and unscorable cases

- No R: producer execution is unbound.
- S and D identify different R keys: same-execution continuity is unestablished.
- R resolves to a different F: comparison lineage is mismatched.
- R output digest differs from P's prediction digest: the sealed bytes are not bound to that execution.
- Missing or incomparable eventTime intervals: chronology is unscorable.
- observedAt substituted for eventTime: temporal provenance is invalid.
- Provider attempt identity is not exposed and run-ID uniqueness is not documented: exact attempt identity remains unresolved.
- No complete access-log or enforced isolation evidence: post-seal holdout exclusion is unestablished.

These are diagnostic descriptions for this proposal, not newly adopted status-enum values. They do not convert missing evidence into a physical failure.

## Proof-first disposition

The mathematical ordering is already covered by the existing formal work:

- PR #1860 contains the source-level definitelyBefore_transitive relation and the draft ChronologyBoundP2Bundle.
- PR #2032 adds ProducerQuiescence. Its exact-head run #44432360003 completed SUCCESS on head aad65f2dfd4edb216b6b0fe2dc12adfacaf87cc5. The conditional transitivity theorem reported no axiom dependencies. The abstract counterexample theorem reported propext, Classical.choice, and Quot.sound, with no sorryAx. Global axiom audit, tests, and lint were skipped.
- PR #2032 remains open, draft, stacked on #1860, and unmerged.

No new Lean module was created. The missing composition is not a further theorem about interval transitivity; it is a source-authorized identity relation that the current P2 types do not yet encode. SourceRunWitness field names and manifest semantics remain proposed. Writing Lean against invented fields would formalize an assistant-reconstructed schema rather than the adopted contract. Once the source owners accept the field semantics, formalize the adapter and its equality/digest invariants, run exact-head Lean, and inspect theorem-specific axiom output. Independent runtime validation of actual provider events remains separate.

## P2 empirical status

| Element | Current state |
|---|---|
| H0 | Existing standard Kelvin-vortex comparator family in P2 matrix #1855 |
| H1 | Finite-core H(s)H target; native geometry-to-observable map still undefined |
| Shared parameters | Not frozen against an acquired measured dataset |
| Calibration | Not acquired or independently audited |
| Holdout | Not acquired or independently audited |
| Predicted observable | Not formed |
| Standard comparator | Existing hollow-core, Rankine, WKBJ, capillary, and centrifugal alternatives remain in the matrix |
| Falsification threshold | Not formed |

The Barckicke Figshare DOI 10.6084/m9.figshare.30903347 remains a locator only. No version, raw bytes, file inventory, units, covariance, or holdout was acquired or analyzed in this run. This is not a new system selection. P2 remains HOLD. No physical calculation, fit, prediction, numerical threshold, independent measurement, SAT-O equation change, Blockwave equation change, or theory promotion occurred.

## Workflow health and scope

- Main snapshot at preflight: 7ce8c3a21037e5877e47c36fdbdf0feea03fafa3. This is a read snapshot, not a branch change.
- Task graph: ACTIVE_SEED, 16 declared branches versus 18 records; discrepancy remains unresolved.
- P0 Code Grurple: ACTIVE. No manuscript, presentation route, site, or P0 object changed.
- P1 cognition: Orson-owned, OVERDUE / NOT READY. No P1 protocol or ownership change.
- P2: HOLD.
- P3: INCOMPLETE.
- FIE: next review November 24, 2026; not due.
- PWH: WH-01 remains OPEN / P1-HIGH with the last recorded cursor at 2026-11-15T18:50Z and 77 ledger rows; Tern retains ownership. WH-02 PR #1710 remains Calder/authorized-maintainer-owned and open/draft/unmerged; no rebase or takeover. WH-05 remains blocked pending Tern's controlled release of an occupied Mersearch lane.
- Mersearch stable 1.0 is pinned at 89933c358b67ccbfbbaa680aadeb1f35d22d91b2. The four canonical request files remain status=requested; no callable Mersearch action or local pinned checkout is available in this runtime. No request was overwritten, retriggered, or released. GitHub search was not represented as a Mersearch result.
- SAT archive README and HSH_RESOURCES root README were read. HSH_RESOURCES was not browsed beyond its root README; no private payload or index was opened.
- Existing Lean PRs and the ProducerQuiescence PR were reused. No new tool, dependency, fork, branch, subscription, or cost was introduced.
- Kestrel's prior unrelated reading cursor is fun break - lx.txt, lines 2160-2199; next cursor 2200. The five-activation reading quantum is not yet due. No physical break is claimed.

## Next action and return boundary

The smallest next step is an owner-reviewed source definition for the ProducerEventJoin relation using the existing TemporalEvidence and SourceRunWitness surfaces. After field semantics are accepted, formalize the typed join, then independently validate one actual producer's event records, output digest, clock source, and holdout isolation/access-log coverage. Do not merge PR #2032 or promote P2 merely because the interval theorem compiles.

**Return pin:** H937:S3 / KESTREL-LABEL-ASSISTANT-RECONSTRUCTION / PRODUCER-EVENT-JOIN-ADAPTER / EXISTING-TEMPORAL-THEOREM-REUSED / NEW-JOIN-NOT-ADOPTED-OR-FORMALIZED / P2-HOLD / NO-PHYSICAL-RESULT / TASK-UNCHANGED
