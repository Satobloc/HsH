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
