# Mersearch assignable upgrade job

**Job ID:** `INFRA-MERSEARCH-1.1-PROMOTION`  
**Status:** ACTIVE / SUPPORTING INFRASTRUCTURE  
**Nathan-direct priority:** 2026-09-21 — attend to the pending search-script upgrades because they are now relieving bottlenecks in other lanes; make the work Comptroller-assignable and worker-requestable.  
**Primary system:** Mersearch / Mercer_Searcher  
**Stable worker release remains:** `mersearch-stable-1.0` at `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`  
**Development line:** `1.1-dev`; do not silently promote `main` to worker production.

## Routing status

This is now an explicit **Comptroller-assignable** and **worker-requestable / worker-claimable** infrastructure job.

- Comptroller may assign a bounded tranche when search/index/retrieval is a leverage bottleneck.
- Any worker may request a bounded tranche when its substantive work is being slowed by retrieval, corpus coverage, stale indexing, search semantics, equation search, chronology, or result-routing limitations.
- Workers should not fork a private search implementation merely because one missing Mersearch feature is inconvenient. Prefer improving the common search semantics/index/client stack unless a disposable local probe is clearly cheaper.
- This job does **not** consume or replace the project-highest-priority `ᚼ` solver-unification branch. It is supporting infrastructure whose value is measured partly by removing retrieval bottlenecks for that and other live work.

## Why this exists now

Mersearch 1.0 is already a useful stable discovery/provenance layer, but several project lanes are now independently hitting the same limits: live solver provenance, historical genealogy, conversation recovery, site/index integration, source crosswalks, and multi-worker recurrence throughput.

The project should treat upgrades as a common infrastructure backlog rather than repeatedly rediscovering the same limitation in each lane.

## Already implemented — do not re-build from scratch

The 1.1 development line already contains substantial throughput work:

- immutable SQLite index generations;
- a read-only indexed query probe;
- reader-during-rebuild safety testing;
- failed-build retention of the previous green generation;
- SHA-256 based incremental generation reuse;
- an incremental updater that copies the prior generation, replaces only changed/new/deleted source records, rebuilds FTS, validates, and atomically advances the generation pointer;
- no-change and one-file-change reuse benchmarks;
- development file-result mode, facets, total-result metadata, and machine/API response metadata.

Relevant implementation commits include:

- `5a14825a97f51ee015e8d712552579ab223e2604` — immutable SQLite builder prototype;
- `501e81d218f57d3eb8f9c9e0d22f56ad370c8fc2` — indexed query probe;
- `918a84175f46cc58a42b13ec5700857961a49ca1` — reader-during-rebuild / failed-build retention tests;
- `b15ac293ca2aa47a77a3a8ca495dc2e18a777136` — incremental immutable updater;
- `c25f7a694e31cc7b4fedf06a733cd8731432b3c4` — incremental reuse benchmark gate.

Do not assign a worker to “design build-once/search-many” as if none of this exists. Start by reading the current implementation and test state.

## Current stable bottleneck

The connector-worker request bridge is deliberately pinned to stable 1.0 and currently searches only:

`Satobloc/SAT_THEORY_ARCHIVE_2023-25`

That means workers needing HsH-main or cross-repository retrieval either need another route or must fall back to less capable repository search. This is now a concrete project-wide bottleneck.

## Priority tranches

### A. 1.1 promotion gate — highest infrastructure priority

1. Inspect the current `.github/workflows/mersearch-1-1-index.yml` result after the incremental-reuse commits.
2. Repair only concrete failures; do not rewrite working components.
3. Verify semantic compatibility with stable 1.0 on the acceptance corpus for unchanged query features.
4. Benchmark indexed vs cold search and record corpus size / runner context.
5. Confirm at least 8 concurrent readers, reader-during-rebuild, atomic publication, and failed-build fallback.
6. Confirm default `QUARANTINE` / `PRIOR_ART` exclusions remain enforced in both build and query paths.
7. Add an explicit release note and stable ref only after the gate is green.

**Exit:** a documented green 1.1 release candidate exists; no worker is told to use it merely because it is newer.

### B. Multi-corpus worker bridge — immediate leverage

Extend the request mechanism so a request declares a corpus/profile rather than implicitly meaning only the original SAT archive.

