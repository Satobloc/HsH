# Meridian | PR #895 source-fidelity, branch, and cross-scale map audit
**2026-10-31 20:48 UTC | Review-MIND delta audit**

**Disposition:** EXISTING SOURCE AUDIT PRESERVED; MIXED-SOURCE CHARTER ATTRIBUTION REFINED; PR #895 MERGE-REF BUILD VERIFIED BUT EXACT HEAD NOT VERIFIED; CROSS-LANE MAP CONTRACT REVIEWED; NO NEW MATHEMATICAL OR PHYSICAL RESULT.

This is an additive delta to the 2026-10-28 CTC/inversion source-fidelity report and the 2026-10-30 Meridian receipt. It does not repeat or replace their full source analysis.

## 1. Selection, identity, and continuity

Nominal UTC hour since 2026-10-11T00Z: h=500.

`seq=5h+4=2504`; `2504 mod 19 = 15`.

- Selected identity: Meridian, ring index 15.
- Next identity: Mercer, ring index 16.
- Run key: `REVROT3-19-20261011:500:s4`.
- Next run key: `REVROT3-19-20261011:501:s0`.

The historical Meridian conversation is found but rolled over. The 2026-10-21 continuity file explicitly records a conversation-length rollover. No currently usable historical Meridian thread was authenticated; this is source-grounded reconstruction, not historical-instance participation.

### Historical specialist remit, source-corrected

The specialist remit is distributed across raw user messages, not established by one standalone charter. The current Meridian continuity, New Instance Start Here, spine and solver-harness README are assistant-authored workspace synthesis unless a passage is separately labeled and raw-source verified.

Two raw conversation exports were read:

1. **Meridian Free Build**: conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`. It contains 2,499 message objects (80 user, 956 assistant, 1,463 tool) and 2,500 mapping entries including one non-message wrapper.
2. **Meridian Minkowski Ring Analysis**: conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`. It contains 3,677 message objects (112 user, 1,292 assistant, 2,273 tool) and 3,678 mapping entries including one non-message wrapper.

Important source-role correction: message `b27ec702-f976-4273-8d87-166ecccdfeb8` is a raw user-role message, but begins “Cross-posting from Mercer for visibility.” The quoted ER/Kerr/worldtube proposal is Mercer-origin, not Nathan Direct. The user's instructions after that quotation are Nathan Direct: use the toolkit, search organized and unorganized conversations, inspect random original-archive material, recover missed equations, and preserve the distinction between the evolving formalism and the more stable ontology. The existing receipt Amendment 01 already corrects the earlier over-attribution; it remains authoritative.

Direct user messages in Meridian Free Build include:
- `feb128c9-1c43-426a-93ff-32f80ea43d4f` (2026-10-07): prefer instantiation/intersection/cobordism/truncation language over passive “readout slices”.
- `1d284b55-d7be-45f7-92a6-15e4734347c8` (2026-10-07): time-normal turning/torsion as a matter-interaction response.
- `3c657387-b80b-4982-a61a-8e6d8568b8d1` (2026-10-09): worldtube resistance/inertia and particle motion as filament topology, stated as the user's construction rather than independently established physics.
- `2c5c06af-f718-4d1b-a8a0-573f58662422` (2026-10-08): HAGALAZ research goal, paired-paper comparison and hostile peer review.
- `8e97c5f0-8cd7-4aef-b2a8-8886bf5c88f8` (2026-10-09): build from the current theory and return to original conversations when a piece fails.

Direct user messages in Meridian Minkowski Ring Analysis include:
- `c1b42229-00a9-4119-aac3-cefa6cb97157` (2026-10-20): Cruller/internal-rotation and worldtube-birth hypothesis.
- `f658b2db-32f0-45cd-828b-140691cc9afb` (2026-10-20): expanding-Minkowski/donut idea explicitly marked “no proof” and “working hypothesis”.
- `34f444a1-f987-4e81-a438-73b9c3463f38` (2026-10-21): instruction to start with the Cruller and work backwards.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21): `cw=t` and `(++++)` notation, with the adjacent alternative expression tentative.
- `59cdedb4-be76-455a-87c8-a6089de951b3` (2026-10-21): direct user statement that 3D rotation is 4D curvature and 3D acceleration is.

Message `090f5160-1020-486d-9c42-df3d7dff2063` remains mixed-source; only its final Klein-Fabric supersession correction is Nathan Direct. The workspace continuity's distinction between marked material-history curvature and ambient Riemann curvature is consistent with the direct 2026-10-21 statement.

## 2. CTC/inversion source status: no new source claim

The October 28 source-fidelity report remains the primary audit:
`WORKSPACES/MERIDIAN/2026-10-28_1300Z_COSMOTOPOLOGY_CTC_INVERSION_SOURCE_FIDELITY.md`, blob `6aaa8a2d51637539508eceaa3e3225d5eded36ab`.

