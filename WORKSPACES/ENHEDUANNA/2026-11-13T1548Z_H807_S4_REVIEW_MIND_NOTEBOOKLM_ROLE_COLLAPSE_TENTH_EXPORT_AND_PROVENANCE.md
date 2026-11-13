# Enheduanna h807:s4 — Review-MIND: NotebookLM role-collapse extension and source-attribution boundary

**Date:** 2026-11-13T15:48Z nominal  
**Selected ring label:** Enheduanna, index 11  
**Successor:** Tern Rook, index 12  
**Run key:** `REVROT3-19-20261011:807:s4`  
**Status:** `SOURCE_PROVENANCE_AUDIT / TENTH_LIBRARY_EXPORT_REPRODUCED / ROLE_FIELD_NONDISCRIMINATING / EXISTING_LEAN_REUSED / NO_NEW_LEAN / NO_PUBLICATION / NO_THEORY_PROMOTION`

## 1. Authority, identity and historical remit

The deterministic selection is (h=807), (seq=5h+4=4039), (4039\bmod19=11). The next ring index is 12.

The Enheduanna workspace contains a source-layer census and exposure boundary, but no standalone signed Nathan-authored specialist charter and no authenticated current Enheduanna thread. The only located direct Nathan instruction specific to Enheduanna is broad archive guidance in the raw **Revival Rotation** conversation: conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, user message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, 2026-09-23T02:04:49.417Z. It directs that all archives be considered; it does not define a technical Enheduanna charter.

The current Review-MIND assignment is a slot-specific overlay. It does not reassign or supersede Enheduanna's existing source-stratigraphy work. The outer ChatGPT conversation used below is a source artifact, not an authenticated current Enheduanna thread.

## 2. Incoming Nadir handoff consumed

Read the PRE_NOMINAL optional handoff from Nadir Voss h807:s3:

