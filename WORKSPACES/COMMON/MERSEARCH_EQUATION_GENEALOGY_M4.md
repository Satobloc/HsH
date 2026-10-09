# Mersearch M4 — Equation recurrence and evidence graph

**Status (2026-10-09): DEVELOPMENT CANDIDATE, NOT STABLE.**
This builds on M1–M3 safe mathematical search and does NOT change the active
stable Mersearch 1.0 worker bridge. It does NOT claim to prove who derived an
equation, mathematical identity between different physical observables,
historical priority outside covered sources, or the correctness of SAT/H(s)H.

## What it does

Run over all three repository checkouts by default, recording source hashes,
message IDs, exact equations, line coordinates, uncertainty and the scope of
the extraction. No pre-existing indexing or search query is needed:

~~~bash
python -m pip install -r tools/requirements-mersearch-math.txt
python tools/search_archive_content.py --capabilities
python tools/search_archive_content.py --coverage
python tools/search_archive_content.py --genealogy-only --out /tmp/mersearch-genealogy
~~~

Alternatively, attach the graph to a normal query:

~~~bash
python tools/search_archive_content.py \
  --expr 'equiv:"B=3/(4*pi)"' \
  --math-genealogy --genealogy-atol 0.001 --sort origin \
  --out /tmp/mersearch-b-lineage
~~~

These commands produce:
- `MATH_EXPRESSIONS.jsonl`: bounded equation extraction with original source
  repository, SHA256, message/record locator, source-line number, raw text,
  named symbols, source date and clickable GitHub URL.
- `MATH_GENEALOGY.json`: the source/equation nodes, typed relation edges,
  exact-polynomial families, first and last **directly attested** dates,
  undated occurrence counts, corpus scope and extraction limitations.
- Existing Mersearch `SEARCH_RESULTS.json` (and other result exports)
  identifies graph status/counts. `--genealogy-only` intentionally has
  zero text-query results, because it is **indexing**, not searching.

## Distinctions enforced

1. **POLYNOMIAL EQUATION FAMILY**: supportably exact relations such as
   `B=3/(4*pi)` and `4πB=3` with identical named variables and constant
   denominator. A rounded `B≈0.2387` is NOT an exact member.
2. **SOURCE MIRROR**: exact matching file SHA256 and equation coordinates
   connect different archive locations, without counting as independent
   historical records.
3. **NUMERICALLY CLOSE, NOT EQUIVALENT**: equations for the *same named
   variable* may be numerically close under a specified **absolute**
   tolerance and matching recorded unit category. Different quantities
   `Delta_phi`, `B` and `v_crit` are not merged just because all contain
   numbers near 0.239. Recorded degrees and radians are NOT silently
   converted, and a missing unit is not assumed equal to a documented unit.
   These are direct pairwise observations, NOT transitive equivalence classes.
4. **CHRONOLOGY**: direct structured-message times are distinguished from
   archive-date/folder-date or timestamp-looking text. Date-only records
   cannot establish within-day ordering. An earliest timestamp is an earliest
   **attestation among indexed eligible records**, not an absolute discovery
   date.
5. **NO DOCUMENTARY DERIVATION CLAIMS**: relations like
   `ALGEBRAICALLY_EQUIVALENT_POLYNOMIAL`, `SAME_EQUATION_FORM_REAPPEARS`,
   `NUMERICALLY_CLOSE_NOT_EQUIVALENT` and
   `BYTE_IDENTICAL_SOURCE_MIRROR` describe observable record relationships.
   They do **not** mean one source derived from, cited, copied from, endorsed
   or superseded another. Actual documented transformations require
   separate source-backed typed claims in a later M4 extension.

## Search coverage and resource bounds

The graph inherits the normal Mersearch exclusions for PRIOR_ART and
QUARANTINE plus normal scanner limits. Each text record is capped at 2,400
lines and 64 parsed equation candidates; the parser does not cover the
whole mathematical language. The graph itself has a hard 50,000-node input
bound, 60,000-edge output bound and a maximum of three numeric neighbors
per node. Node-bound overflows raise a visible error rather than pretending
coverage is complete. The manifest reports extraction and edge-cap limits;
review them before making a negative search claim.

Graphs never silently claim complete corpus coverage. A repository being
checked out is not proof that every PDF, attachment, image, oversized text
or mathematical expression was parsed.

## Tests and release acceptance

- `WORKSPACES/MERCER/test_mersearch_math.py`: symbol/AST safety, polynomial,
  structural, numerical and three-archive Boolean search regression.
- `WORKSPACES/MERCER/test_mersearch_genealogy.py`: direct chronology, mirrors,
  false equivalence, non-transitive near-number links, unit mismatch,
  caps/truncation, deterministic IDs, no-query indexing and end-to-end CLI.
- `.github/workflows/mersearch-chronology-dev.yml`: these tests plus
  source-first smoke against real SAT Mark V optical phase documentation.

**Remaining before promotion:** complete three-archive performance and recall
audit, triage of historically important unparsed formula syntaxes, explicit
derivation/source reference edges, stable graph persistence/updates and public
index policy. The current public Conversation Viewer Mersearch is a separate,
restricted **title/path catalog**, not a public M4 equation graph.

## Relation to M5

[Mersearch glossary / SAT↔standard graph backlog issue #25](https://github.com/Satobloc/HsH/issues/25)
should attach historical term definitions and source-typed physics translations
to these equation nodes. Such edges can drive *search expansion* without
mistaking a proposed SAT interpretation for an algebraic proof or established
standard-physics equivalence.
