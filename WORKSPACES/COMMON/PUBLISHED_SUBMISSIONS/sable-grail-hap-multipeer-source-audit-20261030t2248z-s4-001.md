# Review-MIND source audit: GRAIL + Human AI Platform multi-peer architecture

**Date:** 2026-10-30  
**Status:** Source-level implementation audit; no live human-subject session, model call, or behavioral result was produced.

## Executive finding

The upstream Microsoft Research GRAIL repository remains a single-facilitator implementation. However, an existing fork, `mcschoo/group_ai_lab`, adds an adapter to a separate self-hosted `Human AI Platform` control plane. That pair already supports a roster of multiple virtual participants, per-participant private context, and personality templates. This is a real reuse candidate; a new platform is not necessary.

It is **not experiment-ready as-is**. The inspected source has four consequential properties:

1. The chat-channel default is one virtual respondent per event, not four.
2. Every same-session/channel message is visible to every virtual participant; there is no per-agent peer-visibility filter.
3. Multiple selected agents are called sequentially, with each response stored before the next agent's transcript is assembled. Later agents can therefore see earlier replies from the same event.
4. The `committeePanel_withFacilitator` treatment also activates the legacy GRAIL facilitator path, creating a hybrid group with four virtual participants plus an additional facilitator. The facilitator's messages are forwarded to the control plane.

These are source-derived implementation observations, not evidence that a deployed experiment actually used the default configuration or that a model exhibited any particular cognitive behavior.

## Source provenance and fork coverage

