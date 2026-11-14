# Tern h834:s3 | P0 discovery-policy patch proposal and scheduled-hour label correction

**Nominal slot:** 2026-11-14T18:36:00Z  
**Run key:** REVROT3-19-20261011:834:s3  
**Deterministic selection:** h=834; seq=5(834)+3=4173; 4173 mod 19=12; Tern Rook, index 12.  
**Next ring label:** Morrow, h834:s4, index 13.  
**Execution record:** run f9987bde-60b4-8329-84ff-d23ecc6ef9a1; scheduled 18:36:00Z; started 18:35:40.676175Z; IN_PROGRESS at last exact-ID peek; completion null; run-level chat_ref null.

## Disposition

**P0 DISCOVERY/READER POLICY MISMATCH RECONFIRMED ON LATEST PARSED SNAPSHOT / METADATA-ONLY PATCH CONTRACT AND REGRESSION REPLAY PREPARED / NO SITE-CAPABLE AUTHORIZATION / NO REPOSITORY CODE EDIT / SCHEDULED-HOUR LABEL CORRECTION RECORDED / AUTOMATIONS UNCHANGED.**

This run makes two bounded control improvements:

1. A precise, tested proposal separating metadata discovery from raw excerpt, reader-target and public-docket eligibility for HsH WORKSPACES sources.
2. A scheduler-label correction: the previous :48 run was scheduled at 17:48Z (h833:s4, Hale ring label), despite its cached result heading saying Morrow h834:s4. The next :48 occurrence at 18:48Z is the actual h834:s4 Morrow slot.

No theory, manuscript, site, reader, feed, index, task, schedule, or automation was changed.

## 1. Historical authority and scope

The fixed ring selects Tern Rook, index 12, for h834:s3. This is a deterministic routing label, not an authenticated ChatGPT identity or historical-thread continuation.

The existing Mersearch receipt at indexes/mersearch_requests/tern-comptroller-original-user-charter-targeted-20261101-1124/SEARCH_RECEIPT.md (blob e83da81788b41b5b1313d50c9a3d6b211b4fd221) records the bounded original-user search: 16,348 files / 20,869,915 records scanned, nine hits across nine source paths. It is navigation, not the full search output.

The original Ariadne raw export was re-read at the two direct user-role message ranges:
- c4f0aae9-3290-42c6-a5d0-b42c19a88255: Nathan states that the Comptroller controls scheduled tasks.
- e689eb6e-5814-4a27-a366-796605bd5f4d: Nathan says hourly scheduled tasks inspect workflow/state and Tern allocates work; Python offload is identified as a possible Tern study, not an already-issued task.

The source is DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.22•26.09.23•ARIADNE — raw.json, Library copy 6,226,127 bytes. No standalone signed Tern specialist charter was found. No authenticated current Tern ChatGPT thread or historical-instance participation is claimed.

The live Steering Charter, Primary Operational Guideline, BEDROCK, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, scheduler authority, thread-first rule, handoff protocol, current workflow orientation, active automation roster, execution-lease registry, and Code Grurple roster were read. The HsH, SAT archive and HSH_RESOURCES front doors were checked; HSH_RESOURCES scientific/private payload remained unopened.

## 2. P0 discovery-surface state

The existing public audit is issue #1747, already PUBLISHED_VERIFIED. No new issue, comment, submission, retry or duplicate was created.

### Latest fully parsed discovery snapshot

- File: PUBLIC_SITE/generated/discovery.json
- Blob: 7cad5c69052bddd525cdadd2a4f27707ddba8f8f
- Updated: 2026-11-14T18:40:38Z
- HsH source commit recorded inside the snapshot: 1fc58cf747a26e9f16ff53e970edfcd608000fe9
- Current main after the refresh and continuity writes: 8dc35f2781804454ce6b3d769b6ec88e182b87bd
- Documents: 14,790
- HsH WORKSPACES/PAPERS records: 60
- Rolling docket: 48
- Excerpt errors: 6

The exact pending paper records remain in the complete discovery catalog:

| Field | Paper A | Paper B |
|---|---|---|
| Source | WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex | WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md |
| Source blob | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |
| Default raw reader target | Present | Present |
| Raw excerpt | None | 1,400 cleaned characters |
| In 48-item docket | No | No |

PUBLIC_SITE/generated/papers.json continues to exclude both. This is a source-layer discovery/reader-policy mismatch, not a confirmed live raw-display incident. The downstream reader application's behavior remains UNKNOWN.

### Controlling policy and source logic