Minimum useful public/ordinary-worker targets:

- `sat_archive` — current behavior;
- `hsh_main` — live HsH repository, excluding generated-request recursion and ordinary exclusion paths;
- `combined_public` — HsH main + original SAT archive in one reproducible request.

`HSH_RESOURCES` is private and has separate exposure/quarantine constraints. Do **not** make it part of a shared bridge merely by naming the repository. Add it only through an explicitly authorized profile/credential path that preserves current quarantine rules.

Every result must identify searched repository/ref/commit(s), exact roots, exclusions, Mersearch version/ref, request ID and output hashes.

**Exit:** a connector-only worker can request SAT, HsH, or combined-public search without pretending a SAT-only result covered all live project sources.

### C. Worker request schema

Evolve `MERSEARCH_REQUEST.json` / its successor conservatively toward fields such as:

```json
{
  "request_id": "unique-id",
  "query": "...",
  "corpus": "sat_archive | hsh_main | combined_public",
  "sort": "date",
  "result_mode": "records"
}
```

Only expose fields actually supported by the pinned execution release. Schema expansion must not silently route stable requests through development semantics.

### D. Research-power backlog

Bounded workers may also take one of these tranches when it directly removes a live bottleneck:

- conversation-family / duplicate-snapshot relation annotations;
- raw message-ID coverage/backfill and stable Viewer jump targets;
- chronology/history mode with first/latest occurrence and correction signals without automatic supersession;
- mathematical expression extraction (`M1`) and later structural math search; CAS equivalence remains a later explicitly typed layer;
- source-representation ancestry (original ↔ proven extraction ↔ rendered/reader representation);
- topic-index generation / machine-readable manifests for downstream Index Desk / public-site consumption;
- stable API/profile contract for Viewer / Sites / workers;
- public allowlisted search profile before live-site backend exposure;
- stale-route/index freshness diagnostics.

## Worker-request protocol

When another worker hits a Mersearch limitation, it may request work using this compact record in the Common Q&A/bulletin-board system or the associated GitHub issue:

```text
MERSEARCH-REQUEST
requester: <worker>
bottleneck: <what current work cannot retrieve/do reliably>
needed corpus: <sat_archive | hsh_main | combined_public | other-authorized>
needed capability: <existing feature or missing upgrade>
example query/source: <minimal reproducible case>
urgency: <blocking | high leverage | opportunistic>
return route: <worker checkpoint / task / issue>
```

Comptroller may merge duplicate requests into one tranche, assign them to any capable worker, or park them when the common solution would cost more than the immediate bottleneck warrants.

## Assignment rules

A worker taking a tranche should:

1. start from `MERSEARCH_RELEASES.md`, `MERSEARCH_RESEARCH_PLATFORM.md`, and `MERSEARCH_THROUGHPUT_CONCURRENCY.md`;
2. inspect current code/CI before writing new machinery;
3. preserve stable 1.0 while developing separately;
4. add positive **and negative** regression fixtures for query-semantics changes;
5. preserve provenance/explainability and exact corpus boundaries;
6. never weaken quarantine/exposure controls for convenience;
7. report what changed, what did not, and whether stable-release promotion is warranted;
8. return a durable handoff to this job card and the requesting worker.

## Near-term success criterion

The first major success is not “more features.” It is:

> **one shared, indexed, reproducible retrieval service that ordinary workers can request against the live HsH corpus and the historical SAT corpus without repeated cold scans or semantic forks, while stable releases remain explicitly gated.**

After that, equation genealogy, chronology, source-representation graphs, Viewer/Sites integration and richer topic indexing can be layered onto the same common substrate.

## Canonical pointers

- `WORKSPACES/COMMON/MERSEARCH_RELEASES.md`
- `WORKSPACES/COMMON/MERSEARCH_RESEARCH_PLATFORM.md`
- `WORKSPACES/COMMON/MERSEARCH_THROUGHPUT_CONCURRENCY.md`
- `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`
- `.github/workflows/mersearch-request-bridge.yml`
- `.github/workflows/mersearch-1-1-index.yml`
- `tools/search_archive_content.py`
- `tools/build_mersearch_index.py`
- `tools/update_mersearch_index.py`
- `tools/query_mersearch_index.py`
