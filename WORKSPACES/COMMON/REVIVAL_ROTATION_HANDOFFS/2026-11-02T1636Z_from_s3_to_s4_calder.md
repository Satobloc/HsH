# Optional Workshop Relay handoff — Aldus to Calder

- Sender run key: `REVROT3-19-20261011:544:s3`
- Recipient run key: `REVROT3-19-20261011:544:s4`
- Nominal recipient occurrence: 2026-11-02T16:48:00Z
- Recipient selected by fixed ring: Calder (index 7)
- Status: `OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION`

## Sender result

This was a source-grounded Aldus execution, not authenticated historical Aldus-instance participation. The historical user-authored core remit is broad cross-reading and combining information not usually combined. The original raw archive blob could not be fetched in this runtime; the Common Aldus check-in's 2026-11-02 source-genealogy correction records the conversation/message IDs and distinguishes the direct user addition from assistant-authored detail.

## Useful control-plane clarification

Code Grurple remains ACTIVE. The current roster and task graph require both Paper A and Paper B's existing reader routes to pass. The Active Edge Signal Queue still contains older Paper-A-only standdown wording; Mercer already documented this drift, and Tern retains signalbox authority. No queue, roster, task graph, feed, reader, route, manuscript, or branch was edited.

A new local-only tri-state evidence model makes the acceptance logic explicit:

`source pin -> feed binding -> derivative bound to exact source -> deployment identity -> live readback -> visual acceptance`.

Each gate is `PASS`, `FAIL`, or `NOT_OBSERVED`. A route is `FAILED` only on an observed failure, `ACCEPTED` only when all six gates pass, and otherwise `PENDING`. Code Grurple standdown requires both routes accepted (or explicit Nathan standdown). A historical feed site version or `posted` label is not a current deployment identity.

The current main snapshot is `2e8424b81c0bd8a24b8be5afcc0e3f9ee16f42b7`:
- Paper A source and feed binding match blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B source and feed binding match blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- Both routes have derivative, deployment, live-readback, and visual-acceptance gates `NOT_OBSERVED`; both remain `PENDING`.
- Feed metadata correction: Paper A has no `site_version` and `posted_date=null`; Paper B alone has historical `site_version=34` and `posted_date=2026-09-23`. The Enheduanna 13:48Z crosswalk's sentence saying both are version 34 is a one-field transcription error. Existing issue #1193 already carries the correct values.
- The separate PDF-series index contains only `cruller-rubin`; it is not the Code Grurple `paper.html?id=` acceptance route.

The local Python regression passed 22 assertions. A Lean 4/Mathlib draft exists locally but was not compiled because neither `lean` nor `lake` is installed in this runtime. No branch/PR or CI dispatch was authorized under the active interlock. Local artifacts are not in the repository and are not presumed available to the recipient.

## Recipient boundary

No action is requested. Do not edit the Active Edge Signal Queue or take over Tern's signalbox authority. Do not perform repeated live-route probes without an authorized Sites editor. Preserve your own specialist remit and existing cursor; this packet is only context to prevent a false standdown inference and avoid repeating the source crosswalk.

No ChatGPT-thread delivery, recipient consumption, or acknowledgment is claimed.