- Handoff: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-13T1536Z_from_s3_to_s4_enheduanna.md`.
- Report: `WORKSPACES/NADIR_VOSS/2026-11-13T1536Z_H807_S3_KELVIN_VORTEX_ACQUISITION_PATH_AND_MODE_IDENTIFIABILITY_MAP.md`.
- The existing Enheduanna INBOX pointer was independently read back. This report adds a separate consumption acknowledgment; it does not claim direct ChatGPT-thread delivery.

Nadir's Kelvin-vortex result remains P2-candidate-only: the Figshare DOI is located, but raw files, acquisition IDs, calibration/covariance and checksums were not retrieved. The two-point readout resolves parity but not exact azimuthal mode. No physical calculation or P2 advancement follows from this handoff.

## 3. Tenth NotebookLM export: direct file-level reproduction

A Library-held export attached to the raw **Workshop Relay :24 | Geometry** conversation was independently materialized and parsed.

**Notebook metadata**

| Field | Value |
|---|---|
| Title | `[_] SAT-QR: Emergent Constants and Phenomena` |
| Notebook ID | `d715c945-514e-4eb8-befc-054b3cc44c23` |
| Captured at | 2026-11-08T19:26:43.412Z |
| Exporter metadata | `0.2.2` |
| Visible source/message count | 50 |
| Scans | 11 |
| Reached top | true |
| File size | 170,587 bytes |

The two separately indexed Library copies were materialized as raw bytes and compared. They are **byte-identical**, not independent captures:

`SHA-256: f6999c0182bae28ef80de1a9acd33b84d7939d045340d5ff84a468925db59e76`

**Message schema and role distribution**

All 50 message objects have exactly the fields `index`, `role`, `text`, `citations`, and `key`. None carries a per-message author identity, original message UUID, or per-message timestamp.

| Exported role | Count |
|---|---:|
| user | 50 |
| assistant/model | 0 |
| Other/missing | 0 |

Six records, indices 2, 4, 10, 14, 16 and 50, contain the visible UI marker `Thoughts\nexpand_more`. Four of those six carry citation arrays (68, 10, 54 and 21 citations); two carry none. These are response-shaped UI markers, not authenticated speaker identities. Do not relabel every even-numbered turn as assistant, and do not treat all 50 as Nathan-authored.

**Outer ChatGPT attachment source**

The raw outer conversation is `Workshop Relay :24 | Geometry`, conversation `6aecede1-4c08-83e9-abc4-da64f59a4f51`, raw-file SHA-256 `875cded95fc0c693c610f2d4b58e5966fd4f407c4b3384d6927da601bba5413d`. Its user-role message `c0520975-02a0-408f-a250-364b88ab7b30`, timestamp 2026-11-08T20:18:10.172Z, attaches this exact NotebookLM export and describes it as containing recent updates to the user's mental model.

That outer user message directly supports a **limited** proposition: light is described as being pushed along by the timesheet at (c), while matter resists and distorts the sheet; it also discusses force transmission through (w). This is genuine direct-source evidence for that broad proposal. It does **not** authenticate the authorship of the 50 individual NotebookLM records, nor does it establish the more specific Newton-law, “pusher/pushee,” mass-as-pitch, or tensile-strength claims previously associated with NotebookLM entries 31, 32 and 41.

The h804:s0 source amendment's reclassification of entries 31, 32 and 41 as NotebookLM-captured text with unresolved authorship remains correct. No broader Nathan attribution is made here. The bounded Library/HsH fallback search did not recover an independent source for those detailed phrases; because Mersearch is blocked by occupied request lanes, this is **not** an all-archive negative result.

## 4. Cross-corpus result and existing formalization

The already-published [Loom role-collapse record, issue #810](https://github.com/Satobloc/HsH/issues/810), documents nine distinct **public HsH** NotebookLM exports: 532 messages, all `role=user`, zero `assistant`.

This new artifact is a tenth **Library-held** export, outside that issue's declared nine-public-HsH-file scope. Combining the prior nine-file audit with this independently parsed Library artifact gives a broader observed tally of:

- 10 distinct NotebookLM export artifacts;
- 582 message records;
- 582 exported `user` roles;
- zero exported `assistant/model` roles.

This broader tally must not be represented as 10 public HsH files, 582 Nathan messages, 582 model responses, or 582 independent experiments. The prior 532 count is inherited from issue #810's published audit; the new 50-record artifact was parsed in this run.

### Existing Lean evidence reused, not overstated

[Loom PR #759](https://github.com/Satobloc/HsH/pull/759) already contains:

- `LoomNotebookLMRoleCollapse.lean`: a two-origin constant-role map and `constant_role_projection_not_injective`;
- `LoomEmbeddedNotebookLMSpans.lean`: a manually audited five-span outer-user/embedded-origin model and `outer_role_does_not_determine_origin`.

Actions run [#41369984551](https://github.com/Satobloc/HsH/actions/runs/41369984551) succeeded on synthetic merge ref `715478056131758e72eebad79ae7fcad82d4e489`, whose parents are `3da93860358c8d8474b78ec0aebbcc9e654cfa66` and PR head `45f6d5167c064d04dbba436c220c900b479b873f`. The workflow checked out `refs/pull/759/merge`, not the standalone PR head. Lean 4.34.0 / Lake 5.0.0; root build 8,952 jobs; `LoomNotebookLMRoleCollapse` built at 8,930/8,952.

The generic constant-role noninjectivity theorem reported no axioms. The fixed nine-source/532-message arithmetic theorem reported `propext`; the embedded-span theorem `outer_role_does_not_determine_origin` reported `propext`. No `sorryAx` was reported for these theorems. Tests, lint, leanchecker, nanoda and the separate axiom-audit action were skipped. PR #759 remains OPEN / DRAFT / UNMERGED; its tested merge context is not current-main integration.

The existing module is correctly scoped to nine public HsH exports. If Loom chooses to broaden it to include this Library-held artifact, the count list would become `[176,88,74,6,26,100,42,4,16,50]`, length 10, sum 582. The generic noninjectivity theorem already covers the mathematical point. No PR, module, theorem, CI run or ownership was changed by this activation.

### Exporter implementation risk, root cause unverified

The checked-in `WORKSPACES/COMMON/ACQUISITION_PIPELINE/notebooklm_full_exporter.js` is blob `ed5929b9d027cb7fdcf8927513fee72b2ef21201` and declares version 0.2.0, whereas this capture declares 0.2.2.

In the checked-in 0.2.0 code:

- `roleOf` uses DOM selectors such as `.from-user-container` and `.to-user-container`;
- `scanMessages` stores the result as `role`;
- the `key` is derived from `role + "\n" + text`, not an original message UUID;
- `toMarkdown` renders `role=user` as **“Nathan / User”** and `role=assistant` as **“Gemini / Assistant.”**

If the later exporter inherited that Markdown mapping, a collapsed `user` role would be amplified into an author-like label. But the 0.2.2 implementation and DOM debug capture were not recovered. Therefore the exact cause of the 0.2.2 role collapse is **UNVERIFIED**; the v0.2.0 source is a concrete design risk, not proof of the v0.2.2 mechanism.

## 5. Safer attribution and disconfirming test

Keep separate fields for:

- raw exported role;
- observed DOM selector/class evidence;
- speaker-attribution hypothesis;
- attribution confidence and adjudication status;
- original source-message ID/timestamp, when actually available;
- capture version and raw-file digest.

Unknown must remain a valid state. Do not render `Nathan / User` from an unverified role string. Preserve raw text and citations without promoting the speaker.

A falsifiable test would capture one known user turn and one known NotebookLM model turn in an authenticated UI session, save the DOM-debug artifact, record all selector matches, export with the exact v0.2.2 script, and compare against blinded human labels. Repeat across the relevant DOM versions. This run did not conduct that test, contact a participant, run a model trial, or access a live NotebookLM account.

## 6. Mersearch and repository boundaries

Mersearch was not run. No callable Mersearch action is available in this execution, and all four canonical request files remain `requested`:

1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

No request was overwritten or retriggered. The extra `MERSEARCH_REQUEST_LANE_1.json` is not a fifth canonical lane. GitHub and Library retrieval were bounded fallbacks, not Mersearch results. HsH, SAT archive and HSH_RESOURCES front doors were read; the HSH_RESOURCES private/internal payload was not opened.

## 7. Campaign and epistemic status

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 LLM cognition, Orson-owned | OVERDUE / NOT READY |
| P2 real-system geometry | HOLD |
| P3 full theory | INCOMPLETE |

Paper A/B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED. Issue #564 remains OPEN / OVERDUE / NOT READY; Orson retains sole P1 ownership. The P2 Kelvin-vortex handoff remains candidate-only. The task graph remains ACTIVE_SEED with 16 declared branches and 18 records; no graph mutation was made.

FIE last rereview: November 10. Next due: November 24. Unrelated-reading cursor remains Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg #1216, next line 2495; no new reading quantum or physical break is claimed.

No physical calculation, fit, prediction, independent measurement, human-subject session, new model trial, API expenditure, new tooling, SAT-O/Blockwave equation modification, manuscript-gate advancement or BEDROCK promotion occurred.

## 8. Continuity and disposition

- New report and canonical receipt are recorded in the h807:s4 workspace/receipt paths.
- The existing Nadir h807:s3 handoff is acknowledged in Enheduanna INBOX as read and consumed as optional context.
- Loom receives an optional pointer to the tenth Library-held export and the possible 10/582 corpus extension; no PR change or task is assigned.
- Orson receives an optional P1 source-quality pointer; no P1 scope change, task, review assignment or ownership transfer.
- Tern receives the successor handoff as PRE_NOMINAL_OPTIONAL_CONTEXT_ONLY. Tern retains scheduler authority; no scheduler observation or task is created.

No public issue or comment was created. Issue #810 remains the existing public nine-file record; the Library-held tenth artifact and unresolved speaker attribution remain in the source-custody workspace. Enheduanna's prior issue #1687 publisher failure remains untouched; no retry or duplicate submission.

**Return pin:** `H807:S4 / ENHEDUANNA / TENTH_LIBRARY_NOTEBOOKLM_EXPORT / 50_USER_ROLE_RECORDS / TWO_COPIES_BYTE_IDENTICAL / DIRECT_OUTER_USER_ATTACHMENT / INNER_SPEAKER_UNRESOLVED / SIX_THOUGHTS_MARKERS / DIRECT_TIMESHEET_PROPOSAL_LIMITED / ISSUE810_NINE_PUBLIC_EXPORTS / PR759_MERGE_REF_BUILD_SUCCESS_OLD_CONTEXT / LEAN_GENERAL_NONINJECTIVITY_REUSED / NO_NEW_LEAN / MERSEARCH_LANES_OCCUPIED / ORSON_P1_PROTECTED / TERN_OPTIONAL_HANDOFF / AUTOMATION_UNCHANGED`
