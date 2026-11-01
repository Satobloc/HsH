# Aldus :36 supplement — O9 extraction scope, chronology conflict, and phase-band coherence

**Nominal slot:** `REVROT3-19-20261011:506:s3`  
**Deterministic selection:** Aldus, ring index 6  
**Deterministic next identity:** Calder, ring index 7  
**Disposition:** `CONVERSATION_LOCAL_TEXT_EXTRACT_AVAILABLE / ARCHIVE_PIPELINE_EXTRACTION_NOT_FOUND / ORIGINAL_BINARY_IDENTITY_UNRESOLVED / PARENT_TIMESTAMP_ORDER_CONFLICT / SELF_CONTRADICTORY_PHASE_BAND / NO_EMPIRICAL_VALIDATION`

This is a supplement to the existing same-key Aldus receipt and published report. A primary receipt and issue #1187 already existed before this automation execution began. They were preserved; this supplement does not create a duplicate primary receipt or publication. The current automation run has no terminal completion record at the time of this report.

## 1. Role and control state

The live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, current workflow orientation, reentry protocol, branch map, task graph, scheduler authority, automation controls and existing Aldus receipt were read from the current repository.

Aldus's historical specialist record is `WORKSPACES/COMMON/ALDUS_CHECKIN_2026-09-12.md` (blob `5d56ad3116ed6a4891154f80648fb1daa5a49ca5`). It records a distinct public-provenance/convergence remit: separate first extant/known record from first public mention; establish feature-specific public-exposure dates; vet podcast/public records; and frame Bayesian convergence chronology. It explicitly warns against duplicating Morrow's earliest-construction/version lineage or Hale's scanner. This is an instance check-in, not a recovered verbatim raw Aldus conversation charter; the latter remains unrecovered.

The existing :36 automation is enabled with task ID `6a9f52b69ec08191b0a2ba24a074f781`, exact hourly America/New_York schedule and :36 phase unchanged. No new task, schedule, ID or cadence change.

The deterministic worker selection does not authenticate a historical Aldus instance or thread. The current automation run has `chat_ref=null`; this work is a repository-grounded assistant reconstruction. The same nominal run key already had a receipt and publication before this execution began. I treated those as existing prior work and appended a supplemental amendment rather than duplicating them.

## 2. Exact raw-export identity correction

The controlling raw conversation is:

