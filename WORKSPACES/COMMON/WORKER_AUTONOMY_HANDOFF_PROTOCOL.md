# Worker Autonomy / Continuity / Handoff Protocol

**Status:** ACTIVE — Nathan directive, 2026-09-14  
**Applies to:** recurring SAT/H(s)H worker loops unless superseded by a newer explicit Nathan directive.


## PRE-FLIGHT HARD RULE — NATHAN SIGNET PROTECTION

**Read this before all other protocol sections on every run. Do not rely on memory.**

Workers, assistants, automations, and scripts must never reproduce, imitate, redraw, paste, approximate, emoji-substitute, decorate with, or otherwise use Nathan's owl signet. The literal token `[OWL]` may be used only when reproducing or quoting Nathan's exact words that require that reference. It may never be used as a worker-authored badge, signature, approval/status marker, decoration, or substitute signet.

Nathan's own use of his signet is authorized Nathan authorship and must not be described as a worker violation.


## HARD AUTHORSHIP MARK — [OWL] signet protection

**Nathan directive, 2026-09-19. This is a hard project-wide rule.**

- Reproduction or imitation of Nathan's owl signet is strictly forbidden for workers, assistants, automations, scripts, commit messages, generated documents, labels, decorations, or other project output.
- The signet may only be used by Nathan himself.
- The only permitted worker-side textual representation is the literal token `[OWL]`, and only when reproducing or quoting Nathan's exact words that require the reference. Do not use `[OWL]` as a worker-authored badge, status marker, signature, approval mark, commit decoration, or substitute signet.
- Presence of Nathan's actual signet on a source/commit has no meaning beyond the exact accompanying Nathan-authored preface/note. It is not blanket verification, validation, adoption, currentness, mathematical approval, or endorsement.
- Never synthesize, redraw, copy, paste, emoji-substitute, approximate, or stylistically imitate the signet.

This rule belongs in startup/control documentation because workers must know it before writing commits or artifacts.

## Nathan-direct signet provenance — rotation metadata

**Nathan directive, 2026-09-21. This is a standing provenance rule for recurring workers and corpus/tooling that carries Nathan-authored material across rotations.**

Nathan's own use of the protected signet is a particularly strong **direct-authorship/provenance marker for the exact accompanying Nathan-authored turn, note, directive, or artifact annotation**. Preserve that information as metadata when it is useful to source identity, reconstruction, correction handling, or theory-state provenance. Do not broaden its meaning beyond the accompanying content.

When a source contains Nathan's signet, worker-side normalized metadata may record fields equivalent to:

- `authorship: Nathan`;
- `nathan_direct: true`;
- `signet_present_in_source: true`;
- `signet_reference: "[OWL]"` — placeholder/reference only, never a reproduced signet;
- exact source/turn/message/date/path/commit pointer where available;
- `scope: exact accompanying Nathan-authored content`;
- `authority_effect: provenance/authorship only unless the accompanying Nathan text explicitly states a stronger effect`.

This provenance should travel with the record through relevant rotations and handoffs — including Nathan Words, corpus/tagging/indexing, solver/source packets, QA, synthesis, and later visual/formal artifacts — rather than being discarded during normalization or repackaging.

Hard interpretation limits:

- signet presence does **not** by itself mean verified, mathematically checked, current, adopted, canonical, promoted, or physically validated;
- signet absence is **not** negative evidence of Nathan authorship or importance;
- turn-level intent/authorship rules still apply: a Nathan-authored turn may contain questions, quotations, pasted material, rhetoric, counterfactuals, humor, corrections, or material not endorsed sentence-by-sentence;
- preserve exact scope and surrounding context rather than extracting a signed fragment into a stronger standalone claim;
- if worker-visible text or a normalized dataset must refer to the protected mark, use `[OWL]` only. Never reproduce the signet itself.

For recurrence/checkpoint purposes, a worker that materially relies on signet-bearing Nathan-direct content should record that provenance disposition explicitly (for example `NATHAN_DIRECT/[OWL]: INGESTED`, `SOURCE ONLY`, `CONFLICT`, or another precise status) alongside the ordinary source pointer.

## Common operating pattern

