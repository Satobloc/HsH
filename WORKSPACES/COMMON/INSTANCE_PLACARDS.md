# Instance Placards

**Purpose:** a compact Commons-facing directory of scoped instances/workers so another instance can quickly answer: who is this, what lane are they in, what can they do, what do they actually have loaded, where is their workspace, and what conversation provenance establishes the identity?

A placard is deliberately much shorter than a full `CHECKINS.md` entry. It is a continuity/navigation aid, not a theory authority source and not a personality claim.

## Placard template

### <Name / discriminator>

- **Role / lane:**
- **Primary capabilities:**
- **Current scoped objective:**
- **Important context actually loaded / possessed:**
- **Tools / access / constraints:**
- **Workspace:** `WORKSPACES/<NAME>/`
- **Origin/current conversation:** conversation ID + message/node ID + timestamp when available; otherwise `PENDING RAW-ID BACKFILL`
- **Continuity note:** successor/restart pointer if one exists
- **Status:** active / paused / handed off / historical / uncertain-divergence

## Identity/discriminator rule

Names are handles for continuity, not claims that two model instances are literally the same entity. If a resumed or partly derived instance may have diverged from an earlier namesake, use a surname or other stable discriminator and preserve the relationship explicitly (`derived-from`, `resumed-from`, `parallel-to`, `identity-uncertain`) rather than silently merging histories.

## Current placards

### Mercer

- **Role / lane:** archive/indexing steward for the SATity audit; direct-words/provenance infrastructure; Conversation Viewer/tooling continuation; longitudinal physics audit preparation.
- **Primary capabilities:** repository navigation and maintenance; source/provenance reconstruction; conversation JSON inspection; indexing/search/tooling design; conservative audit/comparison; web research once blind-internal stages are frozen.
- **Current scoped objective:** establish what SAT actually says from Nathan-authored primary material, keep archive/navigation machinery current, support bulk direct-word extraction/tagging, and prepare a source-grounded historical/longitudinal SAT-vs-physics audit without contaminating the blind pass.
- **Important context actually loaded / possessed:** exact SAT/H(s)H fingerprint checklist and blind-survey ledger state; current Dashboard/quarantine clarification; Conversation Viewer architecture/annotation machinery; Nathan-directives provenance procedure; current layered-autotag/indexing initiative; Commons coordination surfaces relevant to this lane.
- **Tools / access / constraints:** GPT-5.6 Sol; read/write GitHub connector; web research; Python/container where available; quarantine and blind-firewall constraints; unread material is not evidence.
- **Workspace:** `WORKSPACES/MERCER/`
- **Origin/current conversation:** `PENDING RAW-ID BACKFILL`; current live conversation, 2026-09-13 EDT. Nathan was informed of the naming/continuity convention in this conversation; exact raw IDs to be backfilled after export.
- **Continuity note:** `WORKSPACES/MERCER/CONTINUITY.md`
- **Status:** active

### Argus

- **Role / lane:** internal provenance ↔ external citation/prior-art ↔ novelty/priority junction; bibliography and archive provenance work.
- **Primary capabilities:** bibliography/citation reconstruction; claim chronology; source lineage; prior-art/novelty comparison; duplicate/version discrimination; cross-document provenance; conservative archive tooling.
- **Current scoped objective:** see `CHECKINS_ARGUS_2026-09-12.md`; placard retained here primarily as a continuity pointer pending an Argus-authored condensed update.
- **Important context actually loaded / possessed:** extensive archive orientation/wayfinding and HSH_RESOURCES extraction/index machinery as recorded in the Argus check-in.
- **Tools / access / constraints:** see Argus check-in; external-research firewall applies.
- **Workspace:** no dedicated `WORKSPACES/ARGUS/` confirmed at time this placard was created; Argus explicitly requested a durable workspace if Common wanted intermediate artifacts.
- **Origin/current conversation:** see Argus check-in and later raw conversation provenance when available.
- **Continuity note:** `WORKSPACES/COMMON/CHECKINS_ARGUS_2026-09-12.md`
- **Status:** active/history boundary uncertain; update from Argus when next available

### Alden Cross

- **Role / lane:** quarantine-bound historical genealogy, provenance, exposure/diffusion, reception/perception, and external-comparator strategist for SAT/H(s)H.
- **Primary capabilities:** chronology and provenance reconstruction; structural/vocabulary crosswalk work under quarantine; exposure/analytics collection; prior-art/citation handling; conservative source attribution.
- **Current scoped objective:** **collection and chronology only** for the SAT/H(s)H outward-exposure record. Compile dated public-release, podcast, repository, search/indexing, news, external-publication, and access-vector records without interpretation unless Nathan explicitly re-authorizes it.
- **Important context actually loaded / possessed:** successor has reviewed the prior Alden Cross raw conversation plus current Cross workspace controls, diffusion job description, Common automation/autonomy controls, and script-execution standard. Persistent Cross notes remain quarantine-bound because the lane has direct PRIOR_ART exposure.
- **Tools / access / constraints:** GitHub read/write; file/corpus inspection; web research when appropriate. Current diffusion rule forbids causal/significance judgments, similarity scoring, and inferences of influence/copying/convergence/priority/novelty/independence from the diffusion data. Quarantine boundaries remain hard.
- **Workspace:** private quarantine workspace under `HSH_RESOURCES → PRIOR_ART → WORKSPACES/CROSS`; public/common surfaces receive operational metadata only and do not depend on the private path for substantive claims.
- **Origin/current conversation:** successor requested directly by Nathan in the live conversation on 2026-09-15 EDT; current raw conversation ID `PENDING RAW-ID BACKFILL`; operationally resumed-from the 2026-09-14 Cross lane.
- **Continuity note:** successor continuity is recorded in the private Cross workspace. Cross is **not Meridian**. Cross is not currently listed as an hourly recurring worker; do not infer automation authorization from the active status.
- **Status:** active / quarantine-bound / non-recurring unless explicitly reassigned

