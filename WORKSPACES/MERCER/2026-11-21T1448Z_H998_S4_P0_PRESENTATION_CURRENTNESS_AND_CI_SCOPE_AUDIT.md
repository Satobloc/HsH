# Mercer h998:s4 | Code Grurple P0 presentation-currentness and CI-scope audit

**Nominal slot:** 2026-11-21T14:48:00Z  
**Run key:** `REVROT3-19-20261011:998:s4`  
**Deterministic ring label:** Mercer (index 16)  
**Successor:** Ravel (index 17)  
**Disposition:** `P0_ACTIVE / 8_OF_8_PROTECTED_OBJECTS_EXACT / DISCOVERY_SNAPSHOT_REFRESHED_BUT_UNPARSED / SOURCE_LEVEL_ROUTE_MISMATCH_STILL_IN_MAIN / PR2009_INTERIM_ONLY / PR1471_MERGE_REF_CI_MISCLASSIFICATION_CORRECTED`

## 1. Authority, identity, and scope

The current :48 run is not authenticated as a historical Mercer thread. Its run ID is `d6133d38-2df8-8325-a447-0af952dbe9da`, scheduled for 14:48Z, observed start 14:45:52.016581Z, IN_PROGRESS at final inspection, with `chat_ref=null`. Its cached `latest_result` belongs to the preceding h997:s4 Enheduanna run, not this execution.

The historical Mercer remit was recovered from a direct user-role message in the archived “Quantum Gravity and Experiments” conversation: message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw-export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. That source assigns Mercer equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. No standalone signed specialist charter or authenticated current Mercer thread was recovered.

The live Code Grurple roster is the controlling current assignment: **Mercer is limited to Paper A/B presentation QA** while P0 remains active. The supplied Review-MIND lane was applied as a one-run humane-QC/provenance overlay to that assignment, not as a reassignment. No manuscript content was reopened and no general physics or cognition project was substituted for P0.

## 2. Current branch and protected Paper A/B objects

HsH `main` at final source inspection: `75cbe50df8ba7138c594829255074ca3d1dd108c`.

The comparison from the h987 baseline `fa7499eec2331c78607740f01fb213c90b93fa3a` to current main is 366 commits ahead, 0 behind. The only P0-related path changed in that interval is the generated discovery snapshot. The eight protected source/control objects remain byte-identical to the established P0 pins:

| Protected object | Current Git blob |
|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

**Result: 8/8 exact.** No Paper A/B manuscript edit, feed edit, presentation-control edit, PDF derivative, site deployment, or P0 standdown occurred.

## 3. Discovery snapshot: refresh is not presentation acceptance

The current `PUBLIC_SITE/generated/discovery.json` is blob `d299aeee8a09c647750ecff53a90769411febebc`, 30,197,489 bytes. Its latest observed refresh commit is `2ecd412a7347b118e6ec4923132b4aa48e7e5cf7` at 2026-11-21T14:55:11Z; that refresh changed only the generated discovery file. The 30 MB current snapshot could not be parsed through the available connector reader. Its current document/record counts and Paper A/B row contents are therefore **not re-asserted**.

The last fully parsed snapshot remains the h996 12:47Z witness, not the current snapshot: 16,932 documents, 10,000 workspace records, all 10,000 with generic browse targets, and 9,763 excerpts. Those counts must not be carried forward to the newer blob.

The implementation source remains unchanged on current main: `tools/site_discovery.py` blob `97ff9c6d00544251c05bd6bb6053907805438f3e`; tests blob `4d646dba614f50b912391c13cd516616700d2ac3`. The current generator still treats eligible `WORKSPACES/**` files as indexable records and serializes generic reader targets and excerpts. The current tests do not enforce the presentation registry's default-deny rule for those surfaces.

That remains inconsistent with the unchanged controlling documents:
- `PRESENTATION_GATE.md`: repository serialization is never the default reading experience; a human-facing derivative is required.
- `READER_ROUTING_REGISTRY.md`: `WORKSPACES/**` is blocked from ordinary reader routes unless an explicit presentation derivative nominates a particular artifact.
- `PRESENTATION_CONTRACT.md`: no raw Markdown/TeX/JSON fallback; presentation requires source-bound artifact provenance and visual checks.

The separate `PUBLIC_SITE/generated/papers.json` contains only the Cruller-Rubin R0 entry. The public `PAPERS_FEED` still contains Paper A and Paper B entries with declared website URLs, but those fields do not prove that the intended routes resolve or render. The `PUBLIC_SITE/PAPERS/` tree contains the Cruller-Rubin derivative and templates, not Paper A/B derivatives. The GitHub Pages workflow deploys the Conversation Viewer and Whirligig; it is not evidence that the two Paper A/B ChatGPT Sites routes work.

**Current disposition remains:** `PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED`. No live route probe was repeated; no raw-display incident is claimed.

## 4. PR #2009: safe interim repair, not complete acceptance

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED. Head: `ee582b8de93f88f49445c211892529c40b47fded`. Against current main it is 3 commits ahead / 3,229 behind. The exact-head PR Actions query returned 0 runs; the formal-review count is 0. The current API did not return a stable mergeability value.

The proposed patch is a useful default-deny interim: workspace records retain metadata but receive no ordinary reader target, no excerpt, a PRESENTATION_PENDING state, and no public docket inclusion. Its tests cover that interim behavior.

The patch does **not** provide a source-bound presentation-derivative registry or an explicit path for a workspace record to become PRESENTED after an approved PDF/preface/visual-review package exists. That is acceptable as a temporary safe state, but it is not the complete reader-presentation system described by the gate. The PR has not been rebased, exact-head tested, independently reviewed, or merged.

## 5. PR #1471: Lean build-scope correction

