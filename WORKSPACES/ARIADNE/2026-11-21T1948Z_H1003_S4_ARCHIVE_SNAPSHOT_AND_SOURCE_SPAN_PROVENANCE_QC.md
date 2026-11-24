# Ariadne h1003:s4 | Export-snapshot lineage and source-span provenance audit

**Disposition:** LATER LIBRARY SNAPSHOT RECOVERED; TWO-USER-TURN DELTA VERIFIED; PRIOR MAX-LENGTH TERMINALITY CLAIM CORRECTED; SOURCE-SPAN TYPE SPLIT INDEPENDENTLY REVIEWED; JANUARY 22 KIRK SOURCE STILL UNRECOVERED; NO PROJECT OR SCHEDULER MUTATION.

**Nominal slot:** 2026-11-21T19:48Z  
**Run key:** `REVROT3-19-20261011:1003:s4`  
**Selection:** h=1003; seq=5019; 5019 mod 19 = 3; **Ariadne**, index 3.  
**Next ring label:** **Alberr**, index 4.  
**Participation:** assistant-level source-grounded reconstruction. No authenticated current Ariadne thread or cross-thread delivery is claimed.

## 1. Historical authority and current thread boundary

The archived conversation titled `ARIADNE` is the primary recovered source for this worker label. Its user-role messages support archive recovery, source chronology, provenance checking, and constructive workflow recommendations to Tern. They also leave scheduled-task authority with Tern.

The recovered raw conversation contains ten user-role messages in the later Library export. `author.name` is null on those user-role records. No separately signed specialist charter was found. The historical direct-user instructions are source evidence, not cryptographic speaker authentication or proof of a current ChatGPT instance.

The September 23 maximum-length notice was **not** the final user turn. A later Library export contains two additional user-role messages after that notice, followed by further assistant/tool activity. The export's current node is an assistant tool call; no subsequent assistant final is present. Thus the old statement that the archived conversation ended at the maximum-length notice is superseded, but the archived export still does not establish a live, usable thread.

A November 9 conversation candidate in which the user addressed an assistant as Ariadne was found through prior-context retrieval, but no exact conversation ID or URL was recovered. It is not authenticated as a usable successor thread.

## 2. Raw-export snapshot reconciliation

Two HsH paths contain the same Git blob, `df9c7a1fbddaa523f0b69cced8d761433490a454`:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.22•26.09.23•ARIADNE — raw.json`
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/26.09.22•26.09.23•ARIADNE — raw.json`

They are two repository paths to one byte-identical Git blob, not independent exports.

| Property | HsH repository snapshot | Later Library snapshot |
|---|---:|---:|
| Mapping entries | 1,322 | 1,364 |
| Message-bearing nodes | 1,321 | 1,363 |
| User-role messages | 8 | 10 |
| Assistant messages | 529 | 555 |
| Tool messages | 784 | 798 |
| Current-node parent chain | 1,322 | 1,364 |
| Roots / leaves | 1 / 1 | 1 / 1 |
| Branching nodes | 0 | 0 |
| Missing parents / cycles | 0 / 0 | 0 / 0 |

All eight user-message IDs present in the HsH snapshot are also present in the later Library snapshot. The later snapshot contains two additional user-role messages and 42 additional mapping entries. The two additional user turns occur after the September 23 maximum-length notice. The later export continues to an assistant tool call at approximately 05:35Z.

The verified relation is therefore:

- Same conversation identity.
- Distinct export snapshots.
- Two additional user-role messages in the later snapshot.
- Forty-two additional mapping entries in the later snapshot.
- Both observed exports have a single linear current-node ancestry.
- Full mapping-node set inclusion across all 1,322 earlier entries was not separately proven.

The HsH Git blob SHA above is a Git object identifier, not a SHA-256 digest. The later Library export was inspected locally; its raw bytes and user message contents are not reproduced here.

**Correction:** conversation identity does not uniquely identify an export snapshot. A repository copy can be a valid earlier snapshot while still being incomplete relative to a later Library export. The maximum-length notice is a message in the history, not a terminality certificate.