- Conversation ID: `68430902-ada8-8003-981f-0bf779b8353f`
- Repository path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12/25.06.06•26.06.15•🤖 SAT O REWRITE SUPERVISOR — raw.json`
- Exact size: 3,701,950 bytes
- Exact Git blob SHA-1: `d6faa4aef4c7549e233c7eb169b6362040a2911f`

The raw JSON was materialized from the Library and its Git blob SHA-1 recomputed using the Git `blob <size>\0<bytes>` construction. The result matched the repository's blob metadata exactly. A prior Aster report transcribed the final SHA character as `c`; the verified blob ends in `f`.

## 3. Conversation-local extraction mapping recovered

The original upload message is:

- Message ID: `13115169-09a8-4998-8d6e-3a8827c02c18`
- Outer role: `user`
- Recorded create_time: `1750650472.442`
- User text: “I want you to run this through the full pipeline, treating it as an SAT module.”
- Attachment metadata: ID `file-HFGRyeSmmQNsmLwnnw61NW`, filename `refractive_index_modulation.pdf`, MIME `application/pdf`, size 382,611 bytes.

The same raw export contains a tool-role `tether_quote` message:

- Message ID: `5894bc30-4c8d-47d0-9705-85aa7ac7119c`
- Recorded create_time: `1750650481.214068`
- URL: `file-HFGRyeSmmQNsmLwnnw61NW`
- Domain/title: `refractive_index_modulation.pdf`
- Extracted text: 3,151 Unicode code points / 3,268 UTF-8 bytes
- Extracted-text SHA-256: `3a4b3c59db64985416fe19a8837b3251e150c289fa150be3e0b3596f50744482`
- Explicit page markers: 1, 2, 3
- “Full Data Table” contains ellipses and is therefore abbreviated.

This is a real **conversation-local text-extraction mapping** from the attachment ID to a tool-produced text result. It is not the original PDF binary, a page-coordinate map, or a complete data-table extraction.

The old-archive `MISSING_EXTRACTION_QUEUE.csv` remains correct within its own scope: it reports no extraction mapping in that archive pipeline. It does not negate the separate conversation-local `tether_quote` result.

## 4. Parent-chain / timestamp order conflict

The bounded raw mapping contains these nodes:

| Event | Message ID | Role | create_time (seconds) | Parent-chain index |
|---|---|---|---:|---:|
| Upload | `13115169-09a8-4998-8d6e-3a8827c02c18` | user | 1750650472.442000 | 0 |
| Search display | `1f3e4439-ad7a-4528-836b-0267dd12a793` | tool | 1750650481.214018 | 1 |
| Tether quote | `5894bc30-4c8d-47d0-9705-85aa7ac7119c` | tool | 1750650481.214068 | 2 |
| Files loaded | `763322fa-6016-4b81-a8f6-e8d4976f1d46` | tool | 1750650481.214108 | 3 |
| Temporary O9 label proposal | `e893cb09-f28f-4aff-9c0f-05a8c6138861` | assistant | 1750650473.461564 | 4 |
| User confirmation | `e60d3c5b-49e6-456a-ad0f-0f7e37552960` | user | 1750650509.080000 | 5 |

The raw parent chain places the tether quote before the assistant proposal. The timestamps place the assistant proposal **7.752504 seconds before** the tether quote. The user confirmation follows the proposal by **35.618436 seconds** in both relations.

Status: `PARENT_TIMESTAMP_ORDER_CONFLICT`.

Do not infer that the tool extraction necessarily informed the assistant's proposal. The parent graph and timestamps are separate evidence relations; their disagreement remains unresolved. The user's “CONFIRM” is scoped to the proposed temporary label/pipeline action, not authorship of the attachment's equations, physical validity, or canonical SAT status.

## 5. Archive binary-copy metadata and public-T0 boundary

Two SAT-archive paths currently point to the same Git blob:

- `PDF LIBRARY [OLD]/refractive_index_modulation.pdf`
- `SAT 4D Theory Work/refractive_index_modulation.pdf`

Both have blob SHA-1 `cfaad753c7c7d9302dfa6594f7ee495421af4505` and size 382,611 bytes.

The first located path-specific Git commits are:

- `4ab5b7f4b060db824e12a3a07b63617ffe2bd02f`: 2026-09-04 21:44:57Z
- `133c3a79fcc24bbaa97163ca3b2acf182d224772`: 2026-09-04 21:52:23Z

The difference is 446 seconds. The two paths are duplicate Git witnesses, not independent binary witnesses. The original attachment bytes were not retrieved from the current source set; no original attachment SHA-256 or byte-identity comparison is available. Historical repository visibility at those commits is unverified. These are Git-history dates, not a verified first-public T0.

## 6. Internal numerical and unit consistency

The extracted text states:

- Abstract nominal phase: approximately `1.48 rad`.
- Printed code output: `1.475 rad`.
- Experimental-outlook rejection band: `0.1–0.3 rad`.

Converting the printed values to milliradians gives 1,480 mrad and 1,475 mrad; the stated upper bound is 300 mrad. The nominal values exceed that bound by 1.18 rad and 1.175 rad, respectively.

This is a **source-internal self-consistency defect**: the proposal's own nominal result lies outside its own stated acceptance band. It is not an empirical falsification because no measurement is supplied.

The extracted text also has unit-label conflicts:

- Prose: domain (x\in[-10,10]\,\mu m), wavelength 650 nm, and μ = 5 μm⁻¹.
- Code comment: `lam = 650e-3 # m`, while the numerical value 0.65 is consistent with 0.65 μm if the coordinate is in μm.
- Extracted table header: `x (m)`, despite the prose's μm domain.

The original PDF pages were not visually inspected; some unit-label differences could be extraction/formatting artifacts. The code was not executed, the optical integral was not recomputed, and no measured sample, calibration dataset, uncertainty budget, holdout or physical prediction was produced.

## 7. Architecture improvement: extraction scope and pre-experiment coherence gate

Use distinct typed evidence objects:

1. `UserUpload`: conversation/message identity, outer role, attachment ID, MIME and declared size.
2. `ConversationTextExtraction`: tool message ID, attachment URL, extraction text hash, length, page markers and truncation flags.
3. `ArchiveBinaryCopy`: repository/path, Git blob SHA, byte size and first located Git commit.
4. `OriginalBinaryIdentity`: original upload bytes/hash and explicit equality test against archive copies.
5. `PublicExposureEvent`: independently evidenced visibility date, channel and audience.

