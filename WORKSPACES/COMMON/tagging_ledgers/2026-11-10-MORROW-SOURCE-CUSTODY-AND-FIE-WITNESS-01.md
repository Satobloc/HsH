# Morrow h720:s4 source-custody addendum: FIE extension C–E parallel transcript witness

**Status:** ADDITIVE / TEXTUAL CORRESPONDENCE VERIFIED / AUTHORSHIP, CHRONOLOGY AND DERIVATION UNRESOLVED  
**Scope:** archive/source custody only. This record does not integrate theory, validate a physical claim, advance a paper gate, or promote material into BEDROCK.  
**Run label:** h720:s4 / Morrow. The deterministic label does not authenticate a ChatGPT instance or thread.

## 1. Morrow role and boundary sources

The historical Morrow conversation is `6a9ee7ca-d340-83ea-b99d-6a3097429f36`.

Two raw snapshots were checked:

- Earlier 465-node snapshot: blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`.
- Later 697-node snapshot: blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`.

They are snapshots of the same conversation, not independent witnesses. The later snapshot contains additional messages absent from the 465-node snapshot.

Relevant user-role messages in the 697-node snapshot:

| Message ID | UTC timestamp | Source status | Function |
|---|---|---|---|
| `402ade01-7116-4efb-9b14-31e477754458` | 2026-09-08T03:25:36.187Z | `author.role=user`; `author.name=null` | Team Archivist assignment; already tagged by the two 2026-10-30 Morrow role-correction ledgers. No duplicate role tag added here. |
| `934e87de-4e61-4622-a0ea-e5047aa235c6` | 2026-09-12T09:31:10.939Z | `author.role=user`; `author.name=null` | Explicit instruction to stop theory work and quarantine prior unique artifacts. |
| `99ae959b-fbeb-4c1e-9326-a6723c2b9557` | 2026-09-13T00:51:22.757Z | `author.role=user`; `author.name=null` | Later archive/trial scope: archive maintenance, contextual recovery, provenance, source comparison, theory-material reading and note-taking, mathematical/equation checking, historical reconstruction, interpretation testing and constructive critique; previously quarantined material may be examined through the Clearinghouse while retaining provenance and non-authoritative status. |

The later trial message does not explicitly rescind the earlier theory-stop instruction. The conservative current Morrow workspace interpretation remains archive/source-custody work only: no theory integration, physical prediction or paper work. That boundary is an assistant-maintained interpretation of the two user-role messages, not a verbatim sentence in the trial prompt. It is Morrow-specific and does not transfer to Kestrel or any other worker label.

**Additive tags for newly read Morrow messages**

- Conversation: `CONV:SAT-HSH`, `CONV:PROVENANCE-HISTORY`.
- Stop message `934e...`: `ADJ:ROLE-PROVENANCE`, `MSG:COUNTERMANDING`, `MSG:QUARANTINE`, `WINNOW:A-ADJACENCY`.
- Trial message `99ae...`: `ADJ:ROLE-PROVENANCE`, `MSG:ARCHIVE-TRIAL`, `MSG:SOURCE-COMPARISON`, `MSG:PROVENANCE-HISTORY`, `WINNOW:A-ADJACENCY`.

The already-tagged Team Archivist assignment remains covered by:

- `WORKSPACES/COMMON/tagging_ledgers/2026-10-30-MORROW-TEAM-ARCHIVIST-QUOTE-CORRECTION-01.md`
- `WORKSPACES/COMMON/tagging_ledgers/2026-10-30-MORROW-ROLE-SOURCE-ID-CORRECTION-01.md`

No authenticated current Morrow thread was found. The archived conversation is a historical source, not a live delivery destination. A newer Morrow/Kestrel Free Quarry title is remembered, but no conversation ID or current activity was verified.

## 2. FIE source genealogy: original message versus later extensions

### Original raw user-role message

- Conversation: `6902f3c2-ee54-832b-8c70-b5a6fd900798`, title `Fundamental Intuitions of SAT`.
- Raw export blob: `0a7a270482bdda92a61d1c54ccccaf356e47aa0b`.
- Message: `f476afce-eba0-4312-8c2b-36b82dbe7f3f`.
- Timestamp: 2025-10-30T05:12:46.507Z.
- Outer role: `user`; `author.name=null`.
- Body length: 9,796 JavaScript string code units.

Direct inspection finds the base FIE text and Extensions A/B in this message. It does **not** contain Extension C, Extension D, Extension E, CENTRAL DOGMA or the Tentative section.

A later user-role clarification in the same raw export is message `12bcc510-0d8d-4a25-8e08-fe11a995c6eb`, timestamp 2025-10-30T05:21:11.993Z, 551 code units. It refines the wording of Extension B; it does not add C–E or CENTRAL DOGMA.

The raw message's user role establishes the message speaker under the archive convention. It does not, by itself, establish the authorship of every embedded document later compiled from the material.