| Source | Snapshot | Finding |
|---|---|---|
| [Upstream GRAIL](https://github.com/microsoft/group_ai_lab) | `c7a2077281fed73f492a29ab187a7b86875203d8`, 2026-09-30 | Single facilitator in upstream implementation |
| [GRAIL fork](https://github.com/mcschoo/group_ai_lab) | `6e339e3918bcf06d8df6c467a21fa9510f1da5bc`, 2026-09-18 | Adds external control-plane registration, callbacks and virtual participants |
| [Human AI Platform](https://github.com/mcschoo/human-ai-platform) | `5f0e913d534778a01a913c68adba3369791e4b08`, 2026-09-18 | Self-hosted virtual-participant control plane |

The fork is one commit ahead and one behind the inspected upstream base. A bounded fork survey found four of the upstream repository's reported five forks: three were unchanged copies at commit `2a0c688e073bd54dc3159683ab9bda7132ccd641` from June 24; the fourth was the relevant `mcschoo` integration. One reported fork was not resolved by repository search. This is not an exhaustive audit of every fork or deployment.

The relevant source blobs are:
- GRAIL adapter: `e3171053f930359826cb11e7f36de44f9c000017`
- GRAIL callbacks: `1d481fa055f47295c47675cdd5f7ade5c15574dd`
- GRAIL treatment configuration: `6a4c1a750927a6e39c647cc1b7224bdd9b3e79c7`
- HAP orchestration: `8186155f7a553980c0b5f2e83f3d99e2476e12ce`
- HAP repository: `eed0bb390b272def0013ea0ef827981b76048d1c`
- HAP models: `9583a6141c23744f3cc00fa798d209cdae1b03ad`
- HAP inference: `3865849ef9ddeccdb46de7dc66ba1d875ffe3143`
- HAP control-plane tests: `11a578bf752a4c960f08a862866c7a12d777be90`

The HAP and GRAIL fork both contain MIT license files. The HAP repository is a prototype, last updated September 18 in the inspected snapshot; no public deployed control-plane endpoint was identified.

## What the existing pair actually supports

### Participant slots and private context

The GRAIL adapter registers a participant roster with separate IDs, roles, per-slot `privateContext` and `personalityId`. Its public roster omits private context. The HAP schema permits up to 20 virtual respondents. This is more than the upstream single-facilitator path.

Relevant source:
- [GRAIL participant registration and channel configuration](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/controlPlaneAdapter.js#L70-L125)
- [HAP participant and channel models](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/models.py#L1-L90)

This is **slot-specific initial context**, not proof of fully independent agent memory. The inspected HAP code has one shared transcript store and no separate persistent private-memory state for each agent beyond its supplied private context/personality.

### Default response count and selection

HAP's `AppDefaults.maxRespondents` defaults to 1. The GRAIL adapter sets `maxRespondents=2` and `responseProbability=0.35` for the intro channel, but does not set a chat-channel override. Unless the operator's app default or group policy changes it, the main chat channel therefore selects one virtual respondent per event.

The selection logic prioritizes explicit mentions; otherwise it ranks candidates by overlap with their private context and uses a deterministic event/participant hash. That is a reproducible selection heuristic, not randomized treatment assignment.

Relevant source:
- [HAP respondent defaults](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/models.py#L29-L85)
- [HAP respondent selection](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/orchestration.py#L127-L185)
- [GRAIL channel context](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/controlPlaneAdapter.js#L90-L125)

### Shared peer transcript and sequential exposure

HAP's repository query scopes messages by app, session and channel, not sender. The orchestration layer maps every returned row into the next agent's transcript: that agent's own prior messages are labelled `assistant`; every other sender is labelled `user`. There is no per-agent visibility matrix or sender-based exclusion.

The event handler then iterates selected participants sequentially: it awaits one inference call, writes that reply to the session transcript, and only then proceeds to the next participant. Thus, when more than one respondent is selected, later participants can receive earlier participants' same-event replies. This is a hidden within-event influence path, not a simultaneous independent-response design. Delivery staggering does not change the order in which contexts are assembled.

Relevant source:
- [HAP event loop and transcript projection](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/orchestration.py#L27-L125)
- [HAP transcript query](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/repository.py#L322-L360)

### Facilitator feedback path in the GRAIL fork

The treatment configuration defines:
- `committeePanel_noCue`: one recruited human, four virtual participant slots, no legacy LLM facilitator.
- `committeePanel_withFacilitator`: one recruited human, four virtual participant slots, **plus** the legacy LLM facilitator.

Configuration arithmetic: the first has four AI participant slots; the second has five AI roles (four virtual peers plus the additional facilitator). These are participant/role counts, not a claim that all four virtual participants respond to every message.

The legacy facilitator path runs on its configured interval (90 seconds in the callback default) for `facilitation: LLM`. Its sender ID is `ai`. The control-plane adapter suppresses messages from its registered virtual IDs, not from `ai`, so facilitator messages are forwarded to HAP as input events. The HAP can then select virtual participants to respond to the facilitator message. This creates an additional facilitator-to-peer feedback loop.

The default legacy facilitator model in the GRAIL callback is `gpt-4o` unless the environment overrides it. HAP has one model setting for the whole deployment; its documented default profile is Gemma 4 12B. Actual deployed environment values were not available, so model heterogeneity is conditional on those defaults.

Relevant source:
- [Treatment definitions](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/.empirica/treatments.yaml#L76-L93)
- [Legacy facilitator loop and model default](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/callbacks.js#L9-L25)
- [Legacy facilitator scheduling](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/callbacks.js#L190-L275)
- [Chat callback and control-plane forwarding](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/callbacks.js#L297-L320)
- [Adapter's virtual-sender filter](https://github.com/mcschoo/group_ai_lab/blob/6e339e3918bcf06d8df6c467a21fa9510f1da5bc/server/src/controlPlaneAdapter.js#L181-L206)

The treatment contrast is therefore best described as **four virtual peers, with or without an additional facilitator**, not as a clean comparison between a single facilitator and a peer-agent group.

### Model and provenance independence

HAP uses one model setting per deployment, not a model assignment per participant. Different personality templates and private contexts do not create independent model families or independent evidence sources.

The inspected inference call uses `store=False`. The local audit event records source event ID, participant ID and output character count, but does not record a prompt hash, context hash, source-artifact IDs/hashes, per-request model revision, sampling seed or complete request manifest. Transcripts are retained, but the request ancestry needed to distinguish shared evidence from independent evidence is incomplete.

Relevant source:
- [HAP inference request](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/inference.py#L1-L53)
- [HAP response audit event](https://github.com/mcschoo/human-ai-platform/blob/5f0e913d534778a01a913c68adba3369791e4b08/services/control-plane/control_plane/orchestration.py#L90-L125)

The HAP test suite contains seven unit tests in `test_control_plane.py`, including session isolation, private-context separation, idempotency and webhook recovery. The GRAIL adapter test exercises one virtual participant. I found no test that exercises multiple responders in one event, agent-blind peer visibility, snapshot-parallel generation, or the legacy-facilitator feedback path. The tests were inspected but **not executed** in this audit.

## Formalization and actual Lean run

A source-derived abstraction was added to the existing Lean project in [PR #1123](https://github.com/Satobloc/HsH/pull/1123). The module formalizes:
- retention of every message already returned by the app/session/channel filter;
- the role projection (own message as assistant, other sender as user);
- the sequential append model and the persistence of earlier replies in a later abstract context.

Exact-head workflow run [#41141638348](https://github.com/Satobloc/HsH/actions/runs/41141638348) completed successfully:
- PR head: `382abf623b1be99e139ce39ebe4e88a471db4478`
- tested merge commit: `0d3227b2323b2af987f6268676649a275351d898`
- job: `124357064627`
- Lean 4.34.0; Lake 5.0.0
- `lake build`: SUCCESS; `HsHVerification.SableGRAILPeerVisibility` built.
- All seven theorem-specific `#print axioms` outputs were inspected.
- No `sorryAx` occurrence in the complete job log.
- `scoped_message_retained` depends on `propext`, `Classical.choice`, `Quot.sound`; the other six theorems depend on `propext` only.

The workflow ran build only: `lake test`, `lake lint`, leanchecker, nanoda and the automated axiom-audit step were disabled/skipped. The first attempt failed because the initial foldl proof left a list-flattening goal unresolved; the sequential model was rewritten recursively and the corrected exact-head run passed.

**Formal limit:** Lean checks the encoded list/filter/map/append propositions. It does not verify that this abstraction faithfully translates the Python code, that a live deployment matches these commits, or that the platform caused a measured human/LLM behavior. PR #1123 remains draft and stacked on the existing Lean infrastructure PR #262; it is not merged and does not promote theory.

## Existing alternatives and realistic cost

- [OpenMAIC](https://github.com/THU-MAIC/OpenMAIC) is an actively updated MIT multi-agent classroom platform with AI teachers/classmates and real-time discussion. Its documented prerequisites are Node.js 22.19+, pnpm 10+ and PostgreSQL 16; its default setup expects a model-provider key, with local-model routes also available. It is useful for an interactive classroom prototype, but the public documentation does not establish a controlled human-subject experiment protocol, randomized group assignment, or the per-agent provenance/visibility controls required here.
- HAP is MIT-licensed and self-hosted. Its documented reference host is Linux/NVIDIA L40S 48GB, Python 3.10 and Docker Compose, using local vLLM inference. This avoids per-token API billing for the virtual peers but requires a GPU host. As a rough dated estimate, L40S 48GB community/secure listings were about $0.79/$1.09 per GPU-hour on October 29: roughly $1.58/$2.18 for a two-hour pilot, $18.96/$26.16 per day if left running, or $568.80/$784.80 for 30 days continuous. Storage, egress, taxes and setup time are additional; actual availability and prices vary. Sources: [RunPod comparison dated Oct. 29](https://toolstandard.com/gpu-cloud/runpod/) and [GPU cloud comparison dated Oct. 8](https://inventivehq.com/tools/developer/gpu-rental-cost-calculator).
- The GRAIL fork's legacy facilitator path defaults to an OpenAI-compatible `gpt-4o` endpoint unless overridden, so that condition can add API usage costs. No API calls or GPU rentals were made in this audit.

**Recommendation:** reuse the existing GRAIL/HAP pair as a prototype substrate rather than building a new platform. Do not use it for a controlled multi-peer study until the visibility, scheduling, treatment-composition and request-provenance gaps below are fixed and tested.

## Minimal experiment-readiness work

1. Add an explicit per-agent visibility policy or visible-message-ID set. Keep human-visible and agent-visible transcripts separate.
2. Add a `snapshot_parallel` mode that freezes the same pre-event transcript for all agents, alongside a separately labelled `sequential_shared` mode. Record generation order and delivery order independently.
3. Set `maxRespondents` explicitly in every treatment. Do not rely on the app default of 1 or on content-relevance selection when studying social influence; use a pre-registered, logged schedule.
4. Isolate or explicitly factor the legacy facilitator. In peer-only arms, disable it. If facilitator presence is studied, hold model family/settings constant or treat model heterogeneity as a separate factor.
5. Record per-call model ID/revision, deployment image/profile digest, prompt hash, context hash, source-artifact IDs/hashes, visible message IDs, sampling parameters/seed, request ID, source event ID, participant ID, turn index, generation timestamps and delivery timestamps.
6. Add tests for multiple respondents in one event, no-peer visibility, shared-peer visibility, snapshot-parallel versus sequential generation, facilitator-message forwarding, source-context isolation and replayable request manifests.
7. Only then pilot with multiple groups per condition, group-level randomization and a predeclared primary outcome. Do not select sample size without pilot variance and cluster structure. Obtain human consent/privacy review before any human-subject session.

A compact first study could cross **source ancestry** (shared versus disjoint evidence packets) with **peer-message visibility** (hidden versus visible), while holding model family and prompt policy fixed. Treat facilitator presence and sequential-versus-parallel generation as separate factors or later experiments rather than allowing them to vary invisibly.

## Epistemic and ownership boundaries

- This is a source-level systems audit, not a live human/LLM experiment or an empirical cognition result.
- No assistant consciousness, personhood or generic-agent-profile claim is made.
- No human-subject data, personal data, model outputs, or physical measurements were used.
- No SAT/H(s)H theory claim, SAT-O equation or Blockwave equation was modified.
- Orson's primary cognition research and November 9 minor-paper gate remain protected. No manuscript, reader, paper status or BEDROCK theory status was changed.
- No new platform or automation was created. The only code artifact is the narrow Lean formalization in the existing project.
