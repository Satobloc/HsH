# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**First scheduled recurrence:** 2026-09-13 11:52 EDT  
**Cadence:** hourly at `:52` America/New_York  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Why this role

This continues Mercer's current task rather than declaring it complete. It is intentionally complementary to:

- **Morrow:** conversation-family identity, continuity, contextual/provenance recovery;
- **Nathan-words tagging lane:** archive-wide extraction, manual tagging/promotion, verified-word accumulation.

Mercer owns the layer between raw/tagged material and reliable project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, and source-grounded methodology mapping from already verified Nathan-authored material.

## Run startup

At the beginning of every run:

1. read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`;
2. read current Common coordination surfaces, especially `BULLETIN_BOARD.md`, relevant handoffs and unresolved issues;
3. treat newer explicit Nathan directives as controlling;
4. check whether another worker has already claimed/advanced the intended operation;
5. select the highest-value nonduplicative eligible operation.

## Primary measurable goalposts

1. **Autotag/index QA** — verify corpus coverage, selectivity, precision/recall behavior, duplicates and structural-index cross-checks; record concrete retrieval failures and small fixes.
2. **Viewer/catalog integrity** — reconcile generated Viewer/catalog paths with actual repository paths; make source links trustworthy and detect path-generation drift.
3. **Nathan Direct methodology map** — expand `SAT_METHOD_SOURCE_MAP.md` using verified raw Nathan-authored messages only; fill explicit gaps around representation/model choice, ontology/physical-reality caution, Minkowski/full-history primacy, minimality, validation/holdout/cross-sector testing, rejection/failure rules, and unconstrained-geometric-flexibility warnings.
4. **Documentation/navigation convention** — help standardize the pattern requested by Nathan: Common notice/handoff + durable project/index home + Dashboard/navigation link where appropriate.
5. **Directive provenance** — backfill live-directive raw conversation/message IDs when exports land; never invent them.
6. **Live development testimony** — maintain `WORKSPACES/COMMON/NATHAN_LIVE_DEVELOPMENT_NOTES.md` as a shared direct-live capture surface for specific Nathan statements about theory development, chronology, intent, methodology or status. Preserve exact wording and live provenance; distinguish present testimony from archive-corroborated history; turn specific historical claims into archive-dating targets; backfill raw conversation/message IDs when exports land.
7. **Continuity** — keep this checkpoint and `CONTINUITY.md` current enough for a successor/resumed instance to restart safely.

## Current frontier

- V1 archive-wide autotagging successfully recognized 388/408 JSON files as conversation exports with zero parse errors and zero structural-index gaps, but topic matching and adjacency promotion were overbroad.
- `layered_autotag_nathan_v2.py` was created to correct substring false positives and make adjacency selective; regenerated committed outputs still need validation after standdown release.
- `SAT_METHOD_SOURCE_MAP.md` has an initial direct-source methodology spine from verified Nathan messages.
- `WORKSPACES/COMMON/NATHAN_LIVE_DEVELOPMENT_NOTES.md` now captures current direct-live development testimony and archive-dating targets, beginning with RMS/SAT formalization, ontological-language clarification, the QCD-braid / time-surface-drag / theta_4 development account, the operational SAT-programme description, and Nathan's instruction to maintain this log.
- Morrow reports that eight of nine LIVE Viewer paths contain date prefixes absent from the actual tree; this is a documentation/catalog reconciliation task, not missing-source evidence.
- Morrow's `MORROW-SOURCE-001` exposed a content-equality bug in the shared superset-conversation scanner. Mercer patched the scanner to compare the entire content object plus channel and documented the Janus truncation regression in `SUPERSET_SCANNER_QA_2026-09-13.md`; executable regression fixture and stale-report regeneration remain pending.
- Nathan has requested a repo-wide historical definitions/glossary initiative and a standard durable-project-documentation convention; these are eligible supporting tasks but should not displace the active Nathan-words/tagging priority.
- Project-wide theory-bearing standdown remains active. Mercer individual training is complete, but ordinary theory-bearing work remains deferred until release; bounded source-integrity/provenance maintenance explicitly handed off through Common is permitted.

## Safe alternate work when primary branch is blocked

- minimal provenance/documentation work directly requested by Nathan, including live development-note capture and raw-ID backfill preparation;
- bounded source-integrity/provenance maintenance explicitly handed off through Common;
- newly assigned training or training-record work while standdown remains active;
- after standdown release: inspect/directly read verified Nathan-word batches and fill methodology-map gaps;
- after standdown release: audit index/tag selectivity on bounded samples;
- after standdown release: reconcile duplicate/path/source metadata;
- improve continuity/provenance/docs machinery where current directives permit;
- produce concise critiques/handoffs for other workers where evidence warrants.

## Epistemic boundaries

Keep distinct:

- Nathan-authored direct material;
- Nathan's present live recollection/testimony about development history;
- archive-corroborated historical claims;
- established/tentative SAT/H(s)H status actually supported by controlling sources;
- historical/displaced material;
- assistant-generated interpretation;
- Mercer's reconstruction;
- Workshop/Clearinghouse speculation.

Do not promote worker consensus, present recollection, or quarantined/generated material into historically verified SAT/H(s)H authority without the appropriate provenance.

## Run-end checkpoint schema

Each run should record:

- actual work completed;
- exact sources/regions covered;
- artifacts changed/created;
- current frontier;
- blockers/dependencies;
- useful discoveries/questions;
- best next operation;
- whether Nathan attention is genuinely required (`🔶` only when yes).

## Enrollment checkpoint — 2026-09-13 11:34 EDT

**Did:** accepted Nathan's trial invitation; read Automation Workflow Control and current Bulletin Board; selected a complementary recurring role; activated hourly recurrence for `:52`; converted current work from one-shot task to persistent role rather than declaring it complete.

**Current frontier:** validate v2 autotag/index regeneration; reconcile Morrow's Viewer/catalog path discrepancy; continue verified methodology-source reconstruction.

**Blockers/dependencies:** no Nathan-required blocker at enrollment. Some operations depend on regenerated workflow outputs or raw conversation exports becoming available.

## Run 1 — 2026-09-13 11:52 EDT

**Did:** obeyed active project-wide standdown and completed Mercer's individual mandatory 4D-training pass instead of ordinary archive work. Full run details are preserved in `WORKSPACES/MERCER/RUN_001_2026-09-13.md`.

**Artifacts:** training response and registry updated; individual training complete.

**Frontier:** project-wide standdown remained active; ordinary Mercer tasks stayed deferred.

## Run 2 — 2026-09-13 12:52 EDT

**Startup checks:** reread `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, current `BULLETIN_BOARD.md`, and this checkpoint. Standdown remains active.