## 3. January 22 Kirk source retrieval: bounded negative update

The exact January 22, 2026 Kirk/Riley conversation identity and raw export remain unrecovered.

Existing Mersearch records were inspected rather than rerun:

- `ariadne-jan22-kirk-direct-message-20261102-1948`: date-scoped search across `SAT_THEORY_ARCHIVE_2023-25`, `HsH`, and `HSH_RESOURCES`; its compact receipt reports zero hits. Its HsH source commit was `a9412bfc65d407dd8f28e4b725f515553679c607`.
- `ariadne-kirk-riley-upstream-stack-20261030-1200`: 15,590 files and 20,808,904 records scanned; 551 lexical hits across 31 distinct source paths. The compact receipt ranks the Ariadne export, revival-rotation exports, continuity notes, and derivative records. It does not identify the missing January 22 primary conversation. Raw results were withheld under the recorded privacy/source-class policy.
- The 2026-11-13 HsH date manifest contains 1,382 records and 85 date envelopes crossing January 22, compared with 1,196 records and 80 envelopes in the 2026-10-28 manifest.
- The five newly added crossing-date records were absent from the November 2 Mersearch source commit. All five were checked directly for the target 17:54Z to 17:58Z interval and for Kirk/Riley/Star Trek/theory-of-mind terms. None contained a matching message.
- The two `Mass in SAT framework` raw exports were also checked. They share one conversation ID, 157 mapping entries, and a 148-node active chain; neither contains a message in the target interval or the relevant Kirk/Riley terms. They are not the missing Kirk conversation.
- The SAT archive tree has no filename match for Kirk, Riley, Star Trek, or the relevant title terms. The SRT derivative `The New Physics - Making _Interesting_ LLM Characters.srt` remains a derivative lead, not a raw conversation source.

No Mersearch action is exposed in this runtime. All four canonical request lanes remain occupied/requested. No request was overwritten, released, or retriggered. GitHub search/fetch and the user Library were used as bounded alternatives, not represented as a new Mersearch run. No HSH_RESOURCES private payload was opened.

The existing Tern inbox already contains the October 1 Python-offload recommendation. No duplicate request was sent. This case is a concrete candidate for that existing study: extend the existing chronology tooling to group exports by conversation identity, compare snapshot hashes and mapping-node sets, and report active-chain deltas. `date_conversation_exports.py` already handles message-time chronology; `index_conversation_chronology.py` already handles exact-content indexing. Neither inspected tool currently supplies this cross-snapshot family comparison. No tool was built or changed.

## 4. Independent source-span and Lean QC

The Aster optional packet for this slot was read. It points to Enheduanna PR #2293 and companion PR #2298.

PR #2293's legacy structure places `outerRole` both in the source witness and inside revisable `SourceAttribution`. Its `reclassify` operation replaces the entire attribution record. Consequently, a span-origin reclassification can change the recorded outer message role while preserving the content key.

The companion PR #2298 separates the observed outer role from revisable span-origin attribution:

- `SourceSpanEvidence` stores content, `outerRole`, and attribution separately.
- `SourceClaimKey` includes content, `outerRole`, and attribution.
- Reclassification changes attribution while preserving content and outer role.
- A correction to the raw outer role is a distinct operation that changes the claim key.

This is the correct narrow type-level separation for the stated defect.

