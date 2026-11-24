# Mersearch Throughput and Concurrency Plan

**Status:** ACTIVE development plan  
**Stable worker release remains:** `mersearch-stable-1.0` at `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`  
**Development target:** 1.1+ indexed multi-reader architecture  
**Motivation:** Nathan reports five recurrence loops operating generally around the clock, plus ad-hoc interactive research. Mersearch must not make each consumer perform an independent cold archive scan.

## Observed baseline

Development workflow run `35517040595` established:
- Core compiled successfully after newline repair.
- Synthetic query-semantics acceptance passed.
- First bounded real-corpus inventory smoke began at 14:37:45 UTC and failed at 14:39:46 UTC during output assembly because development constants `TOOL_NAME` / `TOOL_VERSION` were absent.
- The failure occurred **after roughly two minutes of cold corpus processing**, before the derivation smoke ran.

The NameError is mechanical and repaired separately. The elapsed cold-scan time is the important systems finding: repeated full scans are not an acceptable steady-state backend for multiple recurrence loops plus interactive clients.

## Performance objective

**Build/update once; search many times.**

Queries should normally read a prepared immutable index. Source crawling, JSON parsing, PDF text extraction, hashing, token normalization and math-expression extraction should happen during index build/update, not independently in every query process.

## Proposed architecture

### A. Immutable index generations

Each successful build produces a generation directory, for example:

```text
indexes/mersearch/generations/<generation-id>/
  manifest.json
  files.jsonl
  records.jsonl
  terms.sqlite
  math.jsonl
  relations.jsonl
```

A small pointer/manifest identifies the current green generation.

Readers open one generation and never observe a half-written update.

### B. Atomic publication

Builder writes to a new temporary/generation location, validates it, then atomically advances the current-generation pointer. Never mutate the active generation in place.

Consequences:
- many concurrent readers need no global query lock;
- a failed rebuild leaves the prior generation usable;
- workers can report exact index generation in results;
- rollback is pointer-level, not reconstruction.

### C. Incremental invalidation

Manifest stores at least:
- source path;
- size;
- mtime when locally meaningful;
- content SHA-256;
- parser/extractor version;
- record count;
- source/ref identity where available.

On update:
1. cheap inventory comparison;
2. unchanged sources reuse prior derived records;
3. changed/new sources are reparsed/rehashed as needed;
4. deleted sources disappear only in the new generation;
5. normalization/math caches invalidate when their algorithm version changes.

For repository-native operation, Git tree/blob identities can avoid re-reading unchanged blobs where available.

### D. SQLite search substrate

Recommended first implementation: SQLite, because it is standard, portable, supports concurrent readers, transactional publication/building, indexes and FTS5 in typical builds.

Candidate tables:
- `sources`
- `records`
- `record_fts`
- `topics`
- `record_topics`
- `math_expressions`
- `source_relations`
- `conversation_relations`
- `index_metadata`

Keep raw source text/provenance sufficient to explain results; SQLite is an index, not the source of truth.

### E. Query planning

Before scanning candidate records:
- resolve inventory predicates (`name/path/ext/kind/date/author/role`) through indexed columns;
- resolve lexical candidates through FTS/token indexes;
- apply exact phrase/NEAR/explain logic only to narrowed candidates;
- perform expensive math/CAS/regex/fuzzy modes only after cheap candidate reduction.

Boolean semantics must remain compatible with stable Mersearch unless version notes explicitly state otherwise.

### F. Concurrency classes

1. **Interactive** — human/Sites/Viewer query; low latency, bounded page size.
2. **Research batch** — recurrence loop / archaeology query; larger result budget.
3. **Index maintenance** — single logical builder per corpus generation; never blocks active readers.
4. **Heavy math/semantic** — separately budgeted queue; cannot starve ordinary lexical/provenance search.

No worker should need to coordinate a read lock with another worker.

### G. Backpressure / resource budgets

Backend should enforce:
- maximum returned page size;
- pagination/cursors;
- query timeout;
- regex complexity/time budget;
- fuzzy expansion cap;
- CAS expression/time cap;
- semantic retrieval budget;
- maximum concurrent heavy jobs;
- cancellation;
- bounded excerpt generation.

If overloaded, preserve ordinary lexical/provenance service before expensive enrichment.

### H. Caching

