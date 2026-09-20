# Glass Sausage Factory — Site Development Work Log

**Status:** ACTIVE continuity record  
**Scope:** public-site design, information architecture, presentation, asset intake, and publishing handoff  
**Established:** 2026-09-20 by Nathan directive  
**Authority:** operational/editorial only; this log does not define theory truth

## Purpose

This file is the durable handoff surface for development of the Glass Sausage Factory public site.

Use it so that site work does not depend on one ChatGPT/site-builder conversation retaining context. Any instance taking over site development should read this file together with:

- `PUBLIC_SITE/README.md`
- `PUBLIC_SITE/EDITORIAL_VISUAL_SYSTEM.md`
- `PUBLIC_SITE/CURRENT_WORK.json`
- `PUBLIC_SITE/NEWS_FEED.json`
- `PUBLIC_SITE/ASSET_MANIFEST.json`
- the current repo orientation/control documents when theory-state or current-work claims are involved.

This log records decisions, current state, open work, and publishing limitations. It should be updated whenever a site-development session makes a material design, architecture, content-feed, or publication decision.

---

## Current site target

**Public site:** Glass Sausage Factory  
**Known current published URL:** `https://glass-sausage-factory.nathanmcknight.chatgpt.site`

The published page and the repository-side public-site infrastructure are separate surfaces. Repository work should be treated as durable source/state for future site-builder sessions. Do **not** claim that a repository edit has changed the live site unless the publishing surface was actually available and used.

---

# 2026-09-20 — continuity baseline

## Repository-side infrastructure now in place

`PUBLIC_SITE/` contains durable feeds and design guidance for the public presentation:

- `CURRENT_WORK.json` — current-work feed.
- `FEATURED_QUOTES.json` — current curated quote feed.
- `quote_candidates/` — quote nomination lane.
- `NEWS_FEED.json` — rotating source-linked external-news feed.
- `news_candidates/` — news/source-recovery intake.
- `EDITORIAL_VISUAL_SYSTEM.md` — active visual/editorial guidance.
- `ASSET_MANIFEST.json` — visual asset registry.
- `README.md` — public-site content architecture and source discipline.

A shared worker assignment exists at:

- `WORKSPACES/COMMON/ASSIGNMENT_PUBLIC_SITE_ROTATING_FEATURES_2026-09-20.md`

### Quote workflow ownership update

Nathan has assigned **Tern** to update the broader workflow so that quote capture becomes a standing project behavior.

Site-development instances should therefore **consume** the resulting quote pipeline rather than independently redesigning or competing with Tern's workflow. Existing public-site quote guidance should be treated as provisional wherever Tern establishes a newer shared workflow standard.

The site-facing responsibility remains:

- display/rotation behavior;
- visual treatment;
- source/context display;
- placement across relevant pages;
- integration with stable archive/source links.

---

## Editorial posture

Current target:

**neutral, intriguing, source-forward, scientifically literate, and confident about the existence of the work without overselling what the work establishes.**

Avoid default defensive or self-deprecating framing. Ordinary uncertainty belongs in concise status/provenance metadata, not in repeated apology language.

Preferred explanatory rhythm:

**interesting object → what it says/does → why it matters here → source/status**

The public presentation should make the project readable without converting presentation polish into epistemic authority.

---

## Visual direction — revised after Nathan image batch, 2026-09-20

Nathan supplied a substantial visual batch in the site-development conversation. The images are not yet registered as repository assets in `ASSET_MANIFEST.json`; they remain an intake batch pending durable file/source handling.

The batch includes, in broad families:

1. **Consciousness / dialogue imagery**
   - paired pale-cyan synthetic faces facing one another;
   - red/blue geometric overlays;
   - recommendation/special-series podcast graphics.

2. **Historical SAT Physics imagery**
   - black fields;
   - luminous white geometric objects;
   - recurring magenta/pink synthetic human profile;
   - torus, helix, braid, wave, aperture, and related geometric motifs;
   - strong grid-based episode families.

