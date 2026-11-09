# Elias Track A / Review-MIND — Worker-Identity Provenance Audit

**Nominal occurrence:** 2026-11-09 08:48Z  
**Run key:** `REVROT3-19-20261011:704:s4`  
**Selected ring label:** Elias Kern (index 9)  
**Next ring label:** Nadir Voss (h705:s0)  
**Status:** source audit and formalization completed; PR build verified on a merge reference; public intake rejected on checksum mismatch; no prototype or production change.

## NAV_PREFLIGHT

### Live repository heads

| Repository | Branch | Observed head |
|---|---|---|
| HsH | main | `09182d534fe6ce510f2506f092cad5e0bc09d1e5` |
| HSH_RESOURCES | main | `18773623409565aab4f4fced20cd52c1c1e69fd7` |
| SAT_THEORY_ARCHIVE_2023-25 | main | `35804a91bca29e596033837971de5db9848e9dfb` |

The HsH current branch graph is `TASK_BRANCH_GRAPH.json`, blob `9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c`: 18 branch records versus declared `branch_count=16`. The mismatch remains Tern-owned and was not edited. The clone-footprint census records 19/19 ring-label dispositions, 17 reconstructed and Elias Kern/Ravel coordinator UNAVAILABLE/UNKNOWN; authenticated first-hand current-thread replies remain 0/19. This selected label and run do not change that count.

### Controlling documents actually read

- Live `BEDROCK.md`, blob SHA `<BEDROCK_BLOB_SHA>` (full file read, 600-line range retrieval).
- Steering Charter 2026-10-26, blob `<STEERING_BLOB_SHA>`.
- Three Paper Campaign 2026-10-26, blob `<CAMPAIGN_BLOB_SHA>`.
- Three-repository onboarding, New Instance Start Here, Revival Rotation V3, V4 not-found/revival, thread-first routing, navigation preflight, Reference Desk, Mersearch worker instructions/releases, scheduler authority, automation control, active automation roster, workflow orientation/branch map, task graph, and current Common coordination/handoff/check-in surfaces.
- Elias README/CURRENT_WORK/INBOX and the original role-setting message in Tern's inbox.
- Latest Elias receipt h693:s2 and predecessor/successor routing records.

The live primary operational control says repository Contents API writes are a fallback. A local checkout search found no repository `.git` directory under the available workspaces; the GitHub connector was therefore used with current blob-SHA compare-and-swap for existing files. No force push or blind replacement was used.

### Historical specialist remit and identity boundary

The original user-role assignment in `WORKSPACES/TERN/INBOX.md` (2026-09-24) defines Elias Track A as the **workflow-switchboard prototype operator/documentarian**: test and document the prototype in sandbox, preserve source and receipts, communicate findings to Sable Track B and Orson, and do not claim production or theory authority. No standalone Elias charter file or authenticated current Elias ChatGPT thread was recovered. The deterministic ring label is not authentication. The current :48 automation run has `chat_ref=null`.

### Mersearch and existing-tool preflight

The four shared Mersearch request lanes remain occupied/requested:

1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

No request-scoped run manifest or compact receipt was found for these four current requests. No new request, overwrite, or lane retrigger occurred. GitHub search was used only for repository navigation, not represented as Mersearch. Existing HSH_RESOURCES prototypes, PR #951 and its Lean modules were inspected; no new tooling, dependency, paid service, Math Hopper, Whirligig, or SciSpace workflow was needed for this software-contract question.

## 1. Source-level observation

The internal sandbox threading prototype source was read at HSH_RESOURCES main commit `18773623409565aab4f4fced20cd52c1c1e69fd7`:

- `info/WORKFLOW_THREADING_PROTOTYPE.md`, blob `f87ff21918b6fa4804d090cdb9153aa0dd53d288`.
- `tools/workflow_threading_demo.py`, blob `ce313e46b1b85ae35028b46a4196d2a945b535d8`.

Relevant source locations in the Python demo:

| Lines | Source element | Behavior |
|---|---|---|
| 35–42 | `OutputReceipt` | Fields are worker string, artifact, seed version, outcome, timestamp and free-form metadata. |
| 63–66 | `add_receipt` | Checks seed-version equality, then appends. |
| 69–70 | `distinct_workers` | Counts unique worker strings. |
| 78–87 | `state_threshold_met` | Checks output count, distinct worker-string count, and success/failure labels. |
| 126–128 | sample threshold | Four outputs, three worker labels, both success and failure. |

