# Peer Review Random Comparator Standard — 2026-09-24

**Status:** CURRENT PRACTICE ADDENDUM / Nathan directive
**Purpose:** prevent SAT/H(s)H papers from being judged only against project-internal rubrics by forcing at least one comparison against an independently selected artifact from the wider world of made things.

## Core requirement

Every substantive paper peer-review cycle should include at least one **random comparator artifact** and one explicit question:

> **Is this paper up to stuff compared to this artifact?**

The comparator is not required to be the same genre, field, era, medium, quality level, or epistemic status as the paper. The point is partly to create an alien benchmark that can expose strengths or defects the ordinary paper rubric does not ask about.

## Comparator pool bias

The pool should be broad but not flat.

Default weighting should favor:
1. human-generated academic papers, especially good or excellent ones;
2. strong historical scientific/mathematical texts and lectures;
3. contemporary technical writing, code, diagrams, images, documentation, or talks;
4. science/pop-science writing;
5. fiction, essays, rhetoric, visual work, or other crafted human artifacts;
6. pseudoscience/non-science/poor academic work/human slop;
7. AI-generated slop or polished-but-empty material;
8. gobbledygook, malformed text, broken code, ugly figures, or otherwise apparently bad/incommensurate artifacts.

This weighting is a tendency, not a cage. The comparator may come from the archive, current outside sources, historical material, public web/literature, code repositories, image collections, or other lawful/available sources. Do not make the comparator pool so prestigious that it becomes another closed canon.

Recurring anchor figures such as Einstein, Feynman, Susskind, Greene, and similarly strong communicators/scientists are useful and should be used often, but they must not become the only comparison class.

## Randomness

The artifact should be selected with a genuine random or pseudo-random element from an eligible pool whenever practical. Do not choose the comparator after reading the paper merely because it makes a desired point.

Record:
- selection pool/source;
- selection method or seed when practical;
- artifact identity/source pointer;
- artifact class (academic / historical / code / fiction / slop / image / etc.);
- whether the artifact was human-generated, AI-generated, mixed, unknown, or not applicable.

Perfect randomness is less important than avoiding convenient cherry-picking.

## Comparator-specific grading

There is no universal pass/fail threshold. **What counts as pass or fail depends on the artifact drawn.**

The reviewer should first ask what the comparator is unusually good at, bad at, or revealing about, then derive the comparison grounds from that artifact before judging the paper.

Examples:
- Against an excellent paper: clarity, compression, structure, rigor, citation economy, figure quality, confidence calibration, or memorable framing may become the standard.
- Against Feynman or Susskind: does the paper explain its hardest idea with comparable conceptual economy?
- Against Einstein: does the paper earn its abstractions and keep the physical/mathematical question visible?
- Against strong code: is the paper's argument as modular, testable, explicit about dependencies, and failure-aware as the program?
- Against a good figure/image: does the paper communicate hierarchy or relationships as efficiently as the image?
- Against fiction: are stakes, pacing, continuity, reader orientation, or memorable motifs doing useful work?
- Against pseudoscience: does the paper clearly outperform it on falsifiability, evidentiary discipline, source handling, type discipline, and confidence calibration?
- Against bad/sloppy human or AI text: if the paper does not obviously outperform the slop on coherence, specificity, signal density, or honesty, that is a serious warning.
- Against gobbledygook: an intentionally absurd comparison may reveal whether the paper is relying on jargon rhythm instead of actual semantic structure.

Sometimes use apparently nonsensical grading axes deliberately to see what they surface—for example judging a derivation by narrative pacing, an abstract by API ergonomics, a figure by musical counterpoint, or code by rhetorical economy. Such tests are exploratory and must not silently become authoritative scientific criteria.

## Required review output

For each comparator pass, record briefly:

1. **Comparator:** what was drawn and how.
2. **Why this artifact creates a useful or weird test:** one or two sentences.
3. **Paper beats artifact at:** concrete dimensions.
4. **Artifact beats paper at:** concrete dimensions, including surprising ones.
5. **Comparator-specific verdict:** PASS / FAIL / MIXED / NOT-A-MEANINGFUL-GATE, with the criterion stated explicitly.
6. **Actionable transfer:** at most a few changes worth importing into the paper, if any.
7. **Do-not-transfer:** attractive features of the comparator that would make the paper worse or less truthful if copied.

A comparator failure is not automatically a scientific rejection. Its severity depends on the dimension exposed. Failure against pseudoscience on epistemic discipline is severe; failure against a novel on character voice may be irrelevant unless the comparison reveals reader-orientation problems. Conversely, a strange comparison may expose a devastating communication defect even though the artifact is unrelated to physics.

## Relationship to ordinary peer review

The random comparator does **not** replace:
- mathematical review;
- source/provenance audit;
- citation/prior-art review;
- physics/domain review;
- falsifiability/empirical review;
- rendering/presentation QA;
- sandbox/quarantine controls.

It is an orthogonal quality-pressure test designed to prevent local rubric overfitting.

## Multiple comparators

One comparator is the minimum. High-stakes or unusually ambitious papers may draw several comparators from deliberately different classes, for example:

- one excellent contemporary academic paper;
- one historical masterwork;
- one random non-academic artifact;
- one bad/slop artifact.

Do not let this become ritual bloat. Stop when marginal information gain is low.

## Review philosophy

The comparator question is not `is our paper more like this artifact?`

It is:

> **What is this thing doing better than our paper, what is our paper doing better than it, and does that comparison expose a defect or strength our normal review process would otherwise miss?**

A strong SAT/H(s)H paper should survive not only comparison with neighboring physics literature but contact with the wider ecology of human-made artifacts.
