# Nathan Directives Provenance Log

**Purpose:** preserve direct requests, standing directives, corrections, priority changes, and scope clarifications from Nathan with enough raw-message provenance to audit intended meaning later.

This is an operational/provenance record, not a theory surface.

## Recording rule

For every direct Nathan request/directive that materially changes work, scope, priority, quarantine, tooling, archive procedure, or interpretation policy, record when available:

- local timestamp and timezone;
- raw conversation ID;
- raw message ID / node ID;
- durable conversation path once archived;
- short directive summary;
- exact or near-exact quoted wording only when raw authorship is verified;
- affected files/workstreams;
- implementation/status;
- later correction/supersession pointer if applicable.

If a live conversation has not yet entered the raw archive, record the directive immediately with `PENDING RAW-ID BACKFILL` rather than inventing an ID. Backfill the exact conversation/message identifiers once the export appears. Direct-user provenance outranks assistant paraphrase where intended meaning is disputed.

---

## 2026-09-13 — Dashboard/quarantine scope; directive provenance; Viewer continuation

- **Local timestamp:** approximately `2026-09-13 05:00 EDT` (`America/New_York`)
- **Conversation ID:** `PENDING RAW-ID BACKFILL`
- **Message/node ID:** `PENDING RAW-ID BACKFILL`
- **Durable conversation path:** `PENDING LIVE EXPORT`
- **Authorship:** direct current-chat user instruction from Nathan; raw metadata not yet available in repository.
- **Directive summary:**
  1. Nathan's Dashboard is to remain open and usable as a navigation/overview surface; it is not itself quarantined.
  2. Quarantine should apply primarily to affected assistant-generated theoretical/interpretive work and dependencies. Indices, wayfinding, archive maps, and the Dashboard may still be used to navigate and determine what is current/new, with caution around theory-bearing claims inherited from the failed integration lane.
  3. The Dashboard should contain an explicit section showing what is quarantined and why.
  4. Direct Nathan requests/directives should henceforth be logged with conversation ID plus timestamp/message ID when available, so later archived JSON provides auditable provenance and priority.
  5. Continue the Conversation Viewer work attributed to Argus: collapsed/truncated windows should open when clicked and remain open as appropriate; non-conversation/internal/plumbing messages should be exempt from Typealong replay; an internal-only flagging interface should support upgrade/downgrade/flag/promote operations.
- **Affected records:** `QUARANTINE/2026-09-13_INTEGRATION_HALT/README.md`; original-archive `..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`; Common coordination records; `CONVERSATION_VIEWER/*`.
- **Status:** quarantine manifest and Dashboard clarification committed; Viewer continuation committed; exact raw conversation/message provenance pending export backfill.

---

## 2026-09-13 — Archive-wide layered autotagging and redundant indexing

- **Local timestamp:** approximately `2026-09-13 05:15 EDT` (`America/New_York`)
- **Conversation ID:** `PENDING RAW-ID BACKFILL`
- **Message/node ID:** `PENDING RAW-ID BACKFILL`
- **Durable conversation path:** `PENDING LIVE EXPORT`
- **Authorship:** direct current-chat user instruction from Nathan; raw metadata not yet available in repository.
- **Directive summary:**
  1. Modify the layered tagger so its durable outputs participate in repository indexing/navigation rather than existing only as transient workflow artifacts.
  2. Give the tagger a broad topic remit rather than SAT/H(s)H-only vocabulary.
  3. Scan/tag all conversation-shaped JSON throughout the archive/repository, not merely the established development/live conversation folders or filenames matching a narrow convention.
  4. Preserve intentional indexing redundancy: independently discover taggable conversation JSON and compare that discovery surface with ordinary structural indexing so a tagged-but-not-indexed file becomes visible as an index-gap candidate.