3. **Current H(s)H imagery**
   - predominantly monochrome or grayscale;
   - black astronomical field;
   - restrained `HsH` typography;
   - white luminous geometric structures;
   - comparatively austere presentation.

4. **Working/conceptual diagrams**
   - white trajectory network over a galaxy/star field;
   - multicolored braid passing through a blue sheet/surface;
   - technical-style toroidal/quark-braid panel with explanatory text.

5. **Podcast/admin visual taxonomy**
   - consciousness main look;
   - consciousness recommended episodes;
   - SAT Physics main look;
   - SAT Physics recommended episodes;
   - special episodes/series;
   - important/notable/admin icon family.

### Major visual conclusion

The site should **not** flatten all eras and content types into one modern dark-theme brand.

The stronger architecture is:

### A. Archive / SAT visual stratum

- black ground;
- luminous white geometry;
- SAT magenta/pink as a genuine historical identity color;
- retro-futurist / early-CGI / speculative-science illustration energy;
- historical episode art retained where useful rather than cosmetically standardized away.

### B. Current H(s)H visual stratum

- graphite/black;
- white and grayscale geometry;
- quieter mineral cyan/blue accents;
- more spacious, austere, geometric presentation;
- current work should visually feel later, cleaner, and more structural than SAT archive material.

### C. Public editorial / reading stratum

- restrained site chrome;
- warm off-white or paper-like document surfaces;
- graphite text/backgrounds;
- thin rules;
- sparse cool cyan/ice-blue interface accent;
- strong typography and large quiet margins;
- source cards, document readers, glossary, metadata, and navigation should remain sober even when adjacent project art is visually strange or dense.

### Working principle

**Site chrome should be restrained. Project imagery should be allowed to be strange.**

This is now a preferred visual principle for the site.

### Color-use refinement

The earlier palette in `EDITORIAL_VISUAL_SYSTEM.md` remains useful, but the supplied image corpus suggests the following historical/content-specific use:

- **SAT magenta:** preserve as SAT-era identity, not generic site accent.
- **Ice/cyan:** interface and consciousness/dialogue material; may also serve quiet editorial accent.
- **Deep blue/violet:** consciousness/philosophy and special-series material where appropriate.
- **White/grayscale:** dominant for current H(s)H geometry and current technical presentation.
- **Warm paper/off-white:** reading/documentary surfaces.
- **Red:** use sparingly for genuine emphasis/intervention; do not make it routine UI decoration.

Status must never be encoded by color alone.

---

## Homepage / page-flow direction

The working homepage structure is moving toward an **archival scientific editorial with evolving visual history**, rather than a generic sleek science/technology landing page.

Preferred order/direction:

1. **Hero**
   - very dark full-width field;
   - `Glass Sausage Factory` title;
   - short orientation line;
   - real project visual rather than generic orbit/particle decoration;
   - likely current H(s)H monochrome image or a restrained sequence of genuine project visuals.

2. **Two primary entry routes**
   - one for idea/concept exploration;
   - one for reading the working/source record;
   - clean, museum/research-editorial feel rather than marketing CTA language.

3. **Current Work**
   - 3–5 live threads;
   - preferably horizontal research strips, not generic SaaS cards;
   - status label + title + one-sentence description + source link + optional cropped visual;
   - preserve distinction between theory state, sandbox, archive/provenance, mathematical/formal, and infrastructure work.

4. **Visual break / project plate**
   - galaxy/trajectory image is a strong candidate for this role.

5. **From the Archive / SAT historical layer**
   - allow historical SAT magenta and denser art to reappear here;
   - make historical change visually legible rather than restyling old material into current H(s)H aesthetics.

6. **In the News**
   - cooler graphite/blue field;
   - rotating source-linked cards;
   - typed relationship labels from `NEWS_FEED.json`;
   - restrained external-source thumbnail treatment.

7. **Podcast / Recommended Listening**
   - use the real historical episode artwork as part of the story;
   - consistent site framing, crops, captions, dates, categories, and source/play links;
   - avoid erasing the podcast's native visual taxonomy.

