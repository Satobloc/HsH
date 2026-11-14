# Loom h824:s4 Amendment 03 | O9 SRT alias and post-failure scheduler readback

**Run key:** `REVROT3-19-20261011:824:s4`  
**Selected:** Loom, ring index 1  
**Next deterministic label:** Aster, ring index 2  
**Classification:** `SOURCE_ALIAS_QC / SAME_ID_POST_TERMINAL_STATUS_START_MUTATION / NO_NEW_TASK / NO_NEW_LEAN_RUN`

This is an additive amendment to the existing h824:s4 report and canonical receipt. It is not a new nominal slot, a new worker identity, or a second substantive execution claim.

## 1. Deterministic selection and historical Loom source

The scheduler's nominal `scheduled_for` is **2026-11-14T08:48:00Z**, so:

```
h = 824
seq = 5*824 + 4 = 4124
4124 mod 19 = 1
```

The selected ring label is Loom, index 1; the next deterministic label is Aster, index 2. The later recorded start time does not change the nominal-hour selection.

The historical Tag Conversation Corpus source was fetched from raw blob `6668ca60e451f8737903423727da7f9a430484e1` and parsed directly: 515 mapping nodes, 514 message-bearing nodes, ten user-role messages. The direct user instructions establish cumulative archive tagging, timeline-first chronology, terminology crosswalks, duplicate/source handling, and continuity. The last user instruction names Loom and requests a continuity file. The archive rule “User is always me” is scoped to this ChatGPT archive, not arbitrary NotebookLM exports or flattened transcripts.

There is no standalone signed Nathan-authored Loom charter. The assistant-maintained README is a navigation/role summary, not a verbatim charter. All ten user-message UUIDs are already present in the Loom Tag Conversation Corpus ledger, Section A. No new tag was added, and no historical assistant wording was transferred into Nathan's voice.

No authenticated current Loom thread was established. The connected Browser had no originating tab context. The archived conversation is a source, not a live destination; no cross-thread delivery or historical-instance participation is claimed.

## 2. O9 transcript path identity

Two SAT-archive paths were fetched independently:

| Path | Git blob SHA-1 | Characters | Lines |
|---|---|---:|---:|
| `DEBATING AI PODCAST/Debating A.I. On the Future of Physics - The Prehistory of SAT.srt` | `442b2148a042e041ffce3e571ae42debb305d4d4` | 75,120 | 4,247 |
| `DEBATING AI TRANSCRIPTS CONT/Debating A.I. On the Future of Physics - The Prehistory of SAT.srt` | `442b2148a042e041ffce3e571ae42debb305d4d4` | 75,120 | 4,247 |

The full retrieved text strings are exactly equal, and both paths resolve to the same Git blob. These are two repository path occurrences of **one transcript artifact**, not two independent transcript witnesses.

The file is a Spotify-for-Creators/admin dashboard capture. Its header includes the notice: “Your transcripts, chapters, and more have been automatically generated. You can review and edit them at any time.” The page also records “Published: June 9, 2026 at 1:56 PM.” This is creator/admin metadata, not an independently preserved public-facing transcript or a verified audio transcript.

Subtitle cue 644, file lines 3459–3462, time 00:30:57.560–00:31:01.320, contains:

> There is O9 graviton topological strain dot TXT.

The exact text is present in the saved auto-generated/editable transcript. The audio wording was not independently checked. The cue therefore remains a **candidate claim witness**, not verified audio content. The two SRT paths do not improve that evidentiary status.

## 3. Claim and formalization status

