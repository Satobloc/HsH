# Provenance Amendment 02 | NotebookLM capture role field is non-discriminating

**Date:** 2026-11-13  
**Applies to:** `2026-11-13T1200Z_LANE00_NOV8_MODEL_PROVENANCE_AND_GEOMETRY_TYPE_CROSSWALK.md` and `NATHAN_DIRECT_2026-11-08_MODEL_PROVENANCE_AMENDMENT_01.md`.  
**Status:** internal source-custody qualification. No equation, theory status, BEDROCK priority, or control authority is changed.

## 1. New source-carrier audit

The Library artifact `[_] SAT-QR_ Emergent Constants and Phenomena__NotebookLM_export.json` has NotebookLM notebook ID `d715c945-514e-4eb8-befc-054b3cc44c23`, capture time `2026-11-08T19:26:43.412Z`, exporter version `0.2.2`, 50 visible messages, 11 scans, and `reached_top=true`.

Two Library copies exist. They have the same notebook ID, capture timestamp, visible-source count, and byte size (170,587 bytes); the later copy is a duplicate capture, not independent corroboration.

The export contains exactly 50 records with `"role": "user"`, and no `"role": "assistant"` or `"role": "model"` records. The role field is therefore **non-discriminating** in this export. It cannot authenticate the author of any individual passage. The file has no ChatGPT message UUIDs and no per-entry author identity or timestamp.

Entries 30, 32, 34, 36, 38, 40, 42, and 44 are long explanatory passages containing polished exposition and equations. Entries 31 and 41 are shorter first-person passages. Style is not authorship evidence: neither group can be assigned to Nathan or to a model from this export alone.

## 2. Required attribution correction

Reclassify entries 31, 32, and 41 as:

**NotebookLM-captured text; authorship unresolved.**

Do not call them Nathan Direct merely because the export labels every record `user`.

Consequences:

- Entry 31's “Newton's first law” wording and entry 32's “Newton's Third Law” wording form a sequence inside the capture. The sequence does not establish an authenticated Nathan correction.
- The timesheet-pusher / coil-pushee account, mass-as-pitch-angle, inertia-as-tensile-strength, maximum exposed-worldtube-area proposal, black-hole gauge-alignment account, and horizon mass-to-zero claim are propositions present in the NotebookLM capture. Their original author and derivation remain unresolved.
- These passages may be useful as hypotheses or historical source text, but they are not independently attributable to Nathan Direct until their originating conversation, note, or other author-authenticated source is recovered.
- The separate raw ChatGPT messages cited in the Lane 00 report retain their own author-role, message-ID, timestamp, and ancestry evidence. This amendment does not downgrade those sources or alter the October 21 / November 4 / November 8 chronology they establish.

## 3. Equation custody remains unchanged

No historical equation is rewritten or promoted.

| Artifact | Preserved identity |
|---|---|
| Unbylined SAT-O1 `SAT O1 4D.txt` | Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; first extant commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, 2025-10-27T00:40:28Z |
| User-supplied Blockwave attachment `🧱BLOCKWAVE.txt` | Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; full SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`; first extant commit 2026-10-08T02:42:49Z; internal authorship unresolved |
| Clean Blockwave action | Assistant-origin established by raw ChatGPT message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, 2025-10-19T12:29:46.538Z |

The original SAT-O1 and Blockwave variants remain separate from the assistant-generated clean action. The existing factor/convention correction remains separately recorded in [issue #1118](https://github.com/Satobloc/HsH/issues/1118). No corrected equation is silently substituted for a historical original.

## 4. Mathematical and empirical boundary

No new Lean module was justified by this attribution correction. The existing PR-associated merge-reference builds listed in the Lane 00 report remain evidence only for their formalized conditional statements; they do not validate authorship or source translation.

No physical calculation, numerical fixture, CODATA scoring, fit, prediction, observational validation, independent measurement, or paper-gate advancement was performed. No BEDROCK theory promotion.

## 5. Publication and continuity

The single existing public submission remains [issue #1687](https://github.com/Satobloc/HsH/issues/1687), submission ID `enheduanna-nov8-model-provenance-geometry-crosswalk-20261113t1200z-s0-001`.

- Issue body and workspace report match exactly at 17,112 UTF-8 characters.
- Declared SHA-256: `da17e7f71c3295713eee7f3ba8aa06bbb3b7439df3bcf004fa47bc7a0e73a82d`; publisher validation passed before the write attempt.
- Publisher run #43426713071 / job #131889787805 failed at the GitHub Contents API PUT with HTTP 409 Conflict.
- No publisher comment; canonical artifact path remains absent (404).
- Status: `SUBMITTED_NOT_VERIFIED`, not `PUBLISHED_VERIFIED`.

No second issue, edit/reopen retry, workflow rerun, or direct publication-path write was attempted. The existing issue and submission ID are carried forward unchanged.

## 6. Next source cursor

Recover the originating source(s) behind NotebookLM entries 30–44, or establish whether they are copied/generated text. Until then, retain their content as unattributed NotebookLM-captured material. Do not use those entries as Nathan Direct support for the pusher/pushee, Newton-III, tensile-strength, pitch-angle, exposed-area, gauge-alignment, or horizon-limit propositions.
