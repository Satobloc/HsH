# Archive Tool Priority Protocol — 2026-10-23

**Status:** active routing guide; not theory authority.  
**Purpose:** answer "which archive tool do I use first?" across the SAT/H(s)H repository system without duplicating technical manuals.

## Core principle

Use the **broadest appropriate search surface first**, then move inward toward exact primary sources.

Default order for archive/provenance work:

**Mersearch (or a purpose-built Mersearch derivative) → repository/router index → primary source or canonical extracted text → exact local context → chronology/provenance check → status/authority check → durable note or calculation**

Do not infer absence from one tool, one index, one repository, one keyword, or one failed reader.

---

## 1. Cross-archive default: Mersearch is the standing primary search system

For archive search of any substantive kind, **Mersearch is the standing primary search system**. Use Mersearch itself by default, or a clearly identified derivative/modification of Mersearch when a specialized corpus or search behavior requires it. Other indexes and viewers are routing, chronology, accessibility, or context tools, not competing primary search engines.

Search all three permitted repositories together by default:
1. `SAT_THEORY_ARCHIVE_2023-25`
2. `HsH`
3. `HSH_RESOURCES`

Use Mersearch especially for:
- terminology drift;
- old names for current concepts;
- equations in prior conversations;
- source ancestry;
- "did we already do this?";
- first/earlier appearances;
- conceptual variants;
- deliberately divergent searches.

Protocol:
- search modern term;
- search older synonym;
- search descriptive phrase;
- search neighboring/opposite framing;
- search likely date bands / conversation families;
- inspect the original matched source.

Mersearch results are **navigation evidence**, not theory authority or proof of absence. If coverage is partial, say so.

---

### Text-extraction preference

Search should normally operate over the existing text-accessible corpus rather than forcing direct binary reads. Across the big three repositories, prefer:
- native text when present;
- canonical extracted text for PDFs/binaries;
- OCR-derived text only when native extraction is unavailable;
- direct binary/page inspection when exact layout, equations, figures, or extraction quality require it.

Before creating a new extraction, check the existing extraction manifest/index. The HSH_RESOURCES toolkit corpus already has extensive text extraction, including verified extracted-text matches for all 121 SAT26 toolkit-manifest source PDFs.

## 2. HsH: current-development archive

### Priority surfaces

