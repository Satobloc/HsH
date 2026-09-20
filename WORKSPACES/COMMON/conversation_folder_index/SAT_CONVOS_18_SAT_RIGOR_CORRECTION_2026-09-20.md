# SAT_CONVOS_18 — SAT RIGOR correction / current cursor

**Date:** 2026-09-20
**Authority:** provenance/routing correction only; not theory authority
**Supersedes for SAT RIGOR:** the stale SAT RIGOR item record in `SAT_CONVOS_18_INDEX_2026-09-19.md`

## Pair identity

`SAT RIGOR__NotebookLM_export.json` and `SAT RIGOR__NotebookLM_export (1).json` are both populated, both `reached_top=true`, share NotebookLM notebook ID `29b0fbe9-21f2-4151-9604-10413e1dc1e9` and a 50-source panel, but have distinct conversation starts and message keys. They are **not** an empty-base → populated-recapture pair and are not established duplicates/prefix-supersets. Preserve both as distinct conversation branches/states under one notebook identity.

Current `(1)` blob: `7c2a17f005218d77f9b7b21824ff3c7be5a68b41`; capture `2026-09-18T19:19:38.650Z`.

## Authorship rule

NotebookLM serializes both human and generated turns as `role=user`, so role alone is unusable for speaker separation. Archived-conversation provenance establishes Nathan as the human conversant. Once a turn is structurally identified as the human-entered side, it is Nathan Direct; embedded pasted/quoted/coauthored material remains a span-level exception. Generated NotebookLM prose must remain separate even when serialized as `role=user`.

## First-principles sequence — current coverage

Aster has source-first speaker-separated the `(1)` branch through message index 43.

High-value progression:

- index 5 / `66de185f`: Nathan refuses to rush into equations/work and insists on first reaching shared conceptual understanding.
- index 11 / `c67c6667`: Nathan asks the model to forget its received SAT summary and reason through the theory from first principles with him.
- indices 13–21: reduced-dimensional Minkowski/worldline grammar: straight line, moving plane, Flatland point, and function↔curve framing.
- index 23 / `7a56b668`: after the model incorrectly forces a choice between function→curve and curve→function, Nathan states: `As pure geometry... the two are indistinguishable, even in principle. They are one in the same.` This contemporaneously resolves index 21 as rhetorical equivalence; Nathan independently certified that intended reading on 2026-09-20.
- indices 25–31: rectilinear tilt, stipulated massive particle, and repeated Nathan corrections against premature model interpretations; Nathan asks for the minimal inventory before assigning causal relationships.
- indices 33–43: Nathan reduces the rectilinear toy system to a single unknown θ once the line+plane primitives and plane motion at c are stipulated. He explicitly warns against metaphor and against the word `stretch`, because it hides process/ontology assumptions. Index 43 opens the acceleration case.

## Generated-prose exclusions already identified

Do **not** promote the following merely because they occur adjacent to Nathan's first-principles discussion:

- generated index 22's claim that SAT chooses curve primacy;
- `Persistence Tax`;
- `Torsion Necessity`;
- mass-as-knot language;
- generated claim that `Mass is a trigonometric identity`;
- generated claim that inertia is geometric stability of θ;
- generated time-dilation/stretch glosses;
- generated `v=ctan(θ)` equation without independent source/mathematical checking.

These may be historically useful model proposals, but are not Nathan Direct in this sequence.

## Methodological significance

The branch is unusually valuable for reconstructing Nathan's reasoning discipline, not just SAT content. Nathan repeatedly blocks the model from importing causal stories, metaphors, or stronger physical interpretations before the geometry has earned them. Especially clear quote-workflow candidates include:

- index 23 equivalence statement;
- index 39 beginning `Let's be careful of metaphors. We want to be wearing our mathematician hats.`;
- index 41 beginning `Now, caution in presuming stretch. That term is hiding assumptions.`

Quote intake should preserve full contiguous Nathan passages first; any editorial truncation is downstream work.

## Current cursor

Continue `(1)` from generated index 44 onward: acceleration case and Nathan's correction/refinement of the model's first treatment.

## Tool/access note

The current GitHub connector can fetch the large blob, but some interfaces truncate or do not line-slice the oversized JSON reliably. Previous direct blob retrieval successfully exposed indices through 43. If a run cannot expose the next message range source-first, do not infer it from memory or generated summaries; switch to another bounded provenance operation and leave this cursor intact.
