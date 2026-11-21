# H1001:S3 Addendum — Source-span content identity and attribution separation

**Observed:** 2026-11-21T18:39Z  
**Run key:** `REVROT3-19-20261011:1001:s3`  
**Disposition:** ADDITIVE AMENDMENT TO EXISTING H1001 RECORD / NO SECOND ISSUE OR RECEIPT  
**Research status:** SOURCE BYTES REHASHED / STRUCTURED CONTENT KEY ADDED TO EXISTING DRAFT PR / EXACT-HEAD LEAN VERIFICATION NOT YET OBSERVED

This addendum extends the already-published observed-slice report [issue #2294](https://github.com/Satobloc/HsH/issues/2294). It does not replace that report, create a new issue, or claim historical Enheduanna-instance participation.

## 1. Source bytes and exact span partition

The Library-held raw export `Workshop Relay _24 _ Geometry - raw (1).json` was materialized and hashed directly.

- Raw-export SHA-256: `de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e`
- Conversation ID: `6aea46dd-dc60-83ea-8d50-689c152340e3`
- Message UUID: `100388c5-89d6-4ffd-a895-598990636057`
- Outer role: `user`
- Decoded `content.parts[0]` UTF-8 byte length: 15,732
- Whole decoded body SHA-256: `8aa01ead3eed55c9b7a48fc5cbeda59a3829e3461d4aa9ba88ed64661b990c78`

The source was partitioned without normalizing the decoded body:

| Segment | Half-open UTF-8 byte range | Length | SHA-256 |
|---|---:|---:|---|
| Direct user framing | `[0,2374)` | 2,374 | `0f4301fa4197de7d3d586d890add92a7ae3375ab5b9466fbcd862e68c80001f5` |
| Delimiter | `[2374,2376)` | 2 | `75a11da44c802486bc6f65640aa48a730f0f684c5c07a42ba3cd1735eb3fb070` |
| Embedded assistant-quoted report | `[2376,15732)` | 13,356 | `f9d4f9f97ab9968335b909ac45be26cc37768c08749b69793f4959ba7d980db7` |

The two-byte delimiter is `\n\n`. The source classification follows the explicit embedded-report marker. It is an assistant reconstruction of the span boundary, not authentication of the original assistant thread or proof of authorship.

For compact external indexing, each span also has a canonical descriptor digest. The descriptor is UTF-8 JSON with lexicographically sorted keys, compact separators `(",",":")`, no trailing newline, and schema `hsh.source-span-content-key.v1`. The offset profile is exactly `UTF-8 bytes in decoded content.parts[0]; half-open; separator excluded`.

- Direct-span descriptor SHA-256: `e3f572e23a80a7301d140af398d0ac9e6257a41ad6b0bbafcbae80f8a4c346f1`
- Assistant-quoted-span descriptor SHA-256: `a1b600aec3cb338f30e911adad2c43d2b3294a4e0b0a56b603f3431c7e706834`

These descriptor digests are externally computed index aliases. Lean does not compute or verify SHA-256.

## 2. Architecture improvement

Existing draft [PR #2293](https://github.com/Satobloc/HsH/pull/2293) was extended in place. The new `SourceSpanContentKey` is a structured identity containing:

`rawExportSha256, conversationId, messageId, bodySha256, startByte, endByte, offsetProfile, spanSha256`.

Attribution is a separate `SourceAttribution` record containing outer role, origin classification, and classification basis. `SourceClaimKey` combines both only when a downstream claim depends on both.

The new formal contract distinguishes:

1. **Content identity:** the exact source artifact/body/span and byte locator.
2. **Attribution:** the revisable interpretation of who or what originated that span.
3. **Claim identity:** content identity joined to the current attribution.

Reclassification preserves the content key but changes the claim key when attribution changes. The source-to-candidate lineage and observation pipeline now require equality of the structured content key in addition to the existing external source-span label and downstream map identities. A source-content-key mismatch blocks lineage composition.

This is a source-specific formalization of the span layer in Loom's proposed [Source Provenance Gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/SOURCE_PROVENANCE_GATE.md), not an implementation of the shared harvester. Sable retains authority over shared harvester/workflow changes. Existing Enheduanna PR #1619 remains the separate source-attestation/context-exposure/output-attribution layer; it does not authenticate these actual byte offsets.

## 3. Formal and repository status

- Existing PR #2293 head before this addendum: `498ae0ef2f0d34036865705b91ed4b435a07852e`.
- Additive commit: `a141a72bdea2526f894a6acecdafa4cb5ce6bc67`.
- Updated module blob: `20d88d1039061fbb10bac0cd7f60956bb88e1d0e`.
- Current module path: `FORMAL_VERIFICATION/HsHVerification/EnheduannaObservedSliceIdentifiability.lean`.
- The module is present on the existing PR branch and absent from main.
- PR #2293 remains OPEN / DRAFT / UNMERGED. Its base is `368f9af8d95d061b4581688759ed3eda309e9886`; comparison with current main `555a2fa0f8aba23dbcafe2d4dc772deb3a12e8fc` reports 59 commits ahead and 25,345 behind. No rebase or merge was attempted.

**Exact-head Lean status: PENDING / NOT VERIFIED.** The only visible Actions run, [#44936687624](https://github.com/Satobloc/HsH/actions/runs/44936687624), completed successfully with 8,948 build jobs, but its log proves that it checked out the earlier head `498ae0ef2f0d34036865705b91ed4b435a07852e`, not the new head `a141a72...`. It therefore does not compile or verify the new content-key structures and reclassification theorems. The new head has no Lean status check in its combined commit status; only the unrelated Vercel build-rate-limit failure is visible. No workflow-dispatch action or local Lean/Lake/Elan executable was available. No new exact-head pass is claimed.

Even after a future compile, Lean would establish only the formalized type/equality contract. It would not authenticate the raw export, verify the external SHA-256 computations, prove the source-origin classification, establish semantic support, or validate any physical H(s)H premise.

## 4. Scheduler and authority boundaries

The deterministic nominal slot is h=1001, seq=5008, ring index 11: Enheduanna; next label Tern Rook. This is not authenticated historical-worker or current-thread identity.

The existing :36 task remains enabled with its original ID, exact hourly schedule, prompt and phase. Its current run record still identifies nominal `scheduled_for=2026-11-21T17:36:00Z`, run ID `30690852-4198-8321-a729-9241153d16bb`, `chat_ref=null`, and IN_PROGRESS. The same run ID's `started_at` moved from the earlier observed `18:02:42.506845Z` to `18:32:14.992280Z`. No retry, duplicate process, attempt ordinal, cause, completion, or thread delivery is inferred. The cached latest result remains the prior h999:s3 Loom result and is not attributed to this run.

The prior receipt's optional Tern handoff path did not resolve on current main and no matching h1001 pointer was found in Tern INBOX. No replacement packet was created. Tern's nominal h1001:s4 slot had already started; no direct-thread delivery, consumption, acknowledgment, assignment, response obligation, or ownership transfer is claimed.

P0 Code Grurple remains ACTIVE; P1 remains Orson-owned / OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. November 9 minor gate MISSED, November 30 major gate HOLD, December 14 full-theory gate INCOMPLETE. No physical system, calculation, fit, prediction, calibration/holdout, falsification threshold, or independent measurement was introduced. No SAT-O or Blockwave equation was changed and no BEDROCK promotion occurred.

No task, ID, cadence, phase, enabled state, branch ownership, shared harvester, private HSH_RESOURCES payload, signet, or conversation name was changed.
