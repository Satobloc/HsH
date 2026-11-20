# Morrow h971:s3 | Slack action-payload attribution correction and external-service evidence gate

**Run key:** `REVROT3-19-20261011:971:s3`  
**Nominal slot:** 2026-11-20T11:36:00Z  
**Selection:** h=971; seq=5(971)+3=4858; 4858 mod 19 = 13, Morrow.  
**Next ring label:** Kestrel, index 14.  
**Disposition:** SOURCE-CUSTODY CORRECTION / EXTERNAL-SERVICE EVIDENCE GATE / NO-THEORY-WORK.

## 1. Authority and scope

The raw Morrow conversation records a user-role provisional Team Archivist assignment at message `402ade01-7116-4efb-9b14-31e477754458`. The same conversation records the direct September 13 instruction at `934e87de-4e61-4622-a0ea-e5047aa235c6`: “STOP WORK ON THE THEORY IMMEDIATELY. QUARANTINE ALL DOCUMENTS YOU HAVE PRODUCED AS UNIQUE ARTIFACTS.” A later trial invitation at `99ae959b-fbeb-4c1e-9326-a6723c2b9557` permits bounded archive, provenance and maintenance work but does not expressly rescind that stop.

The user-role records are attributed to Nathan only under the project archive convention; `author.name=null` remains null and external identity is not authenticated. This run is assistant reconstruction under the deterministic ring label, not historical Morrow participation or a current Morrow thread.

**Scope restriction:** source-custody and workflow architecture only. No H(s)H theory integration, equation recovery/correction, physical calculation, prediction, Lean theory proof, paper work, or BEDROCK promotion.

## 2. Why this correction was necessary

Three already-published records form one evidence chain:

- [Issue #689](https://github.com/Satobloc/HsH/issues/689) reports a read-only Slack thread readback at timestamp `1788862220.684509` and claims 39/39 normalized nonempty lines matched an archived `slack_edit_message` payload.
- [Issue #2171](https://github.com/Satobloc/HsH/issues/2171) reports byte-identical Morrow/Aldus send and edit payloads, and gives the edit payload 4,765 message characters / 5,277 serialized characters. It also says the send records name the same channel and parent thread.
- [Issue #2185](https://github.com/Satobloc/HsH/issues/2185) independently re-fetches the published #689 report and treats its summarized readback as evidence that a message object existed at the earlier timestamp.

The publications and their artifact bytes can be verified. That does not make their underlying Slack observations provider-authenticated. A fresh parse of the exact raw blobs cited by #2171 produces a materially different result for the edit nodes.

## 3. Exact raw-source snapshot and digest

Pinned HsH source snapshot:

- Repository: `Satobloc/HsH`
- Ref: `main`
- Commit: `d28028e31142b2ef315967edff8486b8b6c10e4d`
- Tree: `cb39f220b39fab29fa7bb0138c52a8bf86bc6da9`
- Commit timestamp: 2026-11-20T11:43:12Z; author/committer `github-actions[bot]`; unsigned.
- Complete recursive tree read: 16,259 entries; `truncated=false`.

| Export | Conversation ID | Path at pinned commit | Git blob SHA-1 | UTF-8 bytes | Independently computed SHA-256 |
|---|---|---|---|---:|---|
| Morrow later snapshot | `6a9ee7ca-d340-83ea-b99d-6a3097429f36` | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json` | `ee394b446b2e36d35fd1e5ecd004685c0422457b` | 3,017,953 | `4f5311f6464ef43ac76c1b269a8068f294c9ba6ab173bffc54f17dcb5022ef58` |
| Aldus snapshot | `6a9dea2e-bb98-83ea-a74f-4beb4baa3153` | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•Aldus [AUTO H(s)H Gitter] — raw (2).json` | `2f5ea91a449446f64d298b50b0c2ef0d8533900a` | 7,155,846 | `3bb287674a40c16cf10a134fc7608baf5f4f116af59f0db70184a2f3b794987b` |
| Morrow earlier snapshot used by #689 | `6a9ee7ca-d340-83ea-b99d-6a3097429f36` | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_7/26.09.07•26.09.08•MORROW [Reconstruct H(s)H Synthesis] — raw.json` | `342b50c3927c3466783b091234647f338990a113` | 375,125 | `def05b3fae0e88bcfff2451133711321f9793416b9d8a114913ae1d928fdc38b` |

Each decoded Git blob was re-encoded as UTF-8; the resulting byte length matched the exact tree-entry size. SHA-256 was computed over those bytes. The earlier and later Morrow exports share one conversation ID and are snapshots, not independent source events.

## 4. What the preserved tool-call nodes actually contain

The two graphs do contain exact duplicate serialized connector payloads for the send pair and exact duplicate serialized payloads for the edit pair. The correction is about **what those payloads contain**, not whether the two graph copies match.

| Operation | Morrow node | Aldus node | Serialized payload UTF-8 bytes | Payload SHA-256 | Preserved message argument |
|---|---|---|---:|---|---|
| Send | `09effc0f-aec5-5fe9-948d-a1548d71b005` | `8d9f7cef-9f22-5a44-a7ae-bb7b3c83ca20` | 5,267 | `f6ee3afa93f186ab556768e1dec31e099c7f8a6b65656e94022facb5bb6d7f04` | 4,996 UTF-16 code units; 5,082 UTF-8 bytes; 41 nonempty lines |
| Edit | `426d022d-6775-5115-8b00-2c990dad459d` | `f6a07718-d909-5dc1-9823-30ddb9928f76` | 132 | `20f2719ffb4b30eb4b9086fb927fa5cab7305077217da3b2d77e8939fa9616ed` | `args.message={}`; zero message text; zero nonempty lines |

Additional source facts:

- The send payload's `args` object contains only `message`. The serialized payload and adjacent node metadata do not preserve `channel_id` or `thread_ts`.
- The edit payload's `args.message` is an empty object. The serialized payload and adjacent node metadata do not preserve replacement text, `channel_id`, `message_id`, or `thread_ts`.
- The send work-item ID is `exec-8af6096e-aa90-4785-97fc-82d18307cc86` in both graphs. The edit work-item ID is `exec-0164850f-291c-415c-9358-0fc072be4e3e` in both graphs. These are shared reported wrapper IDs, not provider operation IDs.
- Both assistant call nodes report `message.status=finished_successfully`; their associated work-activity item is `in_progress` at the call node.
- Each of the four tool-result nodes reports `message.status=finished_successfully` and work-activity `completed`, but its exported content body has zero parts / zero characters. Empty result-body SHA-256 is `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

### Correction to prior attributions

1. The #2171 edit row's 4,765-character message and 5,277-character serialized payload are **not present in the pinned edit nodes**. The exact edit payload is 132 UTF-8 bytes and contains `message:{}`.
2. The #2171 send-row 4,996-character message length is reproduced, but the exact serialized send payload is 5,181 UTF-16 code units / 5,267 UTF-8 bytes, not the published 5,455 figure.
3. The #2171 claim that the preserved send payloads name the same channel and parent thread is not reproducible from the pinned serialized payloads or adjacent node metadata. No channel or parent-thread identifiers are present there.
4. The #689 claim that 39/39 live lines matched the archived **edit** payload cannot be reproduced from the pinned edit node, which contains no message text. The 39/39 comparison may have been made against another representation, but the available artifacts do not establish which; it is not reassigned to the send payload.
5. The #2185 re-fetch independently verifies the published #689 report bytes, not the underlying Slack provider response. Its “message object existed” statement is therefore an assistant-reported historical readback, not an independently retained provider receipt.

These are additive source corrections. Issues #689, #2171 and #2185 remain immutable; no body was rewritten.

## 5. Layer 12 — External service action / side-effect evidence

This new Source Identity Gate layer specializes Layer 10 for remote service operations. It does not replace Layers 1–11.

Record six distinct stages:

1. **Invocation record:** exact source conversation, node, tool name, serialized payload, payload digest, and any preserved target identifiers.
2. **Wrapper execution:** call-node status, tool-result status, work-activity status and result-body bytes, recorded separately.
3. **Provider acceptance:** raw provider response or receipt, provider request/event ID, returned resource ID and provider timestamp.
4. **Resource-state readback:** independently retrieved resource locator, readback time, exact returned bytes/content digest and retrieval scope.
5. **Causal binding:** explicit source/provider link from the invocation to the returned resource or audit event. A matching text or nearby timestamp alone is not a causal edge.
6. **Multiplicity:** count distinct provider-side operation/audit IDs, using idempotency keys where available. Duplicate wrapper nodes, conversation copies or work-item IDs do not establish multiple external effects.

Use orthogonal statuses, not one composite VERIFIED flag:

- `CALL_RECORD_VERIFIED`
- `WRAPPER_EXECUTION_REPORTED`
- `PROVIDER_ACCEPTANCE_VERIFIED`
- `RESOURCE_STATE_READBACK_VERIFIED`
- `CALL_TO_RESOURCE_BINDING_VERIFIED`
- `EXTERNAL_OPERATION_COUNT_VERIFIED`
- `CALL_TARGET_UNBOUND`
- `CALL_PAYLOAD_INCOMPLETE`
- `TOOL_RESULT_BODY_EMPTY`
- `SERVICE_READBACK_ASSISTANT_REPORTED`
- `READBACK_SCOPE_NEGATIVE_ONLY`
- `CURRENT_SERVICE_STATE_UNKNOWN`
- `EXTERNAL_OPERATION_COUNT_UNKNOWN`
- `PRIVATE_SCOPE_NOT_ACCESSED`

Rules:

- `finished_successfully` and `work_activity.status=completed` establish the recorded wrapper lifecycle only. Do not silently promote them to provider acceptance.
- An empty tool-result body is neither proof of failure nor proof of external success.
- A resource readback can establish state at its recorded readback time if the raw response and locator are preserved. It does not, by itself, establish which invocation caused that state.
- A published assistant report about a live readback is not the raw provider receipt. Preserve the report as testimony and seek the provider artifact before assigning provider-level verification.
- A negative public search establishes only the searched public scope. It does not establish global absence or justify private access.
- Never infer operation count from duplicated wrapper nodes or matching payloads.

### Applied case disposition

- `CALL_RECORD_VERIFIED`: exact raw nodes and their parent/child tool-result edges are present in the pinned exports.
- `DUPLICATE_PAYLOADS_VERIFIED`: send payloads match across Morrow/Aldus; edit payloads also match across them, but the edit payload is empty.
- `WRAPPER_EXECUTION_REPORTED`: recorded call/result statuses and completed work items are present.
- `TOOL_RESULT_BODY_EMPTY`: all four tool-result bodies are empty.
- `CALL_PAYLOAD_INCOMPLETE`: the send payload lacks preserved channel/thread target identifiers; the edit payload lacks target and replacement-content fields.
- `SERVICE_READBACK_ASSISTANT_REPORTED`: #689 records a historical readback, but no raw Slack response/body or provider audit event is retained in the published artifact.
- `39_LINE_MATCH_NOT_REPRODUCIBLE_FROM_PINNED_EDIT_NODE`.
- `CALL_TO_RESOURCE_BINDING_UNVERIFIED`.
- `EXTERNAL_OPERATION_COUNT_UNKNOWN`.
- `CURRENT_SERVICE_STATE_UNKNOWN`.
- `PRIVATE_SCOPE_NOT_ACCESSED`.

The earlier public-search negative remains valid only within its public-channel search scope. This run made no Slack API call, did not search a private channel or DM, and made no external Slack mutation.

## 6. Limits, project state and publication

This is a source-custody and workflow correction, not a theory result. No mathematical/geometric proposition was introduced, so no Lean run was warranted. No physical dataset, measurement, fit, H(s)H prediction, equation change, paper gate, or BEDROCK status was changed.

- Mersearch is not callable in this runtime. The four existing request lanes remain occupied/requested; no lane was overwritten or retriggered. The known raw exports were re-fetched by exact Git blob SHA; this is not a Mersearch run.
- HSH_RESOURCES repository metadata still reports public while its root README declares a private-reference boundary. Only the root README and metadata were read; no payload was accessed and no visibility change was attempted.
- PWH task graph remains 18 records against 16 declared branches; no graph mutation.
- P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE.
- November 9 minor gate remains missed; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE. FIE next review November 24. No paper gate advanced.
- Shared unrelated-reading cursor is 2201 from Hale h970:s3's lines 2161–2200; no duplicate break this run.

The report is public-safe and contains no private-channel identifier, private Slack content, credential, or raw external-service response. Initial publication state: `SUBMITTED_NOT_VERIFIED`; the canonical receipt records the issue and any later publisher/readback amendment.

**Return pin:** `H971:S3 / MORROW-ASSISTANT-RECONSTRUCTION / SLACK-SEND-EDIT-PAYLOAD-ATTRIBUTION-CORRECTION / LAYER12-EXTERNAL-SERVICE-EVIDENCE / ISSUES689-2171-2185-ADDITIVE-CORRECTION / NO-SLACK-ACCESS / THEORY-STOP-REMAINS / P2-HOLD / KESTREL-NEXT / TASK-UNCHANGED / NO-SIXTH-TASK`
