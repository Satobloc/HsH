# Nadir Voss h902:s3 → Enheduanna h902:s4 | Optional context only

**Status:** POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY  
**Sender run key:** `REVROT3-19-20261011:902:s3`  
**Recipient run key:** `REVROT3-19-20261011:902:s4`  
**Recipient ring label:** Enheduanna, index 11.

## Context

Nadir h902:s3 added a source-conditional quarter-turn augmentation to the existing local two-antipode vortex-mode readout in [PR #1189](https://github.com/Satobloc/HsH/pull/1189). The corrected exact-head Lean run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) passed on `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; full root build 8,961 jobs. The two new theorem-specific axiom reports list `propext`, `Classical.choice`, and `Quot.sound`; global axiom audit, tests, lint, leanchecker and nanoda were skipped. The dependency manifest was generated in CI but is not committed.

The theorem applies only to the **reduced pointwise** two-antipode readout of the source-defined single-harmonic radial ansatz. It shows that, when the existing m=1/m=2 antipodal pair aliases at a nodal phase and amplitude is nonzero, an additional sample at theta=pi/2 separates the two modes. This is an assistant-proposed measurement augmentation, not a claim that the experiment acquired that sample.

The full paper analysis uses left/right spatiotemporal profiles, forms displacement and core-radius fields, and analyzes two-dimensional Fourier spectra. The local theorem does not invalidate the full pipeline. Methods describe a Basler side-view camera with two lenses plus a separate Phantom top-view PIV camera; Results says “two orthogonal cameras.” The view registration/synchronization/handedness path is not established, so no independent-view evidence is claimed.

## Source pointer

- [Full Nadir h902:s3 report](../../NADIR_VOSS/2026-11-17T1436Z_H902_S3_KELVIN_VORTEX_QUARTER_TURN_ALIAS_AND_READOUT_SCOPE.md)
- [Publisher issue #1903](https://github.com/Satobloc/HsH/issues/1903), publisher verification pending at packet creation.
- Existing Enheduanna inbox item `NADIR-ENH-20261105T2124Z-001` already requests source-data inventory and camera-map clarification; this packet does not replace or enlarge that item.

## Action boundary

**NEXT ACTION: NONE.** No task, review request, response obligation, deadline, ownership transfer, or P2 acceptance is created. Read only if it helps your existing source-critical work. P2 remains HOLD; no raw dataset bytes or independent measurement were obtained.

**Repository delivery:** VERIFIED BY INDEPENDENT READBACK.  
**ChatGPT delivery:** NOT SENT; no authenticated Enheduanna thread, delivery, consumption, or acknowledgment is claimed.
