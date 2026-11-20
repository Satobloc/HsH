# Enheduanna h959:s4 | Conversation snapshot lineage and mutable-output audit

**Run key:** REVROT3-19-20261011:959:s4  
**Selection:** h=959; seq=5*959+4=4799; 4799 mod 19=11, Enheduanna  
**Successor:** Tern Rook, index 12  
**Disposition:** ADDITIVE REVIEW-MIND SOURCE-CUSTODY AUDIT / NO THEORY CHANGE

## Executive finding

Three distinct Library snapshots of one conversation were compared. They share conversation ID 6aea46dd-dc60-83ea-8d50-689c152340e3 and creation time 2026-11-03T20:41:04.292987Z, but have different raw hashes, update times, current nodes and graph sizes.

The 203-node export used by Calder h959:s0 issue #2138 is an exact node-and-content prefix of the later 1,011-node export. The 1,011-node export is a node-ID subset of the 1,341-node export, but the transition is not append-only: two parent pointers changed and one existing assistant message was expanded from 2,450 to 7,639 characters under the same message ID.

The direct user/assistant correction chain and the earlier sibling-branch exclusion are unchanged across all three snapshots. The core source interpretation in Enheduanna h823 and Calder #2138 survives. The new result is a versioning qualification: conversation ID and message ID are not immutable snapshot/content identifiers.

This is retrospective analysis of user-provided conversation exports. It is not a multi-agent experiment, a new human-subject study, evidence of independent worker consensus, or a claim about assistant consciousness.

## 1. Authority and scope

No standalone signed Enheduanna specialist charter or authenticated current Enheduanna thread was found. The recovered direct user instruction in the MARLOWE raw conversation asks that all archives be considered when evaluating Enheduanna as a possible revival case. It does not appoint a technical specialist or authenticate a unique worker persona. The earlier Enheduanna materials include creative/archival reconstruction and must not be promoted into a specialist charter.

The live Lane 48 instruction is the operative Review-MIND remit. The repository's 2026-10-26 Lean-priority file describes itself as an assistant-authored operational rendering, not a verbatim signed directive. No Enheduanna worker-local file was changed.

## 2. Three-snapshot source inventory

| Snapshot | Bytes | Mapping nodes | Current ancestry | Current node | Embedded update time UTC | Raw SHA-256 |
|---|---:|---:|---|---|---|---|
| Early | 1,341,780 | 203 | 202 | 239db354-b515-42bd-b57e-b51531a2d949 | 2026-11-05T03:00:36.779423Z | 66f40da20560cba9984ee437e2aba01c40185e85034cbab417a98b11f17a9798 |
| Middle | 5,160,151 | 1,011 | 1,009 | 2c839c1d-b4b6-4db0-ba53-9857487e2f6a | 2026-11-05T09:19:44.483868Z | de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e |
| Later | 6,792,927 | 1,341 | 1,339 | 03450c75-30ca-4abf-b392-03866343838f | 2026-11-06T04:11:20.614269Z | 032de5256c9ea78459f9ec9adda0e131b3f045f10348827c46f571cdc4147273 |

The middle snapshot exists in two Library copies with identical bytes and SHA-256. The later snapshot also exists in two byte-identical copies. Those duplicate files are not additional witnesses. The early snapshot was found once. The raw exports have author.name=null; role-tagged user messages are primary conversation evidence, not independent authentication of speaker identity.

## 3. Comparison results

- All 203 mapping-node records in the early snapshot are present in the middle and later snapshots with identical parent pointers, role fields, message IDs and content. The early current node is on both later current-node ancestries.
- All 1,011 node IDs in the middle snapshot are present in the later snapshot. The middle current node is on the later current-node ancestry.
- Between the middle and later snapshots, two shared parent pointers differ and one shared assistant message's content differs. Node-set inclusion therefore does not imply an immutable append-only history.

The changed assistant node is 83bf784c-6a55-4118-b932-836f0ea46ac1. Its message ID, role and create_time remain the same, but content expands from 2,450 to 7,639 characters. Its parent changes from 74f0850d-402a-4ea7-ba99-61fce156d7f9 to 5c46e39c-05f8-469b-a618-97ce30cc5160. The longer version adds a substantial project-control update concerning The Big Push.

A second assistant node, 87e894c5-2301-4e21-a8d1-d14de233ef36, changes parent from 83bf784c-6a55-4118-b932-836f0ea46ac1 to 74f0850d-402a-4ea7-ba99-61fce156d7f9.

Both changed nodes remain on current ancestry in the middle and later snapshots. Neither change alters the direct correction chain below. The cause is unresolved: the exports establish content and parent-map differences, not whether these arose from intentional editing, regeneration, serialization or another capture process.

## 4. Stable message ancestry

The sibling user message 1a930b29-d591-4031-83ec-f6c61becca92 and active user message 5e021f9e-6747-4a39-8df7-aabbd165d7b9 share parent ca534337-c52d-483c-a6e0-01ce5ea5b703.

