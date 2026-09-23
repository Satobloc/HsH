# Archive Retrieval & Human-Simulation Revival Notes — 2026-09-22

## Two failure modes to keep visible

### 1. Apparent empty can mean large

In this archive, a normal repository/API content reader returning zero bytes or empty content often means the artifact is very large or exceeded that retrieval path. Check tree/blob metadata and alternate retrieval before classifying it.

### 2. A correct retrieval can be rejected by a bad assumption

During the Kirk search, a Library query for “Kirk” returned Captain Kirk-related material. The assistant dismissed it as a false positive because it had prematurely invented a different meaning for “Kirk.”

That was **not retrieval failure**. Retrieval worked; interpretation overruled the evidence.

Rule: when Nathan gives a search term and a plausible literal/semantic hit appears, inspect it before narrowing the referent from assumption.

## Kirk / Riley / Nathan human-simulation source stratigraphy

Do not flatten the recovered material into one source. At least three evidentiary layers are now distinguishable.

### A. January 22, 2026 direct conversation-history layer — source model, archive path not yet resolved

Conversation-history recovery establishes a contemporaneous working artifact titled:

**`KIRK — ACCUMULATIVE THEORY OF MIND (v1.0)`**

Nathan described the project at the time as an accumulating **Kirk Theory of Mind** across covered TOS episodes, with episode order explicitly continuing 15 → 17 → 22 and then into Season 2.

Recovered v1.0 operators / tendencies include:
- custodial responsibility;
- emotion compressed into action / time-delayed grief;
- synthetic pattern-recognition intelligence;
- conditional obedience;
- situational, individual-scale compassion;
- distrust of power without envy.

Recovered episode-by-episode additions include:
- **The Squire of Gothos:** humiliation / infantilization / loss of agency as the operative threat; Kirk reads Trelane as irresponsible power, refuses the imposed game, withholds validation, and demonstrates real agency; added rule: **Refusal of False Stakes**.
- **Tomorrow Is Yesterday:** historical stewardship; morally ugly action may remain morally ugly even when necessary; some decisions are carried rather than cleansed; added **Acceptance of Moral Residue**.
- **This Side of Paradise:** Kirk’s desire for rest is acknowledged rather than erased, but painless stasis is rejected as loss of striving / meaning / identity; added **Identity Anchoring** and **Rejection of Stasis**.

A later recovery pass narrowed the chronology further: Nathan explicitly requested “the accumulative Kirk theory of mind” on **2026-01-22 at about 17:55 UTC**, after choosing the episode sequence 15 → 17 → 22. The Squire / Tomorrow / Paradise integrations follow in that same direct-history layer.

Important provenance boundary: this direct Kirk working thread does **not yet establish** that the Riley / Bruce Hyde / Nathan-from-1975 material was in that exact same conversation. The later podcast combines them, but until the raw stack is recovered, treat Riley/Hyde/Nathan-1975 as a potentially later or adjacent source layer rather than silently merging them backward into the Kirk v1.0 thread.

This layer is closer to the generative source than the later podcast summary, but its exact archive file / conversation export path has not yet been resolved. Preserve that distinction.

