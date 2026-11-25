# GIT_TRAFFIC | Thread Key and Analysis Lane

> **Small but significant bites. Don't choke, don't nibble.**

**Status:** ACTIVE / independent historical-traffic analysis lane  
**Purpose:** Apply the shared Tock–Tick and Credenza methodology to GitHub Traffic analysis.  
**Boundary:** This is a dedicated conversation/work lane, not a new clone census, coordinator role, or replacement for the canonical shared ledgers.

## Compass

**Primary objective:** estimate externally generated GitHub clone traffic after separating activity attributable to our own systems and workers, with transparent uncertainty.

Keep these evidence classes distinct:

- observed GitHub Traffic clone counts;
- observed unique-cloner counts;
- evidenced internal clone-generating events;
- Actions checkout/materialization events;
- confirmed non-clone/API/connector access;
- repository-present/provisioning-unknown events;
- unresolved residual traffic.

A workflow run is not a checkout. A checkout is not automatically a GitHub Traffic clone. Clone events and unique cloners are different quantities. Do not turn UNKNOWN into zero.

The broader BIO and PHYS research questions are not this lane's subject. Their conversations, ledgers, and the shared methods records are resources for reconstructing and improving the workflow methodology, not evidence for GitHub Traffic metrics.

## Atlas: shared resources and this lane's evidence

**Shared methodology, also available to BIO and PHYS:**
- `HSH_RESOURCES/info/EXTERNAL_DIMENSIONAL_WORKSHOP_PROTOCOL.md`
- `HSH_RESOURCES/info/EXTERNAL_DIMENSIONAL_WORKSHOP_CODE_LEDGER.md`
- `HsH/WORKSPACES/COMMON/MEMORY_CREDENZA_MODEL_2026-11-19.md`
- `HsH/WORKSPACES/COMMON/ADAPTIVE_COLLABORATION_PILOT_v0.1.md`

The above are shared reference/method resources. Each thread retains its own subject-matter lane, active Tock, ticker and findings.

**Traffic evidence and canonical controls:**
- `HSH_RESOURCES/HAUL 9/ND HsH Traffic Rules.txt` — direct user requirements and repository-overlap precedence.
- `HSH_RESOURCES/HAUL 9/reconstitute-ND.txt` — source conversation establishing this lane's primary scope and method request.
- `HSH_RESOURCES/EXPOSURE_STATS/` — historical captures, CSVs and pasted dashboard reports.
- `HsH/WORKSPACES/COMMON/GIT_TRAFFIC_HISTORICAL_OBSERVATIONS_2026-11-25.md` — additive historical-observation catalogue; not an event ledger.
- `HsH/WORKSPACES/COMMON/GIT_TRAFFIC_TICK_LEDGER_2026-11-25.md` — GTT-01 operation assignments, exit conditions and live ticker.
- `HsH/WORKSPACES/COMMON/CLONE_FOOTPRINT_CENSUS_ACTION_PLAN_2026-11-05.md` — shared project-wide action plan.
- `HsH/WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md` and `CLONE_LEDGER.jsonl` — shared event definitions and append-only evidence ledger.
- WH-01 / issue #1703 — Tern-coordinated project census and telemetry reconciliation.

Repository-overlap precedence for ambiguous overlapping statistics: **HsH → SAT_THEORY_ARCHIVE_2023-25 → HSH_RESOURCES → other repositories.** Resolve by source context, capture window, metric and matching CSV evidence; do not assign a capture by guess.

## Work tray