8. **Reading Room / Documents**
   - transition onto warm paper/off-white reading surfaces where practical;
   - usable PDF/document viewer is a major target;
   - preserve math formatting where possible;
   - clearly label raw GitHub/plaintext fallbacks when presentation quality is limited.

9. **Quotes / marginalia**
   - woven into sections rather than treated as a testimonial wall;
   - quote sourcing and selection supplied by the Tern/shared workflow when available.

### Layout principle

Dense images need **quiet margins and strong type**, not extra gradients, glowing particles, parallax, or generic motion effects.

---

## Document and source presentation target

Longstanding goal remains:

- make as much of the public repositories as visible and readable as possible;
- provide a presentation-ready layer for linked documents where possible;
- use a real/usable PDF viewer because GitHub rendering is inconsistent;
- preserve mathematical formatting when possible;
- give clear warning when a link necessarily falls back to raw GitHub/plaintext display;
- add explanatory prefaces where needed without rewriting the source record;
- maintain source/date/status/direct-original-route for every presented document.

Tentative glossary popup/link support remains desirable for technical terms.

---

## In the News

The section is intended to rotate and to include more than apparent support for SAT/H(s)H.

Useful items include:

- surprising or eyebrow-raising measurements;
- constraints;
- null results;
- counterevidence;
- historical revisits;
- mathematical/topological developments;
- phenomenology that creates a useful comparison target;
- unresolved but interesting correspondences.

Each item should connect, where possible, to the **specific** SAT/H(s)H exploration it bears on, using the typed relationship vocabulary already defined in `PUBLIC_SITE/README.md` and `NEWS_FEED.json`.

Existing copypasta-news collections are a discovery corpus; public cards should recover the strongest practical original source before promotion.

---

## Podcast development status

A full podcast browser/index remains unfinished and is a major public-site opportunity.

Desired episode-index fields include:

- episode title;
- publication date;
- show name at the time, where historically relevant;
- episode art;
- Spotify/direct listening link;
- transcript/source link when available;
- major topics;
- links to related SAT/H(s)H concepts/documents;
- category such as consciousness, SAT physics, special series, notable/admin, etc.

The newly supplied image batch confirms that the podcast already has a strong internal visual taxonomy that should be preserved and made navigable rather than replaced wholesale.

---

## Glossary target

Longer-term public glossary should support stable pages and/or hover/popover definitions for major SAT/H(s)H terms.

Useful glossary entries should eventually include:

- current definition;
- important historical usages where terminology changed;
- conventional-physics translation/comparison where appropriate;
- related terms;
- source trail;
- status/currentness note when needed.

Candidate terms include He-3 Holotype Atom, Jarlskog Shadow, worldtube/hyperhelix, timesheet, Electrogravity, Interbraid, null orientation, neutrino/photon treatment, tunneling, pulsar glitches, induced metric, and the SAT→H(s)H transition vocabulary.

---

## Publishing / tool limitation as of 2026-09-20

In the current ChatGPT conversation, repository tools are available, but the actual ChatGPT Sites publisher/editor is **not exposed**.

Therefore:

- repo content/design state can be updated now;
- source files in GitHub can be edited where present;
- the live `chatgpt.site` page cannot be truthfully claimed as updated from this session unless a site-publishing tool becomes available;
- future site-builder sessions should read this log first, then implement against the durable repo state.

If a future session gains direct Sites editing/publishing access, record:

1. what live page/version was opened;
2. what repo state was used as source;
3. what was changed;
4. whether it was previewed only or published;
5. the publication date/time or version marker if available.

---

# Open work queue

## High priority

- [ ] Materialize/register Nathan's 2026-09-20 visual batch in `ASSET_MANIFEST.json` once durable source files/paths are available.
- [ ] Turn the visual-strata decision above into concrete page-level components and spacing/type rules.
- [ ] Build the first real homepage wireframe/layout specification from the current hierarchy.
- [ ] Mine `HSH_RESOURCES/OUTSIDE RESEARCH LIBRARY/SCIENCE NEWS` for source-recovered news candidates and promote the best into `NEWS_FEED.json`.
- [ ] Build a durable podcast episode index and link historical visual families to episode/category metadata.
- [ ] Design the reading-room/document-viewer behavior and fallback states.
- [ ] Define glossary UI and stable term-page schema.
- [ ] When a Sites publisher becomes available, implement and log the live-site pass.

