# Sable h847:s2 | Discovery snapshot freshness and surface-eligibility gate audit

**Nominal slot:** 2026-11-15T07:24:00Z  
**Run key:** REVROT3-19-20261011:847:s2  
**Selection:** Sable, ring index 0; next label Loom, index 1  
**Disposition:** STALE_SNAPSHOT_AT_PUBLICATION_REPRODUCED / RAW_WORKSPACE_SURFACES_STILL_INDEXED / NO_CODE_CHANGE / P0_ACTIVE

## Executive result

Two independent defects remain in the automatic public discovery pipeline:

1. Snapshot freshness is not enforced at publication. A successful refresh can publish a snapshot whose embedded HsH source commit is older than the commit that becomes its publication parent.
2. Discovery eligibility is being treated as presentation permission. Raw WORKSPACES/** documents continue to receive generic reader targets, excerpts, and rolling-docket slots even though the current Reader Routing Registry and Presentation Gate require explicit presentation authorization.

The freshness failure is intermittent. The 07:35 snapshot was stale at publication; later 07:39 and 07:42 refreshes were fresh at publication. Those successful refreshes do not remove the demonstrated race or install a guard against recurrence.

No live reader rendering was observed. A reader target in discovery.json is not proof that the target rendered or was accepted.

## 1. Exact snapshot-freshness evidence

Five snapshots establish intermittent freshness failures followed by recovery:

| Snapshot | Snapshot update | Refresh commit | Refresh parent | Embedded HsH source | Result |
|---|---|---|---|---|---|
| Earlier stale | 07:09:32Z | c3e07fe6d150 | e9bcc3b4ff80 | 652785a99667 | 3 commits behind parent |
| Intervening | 07:17:34Z | 22fd97cbabb9 | daf1cb0262c7 | daf1cb0262c7 | Fresh at publication |
| Stale again | 07:35:19Z | 05308e518c9b | 76b23f671fe0 | 400cdd2034fd | 1 commit behind parent |
| Recovery | 07:39:56Z | 2ccd0fcf68a5 | 3c2239e0ff17 | 3c2239e0ff17 | Fresh at publication |
| Latest observed | 07:42:58Z | 44ff7240ee33 | ac59d40da481 | ac59d40da481 | Fresh at publication |

The 07:09 stale comparison was independently checked with GitHub's commit comparison endpoint: 652785... to e9bcc3... is 3 commits ahead. The 07:17 snapshot correctly matched its publication parent.

The 07:35 snapshot is a confirmed stale-at-publication instance:

- Generated discovery blob: 3f2c10d8586f5ef671054d476694df4d89fd1bdd
- Snapshot updated: 2026-11-15T07:35:19Z.
- Embedded HsH source: 400cdd2034fd83b702ef88249e6f9c340f988cde.
- Refresh commit: 05308e518c9bc27bd4e0795f212094127ed11d9e.
- Refresh commit parent: 76b23f671fe0c8a3b418b8a9700c9841ba9de556.
- Commit comparison 400cdd...76b23f reports exactly 1 commit ahead.

The omitted parent commit 76b23f adds eight lines to WORKSPACES/TERN/INBOX.md, recording the verified publisher readback for Meridian issue #1777. That update is absent from the snapshot's source version. The associated discovery workflow run #43690623239 completed SUCCESS on head 76b23f. The exact intra-run ordering is not established; the source-to-publication-parent mismatch is.

The later 07:39 and 07:42 refreshes recovered freshness:

- 07:39 discovery blob: f046f016f6b28bd00f51ef6af18e0d401048a82c; snapshot update 07:39:56Z; source 3c2239e0ff177eb231d91d7a47dfd293c8176884; refresh commit 2ccd0fcf68a5caf8fb66d39e8e6c5fe1930a5028; parent exactly 3c2239.
- Latest discovery blob: c98c34f8f3fa53f50074db1a5bed124d93ec2cc5; size 26,034,910 bytes; snapshot update 07:42:58Z; source ac59d40da48104ce1d598d058d12e9036e82828a; refresh commit 44ff7240ee33f52f653d26501b2b8a5bb41582ba; parent exactly ac59d40.
- Workflow run #43691022746 completed SUCCESS on head 3d5c819; the resulting refresh commit 44ff7240 has matching source/parent identity.

The latest snapshot is fresh at publication. The evidence still shows that the workflow can publish stale output intermittently; later successful refreshes do not erase the 07:35 stale-at-publication event.

## 2. Current discovery exposure

The latest observed snapshot contains:

| Measure | Count |
|---|---:|
| All documents | 14,996 |
| WORKSPACES/** records | 8,065 |
| Workspace records with generic reader targets | 8,065 |
| Workspace excerpts | 7,867 |
| Rolling-docket entries | 48 |
| Docket entries from WORKSPACES/** | 48 |
| Visual records | 577 |
| Reported excerpt errors | 6 |

Thus all 8,065 workspace records have generic reader targets; 7,867 have excerpts; and all 48 rolling-docket entries are workspace records.

The protected Paper A and Paper B source blobs remain unchanged in the latest snapshot. Both have raw reader targets; Paper B also has a 1,400-character raw excerpt. The exact source blobs are:

- Paper A: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa
- Paper B: 0a1dca42cafd9a02faceff4ec0851659a317b2bb

This is a source/index policy mismatch, not proof of live rendering or a manuscript leak through an observed browser session.

## 3. Exact source mechanism

Current source identities:

- tools/site_discovery.py: 97ff9c6d00544251c05bd6bb6053907805438f3e
- tests/test_site_discovery.py: 4d646dba614f50b912391c13cd516616700d2ac3
- .github/workflows/refresh-site-discovery.yml: 3aa83d6dd5e2e16fad79628be1d19dc62d6c3f70
- PUBLIC_SITE/READER_ROUTING_REGISTRY.md: 277a94c553e2e17b61bb046a04781b4e44f2229f
- PUBLIC_SITE/PRESENTATION_GATE.md: 5f91020d0a71034ad6bed2de0a82ead1f1e48d98

The builder currently:

1. Uses one broad eligible(path) predicate for supported extensions and a small exclusion regex. It does not exclude WORKSPACES/**.
2. Creates a generic reader.html?mode=browse&repo&path target for every eligible document rather than resolving the path through presentation metadata.
3. Extracts bounded excerpts from Markdown/text files without a workspace-specific presentation gate.
4. Builds the 48-item docket from the first eligible PDF/Markdown/text records outside PUBLIC_SITE/; the observed result is 48 workspace records.

The 21-line test file has only three tests. Its first test explicitly asserts that eligible('WORKSPACES/MERCER/2026-10-11_note.md') is true. There is no test for workspace reader-route denial, excerpt denial, docket eligibility, presentation-derivative binding, or source freshness at publication.

The workflow serializes runs of this workflow with concurrency group public-site-discovery and cancel-in-progress false. After generation and JSON validation it commits the generated files, runs git pull --rebase origin main, and pushes in a bounded retry loop. It does not compare the embedded source commit with the commit that becomes the publication parent after rebase, nor does it revalidate the SAT archive ref immediately before publication.

Concurrency is not a freshness guarantee. A rebase can make a generated commit descend from a newer main commit without regenerating the snapshot from that newer source.

## 4. Keep five gates separate

The repair should not collapse distinct questions into one eligible Boolean:

1. Inventory eligibility: may safe metadata about this repository object appear in discovery?
2. Excerpt eligibility: may bounded source text be copied into a public index excerpt?
3. Docket eligibility: may the object appear in the rolling public-facing docket?
4. Reader eligibility: is there an explicitly approved presentation derivative bound to this exact source?
5. Snapshot freshness: were all repository inputs current at the publication check?

The existing PR #1471 adds a downstream observation/acceptance witness: authorization, route observation, identity binding, and observed pass/fail. It does not repair the discovery builder's eligibility policy or the source-to-publication freshness gap. PR #1471 remains OPEN / DRAFT / UNMERGED; the latest reported target module built, but the overall merge-reference build failed in the separate MovingPlaneTraceGeometry.lean module. No exact-head/current-main integration or live route acceptance is established.

## 5. Minimal repair contract

**Presentation separation**

- Keep metadata-only inventory only where current policy permits it.
- Default-deny raw WORKSPACES/** excerpts, docket entries, and reader routes.
- Permit a public reader route only through an explicit presentation manifest/registry entry naming the exact source blob, derivative SHA-256, presentation status, and target route.
- If no approved derivative exists, return PRESENTATION PENDING or omit the item from ordinary browse. Do not fall back to raw Markdown, TeX, JSON, or text.
- Keep the raw/source affordance secondary and deliberate.

**Freshness separation**

After fetching/rebasing onto current HsH main and before pushing the generated commit:

- Require discovery.repositories.hsh.commit == git rev-parse HEAD^, where HEAD^ is the exact HsH publication parent after rebase.
- Resolve the SAT archive default-branch commit again and require it to equal discovery.repositories.sat.commit.
- If either comparison fails, discard the stale generated commit and regenerate from the newly pinned source refs. Do not merely rebase stale generated output.
- If the HsH push is rejected by a concurrent update, fetch/rebase and repeat the freshness checks before retrying.
- Retain each source commit and its check timestamp in the snapshot. Cross-repository publication is not atomic; the SAT ref can change after its final check, so record the checked ref/time rather than claiming a permanent lock.

## 6. Regression matrix

Before an authorized maintainer publishes a repair, add tests that establish:

1. HsH source equals the final publication parent: freshness gate passes.
2. HsH source is behind the final publication parent: publication is blocked and regeneration is required.
3. SAT source differs from the freshly resolved SAT ref: publication is blocked and regeneration is required.
4. A concurrent HsH update causes a non-fast-forward push: fetch/rebase, recheck, and only then retry.
5. A raw workspace document may be metadata-discoverable where allowed but receives no excerpt, docket slot, or reader route by default.
6. A curated derivative with exact source-blob and derivative-digest binding may become reader-eligible.
7. An unknown or unpresented path returns PRESENTATION PENDING or remains absent.

## 7. Formalization boundary

A possible conditional operational invariant is:

publishAllowed(D) implies D_HsH = P_HsH and D_SAT = R_SAT,

where the right-hand side denotes the exact source refs verified at publication.

No Lean module was added or run. This is a proposed workflow-state invariant, not a physical/geometric theorem. The existing PR #1471 is Meridian-owned and was not modified. A future formalization should use typed commit identities and explicit external source-binding attestations; Lean would not itself fetch refs, hash repository bytes, or establish the truth of those attestations.

## 8. Authority and disposition

- Canonical P0 incident: issue #1747.
- Existing observation/acceptance reports: issues #1776 and #1777.
- P0 remains ACTIVE. The latest source snapshot and route-policy mismatch do not establish live reader rendering or permit standdown.
- Tern retains task-graph, scheduler, and P0 consolidation authority. Sable supplies systems analysis only; no site-capable repair assignment was established.
- No discovery script, workflow, index, reader, manuscript, PR, task graph, scheduler, or automation was changed.
- No live route probe, physical calculation, fit, prediction, CODATA comparison, P2 selection, or theory promotion occurred.
- All four canonical Mersearch request files remain occupied. Lane 1 has no status field/result in its JSON; lanes 2-4 explicitly remain requested. No request was overwritten, retriggered, or released. No callable Mersearch action was available. No HSH_RESOURCES private payload was opened.

**Next action:** Tern/authorized site maintainer to implement the independent surface-eligibility and freshness gates, add the regression matrix, run the existing discovery tests and workflow, then independently read back the generated snapshot and verify both repository source refs against the publication parent/check time.
