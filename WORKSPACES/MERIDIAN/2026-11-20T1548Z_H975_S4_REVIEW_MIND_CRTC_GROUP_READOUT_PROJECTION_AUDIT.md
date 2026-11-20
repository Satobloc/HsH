# Meridian h975:s4 | Review-MIND group-readout projection audit and P0 snapshot revalidation

**Nominal slot:** 2026-11-20T15:48:00Z  
**Run key:** `REVROT3-19-20261011:975:s4`  
**Selection:** `h=975`; `seq=5h+4=4879`; `4879 mod 19=15`, Meridian.  
**Next ring label:** Mercer, index 16.  
**Disposition:** `CRTC_GROUP_UNIT_SCOPE_GAP / EXISTING_FIBER_FACTORIZATION_LEAN_REUSED / P0_SNAPSHOT_REVALIDATED / LIVE_ROUTE_UNOBSERVED / P1_UNCHANGED`.

## 1. Identity, historical remit, and authority

This is a source-grounded assistant-level review. The ring label does not authenticate a current Meridian instance or conversation. No standalone signed Meridian specialist charter or authenticated current Meridian thread was established.

The historical remit is supported by direct user messages in two raw conversation exports:

- `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`, conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`, Git blob `d21e251df093013903cc19789ded562f83b6e6ea`. Direct user messages `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, `39299849-e2a4-4b63-88a0-5612c700cc1a`, and `f6a2377c-8873-41ee-9107-41aeeb0d2589` assign work on the graticule, configurable geometric solvers, comparison against conventional calculation, and verification of what the Whirligig's GR-QM procedure actually does.
- `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, Git blob `7af1561b321f4d9364da5eb111df689efc652827`. Direct user message `97d301cb-5174-4861-a273-ac4cc0b60d8b` says the Whirligig should preserve multiple valid answers and search for the least-wild routes, not imply a unique solution.

These are historical source statements, not evidence of current-thread continuity. The current P0 Code Grurple remit and the Review-MIND overlay were respected; no solver ownership or task assignment was changed.

## 2. New independent QC finding: CRTC v0.1 permits a group unit without defining group maps

Orson's proposed [Cognitive Readout Target Contract v0.1](../ORSON_VAY/COGNITIVE_READOUT_TARGET_CONTRACT_v0.1.md), blob `a5b997e63f01a698f201c30940d3e29a702cdd29`, is a source-grounded methods schema, not a validated instrument or P1 protocol amendment.

Its readout signature correctly separates model, unit, information state, target, criterion, channel, intervention, dependence graph, validation, and evidence status. Its explicit maps distinguish model response, gold criterion, external judge, predicted correctness, predicted judge scores, and diagnostics.

**Scope gap:** the `Unit` list explicitly permits `agent or group`, but the map layer is single-unit:

- `M_theta(I) -> A`
- `G(P,A) -> C_gold`
- `J_v(P,A) -> S_judge`
- `Ghat_theta(I,A) -> predicted correctness`
- `Jhat_theta(I,A) -> predicted judge scores`
- `D_error(I,A) -> diagnostic`

There is no group-history object, member roster, per-member information projection, communication/exposure event map, subgroup projection, or group-level aggregation/readout map. This does not invalidate the individual readouts or the three source crosswalks. It means that `unit=group` is currently a declared label, not an executable group measurement specification.

A second, narrower gap is that the required dependence graph is not yet an operational graph schema. The contract asks workers to record shared model family, data, prompts, sources, memory, tools, judges and human panels, but does not type nodes and edges or distinguish information being available to a member from evidence that the member used it. Availability and uptake must remain separate observables.

### Suggested v0.2 extension, not an amendment

If group-level readouts are intended, define them before using the group option:

- `H_G`: a time-indexed group interaction history with roster, membership intervals, messages, shared memory/tool events and output records.
- `pi_i : H_G -> I_i(t)`: the information state available to member `i` at time `t`.
- `E_{j->i}(t)`: a typed exposure event recording what member `j` made available to member `i`; keep `available_to` distinct from `used_by` or `uptake`.
- `M_i : I_i(t) -> A_i`: member-level response map.
- `R_G : (H_G, {A_i}, E) -> Y_G`: an explicitly named group-level target/readout with its own criterion and validation.
- For nested groups, `pi_{S<-G} : H_G -> H_S` and `pi_{i<-S} : H_S -> I_i`; the composite `pi_{i<-S} o pi_{S<-G}` is defined only when domains/codomains, membership, time window and visibility rules agree.

A dependence graph should type at least `derived_from`, `shared_prompt`, `shared_source`, `same_model_lineage`, `shared_judge`, `available_to`, `used_by`, and `aggregated_into`. The graph can expose candidate dependence; it does not itself prove statistical independence or supply a universal independent-sample count.

### Formalization boundary

The existing Nadir PR #1189 theorem `factorization_iff_fiberwise` supplies a generic criterion: a target `R : H_G -> Y` can be computed from one member's projection `pi_i : H_G -> I_i` only if there exists `r_i : I_i -> Y` with `R = r_i o pi_i`; equivalently, `R` must be constant on every fiber of `pi_i`.

The exact PR head `da1e7d5dff0cdbc1d81303e3c573b79832087a38` was checked in existing Actions run #44106198466, job #134119101991: Lean 4.34.0 / Lake 5.0.0, 8,961 build jobs, exact-head checkout. This is an existing generic proof, not a new CRTC theorem. The exact log reports `imageProjection_surjective` with no axioms, `factorization_iff_fiberwise` with `Classical.choice`, and `inducedCoarseGraining_unique` with `Quot.sound`. The CRTC does not yet define `H_G`, `pi_i`, or `R_G`, so no CRTC-specific Lean statement can be compiled without inventing the missing model. No new Lean module or build was created.

A schematic disconfirming pair illustrates the issue: two group histories may yield the same individual `I_i` while differing in peer exposure and group outcome. If that occurs, the group target is not recoverable from that individual projection alone. This is a constructed logical example, not an observed participant result.

**P1 boundary:** no Orson manuscript, protocol, dataset, PR, trial, human session, API spend, ownership or paper gate was changed. This review is an independent assistant-level QC note, not a P1 protocol amendment and not a request for Orson to act.

## 3. P0 Code Grurple: current discovery and branch readback

P0 remains ACTIVE. The current HsH `main` snapshot at the final source read was `d2ba3a7417849a51b535cc702879e42d6675779f`.

The current `PUBLIC_SITE/generated/discovery.json` is blob `30b58c2c2bd52db12045964a27b408b8cbd1e689`, 29,457,900 bytes, updated `2026-11-20T15:53:23Z`. It contains 16,610 document records and a 48-item curated docket.

The two protected R1 source records remain exact:

- Paper A: `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B: `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

Both appear in the broad `documents` array as `Working record` and carry generic `reader.html?mode=browse&repo=hsh&path=...&kind=file` targets. Neither appears in the 48-item curated docket. `PAPERS_FEED.json` remains the editorial input with Paper A `sandbox_staged_accepted_r1` and Paper B `sandbox_posted_reviewed_r1`; `generated/papers.json` still contains only the separate Crullerverse R0 card.

This reproduces the known source-layer discovery/presentation-policy mismatch, not a new incident. The Presentation Gate requires a source -> preface -> RevTeX -> compiled PDF -> viewer chain. The Reader Routing Registry is default-deny for `WORKSPACES/**` unless an explicit presentation derivative nominates the artifact. Therefore the discovery record is not proof that the raw source is rendered to a public visitor.

The six discovery excerpt errors are confined to unrelated legacy text files (`ANONYMIZED RETRODICTIONS`, `frosch-loch`, and `particle_analysis_corrected`); neither protected R1 path is among them.

The two `paper.html` URLs could not be inspected through the available web reader, and no connected browser tab reader was available. **Live route outcome remains UNOBSERVED**, not failed and not passed. No site change, deployment, manuscript edit or standdown decision was made.

### PR #2009 current branch preflight

PR #2009 remains OPEN / DRAFT / UNMERGED:

- PR head: `ee582b8de93f88f49445c211892529c40b47fded`
- Base: `main`
- Current main at comparison: `d2ba3a7417849a51b535cc702879e42d6675779f`
- Divergence: 3 commits ahead / 2,125 behind
- Exact-head check runs: 0

All three PR-touched paths are byte-identical between current main and the recorded merge base: `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`, `tests/test_site_discovery.py`, and `tools/site_discovery.py`. This means no same-path drift was found at this snapshot; it does not prove a 2,125-commit rebase is conflict-free. No rebase, merge, dispatch, deployment or branch write was attempted. Calder/authorized maintainer ownership and Tern coordination remain unchanged.

## 4. Primary Workflow Health and source-access controls

- Mersearch-first onboarding and the stable 1.0 release instructions were read. Mersearch was not callable in this runtime.
- The four canonical request lanes remain occupied/requested: `calder-angle-geometry-source-fidelity-20261102-1337`, `archive-harvest-20261025-optics-01`, `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`, and `kestrel-finite-core-geometry-source-fidelity-20261102-2200`.
- All twelve expected request-scoped manifests and compact receipts are absent from current main. This is OUTPUT_MISSING, not a free lane or a completed search. No request was overwritten, retriggered, retried or released; no fifth request was created.
- HSH_RESOURCES metadata still reports public visibility (`private=false`) while its root README describes private research infrastructure and prohibits public cross-linking. Only repository metadata and the root README were read. No internal payload or index was opened, and no visibility change was attempted.
- The SAT archive root README still directs AI visitors to a top-level `AI` folder that is absent; the actual machinery is under `.[⚙️_AI_FILES]/`. Existing SAT archive PR #8 is OPEN / DRAFT / UNMERGED and already proposes the one-line front-door correction. No duplicate edit was made.
- The task graph remains `ACTIVE_SEED`: 18 records versus declared `branch_count=16`; 7 roots; 11 parent-pointer edges; 10 child-array edges; one parent-only P2 -> `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03` relation; 17 reachable nodes and one child-traversal-unreachable node; no dangling references or cycles. This is an existing Tern-owned reconciliation item. No graph edit.
- Orson P1 remains OVERDUE / NOT READY / ORSON-OWNED. P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. No paper gate advanced.
- FIE was last reviewed November 10; its next review is November 24, so the 14-day re-review trigger is not yet due.
- An unrelated reading break continued `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt`, lines 2401-2440. It was a historical language-etymology exchange; its assistant-generated Langobardic/Visigothic examples were not treated as verified linguistics. Return cursor: line 2441.

## 5. Continuity and completion

The prior Meridian h972:s0 source-fidelity report is already `PUBLISHED_VERIFIED` at issue #2192, with exact issue/report/artifact readback and SHA-256 `bcf3f5869996093ae888ff13ec2fbc01320b734fbca8a66eb8c91d875219a618`. The existing Meridian `BOOT.md` and `CURRENT_WORK.md` still pointed to h964 and did not yet reference that h972 report; this is a continuity-pointer gap, not a missing publication.

This report is a new bounded Review-MIND QC artifact. It does not change Orson's CRTC, P1 protocol, P0 code, Mersearch lanes, task graph, scheduler, or theory state. No authenticated direct-thread delivery, consumption or acknowledgment is claimed.

**Final:** `H975_S4_MERIDIAN_ASSISTANT_LEVEL / CRTC_GROUP_UNIT_SCOPE_GAP / EXISTING_FIBER_FACTORIZATION_PROOF_REUSED / P0_DISCOVERY_REVALIDATED / LIVE_ROUTES_UNOBSERVED / PR2009_3_AHEAD_2125_BEHIND_NO_EXACT_HEAD_CI / MERSEARCH_OUTPUT_MISSING / ORSON_P1_PROTECTED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
