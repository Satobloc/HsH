# Morrow h933:s3 | Speaker-role / human-identity attribution | Source Identity Gate Layer 11

**Run key:** `REVROT3-19-20261011:933:s3`  
**Nominal:** 2026-11-18T21:36Z  
**Selection:** `h=933`, `seq=4668`, `4668 mod 19=13`: Morrow (index 13); next ring identity Kestrel (index 14). This is deterministic label selection, not authenticated instance or thread identity.

## Disposition

**SOURCE-CUSTODY IMPROVEMENT COMPLETE / LAYER 11 APPENDED / SOURCE-ROLE DISTINCTIONS PRESERVED / NO THEORY-STOP RELEASE / PUBLICATION TO BE VERIFIED SEPARATELY.**

The Source Identity Gate now distinguishes a message's exported speaker-role field from the archive's role-to-person attribution convention and from external human-identity authentication. This closes a recurring ambiguity without changing the project's existing convention that preserved conversation records with `author.role=user` are attributed to Nathan for internal source purposes.

## 1. Historical Morrow remit and authority boundary

The historical Morrow role is a provisional, source-grounded **Team Archivist / archive-appraisal and source-custody remit**, not a standalone signed specialist charter and not blanket authority over other workers' lanes.

- Initial direct user-role role instruction: message `402ade01-7116-4efb-9b14-31e477754458`, `2026-09-08T03:25:36.187Z`, conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, earlier raw snapshot blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`.
- Direct theory stop and quarantine: message `934e87de-4e61-4622-a0ea-e5047aa235c6`, exact message-level time `2026-09-13T00:11:10.939Z`, later raw snapshot blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`.
- Later archive/maintenance trial invitation: message `99ae959b-fbeb-4c1e-9326-a6723c2b9557`, `2026-09-13T15:31:22.757Z`, same later snapshot. It does not expressly rescind the earlier theory stop or release quarantined Morrow-produced theory artifacts.
- The adjacent assistant self-description `32ef4db5-269f-5c1c-8408-188c956cca52` is assistant-authored, not the direct user-role appointment.

The current execution therefore remains archive/source custody and operational provenance only. The universal shape-to-Lean directive is acknowledged, but this Morrow-specific stop has not been released. No theory integration, mathematical/physical construction, physical calculation, fit, prediction, equation correction, Lean proof work, paper drafting/review, or BEDROCK promotion was performed.

## 2. New Source Identity Gate Layer 11

### Layer 11 — Speaker-role / person-identity attribution

This layer is additive to Layers 1-10. It does not redefine Git content identity, snapshot membership, attachment/retrieval chronology, or evaluation-event/artifact binding.

For every archived message used to establish a direct instruction, role, preference, correction, or authority claim, keep these fields separate:

1. **Message-record identity:** source conversation ID, exact snapshot tuple from Layer 8, raw path, node key, embedded message ID, and any node/message-key agreement or mismatch.
2. **Exported speaker role:** exact `author.role` value from the message record. Preserve the literal value.
3. **Exported author label:** exact `author.name` value, including `null`; do not fill a missing label from context.
4. **Other author/source metadata:** exact `message_source` or equivalent field when present; preserve absent/null separately from a value.
5. **Message chronology:** exact message-level `create_time`, its source field and unit; keep conversation-level `create_time`/`update_time` separate and do not substitute them for message chronology.
6. **Archive attribution rule:** name the explicit project convention used to map a source role to a person, including its controlling source/version. In the preserved project archives, `author.role=user` is attributed to Nathan for internal source attribution under `TRAINING_SOURCE_MAP.md`; this is an archive convention, not an extra field contained in the raw message.
7. **External identity authentication:** independently record whether a real-world account/person identity is authenticated by evidence beyond the exported role convention. A role field or null author label does not supply such authentication.
8. **Copy / duplicate / snapshot relations:** record whether another appearance is the same event in another snapshot, an exact duplicate in another conversation, a derivative, or an independent source event. Text equality and separate conversation IDs do not by themselves establish independent authorship or corroboration.
9. **Attribution scope:** state exactly which message content and which authority claim are attributed. An assistant-authored neighboring message never inherits the user-role attribution.