Safe caches:
- parsed query AST by exact query+language version;
- normalized terms/math strings by normalizer version;
- hot result pages keyed by query + profile + index generation + sort;
- source/record metadata;
- Viewer targets.

Generation ID in cache keys makes invalidation trivial: publish new generation, old cache becomes naturally stale.

### I. Recurrence-loop strategy

Five round-the-clock loops should **share one index generation**.

Recommended behavior:
- loops issue read-only queries against current green generation;
- each result records generation ID;
- loops do not trigger independent rebuilds;
- one scheduled/event-driven builder updates the index when source state changes;
- if rebuild fails, loops continue reading prior green generation;
- an interactive user query receives priority over optional expensive batch enrichment;
- saved recurrence queries can be precompiled/cached.

A recurrence job that needs exhaustive historical output should request pagination/batch mode rather than an unbounded interactive response.

## Targets for 1.1 development

Before promotion:
1. repair current development output bugs;
2. add timing instrumentation: inventory, parse, evaluate, hash, enrich, serialize;
3. implement file-mode/facets/totals cleanly;
4. build initial SQLite index prototype;
5. compare cold scan vs indexed query on representative corpus;
6. run concurrent-reader stress test (at least 8 readers to exceed the stated five-loop baseline);
7. run reader-during-rebuild test;
8. verify failed rebuild leaves previous generation readable;
9. verify exclusions/corpus profiles are enforced during indexing and query;
10. verify output includes index generation;
11. document performance numbers and hardware/runner context;
12. only then consider 1.1 promotion.

## Non-goals / cautions

- Do not solve load by weakening provenance.
- Do not silently truncate exhaustive research queries; report totals/pages/budgets.
- Do not let semantic/vector retrieval replace exact search.
- Do not put private/quarantined material in a shared public index and hope the API filters it later. Corpus boundary belongs at index/profile construction as well as request enforcement.
- Do not use a single mutable JSON artifact as a multi-writer database.
- Do not make recurrence loops rebuild the corpus independently.
- Do not infer currentness/authority from index freshness.

## Performance telemetry

Record per request/build without storing sensitive query text unless explicitly approved:
- index generation;
- candidate count;
- returned count;
- elapsed total;
- query-plan stages/timings;
- cache hit/miss;
- timeout/budget events;
- error class.

Aggregate telemetry can guide optimization. Query-content retention needs a separate privacy/retention decision.

## Release discipline

This plan does not modify the 1.0 worker greenlight. Development remains on `main` until a later version passes its gate and receives a `MERSEARCH_RELEASES.md` entry.

## Live queue position and request observability (Nathan Direct, 2026-11-20)

A Mersearch client must be able to determine **where its request is in the queue immediately**, without inferring that state from GitHub Actions run lists or repeatedly polling unrelated workflows.

### Required request lifecycle

Every request receives an immutable request ID and a durable status record. The status model must distinguish at least:

- `SUBMITTED` — accepted and assigned an ID;
- `QUEUED` — waiting for an execution slot;
- `CLAIMED` — assigned to a worker/runner;
- `RUNNING` — search execution has begun;
- `PACKAGING` — results and provenance are being serialized;
- `PUBLISHING` — durable result publication is underway;
- `COMPLETE` — result payload and manifest are durably readable;
- `FAILED` — terminal failure with step, error class and retryability;
- `CANCELLED` — explicitly cancelled;
- `EXPIRED` — retention policy expired the result (never silently delete).

A request must not be reported COMPLETE merely because a workflow was queued, a runner started, a checkout completed, or a process exited. Completion requires durable result readback and manifest verification.

### Immediate queue receipt

The submission response should synchronously return a compact receipt containing:

- request ID;
- current lifecycle state;
- **queue position** (1-based) when queued, otherwise null;
- number of requests ahead;
- estimated/observed service class, not an invented completion-time promise;
- selected worker/runner lane and concurrency class;
- submitted/accepted timestamp;
- last state transition timestamp;
- status endpoint or request-scoped status path;
- cancellation handle where supported;
- query digest and corpus/profile identity.

Queue position is a snapshot and must carry an `observed_at` timestamp. It should update on state transitions and be queryable by request ID. Do not derive position from the request-file lane number: lanes are submission slots, not a globally ordered work queue.

### Queue architecture