**First:** current control/front door
- `BEDROCK.md`
- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`
- `CURRENT_WORKFLOW_ORIENTATION_V2.md`

**Then, for archive navigation:**
- Mersearch
- `indexes/FEDERATED_ARCHIVE_MAP.md`
- `indexes/STRUCTURAL_INDEX.md`
- `indexes/CONVERSATION_CHRONOLOGY.md`
- `indexes/LIVE_CONVERSATION_CHRONOLOGY.md`
- Conversation Viewer
- `synthesis/SURVEYED_SOURCES.md`
- worker checkpoints/handoffs only as secondary pointers

### Tool priority logic

Use **Conversation Viewer** when the problem is:
- which conversation?
- what date?
- what raw path?
- what message neighborhood?
- what was said before/after?

Use **Mersearch** when the problem is:
- where in conversation bodies or files does this concept/equation appear?
- what synonyms/precursors exist?
- what prior calculations exist?

Use **chronology/indexes** when the problem is:
- broad sequence;
- coverage;
- exact source family;
- navigation to raw records.

Use **raw conversation/source exports** for final evidence. Viewer/manifests/indexes do not substitute for original message context.

Use **commit history/diffs** when:
- current versus prior file state matters;
- a correction/supersession date matters;
- a file moved/changed;
- chronology cannot be established from content alone.

### HsH caution

`WORKSPACES/`, Labs, Field Notes, Q&A, handoffs, and Common are working records. They are excellent pointers and method records, but do not become theory authority by location.

---

## 3. SAT_THEORY_ARCHIVE_2023-25: historical/development archive

### Start with signage, not brute-force search

Read/use:
1. root `README.md`
2. `.[⚙️_AI_FILES]/🪧_WAYFINDING.txt`
3. `ORIENTATION.txt`
4. `INSTITUTIONAL_MAP.txt`
5. `RESOURCES.txt`
6. Nathan Dashboard archive/derivation maps when relevant

Working sequence:

**Observe → Catalog → Contextualize → Evaluate**

### Structural tools first when location is unknown

Use:
- `..findex.txt` for "what exists?"
- Dashboard `🗄️_ARCHIVE_INDEX.txt` for human-facing structure/history routing
- `..folder_summary.txt` for folder meaning
- `..Derivation_Index.md` for likely derivation/provenance pathways

Rules:
- **index first, tag second**;
- structural indexes say what exists, not what it means;
- folder summaries are wayfinding, not global authority;
- Derivation Index is a map, not a proof.

### Deep recovery

Use:
- Mersearch across all repos;
- raw source files;
- NLM / numbered archive folders;
- BigBook/index surfaces;
- old conversations;
- historical instance records;
- commit history where needed.

When a file appears blank/zero-length, **suspect large-file retrieval failure before emptiness**. Verify blob/metadata or alternate retrieval.

### Archive Admin / machinery

Use Archive Admin and repo-side tools for **bounded archive operations**, not as a substitute for research judgment.

Prioritize existing tooling before creating new machinery:
- indexers;
- extractors;
- logs;
- request/config surfaces;
- staging;
- historical index shards.

Check logs before declaring a tool/workflow failed.

---

## 4. HSH_RESOURCES: literature, reference, data, extraction

### First tool: human-readable index

Start with:
- `!_HSH_RESOURCES_INDEX.md`
- then folder / subject / author / date views

Do **not** brute-force the whole resource tree first.

### If the question is "can we read this?"

Use the accessibility/extraction layer:
- structural resource index;
- extraction manifests;
- derived PDF text;
- OCR-derived text;
- accessibility audit.

Rule:
**locatable ≠ text-accessible**.

A path in the structural index proves inventory, not readable content.

### If the question is "what literature/tool solves this problem?"

Use:
- `H(s)H_Toolkit` indexes;
- toolkit digestion functional families;
- toolkit cards;
- toolbox/toolkit router;
- exact extracted source text.

### If the question is empirical/data

Use:
- `DATA/`;
- normalized analytics where available;
- source artifact first;
- derived tables/databases second.

If data are absent, escalate the missing-data need rather than guessing.

### If the question is citation

Use:
- `indexes/HUMAN_BIBLIOGRAPHY.md`
- HsH `ledgers/CITATION_LEDGER.md`

Protocol:
**claim → citation need → candidate source → inspect source → exact page/section → verify support → place citation**

Keyword similarity never completes this chain.

### HSH_RESOURCES authority boundary

This repository is **supporting-resource infrastructure**, not theory authority.

For public work, carry external evidence out as:
- original-source citation;
- attributed extract/quotation;
- sourced summary/paraphrase.

Do not make public HsH/archive claims depend on private HSH_RESOURCES links.

---

## 5. FACTORY_FLOOR

Treat Factory Floor as a **workflow/circulation router**, not a source archive.

Use it to answer:
- what needs repair?
- what is in intake?
- what is being processed?
- what is live but noncanonical?
- what durable artifact exists?
- what is queued for website/Nathan review?

Do not use Factory Floor state as evidence that a theory proposition is true/current.

When an archive result becomes reusable work:
**source/provenance → workshop/repair → status labeling → artifact → presentation gate**

---

## 6. SANDBOX

Use Sandbox for:
- dormant experiments;
- scripts;
- analytics;
- prototype machinery;
- half-built tools;
- private testing.

Protocol:
- inspect only when task-relevant;
- sandbox presence does not imply adoption;
- preserve private/public boundaries;
- do not use unrelated private material as theory evidence;
- promote only through explicit current project gates.

---

## 7. Cross-repository protocol by question type

### "Did we already do this?"
1. Mersearch all three permitted repos.
2. Search synonyms / older terminology.
3. Check HsH current workspaces/handoffs.
4. Check historical archive Derivation Index / BigBook / old conversations.
5. Read original source.
6. Distinguish same idea, precursor, analogy, and exact derivation.

### "Where did this idea first appear?"
1. Mersearch broadly.
2. Conversation chronology / Viewer.
3. Original structured timestamps.
4. Historical archive files / commit evidence.
5. Report separately:
   - earliest attested;
   - earliest estimated;
   - earliest archived.

### "What does Nathan actually say?"
1. Nathan-source / raw conversation search.
2. Original message context.
3. Later corrections/supersessions.
4. Verified-words/provenance surfaces as secondary aids.
5. Do not treat `role=user` alone as authorship proof in malformed exports.

### "What equation/tool should we use?"
1. Define the typed mathematical problem.
2. Check toolbox/toolkit router and namespace ledger.
3. Search project precedent with Mersearch.
4. Inspect source mathematics in HSH_RESOURCES.
5. Test against a current explicit fixture.
6. Adopt/adapt/defer only after the test.

### "Is this current theory?"
1. BEDROCK.
2. Newer Nathan Direct.
3. current status/control docs.
4. historical source only for ancestry.
5. worker/lab/sandbox material remains typed as such.

### "Is this source missing?"
1. structural index / metadata.
2. alternate retrieval / direct blob if large.
3. extraction/OCR manifest for binary material.
4. search duplicates/supersets.
5. only then mark missing/unavailable.

---

## 8. Universal archive rules

1. **Broad search before novelty/absence claims.**
2. **Original source over summaries.**
3. **Index is a map, not evidence of content.**
4. **Search silence is not absence.**
5. **Large blank-looking files may be huge.**
6. **Record full / partial / sampled / index-only / unavailable.**
7. **Preserve exact path, date, authorship/status, and source identity.**
8. **Do not silently modernize historical terminology.**
9. **Internal provenance and external citation are different relationships.**
10. **Historical placement does not create current authority.**
11. **Use existing machinery before building a duplicate tool.**
12. **When a useful finding matters, leave a durable pointer/result for the next worker.**

## 9. Default Janus archive stack

For most archive-heavy work:

**BEDROCK/current controls → Mersearch all three roots → federated/router index → original source → Viewer/chronology if conversational → commit/history if temporal ambiguity → toolbox/resource index if external math is needed → status/provenance audit → durable Janus/Common note.**

This is the priority spine. Other archive tools are selected because the question requires them, not because they exist.