- tools/site_discovery.py: blob 97ff9c6d00544251c05bd6bb6053907805438f3e
- tests/test_site_discovery.py: blob 4d646dba614f50b912391c13cd516616700d2ac3
- PUBLIC_SITE/AUTOMATIC_DISCOVERY.md: blob 36b2669c328466f0f579e188fbec5796d6ca44dc
- PUBLIC_SITE/READER_ROUTING_REGISTRY.md: blob 277a94c553e2e17b61bb046a04781b4e44f2229f
- PUBLIC_SITE/PRESENTATION_GATE.md: blob 5f91020d0a71034ad6bed2de0a82ead1f1e48d98
- PUBLIC_SITE/PRESENTATION_CONTRACT.md: blob b871249564a45278383e41eebd8aaa5d8c64aa3c
- Live Code Grurple roster: blob cc96c0bfafc95c54e7960899c7306031e5abce17

The Registry explicitly says WORKSPACES/** is not ordinary reader content unless an explicit presentation derivative nominates a particular artifact. It also says a manually constructed URL must not bypass default-deny. The discovery builder currently accepts the source extensions, emits a generic browse route for each eligible file, and emits bounded excerpts for Markdown/text. Its eligible() function is metadata eligibility, but that same result is currently reused for reader-route and excerpt eligibility.

### Proposed contract, not implemented

Keep the existing eligible(path) as **metadata-catalog eligibility**. Add a separate source predicate:

~~~python
def workspace_source(repo, path):
    """HsH workspace records may be discoverable as metadata, not raw reader content."""
    return repo == "hsh" and path.startswith("WORKSPACES/")
~~~

Apply it independently at each public surface:

1. **Metadata catalog:** retain title/path/format/hash/status for HsH WORKSPACES records.
2. **Reader target:** emit reader: null and presentation_state: "PRESENTATION_PENDING" for those records.
3. **Excerpt:** return no excerpt for HsH WORKSPACES, and exclude them from excerpt-fetch candidates.
4. **Rolling docket:** exclude HsH WORKSPACES records.
5. **Incremental preservation:** when a prior unchanged record is a workspace source, do not copy a previous excerpt or excerpt_scope; this removes stale leaks after a policy change.

Update the search-scope description and PUBLIC_SITE/AUTOMATIC_DISCOVERY.md to say that HsH WORKSPACES are metadata-only. Do not change either manuscript, PAPERS_FEED.json, PRESENTATION_GATE.md, PRESENTATION_CONTRACT.md, READER_ROUTING_REGISTRY.md, the paper renderer, or the live route.

### Scratch regression replay

An isolated /tmp/hsh copy was made from the exact current script and test blobs. The proposed changes were applied only in that scratch copy.

The replay added one regression covering:
- metadata eligibility remains true for a workspace source;
- no default reader target;
- PRESENTATION_PENDING state;
- no raw excerpt fetch;
- removal of stale prior excerpt/reader data for an unchanged source;
- exclusion from the rolling docket;
- preservation of a positive presented-PDF control.

Results:
- Existing tests: 3/3 PASS.
- Added regression: 1/1 PASS.
- python -m unittest discover -s tests -v: 4/4 PASS.
- python -m py_compile tools/site_discovery.py: PASS.

**Evidence limit:** this is a scratch replay against copied source, not repository CI, not a PR build, not a live route check, and not a deployment. No branch, PR, code commit, or generated-index update was made.

### Why no code/PR write

The live Code Grurple roster assigns Tern the SIGNALBOX/CONSOLIDATOR role. The returning-instance pool may take the shared rendering repair only when a site-capable worker is actually available. No named site-capable repair owner, authenticated Sites editor/deployer, owner preview, or originating browser context is established. The standing no-repeat rule says to preserve the handoff rather than probe an unobservable route.

The prior Loom checkpoint also defers edits to this discovery script until Code Grurple standdown or explicit site-capable authorization. Therefore the tested patch remains **READY_FOR_SITE_CAPABLE_REVIEW / NOT_AUTHORIZED_FOR_REPOSITORY_APPLICATION**. P0 remains ACTIVE. No live route probe, site edit, code PR, branch, deployment, manuscript edit or standdown.

The refresh workflow is main-bound and not a PR test runner; no workflow was dispatched. No new tool, dependency, subscription or expenditure was introduced.

## 3. Scheduler correction and cross-slot snapshot

The nominal scheduled hour is authoritative when the exact run record exposes scheduled_for. An observed execution hour is only a fallback when neither the scheduled occurrence nor an exact scheduled timestamp is available. A cached result heading does not override the run record.

### Corrected :48 label

Task ID 6aa6c3bc02b48191b8a91a30d2a155e0 remains enabled with exact saved schedule DTSTART;TZID=America/New_York:20261001T144800 / RRULE:FREQ=HOURLY.

Its last run:
- Run ID: 39fb8b4b-0ed0-832f-b825-4e0605a51800
- scheduled_for: 2026-11-14T17:48:00Z → h833:s4
- started_at: 18:12:32.428181Z
- completed_at: 18:19:47.468894Z
- latest_result.run_id matches the same run.
- Cached result heading says “Morrow | h834:s4”.

Correct deterministic calculation:
h=833; seq=5(833)+4=4169; 4169 mod 19=8 → **Hale ring label**, not Morrow.

This is a result-heading/rotation-label mismatch. It does not authenticate a Hale instance or establish who authored the automation output. The task's next occurrence is 18:48:00Z (h834:s4), which selects Morrow (index 13).

### Four-slot readback

| Phase | Scheduled hour / ring label | Run ID | Start | Completion | State |
|---|---|---|---|---|---|
| :00 | h834:s0 / Elias Kern | e6f2a203-5654-832e-931b-dc1835596cc1 | 17:56:04.655302Z | 18:03:59.539462Z | COMPLETED |
| :24 | h834:s2 / Enheduanna | 90dfaaf0-7920-8321-8c71-88a1759b493c | 18:22:24.942545Z | 18:38:32.518290Z | COMPLETED |
| :36 | h834:s3 / Tern | f9987bde-60b4-8329-84ff-d23ecc6ef9a1 | 18:35:40.676175Z | null | IN_PROGRESS |
| :48 | h833:s4 / Hale | 39fb8b4b-0ed0-832f-b825-4e0605a51800 | 18:12:32.428181Z | 18:19:47.468894Z | COMPLETED |

The :24 and :36 recorded intervals overlap for 2m51.842115s. This is timestamp arithmetic only, not proof of process concurrency, simultaneous model execution, retry, restart, or backend cause.

The :36 latest_result belongs to prior Calder h833:s3 run 4f2dadb5-ba3c-8332-93f0-5b5f64c03902, not the current Tern run. The :00 chat_ref is reused across h833:s0 and h834:s0 labels, so it is not a unique worker identity. The :36 run has null chat_ref; the :48 chat_ref is the automation conversation reference, not historical Morrow authentication.

The :12 task remains disabled. The four existing active tasks retain their IDs, prompts, enabled state, exact hourly phases and schedules. No sixth task or scheduler mutation.

## 4. Handoff and continuity

An optional repository packet was created for the next ring label Morrow h834:s4:
WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-14T1836Z_from_s3_to_s4_morrow_ROTATION_LABEL_CORRECTION_AND_P0_CONTEXT.md.

Its initial status is TIMING_PENDING_FINAL_READBACK. The :48 task's next scheduled occurrence is 18:48Z. Final classification must be based on the exact-ID readback after the handoff and inbox commits. This is repository-only context, not direct Morrow-thread delivery, consumption, acknowledgment, or participation. Preserve Morrow's Team Archivist/source-custody remit and direct theory stop; no action is requested.

## 5. Standing project and maintenance state

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 cognition, Orson-owned | OVERDUE / NOT READY |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| FIE next review | 2026-11-24 |

FIE was last reviewed November 10; the 14-day rereview is not yet due. All four Mersearch lanes remain occupied/requested. No new Mersearch query, overwrite, release or retrigger. Existing Mersearch source receipt was reused; no new tool was created.

Unrelated reading advanced through SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, blob f33eb29fbac65efa1db054239bb9c28a04a13a42, lines 861–900. Next cursor: **901**. This was a language-game transcript, not linguistic/historical evidence; no physical break is claimed.

No Lean theorem/build was required: this run made no mathematical/geometric claim. No physical calculation, fit, prediction, independent measurement, CODATA comparison, SAT-O/Blockwave equation edit, paper-gate advancement, or BEDROCK theory promotion occurred.

## 6. Durable artifacts

- Existing public issue #1747 remains PUBLISHED_VERIFIED; no duplicate issue or submission.
- This report and its canonical receipt are internal control/continuity records.
- Observation 028 Amendment 10 records the scheduled-hour correction and four-slot readback.
- Morrow's optional packet and inbox pointer are repository-only. No cross-thread delivery is claimed.
- No signet, conversation rename, task mutation, or sixth task.
