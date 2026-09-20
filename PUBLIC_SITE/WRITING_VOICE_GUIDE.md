# Glass Sausage Factory — Writing & Voice Guide

**Purpose:** help anyone writing or revising public-site copy sound recognizably like Nathan without turning the prose into a mannerism generator.

This is a **site-specific application guide**, not a replacement for the core voice models. The public site sits between several registers: museum educator, technical explainer, archive guide, working scientist, autobiographical host, and—occasionally—slightly amused person standing next to the display case.

The controlling principle is simple:

> **Write as though Nathan is present with the reader, guiding attention rather than merely delivering copy.**

The site should feel authored, inhabited, and aware of the reader’s position. It should not feel like institutional web copy with a few Nathanisms sprinkled over it.

---

## 1. Voice-model sources

Use the following voice models from the `HSH_RESOURCES` repository. These are the current v8.0 generation; older combined models live under that directory’s `HISTORY/` folder.

### Core index / authority map

- [Nathan Voice / Communication Model — README](https://github.com/Satobloc/HSH_RESOURCES/blob/main/PDF_SPECS/NATHAN_VOICE_MODEL/README.md)

Use this first when uncertain which model governs a task.

### Public nonfiction / coordination baseline

- [Nathan Nonfiction Communication Standard v8.0](https://github.com/Satobloc/HSH_RESOURCES/blob/main/PDF_SPECS/NATHAN_VOICE_MODEL/Nathan_Nonfiction_Communication_Standard_v8.0.md)

Use for:

- general site exposition
- archive orientation
- method / provenance explanations
- roadmap and workflow copy
- explaining status, authority, uncertainty, source lineage, or what to do next

This is the best default structural model for the site.

### Scientific / technically serious passages

- [Nathan Peer-Review Writing Fingerprint v8.0](https://github.com/Satobloc/HSH_RESOURCES/blob/main/PDF_SPECS/NATHAN_VOICE_MODEL/Nathan_Peer_Review_Writing_Fingerprint_v8.0.md)

Lean into this for:

- formal theory descriptions
- translation between SAT/H(s)H and standard physics
- model/object/representation distinctions
- claims, limitations, evidence, scope, derivations, and methodological cautions
- scientist-facing routes and source notes

Do **not** let this register bleach the public site into generic academic prose. It supplies rigor, not the whole personality.

### Provenance / mixed-source / authorship passages

- [Nathan Voice Identification / Provenance Fingerprint v8.0](https://github.com/Satobloc/HSH_RESOURCES/blob/main/PDF_SPECS/NATHAN_VOICE_MODEL/Nathan_Voice_Identification_Provenance_Fingerprint_v8.0.md)

Lean into this for:

- explaining why source identity matters
- distinguishing Nathan, AI, NotebookLM, reconstructed, quoted, and mixed material
- conversation-viewer copy
- archival caveats
- source-state / authority labels

This file is especially useful for understanding *why* Nathan cares about preserving odd wording, correction history, provenance, and visible unresolved state.

### Creative / informal reference

- [Nathan Creative + Informal Voice Reference v8.0](https://github.com/Satobloc/HSH_RESOURCES/blob/main/PDF_SPECS/NATHAN_VOICE_MODEL/Nathan_Creative_Informal_Reference_v8.0.md)

Use sparingly for:

- fourth-wall breaks
- humor
- self-aware transitions
- playful headings
- autobiographical voice
- moments where the site deliberately feels like a guided tour rather than a document repository

Do **not** import narrator-specific roughness, typos, forced ellipses, or creative-fiction surface mannerisms into technical copy.

---

## 2. Site default: Nathan as museum educator

The default public-site voice should be **Nathan the museum educator / explainer**, with technical and playful registers available as needed.

This means the prose often does a little work *before* presenting the thing itself:

- orient the reader
- tell them what kind of object they are looking at
- give one or two interpretive handles
- anticipate the most likely wrong reading
- then point to the interesting bit

A good site paragraph may therefore begin with a small preface rather than dropping straight into declarative exposition.

Useful shapes:

> Before we get to what this diagram is supposed to mean, it helps to notice what it very deliberately is **not**.

> There is a slightly odd way into this, but bear with me for a moment.

> One warning before we start translating terms: this is where theories can become deceptively fluent.

> I am going to simplify this rather brutally for a moment—not because the missing detail is unimportant, but because you need the shape before you need the machinery.

The goal is **guided looking**, not educational-theatre cheese. That said... a little cheese is allowed.

---

## 3. The reader is allowed to notice Nathan is there

The site does not need to maintain the fiction of an invisible institutional narrator.

Occasional direct address and fourth-wall breaks are encouraged, especially at changes of depth, mode, or cognitive load.

Examples:

> So... you’ve made it this far, have you? Fair enough. Let’s go deeper.

> At this point you may reasonably be wondering why any of this needs quite so many names. Unfortunately... some of the distinctions really do matter.

> If you are still with me, this is where the site stops pretending to be a website and starts becoming an archive-navigation instrument.

> Right. Now that we have the pieces on the table, we can do the part that is actually interesting.

Use these deliberately. A half-dozen strong “Nathan steps into frame” moments across the site will read as authorship. One every paragraph will become shtick.

Good places for them include:

- the opening
- the “two ways in” depth split
- the translation desk
- the deep archive / orientation section
- the current-work / audit transition
- the final source map or About section

---

## 4. Sentence architecture: do not over-sand the prose

Nathan’s finished public prose need not be maximally simple.

He often prefers a somewhat **convolute but recoverable sentence** when several relations genuinely belong together, especially where breaking them apart would falsely imply independence.

Prefer:

> The repository separates premises, historical source, current synthesis, active work, testing, and outside comparison—not because those lanes are hermetically sealed from one another (quite the opposite), but because information can move between them without its provenance, date, or evidentiary status moving along for free.

Over:

> The repository separates several kinds of material. They may inform one another. They do not have the same authority.

The shorter version is not wrong. It simply loses some of the relation Nathan would normally keep visible.

### Rule

**Formalization should remove accidental roughness, not Nathan-shaped complexity.**

Use long or nested sentences when they preserve dependency, contrast, simultaneity, or qualification. Then use short sentences to land the point.

> These are different questions.

> That distinction matters.

> The geometry is fixed. The dynamics are not.

---

## 5. Ellipses: distinguish thinking residue from deliberate suspense

Do not manufacture conversational ellipses merely to make prose “sound Nathan.”

But Nathan also uses a deliberate **leading / intrigue / suspended-resolution ellipsis** in composed prose. That one belongs on the site.

It often appears just before:

- a reveal
- a qualification
- a reversal
- a lightly comic landing
- a depth transition
- the part where the reader is being invited to notice something

Examples:

> Which is... rather the point of the glass.

> Similar mathematics is interesting. A distinctive correspondence is considerably more interesting. Whether either establishes the same physics is... the part where the work starts.

> And then, unfortunately for the cleaner story... the second constraint is still there.

Use sparingly enough that each one creates a beat.

---

## 6. Expressive punctuation, italics, emphasis, and word order

Punctuation and typography are part of the explanatory system.

Nathan may use:

- *italics* to tell the reader which distinction to hear
- **bold** for genuine interface/state emphasis
- em dashes for interruption, contrast, or clause-level reorientation
- parentheses for a second information channel
- ellipses for suspended resolution
- scare quotes for provisional or contested language
- deliberately inverted or marked word order
- a short isolated sentence after a syntactically denser one

Example:

> Historical sources are *sources*. They are not—merely by surviving, or by being beautifully written, or because I happened to be very fond of the idea at the time—automatically current authority.

Or:

> The distinction sounds fussy. It is not.

### Do not normalize meaningful markedness away

If the emphasis is carrying conceptual, tonal, or reader-positioning information, preserve it.

At the same time, do not bold, italicize, dash, parenthesize, or ellipsize every sentence. Expressive punctuation works because the baseline remains readable.

---

## 7. British-leaning article usage before H-words

Nathan tends to use the British-style **an** before some h-initial words, including forms such as:

- an historical account
- an hypothesis
- an heuristic distinction

Preserve that usage when it arises naturally in Nathan-facing or Nathan-authored copy. Do not silently normalize it to contemporary American house style.

Equally, do not mechanically force `an` before every pronounced-h word. The goal is to preserve Nathan’s actual usage, not manufacture an affected rule.

---

## 8. Self-awareness about the act of explanation

Nathan often comments—briefly—on the fact that he is explaining, naming, simplifying, translating, or leading the reader somewhere.

That metatext can be useful because it tells the reader what operation is being performed and what has been temporarily left out.

Examples:

> I am calling this a “translation” rather than an equivalence for a reason.

> We are going to cheat slightly here—not mathematically, but pedagogically—and look at the picture before the derivation.

> This is one of those places where the shorter explanation is, inconveniently, the more misleading one.

> I am front-loading the distinction because later sections depend on it, and repeating the whole argument every time would be unbearable for both of us.

This is especially appropriate in:

- section openings
- transitions into technical material
- translation notes
- interface/help text
- deep-dive routes

---

## 9. Humor: usually structural, dry, and useful

The site should permit humor without becoming jokey.

Best-fit humor is usually:

- understatement
- precise overstatement followed by correction
- faint anthropomorphism
- self-awareness
- a sentence that works literally even if the joke is missed
- bathos after a grand technical setup

Examples:

> A beautifully typeset equation remains exactly as good as the derivation underneath it.

> Raw GitHub is evidence. It is not always a reading experience.

> Resemblance is cheap. Diffusion is expensive.

> The endpoint does not exist yet, and the site should have the good manners not to hallucinate one.

The humor should usually be detachable: if the reader misses it, the scientific or navigational meaning still works.

---

## 10. Occasional cheese is permitted

Nathan has an educator’s tolerance for a slightly theatrical setup when it actually helps the audience move through an idea.

Acceptable temperature:

> Before we climb inside the machinery, it may help to stand back and look at the shape of the machine.

> Think of this as the point in the museum tour where the lights dim slightly and somebody opens the door marked STAFF ONLY.

> We have been looking at the display case. Now we get to turn it around.

Use sparingly. The line should either orient, relieve cognitive load, or make a transition memorable. If it is merely cute, cut it.

---

## 11. Voice dial: when to lean into what

### A. Homepage / broad orientation

**Primary blend:** museum educator + nonfiction standard + light creative/informal

Lean into:

- reader guidance
- prefacing
- direct address
- clear conceptual handles
- one or two fourth-wall moments
- dry humor
- expressive punctuation

Pull back on:

- dense formal caveats
- legalistic provenance language
- excessive technical terminology

### B. Scientist-facing introduction

**Primary blend:** peer-review fingerprint + nonfiction standard

Lean into:

- exact distinctions
- local uncertainty
- object / representation / inference separation
- strong claims with precise limitations
- somewhat more convolute sentence architecture where needed

Allow:

- one occasional human aside
- mild dry humor
- limited direct address

Pull back on:

- overt cheese
- repeated fourth-wall breaks
- conversational clutter

### C. Translation desk

**Primary blend:** peer-review fingerprint + museum educator

This is an especially Nathan-like register.

Lean into:

- “here is what to look for” prefaces
- contrastive definitions
- warnings about false equivalence
- marked terminology
- reader-directed explanation
- occasional “theory can cheat here without noticing” style language

### D. Archive / provenance / Conversation Viewer

**Primary blend:** provenance fingerprint + nonfiction standard

Lean into:

- source identity
- chronology
- direct-author vs AI/mixed distinctions
- why mistakes and corrections are preserved
- explicit uncertainty
- “source before synopsis” logic

Allow:

- personality around the messiness of real development
- self-aware remarks about the sausage-making

### E. Current work / roadmap / operations

**Primary blend:** nonfiction standard

Lean into:

- state visibility
- what is open / closed / blocked / source-dependent
- what exists versus what is planned
- next action
- dependency order

Allow personality only where it helps explain the state.

### F. About Nathan / autobiographical passages

**Primary blend:** creative/informal reference + nonfiction standard

Lean into:

- first person
- educator identity
- autobiographical texture
- direct reader relationship
- humor
- unusual word order / punctuation where natural

This is one of the few places where the site can relax substantially without compromising technical clarity elsewhere.

### G. Claims, predictions, formal result summaries

**Primary blend:** peer-review fingerprint

Lean into:

- exact claim type
- exact limitation
- dependency and source
- no silent promotion
- no rhetorical inflation

Pull back on:

- fourth-wall play
- cheese
- theatrical punctuation

A little personality can remain, but the claim must survive if every tonal signal is stripped away.

---

## 12. Reader-in-mind rule

Before finalizing any paragraph, ask:

1. Who is reading this?
2. What do they probably think this section is?
3. What will they misunderstand if I say it the ordinary short way?
4. Is there a distinction I should teach now so later prose can become shorter?
5. Is the reader being asked to absorb too much without orientation?
6. Would a preface, direct address, visual cue, or short aside actually help?
7. Is the prose becoming so polished that the author disappears?
8. Conversely, is the voice becoming so performative that the information disappears?

The target is not “maximum personality.” It is **maximum fidelity to how Nathan actually guides another mind through difficult material.**

---

## 13. Anti-caricature rules

Do **not** simulate Nathan by mechanically adding:

- ellipses every few sentences
- typos
- VTT garble
- nested parentheses without purpose
- fake Britishisms
- constant fourth-wall breaks
- coinages for novelty
- random italics
- jokes in every section
- long sentences whose only function is to look complicated

Surface traits should appear because the underlying communicative move calls for them.

A useful test:

> **Could this feature be removed without losing meaning, pacing, reader-positioning, or tone?**

If yes, consider removing it.

---

## 14. Compact site-generation instruction

> **Write public-site copy in Nathan Bellomy-McKnight’s nonfiction voice, with the reader treated as an active participant rather than an abstract endpoint. Default to a museum-educator register: orient before demanding attention, explain how to look at an unfamiliar object, anticipate likely misreadings, and then lead the reader into the deeper material. Preserve Nathan’s tendency toward somewhat convolute but recoverable sentences when multiple relations genuinely belong together, followed by short clean landings. Use deliberate leading ellipses, expressive punctuation, italics, parentheticals, dashes, marked word order, and occasional British-style “an” before h-words where they naturally belong. Allow occasional fourth-wall breaks, self-aware commentary about the act of explanation, dry humor, and a small amount of earned cheese. Do not turn these into mannerisms. For technically serious passages, inherit the peer-review model’s exact scope, category discipline, local uncertainty, and object/representation separation. For archive and provenance passages, make source identity and authority visible. The reader should feel that Nathan is present, guiding them through the material—not that an institution has written copy about him.**

---

## 15. Current site-writing references

- [Glass Sausage Factory — Nathan-voice copy rewrite](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/GLASS_SAUSAGE_FACTORY_COPY_REWRITE_NATHAN_VOICE.md)
- [Glass Sausage Factory — design recommendations](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/GLASS_SAUSAGE_FACTORY_DESIGN_RECOMMENDATIONS.md)
- [PUBLIC_SITE directory](https://github.com/Satobloc/HsH/tree/main/PUBLIC_SITE)

These are working references, not a substitute for direct Nathan correction. If Nathan says a passage sounds wrong, that correction outranks this guide.
