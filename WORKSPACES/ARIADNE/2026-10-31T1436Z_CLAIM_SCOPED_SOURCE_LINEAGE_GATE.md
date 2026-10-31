# Ariadne claim-scoped source-lineage gate and Mersearch completion

**Status:** `CLAIM_SCOPED_LINEAGE_GATE_ADDED / MERSEARCH_RECEIPT_VERIFIED / LEAN_CI_PENDING / RAW_JAN22_SOURCE_UNRESOLVED`

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
- After this additive change: 53 commits ahead / 5104 behind current main; branch is diverged and not merge-ready.
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
- It is 96.5134% of the KIRK-side bytes and 97.1185% of the READY_ROOM-side bytes.
- KIRK-side unique suffix: 164 lines.
- READY_ROOM-side unique material: 122 leading lines plus one trailing line.

The full normalized KIRK-side text is also present as a contiguous substring in a larger composite at normalized offset 8,252. That composite is another representation of the same content for claims supported by that embedded text, not an independent witness.

The standalone version 1.2.1 instruction document and embedded version 1.3 instruction section remain distinct source objects. No authenticated composition date or author metadata establishes chronology from the higher version label. The RileyMind profile is embedded; no standalone RileyMind file was recovered. Two NotebookLM chat/export outputs report 12 and 5 sources, but source manifests are absent; generated summaries/in-character output are not independent evidence about the source material.

The raw Revival Rotation message locator is conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, message `41fe4df4-fa3f-4045-bf99-0f095903c052`, timestamp 2026-09-23T02:06:05.180Z, outer role `user`, `author.name=null`. It establishes that Kirk material was intended to inform revival strategy, particularly human simulation. It does **not** establish authorship of the two transcript-like artifacts or the embedded Riley profile. The raw export itself was not re-read in this run; the current API again returned an empty body, so this role/content attribution remains source-locator-backed, not a new raw-body authentication.

The January 21 podcast/SRT predates the January 22 user request and cannot derive from that later event; it may reflect an earlier upstream bundle. Do not merge it backward into the unresolved January 22 thread.

## 3. Architectural improvement: claim-scoped lineage

A whole-artifact binary label is too coarse when two artifacts share a verified content core but also contain unique spans. The unit of independence is the **claim plus the spans supporting it**, not the filename.

The new four-state contract is:

1. **DEPENDENT:** the claim's support in both artifacts lies within a verified shared normalized core.
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
- Exact branch head: `5fb0ec9990d4d25ed175858697836adb37077b8f`.
- Exact-head Actions run: [#41213618092](https://github.com/Satobloc/HsH/actions/runs/41213618092), status `IN_PROGRESS` at this receipt.

The module formalizes half-open line-span containment, claim support inside an externally attested shared core, four-state evidence classification, the requirement that independence carry nonempty disjoint primary-origin evidence, and the rule that missing lineage remains unresolved.

The shared-core attestation is an explicit external Boolean input transcribed from the source audit. Lean does not read the private Library exports or verify the extraction. Compilation, if successful, proves only the formalized conditional logic and interval statements, not source authenticity, authorship, chronology or content truth.

The PR branch is 5104 commits behind current main and 53 ahead. This exact-head build is branch-local and is not merge-readiness evidence. No rebase or merge was attempted.

## 5. Publication and coordination

A public-safe methodology-only artifact was submitted through the existing issue publisher:

- Issue: #1156.
- Submission ID: `ariadne-claim-scoped-lineage-20261031t1436z-s3-001`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-claim-scoped-lineage-20261031t1436z-s3-001.md`.
- Expected SHA-256: `6d8e2b0aea1157d16b492c56ad5d775922f3252b2bb666ac2403dabaa7fff750`.
- Status at receipt: `SUBMITTED_NOT_VERIFIED`; no publisher comment or independent artifact readback yet.

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
