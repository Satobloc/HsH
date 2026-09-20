# Glass Sausage Factory — editorial + visual system

**Status:** ACTIVE public-site presentation guidance  
**Established:** 2026-09-20 by Nathan directive  
**Authority:** presentation/editorial infrastructure only; theory status remains controlled by BEDROCK and source-specific surfaces.

## Editorial posture

The site should be **curious, exact, confident about what exists, and restrained about what it means**.

Avoid a default posture of apology, self-deprecation, or defensive throat-clearing. SAT/H(s)H can be presented as an unusual open research program worth examining without either underselling it or implying validation that has not occurred.

The preferred rhythm is:

> **interesting object → what it says/does → why it matters here → source/status**

not:

> **warning → disclaimer → warning → interesting object**

Caveats remain important, but they should normally appear as concise metadata, status chips, provenance notes, or a compact research-status panel rather than dominating the emotional voice of the page.

### Voice

Prefer:

- `active research program`
- `current construction`
- `historical formulation`
- `open question`
- `comparison target`
- `structural resonance`
- `direct constraint`
- `source recovered`
- `under active mathematical review`
- `relationship not established`

Use sparingly or avoid as default framing:

- `just a pet theory`
- `not a victory`
- `mere resemblance`
- repeated `this does not prove...` constructions
- red-alert styling for ordinary uncertainty
- language that sounds embarrassed by speculative or exploratory work merely because it is exploratory

When a stronger caution is actually needed, state it plainly and locally.

## Research-status copy

A compact standing status block may say:

> **Research status** — SAT/H(s)H is an active research program with a public development record. The archive includes foundational premises, historical formulations, current reconstruction, mathematical and computational work, failed branches, and results at different stages of review. Source and status travel with the material.

This replaces long defensive caveat blocks as the normal front-door treatment.

## In the News

### Editorial purpose

`In the News` is a rotating window onto external scientific results that are interesting to place beside SAT/H(s)H work.

The section is **not** restricted to results already expected by the project. It may include:

- measurements that directly constrain a live SAT/H(s)H idea;
- results that resemble or illuminate a structural motif being explored;
- findings that make an old SAT/H(s)H conversation newly interesting to revisit;
- apparently contradictory results that sharpen a test;
- genuinely eyebrow-raising observations with no established relationship yet, when the juxtaposition itself is intellectually useful.

The site should not flatten these categories into `evidence for SAT`.

### Preferred heading language

Good options include:

- **In the News — New results at the edges of the map**
- **In the News — Results, constraints, and curious touchpoints**
- **In the News — What caught our attention**

Avoid the older defensive heading `Signals worth testing—not victories to announce.`

### Card anatomy

Each news card should expose:

1. **External result** — concise factual headline and source/date.
2. **Why it caught our attention** — one or two readable sentences.
3. **Related SAT/H(s)H exploration** — direct link(s) to the relevant conversation, paper, workspace, historical source, or current programme.
4. **Relationship** — one compact typed label.

Recommended relationship vocabulary:

- `direct constraint`
- `comparison target`
- `structural resonance`
- `phenomenology context`
- `historical revisit`
- `potentially relevant — relationship open`
- `tension / possible counterevidence`

A relationship label is descriptive, not a score.

### Rotation

The public presentation should rotate a small set of current cards while retaining a browseable archive. Rotation should not erase chronology or make older cards impossible to find.

Useful display behavior:

- 3 cards visible on desktop / 1 primary card on narrow screens;
- rotate or reshuffle periodically from entries with `display_status=featured`;
- mix freshness with variety rather than showing only the newest item;
- expose stable source and related-project links on every card;
- keep older noteworthy cards available under `More from the news archive`.

The existing copypasta-news material is a first-class mining source for candidates. Workers should recover the external source when possible rather than treating pasted headlines as sufficient provenance.

## Quotable Nathan / Quotable LLM

The quote streams should feel like marginalia from an active intellectual workshop, not testimonials.

Use a mix of:

- vivid/funny/lay-readable lines;
- conceptual compression;
- mathematical observations;
- epistemic rules;
- corrections and moments of model-building;
- historically revealing lines.

A quote may be skeptical, corrective, playful, or unfinished. It need not advertise the theory.

Nathan and LLM streams remain visually and provenance-distinct.

## Visual direction

### Overall character

Move away from `cyber-neon science startup` toward:

