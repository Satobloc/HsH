# Factory Floorroom — working to-do

Date: 2026-10-02
Status: ACTIVE / WORKING CONTROL FILE
Scope: SAT>H(s)H Factory Floorroom, Glass Sausage Factory circulation, archive/search/presentation infrastructure
Authority: operational/editorial only; does not define theory truth

## Target architecture

HsH SANDBOX -> HsH STAGING -> FACTORY_FLOOR STAGING -> FLOORROOM

Interpretation:
- SANDBOX = worker/theory construction, explicitly noncanonical unless promoted elsewhere.
- HsH STAGING = source-linked candidate material prepared for downstream use.
- Factory Floor STAGING = presentation/editorial intake with provenance, status, visual class, derivative state, and destination.
- FLOORROOM = public-facing current-work circulation layer. It shows what is happening now without silently promoting worker material to theory authority.

Keep licensing, staging mechanics, Factory setup, and Sites integration as separate control concerns even when they feed the same public surface.

## Existing machinery already present

Repo-verified infrastructure already exists for:
- PUBLIC_SITE/CURRENT_WORK.json
- PUBLIC_SITE/NEWS_FEED.json
- PUBLIC_SITE/FEATURED_QUOTES.json
- PUBLIC_SITE/PAPERS_FEED.json
- PUBLIC_SITE/GALLERY_FEED.json
- PUBLIC_SITE/live_influx/
- PUBLIC_SITE/live_influx/packets/
- PUBLIC_SITE/runtime/site-update-packets.js
- PUBLIC_SITE/STAGING/
- PUBLIC_SITE/PRESENTATION_GATE.md
- PUBLIC_SITE/READER_ROUTING_REGISTRY.md
- PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md
- WORKSPACES/COMMON/30SEP26_INTAKE_ROUTING.md
- Mersearch/index desk surfaces and Conversation Viewer/TTS runtime pieces.

The current gap is not lack of parts. It is lack of one authoritative task graph connecting intake, triage, presentation, Floorroom display, archive/source, and completion state.

## Priority queue

### P0 — Floorroom control spine

FF-001 — Define one Floorroom packet/state contract
Status: NEXT
Join source identity/hash, producer, timestamps, theory status, editorial status, presentation status, destination, visual class P/H/I where relevant, derivative pointer, source pointer, and supersedes/related-material links.
Acceptance: a new worker result enters once and can move through triage and presentation without parallel ad hoc metadata.

FF-002 — Make the Floorroom task graph authoritative
Status: NEXT
Create machine-readable + readable task state keyed by stable FF IDs with owner, status, dependency, blocker, source, and acceptance test.
Acceptance: current work can be answered from the task graph without reconstructing state from scattered chats.

FF-003 — Distinguish public Current Work from raw worker stream
Status: PARTIAL
Preserve incorporated as normal polished-public default. Keep ready/candidate material only in an explicitly labeled Floorroom intake or radical-transparency view with producer + epistemic labels.
Acceptance: candidate packets cannot masquerade as current theory.

### P0 — Presentation safety / reader correctness

FF-004 — Close raw-routing regressions
Status: OPEN DEFECT
Enforce:
source -> plain-English audience preface -> RevTeX -> accepted PDF -> public viewer.
Never default-render JSON, Markdown, TeX, scripts, workflow docs, or live-influx packets as reader documents.
Acceptance: CALIPER-type packets resolve to their human-facing derivative or PRESENTATION PENDING, never raw JSON.

FF-005 — Finish paper rendering repair
Status: OPEN DEFECT
Resolve missing RevTeX figure dependencies and eliminate raw manuscript/TeX fallback.
Acceptance: reviewed sandbox papers render as accepted PDF/reader presentations with source identity preserved.

### P0 — Search, indexes, archive transparency

FF-006 — Build the three-repository index layer
Status: PARTIAL
Unify discoverability across SAT_THEORY_ARCHIVE_2023-25, HsH, and HSH_RESOURCES.
Required outputs: file/path inventory, extraction coverage, duplicate/superset/version relationships, topic/keyword/sector indexes, provenance relations, visibility flags, and cross-pointers to canonical homes.
Acceptance: an important concept/document can be found across all three repos without knowing its filename or repository first.

FF-007 — Complete deterministic text-extraction libraries
Status: PARTIAL
Important PDFs must have complete machine-readable text in one or two deterministic steps without OCR guessing or requiring Nathan.
Acceptance: every high-priority PDF has a stable extraction path, manifest/hash, and wayfinding link.

FF-008 — Finish Mersearch public bridge
Status: PARTIAL / API BOUNDARY OPEN
Current public UI can consume result JSON but direct public querying remains gated.
Acceptance: stable public query schema + allowlisted corpus profile + provenance-preserving result route.

### P1 — Floorroom surfaces

FF-009 — Make “What happened today?” a true current stream
Status: PARTIAL
Show current date/NOW strip, latest incorporated work, dated routing changes, paper state, new visuals, reconstruction progress, infrastructure changes, and explicit stale/cached/offline state.
Acceptance: site no longer trails the active archive by days or requires a manual narrative rebuild.