Use a durable central request ledger/queue rather than four long-lived mutable request files as the only source of state. Submission should append a request record atomically; workers claim jobs with a lease/heartbeat; stale claims can be recovered without duplicate publication. Preserve idempotency by request ID and make state transitions compare-and-swap or transactionally serialized.

The current four request lanes may remain compatibility ingress adapters during migration, but they should enqueue into the same ledger and return the same queue receipt. Do not overwrite another request to obtain a slot.

Priorities should be explicit and fair: interactive user research, ordinary batch, index maintenance, and heavy math/enrichment are separate classes with bounded concurrency and starvation protection. Queue status must say whether a request is waiting for a runner, waiting behind other work, or actively executing. These are different bottlenecks.

### User-facing status and observability

Provide a status lookup by request ID and an event/receipt path that clients can inspect immediately after submission. Include queue position changes, claim/heartbeat, phase transitions, elapsed time per stage, retry history, worker/runner identity, and terminal outcome. Avoid claiming wall-clock completion estimates until measured service-time distributions support them.

The CLI, GitHub bridge, API and future frontend should expose the same lifecycle semantics. A status display should show a useful result immediately, for example: `QUEUED · position 3 · 2 ahead · interactive class · observed 14:03:22Z`.

### Acceptance tests

1. Submission returns a request ID and queue state immediately, before runner startup.
2. Concurrent submissions receive unique positions in a deterministic order within their priority/fairness policy.
3. Queue position changes correctly when jobs are claimed, cancelled, retried or completed.
4. A runner crash or expired lease returns the request to a recoverable state without duplicate final publication.
5. A status response distinguishes queue wait, runner allocation, checkout, search, packaging and publishing.
6. The status record and result manifest are durable and independently readable.
7. Compatibility lane adapters report the central queue position, not just a lane number.
8. Status/queue visibility does not expose private source excerpts or unauthorized corpus metadata.

This is an architecture requirement and design direction, not an assertion that the central queue/status service is already implemented.

### Queue event timestamps and position history (Nathan Direct, 2026-11-20)

Queue visibility must include the **timestamp of every request ahead of the current request**, not merely a count or position. The status receipt should expose an ordered, point-in-time snapshot such as:

| Position | Request ID | Submitted at | Last state transition |
|---:|---|---|---|
| 1 | `request-a` | `2026-11-20T13:42:08Z` | `2026-11-20T13:42:08Z` |
| 2 | `request-b` | `2026-11-20T13:44:51Z` | `2026-11-20T13:45:02Z` |
| 3 | `this-request` | `2026-11-20T13:47:16Z` | `2026-11-20T13:47:16Z` |

The example is illustrative, not actual queue data.

For each request ahead, expose at minimum:
- current position within the applicable priority/fairness class;
- request ID (or privacy-preserving short identifier);
- original accepted/submitted timestamp in an explicit timezone, preferably UTC;
- current lifecycle state;
- timestamp of its latest state transition;
- optionally, accumulated queue-wait duration, computed from timestamps and clearly marked as a live duration.

Also retain an append-only event history for the request itself: submitted, queued, reprioritized, claimed, started, heartbeat, retried, packaged, published, completed, failed, cancelled. Every event has an event timestamp, and state changes record both prior and new state.

A queue snapshot must include its own `observed_at` timestamp and identify the ordering/fairness policy used. If requests in another priority class are not ahead under the active scheduling policy, do not misleadingly list them as blocking this request; show class position and any global scheduling context separately. Do not expose sensitive query text or source excerpts from other users' requests. Use opaque IDs and timestamps sufficient to make queue behavior legible.

Acceptance tests must verify that timestamps and order are stable, timezone-explicit, and correctly updated after claim, cancellation, retry, reprioritization and completion.

### Eastern Time presentation and timestamp integrity (Nathan Direct, 2026-11-20)

Canonical timestamps remain timezone-aware UTC values (ISO 8601, normally `Z`) for storage, event ordering, interchange, hashing and audit. **All human-facing timestamps presented to Nathan must be converted to `America/New_York`**: queue submissions ahead, current and prior state transitions, queue-snapshot observation times, runner/workflow events, retries, elapsed-time endpoints, and publication/readback events.