- **CLOSED — GTT-00:** reconstituted this thread's remit, established its independent lane, linked the shared methodological resources, added the bounded-bite rule to the relevant ledgers/Credenza, and independently read back the changes.
- **NOW — GTT-01.A / `@⌕ᵃ`:** source acquisition/inventory is underway. Initial collection listings covered Resources `EXPOSURE_STATS` (176 entries), its `_SAT  Satobloc GitHubStats` folder (120), Resources `HISTORICAL` (57), the SAT archive's 2026 GitHubStats folder (6), and SAT `PRE_HSH_ROUNDUP` (8). The HsH `30SEP26_DUMP` listing hit a 1,000-entry ceiling; explicit page 11–13 requests repeated the same set, so that collection remains incomplete. Newly surfaced but not yet accepted as reconciled observations: `HSH_gitclones.txt` (blob `bcd3484...`, explicit HsH header; 7,090 clones / 1,136 unique cloners; exact window unresolved) and `9.8.26 -- GITSTATS.txt` (blob `45daaab...`, separate HsH and SAT capture sections; exact windows and CSV linkage unresolved). Earlier observations remain catalogued, including the HsH 119,670 single-repository CSV for 2026-11-10–23. Every CSV is single-repository; TXT composites retain separate labeled sections. HsH was public from creation; Resources was initially private and only became public roughly one to two months before 2026-11-25 (exact transition date unresolved). Do not interpret Resources' earlier private-period clones as public exposure. See the Tick Ledger for the exact source paths, findings, limits and next cursor.
- **NEXT — GTT-02:** attribute evidenced internal clone-generating activity using the canonical clone ledger and supporting records.
- **THEN — GTT-03:** calculate matched-window internal contribution and external/unexplained residual bounds.
- **RETURN:** continue source inventory in `EXPOSURE_STATS` and `HISTORICAL`; prioritize HsH, map each single-repository CSV to its measured repository, preserve TXT composite sections, and recover direct window-level unique-cloner evidence where available. Carry unresolved mappings and capture gaps without guessing.

**Shared-ledger lane boundary:** `CLONE_LEDGER.jsonl` is append-only and may advance through PHYS/BIO/GIT work. During this turn, the latest observed commit `f7ddeadc38b4c2b3258ac745bf65ea2c7931a761` appended three PHYS API-only provenance rows; they are not GIT_TRAFFIC observations. GIT-02 must classify shared rows individually. This lane did not write a clone-event row.

**PIN — WH-01 dependency:** Tern retains project-wide census coordination. The known missing 2026-11-15 18:50 run-ID snapshot and its uninspected job endpoints remain a separate recorded blocker. Do not repeat the completed query, invent a replacement snapshot, overwrite Tern's state, or treat worker reports as authenticated direct-thread replies. Historical Traffic capture work can proceed independently.

## Tock plan

### GTT-01 — Historical Traffic source inventory and observation reconciliation

**Expected result:** a provenance-bearing inventory of in-scope historical Traffic observations, with source path, blob SHA, storage repository, measured repository, metric, capture timestamp (or explicit unknown), observation window, total/daily values, duplicate family and read/verification status. Keep HsH as the primary target; preserve other repositories as separate observations only where the source evidence requires them.

**Tick sequence:** see the dedicated [GTT-01 Tick Ledger](GIT_TRAFFIC_TICK_LEDGER_2026-11-25.md). The four investigation ticks use the shared `⌕` phase with distinct intent modifiers: `⌕ᵃ` source inventory, `⌕↦` measured-repository/metric mapping, `⌕∑` quantitative reconciliation, and `⌕∅` evidence-gap recovery. Tick IDs are GTT-01.A through GTT-01.D. The general meanings and separate PHYS/BIO/GIT interpretations are recorded in the shared code ledger. Recording, verification and the deliberate transition gate use `▣`, `✓` and `⇢`.

### GTT-02 — Internal activity attribution

**Expected result:** evidence-bounded accounting of actual internal clone-generating mechanisms. Reuse the canonical clone ledger; do not create a competing event ledger. Keep explicit git clones, Actions run/job/checkout evidence, checkout materialization, API reads, archive downloads and uncertain provisioning separate. Preserve missing telemetry and scope limits. Do not take over Tern's WH-01 coordination.

### GTT-03 — External residual and share estimate

