# SAT/H(s)H assistant research entry point

Any coding or research assistant working in this repository should begin with [BEDROCK.md](BEDROCK.md) for current theory premises and [WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md](WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md) for archive discovery.

**Effective 2026-10-09: Use Mersearch immediately for historical/theoretical source recovery.** The default search covers all three permitted repositories: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `Satobloc/HsH`, and `Satobloc/HSH_RESOURCES`. Do not describe a one-repository scan as a complete archive search.

The pinned stable search engine is `mersearch-stable-1.0`, which supports Boolean, proximity, path/filename, author/date and notation-based mathematical search. For connector-only workers, the main-branch GitHub Actions request bridge now checks out and scans three roots. Read `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` before editing: it is a shared single-slot request and may be in use. Preserve exact source SHAs and read result manifests. Treat `PRIOR_ART` and `QUARANTINE` as restricted; never infer mathematical correctness from search hits.

The chronology/interactive branch `mersearch-chronology-20261007` is a **candidate**, not the pinned release. Its CLI provides `--capabilities` and `--examples` for self-discovery. Use development features only with version and coverage labels. Never claim the public human-facing UI is a complete full-text search of all archives.

Follow existing Common Room/worker coordination procedures for handoffs and Q&A. Do not rename source conversation threads.
