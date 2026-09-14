# `GLOSSARY (LIVE).txt` — intrinsic provenance fingerprint

**Date:** 2026-09-14  
**Lane:** Mercer — source/retrieval QA  
**Epistemic type:** provenance/format analysis only; not a theory-definition surface  
**Target:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/Early SAT/GLOSSARY (LIVE).txt`

## Purpose

Run 22 tested whether the artifact itself, its neighboring directory structure, or its repository-ingest cohort supplies a sufficiently discriminating source/tool/origin clue to justify another bounded raw-conversation ancestry search.

This pass deliberately does **not** reconcile or endorse the glossary's theory-bearing definitions.

## Direct artifact observations

The current blob is `aaf4a51228865fe9d05066a20e6daf2d18f8deb8`, 1,896 bytes.

Intrinsic form:

- begins with a blank line;
- CRLF line endings are visible through the repository content response;
- consists of a standalone LaTeX fragment rather than a complete `.tex` document;
- opens with `\section{LIVE GLOSSARY -- ACTIVE}` and then `\section*{Glossary of Terms and Symbols}`;
- uses one `\begin{description}` / `\end{description}` block;
- entries are consistently represented as `\item[...]` definitions with inline/display math;
- contains no LaTeX preamble, `\documentclass`, bibliography, footer, file metadata, author line, date line, conversation ID, message ID, citation scaffolding, source numbering, UI residue, assistant salutation, or user/assistant speaker markers;
- contains no explicit statement describing who created the file or what tool produced it.

### What the form supports

The file is best treated as a **prepared glossary fragment**, not as a raw chat transcript or self-documenting source record.

Its clean LaTeX formatting is compatible with several origin routes: manually authored LaTeX, text copied out of an assistant response, or a deliberately cleaned/generated intermediate artifact. The intrinsic form does **not** discriminate among those routes.

Therefore the formatting alone does not support promotion to `Nathan Direct`, `AI-generated`, or any more specific author/tool class.

## Neighboring-directory observations

The `2026/Early SAT/` directory is heterogeneous rather than a single-format artifact family. The same directory contains:

- large dialogue/research-like text exports (`EARLIEST AI DISCUSSIONS.txt`, `BRAIN OPACITY.txt`, `CONSCI.txt`);
- prose/reaction material (`A reaction.txt`, `Critique response.txt`);
- compiled/source-numbered research synthesis (`Cronin Levin SAT.txt`);
- instruction/assembly material (`INCORPORATION.txt`);
- broad SAT overview material;
- the compact standalone glossary fragment.

Two neighboring filenames, `SAT & String Theory.txt` and `SAT Overview .txt`, currently point to the same blob SHA, demonstrating that the directory also contains archive-level duplication/renaming behavior. Directory adjacency is therefore weak provenance evidence.

The glossary's unusually small, self-contained LaTeX form is not enough to place it in a single identifiable neighboring-file production workflow.

## Ingest-cohort observations

The exact path was introduced in commit `f25c2b8a63eca815cce863bbe859f104983fedd5` on 2026-06-01 with generic message `Add files via upload`.

That commit adds 37,337 lines across a broad mixed archive cohort. Its visible file list includes highly heterogeneous materials, including directly Nathan-signed prose and large compiled/archive documents. The cohort therefore establishes repository custody/intentional inclusion, but **not** a common content author, common tool, or common creation date.

No glossary-specific commit message or edit history was found.

## Indexed uniqueness check

A repository code-search query for the literal heading `LIVE GLOSSARY -- ACTIVE` returned no indexed match. A separate query using the glossary's `theta_4` / `Diagnostic only` phrasing also returned no indexed match.

Because GitHub code-search coverage has already shown limitations in this archive, these are retrieval negatives only. They do not establish uniqueness in the corpus and should not trigger another broad phrase-search cycle.

## Provenance classification after intrinsic pass

**Repository custody:** established.  
**Historical placement:** `2026/Early SAT/`, established as archive organization.  
**Artifact form:** prepared standalone LaTeX glossary fragment.  
**Content author:** unresolved.  
**Creation tool:** unresolved.  
**Original creation date:** unresolved.  
**Raw conversation ancestry:** unresolved.  
**Currentness/authority:** unresolved; `LIVE` / `ACTIVE` remain historical labels only.

## Retrieval consequence

This pass did **not** produce a defensible new source/time/tool anchor for raw-message extraction. Per the Mercer checkpoint rule, do not widen speculative candidate scanning from this artifact fingerprint.

The negative is still useful: future retrieval can exclude the following as sufficient ancestry evidence by themselves:

1. clean LaTeX formatting;
2. same `Early SAT` directory membership;
3. membership in the June 1 bulk-upload cohort;
4. `LIVE` / `ACTIVE` labeling;
5. a GitHub code-search miss.

A future ancestry claim should require at least one stronger link: an exact artifact paste, explicit glossary-generation instruction, matching distinctive body text in a raw conversation, an original file with embedded source metadata, or another independently attributable source relation.

## Next safe Mercer branch

Because intrinsic fingerprinting yielded no discriminating ancestry anchor, Mercer should branch away from glossary candidate churn. Highest-value safe alternatives remain retrieval/navigation QA and provenance bookkeeping that do not require theory interpretation. A particularly useful cleanup is to reconcile stale documentation references that still point to the superseded Viewer catalog path `CONVERSATION_VIEWER/catalog/conversations.json` rather than the verified current path `CONVERSATION_VIEWER/data/conversations.json` when those documents can be safely edited without overwriting concurrent work.