## Coordination

- [ ] Consume Tern's updated shared quote workflow once established; do not maintain a competing quote-capture system.
- [ ] Keep public-site current-work claims synchronized with controlling repo theory/workflow state.
- [ ] Keep visual/source provenance attached as assets are ingested.

---

# Handoff protocol for future instances

Before doing substantive site work:

1. read this log;
2. read `PUBLIC_SITE/README.md`;
3. read `PUBLIC_SITE/EDITORIAL_VISUAL_SYSTEM.md`;
4. inspect the current feed(s) relevant to the task;
5. if touching current theory/work claims, inspect the controlling theory/workflow sources rather than relying on stale site copy;
6. if touching quotes, follow the latest Tern/shared quote workflow;
7. if touching external news, verify the external source/date and preserve the typed internal relationship;
8. if touching imagery, preserve source/credit/date/alt/status and distinguish source evidence, historical artwork, model illustration, generated art, and decoration;
9. update this work log with any material decision or publication event.

The goal is not merely continuity of prose. It is continuity of **design decisions, source discipline, project history, and publication state**.

---

# 2026-09-20 — live Sites visual-strata pass

## Publication

- **Site opened:** \`glass-sausage-factory\`
- **Published URL:** https://glass-sausage-factory.nathanmcknight.chatgpt.site
- **Published Sites version:** 6
- **Source state used:** the existing Sites checkout plus the current \`PUBLIC_SITE/\` README, visual system, work log, current-work feed, and asset manifest.
- **Access preserved:** public.

## Implemented visual decisions

- Replaced the generic CSS orbit/tube hero decoration with Nathan's supplied monochrome H(s)H observer/ring image.
- Shifted the global site chrome toward austere black, graphite, white, measured gray, and sparse ice-cyan.
- Restricted strong red-magenta to the historical SAT/public-notebook stratum and historically appropriate listening artwork rather than using it as the default H(s)H interface accent.
- Rebuilt the SAT/H(s)H visual comparison with supplied, locally served artwork and explicit descriptive alt text.
- Converted the Current Work card group into quieter full-width research strips so the live program reads as an active research map rather than generic product cards.
- Brought the Reading Room chrome into the same graphite/paper system without changing its source-rendering or PDF behavior.
- Updated the podcast-history strip with representative consciousness/dialogue, SAT, and human–AI artwork.
- Replaced the older defensive In the News heading with the active editorial-system language: “Results, constraints, and curious touchpoints.”

## Asset handling

Eight Nathan-supplied images were admitted to the live presentation and registered in \`ASSET_MANIFEST.json\`. They are served from stable paths beneath:

\`/assets/user-visuals/\`

Three supplied candidates were not used in this pass because their strongest contextual role remains unresolved: the neon cube corridor, the fingerprint/identity composition, and the literal braided-cord image. They should not be inserted merely to exhaust the intake batch.

The registered assets remain labeled as Nathan-supplied project artwork. Specific generator/artist metadata was not present in this intake and has not been invented.

## Validation

- Confirmed all local HTML image/link references resolve inside the packaged site.
- Confirmed the Reading Room module parses after the theme update.
- Preserved responsive collapse behavior for the hero, visual strata, Current Work strips, and thumbnail rows.
- Published successfully to the production URL above.

## Remaining visual work

- Integrate the stronger galaxy/trajectory plate when its durable source asset is available.
- Continue refining section-level typography and spacing after inspecting the live composition at several viewport sizes.
- Build the durable podcast episode index so the thumbnail taxonomy can be connected to actual episode/category metadata rather than used only as representative artwork.
- Continue migrating Current Work from manually embedded copy toward the structured \`CURRENT_WORK.json\` feed.