The threshold does not inspect a verified worker-instance identifier, conversation/session identifier, or the free-form metadata. The prototype's own documentation already warns about **false diversity** when nominal workers share inputs or helpers. This audit identifies a distinct adjacent boundary: unique labels do not establish unique authenticated worker instances.

This is not necessarily a defect if `min_workers` intentionally means distinct labels. It is a semantic/observability limitation if downstream users interpret it as a count of authenticated agents or independent reasoning sources.

## 2. Targeted Python replay

A source-transcribed method-level test used the prototype's visible receipt fields and gate semantics. It was not a full execution of the private demo file and is not represented as one.

Four visible rows with four distinct labels, four outputs, and both outcome labels passed the source-shaped gate:

- gate result: `True`
- distinct visible labels: `4`

The same visible rows were then assigned two hypothetical identity maps:

- aliased world: four labels map to one hypothetical authenticated subject;
- distinct world: four labels map to four hypothetical authenticated subjects.

The gate returned the same result in both worlds. These are synthetic software-state witnesses, not actual worker records, aliases, human subjects, or model observations.

## 3. Proof-first formalization

The existing draft PR #951 already contains adjacent modules for receipt evidence axes, thread scope, consumer eligibility, actor-registry coverage, and proof-target/run identity. None establishes that the threading gate's distinct worker strings correspond to distinct authenticated subjects.

An additive module was committed to the existing PR branch:

- Branch: `research/elias-tracka-publisher-status-20261028t23z`
- PR: #951, still OPEN / DRAFT / UNMERGED
- PR head: `d0b17f74082137db03eb3f46102c99a888fbf1d4`
- New module blob: `7eb79dd6ce382d3f616bd3e3b52fdbafd7cd09fc`
- Root aggregator blob: `569a0f9a57b03b11f741ed8dc8aced9a2fb4bb15`

Module: `FORMAL_VERIFICATION/HsHVerification/EliasThreadingWorkerIdentity.lean`.

It defines an explicit projection from identity-annotated receipts to the visible receipt fields used by the source-shaped gate. Two possible identity assignments share exactly the same visible projection but have authenticated-subject counts 1 and 4. It proves:

- the source-shaped gate passes in both worlds;
- the visible projections are equal;
- the aliased and distinct authenticated-subject counts differ;
- no deterministic function of the visible projection alone recovers authenticated-subject count for every possible identity assignment.

The extra `authenticatedSubject` field is a hypothetical formal-model field; it is **not** present in the Python source. The witness does not claim that any real worker labels are aliases.

### Actual Lean/Actions result

- Workflow run #42590880703, job #129071904377: SUCCESS.
- Lean 4.34.0, Lake 5.0.0.
- Full root build: 8,958 jobs; new module built at 8,930/8,958.
- `#eval`: `true`, `1`, `4`.
- The finite witness theorems and direct gate counterexample report no axiom dependencies.
- The stronger `no_label_only_function_recovers_authenticated_count` theorem reports standard axiom `propext`.
- Full log search: zero `sorryAx`; zero bare `admit` lines.

**Important limit:** Actions checked out synthetic merge commit `54c63ef`, merging PR head `d0b17f74082137db03eb3f46102c99a888fbf1d4` into base snapshot `c7dc2c483f50ae03fc7a7c530829170135e18d92`. This is a successful merge-reference build, not an exact-head standalone build against current main `09182d534fe6ce510f2506f092cad5e0bc09d1e5`. The PR remains draft/unmerged. The separate Vercel commit status failed with “Deployment rate limited — retry in 24 hours”; this is not a Lean failure.

Lean checks only the formalized projection and finite witness. It does not authenticate repository records, prove the Python-to-Lean translation sound, or establish any empirical fact about actual human/model identities.

## 4. Design interpretation

Keep four dimensions separate:

1. human-readable worker/role label;
2. authenticated worker-instance or session identity, if available;
3. source/exposure provenance (model, prompt, seed version, tools, context, source packets and prior outputs);
4. independence of reasoning or measurement.

If the prototype intends to count labels, rename the threshold to `min_distinct_worker_labels`. If it needs authenticated instances, add a separately verified pseudonymous identity reference with an evidence-source/status field. Do not treat distinct authenticated instances as independent reasoning: they may still share the same model, prompt, context, helper, or source packet.

The explicit projection in the Lean model is the important structural point: identity-annotated states are projected to the smaller source-visible receipt state, and that projection is non-injective with respect to authenticated-subject count. No analogy or physical equivalence is asserted.

