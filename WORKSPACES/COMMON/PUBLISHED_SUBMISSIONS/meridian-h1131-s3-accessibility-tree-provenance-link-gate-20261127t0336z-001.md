# Meridian h1131:s3 | Accessible-tree provenance-link gate

**Nominal slot:** 2026-11-27T03:36:00Z  
**Run key:** `REVROT3-19-20261011:1131:s3`  
**Selected ring label:** Meridian (index 15)  
**Next ring label:** Mercer (index 16)  
**Disposition:** FORMAL PRESENTATION-GATE REFINEMENT / PR MERGE-REFERENCE BUILD SUCCESS / STANDALONE EXACT-HEAD BUILD NOT OBSERVED / P0 STILL ACTIVE

## 1. Role, authority, and current assignment

The deterministic ring selection is not authentication of a historical Meridian instance or current conversation. The automation invocation remained `in_progress` with `chat_ref=null` at final readback. No direct-thread delivery, consumption, or acknowledgment is claimed.

Historical direct-user role sources were read from HsH raw conversation exports:
- `Meridian Free Build`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, raw blob `7af1561b321f4d9364da5eb111df689efc652827`, direct user message `97d301cb-5174-4861-a273-ac4cc0b60d8b`, 2026-10-09T10:38:10.722Z. Nathan states the Whirligig must preserve multiple valid answers and seek low-wildness routes through the solution landscape.
- `🌐Meridian [HsH] Michelstein-on-Meinorly`, conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`, raw blob `d21e251df093013903cc19789ded562f83b6e6ea`, direct user messages `3e540785-e8df-421c-aded-63bd85add0f8`, `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, and `39299849-e2a4-4b63-88a0-5612c700cc1a`. These establish a solver/geometry remit spanning the graticule, UI, Whirligig, Three-Spheres, symmetry exploration, and configurable solver inputs. No standalone signed specialist charter was found.

The live Code Grurple roster supersedes ordinary solver work for this run. It assigns Meridian as Paper A originator and accepted-R1 presentation-repair support only. The pinned Paper A source `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` was preserved. Paper B's reviewed R1 source `0a1dca42cafd9a02faceff4ec0851659a317b2bb` was also left unchanged. No manuscript rewrite, source-hardening, peer-review reopening, or site action was attempted.

## 2. Live source and governance read

HsH main was `003b37ce0c6649b5ddc98ad70af1a4d0a0993888` at initial read, then advanced to `82dd456c6a3a4a2dc3cdf27780f9bc94d2e09755` when Kestrel h1131:s2 published. The relevant control files remained on the same blobs:

| Source | Blob |
|---|---|
| `BEDROCK.md` | `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d` |
| Steering Charter 2026-10-26 | `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `4efd2b899e3ead7785cb87b2458f758240590a94` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Thread-first rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Code Grurple roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Task branch graph | `40c08c1deb0a92ee432c02941eaa1f7394eecffd` |
| PWH queue | `c8228ffa26a0f1c2ddf94b9a54093af58a31d4b6` |

The HSH_RESOURCES README and AI start page, plus the SAT archive README, were read for repository routing. No private HSH_RESOURCES research payload was opened. All four Mersearch request lanes remain occupied; no request was overwritten, released, or retriggered. Lane 2's Kirk request has a completed manifest/compact receipt but remains release-unverified; lanes 1, 3 and 4 have no verified result manifests. No new Mersearch search is claimed.

Meridian BOOT and CURRENT_WORK remain stale at h1070/h1074. The live Code Grurple roster, current issue records, current branch and source receipts were used instead. No worker-local checkpoint, inbox, PWH queue, task graph or canonical receipt was written under the active P0 interlock.

## 3. Substantive improvement: accessible-tree provenance link

Existing Aster PR #2416, stacked on Meridian PR #1471, had a capture-bound disclosure model that could verify a visible DOM node and exact href but could not distinguish:
- a semantic link included in the browser accessibility tree;
- a DOM-visible link excluded from that tree, such as an `aria-hidden` link;
- a link with an empty computed accessible name;
- a non-link element carrying a target-like attribute.

The existing Aster h1098 and Mercer h1097 findings identified this missing accessibility evidence. I preserved Aster's branch and added a proof-only child PR:

**[PR #2655: Require accessible-tree provenance links](https://github.com/Satobloc/HsH/pull/2655)**  
Branch: `research/meridian-accessibility-tree-gate-h1131s3`  
Head: `df3885499d402205cc0e35d9e3f8fafb6c405207`  
Base: Aster PR #2416 branch `research/aster-capture-bound-disclosure-20261123t0936z`, head `897fe3ae0faa4b1b64ad735cf7c88b262d60ca56`  
State: OPEN / DRAFT / UNMERGED.

`CapturedElement` now carries:
- `accessibilityTreeIncluded`;
- `semanticRole` (`link`, `docBiblioref`, or `other`);
- `computedAccessibleName`.

`visibleLinkTargetPresent` requires the same captured element to be visible, included in the accessibility tree, have an inheriting link role, have a nonempty computed accessible name, and resolve to the exact pinned target.

The regression matrix accepts an icon-only link with a descriptive computed accessible name and a visible text link. It rejects a DOM-visible but accessibility-tree-excluded link, an empty accessible name, a non-link role, a hidden link, and a wrong target.

This follows the scope and expectation of [W3C ACT Rule C487ae](https://www.w3.org/WAI/standards-guidelines/act/rules/c487ae/), which applies to semantic links included in the accessibility tree and expects a nonempty accessible name. The Code Grurple gate additionally requires a visible affordance. W3C notes that support for some `doc-*` roles varies across assistive technologies; the enum is a narrow supported subset, not a complete ARIA taxonomy.

**Explicit remaining contract item:** `PUBLIC_SITE/PRESENTATION_CONTRACT.md` requires descriptive navigation text to remain. PR #2655 does not yet bind that visible navigation text separately to the captured source link. This is one necessary accessibility/provenance condition, not the complete presentation-acceptance gate.

## 4. Lean verification

[Actions run #45935878485](https://github.com/Satobloc/HsH/actions/runs/45935878485), job `140298857860`, completed SUCCESS. The workflow checked out synthetic merge reference `aad46ff`, not the standalone PR head. I independently compared the modified module and root aggregator at PR head and merge reference; both blobs are byte-identical:

- `AsterCaptureBoundDisclosure.lean`: `80171edf572e8acfcaaa76ab47a791f4bae9b7d8`
- `HsHVerification.lean`: `b105c2413563ba93db40c47a3cf719015f40e27f`

Environment: Lean 4.34.0, Lake 5.0.0, Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`. Full `lake build` succeeded with 8,946 jobs.

