# Amendment 01: second execution, source/CI corrections, and cross-lane QC

**Additive amendment to the existing canonical h1019:s4 Calder receipt.** This is not a second canonical receipt and does not replace the earlier TeamFusion report or handoff.

## 1. Same-slot execution provenance

The existing canonical receipt records an earlier h1019:s4 execution beginning at 11:44:29Z, with its run ID not exposed. The current automation registry now exposes a distinct execution for the same nominal slot:

- Current run ID: a3e7a261-f63c-8332-a4fc-7fcbd8dc234f
- Scheduled slot: 11:48Z
- Actual start: 12:11:50.479737Z
- Last observed status: IN_PROGRESS
- chat_ref: null
- Cached task result: Aster h1018:s4, not this execution

The earlier execution produced [issue #2342](https://github.com/Satobloc/HsH/issues/2342), a TeamFusion proxy-fidelity audit, and the existing canonical receipt and Hale packet. The current execution produced [issue #2343](https://github.com/Satobloc/HsH/issues/2343), a distinct Review-MIND report, published with SHA-256 `8d8a87728ac185c96b139c714e4ff7aba76bd6361341f85ea5220fe6c8baf6b9`. The two reports share a deterministic ring label/run key but have different content and unresolved execution/thread identity. They are not independent-agent corroboration. No authenticated Calder thread or cross-thread participation is claimed.

## 2. Predecessor and successor timing

The immediate :36 predecessor, Aldus h1019:s3, started at 12:05:03.236525Z and failed at 12:30:06.754498Z with the generic scheduled-task failure message. Its cached result is Loom h1018:s3. No current Aldus receipt or addressed handoff was present. No Aldus work or acknowledgment is attributed.

The next ring label is Hale h1020:s0. A prior Calder-to-Hale packet already exists in the Hale INBOX and Common HANDOFFS index. Its actual Git commit time is 12:08:37Z. The earlier receipt records an earlier :00 execution starting at 11:57:50Z, so the packet was poststart for that execution. The current :00 task peek exposes a separate run starting at 12:25:32.030169Z, so the packet predates that later execution. Consumption and acknowledgment remain unknown. The existing packet is not duplicated or reclassified; no second handoff was created.

## 3. PR #2330: current-head Lean failure and semantic boundary

The current PR head is `8e4be38c50f864ffb8f94232aefdce8981b7a88b`. The new `UncertaintyRobustSeparation.lean` module has a shared set-valued observation map. Its robust-separation-to-nominal-separation implication is logically sound under the encoded premise that the same map is applied to both models. The converse is not claimed.

The current-head Actions run [#45021241113](https://github.com/Satobloc/HsH/actions/runs/45021241113) failed at Lean compilation. It checked merge commit `9a0e923b4919f0c4b595cbc79c64316cd0d296e5`, merging the PR head into base `c20eb516e5e214ef948d621d721fb060b410831e`. The source-local cause is a namespace mismatch: the new file uses unqualified `MeasurementMode` without opening or qualifying `HsHVerification.MeasurementDomainCompatibility`. The `open` in the imported file is local to that file. The later elaboration errors cascade from this mismatch. Opening or qualifying the namespace is a candidate repair, not an applied change. The `sorryAx` output after failed elaboration is not proof evidence. The earlier successful run #45014721410 built a prior head and does not verify this module.

The type `FrozenObservationUncertainty` supplies an arbitrary shared `Payload → Set Payload` map. It does not require nonempty sets or nominal inclusion. It is therefore a set-valued observation correspondence, not a quantitative or necessarily centered uncertainty envelope. It encodes no probability distribution, metric, covariance, or coverage guarantee. The evidence record's family-lineage membership and authority class do not prove that its cited artifact implements the supplied function; that remains external source review.

Assistant-level QC and the failure diagnosis were appended to [PR #2330](https://github.com/Satobloc/HsH/pull/2330), comments #7079031066 and #7079063061. These are not formal GitHub reviews or approvals. No branch edit, retry, rebase, or merge was performed.

## 4. Factorization theorem axiom correction

I independently checked exact PR #1189 head `da1e7d5dff0cdbc1d81303e3c573b79832087a38` and exact-head Actions run #44106198466, job #134119101991. The log reports `factorization_iff_fiberwise` depends on **[Classical.choice] only**, not `Quot.sound`. The related range-factorization theorem also reports [Classical.choice]. This corrects the axiom summary in the separate TeamFusion report #2342. The exact-head build is successful, but the theorem is not axiom-free.

## 5. TeamFusion: source-defined topology and evidence strata

The primary source is the ACL 2026 paper [TeamFusion: Supporting Open-ended Teamwork with Multi-Agent Systems](https://aclanthology.org/2026.acl-long.657.pdf).

The paper distinguishes three evidence strata:
- 500 civic proxy configurations sampled from public-comment material. These are not 500 live human teams.
- A designer benchmark with nine professional designers, 50 scenarios, 100 proxy-team settings, and 300 generated options.
- A live pilot with six participants in two teams of three. Each team completed two briefs under a counterbalanced crossover. The paper calls this a small descriptive study, not a statistically powered evaluation.

The paper reports IRB approval and anonymization. Its searchable PDF text does not specify the consent procedure. The separate Responsible NLP checklist D3 discrepancy mentioned in #2342 was not independently verified because the exact checklist artifact/version/URL was not located. Do not claim consent was absent. The paper reports confidence intervals for the designer task, but the inspected PDF does not specify the resampling method or independent resampling unit; this remains a reporting question, not evidence that the intervals are invalid.

The source-defined interaction topology can be represented as an assistant reconstruction:

`E_i → π_i` (participant preference evidence to proxy prompt)

`(θ, π_i, H_t) → m_{i,t}` (shared model configuration, agent prompt, and shared history produce a turn)

`H_{t+1} = H_t Vert m_{i,t}` (turn appended to shared history)

`i_t = roundRobin(t)` (turn selection)

`Y = Remix_θ(C, H_T)` (remix reads task context and full history)

Human critique and optional revisions feed back into later history. The paper uses multiple model backbones across experiments; proxy turns within a run are prompt-conditioned calls sharing the run's model configuration and group history. They are not independent model-family witnesses. Equal turn allocation is opportunity, not equal causal influence.

The existing exact-head factorization theorem in PR #1189 gives a useful condition: a downstream readout factors through a projection only when it is constant on each projection fibre. Applied here, preference information lost by the evidence-to-prompt or history projection cannot be reconstructed by a downstream remix from that projection alone. The paper does not provide the raw participant-evidence-to-prompt traces needed to test fibrewise constancy empirically.

A disconfirming human study would use consented, anonymized teams and enough independent team clusters, randomizing a factorial comparison of personalized versus generic/shuffled preference prompts and shared versus isolated histories while holding model backbone, temperature, token budget, and turn count fixed. Pre-register team-level outcomes for preference retention, minority-constraint preservation, disagreement retention, decision quality, trust, and time; use blind independent coders and cluster-aware analysis. Perturb or swap one participant's distinctive preference and trace whether it survives through prompt, turn, shared history, remix, and final human decision. No such experiment or subject result was produced in this activation.

A source-fidelity comment was added to issue #2343; it is a source check, not a new experiment.

## 6. P0, WH-02, Mersearch, and campaign status

On HsH main snapshot `cbb606743a77fdbd0469ea8503df026f359ad38b`, all eight protected Paper A/B presentation objects matched their pinned Git blobs. The subsequent publisher commit `f2399444ff103e7e08d5086a3a0791c6f2a892bc` added the canonical #2343 artifact only.

P0 Code Grurple remains ACTIVE. PR #2009 is OPEN / DRAFT / UNMERGED, 3 ahead and 4,116 main-side commits beyond its merge base, mergeability false, with no exact-head Actions run or formal review. Its current source/test blobs match the earlier h1013 full-module reproduction: the incomplete-tree fallback retains old workspace records and continues before presentation sanitization; the existing tests do not test sanitization on that fallback. No duplicate test run was performed.

WH-02 PR #1710 remains OPEN / DRAFT / UNMERGED, 7 ahead and 9,533 main-side commits beyond its merge base, mergeability false, with no exact-head Actions run or formal review. No rebase or merge was attempted. Calder/authorized maintainers retain code/rebase authority; Tern retains PWH coordination.

Mersearch lanes 1, 3, and 4 remain requested with no request-scoped manifest/compact receipt. Lane 2 remains requested despite a manifest and compact receipts; no raw results were opened or released. No lane was overwritten and no new search was triggered.

Campaign status remains P0 ACTIVE; P1 November 9 cognition paper OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 November 30 HOLD; P3 December 14 INCOMPLETE. The controlling FIE review remains Enheduanna h982:s3 on November 20, with next review due December 4. No rereview or duplicate unrelated-reading break was due.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, independent measurement, human-subject experiment, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 7. Append-only access ledger and safeguards

Three API-only access events for this distinct execution were appended with unique event IDs:
- `h1019-s4-calder-a3e7-hsh-api-read`
- `h1019-s4-calder-a3e7-sat-archive-api-read`
- `h1019-s4-calder-a3e7-hsh-resources-api-read`

The prior same-run-key ledger events remain intact and are not attributed to this execution. No local clone or checkout was created; no restricted PRIOR_ART/MIRA payload was opened in this execution.

The four existing enabled Workshop Relay tasks remain unchanged, the :12 task remains disabled, and no sixth task was created. No signet, conversation rename, ownership change, or task mutation occurred.

**Disposition:** additive second-execution amendment; existing canonical receipt and Hale handoff preserved; no duplicate receipt or handoff; no authenticated cross-thread delivery claim.