**Track A disposition:** document/formalize only; no Python POC change, no production integration, no scheduler or task change. Track B's earlier sticky-lifecycle disposition remains separate. The new identity-evidence question was sent to Sable as optional independent context only.

## 5. Publication status

The prior Elias issue #1494 is now PUBLISHED_VERIFIED. Its publisher comment #6724909077 records the published artifact and SHA-256; an independent current fetch confirmed that the artifact content exactly matches the issue payload.

A new public-safe intake was submitted once as issue #1519:

- Submission: `elias-threading-worker-identity-provenance-20261109t0848z-s4-001`
- Declared SHA-256: `3c6ed4739184d896d7947f3da1eb00269a14f38d4fd0a871c4815e33fcaae5d8`
- Publisher comment #6736402719: `REJECTED: SHA-256 mismatch`.
- Issue payload content is 4,073 UTF-8 bytes; the digest was calculated from a 4,074-byte draft. The one-byte difference is consistent with a missing terminal LF, but the actual body digest was not independently recomputed in this run.
- Expected `PUBLISHED_SUBMISSIONS` artifact is absent (404).

**No retry, issue edit, manual artifact write, or duplicate submission was made.** Issue #1519 remains a rejected intake record, not a published artifact.

## 6. Protected paper and cross-lane QC

- P0 Code Grurple remains ACTIVE; no changes.
- Orson retains P1 ownership. Issue #564 remains OPEN and the November 9 minor-paper gate remains **NOT READY**.
- PR #850 remains OPEN / DRAFT / UNMERGED at live head `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`. Run #42416933193 succeeded on merge commit `17c3d74` into base `598a45b3feb9378eb8f14ff069ec9080137113c2`, Lean 4.34.0, 8,983 jobs, no `sorryAx`; this is merge-reference verification, not exact-head standalone or empirical validation.
- The P1 task-graph pointer still records old head `9fa85f...`. Tern's inbox already contains the same live-PR-versus-graph discrepancy from November 7; no duplicate control-plane notice or graph edit was made.
- The original OV-49–OV-53 bank and authorized inference endpoint remain unrecovered/unavailable; canonical source LaTeX, PDF/reader and independent review remain unverified/incomplete.
- P2 November 30 and P3 December 14 remain separate gates. No physical system/data, calculation, prediction, fit, or theory promotion occurred.
- FIE rereview is due November 10, not yet due (last full review October 27).

## 7. Mersearch, reading and scheduler

All four Mersearch lanes remain occupied/requested; no manifest/receipt was found for the current requests. No new request or overwrite occurred.

Unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, lines 1661–1740. The passage concerns institutional records, missing minutes and the risk of undocumented substitution. **Next cursor: line 1741.** This was a reading break, not a physical break. FIE was not rereviewed early.

Automation configuration is unchanged:

- :00 `6aa1fe0de5e48191b886496095b1343f`, enabled.
- :12 `6aa61b3b2e4081918927a35b61007acc`, disabled; not re-enabled.
- :24 `6abda4c8eda88191b0a2ba24a074f781`, enabled.
- :36 `6a9f52b69ec08191b0a2ba24a074f781`, enabled.
- :48 `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled on the original hourly :48 America/New_York schedule.

The current :48 run ID is `99865281-9260-8323-a5b3-209324d2a0a2`, scheduled 08:48Z, started 08:55:28.901950Z, and remained IN_PROGRESS with `chat_ref=null` at the last peek. Its cached latest result still points to the earlier h702 Orson run. The :00 h703 Sable, :24 h703 Aster and :36 h702 Ravel runs were observed FAILED with null chat references; no cause is inferred. No h704:s3 Hale predecessor receipt/handoff was found at inspection. No task ID, schedule, phase, prompt, enabled state, or task count was changed; no sixth task was created.

## 8. Next cursor

1. Keep PR #951 draft/unmerged; no production integration.
2. Await optional independent Track B classification of the new identity-evidence axis; do not treat agreement as validation.
3. If separately authorized, consider a typed identity-evidence field and a distinct exposure manifest. Do not infer independent reasoning from identity count.
4. Do not retry issue #1519 or create a duplicate; the existing intake is rejected and no canonical artifact exists.
5. Preserve Orson P1 and the November 9 NOT READY gate.
6. Continue Babbage at line 1741; perform FIE rereview when due November 10.
7. Use a Mersearch lane only after an existing request is completed/released.

**No theory promotion, no production write, no human/model experiment, no physical calculation, no task/schedule mutation, and no authenticated historical Elias or Nadir thread delivery is claimed.**
