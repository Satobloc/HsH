# STORYO — Solver + Nellibeth Working Package

Status: current working package, 2026-09-28

This package freezes the current method in two parallel lanes.

## Geometry / SAT-H(s)H lane

`analogue -> backbone -> transported frame -> rotating arm -> recursive wrap -> arclength ledger -> same-c constraint -> calibration -> display`

Core rule:

> **Compute the undistorted object first. Distort only the observation map, and record the map.**

The current progression starts from the hand-drawn worldtube/helix analogue, reconstructs a centerline, carries a parallel-transport frame, traces a rotating-arm helix around an arbitrary curved spine, recursively wraps the result, measures actual arclength, and then separates model coordinates from rendering.

The current high-density ratio sweep solved the turn count needed for macro-path/backbone ratios of 20:1, 50:1, 100:1, and 200:1 while holding the backbone and macro radius fixed. At high density the helix becomes visually tube-like at ordinary display scale.

## STORYO / Nellibeth lane

`record -> connect -> mutate -> propagate -> classify -> render`

The object of study is story mechanics, not reader psychology. The system preserves source provenance, stores explicit typed dependencies, mutates one item at a time, propagates only along affected dependencies, and classifies each attempted change as COMMIT, BLOCK, or bounded BUD.

The Nellibeth v0.3 pass tested 17 mutation intentions: 3 committed and 14 blocked. The three survivors were: Mac attribution `Doug-2` -> `possible Doug-2`; moving the Nellibeth-2 revelation earlier; and moving Doug's self-modification explanation earlier.

## Shared doctrine

> **NO METAPHORS: ONLY ANALOGUES.**

> **Unclench. Divide. Sort.**

Both lanes use the same deeper discipline:

1. preserve the source;
2. isolate primitives;
3. type relations;
4. change one thing at a time;
5. propagate consequences;
6. calculate instead of eyeballing;
7. preserve failed/blocked states;
8. render only after the structure is explicit;
9. keep model-space distinct from display-space;
10. maintain a reversible ledger.

## Included files

- `GEOMETRY_METHODOLOGY.md`
- `geometry_engine.py`
- `STORYO_NELLIBETH_METHODOLOGY.md`
- `storyo_engine.py`
- `IMAGE_LEDGER.md`

## Next precision pass

Geometry:
- choose one SAT-defined identity in a precise `ct=w` convention;
- translate primitives;
- run the object through ᚼ;
- normalize independently to measured/CODATA quantities;
- blind-calculate;
- compare against multiple SAT Lagrangians / 4DHH equations and outside formalisms;
- publish the running 8-track/ticker-tape derivation ledger to the site.

STORYO:
- rerun Nellibeth from preserved manuscript provenance;
- serialize each mutation and dependency propagation;
- export COMMIT/BLOCK/BUD ledger;
- keep budding opt-in and focus/depth bounded;
- add graph/image views that never replace the source text.