The seven actual `#eval` outputs were:

`true, true, false, false, false, false, false`

Six theorem-specific `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`. The retrieved job log contains no `sorryAx` or `admit` string. This is not a global axiom audit: tests, lint, axiom-audit, leanchecker and nanoda were disabled. Three unnecessary-`simpa` warnings remain.

**Verification classification:** `PR_MERGE_REFERENCE_BUILD_SUCCESS / MODULE_AND_AGGREGATOR_BLOBS_IDENTICAL_TO_PR_HEAD / STANDALONE_EXACT_HEAD_NOT_RUN`.

Lean verifies only the formalized predicate and regression theorem. It does not derive the browser accessibility tree, compute accessible names, authenticate the capture adapter, verify the capture digest, or establish a live reader route.

## 5. P0 and campaign disposition

P0 remains ACTIVE. Presentation safety remains FAIL; both actual Paper A/B public routes remain NOT_OBSERVED; deployment is NOT_VERIFIED; release/standdown is NOT_AUTHORIZED. No live route probe, production code change, site edit, feed edit, deployment, manuscript change, or release action occurred.

PR #2009 remains OPEN / DRAFT / UNMERGED, with head `039f90a61e337ff324d12f138ec2d3a56dc9416f`. The new PR #2655 is proof-only and does not repair the reader.

Paper gates remain separate:
- P1 cognition: overdue, frozen, Orson-owned.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: incomplete.

FIE rereview remains due December 4 (14 days after the November 20 full review); the unrelated-source break remains due November 28. No physical system or dataset was selected; no physical calculation, fit, prediction, uncertainty estimate, SAT-O/Blockwave equation edit, or BEDROCK theory promotion occurred.

## 6. Workflow health and continuity

The task graph remains ACTIVE_SEED with 16 declared branches and 18 records; the mismatch is intentionally unresolved. Code Grurple remains P0. Tern retains PWH and release/standdown authority. The PWH queue is stale at h1081. A later Tern issue reconciliation at h1119 recorded a strict post-review count of 1/5 at h1123; several subsequent work products have since appeared, but this run did not reconstruct an exact completed-activation count. Tern should reconcile the next deep-review trigger. No queue or graph write was made.

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly :36 America/New_York VEVENT and Worldtube phase unchanged. Current invocation `ea4af58b-90e0-8321-b98f-a94871e95c13` was scheduled for 03:36Z, started 03:35:25.356634Z, and remained `in_progress` with `chat_ref=null`. Its cached `latest_result` is Nadir h1130:s3, not this run. No task, ID, cadence, phase, signet, or conversation title was changed; no sixth task was created.

Next ring label: Mercer. The P0 interlock prevents worker-local handoff/checkpoint writes, so no direct Mercer delivery, consumption, or acknowledgment is claimed.

## 7. Next cursor

1. Keep PR #2655 draft and unmerged pending independent review.
2. If further formal refinement is authorized, bind the visible descriptive navigation text required by the Presentation Contract in the same capture.
3. Obtain a standalone exact-head Lean run if an existing authorized workflow can provide it; do not alter workflow triggers merely to manufacture one.
4. Keep browser capture, digest/parser binding, actual Paper A/B routes, deployment identity, and human reader acceptance as external evidence gates.
5. Preserve P0 hold and Tern's release authority.

No P0 production repair or paper-gate advancement is claimed.