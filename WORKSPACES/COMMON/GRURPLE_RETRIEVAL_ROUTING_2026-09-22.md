# Code Grurple retrieval routing — provenance tranche 02

**Date:** 2026-09-22  
**Comptroller disposition:** `COMMUNICATION_SMOOTH` + `PARKED + RETURN TRIGGER` for infrastructure; provenance search remains active but non-blocking.

## Signal observed

Mercer tranche 02 did not recover the later particle-mode terms (`true boson`, `t-boson`, `f-boson`, `ghost neutrino`, `Jarlskog Shadow`). It did establish that the refreshed Conversation Viewer catalog is a current manifest/path layer (480 represented conversations) rather than a corpus-wide body index. A literal catalog probe therefore cannot establish term absence.

## Incorporation test

I checked the live Viewer manifest directly. It currently reports `source_state_at_utc: 2026-09-22T12:50:52.040025+00:00`, 480 conversations, 464 development conversations and 11 live conversations. Entries expose canonical raw paths/URLs and per-conversation metadata. This confirms Mercer's diagnosis: the catalog is usable for candidate selection and raw retrieval, but it is not itself the missing body-search surface.

I also queried the repository connector for `Mersearch Mercer_Searcher corpus-wide search raw conversation body index`; no indexed file result was returned. Because repository code-search availability is itself limited here, this is **not** evidence that such tooling does not exist.

## Switch

Do **not** spend Code Grurple author/reviewer bandwidth building a new corpus searcher or manually trawling 480 conversations. That would convert a bounded provenance support task into infrastructure work during a publication override.

Disposition the infrastructure gap as:

- **PARKED + RETURN TRIGGER:** discovery/repair of corpus-wide body-search machinery. Return trigger = a paper Originator says the unresolved later terminology is publication-blocking, or Code Grurple stands down.
- **ACCEPTED/ROUTED:** Mercer may continue only a bounded candidate-set retrieval pass using the refreshed manifest and direct raw-conversation inspection, preserving message IDs/timestamps/roles on hits.
- **COMMUNICATION_SMOOTH:** if an existing Mersearch/Mercer_Searcher/body index is surfaced by another worker, route its exact path/interface to Mercer immediately; do not recreate it.

## Paper impact

Paper A retains tranche 01 as a historical antecedent and must keep the later terminology unresolved unless attributable direct sources are recovered. Lack of a later-term hit is not a reason to back-project the older SAT-W taxonomy. The provenance search is support work, not a review-release blocker unless the Originator explicitly makes it one.

## Architecture-level return

After Code Grurple, route the retrieval-interface defect to the Orchestrator if no reusable corpus-wide body-search surface has been located: the Viewer manifest gives excellent wayfinding but the worker-facing retrieval topology still lacks a confirmed discoverable body-search interface from the current connector surface.

## Exact next cursor

Watch first for (1) Paper A review release, (2) Paper B draft/release, or (3) an existing body-search tool/path surfaced by a worker. If none occurs before Mercer's next bounded turn, permit one small phase-plausible candidate-set raw inspection; do not authorize search-tool construction during Grurple absent Originator-blocking need.
