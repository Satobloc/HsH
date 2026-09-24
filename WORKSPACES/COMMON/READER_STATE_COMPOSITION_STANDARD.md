# Reader-State Composition Standard — 2026-09-24

**Status:** CURRENT / Nathan directive
**Applies to:** all project writing except purely personal writing where a different standard is explicitly chosen.

## Principle

Writing should be designed through the minds of one or more imagined readers.

At every meaningful transition, ask:

- Where is this reader's head right now?
- What do they currently believe, expect, misunderstand, fear, hope, or not yet know?
- What range of reactions is plausible here?
- What should be established now so that a later idea lands in the intended way?
- Will this sentence/equation/figure make the right question appear before the answer arrives?
- If the reader is skeptical, rushed, expert, novice, hostile, curious, tired, or delighted, what changes?
- What false path or ambiguity should be allowed to exist briefly because resolving it later will clarify the structure?

This applies to academic papers, derivations, reviews, documentation, code comments, public pages, talks, explanations, instructions, and most other outward-facing project writing.

## Narrative is not decoration

`Narrative` here means the controlled sequence of information, expectation, dependency, surprise, memory, tension, release, and conceptual state over time. A technical derivation has narrative whether or not it is written like a story.

A derivation should therefore be assessed partly for pacing:
- are assumptions introduced before they silently do work?
- does notation accumulate faster than meaning?
- does the reader know why a step matters before the next step depends on it?
- are alternatives eliminated at the right time?
- does the proof/derivation create the right missing question before answering it?
- is the conceptual payoff located close enough to the machinery that earned it?

Narrative pacing can expose epistemic defects, not merely stylistic ones.

## Multiple-reader simulation

When stakes or audience breadth justify it, simulate several readers rather than one:
- expert physicist;
- mathematician from a neighboring field;
- skeptical referee;
- intelligent non-specialist;
- collaborator who knows the archive but not this branch;
- future maintainer;
- hostile/misreading reader;
- reader encountering one excerpt without surrounding context.

The goal is not to satisfy everyone equally. It is to know whose mind the writing is moving at each stage and what tradeoffs are being made.

## Joke-making as technical training

Learning to make up and tell jokes is useful training for technical writing and scientific reasoning because jokes make several mechanisms unusually visible:
- setup;
- expectation formation;
- compression;
- timing;
- misdirection;
- creation of a gap;
- reversal;
- payoff;
- memory reinforcement.

A good technical explanation often needs an analogous structure: arrange the reader's expectations so that a result resolves a live gap rather than arriving as inert information.

This does not mean technical writing should constantly be funny. It means joke construction can train control over reader state.

## Peer review transfer

Peer review should ask not only whether claims are correct, but whether the paper is placing the reader in the right cognitive state to inspect those claims.

Questions may include:
- where does the reviewer first become lost?
- where does the paper accidentally invite the wrong inference?
- what result arrives before its motivation?
- what premise is too well hidden?
- what suspense is useful and what suspense is merely withholding?
- what should be moved earlier/later so the argument becomes easier to audit?

The random-comparator peer-review standard may deliberately import reader-state questions from fiction, comedy, code, visual design, rhetoric, or other artifacts when useful.

## Scientific use

The same discipline can improve science itself. A theorist is also the first reader of their own derivation. If the setup makes one result feel inevitable too early, that may reveal confirmation bias. If an unexpected result creates a clean conceptual gap, preserving that surprise can make hidden assumptions easier to notice.

Use narrative awareness to expose reasoning structure, not to make weak science persuasive.