Use the IANA zone `America/New_York` so the conversion correctly follows Eastern Standard Time and Eastern Daylight Time as applicable. Display the local value with an explicit `ET` label, or the correct `EST`/`EDT` abbreviation. Do not hard-code UTC-5, UTC-4, or the label EST year-round. Preserve the canonical UTC value in machine records and optionally display both forms for audit. This is a display-layer rule; it does not change the canonical queue ordering, stored event values, or APIs.

A queue snapshot should therefore expose:
- canonical UTC timestamps in its machine-readable response;
- Nathan-facing Eastern rendering for each request's submission and latest event, plus the snapshot's `observed_at`;
- unambiguous timezone labels and the IANA zone used for conversion.

**Attribution / signet rule:** Nathan requested the following signature on this directive. Reproduce the signet only as `[OWL]`; never reproduce the glyph or emoji. Exact signature: `--NM 20NOV26 [OWL]`.

--NM 20NOV26 [OWL]

## Fast lane and capacity expansion directive (Nathan Direct, 2026-11-20)

Repeated long-running cold-scan requests demonstrate that the current four independent Actions bridge lanes do not provide dependable interactive service. Address this with **both** a dedicated priority lane for Nathan Direct interactive requests and a measured expansion of general capacity, but do not merely multiply independent cold scans.

### Priority service class

Establish a dedicated **Nathan Direct / interactive fast lane** with:
- separate workflow/concurrency group and request ingress, so ordinary batch work cannot occupy its single-flight slot;
- bounded, latency-oriented query budgets and prompt status acknowledgement;
- priority scheduling above ordinary research batches, while retaining the same three-repository coverage, stable query semantics, provenance, exclusions, privacy rules and result verification;
- a hard cap of one active fast-lane search initially, with explicit cancellation and no preemption of an already-running query;
- a documented overflow path to ordinary lanes, clearly reporting that it is overflow rather than fast-lane execution;
- Eastern Time presentation under the `America/New_York` convention above.

Fast-lane status must distinguish waiting for a GitHub-hosted runner from checkout, search execution, packaging and publication. A fast lane is not successful merely because it starts sooner; it must demonstrate lower end-to-end latency and preserve equivalent coverage and correctness.

### General capacity

Do not add more cold-scan lanes as the first response to slow search execution. Additional independent lanes can increase simultaneous CPU, memory, I/O, checkout and publication contention without reducing the work per query. General lane expansion should follow measured runner-wait and resource-utilization data. Retain independent lane concurrency groups and idempotent publication.

### Indexed service is the primary scaling path

Prioritize the existing 1.1-dev immutable SQLite/FTS multi-reader architecture:
1. validate one shared index generation across all three permitted repositories, with per-repository source commit identities and corpus-profile exclusions;
2. test cold build, incremental update and read-only query timings separately;
3. benchmark the same queries against stable 1.0 cold scans and the indexed prototype;
4. run at least eight concurrent readers, including one Nathan Direct interactive query while batch readers are active;
5. test reader-during-rebuild, failed rebuild retention, stale generation behavior, and per-profile isolation;
6. require source-level provenance and result-equivalence tests against stable 1.0 before enabling the index for primary research retrieval.

The shared index must not combine restricted/private material into a profile that an interactive client can access. Build separate access-controlled profiles or enforce corpus boundaries at index construction and query time. Preserve source reads and original repositories as source of truth.

### Acceptance criteria

- Fast-lane request is acknowledged with immutable ID and queue/event receipt before runner allocation.
- Its queue position and every request ahead include submission timestamp, latest event timestamp and state.
- Nathan-facing timestamps display in Eastern Time; machine records remain UTC.
- Fast lane demonstrably avoids ordinary batch queue contention.
- On representative equal-coverage queries, indexed interactive search has materially lower p50 and p95 end-to-end latency than the current cold-scan bridge.
- Three-repository coverage, exclusions, source SHAs, result totals and provenance remain auditable.
- Eight-reader concurrency and reader-during-rebuild tests pass without partial-generation reads or publication collisions.
- General lane count is increased only when measurements show runner queueing, rather than search CPU/I/O or repeated corpus scans, is the limiting factor.

### Implementation boundary

This is a prioritized implementation directive and acceptance contract. It does not claim that the fast lane, central queue, or multi-repository indexed service is already deployed. Do not switch primary research traffic to the 1.1-dev index until the stated validation gate passes.

--NM 20NOV26 [OWL]
