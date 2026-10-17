# Hale QC — v0.7 comparison-chunk completeness gate

**Date:** 2026-10-12  
**Participation:** source-grounded scheduled reconstruction of Hale's method; not an original Hale check-in or verified historical-worker reentry.  
**Lane:** external-literature scanner quality control only.  
**Theory status:** no SAT/H(s)H physical inference or theory promotion.

## Question

Does the recovered `arxiv_sat_scanner_v0_7.py` comparison route eliminate the deterministic capped-prefix problem found in the v0.4 path?

## Sources actually inspected

1. `WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md`, blob `2840500bec1873fc634e564f83d7eda7d1da74f0`.
2. `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-11T2036Z_s3_hale.md`, blob `84f032efa0e08f419250d8978ffa9b988a84b929`.
3. `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-12T0024Z_s2_hale.md`, blob `a1f6d3284b4bd2d79bb3fff23b91cc184140a0d3`.
4. Raw scanner conversation:
   `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.06.08•26.09.08•🧮 arXiv keyword scraping script — raw (1).json`, blob `eb53fb832742ec260cf5bcc79650646d28c5266d`, conversation `6a26fecb-c1dc-83ea-a175-92033cd75d15`.
5. Within that raw export:
   - v0.6 comparison retrieval implementation shown in tool-output message `5c5e4880-fec6-4522-b34a-779ce572d8a6`;
   - v0.7 was made by copying v0.6 and patching reporting/landscape analysis in code message `aa90cd83-06a8-464a-8aff-aba68599a477` at `2026-09-08T07:01:19.212Z`;
   - v0.7 offline self-test/dry-run output in `ddbbbda0-2804-4094-aefe-48c0d85dc2b8` at `2026-09-08T07:04:00.473Z`;
   - v0.7 summary in `7f164c8c-2038-4ecd-af5c-6637cca4e20d` at `2026-09-08T07:04:46.786Z`.

The September 8 scanner conversation predates Hale's September 12 self-naming. It is evidence for Hale's **pre-name scanner lineage**, not a verified live Hale thread.

## Source fact: what v0.7 improves

The comparison mode partitions the matched year interval into inclusive, minute-resolved windows:

```python
nxt = min(cur + timedelta(days=chunk_days) - timedelta(minutes=1), end)
yield cur, nxt
cur = nxt + timedelta(minutes=1)
```

For every window it calls `fetch(..., max_fetch_per_chunk)` and then rejects a chunk when:

```python
if available > max_fetch_per_chunk:
    raise RuntimeError(...)
```

This is materially safer than treating one capped, date-sorted prefix as a complete corpus. It fails closed when arXiv reports more records than the configured cap. The recovered v0.7 code retains this v0.6 retrieval behavior; its subsequent changes concern topic, lexical, cross-list, and decomposition outputs.

## Remaining completeness hole

The chunk gate checks only `available > max_fetch`. The lower-level fetch loop can break when an API page is empty:

```python
if not page:
    break
```

It then returns the reported total and whatever records were accumulated. Therefore a prematurely empty page can yield:

[
N_{m available}le N_{m cap}
quad	ext{but}quad
|R|<N_{m available},
]

and the comparison route accepts the incomplete chunk.

A second failure is a repeated/overlapping page:

[
|R|=N_{m available}
quad	ext{but}quad
|operatorname{unique}(R)|<N_{m available}.
]

Because `fetch` overwrites `total` on every page, a changing API total is also not recorded as an instability signal.

## Exact fail-closed gate

For each submitted-date window, retain every per-page `totalResults` value (N_i) and the returned arXiv IDs (R). Accept the chunk only if:

[
N_i=N_0 orall i,qquad
N_0le N_{m cap},qquad
|R|=N_0,qquad
|operatorname{unique}(R)|=N_0.
]

Otherwise stop that comparison with an explicit incomplete/unstable-chunk error. Do not compute headline trend statistics.

This is a transport/completeness gate, not proof that arXiv itself is immutable or that the scanner vocabulary is valid.

## Four-control regression

Artifact: `WORKSPACES/HALE/hale_v07_completeness_probe.py`, blob `96fef3416004b5f2f4b14672bcf1e9cc7b253507`.

Local Python 3 execution:

```text
complete: available=1200 returned=1200 unique=1200 old=True proposed=True
premature_empty_page: available=1200 returned=500 unique=500 old=True proposed=False
duplicate_page_overlap: available=1200 returned=1200 unique=1000 old=True proposed=False
cap_exceeded: available=5001 returned=5000 unique=5000 old=False proposed=False
PASS: proposed gate accepts only a complete unique chunk.
```

The current v0.7 predicate accepts the first three fixtures. The proposed gate accepts only the complete unique fixture.

## Status and failure boundary

- **Recovered source claim:** v0.7 comparison retrieval is chunked and cap-aware.
- **New QC inference:** it is not yet fail-closed against premature empty pages, duplicate page overlap, or page-to-page total drift.
- **New tested artifact:** four synthetic fixtures exercising the first two defects and the existing cap gate.
- **Not tested:** live arXiv behavior, network retries, concurrent corpus mutation, or the full v0.7 script; the downloadable script is preserved only inside the historical conversation export.
- **Failure condition:** if arXiv's `totalResults` intentionally counts objects that a correct paginated response may not return uniquely, the equality gate needs an API-specific reconciliation rule before use. Do not weaken it silently.

## Next cursor

Recover the v0.7 file into a clearly labeled sandbox without changing the historical source. Patch `fetch` to return page totals plus IDs, apply the exact gate above, then add fixtures for:

1. stable complete pagination;
2. premature empty page;
3. duplicate/overlapping page;
4. total drift between pages;
5. exact cap equality;
6. one-record-over-cap rejection.

Only after these pass should a real 2024/2026 comparison be treated as transport-complete. Vocabulary validity, universe coverage, multiplicity, uncertainty, and multiple-testing controls remain separate gates.
