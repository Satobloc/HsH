# Past Theorist Survey — Addendum for Tangential and Dedicated Threads

**Date:** 2026-09-12  
**Status:** companion to `PAST_THEORIST_SURVEY.md`; does not replace it.

The first responses show that the survey is useful beyond dedicated SAT/H(s)H theory threads. Tangential, tooling, archive, visualization, methodology, speculative, environment, and conceptual side-threads can preserve code, negative results, Nathan corrections, operator definitions, infrastructure ideas, or methodological distinctions that are otherwise easy to lose.

## Do not force a tangential thread to pretend it was a theory thread

Before answering the main survey, classify the thread as one or more of:

- `DEDICATED THEORY`
- `THEORY-ADJACENT MATH / GEOMETRY`
- `SOLVER / CODING / VISUALIZATION`
- `ARCHIVE / INFRASTRUCTURE / INDEXING`
- `METHOD / QA / AUDIT`
- `EXTERNAL RESEARCH / COMPARISON`
- `SPECULATIVE / META / QUARANTINED`
- `GENERAL SCIENCE / TANGENTIAL`
- `OTHER`

If the thread was not primarily SAT/H(s)H work, say so plainly. Answer the theory-specific questions only to the extent your own thread actually supports them. Do not invent continuity.

## Two extra questions for every surveyed thread

### A. What should be harvested even if this thread is not theory-central?

List anything worth preserving for the present project even if the thread itself is tangential:

- code or tooling;
- install/environment knowledge;
- visualization methods;
- archive/indexing ideas;
- methodological cautions;
- negative results;
- useful toy models/regression tests;
- Nathan corrections;
- source/provenance leads;
- interaction patterns with other tools/AI systems;
- concepts that should remain quarantined but remembered.

### B. Does this thread change what Nathan should archive next?

State explicitly:

1. whether the full conversation should move up or down the archive queue;
2. which exact other conversation, attachment, artifact, or missing dependency should be recovered next because this thread points to it;
3. whether the current team should pause a live line of work until an older derivation/result is checked;
4. whether the thread suggests that something now being rebuilt may already have been done before.

If yes, identify the strongest reason and any recoverable title/date/landmark.

## Extra instruction for dedicated SAT/H(s)H theory threads

When the survey reaches a genuinely dedicated theory-development conversation, be especially concrete about:

- the exact equations/objects derived there;
- what was assumed versus derived;
- what was fitted/calibrated versus predicted;
- whether a claimed proof was formal, analytic, symbolic, numerical, or merely persuasive prose;
- what code/calculation survives;
- what result was independently checked;
- what later work depended on it;
- what Nathan explicitly accepted, rejected, or corrected;
- whether present-day reconstruction should pause until that result is audited.

The goal is not to reward theory-central threads over tangential ones. The goal is to recover whatever unique information each thread actually contains, while giving derivation/proof/provenance claims extra resolution when the thread genuinely supports them.


## October 26, 2026 crosswalk: Nathan's [A]/[B] source labels are distinct from survey self-ratings

Nathan has explicitly clarified that uploaded conversation filenames beginning `[A]` or `[B]` reflect **his own quick assessment of the *archive/recovery value of those conversations***. Some of those same threads also assessed or self-ranked their value while responding to an old-worker survey. Preserve both judgments with authorship and time context; do not conflate or overwrite.

- **User-supplied filename assessment**: `NATHAN_FILENAME_PRIORITY=A|B`, source=original export/path/rename evidence; this does not assert a proof was run or result was accepted.
- **Historical worker survey self-assessment**: `HISTORICAL_WORKER_SELF_RATING=A|B|C|D` plus any separate quarantine flag, direct section/message locator. The survey instructions changed from older A/B/C/D/Q combined score to v3's separate importance and quarantine fields; preserve the version used.
- **Current archival verification**: `SOURCE_READ=FULL|PARTIAL|INDEX_ONLY|UNAVAILABLE`, `RAW_THREAD_ID`, `EXPORT_FAMILY`, `DUPLICATE_RELATION`, `EARLIEST_ATTESTED_DATE`, `ORIGINATOR_CORRECTION`, `SURVIVING_ARTIFACT`, `EXECUTED_CODE`, `INDEPENDENT_CHECK`, `UNFINISHED_PLAN`, `NEXT_CURSOR` (unknowns explicit).
- **Research/physics status** is a distinct BEDROCK/equation-ledger judgment, not derived from any A/B label or survey priority.

Initial existing [Conversation Chronology](../../indexes/CONVERSATION_CHRONOLOGY.md) search of the `7OCT26_A_GRADE_MINEABLES` folder found **53 [A]/[B]-prefixed dated conversation export occurrences**: 36 `[A]`, 17 `[B]`. This is a *bounded path count*, includes at least one duplicated title-export variant, and is not a count of unique conversations or proof of complete survey coverage. Rebuild/validate via existing chronology/duplicate indexes and Mersearch source identifiers, not a manually authoritative parallel list.

**Recovery order:** Search [A] and [B] streams for (i) lost highest-quality derivations/proofs and their exact checks, (ii) uncompleted plans and executable code, (iii) special LLM capabilities/roles, (iv) directly authored Nathan corrections, (v) surprising cross-domain work. Keep selected [B] threads when they contain rare dependencies; do not ignore them solely because of their quick grade.

**Particularly relevant survey orphan:** the `GPT-5.5 Thinking / Clinamen Compression-Indexing Thread` entry in [Past Theorist Check-Ins](PAST_THEORIST_CHECKINS.md) identifies a multi-chart, residual-based, UI/Whirligig archive-addressing proposal **without implemented code/benchmark**. Source conversation needs recovery; do not label as a functioning compressor. It provides an actionable candidate for the current compression/retrieval workstream and documents an assistant's corrected preconception that UI was merely analogous.

**Parent phase map:** [PHASE_STEERING_2026-10-26.md](PHASE_STEERING_2026-10-26.md). All completed source-by-source crosswalks should be recorded through the actual current chrono/index/tagging system or in provenance-bearing sidecars, with this addendum retained as the schema/routing note.