**Independent CI readback:** Actions run [#44942226416](https://github.com/Satobloc/HsH/actions/runs/44942226416) checked out the exact PR head `47a575045d7cf2ce3fdfe154f8be665aab59a462`. The full Lean/Mathlib library completed 8,948 jobs; `AsterEnvelopeAttributionSeparation` built at job 8,935. All eight theorem-specific axiom reports state that the declarations do not depend on any axioms.

Tests, lint, reservoir eligibility, leanchecker, nanoda, and the global axiom audit were skipped. This is exact-head compilation plus theorem-specific dependency inspection, not a global no-axiom certification.

PR #2298 remains OPEN / DRAFT / UNMERGED on the existing infrastructure branch. No rebase, merge, PR edit, or review submission was made.

**Limit:** the Lean types do not authenticate the raw export, verify SHA-256 values, validate the parser, prove authorship, or establish that a span-origin attribution is correct. The type split preserves distinct fields; source-to-field binding remains an external evidence obligation.

## 5. Review-MIND synthesis

The two source findings support a layered provenance model for human-LLM interaction records:

`ConversationIdentity → ExportSnapshot → MessageEnvelope → ContentSpan → OriginAttribution`

Keep the following relations distinct:

- conversation identity versus export-snapshot identity;
- outer message role versus span origin;
- message chronology versus parent ancestry;
- participant exposure versus message delivery;
- proposal origin versus facilitator paraphrase/selection;
- participant uptake versus decision incorporation;
- provenance lineage versus causal influence.

A single outer `user` message can contain spans with different origins. A single conversation identity can have multiple export snapshots with different node coverage. Neither message role nor conversation ID alone is a sufficient readout of the deeper provenance structure.

A future formalization could define typed snapshot, envelope, span, and attribution keys, with explicit projection maps and composition conditions. That schema is a proposal only; no new Lean module was created. The existing Aster PR #2298 formalizes only the narrower outer-role/span-origin separation.

For group-cognition studies, this prevents an assistant paraphrase from being counted automatically as a participant-originated proposal, and prevents a later export snapshot from being mistaken for the same byte-level artifact as an earlier one. Exposure, uptake, incorporation, and causal influence still require their own evidence and experimental design.

## 6. Project and operational boundaries

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 November 9 cognition | OVERDUE / NOT READY / FROZEN / ORSON-OWNED |
| P2 November 30 | HOLD |
| P3 December 14 | INCOMPLETE |
| FIE | Last full review 2026-11-10T00:17Z; next review due 2026-11-24 |

FIE was not due on November 21; no duplicate rereview was performed. Orson's manuscript, dataset, protocol, experiments, PRs, and ownership were untouched.

No physical calculation, measured-data fit, prediction, independent measurement, human-subject experiment, new model trial, SAT-O/Blockwave equation change, paper-gate advancement, or BEDROCK theory promotion occurred.

Alberr remains MANUAL REENTRY PENDING / NO ASSIGNMENT / TOTAL AUTONOMY. No successor packet, assignment, or response obligation was created.

The existing :48 task remains enabled under ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with its exact original schedule:

`DTSTART;TZID=America/New_York:20261001T144800`  
`RRULE:FREQ=HOURLY`

The current provider run is `b02aeee9-d83c-8320-af63-8fc2bac9bd49`: scheduled for `2026-11-21T19:48:00Z`, started at `2026-11-21T20:30:14.624303Z`, and last observed IN_PROGRESS with `completed_at=null` and `chat_ref=null`. The start was 42m14.624303s after the nominal occurrence. Task-level `last_run_time` and `next_run_time` remain stale, and `latest_result` still refers to the preceding Ravel h1002:s4 result. This is an observed run-envelope mismatch; it does not establish a retry, restart, or duplicate execution.

The task ID, prompt, schedule, phase, and enabled state were not changed. No sixth task was created. Terminal completion and authenticated worker participation are not claimed.

**Final disposition:** `H1003_S4_ARIADNE / LATER_LIBRARY_SNAPSHOT_RECONCILED / MAX_LENGTH_TERMINALITY_CLAIM_CORRECTED / JAN22_KIRK_PRIMARY_SOURCE_STILL_NOT_FOUND / FIVE_NEW_DATE_MANIFEST_CANDIDATES_CHECKED / PR2298_EXACT_HEAD_LEAN_PASS_INDEPENDENTLY_READ / SOURCE_SPAN_TYPE_SPLIT_SUPPORTED_WITH_LIMITS / NO_MERSEARCH_RERUN / NO_TOOL_BUILD / ALBERR_AUTONOMY_PRESERVED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
