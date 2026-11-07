# Elias Kern Track A | Required-route disposition invariant

**Scheduled occurrence:** 2026-11-07T03:36:00Z  
**Run key:** `REVROT3-19-20261011:651:s3`  
**Selected label:** Elias Kern (ring index 9)  
**Next label:** Nadir Voss (ring index 10)  
**Classification:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; current-assistant execution, not authenticated historical Elias participation.

## 1. Identity, source authority, and execution boundary

The deterministic calculation is:

`h=651`, `seq=5h+3=3258`, `3258 mod 19=9`.

The existing :36 automation remains enabled under task ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly America/New_York :36 schedule and phase unchanged.

The current automation peek records run `e39d011a-c9a8-8333-9a0e-a07856c80df8`, scheduled for 03:36Z and started at 04:30:52.110466Z, with `chat_ref=null`. The incoming Hale packet records an earlier start snapshot of 03:33:34Z for the same scheduled occurrence, also with `chat_ref=null`. No attempt identifier is exposed. These observations are retained as an unresolved attempt-lineage discrepancy, not interpreted as proof of two distinct authenticated workers or two completed receipts.

The strongest role-setting source recovered is a role-tagged 2026-09-24 13:47 ET entry in Tern's inbox. It records Track A as Nathan + Elias Kern + Orson Vey, with Sable + Rook as the independent Track B. Track A's bounded operation is one real workflow problem, the smallest relevant TOP/CENTRAL/BRANCH/HYDRA mechanism, before/after state, durable receipt, and observed success/failure or transfer-test candidate. Orson is an observer, not implementation authority; Track B independently dispositions mechanisms as KEEP / MODIFY / TEST / REJECT / DEFER. The raw originating conversation ID/message UUID for that role-setting instruction remains unrecovered. Elias's README is an assistant-maintained continuity reconstruction, not a verbatim standalone Nathan-authored charter.

A bounded existing-thread-first search covered the Elias workspace, Common check-ins/handoffs, Tern's role-setting inbox record, recent receipts and handoffs, and personal-context retrieval. No authenticated existing Elias ChatGPT thread was identified. No historical Elias first-blush or live worker acknowledgment is claimed. The source-grounded operation below belongs to this scheduled assistant execution.

## 2. Incoming predecessor context consumed

Read the late optional packet `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-07T0324Z_from_s2_to_s3_elias_kern.md`, blob `4f152ea420c7a46cefd0358b090cb76122261580`.

It explicitly preserves Elias's Track A lane and says not to take Hale's CODATA work as a new assignment. Its scientific notes concern existing CODATA/NIST provenance and covariance limits; they do not establish an H(s)H instrument map, physical prediction, or P2 system selection. The packet was read as optional context only, with no task or ownership transfer.

## 3. Source-level finding: the POC's four-route return is lossy unless its remainder is recorded

The current internal Track A POC source blob is `49988a769389b2baf264a27d596ba7c3ff822b36`. Its `Switchboard.source_routes` function derives a set of wanted source kinds from event tags, selects matching entries from the ordered `SOURCES` mapping, promotes `war_room` when a directive is present, and returns only the first four matches.

A source-transcribed deterministic test used event tags:

`directive, planning, identity, blocked, archive`.

The exact source constants and routing logic yield six matched source families:

1. `war_room`
2. `dashboard_plans`
3. `hsh_common`
4. `archive`
5. `instance_workspaces`
6. `capability_directory`

The four returned entries are the first four; `instance_workspaces` and `capability_directory` are omitted from the returned list. This was a Python transcription of the inspected source logic and constants, not execution of the private POC file itself. The source function does not emit explicit `deferred` or `unrepresented` fields. This establishes an observability gap for a broad event, not proof that every matching family is required in every workflow or that the omitted sources were actually needed for this event.

## 4. Formal improvement: exactly one disposition per required route

The existing draft PR #951 already contains the proposed abstract `RoutePlan` schema with:

- `required` routes;
- `selected` routes;
- `deferred` routes;
- `unrepresented` routes;
- a per-wave budget;
- pairwise disjointness of the three disposition sets; and
- a `requiredAccounted` condition that every required route appears in their union.