**Expected result:** matched-window low/central/high estimates for known internal contribution and unexplained/external residual, with explicit assumptions and coverage limits. Report clone counts and unique-cloner implications separately. No residual estimate until observation windows and internal evidence are comparably grounded.

## Tick discipline

The live ticker describes the active Tock's operations. Adjacent glyphs imply left-to-right succession; `⇢` is a deliberate decision point, not a routine separator. `@` marks the next uncompleted operation and is not an operation itself. Repeated glyphs are distinct operations when their lettered Tick IDs differ. Retire a glyph and advance `@` only after the operation's result is durable and checked; a chat turn or tool call does not complete a Tick.

**GTT-00 close:** lane remit and shared-method references were durably written and independently read back.

**GTT-01 prior work:** the lane is already oriented and the initial observation tranche is catalogued. The new ticker represents the next bounded execution sequence; it does not imply earlier GTT-01 work is undone.

**Canonical clone-event ledger:** not modified during planning. No new clone event was established by creating this plan. Dashboard observations belong in the historical-observation catalogue, not the event JSONL.



## GIT_TRAFFIC lane isolation and archive-search route — 2026-11-25

**Subject boundary:** This conversation is a distinct GIT_TRAFFIC analysis lane. It is not the main H(s)H theory lane, does not develop or adjudicate H(s)H theory, and does not set, revise, or transmit policy to HsH workers. Repositories are being used as research/reference material for this lane's GitHub Traffic question. Do not treat this lane's choices as worker instructions.

**Primary research corpus:** `Satobloc/HSH_RESOURCES`, especially `EXPOSURE_STATS/` and its nested GitHub statistics holdings. Follow to HsH or SAT only when a specific Traffic artifact, provenance chain, internal-activity record, or necessary search-system interface requires it. No default three-repository theory search is implied by this GIT_TRAFFIC scope.

**Preferred search protocol:** Mysearch is the intended first-choice search route for ordinary archive searches in this lane. Mersearch is reserved for math/structured-query needs or as the fallback when Mysearch is unavailable; when considering Mersearch, inspect all request lanes first and report the actual lane/queue position or explicitly say that no queue position is available. Generic GitHub code search is a last-resort fallback and must be labelled as such, never called Mysearch or Mersearch.

**Current route availability, checked against live archive records:**
- Mysearch's dedicated Nathan Direct workflow exists at `Satobloc/HsH/.github/workflows/mysearch-nathan-direct.yml`, but its own status record `WORKSPACES/COMMON/MYSEARCH_STATUS.md` and implementation plan explicitly classify it as **SCAFFOLD ONLY / NOT VALIDATED / NOT YET A PRODUCTION SEARCH SERVICE**. It uses stable Mersearch 1.0 as its engine; it is not currently a validated production search execution. No Mysearch run is claimed.
- The connector actions available in this session expose repository read/write and workflow-run inspection, but no workflow-dispatch action. The Mysearch workflow requires explicit `workflow_dispatch` inputs. Do not create or commit a synthetic request file as a substitute for dispatch, and do not claim Mysearch execution.
- Mersearch lane request files were inspected. Lanes 1–4 each contain an existing request with `status: requested`; lane 2 is separately documented as an active/in-progress PHY-01 request. No lane is free for this GIT_TRAFFIC request. This is **not a queue position**: no GIT_TRAFFIC Mersearch request was submitted and no position was assigned. Do not overwrite, supersede, or otherwise touch those lanes.
- Accordingly, this turn's generic GitHub code-search discoveries are explicitly **fallback discovery only**, not Mysearch/Mersearch results. They were used narrowly to locate the archive-resident search instructions and current status, not as the substantive Traffic-source search.

The archive records' broader default search scope is not imported wholesale into this lane. This thread's HSH_RESOURCES-first remit takes precedence for its own research question; other repositories are consulted only where the evidence requires them.

@⌕ᵃ⌕↦⌕∑⌕∅▣✓⇢
