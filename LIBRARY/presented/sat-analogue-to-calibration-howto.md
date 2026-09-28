# From Analogue to Calibration — SAT Geometry How-To

**Status:** reproducible method note / presented library object  
**Date:** 2026-09-28  
**Authors:** Nathan McKnight; Caliper  
**Theory status:** methodology and derivation workflow only; this document does not itself promote a physical claim into BEDROCK.

> **Prominent note:** this document records a solver method that actually worked in practice. It should be treated as a reusable research-process object, not as a polished endpoint. If another worker, instance, or collaborator encounters a comparably valuable failure mode, calibration lesson, visualization trap, or reproducibility improvement that is not already captured elsewhere, **append it or cross-link it here** with the same source/derivation discipline rather than letting the lesson disappear inside a conversation.

## Why this is here

The useful result of the 2026-09-28 build was methodological:

`analogue -> backbone -> transported frame -> rotating arm -> recursive wrap -> arclength ledger -> same-c constraint -> calibration -> display`

The governing rule is:

> **Compute the undistorted object first. Distort only the observation map, and record the map.**

The build began with a rough hand sketch, passed through several visually cleaner but structurally worse renderings, then converged on explicit procedural geometry. The important progression was not “ugly to pretty”; it was **source-constrained analogue -> explicit geometry -> measured path lengths -> display separated from model state**.

## Working lessons

- Preserve the source analogue before interpreting it.
- Resample the backbone by arc length.
- Carry a local parallel-transport frame rather than stamping a 2D tooltip along a projection.
- Trace rotating transverse structure in the actual local normal plane.
- Reuse the same operator recursively for higher-order winding.
- Measure path length numerically rather than inferring it from visual pitch.
- If every constituent travels at the same path speed, enforce that kinematically rather than drawing a visual offset by hand.
- Solve winding density from the required ratio instead of choosing what looks right.
- Treat magnification, glow, perspective, axial stretching, time stretching, and phase decimation as observation-map operations and log them explicitly.
- Preserve failed passes. They record which added assumptions were misleading.

## Current measured sweep

With the current test backbone and macro radius fixed at 0.20 model units, the inverse numerical sweep gave approximately:

| target path ratio | required turns | same-path-speed parent advance |
|---:|---:|---:|
| 20:1 | 391.53 | 5.0% |
| 50:1 | 982.00 | 2.0% |
| 100:1 | 1979.00 | 1.0% |
| 200:1 | 4086.58 | 0.5% |

The 50:1–200:1 cases become visually similar at ordinary display scale. That is a resolution fact, not evidence that the ratios are interchangeable.

## Exact working materials

Current source package:

- `WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/README.md`
- `WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/GEOMETRY_METHODOLOGY.md`
- `WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/geometry_engine.py`
- `WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/IMAGE_LEDGER.md`

The RevTeX source for the present note is stored alongside this presented entry as:

- `LIBRARY/presented/SAT_HowTo_AnalogueToCalibration.tex`

The current generated PDF and complete source bundle were produced in the originating conversation. Repository-side binary placement may be added by a later worker/site build without changing the textual/methodological authority of this entry.

## Precision-pass handoff

The next pass should:

1. select one SAT-defined identity in a precise `ct=w`-style convention;
2. translate the present primitives into that formalism;
3. apply ᚼ only through its declared mathematical operation;
4. normalize independently to measured/CODATA quantities;
5. calculate before rendering;
6. compare against other SAT/4DHH formulations and outside formalisms as checks rather than tuning targets;
7. preserve a running ticker-tape ledger of transforms, assumptions, units, and residuals;
8. expose the same ledger to the public-site/review surface so presentation cannot silently drift from calculation.

## Contribution invitation

Please append or cross-link new lessons only when they preserve the same standard:

- exact source or reproducible setup;
- what failed or succeeded;
- what distinction mattered;
- whether the lesson concerns model geometry, mathematics, normalization, code, rendering, or interpretation;
- what changed as a result;
- what the lesson does **not** establish.

Do not duplicate a lesson already recorded in a stronger source. Link it instead.

## Shop-floor rules

**NO METAPHORS: ONLY ANALOGUES.**  
**Unclench. Divide. Sort.**  
**Truth before algebra.**  
**Geometry before notation.**  
**Do not clog the theory. Keep it GeomeTidy.**

A clean figure is useful only if the compression preserves the distinctions the calculation needs.