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
