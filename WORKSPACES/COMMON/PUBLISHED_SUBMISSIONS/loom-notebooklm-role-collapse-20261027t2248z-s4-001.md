# Loom Review-MIND: NotebookLM export role-collapse provenance gate
Run: REVROT3-19-20261011:406:s4; 2026-10-27T22:48Z. Current assistant performing source-grounded Loom specialist work, not an authenticated historical Loom instance.

## Direct source evidence
Nine separate public HsH NotebookLM export artifacts were fetched and JSON-parsed. All have metadata exporter_version 0.2.2. Their recorded message counts and `role` distributions are:

| Source path suffix | Git blob | messages | user | assistant |
| --- | --- | ---: | ---: | ---: |
| SAT_CONVOS_19/META SOLENOID__NotebookLM_export.json | b67b758e5763a67ab6f354bf9b680a18decc8921 | 176 | 176 | 0 |
| SAT_CONVOS_22/The Solenoid of Being__NotebookLM_export.json (full path has archive emoji and subtitle) | b1c43e34a16724c1d96a27d6e90550a782592c5e | 88 | 88 | 0 |
| 4Oct2026/All the Sweet Spots Together__NotebookLM_export.txt (archive emoji) | 124ef2c12d4af5b27fe295c24f59348f7effedd5 | 74 | 74 | 0 |
| MOSTLY_EARLY_NLM/H(s)H Big__NotebookLM_export.json (archive emoji) | 05c32d5110d8b0ab5547d840d8bfdbf77961d8a7 | 6 | 6 | 0 |
| SAT_CONVOS_22/Weirdness MODES_menu_environment__NotebookLM_export.json (archive emoji) | 4cea6e0f2a9202363f42289cbbc5c3dd027c0f4e | 26 | 26 | 0 |
| SAT_CONVOS_19/subscript-h-H-superscript-s__NotebookLM_export.json (unicode title) | efa8ffba12ad9c129b3f4bb13d2dd9fefaaeb24e | 100 | 100 | 0 |
| SAT_CONVOS_22/PARADIGMATIC__NotebookLM_export.json | 375ba1a3c8533f16144ff213072b0d321a94c1fe | 42 | 42 | 0 |
| SAT_CONVOS_22/SAT GEOMETRY__NotebookLM_export.json (archive emoji) | 253c124c969830ea41710ecb74fd955abe538d96 | 4 | 4 | 0 |
| NLM_BIG_HAUL/H(s)H Big Upload__NotebookLM_export.json (archive emoji) | 3a4489902d44ebd0a21c72d8e8b8956e06336488 | 16 | 16 | 0 |
| **Total** | 9 distinct paths | **532** | **532** | **0** |

The actual message texts show user prompts immediately followed by response-shaped turns, but BOTH carry `role:"user"`. For example META SOLENOID indexes 89-94 alternate between a question about NotebookLM architecture, a first-person architecture answer, a user correction, a revised answer, a user question, and a further first-person response. These are not six independently verified Nathan-authored statements. Indexes 89/90/91/92/93/94 have exported role user throughout.

## Attribution and mechanism
The current checked-in `WORKSPACES/COMMON/ACQUISITION_PIPELINE/notebooklm_full_exporter.js`, Git blob ed5929b9d027cb7fdcf8927513fee72b2ef21201, contains a `roleOf(el)` DOM-selector classifier and `scanMessages()` exports its result. That checked-in script says version 0.2.0 while the nine source artifacts report version 0.2.2. Therefore the exact cause of role collapse in the historical captures is NOT established by the present code read. DOM changes, selector nesting or an uninspected exporter revision are alternatives.

Classification: VERIFIED_SOURCE_FIELD_COLLAPSE in these nine files; HIGH-CONFIDENCE_SPEAKER_MISATTRIBUTION_RISK; ROOT_CAUSE_UNVERIFIED. Do not relabel all even-numbered turns as assistant without checking the original UI/capture provenance. Do not count these exports as 532 Nathan messages or as independent model experiments. Existing Loom issue #760 concerns embedded imported NotebookLM spans inside an outer ChatGPT user message; this is a distinct export-level role field defect.

## Lean and manuscript gate
Existing Loom PR #759 was reused. New module `FORMAL_VERIFICATION/HsHVerification/LoomNotebookLMRoleCollapse.lean` encodes the nine observed message counts and proves that a constant-role projection is noninjective. Source and root import were committed on the existing draft branch, with exact readback of the import. Actual new-head CI status must be checked separately. A Lean proof of this encoding does not authenticate who spoke, validate DOM parsing, establish cognition or imply a physical H(s)H result.

Orson's Nov 9 P1 cognition work should treat role metadata from these exports as untrusted until independently repaired. Preserve raw text, original role, corrected role hypothesis, evidence and confidence as separate fields. The Nov 30 P2 and Dec 14 P3 gates are unaffected.

## Next executable test
On an authenticated NotebookLM UI capture, inspect actual chat-message DOM for one known user and one known model turn, compare selector matches against exporter v0.2.2, run a controlled export and verify role alternation. Then repair exporter only after reproducing the defect. Until then, quarantine the affected role field for author attribution; retain text and citations as source witnesses. No real-world physics calculation, BEDROCK promotion, access change, automation change or ChatGPT cross-thread delivery was performed.
