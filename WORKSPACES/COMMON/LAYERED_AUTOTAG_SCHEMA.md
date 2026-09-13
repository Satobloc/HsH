# Layered Nathan Corpus Autotag Schema

**Status:** ACTIVE MACHINE-PRETAG WORKFLOW  
**Purpose:** maximize recall when bulk-winnowing Nathan-authored SAT/H(s)H conversation material without treating jargon density as a proxy for importance.

## Hard boundary

Automated tags are retrieval aids only. They do not establish authorship beyond raw metadata, do not establish claim status, and never promote material directly into `NATHAN_VERIFIED_WORDS_COMPENDIUM.md`.

Topic classification may use both speakers. Quote candidacy remains restricted to raw `author.role = user`, subject to later pasted/generated-material and provenance checks.

## Three relevance levels

Every message may accumulate relevance tags at three independent scopes.

1. **Conversation level — `CONV:*`**  
   Derived from vocabulary across both speakers over the whole raw conversation. This is the broadest/weakest relevance signal.

2. **Adjacency level — `ADJ:*`**  
   Derived from nearby turns on both sides of the message, regardless of speaker. This is the strongest retrieval signal because a short, non-jargony Nathan turn may sit inside an unmistakably SAT/H(s)H exchange.

3. **Message level — `MSG:*`**  
   Derived from the message's own words. Nathan's own turns are expected often to be shorter, less established-jargon-heavy, or to contain in-the-moment coinages, so absence of a message-level SAT keyword must not exclude a message supported by adjacency/conversation context.

Default retrieval priority is:

`ADJACENCY > MESSAGE > CONVERSATION`

The more independent relevance layers and useful tags a message receives, the easier it should be to rank/retrieve later. This is a winnowing score, not a truth/confidence score.

## Topic tagging

Seed topics include the existing provenance vocabulary and are explicitly open-ended:

`SAT-HSH`, `4D-THINKING`, `DIMENSIONALITY`, `SPEED-OF-TIME`, `C-TYPING`, `W-AXIS`, `TIMESHEET`, `INTERSECTION-READOUT`, `WORLDLINE`, `WORLDTUBE`, `HELIX-GEOMETRY`, `NESTING`, `TOPOLOGY-MORPHOLOGY`, `UI`, `WHIRLIGIG-DONUT`, `SPHERES`, `GRATICULE`, `HAGALAZ`, `INTERACTIONS`, `ELECTROGRAVITY`, `INTERBRAID`, `METRIC`, `HOLONOMY`, `QUANTIZATION`, `LAGRANGIAN`, `MODEL-VS-REALITY`, `PROVENANCE-HISTORY`, plus general `PHYSICS`.

Coinages and historically transient terms should be added rather than normalized away when discovered.

## Reasoning / epistemic bundles

Machine tags should also search broadly for:

`EPISTEMOLOGY`, `METHODOLOGY`, `REASONING`, `IDEATION`, `SPECULATION`.

These are useful even when a message contains little theory-specific vocabulary because they help recover how an idea was formed, qualified, challenged, promoted, or rejected.

## Discourse / rhetorical retrieval tags

The autotagger may apply broad heuristic tags for later retrieval, including:

`URGENCY`, `INSISTENCE`, `DIDACTICISM`, `POINTEDNESS`, `BLUNTNESS`, `COARSENESS`, `CORRECTIVE`, `NEGATING`, `COUNTERMANDING`, `COMPLAINING`, `BLOVIATING`, `LOGORRHEA`, `ADVERSARIALISM`, `CHALLENGE`, `GENTLE-REDIRECTION`, `CLARIFICATION`, `NUANCE`, `HESITANCY`, `ENTHUSIASTIC-AGREEMENT`.

These labels are machine retrieval heuristics, not psychological assessments. False positives are acceptable at the winnow stage; precision comes from later reading.

Examples of useful hesitation/qualification cues include `Well,`, `...but...`, `Now,`, `although`, `I'm not sure`, `The way I see it`, `My feeling is`, `Actually`, `In point of fact`, `Not exactly`, and similar constructions.

Examples of agreement cues include `precisely`, `exactly`, `correct`, `that's right`, `I agree`, and `yes`.

## Precision/style cues

Because tightly delimited clauses and punctuation often accompany attempts at precision, retain tags for:

- `PRECISION:NESTED-CLAUSES`
- `PRECISION:EM-DASH`
- `PRECISION:PARENTHETICAL`
- `PRECISION:BRACKETING`
- `PRECISION:ELLIPSIS`

Ellipsis is expected to be ubiquitous and therefore should contribute little or no ranking weight by itself.

Long messages may receive `LONG-FORM` or `LOGORRHEA` retrieval tags. These do not imply higher authority.

## Winnowing buckets

Initial bulk cut:

- `WINNOW:A-ADJACENCY` — adjacency relevance fires; highest retrieval priority.
- `WINNOW:B-MESSAGE` — message relevance fires without stronger adjacency support.
- `WINNOW:C-CONVERSATION` — retained because the containing conversation is relevant even though the local/message signal is weak.
- `DROP-FOR-NOW` — no current relevance layer; never destructive deletion.

Subsequent passes may form a smaller `CONCENTRATE` using quote value, correction/qualification density, provenance value, rare terminology, historical weighting, and residual/anomaly searches.

## Duplicate handling

Byte-identical copies may be collapsed mechanically. In addition, when a smaller/older raw JSON is demonstrably a strict substantive prefix/subset of a newer/more complete export of the same conversation—same message identities/content through the smaller export's cutoff—the smaller copy may be treated as superfluous and moved to a to-be-deleted/quarantine area, provided doing so does not break indexes, point-of-use links, provenance references, tags, or navigation.

Shared UUIDs alone are not sufficient to declare two nonidentical exports redundant; the contained history must be checked.

## Implementation

Current script:

`WORKSPACES/COMMON/scripts/layered_autotag_nathan.py`

Current workflow:

`.github/workflows/layered-nathan-autotag.yml`

The machine JSONL output preserves raw message IDs, source paths, text, all three relevance layers, discourse/style tags, ranking score, and winnow bucket. Manual reading remains governed by `READ_IT_TAG_IT_STANDING_POLICY.md`.