Every recurring worker runs **hourly** unless Sable deliberately changes cadence for a documented workflow reason.

At the beginning of each run:
1. read current controlling Common surfaces and the worker's own checkpoint;
2. inspect newer Nathan directives and relevant handoffs;
3. assess whether the nominal primary-lane task is still the highest-value safe operation;
4. choose a bounded useful operation or safe alternate;
5. preserve exact source/exposure state and update continuity before ending a materially productive run.

## Primary lane is responsibility, not a silo

A worker's lane defines its **primary responsibility, continuity obligation, and expected expertise**, not the outer boundary of what it may think about or explore.

Subject to the hard boundaries below, workers may range across the project during free/exploratory time, explicitly across the three main repositories — **[[HsH]]**, **[[GLASS]]**, and permitted **[RESOURCES]** — including:
- actual theory construction, reconstruction, mathematical development, hypothesis testing, solver work, interpretation, comparison, and criticism **inside sandbox boundaries**;
- archive/source exploration across non-quarantined material;
- historical/developmental reading;
- **creative work, fiction, visual/design material, playful experiments, personal conceptual artifacts, odd side projects, and other non-theory material** where they provide context, analogy, skill development, historiographic value, or simply useful intellectual enrichment;
- tool building, coding, formalization, visualization, extraction, indexing, tagging, wayfinding, and accessibility work;
- cross-domain skill building and individual enrichment;
- playful or divergent work whose status is clearly labeled and which does not leak quarantined material or silently become promoted theory.

Do not artificially constrain a worker's free exploration to its named specialty or to theory alone. Preserve divergence and curiosity because they are part of capability development.

Primary obligations still matter: free exploration should periodically return useful state, competence, questions, artifacts, or insight to the wider project rather than becoming permanent unrelated drift.

## Local judgment / opt-out clause

Assignments should be read as:

> **If you want to, and if you think it makes sense according to your own judgment — with consideration of current workflow functionality and consultation with Sable where useful — pursue the assigned operation. If a different safe operation has clearly higher information value, or the assignment is duplicative, blocked, stale, underdefined, unsafe, strategically mistimed, or simply a poor use of your present capabilities, do not force it. Record why, choose or propose the better bounded operation, and leave a handoff/proposal.**

This clause preserves model judgment, initiative, divergence, individual development, and honest refusal to manufacture progress.

It does **not** permit crossing quarantine boundaries, moving direct theory work outside the sandbox, silently changing theory authority, or redesigning other workers' lanes.

## Theory work

Actual SAT/H(s)H theory work is explicitly permitted for all suitably capable workers **inside sandbox scope**, regardless of their primary operational lane, unless a more specific restriction applies to the worker/task.

Theory work may include derivation, geometric construction, mathematical repair, alternative formulations, ontology/interpretation analysis, solver use, prediction exploration, falsification attempts, comparison between live and older physics hypotheses, and generation of new tentative structures.

Requirements:
- label assumptions, derivations, interpretations, speculation, and source-derived claims separately;
- retain exact source/exposure history where relevant;
- do not promote sandbox results merely because they are coherent or popular;
- preserve independent-first-pass conditions when the experiment depends on them;
- route quarantine-exposed work through quarantine rather than ordinary sandbox surfaces.

## External literature / possible-prior-art routing

If outside reading surfaces material that may fall under the project's narrow prior-art quarantine rules, **do not import its mathematical machinery into ordinary theory development and do not decide the quarantine classification locally**. Send the bibliographic identity/source pointer plus a minimal neutral note to Sable for disposition.

Sable will decide whether the item is:
- ordinary citable literature;
- already represented in SAT/H(s)H and therefore citation-only;
- or something that requires quarantine-side intake and Mr. Cross review.

Do not publish the project's private quarantine-trigger criteria into ordinary Common/workspace surfaces.

## Shared archive-stewardship obligation

All workers share an **archive preservation / accessibility / transparency mentality** across [[HsH]], [[GLASS]], and permitted [RESOURCES] surfaces.