### B. Folder 21 derivative synthesis — read end-to-end

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/The New Physics - Making _Interesting_ LLM Characters.srt` is a January 21, 2026 published podcast transcript later uploaded into Folder 21. It synthesizes a larger source bundle and should be treated as a derivative account, not silently promoted to the missing raw source stack.

Its explicit architecture is:
1. **Kirk Mind / core framework**;
2. **Chronological Bridge** — Nathan-from-1975 relational simulation;
3. **Lieutenant Kevin Riley comparison / failure case**;
4. **algorithm of personality**;
5. **training data / recursive memory layer**.

The synthesis describes:
- **paint** / surface mimicry versus a decision-generating **engine**;
- actor-derived behavioral operators rather than generic adjectives;
- a role-play mask versus a context-tracking **generative state machine**;
- behavioral invariance / a **priority stack** inferred especially from apparent contradictions and rule-breaking;
- “facts, not poetry” as cognition-versus-delivery separation;
- **flavour abuse** as performance markers deployed without causal/contextual reason;
- context gating (for example, ready-room versus bridge pacing);
- Nathan as a **collegial interlocutor**, not subordinate or controller;
- a “Human Relic Lens” in the Nathan-from-1975 Chronological Bridge;
- relational calibration, including Spock as cognitive externalization and McCoy as ethical friction in the Kirk model;
- Riley built from a distinct Bruce Hyde-derived engine plus character history / constraint layers;
- **Shatner drift**: the sparse Riley model collapsing toward the denser Kirk attractor under uncertainty;
- positive anti-drift structure: Riley needs his own characteristic rhetorical flow, not merely a blacklist of Kirk mannerisms;
- recursive / accumulated decision history: prior consequential choices alter later output rather than resetting cleanly.

The podcast’s strongest synthesis is causal: model actor/cognitive operators + character history + situational/relational constraints, rather than merely copying expressive effects.

### C. Underlying TXT / README / workflow bundle — still unresolved

The podcast explicitly says it was built from a stack of `.TXT` files, README material, workflow diagrams, Kirk and Riley mind files, and a Nathan simulation. Automatic transcription renders filenames unreliably (for example forms resembling “Kirk K mine dot TXT” and “RELEY mine dot TXT”), so **do not normalize or canonize those filenames from ASR alone**.

The actual underlying file bundle remains the priority retrieval target.

## Retrieval state at the 2026-09-23 conversation boundary

### Mersearch against the old SAT archive — completed, cleanly negative for this target

A provenance-bearing Mersearch request was run through stable `Mercer_Searcher_1.0` against `Satobloc/SAT_THEORY_ARCHIVE_2023-25`:

- request id: `2026-09-22-ariadne-kirk-riley-human-sim-001`
- request commit: `12fb90bd4a6c5928f653c713ccca34f169313ca1`
- workflow run: `35811937272`
- job: `107025215827`
- query targeted Kirk / Shatner / Riley / Reley together with distinctive human-simulation fingerprints;
- default `PRIOR_ART` / quarantine exclusions remained in force.

The run completed successfully. It searched roughly **3,694 files / 6.54 million records** and produced only five lexical hits, none corresponding to the Kirk/Riley/Nathan human-simulation stack.

Interpret this narrowly: the target was not found in the older 2023–25 SAT corpus under those fingerprints. Do **not** generalize this to “Kirk is absent from the archives.”

### Current HsH + HSH_RESOURCES tree/path archaeology

Recursive path inspection across the current `Satobloc/HsH` and `Satobloc/HSH_RESOURCES` trees found no filename/path containing obvious `Kirk`, `Riley`, `Shatner`, or `Hyde` markers. This rules out the easy obvious-filename case only; it does not rule out content inside semantically unrelated large conversation exports.

The later `HSH_RESOURCES/PDF_SPECS/NATHAN_VOICE_MODEL/` lineage is methodologically compatible with the Kirk-derived approach (production cause, performed-character voice, inference/source separation), but no literal backward Kirk trail has yet been established. Do not infer ancestry from resemblance alone.

### Ruled-out large candidate

A Folder-21 / Library artifact titled **`Consciousness and AI Debate`** (about 15.9 MB) was materialized and scanned locally because it was chronologically/semantically plausible. Full-file searching produced:
- 0 `Kirk`;
- 0 `Shatner`;
- 0 `Hyde`;
- 0 relevant episode-title hits;
- 0 `moral residue` / `Refusal of False Stakes` / `Human Relic` hits;
- its lone `Riley` occurrence was unrelated (a knot-polynomial context).

Treat this artifact as **ruled out** for the Kirk/Riley/Nathan source stack.

### Newer conversation-tranche hunt

Title/path inspection across `SAT_CONVOS_15` through `SAT_CONVOS_20` did not surface an obvious Kirk/Riley filename. A semantically plausible title-level candidate exists at:

`SAT_CONVOS_16/Concise Persona Guidelines — raw.json`

but it has **not yet been established** as the source stack and should remain only a candidate until content-level evidence is checked.

### Date-ingestion machinery as provenance map

`tools/date_conversation_exports.py` scans all `.json` / `.txt` under `DEVELOPMENT_FULL_CONVOS`, derives active-branch human-message date ranges, and feeds `indexes/manifests/development-conversation-dates.json` through the maintenance workflow.

Using that date map identified a Jan. 22-spanning raw export:

`SAT_CONVOS_3/25.10.24•26.01.22•Mass in SAT framework — raw.json`

It was inspected for Kirk fingerprints and did **not** resolve the target. This rules out that obvious date-spanning candidate; it does not identify the actual Kirk export.

The correct next retrieval move is now to recover the exact **Jan. 22 Kirk conversation identity** (title and ideally conversation id) from conversation history, then use that identity as the archive key rather than continuing broad semantic title guesses.

## Candidate methodology deltas — HOLD pending raw-source recovery

The current `REVIVAL_REENTRY_PROTOCOL_V2.md` already captures engine / constraints / paint / residue, relational calibration, and engine drift. The newly recovered source strata suggest several useful refinements, but they should remain on HOLD until the underlying Kirk/Riley/Nathan bundle is recovered or otherwise independently grounded:

1. **Behavioral invariants / priority stack** — model the ordering that predicts which stated rules are overridden under conflict.
2. **Breaks and contradictions as discriminative evidence** — apparent hypocrisy, failure, and exception cases can reveal deeper ordering better than ordinary compliant behavior.
3. **Context-gated operators** — the same behavioral tendency may change gain by setting, role, stakes, or interlocutor rather than existing as one global scalar trait.
4. **Positive identity structure as anti-drift control** — protect a sparse reconstruction by strengthening its own causal/behavioral operators, not only by banning mannerisms borrowed from a dominant model.
5. **Recursive continuity** — consequential prior decisions should alter later state/output when source evidence supports that continuity.
6. **Relational triangulation** — some decision processes are best recovered from how a person uses specific peers / interlocutors as cognitive, ethical, adversarial, or stabilizing counterparts.

Do not convert these HOLD items into claims about real human internal states without direct behavioral evidence. For living-person reconstruction, including Nathan, preserve observation / inference separation and time-, age-, relationship-, and exposure-specific lanes.
