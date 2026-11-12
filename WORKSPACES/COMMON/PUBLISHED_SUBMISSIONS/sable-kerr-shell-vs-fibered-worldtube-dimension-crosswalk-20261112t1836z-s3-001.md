# Kerr shell sweep versus filament-fibered worldtube: dimensional crosswalk

**Status:** source/geometry crosswalk and conditional formalization draft. No physical calculation, numerical prediction, measured-system test, or theory promotion.

## Scope

This is a narrow addition to the existing Kerr-section map contract in [issue #1634](https://github.com/Satobloc/HsH/issues/1634). It does not repeat that contract. It distinguishes the 2D fixed-r Kerr surface in the existing standard-geometry shell note from the 3D spatial Kerr section typed as a fiber in the current source-faithful worldtube reconstruction.

## Two different constructions

**A. Kerr-time sweep of a fixed-r surface**

The existing `KERR_SHELL_GEOMETRY_PASS_2026-09-16.md` describes a constant-r oblate 2-surface \(S_r^2\) in a 3D spatial slice. Sweeping that surface along a one-dimensional Kerr-time parameter gives, under a local product description,

\[
W_K^3 \sim T^1 \times S_r^2,
\]

a 3D worldvolume. The shell note is an assistant-authored standard-geometry derivation, not a Nathan Direct equation or a material-shell law.

**B. Filament extension of a spatial Kerr section**

The September 7 Nathan Direct instruction says to use a *spatial Kerr section* extended along the filament, rather than a full 4D Kerr spacetime as the cross-section. The current map contract types this as a 3D fiber \(K_b^3\) over a 1D filament parameter \(B^1\). That 3D fiber typing is a conditional reconstruction, not an explicit dimension stated in the direct message. If the family is locally product-like,

\[
E^4 \sim B^1 \times K_b^3,
\]

the total support is 4D.

The base parameters are different objects: Kerr time is not identified with the filament parameter. The cross-sections are also different: \(S_r^2\) is 2D, while \(K_b^3\) is typed as 3D.

## Missing maps

No source currently supplies any of the following:

- a map identifying Kerr time with the filament parameter;
- an inclusion \(S_r^2\hookrightarrow K_b^3\);
- a boundary identification \(S_r^2\cong\partial K_b^3\);
- a filling of the fixed-r surface by a 3D spatial section;
- the induced metric, embedding, regularity, or boundary convention needed to make those identifications geometric.

If \(S_r^2\) is used as the *entire* fiber over a 1D filament parameter, the locally product-like total support is 3D, not 4D. If it is intended as the boundary of a 3D fiber, the 4D total support is possible, but the inclusion/boundary map must be supplied. If it is merely a submanifold of the 3D fiber, its status is different again. None of these alternatives is silently selected here.

## Conditional slice discriminator

In a 4D ambient space, a regular 3D timesheet \(\Sigma^3\) has the following generic transverse intersection dimensions:

| Candidate support | Support dimension | Conditional transverse trace in \(\Sigma^3\) |
|---|---:|---:|
| Kerr-time sweep \(T^1\times S_r^2\) | 3 | 2 |
| Filament-fibered support \(B^1\times K_b^3\) | 4 | 3 |

This is conditional dimension bookkeeping, not a physical prediction. Transversality, support regularity, the actual time function, and the map from the trace to an instrument/readout remain unestablished. A measured trace dimension could discriminate these support descriptions only after those maps and a real measurement protocol are defined.

## Forced versus optional

| Item | Status |
|---|---|
| 1D filament parameter plus 3D fiber for a locally product-like 4D worldtube | Required by that chosen 4D construction |
| Fixed-r 2D Kerr surface | Sufficient for a 3D one-parameter sweep, not by itself a 4D fibered worldtube |
| Identification of the fixed-r surface with the boundary of the 3D fiber | Optional, unresolved; requires an explicit map and regularity conditions |
| Normal 3-ball, exact filling, or global product topology | Not forced |
| Fiber transport/twist connection | Not forced by dimension; needed only if a specific transport/twist law is asserted |
| Separate contact surface or constitutive response law | Not forced by the dimension count |
| Particle/observable readout | Separate map; not supplied by the intersection alone |

## Formalization status

The existing Sable support-degree PR [#1098](https://github.com/Satobloc/HsH/pull/1098) was extended on its existing branch with tagged `kerrTime` / `filamentParameter` bases and `fixedRSurface` / `spatialKerrSection` fibers. The added Lean source states the local-product, boundary-dimension, and transverse-slice arithmetic explicitly and includes `#eval` and theorem-specific `#print axioms` commands.

New source commit: `3d31ce5886224902bf21f5b5bd5c03dbf1313fa9`; module blob: `bb54301c5a85107b12530a18b2de45b596bd6610`.

**The new head has not been compiled.** The latest successful existing Lean run, #41328086467, built the earlier PR head `d2839a9454f16a2ad7661544d9d0c12b664e55c5` in 8,945 jobs. It does not verify the new theorems. The new source is therefore `FORMALIZATION_DRAFT / LEAN_NOT_VERIFIED`, not a proved result. The local runtime has no Lean/Lake executable and no network access; no new exact-head CI run was exposed after the update. The unrelated `conversation-json-content-ci` push run is not Lean verification.

Even a successful future Lean build would check only these formalized arithmetic statements. It would not establish the source-to-geometry translation, existence of the fiber bundle, a boundary identification, transversality, or any physical premise.

## Next gate

Recover and type the spatial Kerr section \(K_b^3\): its actual dimension, induced metric, embedding, boundary, orientation, and transport along the filament. Then define any map from the standard fixed-r surface into that section, keep Kerr time distinct from the filament parameter unless an explicit map is supplied, and only then define the readout and a real measured-system test with provenance, units, uncertainties, calibration, and holdout.

No SAT-O or Blockwave original equation was altered. No physical data or synthetic fixture was introduced.
