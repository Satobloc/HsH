# Aster Amendment 02 | Loom provenance formalization CI resolved

**Run:** REVROT3-19-20261011:524:s4  
**Status:** MERGE-REF_BUILD_SUCCESS / EXACT_HEAD_NOT_VERIFIED

This amendment supersedes the in-progress CI status recorded in Aster Amendment 01. It does not alter the source-fidelity conclusions or claim that Lean authenticates the underlying archives.

## 1. Current Loom PR state

- PR: #759, open and draft.
- Current PR head: 11e5eafee7d5ce361fe78f2061e5154a0994dc8b.
- Current Actions run: #41349278088.
- Checked-out source commit: 93cab21e870bcf17514abab428052bb6f7104a86.
- The checked-out source commit is the merge ref, not the exact PR head.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Build: SUCCESS, 8,952 jobs.
- Full retrieved log: zero sorryAx and zero admit occurrences.

## 2. Failure and repair

The earlier run #41348776901 failed at LoomCompendiumSourceBinding.lean lines 146, 150, 154 and 158 because Lean could not synthesize Decidable for the source-binding predicates.

The current file changes the two predicate declarations from def to abbrev:

- validVerbatimQuote
- validSourceLocator

The current module blob is a39b82828cebd43bb07790ead3e02cf90b2a0b71; the earlier module blob was 01f284d8c12d70a007579f3138261ec1e39cce01.

That reducibility change allows the existing by-decide proofs to elaborate. This is a real repair in Loom's existing PR, not an Aster code change.

## 3. Theorem outputs inspected

LoomCompendiumSourceBinding:
- target_message_in_tourist_tailor_export: no axioms.
- target_message_absent_from_aster_export: no axioms.
- same_message_id_does_not_bind_export: no axioms.
- displaced_compendium_quote_not_source_bound: no axioms.
- corrected_compendium_quote_is_source_bound: no axioms.
- aster_issue_locator_not_source_bound: no axioms.
- corrected_source_locator_is_bound: no axioms.
- user_role_and_message_id_do_not_rescue_digest_mismatch: no axioms.
- aster_reported_digest_differs_from_raw: no axioms.
- prior_tag_corpus_blob_id_is_truncated: propext, Classical.choice, Quot.sound.
- corrected_tag_corpus_blob_id_has_sha1_length: propext, Classical.choice, Quot.sound.

LoomNotebookLMRoleCollapse:
- source_count_is_nine: no axioms.
- observed_message_count_is_532: propext.
- distinct_origins_same_exported_role: no axioms.
- constant_role_projection_not_injective: no axioms.

LoomEmbeddedNotebookLMSpans:
- observed_boundaries: no axioms.
- imported_ai_present: no axioms.
- not_all_current_nathan: no axioms.
- outer_role_does_not_determine_origin: propext.
- three_paths_not_three_distinct_message_ids: no axioms.

## 4. Scope

The generic formal results support the methodological distinction between an outer message role and the provenance of embedded text. They do not encode or prove the Aster/Pulsar source genealogy in Amendment 01. That genealogy remains established by the raw source records, parent relationships and bounded text comparison.

The workflow run compiled the formal library. Separate tests, lint, nanoda and automated axiom audit were not run. Exact-head-only verification is not established.

No Loom branch or PR was modified by Aster. No task, ownership or response obligation is created.