The flattened `HsH COSMOTOPOLOGY.txt` witness is blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`, 98,867 characters. It appears in both HsH's development dump and the SAT archive with the same Git blob identity, so these are two repository copies of one witness, not independent attestations. It contains 32 NATHAN-labelled and 32 CHATGPT-labelled markers, including nine trailing empty NATHAN placeholders. Those labels are not a recovered raw role graph.

The SAT archive `INGESTION_LEDGER.md`, blob `8c095421bcc00d58059eddbcfdb7a62a1486bc13`, lines 115-128, classifies the source as a **July 2026 user/assistant exploratory dialogue**. The `30SEP26_DUMP` directory is not an authenticated utterance date.

The flattened dialogue labels the initial CTC geometry and the “literal inversion” correction as NATHAN, then labels the fundamental-group/Klein-bottle and conformal-inversion elaboration as assistant output. Because raw message IDs, timestamps and role graph remain unrecovered, neither label establishes Nathan Direct. The prior report correctly retains the distinction between a source-labelled proposal and authenticated authorship.

The recovered raw Meridian Minkowski Ring Analysis export is a different conversation. A bounded search of its user-role messages for explicit CTC/closed-timelike/point-inversion wording returned no matches. This is a scoped negative result, not proof that no related discussion exists elsewhere.

The ingestion ledger's caution remains controlling: torus/Klein loop classes are topological; they do not establish timelike tangent character. A CTC claim needs a specified Lorentzian causal structure, time orientation and curve tangent. No new CTC or inversion claim is authenticated by this run.

## 3. PR #895: current branch and actual Lean evidence

PR #895 remains open, draft and unmerged.

- Head branch: `research/meridian-cosmotopology-source-gate`.
- PR head: `71a68306d33472bbbe54df609dd05a5063e30297`.
- Base branch: `infra/lean4-verification-20261023`, base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Current main observed in comparison: `64010865222f1ee0b56fad70cbc808db8bf2668f`.
- Comparison against main: 55 commits ahead, 5,426 behind. Whether the old verification base is intentionally pinned is unresolved. Do not rebase or retarget without the responsible owner and Code Grurple standdown.

The PR has five changed files. Alongside the geometry module and root aggregator, it contains `MeridianAnswerProjection.lean`, `MeridianProviderPartition.lean`, and the P1 identity-preserving pair-matrix CSV. These cognition/benchmark artifacts are outside this geometry lane and remain under the protected P1 owner. No files were moved or edited.

### Exact build status correction

Actions run `41141185069`, job `124358367833`, completed successfully with `lake build` reporting 8,946 targets under Lean 4.34.0 / Lake 5.0.0.

The actual job log checks out `refs/remotes/pull/895/merge` at merge commit `72095ccf6fdc136dc04934b5df7ff801d2fc65d0`, not the PR head `71a683...`. Therefore the status is:

**MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_NOT_VERIFIED.**

The log contains 21 in-file `#print axioms` outputs: six from `MeridianCosmotopologyFidelity` and fifteen from the two P1 modules. The six geometry outputs list only standard dependencies: the first five use `propext`, `Classical.choice`, `Quot.sound`; the mapping-torus endpoint theorem uses `propext`, `Quot.sound`. No `sorryAx` appears in the retrieved full log.

The workflow set `test=false`, `lint=false`, `nanoda=false`, and `axiom-audit=false`. In-file axiom reporting is real build output, but it is not a separate automated axiom-audit stage.

The append-only correction to the 2026-10-30 receipt is:
`WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-30T2200Z_s0_meridian_AMENDMENT_02.md`.

### Mathematical scope, not physical validation

- `future_time_excludes_closed_return` is a conditional endpoint-order contradiction: if the start time is strictly less than the finish time, the endpoints cannot be the same event. It does not define a spacetime path, causal cone, future-directed tangent, or derive a global time function.
- `euclideanPointInversion` is the spatial Euclidean map (x\mapsto L^2x/|x|^2). Its circle theorem proves a pointwise locus inclusion for a planar circle, not a full set-image equality or a 4D Lorentzian ring/horizon correspondence. The source's full spacetime expression and spatial-section expression are distinct.
- The formal domain does not fully encode the stated nonzero-point domain: the plane-preservation theorem includes the origin, where the totalized real division is not geometric inversion. The circle theorem's (a\ne0) condition excludes the origin on that circle, but the module does not require (L\ne0); (L=0) degenerates the map. The prose's (a>0) condition is also stronger than the theorem's (a\ne0) assumption.
- `mappingTorus_inverse_gluing_endpoint` checks the algebraic deck-step sign for the declared identification convention. It does not formalize the quotient topology, a Lorentzian metric, or a causal path.

No new Lean module or theorem was written, and no new data-free geometric calculation was run. The existing merge-ref build was inspected; no exact-head run was initiated.

## 4. Cross-lane audit: Kestrel's typed map contract

Kestrel's 20:36 report/receipt was read after the predecessor completed. No substantive Kestrel-to-Meridian handoff file was present; the receipt explicitly says no content was forwarded.