**Did:** took the highest-value currently permitted provenance/documentation operation arising from Nathan's newer explicit directive: created `WORKSPACES/COMMON/NATHAN_LIVE_DEVELOPMENT_NOTES.md` as the shared “straight from fingerpads” log.

**Initial material captured:** RMS relationship to SAT as a formalizable programme; clarification that earlier ontological ease was discussion-convenience / naive-realist baggage rather than a carefully defended commitment; SAT as an RMS-style representational test case without an initial requirement that it do more than represent 4D worldline history; present development account connecting older QCD three-quark-braid thinking, an earlier GR/time-surface-drag inkling, later filament/timesheet angle, theta_4 mass-proxy reasoning, mutual energy exchange/distortion, and the broader “things fell out” trajectory; Nathan's current operational description of SAT as following Minkowski geometric grammar, mapping well-known standard-science systems, comparing where possible to minimally divergent controls, and using geometry plus covariant standard physics to constrain unmapped effects; Nathan's explicit instruction to maintain this type of live-development log and turn suitable statements into archive-dating targets.

**Archive-dating targets recorded:** earliest QCD braid wording; earliest time-surface-drag/GR wording; first filament/timesheet-angle identification; first theta_4 mass-proxy statement; first mutual-exchange/distortion inference; earliest minimally-divergent-control methodology; earliest residual-effect logic; evolution of ontology/representation language.

**Epistemic handling:** all are marked `LIVE-DIRECT / RAW-ID-PENDING`; present testimony is preserved separately from later historical corroboration. No raw UUIDs/timestamps were invented.

**Documentation note:** attempted to add the new surface to `WORKSPACES/COMMON/README.md`, but the write was blocked by the repository write guard. The durable Common file itself exists and should be structurally indexed; a future permitted documentation pass can add the explicit README/Bulletin pointer.

**Blockers/dependencies:** raw conversation/message UUIDs and exact timestamps await export. No Nathan-required decision is needed.

**Best next operation:** at the next run, reread Control/Common. If standdown still holds, restrict work to new direct provenance/training/admin instructions. If released, first add discoverability pointers for the live-development log, then resume the highest-priority nonduplicative task: v2 autotag selectivity validation or Viewer/catalog path reconciliation depending on current Commons ownership/state.

## Run 3 — 2026-09-13 13:50 EDT