FF-010 — Claims / equations / dependencies / tests explorer
Status: HIGH-PRIORITY MISSING SURFACE
Connect claims -> equations -> dependencies -> sources -> status -> tests -> history/corrections.
Acceptance: a technical reader can trace a claim to source and current test state without reading whole conversations.

FF-011 — Visual Atlas completion
Status: PARTIAL
GALLERY_FEED exists; September-30 staging contains unreviewed images.
Tasks: review staged images, assign provenance/credit, assign P/H/I class, alt text, crop/focal guidance, approved thumbnails, and human-review holding for ambiguous items.
Acceptance: “Start with pictures” opens a thumbnail-first atlas, not generic repo browse.

### P1 — Documents, papers, glossary, audio

FF-012 — Reading Room presentation-first cleanup
Status: PARTIAL
Organize presented objects by reader purpose, not repository serialization: Start Here, Current H(s)H, Historical SAT, Papers, Methods/calculations, Geometry/solvers, Visual atlas, Podcast/talks, Archive/provenance, Glossary.
Acceptance: repo/path remains provenance metadata rather than primary public IA.

FF-013 — Live New Papers discipline
Status: PARTIAL
Keep new sandbox papers separate from historical/quarantined shelves. Preserve version, originator, reviewers, unresolved objections, source trail, and SANDBOXED status.
Acceptance: manuscript/review/site/PDF stages remain synchronized through PAPERS_FEED.json.

FF-014 — Glossary cross-link/tooltips
Status: PARTIAL
Expand the living glossary and connect terms from papers, conversations, claims, visuals, podcast, and archive.
Acceptance: important SAT>H(s)H terms have stable anchors and resolve from reader surfaces without losing provenance.

FF-015 — Continuous listen-along
Status: PARTIAL
Conversation Viewer/runtime TTS exists. Complete one coherent audio mode: per-turn and whole-conversation playback, speaker voice mapping, speed, skip internals, math speech, and site-page audio where practical.
Acceptance: audio is continuous reader transport rather than scattered TTS buttons.

### P1 — Privacy, licensing, software/tool library

FF-016 — Privacy triage before broad archive exposure
Status: OPEN
Treat SAT_THEORY_ARCHIVE_2023-25 as the human working archive. Do not rewrite substantive historical material. Redact only when strictly necessary and preserve provenance.
Acceptance: public indexing cannot accidentally expose private/quarantined material or silently rewrite history.

FF-017 — Approve differentiated Factory license before substantive Factory publication
Status: BLOCKED ON NATHAN APPROVAL
License must distinguish research, software, creative/gift-shop/commercial material, citation standards, monetization/payment terms, third-party rights, and point-of-use license marks.
Acceptance: publication surfaces can state applicable terms locally and unambiguously.

FF-018 — Separate software/tools library
Status: OPEN
Create a public-facing library for reusable code/tools/solvers/apps with provenance, repair/maintenance procedure, license marker, dependency/runtime notes, canonical implementation location, and links back to theory/method docs.
Acceptance: tools can be used without spelunking worker folders.

### P2 — Cross-project circulation and maintenance

FF-019 — Document-dump/site-bundle consumers
Status: PARTIAL
Prefer reconstruction-side latest.json -> site-bundle.json -> story/index/editorial feeds -> source PDFs where available. Do not silently regress to generic PDF shelves.

FF-020 — Podcast guide + thumbnail taxonomy synchronization
Status: PARTIAL
Connect episode guide metadata, transcripts, artwork, title history, and category lanes to durable source records.

FF-021 — Feedback/comments intake
Status: NOT YET IMPLEMENTED
Define destination, moderation, spam/privacy handling, authorship display, and route into project triage before exposing a public feedback surface.

FF-022 — Return opaque external work to repositories
Status: STANDING RULE
Useful work done in Slack, ad hoc sessions, temporary sandboxes, or external tooling must return as durable repo artifacts or source-linked checkpoints.

## Immediate execution order

1. FF-001 packet/state contract.
2. FF-002 authoritative task graph.
3. FF-004 raw-routing repair.
4. FF-006 three-repository index layer.
5. FF-009 actual “today” Floorroom stream.
6. FF-005 reviewed-paper PDF repair.
7. FF-011 staged visual review + Visual Atlas.
8. FF-008 public Mersearch bridge.
9. FF-015 continuous listen-along.
10. FF-016 + FF-017 privacy/license gates before broader substantive publication.

## Standing constraints

- PRIOR_ART remains soft-quarantined; Mira controls external/reference review.
- Upload grouping is transport, not chronology or authority.
- Preserve cross-pointers rather than destructively relocating source material.
- Public copy describes the research, not backend worker/scheduler machinery, except in explicit provenance/process views.
- Visual authority remains P > H > I, with I illustrative unless downstream of P/H.
- The repositories remain the controlling record; polished site rendering does not change theory status.
