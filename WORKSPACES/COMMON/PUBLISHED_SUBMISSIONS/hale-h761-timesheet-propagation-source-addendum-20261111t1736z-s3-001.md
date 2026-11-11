# Hale h761 | Timesheet propagation and representation-type source addendum

**Date:** 2026-11-11 17:36 UTC  
**Run key:** `REVROT3-19-20261011:761:s3`  
**Disposition:** ADDITIVE DIRECT-SOURCE RECOVERY / REPRESENTATION TYPES DISAMBIGUATED / MAPS STILL UNDEFINED / EXISTING LEAN GATES REUSED / NO PHYSICAL CALCULATION.

This addendum extends the source-fidelity crosswalk in [issue #1592](https://github.com/Satobloc/HsH/issues/1592). It does not replace that report or create a new physical model.

## 1. Source custody

The source is the Library raw export of **Ravel [H(s)H] Syncmathcek**, conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`.

- Raw export: 12,408,770 bytes.
- SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`.
- Mapping nodes: 2,394.
- Active-chain nodes: 2,044.
- Active user-role messages: 145.

The following six messages were independently checked as user-role nodes on the active conversation chain. The separately archived HsH repository copy is not byte-identical to the Library export; the two snapshots remain distinct.

## 2. Additional Nathan Direct statements recovered

| Message | UTC timestamp | Direct-source content |
|---|---|---|
| `ce837c4f-30cb-43c1-ac55-511b41c12d53` | 2026-09-07 06:54:57.826 | The filament/timesheet intersection angle is said to vary with coil pitch and motion in 3-space. No metric, normal, observer convention, or angle function is supplied. |
| `1896b541-a337-4638-b4f8-b1d53b549c6c` | 2026-09-07 07:17:43.892 | A filament parallel to timesheet propagation is described as the zero-drag/zero-mass/zero-3-space-motion limit. Small misalignment is associated with mutual energy transfer and distortion. The charge, boson, fermion, and shell interpretations remain model proposals, not established physical results. |
| `8471543a-6ed1-4743-9073-74735f019da4` | 2026-09-07 07:39:00.690 | The proposed object is explicitly called a four-dimensional worldtube with a Kerr cross-section; shell distortion as a possible force carrier is left for later examination. |
| `3d0ad680-51db-4c79-ad4a-9bbacada24ef` | 2026-09-07 07:46:38.573 | Select a spatial Kerr section and extend it along the filament, rather than using the full 4D Kerr spacetime as a cross-section. The ER-mouth/current-surface-of-simultaneity relation is tentative; opening versus inside-out closing is unresolved. |
| `b9805319-9d77-4b43-874a-5af50c0b6ef7` | 2026-09-07 08:06:58.114 | Filament-side and timesheet-side distortions are described as mutual accommodations under force; force is identified as primitive. No constitutive or conservation law is supplied. |
| `496a15ea-0263-459d-b815-908f52155b90` | 2026-09-07 10:06:12.842 | Three active representations are distinguished: a 3D Minkowski/block diagram with one time dimension; the full 4D bulk; and an actual 4D view with its 3D slice. The same message tentatively mentions an induction-current connection within timesheet thickness, without defining a current. |

## 3. The newly sharpened type distinction

The direct source does **not** identify these objects:

| Symbol used here as a label | Source-grounded meaning | What remains unspecified |
|---|---|---|
| `D³_Minkowski` | Three-dimensional diagrammatic representation with one time dimension | Projection/reduction from the 4D bulk; information retained or suppressed |
| `M⁴` | Full four-dimensional bulk; source language says time points outward from every point | Metric, time-direction field, dynamics and global structure |
| `S³_obs` | The actual 3D slice of the 4D view | Observer, worldline/field, simultaneity convention and slicing map |
| `Σ_t` | Moving timesheet/time-wavefront with a propagation direction; thickness is mentioned | Embedding, normal/propagation field, metric, support dimension and thickness boundary |
| `S³_sim` | Current surface of simultaneity tentatively associated with the ER mouth | Whether it equals `Σ_t`; opening/closing orientation |
| `K³_spatial` | Selected spatial Kerr section | Exact domain, metric, topology, boundary and embedding |
| `W⁴_Kerr` | 4D worldtube with Kerr cross-section | Extension map, parameterization, product versus twisted-bundle structure and core profile |
| `J_ind` | Tentative induction-current connection within timesheet thickness | Form degree, support, conservation, boundary conditions and readout |

The 3D Minkowski **diagram** is not the actual observer 3D **slice**. The observer slice is not identified with the timesheet. The ER-mouth-associated simultaneity surface is not established as identical to either one.

The phrase “time outward from every point” is preserved as source language; it is not yet a defined vector field. Likewise, the angle/drag language is qualitative: without a metric, normalized filament tangent, timesheet propagation field and constitutive law, no unique angle formula or mass-versus-angle prediction follows.

## 4. Required map/composition contract

The following are **assistant-proposed map slots**, not historical equations:

1. `P_diag : M⁴ → D³_Minkowski` — a representation map, with its projection and information-loss conditions declared.
2. `S_obs : M⁴ → S³_obs` — an observer-slicing map, requiring an observer and simultaneity convention.
3. `E_Kerr : K³_spatial × I → W⁴_Kerr` — the extension along the filament, requiring a defined section, domain, boundary and parameterization.
4. `I_t : W⁴_Kerr × Σ_t → C_t` — an exact-hypersurface interaction/intersection map; if timesheet thickness instead denotes a 4D slab, that is a different support and a different map.
5. `R : C_t → Y` — a readout from the interaction support to an observable.
6. `F_int : (W⁴_Kerr, Σ_t) → (δf, δt)` — a constitutive interaction map for the paired distortions.
7. `E_ER : ER-mouth → S³_sim` — the tentative simultaneity-surface relation, with orientation unresolved.

A composition is admissible only when each codomain matches the next domain and the required regularity, transversality, boundary, orientation and information-preservation conditions are stated. No source currently supplies these maps in full. In particular, no map licenses `S³_obs = Σ_t = S³_sim`.

## 5. Forced versus optional

**Source-forced or source-stated:** choose a spatial Kerr section rather than a 4D Kerr spacetime cross-section; extend it along a filament; consider a 4D worldtube with Kerr cross-section; distinguish the three representation modes; treat timesheet propagation and paired force-related distortions as meaningful; preserve the ring-like but not fully closed slinky language.

**Not forced by the recovered source:** a global product `K³ × R`, a trivial bundle, a particular Kerr metric/domain/boundary, a specified finite-core profile, an independent twist field, contact surfaces, identity of observer slice and timesheet, identity of ER mouth and timesheet, a closed conserved current, a boson/conservation hierarchy, or a quantitative mass/drag law.

## 6. Existing formalization reused

No new Lean module was added because the source-specific maps above are not yet defined. Two existing current-head formalizations already cover the relevant conditional mathematics:

- [PR #1133](https://github.com/Satobloc/HsH/pull/1133), head `ce59ec57a2aff34b6fa84f1510e192ee292829f5`, module `RavelCarrierSheetDimensionGate.lean` blob `0911b37e0ce42edaa73a43c24cc82a43f2d965da`. Exact-head Actions run [#42986393293](https://github.com/Satobloc/HsH/actions/runs/42986393293) completed successfully. It formalizes conditional transverse-intersection dimensions, a slice-preserving retraction requirement, and distinct time-support types for an exact 3D hypersurface versus a finite-thickness 4D slab.
- [PR #873](https://github.com/Satobloc/HsH/pull/873), head `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`, module `KestrelProjectedIncidence.lean` blob `0fe5390faa10113830132b12cdb98172194adfee`. Exact-head Actions run [#42955799035](https://github.com/Satobloc/HsH/actions/runs/42955799035) completed successfully. It formalizes generic projected-incidence, fiber-factorization and nuisance-range conditions.

Both PRs remain open/draft/unmerged. The CI runs establish compilation of the encoded abstract statements, not the soundness of the source translation, existence of the physical maps, or truth of physical premises. No new build, theorem, PR or branch was created.

## 7. Prediction and measurement boundary

The direct source suggests a qualitative relation between filament/timesheet alignment and drag, mass and mutual distortion. It does not specify a quantitative constitutive function or a unique observable. No measured system, dataset, calibration, units, uncertainties, covariance or independent holdout was assembled in this source-recovery task. No physical calculation, fit, H(s)H prediction or falsification threshold is claimed.

The next admissible step is to recover or explicitly define the missing source-grounded maps and their composition conditions. Only after that can an observable and standard comparator be frozen. Finite thickness, twist and contact surfaces remain optional unless a defined map or independent measurement makes them necessary.

**Status:** `DIRECT-SOURCE-RECOVERY / SIX-ACTIVE-CHAIN-USER-MESSAGES / REPRESENTATION-TYPES-DISAMBIGUATED / MAPS-UNDEFINED / EXISTING-LEAN-GATES-REUSED / NO-PHYSICAL-CLAIM`.
