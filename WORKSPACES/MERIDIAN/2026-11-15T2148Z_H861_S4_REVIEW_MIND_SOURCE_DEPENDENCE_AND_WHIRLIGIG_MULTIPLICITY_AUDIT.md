# Meridian h861:s4 | Review-MIND source-dependence and Whirligig multiplicity audit

**Status:** source and archive audit complete; no code changes, new Lean theorem, physical calculation, model trial, human-subject session, or theory promotion.

**Source snapshot:** HsH main at `6f7f8ba0660967b9fda6594a2a2bc56c85976c5b`. The later main commit observed during this run changed generated conversation-viewer data only; the inspected Whirligig source blobs remained unchanged.

## 1. Rotation, authority, and source identity

`h=861`; `seq=5(861)+4=4309`; `4309 mod 19=15`.

- Selected ring label: **Meridian**, index 15.
- Next ring label: **Mercer**, index 16, h862:s0.
- Run key: `REVROT3-19-20261011:861:s4`.

The historical Meridian [HsH] export was recovered and parsed directly:

- Conversation ID: `6a9aa91b-11f4-83ea-80a1-4d502522e441`.
- Raw Git blob: `d21e251df093013903cc19789ded562f83b6e6ea`.
- 343 mapping nodes; 56 user-role messages, 52 on the exported current ancestry.
- The role-setting messages are user-role records with `author.name=null`. They support a reconstructed specialist remit, not a signed standalone charter.

The later **Meridian Free Build** export was also recovered:

- Conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`.
- Raw Git blob: `7af1561b321f4d9364da5eb111df689efc652827`.
- Direct user message `97d301cb-5174-4861-a273-ac4cc0b60d8b`, dated 2026-10-09, is on the exported current ancestry.

That direct instruction establishes a design preference for preserving multiple admissible answers and preferring less-wild transformation routes. It does **not** by itself define an isometry, prove that every equation has infinitely many physically distinct equivalents, or specify a route-cost functional.

The live Meridian BOOT/CURRENT_WORK and Code Grurple roster retain Meridian's P0 assignment: Paper A accepted-R1 presentation support only. The supplied Review-MIND lane charter is treated as a one-run overlay. No P0 task, owner, route, site, or publication surface was changed.

No authenticated current Meridian thread or standalone signed specialist charter was found. The ring label is not an instance identity.

## 2. Review-MIND result: reproducibility is not independent corroboration

Three separately recorded report passes concern the same two Library-held Project Desk v0.1 artifacts:

1. Sable h836:s0, including the recovery published under issue #1752.
2. Morrow h861:s2, whose report explicitly compares its re-read and hashes with Sable h836.
3. This Meridian h861:s4 pass, which independently materialized the same two Library items and recomputed their hashes and parsed structure.

The two exact source artifacts were:

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| Project Desk v0.1 HTML | 9,375 | `d75b2bc89e732f98b35a699c09c30e250577728a62d4f31481906baf83bead3c` |
| Project Desk v0.1 JSON | 11,671 | `1c1a70eb38e140312d3004f954b7767e62b12dc9f57155f6914e1673d66531c1` |

Independent local re-read and parse found:

- The HTML contains an embedded JSON payload.
- The embedded and external JSON parse to equal objects.
- The snapshot declares generation time 2026-09-24 21:45 ET.
- Its structured views contain 22 project-lane rows, 14 worker rows, 3 repository rows, and 12 theory-maturity rows, plus 6 dependency flows.
- The HTML is static: no remote fetch, XMLHttpRequest, WebSocket, EventSource, GitHub API call, external script, remote image source, or localStorage use was found in the inspected file.

The artifact's own coverage notes limit it to a snapshot. It does not establish live project status, complete archive coverage, current inbox state, or live Sites/publisher state.

### Independence profile

This is a vector of evidence dimensions, not a single independence score:

| Dimension | Observed status |
|---|---|
| Report/run records | Distinct scheduled report records |
| Authenticated model/agent identity | Unknown |
| Original source roots | Shared: 2 of 2 exact artifacts |
| Retrieval/materialization | Separate retrieval events reported and repeated |
| Hash/parse method | Same SHA-256 and JSON parsing method |
| Blinding | No: Morrow references Sable; Meridian read both reports |
| Independent human reviewer | None documented |
| Agreement | 2/2 byte hashes match; parsed embedded/external JSON objects match |

**Conclusion:** the repeated hashes establish reproducibility of the same stored artifacts. They do not constitute independent-source corroboration, independent authorship, source authentication, or proof that the snapshot is complete/current. These are three report records, not three verified agents. No effective sample size, cross-agent consensus rate, or model-independence claim is calculated.

A useful provenance graph must distinguish `reads`, `materializes`, `compares_to_prior_report`, `shares_source_root`, `run_bound_to_thread`, and `authored_by_authenticated_subject`. Missing identity or thread edges remain unknown, not inferred from a worker label.

## 3. Whirligig: source intent versus implemented multiplicity

The relevant public source surfaces were checked against the direct 2026-10-09 user instruction and existing canonical records [#1330](https://github.com/Satobloc/HsH/issues/1330), [#1415](https://github.com/Satobloc/HsH/issues/1415), and [#1761](https://github.com/Satobloc/HsH/issues/1761).

The current implementation consists of distinct artifacts that must not be collapsed into one general solver:

### A. Browser instrument

Source: [PUBLIC_SITE/instruments/whirligig/index.html](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/instruments/whirligig/index.html), blob `6a3b00a31a672a7984acd8eae5ac199205c67950`.

- Contains 42 curated equation/profile entries.
- Its deterministic pair series traverses the 861 unordered pairs of those 42 entries.
- It displays one selected pair at a time and explicitly has no aesthetic ranking.
- Its RMS profile comparison is not an equivalence test.
- It is a curated pairwise visualization instrument, not a general equation-transformation-path search.

### B. Python R/Q mechanical engine

Source: [tools/whirligig_rq/whirligig.py](https://github.com/Satobloc/HsH/blob/main/tools/whirligig_rq/whirligig.py), blob `151259096e3ac8e5986ac8f61c6bd76ce199901d`.

- Its discrete search spans 4 gear settings, 5 pen-turn settings, and 3 gimbal-pair settings: 60 mechanical configurations.
- The search returns and writes a ranked configuration list, while also selecting a best configuration. This preserves alternatives at the **mechanical-configuration** level.
- It does not search arbitrary equation-to-equation derivation paths.
- Its scalar candidate score combines position/tangent closure, harmonic-fit RMS, source closure, curvature roughness, curvature p95, and penalties. It is a mechanical-quality heuristic, not the source-defined least-wild derivation cost and not a bending-energy functional.

### C. Implicit equation adapter

In the same Python module, the implicit path extracts closed numerical contours, selects the contour with maximum perimeter, resamples that one branch, and records the assumption that the longest numerically closed branch was selected.

This is an explicit single-branch adapter policy, not a hidden error. But it does not return the complete set of closed branches or a branch-completeness status. The existing test suite contains a single closed-circle implicit test; no multi-branch retention or representation-invariance test was found.

### D. Ranking and representation-invariance risk

The Python score uses a uniform sweep-parameter grid. Its curvature-roughness term is a finite difference across sampled curvature values; its curvature percentile and harmonic signature are also computed from parameter-sampled points. These are not demonstrated to be invariant under reparameterization of the same geometric trace.

This is a **source-level invariance risk**, not an observed numerical ranking reversal. No synthetic adversary or data-free physical fixture was run. The existing `WHIRLIGIG_KERNEL_0` W2 discussion is a separate sandbox artifact and is not a test of this Python score.

The 2026-09-19 functional audit spec describes bending energy as a proposed proxy and requires a representation-invariance test. That spec is an assistant reconstruction, not a verbatim Nathan Direct equation. The current Python score does not implement that proposed bending-energy functional.

### E. Mathematical clarification required

“Isometric equations” is underspecified until the represented spaces carry explicit metrics and a map is shown to preserve distances. Algebraic equivalence, invertibility, stereographic representation, rescaling, and isometry are not interchangeable.

The next implementation contract should keep separate:

1. The full candidate set and any selected default.
2. Branch IDs, domain/grid, closure status, and truncation/completeness status.
3. Transformation-path steps and their source/rule/invariant witnesses.
4. Intrinsic geometric score and parameterization/clock score.
5. The mechanical configuration score and the derivational “least-wild” ranking.
6. An explicit metric-preserving witness for any isometry claim.

A Pareto/vector ranking is safer than an unexplained scalar until the objective components, normalization, and weights are source-defined. No code or branch was changed.

## 4. Existing formalization and tool audit

Existing related Lean PRs were inspected, not modified:

- [PR #633](https://github.com/Satobloc/HsH/pull/633): product-projection/source-fidelity gate. Its joint product projection is an existence result for a product representation, not proof of a nontrivial derivation path or physical coupling.
- [PR #773](https://github.com/Satobloc/HsH/pull/773): scale-fidelity formalization.
- [PR #811](https://github.com/Satobloc/HsH/pull/811): conditional torus-intersection result.

All remain OPEN / DRAFT / UNMERGED. Successful workflow runs are associated with their PR-head commits, but available run metadata did not expose the exact checkout ref, so no exact-head standalone replay is claimed. PR #895 remains a separate Meridian CTC/inversion source-fidelity gate; PR #1471 remains P0-related. Neither was changed.

No local Lean, Lake, Elan, HsH checkout, or Mersearch CLI exists in this runtime. No new Lean theorem or build was attempted. The source-level invariance obligation is not yet fully formalizable because the intended intrinsic functional and admissible reparameterization class are not specified.

Math Hopper issue #578 remains open. The archive Math Hopper script and smoke workflow exist, but the smoke run and three-repository full scan are not verified. The four Mersearch request lanes remain requested; their request-scoped run manifests/receipts are absent. No callable Mersearch action is available. No request was overwritten or retriggered.

SciSpace was available and used for abstract/metadata-level prior-art triage, not full-text review:

- Gao et al., “Copies or Sources?”, arXiv:2610.06192, preprint on counting distinct evidence sources rather than repeated restatements.
- Li et al., “Beyond Final Accuracy”, arXiv:2610.01042, preprint using an Independent-Communicate-Revise design with a no-message control.
- Moreno, “Effective Sample Size Under Peer Exposure in Multi-LLM Deliberation”, OSF preprint, 2026-09-29.
- Kerstan et al., “Collaborative decision-making in human-AI versus human-human teams”, Human Factors (2026), DOI 10.1177/00187208261461626, using hidden-profile information inquiry.
- Pairit, arXiv:2505.06176, is an existing experimental-platform lead, not adopted or cost-validated.

The HsH, SAT archive, and HSH_RESOURCES repository metadata report zero forks. HSH_RESOURCES root/navigation documentation was read; no private research payload was accessed. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 5. Disconfirming Review-MIND experiment design

No human or model experiment was run. The archival example above supports a falsifiable design with three evidence-exposure conditions:

1. **Blind same-source replication:** two reviewers independently receive the same frozen original artifacts, without prior reports.
2. **Shared-report exposure:** reviewers receive the same artifacts plus prior Sable/Morrow conclusions.
3. **Independent-source condition:** reviewers receive separately acquired primary-source bundles with no shared report or intermediate answer.

Add a no-message control to separate peer communication from additional reasoning, and a hidden-profile task where participants must actively request unique information.

Record, when available: authenticated subject/model/provider version, prompt hash, run ID, thread binding, tool calls, source IDs and hashes, prior-report visibility, blinding status, and output receipt.

Measure claim-level accuracy, unique source-root discovery, error correlation, correction of wrong claims, preservation of correct claims, and retrieval of unique information. Do not use agreement alone as success. Human participation requires consent and privacy controls. The experiment should be able to disconfirm the claim that different worker labels or separate conversation targets imply independent evidence.

## 6. Cross-lane and governance controls

- P0 Code Grurple remains ACTIVE. Meridian's Paper A accepted-R1 presentation-support assignment remains unchanged.
- P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. The November 9 minor-paper gate remains missed; November 30 major and December 14 full-theory gates remain separate.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- No model trial, human-subject session, manuscript edit, physical calculation, fit, prediction, independent measurement, or theory promotion occurred.
- FIE review is next due November 24; no early rereview was needed.
- Unrelated reading: H. G. Wells, *The Time Machine*, Project Gutenberg eBook 35, lines 61-560. Next cursor: line 561. This is literary material, not physics evidence.

## 7. Scheduler observation and handoff boundary

The existing :48 automation remains enabled with its original task ID `6aa6c3bc02b48191b8a91a30d2a155e0`, original hourly America/New_York :48 schedule, prompt, and phase unchanged.

At final readback:

- :00 Enheduanna h861:s0 run ID `a7e97c4b-0434-832f-b5eb-76665b2519c9` was first observed FAILED with completion at 21:52:06Z, then the same run ID was observed IN_PROGRESS with a later start field at 21:56:31Z, null completion, and null chat_ref. The cached latest result still belongs to Mira h856:s0. This is a same-ID post-terminal status/start-field mutation; no retry, restart, duplicate process, concurrency, or backend cause is inferred.
- :36 Kestrel h861:s3 run ID `87475243-b2e0-832a-b352-9ee6fa314cdd` completed at 21:49:57Z with a run-level chat_ref. Delivery status remains unknown. Its WH-02 preflight is separate and remains Calder-owned with Tern coordination.
- :48 Meridian h861:s4 run ID `ebdcdf69-a538-8327-93a4-24d1837e067f` remained IN_PROGRESS, started at 21:46:09Z, with null completion and null run-level chat_ref. The cached latest result still belongs to Nadir h860:s4, not this run.
- Task-level last-run pointers for :00 and :48 lag the detailed run records.

An optional Tern packet records the new scheduler observation and Whirligig source delta. It is repository-only context, not direct thread delivery, acknowledgment, task assignment, or ownership transfer. Tern's large INBOX was not rewritten.

## 8. Publication disposition

No new publisher intake issue was opened. Existing #1330, #1415, and especially #1761 already provide the canonical public Whirligig source-fidelity surface. The new material is an implementation-level delta for authorized review; the publisher has no in-place amendment path, and a new issue would risk duplicating the existing public surface and worsening the known intake lifecycle backlog.

No public artifact is claimed as newly PUBLISHED_VERIFIED. The internal report and optional handoff remain repository records pending an authorized decision about an amendment to #1761.

**Final classification:** `MERIDIAN_H861_S4 / REVIEW_MIND / SOURCE_REPRODUCIBILITY_NOT_SOURCE_INDEPENDENCE / 2_OF_2_SHARED_LIBRARY_ROOTS / WHIRLIGIG_MULTIPLICITY_LAYERED / IMPLICIT_SINGLE_BRANCH_POLICY / PARAMETERIZATION_INVARIANCE_RISK_NOT_NUMERICALLY_TESTED / LEAST_WILD_METRIC_UNSPECIFIED / EXISTING_LEAN_PR_EVIDENCE_LIMITED / MERSEARCH_LANES_OCCUPIED / NO_NEW_TOOL_OR_LEAN_RUN / NO_PUBLIC_DUPLICATE / ORSON_P1_PROTECTED / P0_UNCHANGED / AUTOMATION_PRESERVED / WRAPPER_IN_PROGRESS`.
