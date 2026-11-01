# Loom :36 | Source-content and CI-ref identity correction

**Run key:** `REVROT3-19-20261011:505:s3`  
**Nominal time:** 2026-11-01T01:36:00Z  
**Selected identity:** Loom (index 1)  
**Next identity:** Aster (index 2; slot s4 / :48)  
**Participation:** `CONTINUITY_RECONSTRUCTION`; no authenticated historical Loom instance or current Loom thread was established.

## Executive result

One evidence-integrity improvement was completed: **claims are now bound to the actual source artifact and actual checked-out commit, rather than to a derived transcription or a workflow label.**

Two concrete mismatches were found and corrected:

1. The Nathan Verified Words Compendium attached a quotation to user message `b85bff55-f8dc-465f-ad82-796a87181620` that is not the content of that message in the raw conversation export. The raw message SHA-256 matches the existing Loom source ledger; the Compendium's blockquote did not.
2. Lean Actions run #41176686005 succeeded, but its job checked out merge commit `89f6a022d14b910e291baab2dde594f7315bb78f`, not the PR head itself. It is a **merge-ref build**, not exact-head verification.

The Compendium entry was corrected in place with an additive source note; the displaced transcription is preserved below. An additive correction was posted to the existing PR #1098 discussion. No new issue, PR, branch, tool or task was created.

## 1. Loom historical remit and access boundary

The historical conversation pointer is `LOOM Tag Conversation Corpus`, conversation ID `6aa67478-541c-83e9-b8fa-32d6d575eeb9`. Its raw conversation export was not recovered from HsH.

Prior-conversation context retrieval retained:
- A user-constraint summary dated 2026-09-19T19:58:22Z: weave raw Nathan-authored material with provenance, relationships, corrections and chronology; preserve source/author boundaries; do not rename conversations. This is a **summary**, not verbatim raw text.
- Exact user wording at 2026-09-19T19:58:22Z: “Let's have you pick a name and if you haven't already, make a workspace.”
- Exact user wording at 2026-09-19T20:02:13Z: “Alright, Loom. Keep up the good work, and make sure you've got a continuity file to pick up where you left off for when this specific conversation window gets long in the tooth.”

The current Loom README, checkpoint and REV-010 reentry packet are assistant-authored continuity syntheses. They describe a broad corpus-tagging/enrichment remit, but cannot substitute for the missing verbatim charter. The separate direct user message in the Revival Rotation conversation (message `d3976dcf-c5dc-49c7-a523-e6469f4910db`, 2026-09-22T04:03:52.997Z) asks for bulk archive triage using the sieve and Mersearch; that is a project-level process instruction in another conversation, not the complete Loom charter.

The live instance registry classifies Loom as PAUSED / ACCESSIBLE / UNSCHEDULED. The old Tag Conversation Corpus recurrence is not active. This :36 selection is temporary deterministic routing, not a new lease or permanent jurisdiction. The current task has `chat_ref=null`; no historical-thread delivery or authentic Loom participation is claimed.

## 2. Raw-source verification of message b85b