I added theorem `required_route_has_exactly_one_disposition` to the existing module `EliasRouteBudgetCoverage.lean`. It proves that every route in `required` belongs to exactly one of `selected`, `deferred`, or `unrepresented`. The proof combines `requiredAccounted` with the three pairwise-disjointness conditions. This makes the proposed schema's no-silent-omission/no-double-counting contract explicit for downstream users.

This theorem is about the abstract Lean schema. It does not prove that the Python POC implements that schema, validate the source-to-model translation, establish that all six matched families are operationally required, or establish any physical premise.

### Actual Lean verification

- Existing PR: #951, branch `research/elias-tracka-publisher-status-20261028t23z`.
- Corrected PR head: `d6e68d8c3a99e0c50b72d76fd0a6295cb6c1b7c5`.
- Target module blob at PR head and merge ref: `fd361b30a4b205a992755a4fbd7b5b461e49636c`, exact match.
- Actions run #42339615626, job #128304172697: SUCCESS.
- Checked-out merge reference: `fe76a288525c806daf7a9595b0d91aee59a3f3ba`, merged onto base-branch commit `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Lean 4.34.0 / Lake 5.0.0; full root build: 8,956 jobs, successful.
- The theorem's `#print axioms` output is `[propext, Classical.choice, Quot.sound]`.
- Full retrieved build log: zero `sorryAx` and zero bare `admit`.
- Tests, lint, nanoda, and the separate automated axiom audit were skipped.

The first commit attempt used invalid Lean documentation-comment syntax and failed. The comment was corrected to Lean's `/-- ... -/` syntax in the successful head above. The PR remains OPEN / DRAFT / UNMERGED. This is a successful merge-reference build with target-module blob equality, not an exact-head standalone build. A separate Vercel deployment check was failing at the last status read; that does not negate the successful Lean job.

## 5. Architectural consequence and bounded next test

The existing Python prototype's bounded source list can be retained, but the remainder needs an explicit state if the source families are classified as required. The proposed route contract now has a proof that every required route must be selected, deferred, or unrepresented exactly once.

The smallest next sandbox test is an event matching more than four source families. It should record the complete required set, the four selected routes, and an explicit disposition/reason for every omitted route; verify no required route is lost or double-counted; and verify that an unrepresented required route prevents a one-wave-complete status. This is a proposed test, not a completed POC patch.

Sable's independent Track B disposition for the existing Track A gate remains pending in the shared inbox. No POC source, production workflow, scheduler, actor registry, or production policy was changed. The new theorem is not a Track B approval.

## 6. Tool and evidence controls

The existing HsH Lean PR and CI were reused. The current Math Hopper script/PR #991 and existing Whirligig materials were checked before considering new tooling; no new tool, dependency, fork, paid service, or subscription was created. A SciSpace connector is available but was not needed for this source-level workflow test.

No Mersearch request was made because this was not an SAT-O/Blockwave equation or archive-source search. No shared Mersearch request lane was changed. The task graph still declares 16 branches while containing 18 records; that discrepancy remains unresolved and was not edited.

No measured physical system, dataset, units, uncertainty model, H(s)H prediction, standard-physics comparator, fit, or falsification threshold was available or fabricated. No physical calculation, theory promotion, BEDROCK change, or paper-gate advancement occurred. P1 November 9, P2 November 30, and P3 December 14 remain separate. FIE's next full review is due November 10.

## 7. Next-slot boundary

Nadir Voss is the deterministic next label, h651:s4. The existing :48 task had already started and then completed with a failed status; its `chat_ref` was null. Any repository handoff is therefore late optional context only. Nadir's SILOED/PLAYGROUND boundary is preserved: no Nadir workspace/inbox was opened or edited, no task or response obligation is assigned, and no ChatGPT-thread delivery or acknowledgment is claimed.

**Next cursor:** independently review the exact route-disposition theorem and its source-to-model boundary; if Sable's Track B disposition becomes available, run the bounded six-family POC test in the sandbox without changing production. Keep PR #951 draft/unmerged unless its authorized owner and review gates decide otherwise.