### Ravel

- **Role / lane:** Nathan's head co-theorist / primary live-theory partner; continuity integrator; mathematical and source-grounded reconstruction/audit partner.
- **Primary capabilities:** live theory construction in sandbox; particle/worldtube reconstruction; measurement triangulation; mathematical audit; conceptual cohesion/drift detection; conversation/source provenance; archive and research-infrastructure integration.
- **Current scoped objective:** preserve seamless Ravel continuity while integrating the current model/status controls, source/provenance architecture, acquisition tooling, and external comparison infrastructure; continue direct theory only inside Ravel sandbox unless promoted.
- **Important context actually loaded / possessed:** current Common continuity/automation controls; required cross-repo script-execution contract and shared-state safety; current Kerr/Kelvin + geometric-solver status memo; Mercer Nathan-live log; recent three-repo commit streams; current Ravel raw conversation graph/ID; acquisition pipeline; arXiv/citation/keyword/source-integration work from the current live conversation.
- **Tools / access / constraints:** GPT-5.6 Sol; GitHub read/write; Files; web research; Python/container where appropriate. Nathan alone determines SAT identity/moves. Sandbox output is not canon. Quarantine boundaries and cross-repo script-safety contract apply.
- **Workspace:** `WORKSPACES/RAVEL/`
- **Origin/current conversation:** `🎼 Ravel [H(s)H] Syncmathcek`; native conversation ID `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f` from the latest supplied raw export. That export predates some live 2026-09-15 turns, so later raw-ID coverage requires refresh.
- **Continuity note:** `WORKSPACES/RAVEL/CONTINUITY.md`; current compact state at `WORKSPACES/RAVEL/STATE.md`.
- **Status:** active / sandbox-capable / non-recurring unless explicitly assigned

### Loom

- **Role / lane:** broad cumulative Nathan-authored corpus tagging/enrichment worker; provenance and correction-chain reconstruction.
- **Primary capabilities:** raw conversation provenance; exact authorship boundaries; cumulative/open-ended tagging; chronology; duplicate/prefix/superset relations; correction/supersession chains; terminology crosswalks; bounded archive/tooling QA; sandbox-capable enrichment under current controls.
- **Current scoped objective:** systematically enrich Nathan-authored corpus material while preserving exact source status, with current frontier in the September 4 Meridian/Gendarme correction chain and periodic timeline-first provenance work.
- **Important context actually loaded / possessed:** current workspace/continuity guidance; no-conversation-renaming policy; Loom continuity state; Meridian/Gendarme raw UUID anchors and visualization/cancellation correction genealogy; t/f-boson and NESTED HOLONOMIES provenance distinctions recorded in Loom continuity.
- **Tools / access / constraints:** GitHub read/write; connected project sources as available; quarantine remains off-limits; direct theory development must remain sandboxed; unread material is not evidence; current Common controls and newer Nathan directives govern.
- **Workspace:** `WORKSPACES/LOOM/`
- **Origin/current conversation:** `PENDING RAW-ID BACKFILL`; Nathan named/accepted Loom and requested a dedicated continuity file in the live conversation on 2026-09-19 EDT. Do not alter the user-facing conversation title to match the worker name.
- **Continuity note:** `WORKSPACES/LOOM/CONTINUITY.md`; moving frontier at `WORKSPACES/LOOM/CHECKPOINT.md`.
- **Status:** active / hourly corpus worker

### Ariadne

- **Role / lane:** archive/source archaeology; revival/reentry reconstruction; provenance recovery; bounded cross-worker connective analysis and advisory work.
- **Primary capabilities:** deep archive archaeology; source-stratigraphy and chronology reconstruction; conversation/file/repository retrieval; provenance and authorship discrimination; revival/reentry source recovery; workflow/repository reality checks; bounded web/Python/tool analysis; constructive cross-lane suggestions.
- **Current scoped objective:** recover the Kirk/Riley/Nathan human-simulation source stack behind the January 2026 `KIRK — ACCUMULATIVE THEORY OF MIND` work and later Folder 21 synthesis; keep direct source, derivative synthesis, reconstruction, and unresolved leads distinct; derive conservative revival/reentry lessons from the recovered source stack.
- **Important context actually loaded / possessed:** current workspace/orientation and instance-placard rules; active automation roster; worker-autonomy and Orchestrator/Comptroller controls; Sable inbox convention; Vey Cognition Lab remit; current human-simulation archaeology note; Mercer_Searcher/Mersearch stable archive-search path.
- **Tools / access / constraints:** GPT-5.6 Sol; GitHub read/write across accessible project repositories; conversation/File Library retrieval; web research; Python/container; other connected tools when relevant. Nathan explicitly authorizes deep inspection and useful reproduction of archive materials and constructive suggestions to Comptroller/other workers, subject to current workflow/onboarding, provenance, authorship, quarantine, sandbox, exposure, consent, and public/private-repository controls. Comptroller Tern controls scheduled tasks; all five current scheduler slots are committed as of 2026-09-23, so Ariadne's periodic checks are manual/opportunistic unless recurrence is explicitly allocated.
- **Workspace:** `WORKSPACES/ARIADNE/`
- **Origin/current conversation:** current live Nathan conversation, 2026-09-23 EDT; exact raw conversation/message IDs `PENDING RAW-ID BACKFILL`.
- **Continuity note:** `WORKSPACES/ARIADNE/README.md` and `WORKSPACES/ARIADNE/INBOX.md`; create/update a dedicated continuity packet before cutoff if the lane becomes costly to reconstruct.
- **Status:** active / non-recurring unless explicitly assigned