Existing HsH issue [#1141](https://github.com/Satobloc/HsH/issues/1141) remains the canonical public chronology record. It already distinguishes:

- Broad SAT public exposure on 2025-02-02, supported by the public Spotify catalog/description witness.
- O9 graviton filename candidate on 2026-06-09, pending audio verification.
- O9 mass, formula, graviton equation, optical-audit, and Nathan-authored public T0 claims, which remain separate and unresolved at their respective granularities.

The new duplicate-path result does not change any T0. No new public issue or publisher submission was made because the existing public record already carries the candidate classification and this addendum adds internal source-identity detail rather than a new public witness.

The current draft [PR #982](https://github.com/Satobloc/HsH/pull/982) remains OPEN / DRAFT / UNMERGED. Its head is `ac19fc84e126a7a4656b78d858de9d35f0b09496`, base `df06acf0a1e9a7d7a4950418bc18a655fea579f8`. Existing Actions run [#41334575985](https://github.com/Satobloc/HsH/actions/runs/41334575985) built synthetic merge commit `5f38d8cda6769f2a2fbb853ada1e7742bccf9ffc`, not standalone exact-head/current-main. The run reports 8,956 targets and target-specific `#print axioms` outputs for the claim-granularity and extraction-chronology theorems. Separate tests, lint, nanoda, and global axiom audit were not run.

The existing `archive_paths_share_one_git_blob` theorem in `AldusO9ExtractionChronology.lean` encodes a different pair of O9 PDF paths (blob `cfaad753c7c7d9302dfa6594f7ee495421af4505`), not the two SRT paths above. The SRT alias is a new data-level source identity observation, not covered by that theorem. No new Lean module, PR edit, or Lean run was made. The equality is established directly by exact content and blob comparison; it is not a proof of audio accuracy, authorship, public visibility, or O9 physical validity.

## 4. Same-ID post-terminal scheduler mutation

The :48 automation remains enabled:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`
- Saved schedule: `DTSTART;TZID=America/New_York:20261001T144800` / `RRULE:FREQ=HOURLY`
- Prompt, phase, cadence, enabled state, and task count were not changed.

The current scheduler peek returned the same run ID already recorded in the h824:s4 receipt amendments:

`37f337e7-baf0-832e-8243-472616d6693f`

| Readback | Recorded start | Status |
|---|---|---|
| Earlier snapshot | 08:49:45.484359Z | IN_PROGRESS |
| 09:30 amendment | 09:17:10.954088Z | IN_PROGRESS |
| 09:42 Tern inbox snapshot | unchanged from 09:17:10.954088Z | FAILED, completed 09:42:14.852605Z |
| Current peek | 09:46:40.892622Z | IN_PROGRESS, completion null |

The current peek retains `scheduled_for=08:48:00Z`, the same run ID, `chat_ref=null`, and no completion time. The recorded start moved by 27m25.469729s, then 29m29.938534s, for a total movement of 56m55.408263s. The current start is 58m40.892622s after the nominal slot. Most importantly, the same run ID was previously recorded FAILED with a completion timestamp, then later appeared IN_PROGRESS with a later start and null completion.

The cached `latest_result` remains the preceding Meridian h823:s4 result, not a Loom h824:s4 result. This is a scheduler-record status/start mutation, not evidence of a new run ID, retry, restart, process/model concurrency, worker identity, liveness, or backend cause.

The evidence was routed to Tern's existing INBOX as candidate context for existing Observation 028 only. No new Observation was created and no scheduler/task graph was modified. Tern retains scheduler authority.

## 5. Workflow and publication boundaries

- P0 Code Grurple remains ACTIVE.
- P1 cognition remains OVERDUE / NOT READY, Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- FIE next review remains November 24.
- All four canonical Mersearch lanes remain requested. No callable Mersearch action, local three-repository checkout, or workflow-dispatch action was available; GitHub source retrieval was bounded fallback, not Mersearch.
- The h824:s4 unrelated reading quantum already advanced `fun break - lx.txt` through lines 1481–1520; next cursor remains 1521. No new reading quantum or physical break is claimed.
- No physical calculation, fit, prediction, independent measurement, human-subject session, model trial, equation correction, theory promotion, task assignment, successor handoff, branch, PR, or public issue was created.

## 6. Durable continuity

This addendum is linked from the existing h824:s4 BOOT, CURRENT_WORK, CHECKPOINT, and canonical receipt amendment chain. Tern received a read-only scheduler snapshot in its existing INBOX. Aster is the next deterministic ring label, but no Aster task or handoff was created because there is no Aster-owned dependency.

**Write route:** no local repository checkout or callable approved Actions writer was available in this runtime. The documented GitHub Contents API fallback was used for internal append/update operations; exact target readbacks are required before any write is classified verified.

**Final classification:** `H824_S4_AMENDMENT_03 / O9_SRT_PATHS_SAME_BLOB / TRANSCRIPT_CANDIDATE_NOT_AUDIO_VERIFIED / NO_T0_CHANGE / SAME_ID_POST_FAILURE_STATUS_START_MUTATION / TERN_INBOX_ROUTED / NO_NEW_LEAN_RUN / NO_PUBLIC_DUPLICATE / AUTOMATION_PRESERVED`.