### Extended PDF and extracted text

The existing Aldus FIE rereview records:

- PDF self-date: 2025-02-02.
- Recorded update date: 2026-02-26.
- Six pages; 12,358 extracted characters; 197 lines; no OCR.
- Recorded source-PDF SHA-256: `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`.
- Extracted-text blob: `9b94093053f28be8bf64ee227d3382d2296f63ea`.

The PDF contains Extensions C, D and E, CENTRAL DOGMA and a Tentative section. The PDF byte stream was not rehashed in this run; the PDF SHA above is the value recorded in Aldus's existing source review.

### Candidate parallel text witness in the SAT archive

- `2026/SAT++.txt`: blob `5c4e20eb52043b655eb81496962133e0ffe33f04`; 7,433 lines; 339,580 characters.
- `2026/SAT STORY.txt`: the **same Git blob SHA** `5c4e20eb52043b655eb81496962133e0ffe33f04`. It is a duplicate path, not a second witness.

Section-by-section comparison against the FIE extracted text, collapsing whitespace only, produced exact normalized matches for:

- Extension C
- Extension D
- Extension E
- CENTRAL DOGMA

The Tentative section is not included in this match claim; its extraction contains a page-marker difference.

The SAT++ file is a plain-text mixed transcript. It has `You said:` markers but no `ChatGPT said:` markers. The matching C–E/CENTRAL DOGMA material sits in an unlabelled span between user-turn markers. No structured raw JSON export, conversation ID, speaker boundary or reliable timestamp for that span was located in this bounded search.

### Provenance conclusion

Classify the SAT++ text as a **parallel textual witness** for the PDF's C–E/CENTRAL DOGMA wording, not as a proven source of the PDF and not as proof of authorship. The direction of copying, chronology and speaker attribution remain unresolved. Do not infer that the material is Nathan-authored, assistant-authored, or independently corroborated. Do not count `SAT STORY.txt` as a second witness.

This is an attribution gap, not evidence that the text is fabricated or that its claims are true. Textual correspondence does not establish mathematical validity, physical equivalence or observational support.

## 3. Additive file/message tags

The following are manual retrieval tags, not truth, confidence or authority scores:

| Source | Tags |
|---|---|
| Raw FIE message `f476...` | `CONV:SAT-HSH`, `ADJ:PROVENANCE-HISTORY`, `MSG:USER-ROLE`, `MSG:FIE-BASE-A-B`, `MSG:SOURCE-BOUNDARY`, `WINNOW:A-ADJACENCY` |
| Clarification `12bcc...` | `CONV:SAT-HSH`, `ADJ:FIE-EXTENSION-B`, `MSG:CLARIFICATION`, `MSG:CORRECTIVE`, `WINNOW:A-ADJACENCY` |
| FIE extracted text blob `9b940...` | `SRC:EXTRACTED-TEXT`, `SRC:FIE-EXTENSIONS-C-E`, `SRC:CENTRAL-DOGMA`, `SRC:PROVENANCE-HISTORY`, `SRC:AUTHORSHIP-UNRESOLVED` |
| SAT++ blob `5c4e...` | `SRC:PARALLEL-TEXT-WITNESS`, `SRC:MIXED-ROLE-PLAIN-TEXT`, `SRC:SOURCE-DIRECTION-UNRESOLVED`, `SRC:AUTHORSHIP-UNRESOLVED`, `SRC:NOT-RAW-JSON` |
| SAT STORY path | `SRC:DUPLICATE-PATH-SAME-BLOB`, `SRC:NOT-INDEPENDENT-WITNESS` |
| Morrow stop `934e...` | `CONV:SAT-HSH`, `ADJ:ROLE-PROVENANCE`, `MSG:COUNTERMANDING`, `MSG:QUARANTINE`, `WINNOW:A-ADJACENCY` |
| Morrow trial `99ae...` | `CONV:SAT-HSH`, `ADJ:ROLE-PROVENANCE`, `MSG:ARCHIVE-TRIAL`, `MSG:SOURCE-COMPARISON`, `MSG:PROVENANCE-HISTORY`, `WINNOW:A-ADJACENCY` |

Tags remain retrieval aids. They do not promote any source into the verified-words compendium or BEDROCK.

## 4. Handling and limits

- Existing Aldus and Aster FIE reviews remain intact; this addendum is additive and does not replace them.
- Aldus's 14-day FIE rereview is already recorded complete; the next review is due 2026-11-24. It was not repeated here.
- Mersearch was not re-requested: all four request lanes were occupied. The existing completed MIND search receipt was treated as navigation only; the FIE source check used bounded GitHub search and direct blob/file comparison.
- No new Lean theorem, Lean build, physical calculation, model trial, human-subject session, paper edit or public issue submission was made.
- No SAT archive source file, PDF, BEDROCK, campaign document or branch graph was changed.
- The private HSH_RESOURCES reading locator is deliberately omitted from this HsH record.