> **observatory notebook + museum research plate + contemporary scientific editorial**

The interface can stay dark and cinematic, but source material should feel physical, readable, and archival rather than glowing inside a generic tech aesthetic.

### Working palette

Use these as starting tokens, not immutable branding:

```css
:root {
  --bg-deep: #111416;
  --bg-panel: #181D20;
  --bg-raised: #20262A;
  --paper: #E9E4DA;
  --paper-warm: #D8D0C2;
  --ink: #ECE9E1;
  --ink-dark: #202427;
  --muted: #A5AAA7;
  --line: #343C40;
  --copper: #B98755;
  --mineral-teal: #6F9F9B;
  --night-blue: #7388A4;
  --slate-violet: #8B8098;
  --brick: #A8685F;
}
```

The key change is **lower saturation and broader material range**. Teal/copper can remain recognizable accents, but they should no longer do all the visual work.

### Semantic accent use

- **Copper / warm ochre** — history, provenance, notebook/archive material.
- **Mineral teal** — live/current internal work and navigation.
- **Night blue** — external science, news, observational/experimental material.
- **Slate violet** — concepts, quotations, interpretive/theory material.
- **Brick** — actual conflicts, failed checks, or warnings that deserve attention; not ordinary uncertainty.
- **Warm paper** — PDFs, notebook pages, equations, source extracts, archival plates.

Status should never rely on color alone; pair it with explicit text.

## Visual hierarchy

### Hero

Prefer one real project visual, notebook image, diagram, or strong thumbnail as the hero anchor rather than a generic abstract orbit graphic. The visual may change periodically.

Until a suitable supplied image is selected, keep the hero visually restrained rather than inventing decorative pseudo-scientific geometry.

### Scientific plates

Diagrams, scanned notebook pages, plots, and PDF pages should often sit on a light/warm `paper` field inside the dark site. This gives technical material a natural reading surface and distinguishes source objects from interface chrome.

### Image-led cards

News, podcast, document, history, and featured-work cards should accept a 16:9 or 4:3 image/thumbnail with:

- preserved aspect ratio;
- optional focal point for responsive crops;
- concise caption;
- source/credit;
- descriptive alt text;
- role (`hero`, `thumbnail`, `diagram`, `source-scan`, `portrait`, `news-external`, etc.).

Do not overcrop diagrams or notebook pages merely to force visual uniformity.

### Quotes

Quotes should generally be spacious serif typography with small provenance metadata, not boxed testimonial cards. A Nathan line and an LLM line can share a region but should be unmistakably labeled.

### Current Work

Prefer a living research map or grouped work-front grid over three generic equal-weight cards. Visually distinguish:

- foundational/current theory state;
- live sandbox construction;
- mathematical/formal work;
- archive/provenance reconstruction;
- public-access/documentation work.

### In the News

News should feel editorial rather than alarm-like:

- source/date above headline;
- thumbnail when available;
- `Why it caught our attention` in ordinary prose;
- one compact relationship chip;
- direct project exploration link visually adjacent to the source link.

## Typography

Keep a two-register system:

- editorial serif for display headings and pull quotes (`Georgia`, `Iowan Old Style`, or another dependable serif when available);
- clean system sans for body/navigation/metadata;
- monospace only for provenance IDs, equations-as-text, paths, hashes, and technical metadata.

Avoid turning the entire project into either a faux-academic journal or a developer dashboard.

## Motion

Use restrained motion only where it communicates structure:

- gentle quote/news rotation;
- subtle image crossfade;
- hover/source-reveal states;
- optional diagram sequence where the actual geometry benefits.

Avoid constant orbital animation, glowing particles, parallax for its own sake, or effects that imply simulation/measurement when they are decorative.

## Incoming thumbnails and visuals

Nathan will supply thumbnails and visuals incrementally. Preserve each supplied asset's identity and intended context.

For every site asset, record where practical:

- source filename / origin;
- caption;
- credit/authorship;
- date or historical period;
- alt text;
- allowed roles;
- focal/crop note;
- whether it is source evidence, model illustration, generated art, podcast art, or decorative material.

Do not silently treat generated illustration as documentary imagery.

## Design test

A page should pass this simple test:

> If all warning-red boxes disappeared, would the reader still understand what is historical, current, tentative, external, and verified from the labels, source links, and structure alone?

If not, the information architecture needs work. Color and disclaimers should reinforce the epistemic structure, not carry it by themselves.