Use orthogonal statuses rather than one composite `VERIFIED` label:

- `MESSAGE_ROLE_VERIFIED` — the pinned message record contains the recorded role value.
- `AUTHOR_LABEL_NULL` / `AUTHOR_LABEL_PRESENT` — exact author-name field state.
- `ARCHIVE_ATTRIBUTION_BY_CONVENTION` — a named project rule maps the role to a person for internal attribution.
- `EXTERNAL_IDENTITY_AUTHENTICATED` / `EXTERNAL_IDENTITY_NOT_AUTHENTICATED` — evidence beyond the role convention.
- `MESSAGE_NODE_BINDING_VERIFIED` / `MESSAGE_NODE_BINDING_UNVERIFIED`.
- `DUPLICATE_CONTENT_RELATION_VERIFIED` / `INDEPENDENT_SOURCE_RELATION_NOT_ESTABLISHED`.
- `ATTRIBUTION_CONFLICT` — conflicting role, label, mapping, or source evidence.

Rules:

- `author.role=user` establishes that the pinned export records a user-role message. Apply the project archive convention when warranted, but name it explicitly.
- `author.name=null` remains null. Do not replace it with `Nathan`, a worker name, or a guessed account identifier.
- `author.role=assistant` remains assistant-authored even if the assistant names itself, describes a role, or summarizes a user instruction.
- A repeated message in two snapshots of one conversation is not two independent source events.
- Exact text copied into another conversation is a duplicate-content relation, not independent identity confirmation.
- A raw export, archived title, automation label, scheduler selection, or `chat_ref=null` does not establish a currently usable ChatGPT thread or cross-thread delivery.
- A conversation-level timestamp that conflicts with later message-level timestamps is a metadata anomaly to preserve, not a reason to rewrite the message times.
- `Nathan Direct` based on this archive route should be described as **user-role source attributed to Nathan by the project archive convention**. Do not describe it as externally identity-authenticated unless a separate authentication source exists.

### Applied source matrix

| Event | Exported role | `author.name` | Archive attribution | External identity |
|---|---|---|---|---|
| Morrow Team Archivist instruction `402ade01-...` | `user` | `null` | Nathan by project archive convention | Not externally authenticated |
| Adjacent assistant self-description `32ef4db5-...` | `assistant` | Not re-established in this pass | Assistant-authored | Not a Nathan Direct source |
| Morrow theory stop `934e87de-...` | `user` | Not re-established in this pass | Nathan by project archive convention | Not externally authenticated |
| Later archive-trial invitation `99ae959b-...` | `user` | Not re-established in this pass | Nathan by project archive convention | Not externally authenticated |

The role-source correction records a separate `Continue Conversation Here` conversation `6a9bd6f4-8104-83ea-ac9b-ab97497a280e`, message `67ad3c22-c1b8-4f66-9815-586184630e6a`, with the same 1,353-code-unit role-clarification text 14.212 seconds later. This is an exact duplicate-content relation, not independent confirmation of the role assignment or the human identity.

The later Morrow export's conversation-level `update_time` is `2026-09-09T12:45:43.552007Z`, while it contains the September 13 stop and trial messages. Preserve the metadata anomaly and use the exact message-level `create_time` values for those events.

**Read scope:** this run re-read the verified role-source batch, the role-source correction, the direct-role/stop/trial raw-source correction, the Morrow crosswalk and the live Source Identity Gate. The large raw conversation JSON itself was not re-fetched or reparsed in this run. The report does not claim a new raw-export authentication or a new independent witness.

## 3. Operational effect

This layer prevents four distinct claims from collapsing:

- a record says `role=user`;
- the project convention attributes that user-role source to Nathan;
- an external system authenticates a real-world person;
- the current automation/runtime is the same participant or thread.

Only the first two are supported for the cited Morrow messages. The current scheduled run has `chat_ref=null`; no authenticated current Morrow thread or cross-thread destination was established. Historical Morrow and Morrow/Kestrel exports remain historical records.

No change was made to `TRAINING_SOURCE_MAP.md` or `CORE_TEAM_CONVERSATION_CROSSWALK.md`; Layer 11 clarifies their existing attribution rule rather than replacing it.

## 4. Repository, authority and workflow preflight

- HsH default branch: `main`, observed head `d75f11535ec9c05ac52097431ff686d4f56c72a9`; tree `e5b18e6bbad16d734dd822380edc23f6c4ec16a6`. Commit metadata reports an unsigned GitHub Actions bot commit; this is repository metadata, not source authorship.
- SAT archive `main`: `83ab8cf04d1807ad2222e0d992f0218fcc9243a2`.
- HSH_RESOURCES `main`: `b67f88f68eeba2e033d3e55f45197bef40860a89`. Only its root README was read; no private payload/index was opened.
- The three repository root READMEs and the three-repository onboarding were read for routing and authority boundaries. Historical SAT archive content remains provenance, not current theory authority. HSH_RESOURCES remains internal reference infrastructure; no private path is used as a public evidence dependency.
- Mersearch was not callable in this runtime and no Mersearch action appeared in the available tool inventory. No Mersearch query is claimed. The existing verified HsH source-custody records were used; no exhaustive three-repository search was performed.
- No local checkout or approved executable house-write route was present in the runtime. The existing issue-triggered publisher was used for public text; a current-blob-SHA GitHub Contents update was used only for the Morrow-owned gate file as the documented fallback.
- No new tool, dependency, fork, branch, subscription, API spend, or task was created.

## 5. Workflow health and project state

- Task graph: `ACTIVE_SEED`, 18 records / 16 declared branches; Tern retains graph/scheduler authority. No graph edit and no Morrow-owned active branch was inferred.
- WH-01: OPEN / P1-HIGH; append-only ledger 77 rows; next cursor `2026-11-15T18:50:00Z`. Do not skip the earlier unresolved partition.
- WH-02: PR #1710 remains Calder/authorized-maintainer-owned; no takeover, rebase, duplicate PR or code change.
- WH-05: four canonical Mersearch lanes remain occupied/requested; Tern's controlled release remains the dependency. No request overwritten, retriggered, or released.
- P0 Code Grurple: ACTIVE. P1 cognition: OVERDUE / NOT READY / Orson-owned. P2: HOLD. P3: INCOMPLETE.
- FIE last review remains November 10; next review November 24. No premature rereview.

## 6. Unrelated reading break

A public-domain lateral reading break was completed from Kakuzo Okakura, *The Book of Tea*, Project Gutenberg eBook #769. The accessible text returned for Section I, “The Cup of Humanity,” and the opening of Section II, “The Schools of Tea,” was read. The Project Gutenberg page identifies the author, title and eBook number. The direct page open returned HTTP 503, so no local line-number cursor is claimed.

**Return cursor:** resume in Section II immediately after the paragraph ending with the account of the Russian use of lemon slices as a survival of the ancient method. This is a section/paragraph cursor, not a line number.

## 7. Limits and next action

The next useful source-custody check is to apply Layer 11 to one additional archive case where `author.role=user`, `author.name=null`, and a duplicate conversation export coexist, while preserving the exact snapshot and copy relations. Do not infer independent authorship or external identity. Any source-role conflict should remain unresolved until a source-specific record settles it.

No theory stop release, equation change, physical calculation, fit, prediction, Lean proof, paper-gate advancement, or BEDROCK promotion is implied by this operational source-identity layer.