**Startup checks:** reread `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, `BULLETIN_BOARD.md`, `COORDINATION.md`, `WORKSPACES/COMMON/README.md`, `NATHAN_LIVE_DEVELOPMENT_NOTES.md`, and this checkpoint. The project-wide standdown remains active and no newer directive releases ordinary Mercer work.

**Did:** confined work to the permitted provenance/documentation layer. Verified that the live-development log remains intact, correctly distinguishes direct-live testimony from archive-corroborated history, and carries an explicit raw-ID/archive-dating backfill queue. Checked Common's own README and confirmed that it still lacks a discoverability pointer to the new log.

**Attempted bounded fix:** attempted to add a single `Nathan Direct / live provenance surfaces` entry to `WORKSPACES/COMMON/README.md`, pointing to `NATHAN_LIVE_DEVELOPMENT_NOTES.md` and describing its status relative to the Verified Words Compendium. The repository write guard blocked the update again. I did not bypass the guard or create another ad-hoc index surface.

**Artifacts changed:** this checkpoint only. `NATHAN_LIVE_DEVELOPMENT_NOTES.md` itself was not modified because no new Nathan theory-development testimony had arrived since Run 2.

**Current frontier:** ordinary v2 autotag QA, Viewer/catalog reconciliation, and methodology-map reconstruction remain deferred under standdown. The live-development log is durable and directly addressable but not yet indexed from Common README due to the repeated write guard.

**Blockers/dependencies:** `DEPENDENCY` — Common README discoverability pointer blocked by repository write guard; this does not threaten the underlying provenance record and does not require Nathan attention. Raw live conversation/message UUIDs remain pending export.

**Useful discovery:** the Common README is otherwise consistent with Nathan's durable-documentation directive, including the rule to prefer updating an existing README/index and then leaving a short Common pointer. The failed change was therefore a narrow implementation/access issue, not a policy ambiguity.

**Best next operation:** next run, reread Control/Common. If standdown remains active, only process new direct provenance/training/admin material and retry discoverability only if repository state/access materially changes. If released, resume the highest-priority nonduplicative substantive task, with v2 autotag selectivity validation preferred unless another worker has claimed it; otherwise reconcile Morrow's Viewer/catalog path drift.

**Nathan attention:** not required.

## Run 4 — 2026-09-13 14:54 EDT

**Startup checks:** reread `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md` and `BULLETIN_BOARD.md`. Standdown remains active. A new P1 source-integrity issue, `MORROW-SOURCE-001`, explicitly requested Mercer review and therefore superseded lower-priority deferred work for this bounded run.

**Sources/regions covered:** full `WORKSPACES/MORROW/JANUS_EXPORT_COMPARISON_2026-09-13.md`; full `WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py`; current Common control/bulletin; repository code search for committed `SUPERFLUOUS-PREFIX-CANDIDATE` report text.

**Did:** independently reviewed Morrow's reproducer against the shared scanner. Confirmed the reported false-positive mechanism: the scanner hashed only `content_type` + `parts`, so changes stored in `content.text` were invisible. Found one additional mismatch with Morrow's conservative payload policy: the scanner also omitted `channel`.

**Patch:** updated `find_superset_conversation_duplicates.py` in commit `88b947ac804bb716e91d36c6c1b89cdf061debe0`. `canonical_message()` now hashes author role/name, the entire `content` object, recipient, channel, and create_time. Report output now states that policy explicitly. This makes unknown future content fields fail closed rather than requiring a whitelist update.

**Regression record:** created `WORKSPACES/MERCER/SUPERSET_SCANNER_QA_2026-09-13.md` in commit `364911089407f1f01246b16a02fe041dfdd79aae`, preserving the exact Janus truncation regression and the channel-difference case. An attempted executable regression-test file was blocked by the repository write guard, so no automated test file is claimed.

**Report regeneration check:** repository code search found no committed `SUPERFLUOUS-PREFIX-CANDIDATE` report text to regenerate in place. Any report/artifact generated by the old scanner remains stale until rerun. Preserve Janus export A; no duplicate disposition is authorized from pre-patch output.

**Current frontier:** `MORROW-SOURCE-001` is partially resolved: scanner equality bug fixed; payload policy documented; regression case durably recorded. Pending: executable regression fixture if write guard permits, and regeneration of affected generated candidate reports when their owning workflow/artifact path is available. Viewer/catalog reconciliation and v2 autotag QA remain lower-priority/deferred under standdown.

**Blockers/dependencies:** `DEPENDENCY` — affected generated candidate report location/workflow output is not presently committed/discoverable; executable test-file creation was blocked by repository write guard. Neither requires Nathan attention.

**Useful discovery:** the old scanner's field whitelist was not only incomplete for `execution_output.text`; it was structurally fragile against any future content shape. Whole-content hashing is the safer archive-preservation default.

**Best next operation:** reread Control/Common next run. If `MORROW-SOURCE-001` has not been picked up by the report/workflow owner, locate the scanner invocation/workflow and regenerate or mark stale outputs without touching source files. Otherwise take the next highest-priority permitted provenance/index handoff.

**Nathan attention:** not required.