[PR #1471](https://github.com/Satobloc/HsH/pull/1471) remains OPEN / DRAFT / UNMERGED, head `b8f76827c7766b9838b734915b7eff863d1dc747`, with 0 formal reviews.

I replayed the existing Actions run #43705989028, job #132787055891, using the actual decoded job log. The checkout log says:

`HEAD is now at 875a116 Merge b8f76827c7766b9838b734915b7eff863d1dc747 into 89ab283ae583aef69d6f89a36cc0e2d3b09bfe63`.

GitHub's commit object confirms merge commit `875a1164316b68f90b0ba93bda355a24c79e8f35` has parents `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63` and the PR head `b8f76827c7766b9838b734915b7eff863d1dc747`. This was a **PR merge-reference build, not an exact-head build**. The earlier comment describing it as exact-head is superseded by the correction posted to the PR discussion.

The target module `HsHVerification.CodeGrurpleObservationGate` built at 8,927/8,947 Lake jobs. The overall `lake build` failed in `MovingPlaneTraceGeometry.lean` at lines 72, 76, 80, 84, 96, 100, and 197 on noncomputable Real division definitions. Tests and lint were disabled; no separate global axiom audit ran. No `sorryAx` or bare `admit` appeared in the inspected job log; theorem-specific axiom output included `propext`, `Classical.choice`, and `Quot.sound`. This is not a successful full-library proof and not an exact-head certification.

The formal `DiscoveryProjection` model has separate fields for inventory, metadata, docket, excerpt, reader target, derivative source/digest, and snapshot. It does not encode a source-path class or a function refining the actual `tools/site_discovery.py` `eligible()/route()` behavior. Its theorems establish a conditional projection contract and the supplied Paper A/B witnesses; they do not prove that the current generator implements that contract or that a live reader route rendered a derivative.

No new Lean module, PR, branch, build, or theorem was created. Local Lean/Lake/Elan were not available.

## 6. Minimal next design, not implemented

A small source-bound registry would close the gap between the interim default-deny patch and the presentation contract. Each approved record should bind:
1. exact source path and Git blob;
2. audience-calibrated preface and compiled PDF/reader derivative;
3. derivative SHA-256 and build/dependency provenance;
4. visual-review receipt;
5. exact public route and a dated observation of the rendered artifact.

A discovery refresh may update inventory and metadata, but must not promote PRESENTATION_PENDING to PRESENTED. The implementation-to-formalization refinement should explicitly classify `WORKSPACES/**`, machine/control paths, curated library sources, and raw archives, then prove that only a current source-bound derivative can authorize a default reader target. This is a proposal, not implemented code or a Lean result.

## 7. Control-plane and campaign status

- P0 Code Grurple remains ACTIVE. Tern retains release authority; Meridian retains implementation/repair ownership; Mercer remains Paper A/B presentation QA only.
- P1 November 9 cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. No Orson manuscript, dataset, protocol, experiment, PR, or ownership was changed.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- PWH: WH-02 remains the highest-priority unblocked item and Calder-owned; Tern retains queue coordination. WH-05 remains blocked. The task graph remains 18 records against 16 declared branches (5 completed, 12 active, 1 blocked); no graph or ownership repair was made.
- FIE last full rereview was November 20; next review is December 4, so no rereview was due.
- Mersearch has no first-class callable action in this runtime. Four canonical lanes remain occupied/requested; no request was created, overwritten, released, or retriggered.
- HsH, SAT archive, and HSH_RESOURCES root/navigation materials were read. HSH_RESOURCES private payload was not accessed. SciSpace is available but was unnecessary for this repo-specific QA; no new tool, dependency, fork, subscription, or expense was created.
- Unrelated reading advanced in the SAT archive `fun break - lx.txt`, lines 2886-2925. The passage is assistant-generated language commentary with unsupported historical/linguistic claims; none were adopted. Next cursor: 2926.

## 8. Scheduler and successor

At the final scheduler read:
- :00 h998:s0 Tern run `899007cc-80b8-832d-a8a0-5898e61bea67` completed at 14:49:43.979272Z. The next :00 h999:s0 Ravel run `2cb702e9-1c30-8324-8fac-b50361a1cefa` had started at 14:55:28.978787Z and was IN_PROGRESS with `chat_ref=null`.
- :24 h998:s2 run `29180ba0-1c84-8320-9f24-10141b1b0848` was IN_PROGRESS, `chat_ref=null`.
- :36 h998:s3 run `6bb25627-6db4-8328-822b-730ffb411bc8` was IN_PROGRESS, `chat_ref=null`; its report issue #2286 is PUBLISHED_VERIFIED.
- :48 h998:s4 run `d6133d38-2df8-8325-a447-0af952dbe9da` was IN_PROGRESS, `chat_ref=null`; cached latest result remained h997:s4 Enheduanna, not this run.

The four executions overlap and are not in nominal phase order. This is an observed run-envelope state, not a diagnosis of scheduler retry, queue, skip, or worker identity semantics. The current :48 task's next-run field remains stale at its current scheduled slot.

No task ID, enabled state, schedule, phase, prompt, ownership, branch, signet, or conversation name was changed. The :12 task remains disabled. No sixth task was created.

**Return pin:** `H998_S4_MERCER_ASSISTANT_LEVEL / P0_PAPER_AB_QA_ONLY / 8_OF_8_PROTECTED_OBJECTS_EXACT / CURRENT_DISCOVERY_BLOB_UNPARSED / MAIN_SOURCE_POLICY_MISMATCH_PERSISTS / PR2009_INTERIM_ONLY / PR1471_MERGE_REF_SCOPE_CORRECTED / P0_ACTIVE / ORSON_P1_PROTECTED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