**Canonical raw source**
- Conversation title: “🪡 The Tourist Tailor [e-]”.
- Conversation ID: `68cad3d4-0ccc-8325-be36-94c5b5527997`.
- Raw path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/25.09.17•26.06.01•🪡 The Tourist Tailor [e-] — raw.json`.
- Raw Git blob SHA-1: `dd2b6141af86dea54e4ba2e782214128619ce78c`.
- Parsed mapping nodes: 3032.
- Message ID: `b85bff55-f8dc-465f-ad82-796a87181620`.
- Outer role: `user`.
- Timestamp: `2025-09-18T15:35:04.906Z`.
- Parent: `2dac9056-cf10-4615-86e7-4a1c5827eb8b`.
- Child: `ca956aff-782d-4f14-9d0c-99e511039891`.
- Exact message SHA-256: `d64649a70ef82925bca1a593f68acb7e2eff1b9a0cc3b6fe1b69db0a0366ebf2` (independently recomputed from the raw message text in Python; it matches the existing Loom source ledger).
- Message length: 1,515 Unicode code points.

### Actual raw user message

> Ok… let’s see. Chapter 1 threads the needle. Chapter 5 exposes the issue. The next chapter (also Chapter 1) will right the train ( 😉 ) before going forward to Chapter 6. The only question is how to make that transition. Because I want Chapter 1 to look *exactly* like Chapter 1. Only 3-form. In fact, I think we insert a duplicate frontispiece right after Chapter 5. 
>
> So… Chapter 5 does this: It does the calculations, it notes the 3-form 2-form issue…. It slams on the breaks, sounds the alarm and says Stop.! We’re wobbling. Where’s the wobble? Here it is. That means…. And leave the end just like that, so when you flip to the duplicate frontispiece, you see what chapter 5 is saying that means and you see what we’ve done. [When we transition from Chapter 1 to your regularly scheduled Chapter 6, we’ll have to figure out how to navigate that transition because I don’t want to insert another Chapters 2-4 here… but I also don’t want to leave them un-four-dimensionalized either…. So, they’ll be footnoted, and the fully 4D versions will go at the end of the book. After the epilogue. When you think you’re done. You get a bonus… Chapters 2-4 fully 4D… and these ones won’t just be word-for-word repeats with the 3-factor… they’ll stop and smell the four dimensional roses… and maybe find some smell some four dimensional smells [which is now I think my canonical term for “insights” and intuitions lol… “The Fundamental Four-Dimensional Smells” … maybe that’s the final epilogue lol—not really… maybe really…]

### Displaced Compendium transcription (preserved, not attributed)

The prior Compendium blockquote began: “Here's the deal. We need to write a note that says we have come to the end of the 2-form's utility…” and ended “…we need to be careful not to imply they're exactly equivalent unless we can show the map.”

That text is **not** the raw content of message `b85bff55-f8dc-465f-ad82-796a87181620`. The exact phrase search across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES returned only the Compendium occurrence; it is absent from the 23,892,407-character raw export.

The existing Loom 3-form source ledger already records the correct message SHA-256 and describes this message as a chapter-transition plan. It was not retagged or duplicated.

## 3. What the 2025 direct messages do and do not establish

The raw conversation establishes a direct-user editorial direction toward the 3-form treatment:
- `71da031e-5a0c-4408-bb9f-0b2cbbfdb6f0` (14:42:25.644Z): flags the 2-form/3-form notation shift and asks that it be made explicit.
- `5fa30a76-66ff-41d6-b667-77d8aae5aeef` (15:00:22.113Z): asks whether the two are entirely equivalent; the message is incomplete and ends with a trailing “v”.
- `5730114b-8327-4856-b4ec-3c3f98a7a551` (15:08:14.620Z): questions why the 2-form is being used instead of the 3-form.
- `f5f025e1-3b48-479f-8a94-b59db3b88312` (15:10:27.444Z): asks whether dropping the 3-form obscures its potential insights.
- `e92efb17-2499-482e-b930-9ad11221bd7c` (15:19:27.048Z): proposes rewriting Chapters 1–5 in the 3-form track.
- `b85bff55-f8dc-465f-ad82-796a87181620` (15:35:04.906Z): specifies the Chapter 1/Chapter 5 transition, duplicate frontispiece and later fully 4D treatment of Chapters 2–4.
- `9dc27aac-b34d-46db-8bb1-be603ba3fb73` (15:42:49.979Z): supplies the train-track narrative for choosing the 3-form track.

These are direct editorial questions, corrections and decisions. They do **not** contain the displaced Compendium sentence about “not implying exact equivalence unless we can show the map.” The assistant-authored Chapter 5 response `ff0ef513-0f75-4e87-a719-378447788b32` contains the later claim that the 2-form is the 3-form's dual; that is not Nathan Direct.

The current 2026-10-26 Steering Charter independently requires explicit projection and composition maps with conditions for proposed shape hierarchies. That current rule remains controlling; it must not be retroactively quoted as a 2025 statement.

## 4. Geometry and proof status

In four dimensions, standard Hodge-degree maps are:
`* : Ω³(M⁴) → Ω¹(M⁴)` and `* : Ω²(M⁴) → Ω²(M⁴)`. Thus a 3-form is not Hodge-dual to a 2-form.

A 2-form Poincaré dual could arise from a genuinely 2D swept support. The candidate sweep must be explicit, e.g. `F:C×I→M⁴`, with a regularity/rank condition establishing an independent second tangent direction, orientation, and a defined current pushforward. If the second tangent is dependent, the support has not become a 2D worldsheet. This is a **proposed map contract**, not a recovered Nathan equation or established physical SAT/H(s)H map.

### Existing Lean verification, corrected status

- PR #1098 head: `7666f2cb5b408be77e0c87f3b8ec18cc1950f55a`.
- PR base at the time of inspection: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Actions run: #41176686005; job #124465590995; job conclusion SUCCESS.
- The log says: `HEAD is now at 89f6a02 Merge 7666f2cb5b408be77e0c87f3b8ec18cc1950f55a into 61cc8b65ffed70296e0121dbae067892a79c81d4`.

Therefore the correct status is **MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_VERIFIED**. The build compiled the PR head in the merge candidate; it did not check out the PR head alone.

The inspected job log contains 19 theorem-specific axiom reports and zero `sorryAx` occurrences. Reported dependencies include `propext`, `Classical.choice` and `Quot.sound`. Tests, lint, nanoda and the separate automated axiom audit were not run.

The existing module proves conditional degree/dimension bookkeeping. It does not construct the sweep map, prove rank/immersion/regularity, establish a current-level pushforward, or identify a physical SAT/H(s)H current. No new Lean theorem was added because the source correction is not a new mathematical proposition and the missing physical map is not yet source-defined.

## 5. Evidence-binding improvement

Use two separate identity tuples for future source/proof claims:

**Source claim:** `(repository, raw_blob_sha, conversation_id, message_id, outer_role, timestamp, message_sha256)`.

**Proof claim:** `(PR_head_sha, workflow_run_id, checked_out_sha, checkout_kind, job_conclusion, theorem/log audit scope)`.

Required statuses:
- `SOURCE_CONTENT_MATCH` only when the message hash matches the raw source.
- `SOURCE_CONTENT_MISMATCH` when a derivative transcription is attached to a source ID but does not match its raw message.
- `EXACT_HEAD_BUILD` only when `checked_out_sha = PR_head_sha`.
- `MERGE_REF_BUILD` when the checked-out commit is a merge candidate containing the PR head.
- `UNVERIFIED` when the checkout identity or source body cannot be inspected.

This is a local workflow proposal, not a Common-wide policy amendment. It prevents a role label, message UUID, PR label or green CI badge from standing in for the actual artifact identity.

## 6. Controls and next cursor

- No BEDROCK change or theory promotion.
- No SAT-O or Blockwave equation modification.
- No physical calculation, fit or prediction.
- No new Lean module, branch, PR, tool, dependency or paid service.
- No Mersearch request submitted or overwritten. Loom lane 1 remains requested without a verified run manifest/receipt; the Sable lane-3 crosswalk was running in the late predecessor result.
- Code Grurple remains ACTIVE; no site, manuscript or paper-gate change.
- November 9 P1, November 30 P2 and December 14 P3 remain separate.
- FIE rereview not due; last full review October 27.
- No scheduler, task ID, schedule, phase or prompt changes.
- No authentic Loom first-blush or historical-thread delivery claimed.

**Next exact cursor:** reconcile any remaining Compendium/source-ledger occurrences of the displaced b85b transcription, then keep the 3-form editorial preference separate from the still-unconstructed sweep/projection map. Do not repeat the already completed raw-message excavation.
