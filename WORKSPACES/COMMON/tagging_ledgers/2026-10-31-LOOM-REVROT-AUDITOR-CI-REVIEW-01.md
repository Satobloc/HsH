# Loom tag-on-read ledger | REVROT auditor CI and cross-lane QA

**Created for:** Workshop Relay :48, nominal 2026-10-31T21:48Z, run key REVROT3-19-20261011:501:s4.  
**Purpose:** preserve authorship, provenance, source type, and epistemic status for materials actually read. This is a tagging record, not a theory or a public index.

## A. Direct Nathan-authored source

### Raw Revival Rotation process instruction
- Repository/path: Satobloc/HsH / DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/26.09.14•26.09.22•Revival Rotation — raw.json
- Blob: 3bf173c217e0755419152aa2225f39713929a5fe
- Conversation ID: 6aa8a2bf-8280-83e9-9d57-1e0af853b7f1
- Message UUID: d3976dcf-c5dc-49c7-a523-e6469f4910db
- Timestamp: 2026-09-22T04:03:52.997Z
- Outer role: user
- Exact text: “Ok, see if you can take some big bites, using seive and Mersearch/Mercer_Searcher to bulk-triage and characterize.”
- Tags: NATHAN_DIRECT; PROCESS_INSTRUCTION; BULK_ARCHIVE_TRIAGE; SIEVE; MERSEARCH; CORPUS_CHARACTERIZATION; REVIVAL_ROTATION; SEARCH_METHOD.
- Scope note: this is a process instruction, not the missing Loom specialist charter and not a theory equation.

## B. Loom identity and continuity sources

- WORKSPACES/LOOM/README.md — blob bae0d585c7d9aeb4d5c5dac53aae4894b847fb0d. Tags: ASSISTANT_AUTHORED_WORKSPACE_SYNTHESIS; LOOM_ROLE_SUMMARY; CORPUS_TAGGING; PROVENANCE; TERMINOLOGY_GENEALOGY; RELATIONSHIP_ENRICHMENT. Not a verbatim Nathan charter.
- WORKSPACES/LOOM/CONTINUITY.md — blob 677d2f262b780598f44e785575c85ec167c88070. Tags: ASSISTANT_AUTHORED_CONTINUITY; ACCESSIBLE_UNSCHEDULED; HISTORICAL_THREAD_POINTER; CURRENT_CURSOR.
- WORKSPACES/SABLE/WAKE_PACKETS/REV-010-LOOM-REENTRY.md and REV-010-LOOM-STATE.md. Tags: ASSISTANT_AUTHORED_WAKE_SUMMARY; SOURCE_GROUNDED_REENTRY; NOT_VERBATIM_CHARTER.
- WORKSPACES/COMMON/INSTANCE_REGISTRY_EXECUTION_LEASES.md. Tags: IDENTITY_STATUS; OLD_RECURRENCE_DISABLED; ACCESSIBLE_UNSCHEDULED; NO_REACTIVATION.

## C. Incoming handoff and worker reports

- Sable report WORKSPACES/SABLE/2026-10-31T2136Z_REVROT_AUDITOR_WORKER_FIELD_DIALECT_REPAIR.md — blob 27e7d99faf6289d296ea8b7d937d94a25325a96b. Tags: ASSISTANT_WORKER_REPORT; REVROT_AUDITOR; SELECTED_WORKER_DIALECT; PR1173; TOOLING_QA.
- Sable receipt WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-31T2136Z_s3_sable.md — blob 4a14da5f501cac9f8e383bd4bd345d2c9e4beee8. Tags: EXECUTION_RECEIPT; RUN_KEY; SCHEDULER_PROVENANCE; SOURCE_READBACK.
- Sable→Loom handoff WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-31T2136Z_from_s3_to_s4_loom.md — blob fbe0893d6b02c6dd124de5bc2d50447dcc2d1c9f. Tags: REPOSITORY_HANDOFF; OPTIONAL_CONTEXT_ONLY; NO_TASK_TRANSFER; CHAT_DELIVERY_UNAVAILABLE.

## D. Actual receipt dialect witnesses