- **Affected records/workstreams:** `WORKSPACES/COMMON/scripts/layered_autotag_nathan.py`; `.github/workflows/layered-nathan-autotag.yml`; `.github/workflows/maintain-navigation.yml`; `indexes/autotag/**`; tagging infrastructure ledgers.
- **Implementation/status:** implemented on `main` in commit `aee43f7f6074f21612ca8818c5b114e3ddda8fe4`; first automated archive-wide generation/validation pending workflow completion at the time of this log entry.

---

## 2026-09-13 — Conversation Viewer message-provenance search

- **Local timestamp:** `2026-09-13 05:17 EDT` (`America/New_York`)
- **Conversation ID:** `PENDING RAW-ID BACKFILL`
- **Message/node ID:** `PENDING RAW-ID BACKFILL`
- **Durable conversation path:** `PENDING LIVE EXPORT`
- **Authorship:** direct current-chat user instruction from Nathan; raw metadata not yet available in repository.
- **Directive summary:** add an option to search Conversation Viewer messages specifically by message provenance, including at minimum Nathan/me, ChatGPT, any assistant, and other message types.
- **Implementation:** added a provenance selector that can constrain either a text query or, with an empty text box, function as a provenance-only search. Categories are `All messages`, `Nathan / me` (`user` role), `ChatGPT` (`assistant` role), `Any assistant` (`assistant` + `companion`), `Other assistant / companion`, `Tool / system / developer` (including function/internal roles), and `Other / unknown`. Search result navigation and timeline marks operate on the constrained set.
- **Affected records:** `CONVERSATION_VIEWER/provenance_search.js`; `CONVERSATION_VIEWER/index.html`; `CONVERSATION_VIEWER/argus_followup.css`; `.github/workflows/maintain-navigation.yml`.
- **Status:** implemented on `main`; exact raw conversation/message provenance pending export backfill.

---

## 2026-09-13 — Personal workspaces and scoped-instance continuity

- **Local timestamp:** `2026-09-13 05:47 EDT` (`America/New_York`)
- **Conversation ID:** `PENDING RAW-ID BACKFILL`
- **Message/node ID:** `PENDING RAW-ID BACKFILL`
- **Durable conversation path:** `PENDING LIVE EXPORT`
- **Authorship:** direct current-chat user instruction from Nathan; raw metadata not yet available in repository.
- **Directive summary:**
  1. Infrastructure documentation should say when/how an instance should make a personal workspace: scoped tasks that benefit from local notes/TODOs/continuity state but whose intermediate state is not clearly Commons-/repo-/function-wide information.
  2. The instance should tell Nathan, choose a stable name if unnamed, and use an additional discriminator/surname where lineage or divergence is ambiguous.
  3. Workspace identity should be attached to conversation provenance, including conversation ID and message/timestamp anchors when available.
  4. Commons should hold a short instance placard with name/discriminator, role, capabilities, current lane, important documents/context actually possessed/loaded, tools/constraints, workspace, and conversation pointer.
  5. This is part of a broader continuity programme aimed at reducing loss when long conversations terminate abruptly and at preserving useful skills, knowledge, working relationships, and task-specific dynamics for later restart, comparison, or partial reconstruction.
  6. Retrospective reconstruction should eventually be possible for useful historical instances that predate continuity planning, using preserved conversations/artifacts and explicit uncertainty rather than assuming identity continuity.
- **Implementation/status:** workspace guidance added to `WORKSPACES/README.md`; `INSTANCE_PLACARDS.md` and `CONTINUITY_PROTOCOL.md` created; current archive/indexing instance adopted handle `Mercer` and created `WORKSPACES/MERCER/` with a continuity packet. Exact raw provenance remains pending live-export backfill.

---

## 2026-10-09 — Straight vacuum worldtubes and narrowed prior-art boundary

