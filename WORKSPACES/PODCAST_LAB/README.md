# H(s)H Podcast Lab

**Status:** noncanonical planning workspace  
**Purpose:** design a new non-specialist science podcast using a curated NotebookLM source set, with SAT/H(s)H as a recurring lens rather than an excuse to blur standard science and project-specific interpretation.

## Editorial target

Tone: disarming, curious, surprising, diverse, rigorous, non-specialist.

Format: general science and specific subfields approached through questions that SAT/H(s)H naturally raises—geometry, time, measurement, knots/braids, waves, particles, cosmology, emergence, scientific method, failed models, instrumentation, history of ideas, etc.

The show should be interesting even to a listener who does not accept or care about SAT/H(s)H.

## Canonical-record rule

NotebookLM is a production environment, not the project archive.

For every episode preserve in GitHub:

- episode ID/title/status;
- exact source manifest and versions;
- source rotation/removals/additions;
- controlling Deep Dive prompt(s);
- claims/fact-check notes;
- generated asset inventory;
- final description/source list;
- any SAT/H(s)H statements that require provenance or correction.

See `WORKSPACES/COMMON/GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md`.

## Proposed roles

### Janus — editorial/curation coordinator initially

Until the roster identifies a better dedicated producer:

- choose/maintain source packs;
- draft NotebookLM Deep Dive prompts;
- commission/check episode packets;
- route claims for verification;
- preserve production provenance;
- keep the show broad enough not to become internal-theory monologue.

### Ravel — theory accuracy gate

Review only the SAT/H(s)H-specific representation of current theory when needed. Do not burden Ravel with routine production.

### External-research lane

Provide typed source/evidence packets and bibliographic checks. It does not alter H(s)H to fit episode material.

### Nathan

Steering/editorial taste, NotebookLM interface/upload operation, final episode judgment.

## 50-source NotebookLM model

Treat 50 as a working cap, not a quota. Suggested rotating composition:

- **8–12 internal anchors:** Fundamental Intuitions, current synthesis/checkpoint, one or two current math/geometry packets, selected historical provenance only when episode-relevant.
- **20–25 external primary/review sources:** papers/books/reputable technical sources for the episode's science.
- **5–8 empirical hard-backstop sources:** measurements, datasets, experiment papers, null constraints.
- **3–6 history/method sources:** history of science, philosophy/method only when useful and clearly separated from physical claims.
- **2–5 wildcard sources:** surprising adjacent fields, analogies, instrumentation, art/history/natural systems—used to diversify the conversation, not as evidence for H(s)H.

Avoid loading the whole archive. Curate aggressively per episode/mini-season.

## Source typing

Every source in the manifest should have one or more tags:

`INTERNAL_CURRENT` / `INTERNAL_HISTORICAL` / `STANDARD_MATH` / `EMPIRICAL` / `EXTERNAL_MODEL` / `REVIEW` / `HISTORY_METHOD` / `WILDCARD`

External-model interpretation never silently becomes current H(s)H.

## Deep Dive prompt skeleton

Each episode prompt should specify:

1. **Audience:** smart non-specialist; define jargon naturally.
2. **Question:** one compelling science question rather than 'explain the theory.'
3. **Surprise structure:** begin with a familiar intuition, complicate it, then show several legitimate ways scientists/mathematicians attack it.
4. **Standard science first:** accurately explain mainstream/established material from sources.
5. **SAT/H(s)H lens:** introduce only where useful, clearly labeled as this project's model/representation or open construction.
6. **Epistemic separation:** distinguish observation, standard interpretation, mathematical possibility, SAT/H(s)H proposal, historical SAT idea, and speculation.
7. **No ontic inflation:** do not claim inaccessible reality-in-itself.
8. **Counterpressure:** include what would falsify, constrain, or make the H(s)H framing unnecessary.
9. **Diversity:** pull in at least one genuinely different field/source where it illuminates the question without forcing analogy.
10. **Ending:** leave the listener with a sharper question or experiment, not a victory lap.

## Episode packet

For each proposed episode create a repo packet containing:

- `EPISODE_ID`
- working title + alternate titles;
- one-sentence hook;
- central question;
- target length;
- source manifest;
- why each source is present;
- NotebookLM prompt;
- SAT/H(s)H claims allowed in this episode;
- claims explicitly forbidden/unresolved;
- fact-check checklist;
- possible figures/animations/site assets;
- final audio/transcript links or identifiers;
- postmortem: what worked, what distorted, what sources should rotate out.

## Good early episode families

- Why a helix is secretly a wave, a rotation, and a line with memory.
- What does a measurement actually measure?
- How can continuous motion produce discrete outcomes?
- Knots, braids, and why topology ignores most of geometry.
- The many meanings of 'dimension' in actual science.
- What a particle looks like if you stop drawing it as a dot.
- When two mathematical descriptions are really the same thing.
- Scientific theories as compression schemes.
- Why null results are among the most valuable results.
- How to tell a beautiful coincidence from a prediction.
- The geometry of chirality: why left and right can matter.
- Why physicists disagree about what quantization is telling us.
- What would count as a real empirical backstop for a geometric theory?

## Production safeguards

- Every episode gets a source manifest before audio generation.
- Every SAT/H(s)H-specific claim gets current-source verification or is labeled historical/speculative.
- NotebookLM output is reviewed; it is not self-authenticating.
- Interesting errors/misframings are logged because they reveal prompt/source problems.
- External sources are cited because they support their own claims, not because they validate SAT/H(s)H.

## Next setup

After active roster synthesis:

1. designate podcast producer/curator lane;
2. choose series name/identity;
3. define first 6-episode mini-season;
4. create initial 50-source manifest;
5. draft episode 001 packet and NotebookLM Deep Dive prompt;
6. preserve all returned assets under this workspace or a dedicated public media surface.