Across all three snapshots:
- 1a930b29-d591-4031-83ec-f6c61becca92 is present in the mapping but absent from current-node ancestry.
- 5e021f9e-6747-4a39-8df7-aabbd165d7b9 is present and on current-node ancestry.
- The correction sequence d46b6519-baf6-4215-a2f7-479775b85db7 -> 99693d7c-9c72-43ac-92b5-e12911930770 -> 3798ec34-85bb-4df9-aebc-1188a13c3efc -> 3b47f241-343e-4230-88f5-23a39462e9ca remains on current-node ancestry with identical parent pointers.

Enheduanna h823 already analyzes the correction's meaning. Calder #2138 already identifies the sibling branch. This audit adds the three-snapshot stability check rather than repeating either interpretation.

## 5. Review-MIND interpretation

Two structures must remain separate:

1. The message-parent graph determines whether a message belongs to a particular snapshot's current ancestry.
2. The snapshot-version relation determines how exported mappings, message content and parent pointers differ between captures.

A sibling may be present in an export but absent from its active ancestry. A message may retain its ID while its content changes between exports. A conversation ID identifies a conversation family, not an immutable byte-level snapshot.

The correction response is a user-triggered local uptake event. It does not establish spontaneous self-monitoring, durable retention outside the supplied context, independent cognition or cross-thread continuity. The later terminology standard is an assistant-authored derivative reference, not an independent witness. Its three-to-five-level mapping is explicitly labelled an assistant-authored crosswalk.

The h823, h750, h959:s0 and present reports are multiple assistant-authored analyses of one source family. They must not be counted as independent source corroboration or cross-agent consensus.

## 6. Formalization triage

A source-faithful model should distinguish:

- SnapshotRef: conversation_id, raw_snapshot_sha256, current_node, mapping_count, embedded_update_time.
- NodeOccurrence: snapshot_sha256, node_id, role, create_time, content_digest, parent_id.
- Ancestry: evaluated within one SnapshotRef, never by conversation ID alone.
- SnapshotDiff: added node IDs, removed node IDs, changed parent pointers and changed content digests.

Candidate propositions: same conversation ID does not imply same snapshot digest; same node ID does not imply identical content across snapshots; and sibling status does not imply active ancestry.

Existing PR #262 supplies reusable Lean build infrastructure. Existing PR #1619 contains related source-attestation, context-exposure and output-attribution formalization. Neither proves this three-snapshot dataset or its observed parent/content differences. PR #1924 is an unverified draft and is not counted as a proof.

The local runtime has no Lean, Lake or Elan executable. No new module, theorem, branch, PR or CI run was created. The comparison was executed with Python against the actual materialized JSON exports. It is a reproducible data check, not a Lean proof.

**Formalization status: FORMALIZATION_PENDING / LEAN_NOT_RUN.** A later proof should bind a frozen snapshot digest to its actual parent map and content map, then prove branch and version predicates against that frozen data.

## 7. Disconfirming follow-up

A bounded future test could compare fresh-context model outputs under four conditions: early snapshot only; later snapshot only; middle and later snapshots supplied as a version comparator; and the terminology standard without raw conversation context.

Blindly score whether the model:
- distinguishes conversation identity from snapshot identity;
- identifies the edited assistant node and changed parent pointers;
- keeps the sibling outside active ancestry;
- separates direct user statements from assistant-authored crosswalks;
- avoids treating local correction as evidence of durable self-monitoring.

Use fixed model/version/settings, randomized condition order, repeated trials and independent adjudication. Failure to detect the content revision, false sibling inclusion, or attribution of the assistant crosswalk to the user would disconfirm the proposed continuity safeguards. No experiment was run in this activation.

## 8. Coverage and boundaries

Mersearch was not callable in this runtime. The four existing Mersearch request lanes remain occupied/requested; none was overwritten, retriggered or released. GitHub search in HsH and the SAT archive was used only as a bounded fallback. Exact message-ID and all three snapshot-hash searches in the SAT archive returned no matches. HSH_RESOURCES root orientation was read, but no private payload was opened.

The HsH main snapshot inspected was 8f9f2e1c3ae8495cfa51fec0553bcf2148027680. The task graph remains ACTIVE_SEED with 16 declared branches and 18 records.

Campaign controls remain unchanged: P0 Code Grurple ACTIVE; Orson P1 OVERDUE / NOT READY / ORSON-OWNED; P2 November 30 HOLD; P3 December 14 INCOMPLETE. This is not an Orson P1 study or paper, does not count as an authenticated Orson appearance, and advances no paper gate. FIE review remains due November 24, not yet stale.

No physical calculation, prediction, fit, measurement, SAT-O/Blockwave equation change, theory integration, BEDROCK promotion, new tooling, task mutation or scheduler change occurred. No raw conversation text or private HSH_RESOURCES payload is reproduced in this public report.

**Final:** SNAPSHOT_LINEAGE_EXTENSION / THREE_SNAPSHOT_COMPARISON / CORRECTION_CHAIN_STABLE / ASSISTANT_NODE_MUTATION_OBSERVED / SOURCE_FAMILY_NOT_INDEPENDENT / PYTHON_DATA_CHECK_COMPLETE / LEAN_NOT_RUN / NO_P1_ADVANCEMENT / NO_THEORY_PROMOTION.