- **Local date:** 2026-10-09 EDT (full wall-clock timestamp, conversation ID and node ID pending export backfill).
- **Authorship:** Nathan Direct, signed in user turn; signet represented as `[OWL]`, never reproduced as a glyph by workers.
- **Direct construction controls:** Worldlines do not wrap around a carrier. SAT worldline/time-wavefront drawings precede H(s)H finite-core ER/Kerr hypothesis. Straight aligned worldtube = perfect-vacuum reference. Coiling and possible Kerr-shell/ER-support exclusion are conjectural mechanisms requiring derivation. Vacuum worldtube ocean/BEC analogy and photon/photoneutrino excitation route are *working hypotheses*.
- **Bibliographic/quarantine override:** Former blanket scholarly PRIOR_ART hard ban relaxed. Still STRICTLY OFF LIMITS: Hypothesis H proper and directly Schreiber-authored material. Other formerly quarantined outside/nLab/braid items may be examined only after SAT/H(s)H internal precedent research/citation, then as prior-art/convergence/bibliographic mainstream-legibility comparisons, not foundational constructs. Separate privacy and integration work-halt boundaries remain scoped separately.
- **Primary control:** [Nathan-direct 2026-10-09 scope note](WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md).
- **Pending work:** Extract authoritative Extended FIE PDF and complete canonical RMS with a suitable size-capable reader; compare after SAT-first precedent check; update stale blanket-prior-art routing prose.
- **Raw source:** current user cross-post; metadata pending.

---


## 2026-10-10 — Nathan Direct: constrained geometric encoding and minimal construction

- **Local date:** 2026-10-10 EDT. **Conversation address/URL:** `PENDING CHAT EXPORT / URL BACKFILL` (the live ChatGPT conversation's native URL is not exposed by this connector). **Conversation ID:** `PENDING RAW-ID BACKFILL`. **Message/node IDs:** `PENDING RAW-ID BACKFILL`. **Durable conversation path:** `PENDING LIVE EXPORT`.
- **Direct authorship:** Nathan (NM), explicit signed request `—NM 10OCT26 [OWL]`; signet transliterated as instructed.
- **Control:** SAT starts with the sufficiency of a single arbitrarily elaborated geometric line as an information representation. That mathematical information capacity is **not itself** an empirical explanation or a claim of infinitely measurable physical information. SAT **chooses** the Minkowski diagram's worldline/time-surface grammar and already experimentally characterized physics to constrain geometric encodings, rather than permitting arbitrary codebooks. The scientific project is to determine which geometrical possibilities survive these physical/empirical constraints, particularly for the remaining unresolved phenomena. The expectation of a small viable residual family is an inverse-problem hypothesis to check, not established solely by representational capacity.
- **Strict limit reaffirmed:** `Minkowski + known physics + responsive medium`. An awkward ansatz does not license new physical fields/dimensions/ontology. Assistant-added representation is not Nathan-authored theory.
- **Exact Nathan source-turn excerpt (verified in this live conversation):** “The SAT position is that a single line, elaborated sufficiently can contain an infinite amount of information.” Nathan also specifies “we choose observable phenomena well characterized by existing physics” and that the remaining unknowns become constrained by “existing geometric commitments imposed upon us by the Minkowski structure.”
- **Authoritative signed locator:** `WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-10_GEOMETRIC_ENCODING.md`; see its source/transcription and signoff. Companion assistant analysis remains separately at `WORKSPACES/MERIDIAN/SANDBOX/GEOMETRIC_INFORMATION_CAPACITY_VS_PHYSICAL_CONSTRAINT_2026-10-10.md`.
- **Backfill:** when conversation JSON is deposited, use the quoted wording and date to recover its native conversation URL, conversation ID, and user message/node ID; replace pending locators rather than inventing them. This log entry preserves the live provenance.
- **Status:** current Nathan clarification; saved on user request.

---

## Backfill procedure

When the corresponding live conversation JSON enters `LIVE CONVOS` or `DEVELOPMENT_FULL_CONVOS`:

1. identify this user message by timestamp + wording;
2. verify `author.role == user`;
3. replace the pending fields above with exact conversation ID, message/node ID, timestamp, and repository path;
4. do not alter the directive summary except to append a correction note if Nathan later changes it.