- Aldus receipt 2026-10-31T1124Z_s2_aldus.md — blob 8b0905f0b1349344cfd454300ea64c2f960daede. Tags: ACTUAL_RECEIPT; SELECTED_RING_LABEL; NEXT_RING_LABEL; PARSER_DIALECT_GAP; CORRECT_RING_ASSIGNMENT.
- Alberr receipt 2026-10-31T1448Z_s4_alberr.md — blob 3241bce91982bc24e21e4387c4feb611d5832720. Tags: ACTUAL_RECEIPT; SELECTED_RING_LABEL; AMENDMENT_CHAIN; PARSER_DIALECT_GAP.
- Orson receipt 2026-10-31T2124Z_s2_orson_vay.md — blob 9b80fab23bba00949a5ac188a8cb293fe422018c. Tags: ACTUAL_RECEIPT; SELECTION_FIELD; SELECTED_INDEX_DIALECT; PARSER_DIALECT_GAP.
- Kestrel receipt 2026-10-31T1648Z_s4_kestrel.md — blob 5df831ebdea71bf17902be253e92259968f3aeab. Tags: ACTUAL_RECEIPT; SELECTED_WORKER; NEXT_WORKER; POSITIVE_PARSER_WITNESS; TERMINAL_HANDOFF_WARNING.
- Mira→Aldus optional operational handoff 2026-10-31T1112Z_from_s1_to_s2_aldus.md — blob dd66421877ac45846fc1cdbc854304b8ca84df81. Tags: OPTIONAL_CONTEXT_ONLY; NO_TASK; CONTEXT_MARKER_DIALECT; FALSE_POSITIVE_WITNESS.
- Tern→Morrow optional repository handoff 2026-10-31T1236Z_from_s3_to_s4_morrow.md — blob 2618357828ad67975853d48dd0fb0b6a044e7388. Tags: QUALIFIED_SENDER_IDENTITY; AUTHENTICATION_QUALIFIER; PARSER_NORMALIZATION_GAP.
- Orson→Sable next-appearance context 2026-10-31T2124Z_from_s2_to_s3_sable_next_appearance.md — blob 65281f119f9e8a4186f61241e9e740ed16a5bb96. Tags: OPTIONAL_CONTEXT_ONLY; NEXT_APPEARANCE; NO_TASK; NO_RESPONSE_OBLIGATION.

## E. Tool, PR, and CI artifacts

- tools/audit_revival_rotation_v3.py on PR branch and PR merge ref — blob 45bb5ab6ec61dd827c53a3ffe9121109cf9321dc. Tags: PYTHON_SOURCE; READ_ONLY_AUDITOR; STRUCTURED_FIELD_PARSER; SELF_TEST_24; FULL_AUDIT_FAIL; ATTEMPT_OCCURRENCE_CONFLATION.
- Current-main auditor — blob 448114daa497510eb936f4cbc76b50c68745bde4. Tags: CURRENT_MAIN_BASELINE; PRE_FIX_SOURCE.
- PR #1173 / Actions run #41245634740 / job #124668356094. Tags: PR_REVIEW; MERGE_REF_EXECUTION; SOURCE_BLOB_MATCH; SELF_TEST_PASS; FULL_TREE_AUDIT_FAIL; STALE_BASE.
- Public artifact issue #1176 and publisher comment #6549689649. Tags: EXISTING_PUBLICATION; PUBLISHED_VERIFIED; SNAPSHOT_STALE_AFTER_CI; NO_DUPLICATE.
- PR #951 module FORMAL_VERIFICATION/HsHVerification/EliasProofTargetIdentity.lean — blob 2fb4c64ff3d33d0aefa159a04a8d4b01165514f6. Tags: FORMALIZED_OCCURRENCE_IDENTITY; ATTEMPT_IDENTITY; RESULT_TEMPORAL_COMPATIBILITY; MERGE_REF_BUILD; FIVE_NEW_THEOREMS_NO_AXIOMS; NOT_RUNTIME_VALIDATION.
- PR #951 root aggregator — blob verified identical at PR head and checked-out merge ref. Tags: IMPORT_CHAIN; SOURCE_BLOB_MATCH.

## F. Control documents read

- BEDROCK.md — blob 38a5b8f4...; tags: NATHAN_DIRECT_CONTROL; PROOF_FIRST; PHYSICAL_DATA_PROVENANCE; THEORY_PROMOTION_GATES.
- Steering Charter 2026-10-26 — blob 5f426338...; tags: NATHAN_DIRECT_CONTROL; SPECIALIST_OWNERSHIP; PAPER_GATES.
- Three Paper Campaign 2026-10-26 — blob 9eb28e89...; tags: NATHAN_DIRECT_CONTROL; P1_P2_P3_SEPARATION.
- NEW_INSTANCE_START_HERE — blob e1fa2fb...; tags: ONBOARDING; SOURCE_PROVENANCE; THREAD_FIRST.
- Revival Rotation V3 / thread-first rule / routing contract — blobs 90863a2a..., e7970758..., d9ea7c3a...; tags: SCHEDULED_OCCURRENCE; IDENTITY_ROUTING; HANDOFF; NO_CROSS_THREAD_CLAIMS.
- Workflow branching map and active automation roster — blobs 756c5067... and 603315c3...; tags: CURRENT_MAIN; BRANCH_DIVERGENCE; FIVE_TASK_INVARIANT.
- READ_IT_TAG_IT / TRAINING_SOURCE_MAP / SHARED_STATE_WRITE_SAFETY / CROSS_REPO_SCRIPT_EXECUTION_STANDARD — tags: SOURCE_TAGGING; AUTHORSHIP_FIREWALL; HOUSE_TOOL_FIRST; SAFE_APPEND.

## G. Explicit non-claims

- The original Loom specialist charter raw export was not recovered.
- Assistant-authored workspace summaries are not Nathan Direct.
- No historical Loom instance participated or supplied a first-blush.
- No ChatGPT thread was created or messaged.
- No physical measurement, model inference, or human-subject result was produced.
- No theory, manuscript, paper gate, branch, PR, or automation was promoted or changed.
