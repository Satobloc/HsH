# Ariadne claim-scoped source-lineage gate and Mersearch completion

**Status:** `CLAIM_SCOPED_LINEAGE_GATE_ADDED / MERSEARCH_RECEIPT_VERIFIED / PUBLISHED_VERIFIED / LEAN_CI_PENDING / RAW_JAN22_SOURCE_UNRESOLVED`

## Rotation and identity

- Run key: `REVROT3-19-20261011:494:s3`.
- Deterministic selection: Ariadne; next ring identity: Alberr.
- This selection does not authenticate a historical Ariadne ChatGPT instance or thread.
- Ariadne's recovered remit remains source archaeology, provenance/chronology, revival reconstruction and cross-worker connective work. The workspace README is an assistant-authored role synthesis; it is not itself a raw Nathan message.
- The oversized raw Ariadne export returned an empty body through the current repository reader. Per onboarding, this is treated as a size/access diagnostic, not an empty-source finding. This run uses the source-backed README, prior audit, raw-message locators and Mersearch receipt; it does not claim a fresh raw-body read.

## Control and branch preflight

Read the live BEDROCK (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`), Steering Charter 2026-10-26, Three Paper Campaign 2026-10-26, New Instance Start Here, three-repository onboarding, Revival Rotation V3, scheduler authority, current branch graph, Ariadne workspace materials, incoming handoffs and predecessor receipts.

- Main head at preflight: `d750201087adbba19589f77db8fe3da815eed16a`.
- Existing Ariadne draft PR #790 branch: `research/ariadne-primary-role-transclusion-20261027t1924z`.
- After this additive change: 54 commits ahead / 5105 behind current main at the latest comparison; branch is diverged and not merge-ready.
- Existing PR #790 was extended; no new branch or PR was created.
- Existing :36 automation remains enabled with its original identity, schedule and phase. No sixth task or scheduler mutation.

## 1. Mersearch request closure

The prior Ariadne audit recorded request `ariadne-kirk-riley-source-lineage-20261031-1119` as `SUBMITTED_NOT_VERIFIED`. The request-scoped manifest and compact receipt now exist and were independently fetched/read back:

- Mersearch stable ref: `mersearch-stable-1.0`.
- Stable commit: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- Request commit: `53a2c8f685b2d219eea6266f8c161060ce0cd420`.
- Three checked-out roots: SAT_THEORY_ARCHIVE_2023-25, HsH and HSH_RESOURCES, at the exact commits recorded in `RUN_MANIFEST.json`.
- Coverage: 15,936 files, 20,842,329 records, 381 hits, 14 distinct source paths.
- Hits by root: HsH 372; HSH_RESOURCES 9; SAT archive 0.
- Exclusions: QUARANTINE, PRIOR_ART and the request directory itself; extension, size and policy exclusions still apply.
- Raw `SEARCH_RESULTS.json/.md` are withheld by the bridge. The compact receipt has no verbatim excerpts. The 14 distinct paths are not 14 independent witnesses.
- The receipt exposes multiple path aliases for the same raw Ariadne export and the same user-role Revival Rotation message. Path multiplicity must not be counted as independent source acquisition.
- The bridge runtime applied a local manifest-variable hotfix; the stable Mersearch branch was not modified.

**Updated disposition:** `SEARCH_RECEIPT_VERIFIED / BOUNDED_NAVIGATION_ONLY`. This closes the prior pending-receipt state, not the source-recovery question. The search did not recover the raw January 22 Kirk conversation, a standalone RileyMind file, standalone TOS_S1 corpus, Chronological Bridge, workflow diagram or NotebookLM source manifests. Their absence from this bounded receipt is not a global absence proof.

## 2. Source stratigraphy carried forward

The preceding source audit is preserved at `WORKSPACES/ARIADNE/2026-10-31T1119Z_KIRK_READY_ROOM_SOURCE_LINEAGE_AUDIT.md`, blob `f8f3d18764fd60eebbc5b2261c6f1430ac536cc2`.

Its exact normalized comparison found a 12,598-line common core (608,387 bytes; normalized-core SHA-256 recorded in that audit). The core occupies KIRK-side lines [1, 12599) and READY_ROOM-side lines [123, 12721). SequenceMatcher line-sequence ratio: 98.882%.

Calculated from the audited source counts:

- Common core is 98.7149% of the 12,762-line KIRK-side artifact and 99.0331% of the 12,721-line READY_ROOM-side artifact.
- After LF normalization, the 608,387-byte core is 98.4552% of the 617,933-byte KIRK block and 99.0782% of the 614,047-byte READY_ROOM block. The corresponding raw CRLF source-section sizes are 630,365 and 626,438 bytes.
- KIRK-side unique suffix: 164 lines.
- READY_ROOM-side unique material: 122 leading lines plus one trailing line.

The recovered THE_WHOLE_READY composite contains a KIRK source-guide summary and generated RileyMind material, but not the full normalized KIRK_mind or READY_ROOM source block; exact substring checks against both source blocks return -1. It is a derived summary/output, not an independent witness for the underlying source claims.

The standalone version 1.2.1 instruction document and embedded version 1.3 instruction section remain distinct source objects. No authenticated composition date or author metadata establishes chronology from the higher version label. The RileyMind profile is embedded; no standalone RileyMind file was recovered. Two NotebookLM chat/export outputs report 12 and 5 sources, but source manifests are absent; generated summaries/in-character output are not independent evidence about the source material.

The raw Revival Rotation message locator is conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, message `41fe4df4-fa3f-4045-bf99-0f095903c052`, timestamp 2026-09-23T02:06:05.180Z, outer role `user`, `author.name=null`. It establishes that Kirk material was intended to inform revival strategy, particularly human simulation. It does **not** establish authorship of the two transcript-like artifacts or the embedded Riley profile. The raw export itself was not re-read in this run; the current API again returned an empty body, so this role/content attribution remains source-locator-backed, not a new raw-body authentication.

The January 21 podcast/SRT predates the January 22 user request and cannot derive from that later event; it may reflect an earlier upstream bundle. Do not merge it backward into the unresolved January 22 thread.

## 3. Architectural improvement: claim-scoped lineage

A whole-artifact binary label is too coarse when two artifacts share a verified content core but also contain unique spans. The unit of independence is the **claim plus the spans supporting it**, not the filename.

The new four-state contract is:

1. **DEPENDENT (shared-content):** the claim's support in both artifacts lies within a verified shared normalized core, so the two copies are not independent content witnesses for that claim. This does not establish copying direction or a common acquisition event.
2. **INDEPENDENT:** both primary-origin sets are nonempty and proven disjoint, with no shared-core evidence for that claim.
3. **UNRESOLVED:** neither shared-core dependence nor disjoint primary ancestry has been established.
4. **CONFLICTING:** shared-core and disjoint-origin evidence are both present; neither is silently preferred.

Consequences:
- Claims supported inside the verified common core are dependent witnesses.
- Unique prefixes/suffixes outside that known core are **unresolved**, not automatically independent.
- A composite containing the full normalized text of one artifact is not an independent witness for claims supported by that embedded text.
- Independent analysis of one source is distinct from independent source acquisition.
- A missing lineage record is not evidence of disjoint ancestry.
- No direction, date, author, role, chronology, or cognition claim follows from content overlap alone.

This is an evidence/workflow model. It is not an LLM cognition result, a human-subject experiment, or an H(s)H physical claim.

## 4. Lean formalization

Added to existing Ariadne draft PR #790:

- Module: `FORMAL_VERIFICATION/HsHVerification/AriadneClaimScopedLineage.lean`.
- Module blob: `89cce1bf7b6a672976489dcf21347f40dd0cd975`.
- Root import blob: `a6e9b8146a241c2e0aa33316789449749b54ee6b`.
- Initial exact branch head `5fb0ec9990d4d25ed175858697836adb37077b8f` failed in run [#41213618092](https://github.com/Satobloc/HsH/actions/runs/41213618092): `DisjointPrimaryOrigins` was a Prop-valued structure and could not be used directly as the payload of `Option` (which expects a Type). The source had no explicit `sorry`; `sorryAx` warnings followed failed elaboration/error recovery and are not proof evidence.
- Repair: wrap the Prop-valued witness in `Nonempty`; repaired module blob `93103a37b305c896801e427b1835261e415f9709`.
- Repaired exact branch head: `6ad1e1759643f181318848449fea4280ee459de1`.
- Repaired exact-head Actions run: [#41214066564](https://github.com/Satobloc/HsH/actions/runs/41214066564), `QUEUED` at this amendment. No successful build or proof claim yet.

The module formalizes half-open line-span containment, claim support inside an externally attested shared core, four-state evidence classification, the requirement that independence carry nonempty disjoint primary-origin evidence, and the rule that missing lineage remains unresolved.

The shared-core attestation is an explicit external Boolean input transcribed from the source audit. Lean does not read the private Library exports or verify the extraction. Compilation, if successful, proves only the formalized conditional logic and interval statements, not source authenticity, authorship, chronology or content truth.

The PR branch is 5104 commits behind current main and 53 ahead. This exact-head build is branch-local and is not merge-readiness evidence. No rebase or merge was attempted.

## 5. Publication and coordination

A public-safe methodology-only artifact was submitted through the existing issue publisher:

- Issue: #1156.
- Submission ID: `ariadne-claim-scoped-lineage-20261031t1436z-s3-001`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-claim-scoped-lineage-20261031t1436z-s3-001.md`.
- Expected SHA-256: `6d8e2b0aea1157d16b492c56ad5d775922f3252b2bb666ac2403dabaa7fff750`.
- Status: `PUBLISHED_VERIFIED`. Publisher comment `6545248931` confirms destination and SHA-256. Independent issue-payload/file readback matched exactly (2,355 bytes); published file Git blob `eb95262ab6ca0a3ebbc52bff6b0ecdaa9312a20e`; publisher commit `7161bdd0e4ae0f8cec3832546ff388ce8a61eeea`.

The issue contains no raw private source excerpts, private source identifiers, or source hashes. Do not duplicate the submission; verify issue #1156 and the expected destination on the next authorized turn.

No Alberr task or handoff assignment is issued. His workspace charter gives him total discretion and no productivity obligation. The next ring identity is Alberr; this report is available if independently useful, but no response or consumption is assumed.

## 6. Boundaries and next cursor

- Code Grurple remains ACTIVE.
- Nov 9 minor, Nov 30 major and Dec 14 full-theory paper gates remain separate and unchanged.
- No manuscript, PDF, reader, feed, or paper-gate change.
- No BEDROCK amendment or theory promotion.
- No SAT-O or Blockwave equation changed.
- No physical calculation, fit, or prediction.
- No human-subject session or LLM cognition experiment; Orson's P1 ownership remains untouched.
- All four Mersearch lanes were left intact; no request was overwritten or resubmitted.
- No new tool, dependency, paid service, branch, PR or automation was created.
- FIE re-review is not due; last full review was October 27. A deliberate unrelated-reading break was completed in the immediately preceding relay sequence, so this run changed lens to claim-scoped source lineage rather than repeat the same reading.

### Next exact cursor

1. Verify Lean run #41213618092 at the exact branch head; inspect compiler output and theorem-specific axiom reports. If still running, preserve `SUBMITTED_NOT_VERIFIED`; if failed, record the exact failure and repair only this module.
2. Verify issue #1156, publisher comment, fixed destination and exact SHA-256 readback. Never duplicate the submission.
3. Recover the raw January 22 Kirk conversation identity/export and the standalone Riley/Chronological Bridge/workflow/source-manifest objects, if present.
4. Populate primary-origin sets only when exact source roots are recovered; reclassify each unique claim span separately.
5. Keep the source-lineage gate separate from Orson's P1 cognition trial and from all physical-theory claims.


## Amendment 01 | 2026-10-31T1518Z

- The first exact-head Lean run #41213618092 completed FAILURE at the new module's Option payload. Because DisjointPrimaryOrigins had only proposition-valued fields, Lean placed it in Prop; Option requires a Type payload. This is a real type/elaboration failure. The log's subsequent sorryAx warnings are not accepted as proof output; the source contains no explicit sorry.
- Corrective change: carry the proof through Option (Nonempty (DisjointPrimaryOrigins ...)). New module blob 93103a37b305c896801e427b1835261e415f9709; new exact head 6ad1e1759643f181318848449fea4280ee459de1.
- New exact-head run #41214066564 is QUEUED. Status remains LEAN_CI_PENDING until terminal success and theorem-specific axiom output are inspected.
- Publisher issue #1156 is now PUBLISHED_VERIFIED: comment 6545248931; expected file retrieved; exact 2,355-byte content equals the issue payload; file blob eb95262ab6ca0a3ebbc52bff6b0ecdaa9312a20e; publisher SHA-256 6d8e2b0aea1157d16b492c56ad5d775922f3252b2bb666ac2403dabaa7fff750.


## Amendment 02 | 2026-10-31T1521Z

- The intermediate Nonempty repair was not compiled: run #41214066564 was cancelled during Lake dependency-manifest generation when the branch advanced. This is CANCELLED, not a compiler failure and not proof evidence.
- Inspection caught that Lean's Nonempty wrapper is itself Prop-valued, so it would not satisfy Option's Type requirement. The latest repair makes DisjointPrimaryOrigins a data-carrying structure with explicit left/right origin identifiers, membership proofs, and a disjointness proof; Option now carries a Type-valued witness.
- Latest module blob: 191929c381335488d280cfdd4faae1c4bba25e61. Latest exact branch head: ee673f74a5b61b3a497f19bf02cf46015a3385c4. Exact-head run #41214178623 is IN_PROGRESS; no success claim yet.
- Latest observed comparison at 2026-10-31T1517Z: PR branch 54 commits ahead / 5110 behind main, diverged and not merge-ready.


## Amendment 03 | 2026-10-31T1524Z

The private Library export bundles were materialized and their embedded source sections re-extracted. This independently reproduces the 12,598-line common block: KIRK 12,762 lines, READY_ROOM 12,721 lines, common block at KIRK [1,12599) and READY_ROOM [123,12721), 608,387 normalized bytes, SHA-256 `32b9b8f18fc220f776bb39a24a760dd759db0df755f5a2293aaedc0878634345`; Unicode-aware SequenceMatcher ratio 98.8816%. The shared block is a content-overlap fact, not proof of causal derivation, direction, authorship or chronology. The READY_ROOM-only 122-line prefix and KIRK-only 164-line suffix remain unresolved.

A source-level correction: the recovered THE_WHOLE_READY section does not contain the full KIRK_mind or READY_ROOM text (both exact substring checks return -1). It contains v1.3 instructions, a KIRK source-guide summary, a first-person passage without raw role metadata, assistant-generated four-field advice and RileyMind reconstruction. THE_WHOLE_READY2/3 are shorter NotebookLM outputs. The earlier claim of full KIRK_mind inclusion at offset 8,252 is withdrawn. The standalone READY_ROOM_README is v1.2.1; version labels do not prove chronology.

The claim-scoped model remains appropriate, but its DEPENDENT state means non-independent as a content witness for that claim, not proven causal ancestry. The shared-core attestation is now independently reproduced by Python from the materialized Library export sections; Lean still treats that comparison as an external input.


## Amendment 04 | 2026-10-31T1526Z

The current Library bundle re-extraction is now the controlling calculation record. The KIRK_mind and READY_ROOM source sections were extracted from one 2,259,195-byte bundle; their raw section sizes are 630,365 and 626,438 bytes. After CRLF-to-LF normalization and Unicode-aware Python str.splitlines(), they contain 12,762 and 12,721 lines. SequenceMatcher(autojunk=False) gives 0.9888160734607385; its largest exact block is 12,598 lines at KIRK [1,12599) and READY_ROOM [123,12721), 608,387 normalized bytes, SHA-256 32b9b8f18fc220f776bb39a24a760dd759db0df755f5a2293aaedc0878634345. Normalized byte coverage is 98.4552% and 99.0782%, respectively.

The common block is shared content, not proof of causal ancestry. The 122-line READY_ROOM prefix and 164-line KIRK suffix are separate claim scopes; absent primary-origin evidence they remain unresolved. The common block begins with a first-person passage, but the source section has no raw role metadata, so that passage is not authenticated Nathan Direct.

The recovered THE_WHOLE_READY source section has 8,124 Unicode-split lines / 814,717 normalized bytes. It contains the v1.3 instruction guide, a KIRK source-guide summary, a first-person passage without raw role metadata, an assistant-generated four-field response and RileyMind reconstruction. It does not contain the full KIRK_mind or READY_ROOM source text. THE_WHOLE_READY2/3 are shorter NotebookLM output sections, not source copies. The earlier offset-8,252 full-KIRK inclusion statement is withdrawn. The separate READY_ROOM_README is version 1.2.1; the embedded guide is v1.3, with no authenticated chronology or author metadata.


## Amendment 05 | 2026-10-31T1531Z

- The data-carrying witness version reached compilation in run #41214178623 but failed at line 148: after dependent case analysis, the goal had reduced to `some witness = some witness`; the proof incorrectly supplied the pre-elimination equality `hd`. The proof is corrected to `rfl`. The failed run's `sorryAx` output is error-recovery after the failed declaration, not source-level `sorry` or proof evidence.
- Checkout identity audit: run #41214178623 used default `actions/checkout@v4` on a pull_request event. The recorded event GITHUB_SHA was `593eeda3519350d970f9e2a2f306029642d4a6ec`, not the PR head. It was a merge-ref build, not an exact-head build.
- Verification workflow improvement committed on the existing Ariadne branch: checkout now explicitly uses `${{ github.event.pull_request.head.sha || github.sha }}` and the environment step records both event GITHUB_SHA and `git rev-parse HEAD`. Workflow blob `a4d1fb0d460fe2a0ea85715ad46b0cfc26ed8443`; workflow commit `3e1dd091c7165cde63e302e9609a33a194ff6eb3`.
- Corrected module proof is `rfl`; module blob `7958942a1dee42bef42926815a96437575540111`; latest branch head `c06f161ecd2572684963759274a5921abf15cf6f`.
- New run #41214856914 is PENDING. It is the first run after the explicit-head checkout change; exact checkout must still be verified in its log. No compile success or exact-head proof claim yet.
- Latest branch comparison against main: 57 commits ahead / 5134 behind, diverged and not merge-ready. The current main branch has no FORMAL_VERIFICATION root, lean-toolchain or this Lean workflow; the formalization remains isolated on the existing legacy draft PR.


## Amendment 06 | 2026-10-31T1533Z

- Explicit-head workflow run #41214856914 has moved from pending to IN_PROGRESS. Job #124577423249 is at checkout; compile has not started. The workflow now sets checkout ref to the PR head SHA and records git rev-parse HEAD. Exact checkout remains to be verified from the completed job log.
- Current main head observed: `25af8fa082a358f2c07cee79e7f1c2919af2e7e1`. Current branch comparison: 57 commits ahead / 5138 behind; still diverged and not merge-ready.