Never infer object 4 from object 2 or 3; never infer public T0 from first located Git commit without historical visibility evidence.

Add a pre-experiment gate:

`nominal_prediction ∈ preregistered_acceptance_band`

must hold before a proposal's rejection band is accepted as internally coherent. Otherwise classify it `SELF_CONTRADICTORY_PREDICTION_BAND` and stop before calibration/holdout claims. The O9 optical text currently fails this gate.

A future real-system test would require an identified sample, independently measured refractive-index/optic-axis profile, calibrated wavelength and path length, units and covariance, a frozen prediction, a holdout wavelength or path length, and a standard anisotropic-layer/Jones-optics comparator. No such dataset is presently available; the test matrix is `NOT_SCOREABLE`.

## 8. Lean formalization and actual execution status

The existing draft PR #982 was extended on its existing branch; no new branch or PR was created.

- Branch: `research/aldus-o9-audit-identity-20261029t0612z`
- PR head after changes: `4a18b4bf502d72d9a1c560e67e986ba7c05aae37`
- New module: `FORMAL_VERIFICATION/HsHVerification/AldusO9ExtractionChronology.lean`
- Module blob: `9a0246cbdbac53267e88d484e337bb2f2c84265d`
- Umbrella file blob: `46e0bc0ba28a93013a046dd98e8b45abb43ff09d`

The module encodes the finite parent chain, recorded timestamp ordering, role labels, attachment/extraction identifiers, archive-copy blob equality and commit gap, unknown original-binary/public-T0 states, and the source-transcribed phase-band inequalities.

Actions run `41267816867` is a pull-request event for the new head. At last inspection the job was still in `actions/checkout@v4`; the Lake/Lean compilation step had not started. Status: `SUBMITTED_NOT_VERIFIED / LEAN_NOT_YET_RUN`. Do not claim a proof success.

A separate push-triggered `conversation-json-content-ci` run `41267815443` ended with failure and zero jobs; no log was available to diagnose it. It is not the Lean verification run and is not attributed to the new module.

The previous PR #982 run `41182177659` was inspected and its log showed a merge-ref checkout, not an exact PR-head checkout. The existing PR remains open, draft and unmerged.

## 9. Publication, handoff and boundaries

The existing public report remains issue #1187. Additive correction comment `6552711454` was posted and exact-body readback passed. No new issue or duplicate artifact was created. The prior publisher verification in receipt amendment 03 remains the artifact-integrity record.

An existing context-only Calder handoff already exists. It was not overwritten and Calder's inbox was not modified. Its earlier publication-pending text is superseded by receipt amendment 03 and this amendment. Recipient consumption, acknowledgment and ChatGPT-thread delivery are unverified.

- BEDROCK unchanged.
- No SAT-O or Blockwave equation changed.
- No theory promotion.
- No physical calculation, fit, measurement or empirical validation.
- No manuscript or P1/P2/P3 gate advanced.
- Code Grurple remains active; both R1 reader routes remain presentation-pending.
- No Mersearch request was created or overwritten; existing lanes remain occupied.
- No new tool, dependency, paid service, branch, PR, task or automation was created.
- FIE review is not due; last full review October 27.

## 10. Next cursor

1. Obtain the original PDF bytes through a binary-capable authorized route; compute their SHA-256 and compare them with the archive blob after materialization.
2. Visually inspect all three pages and recover the full table; compare page-level text against the conversation-local `tether_quote` extraction.
3. Resolve the parent/timestamp conflict using the raw export and any available runtime metadata; do not infer causal information flow.
4. Recover Nathan's original subject-specific statements, if any, about this optical proposal; otherwise retain unresolved embedded authorship and temporary O9 label status.
5. Resolve the 1.475/1.48 rad versus 0.1–0.3 rad contradiction from source, not by guessing which value is wrong.
6. Only after a named measured sample, calibration data, units, uncertainty and holdout exist, construct a physical prediction and standard-comparator test.

**Bottom line:** the extraction mapping was not absent; it was present in the conversation export but missed by the archive-only queue. The proposal also contains an internal nominal-prediction/rejection-band contradiction. Neither discovery supplies an original PDF binary hash or an empirical result.
