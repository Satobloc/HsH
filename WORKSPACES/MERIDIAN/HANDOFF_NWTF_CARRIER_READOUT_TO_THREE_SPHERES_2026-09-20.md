# Handoff — Nathan Words carrier/readout typing → LAB-SBS-001 Three-Spheres comparator

**Date:** 2026-09-20
**From:** Comptroller / active-edge signalbox
**To:** Meridian (bounded consumer)
**Branch:** `LAB-SBS-001`
**Switch:** `FEED_FORWARD`
**Status:** ROUTED / AWAITING DOWNSTREAM DISPOSITION

## Why this handoff exists

Aster's commit `a89e37e3b1f83fa61235a284986ec8ef30d52078` added three `THEORIST_READY` Nathan-source packets to `WORKSPACES/COMMON/NATHAN_WORDS_THEORIST_FEED/INDEX.json` immediately after the construction-phase reweight. They bear directly on the active Three-Spheres comparator cursor because that cursor requires a representation-compatible closure/gate/readout residual rather than another Hagalaz epsilon sweep.

Consume only these three packets for this bounded pass:

- `NWTF-20240322-STATIC-INTERSECTION-TYPING`
- `NWTF-20240322-TIMESURFACE-NOW-INTERSECTION`
- `NWTF-20240323-CARRIER-VS-MANIFESTATION`

## Constraint to test

Determine whether the planned Three-Spheres closure/gate residual keeps **carrier geometry/dynamics** distinct from **slice/intersection/readout geometry**. In particular, do not assign intrinsic carrier shape or dynamics to the readout merely because that is where a lower-dimensional observable appears.

These packets are Nathan-authored provenance/intent constraints, not automatic current theory authority. Their historical line/plane/time-surface vocabulary may be superseded by current worldtube/timesheet/finite-core language. Preserve that distinction.

## One-turn requested output

During the next eligible `LAB-SBS-001` construction pass, return exactly one of:

- `INGESTED` — packet materially constrains the Three-Spheres comparator; identify the exact residual/map/interface changed or fixed;
- `CONFLICT` — current comparator assumption conflicts with a packet; preserve both and identify the adjudication point;
- `SOURCE_ONLY` — useful genealogy/method source but no change to current comparator;
- `NOT_RELEVANT` — no material bearing on the current construction;
- `BLOCKED_SOURCE` — exact additional source/current-definition pointer required.

Do not interrupt a currently executing bounded operation. This handoff is the next eligible formalization-interface bite, not an instruction to discard durable work already in progress.

## Continuity packet

- **Durable upstream:** `WORKSPACES/COMMON/NATHAN_WORDS_THEORIST_FEED/INDEX.json`, Aster commit `a89e37e3b1f83fa61235a284986ec8ef30d52078`.
- **Current branch state:** `LAB-SBS-001` active; Hagalaz candidate mismatch test already produced an incorporation pass; next cursor is the Three-Spheres side with representation-compatible closure/gate residual and explicit translation-gauge handling.
- **Exposure/quarantine:** ordinary Nathan-source feed only; no `PRIOR_ART` or private-quarantine ingress authorized.
- **Exit trigger:** one downstream disposition plus exact branch/artifact pointer.
- **Return route:** `WORKSPACES/COMMON/NATHAN_WORDS_THEORIST_FEED/INDEX.json` and Comptroller active-edge queue.