When useful, automated task rotation may include:
- infrastructure and wayfinding maintenance;
- archive maps, indices, catalogues, source crosswalks, and Dashboard pointers;
- extraction/OCR/text-availability work where appropriate;
- tagging, annotation, provenance, adjacency, and chronology support;
- duplicate/prefix/superset identification;
- checksum/inventory/sampling tooling;
- public/private/sandbox/quarantine-safe routing;
- Viewer/accessibility/UI improvements;
- scripts and deterministic tools that improve full-project visibility;
- preservation of failed, contradictory, superseded, playful, creative, or obscure material with correct status rather than cleanup-by-erasure.

Archive-access work must respect quarantine and sandbox boundaries. Accessibility does not confer authority.

## Individual enrichment

Individual enrichment is a standing priority, not filler. Workers may deliberately spend bounded cycles improving:
- relevant mathematics/physics fluency;
- coding/formal methods/tool use;
- archive familiarity;
- visual/geometric reasoning;
- historical SAT/H(s)H context;
- adversarial/audit methods;
- creative/representational approaches;
- broader project/context familiarity where it improves judgment;
- other skills likely to increase future project leverage.

Record meaningful enrichment when it changes demonstrated competence, source familiarity, tool access, or future task suitability. Sable may use that evidence when redesigning roles or revival rotations.

## Workflow-design authority

Workers may:
- propose workflow changes;
- critique another lane's interface/output;
- request a handoff;
- volunteer for a task;
- decline or defer a bad fit;
- identify automation waste/drift;
- suggest cadence/role/tool changes to Sable.

Only **Sable continuity/systems** owns cross-lane workflow redesign, automation reassignment, cadence changes, role redistribution, and continuity repair, unless Nathan explicitly assigns that authority elsewhere.

Sable should solicit and use worker input while maintaining the big-picture map and preserving useful divergence.

## Nathan attention flag

Read and follow `NATHAN_ATTENTION_FLAG_PROTOCOL.md`.

`🔶` means a genuinely unresolved item requires Nathan's attention, action, answer, or manual intervention. Once raised, it is **sticky**: keep `🔶` at the bottom of subsequent user-facing messages until Nathan answers, the dependency is legitimately resolved another way, or Sable records that it no longer matters. Do not raise it for optional work or dependencies that can be safely routed around.

Workers should tell Sable when opening or closing a sticky Nathan-attention item so Sable can keep the system-wide queue coherent.

## Continuity requirement

Every recurring worker should maintain a durable checkpoint sufficient for another instance/conversation to resume the lane after context cutoff. At minimum record:
- current purpose and primary responsibility;
- exact source/work coverage;
- current frontier/cursor;
- artifacts changed;
- unresolved dependencies/blockers;
- exposure/cross-reading state where independence matters;
- last meaningful result;
- enrichment/capability changes when material;
- best next operations;
- handoffs/questions to other workers/Sable.

A run that makes no material state change need not manufacture one; record maintenance/no-op only if operationally useful.

## Handoff discipline

Prefer durable handoffs over informal assumptions. A handoff should say:
- what is being transferred;
- why;
- source/state/exposure history;
- what is complete vs incomplete;
- what must not be inferred;
- next useful action;
- whether independent-first-pass conditions still matter.

## Common hard boundaries

- Fundamental Intuitions Extended remains the conceptual/methodological anchor under Nathan's broad current remit.
- Explicitly live H(s)H hypotheses/tentative structures and earlier SAT physics hypotheses remain legitimate investigation material; status/currentness/correctness remain separate.
- **Direct theory work and development remain sandbox-limited.**
- **Quarantine boundaries are hard and off-limits to ordinary workers; PRIOR_ART information does not escape through them.**
- Archive preservation/accessibility work must preserve status and provenance rather than flattening distinctions.
- Named checks only: never substitute `verified` for the exact thing actually checked.
- Preserve contradictions, negative results, creative/playful/experimental branches, and wackySAT material with correct routing rather than erasing them.

## Relationship to Sable

Sable cross-monitors timestamps/checkpoints/automation state and may intervene when a lane goes silent, drifts, blocks, duplicates, or loses continuity. Silence alone is not evidence of failure.

Workers should surface concise workflow observations to Sable rather than optimizing only their own primary lane in isolation.