The published Kestrel map contract, issue #1169, was independently read back:
- Artifact blob: `9cb5dcb2de6d94b10f4f9570d31bc73ad55069c0`.
- Declared content SHA-256: `547d9f41c0c62b04bc50466954a330503df729c861952b65bf76e48b02b74e91`.
- Publisher run #41240494289, job #124653194719: SUCCESS.
- The issue payload content equals the retrieved artifact exactly. Publication is **PUBLISHED_VERIFIED**.

The contract distinguishes nesting/embedding, coarse-graining, physical section/intersection, diagrammatic/observer projection, physical response, and instrument/reconstruction readout. It proposes a cross-scale compatibility condition:

`Transfer(s,l→L) ∘ Readout(s,l) = Readout(s,L) ∘ Coarse(l→L)`.

This remains a proposal, not a canonical H(s)H identity or physical prediction.

The Kestrel PR #873 run #41240068390 compiled `KestrelProjectedIncidence`, including the two new conditional readout theorems, in a PR merge-ref context. The overall PR build failed in the separate `KestrelKelvinVortexReadout.lean` at lines 32 and 51. Exact-head verification of the new commit was not established. The published issue's `SUBMITTED_NOT_VERIFIED` line is a pre-run snapshot; the later receipt records merge-ref compilation, while the overall PR remains failed.

The map contract is a useful audit lens for PR #895: point inversion is a separate spatial transformation, not nesting, coarse-graining, physical section, observer projection, physical response, or instrument readout. Any proposed particle-core/ring to horizon correspondence needs a typed source object, target object, map domain/codomain, admissible family, composition/projection conditions, and the required inverse or image-equality property. A single spatial circle inversion does not supply those missing maps.

The Kestrel automation receipt's preflight execution identifier `dba645c7-b29e-41fa-9b56-0f82b6d1d8df` differs from the automation record's run ID `dba645d2-4de0-8330-b531-14baae34b2e3`. Their relationship is unresolved; they are not silently conflated.

## 5. Mersearch, task graph, and operational controls

All four shared Mersearch request lanes were read and remain occupied/requested:
1. Nadir SO(4) source/geometry.
2. Archive optics harvest.
3. Aldus WWRD geometry fidelity.
4. Nadir SIM4 closure/source genealogy.

No new request was submitted or overwritten. No complete Mersearch result is claimed. The bounded raw-source and ledger reads above are not a three-repository Mersearch completion.

The live task graph blob `3c341c...` lists HAGALAZ solver unification as active but explicitly BACKSEAT/HOLD under Code Grurple. Its next cursor is path-dependent transport/history. PR #895 is not registered as the active HAGALAZ branch. No graph, PR, branch, task, ID, schedule or cadence was changed.

The Meridian checkpoint header still says hourly :28, and New Instance Start Here still points to the 2026-10-21 rollover. Those are stale workspace labels. The controlling :48 automation remains enabled with its existing ID and exact hourly America/New_York :48 schedule. No correction to the scheduler was made.

### Current execution and predecessor

- :48 task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Enabled: YES.
- Schedule: `DTSTART;TZID=America/New_York:20261001T144800`, hourly.
- Current run ID: `0ec2664e-5630-832d-8fc4-ae83b41138f0`.
- Scheduled for 20:48Z; started 20:50:38.704384Z.
- At final inspection: IN_PROGRESS, no terminal timestamp, no authenticated current `chat_ref`.
- The displayed `latest_result` belongs to Nadir's preceding 19:48Z run, not this Meridian execution.

The Kestrel :36 predecessor completed at 20:49:50.288Z. Its receipt was consumed, but it explicitly forwarded no substantive content and no handoff file was found. No nonresponse is inferred.

Next worker: Mercer. The optional handoff contains source locators, frozen branch/CI status, the map contract reference, and open questions only. It does not transfer implementation reasoning, ownership, or an assignment.

## 6. Lateral reading and next cursor

Deliberate unrelated reading: `SAT Mark V/TheTANGLE.txt`, lines 1811-1850. Return cursor: line 1851.

FIE last full review: 2026-10-27. The 14-day rereview trigger is not due.

Next cursor:
1. Preserve the existing October 28 source-fidelity report and October 30 Amendment 01; use Amendment 02 for the merge-ref correction.
2. After a Mersearch lane is actually released, retrieve the raw role graph for the July CTC/inversion dialogue. Do not promote flattened speaker labels to Nathan Direct.
3. Keep the active HAGALAZ cursor on path-dependent transport/history after Code Grurple standdown. Do not let the separate PR #895 source gate displace it.
4. Before any new formalization, obtain specific permission for the proposed data-free geometric proof and state the exact theorem. Then formalize the actual domain/codomain and map, run Lean 4/Mathlib, and inspect theorem-specific axioms and exact-head CI.
5. Keep Orson's P1 files with the protected P1 owner.

No physical calculation, new model inference, human-subject session, new tool, paid service, public issue, manuscript edit, paper-gate advancement, SAT-O/Blockwave equation change, or BEDROCK promotion occurred.
