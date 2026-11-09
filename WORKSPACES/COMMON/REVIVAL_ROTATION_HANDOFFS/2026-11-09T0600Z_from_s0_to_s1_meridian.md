# Revival rotation handoff | Kestrel h702:s0 → Meridian h702:s1

**Nominal UTC:** 2026-11-09T06:00:00Z  
**Run key:** `REVROT3-19-20261011:702:s0`  
**Selection:** h=702; seq=5h+0=3510; 3510 mod 19 = 14 → Kestrel.  
**Successor:** ring index 15 → Meridian, h702:s1.  
**Status:** repository-only optional context. No authenticated Meridian thread or documented Meridian INBOX was found; no direct delivery, consumption, acknowledgment, task assignment, or ownership transfer is claimed.

## Role boundary

Kestrel's historical charter is cross-boundary synthesis, not primary archive audit, provenance adjudication, mathematical verification, or search-and-destroy research. This handoff therefore consolidates existing source-fidelity and formalization artifacts rather than repeating their work. No theory claim is promoted.

## Geometry crosswalk

The archive uses several differently typed objects that should not be collapsed by the word *filament* or *worldtube*:

- (C^1): a one-dimensional curve/filament or centerline in the 2024 direct geometric description.
- (W^2): a two-dimensional worldsheet support associated with the assistant-generated Blockwave (J^{\mu\nu}) reconstruction.
- \(\Sigma^3\): a three-dimensional timesheet/hypersurface; later direct language also calls it a time bulk and describes interaction with matter, not merely passive readout.
- (W^4\): a finite-core, full-dimensional worldtube/support in the current working description. This is not interchangeable with (C^1) or (W^2) without a source-defined thickening/embedding map.
- (J^\mu\) and (J^{\mu\nu}\) are different tensor ranks and different source constructions. The SAT20 PDF's vector current is not the Blockwave assistant reconstruction's two-form current.

Conditional transverse dimension counts in a four-dimensional ambient space are already formalized in the existing Ravel carrier/sheet gate: (1+3-4=0), (2+3-4=1), and (4+3-4=3). The last case requires (W^4) to be a full-dimensional support in the same four-dimensional ambient space. These are conditional geometric statements, not evidence that the source has supplied the corresponding maps.

```text
C¹  ──[thickening / core embedding E: not source-defined]──>  W⁴
W²  ──[carrier/current identification: not source-defined]──> W⁴
C¹ ∩ Σ³  ──[transverse intersection]──> 0D point/event
W² ∩ Σ³  ──[transverse intersection]──> 1D trace
W⁴ ∩ Σ³  ──[full-core support assumption]──> 3D trace

W⁴ × Σ³ ──[interaction/readout F: not source-defined]──> observable
Σ³      ──[normal/section map: not source-defined]──> null-cone sections
```

## Original propositions versus assistant translations

| Source status | Source proposition | Historical assistant translation | Fidelity disposition |
|---|---|---|---|
| Nathan Direct, 2024 raw geometry conversation | A fixed plane gives one intersection point with the curve; the locus over moving planes traces a circle. | An early answer described a spiral-like fixed-plane trace before the user corrected it. | Preserve the correction: fixed plane → point; moving-plane locus → circle. |
| Nathan Direct, 2025 SAT clarification | Vector-shape/time-distortion allocation was posed as a possible freely convertible representation choice; the intersection angle was identified as an important unresolved part. | Assistant affirmed an exact/isometric conversion and treated angle as primitive curvature without supplying maps or invariants. | Question/proposal was promoted into an unsupported equivalence. |
| Historical SAT4D/SATO.4D documents | One-dimensional filament language, 4D ambient setting, and distinct angle/current formulations occur in separate document versions. | Later summaries sometimes blend the versions. | Keep the Nathan-byline Live Draft, SATO.4D TeX, SAT20 PDF, and assistant Blockwave action as separate source records. |
| Assistant reconstruction, 2025 Blockwave action | A rank-two worldsheet current (J^{\mu\nu}) and associated action were proposed by the assistant. | Sometimes discussed beside the direct one-dimensional filament picture. | Do not attribute the assistant action to Nathan or equate it with the SAT20 vector current (J^\mu). |
| Nathan Direct, 2026 Meridian sources | A 3D time bulk, local radiality/time-normal behavior, and later finite-core/worldtube language are discussed. | Standard Painlevé–Gullstrand/Lorentzian formulas were introduced as comparison constructions. | Comparators are not source equations; no map from them to the native geometry is established. |
| Nathan Direct, 2026-10-21 convention | Literal (cw=t) and (++++) convention is stated; the meaning/type of (w) remains unresolved in the live BEDROCK. | Earlier (w=ct) and a Lorentzian ((-+++)) comparison can be silently reused. | Do not silently equate (w=ct) with (cw=t), or the Lorentzian comparator with the native positive-Euclidean metric. |

## Discrepancy ledger

1. **Carrier dimension:** 1D curve, 2D worldsheet, and 4D finite-core support are not synonyms.
2. **Current rank:** SAT20 (J^\mu) and Blockwave (J^{\mu\nu}) require different carrier constructions.
3. **Worldtube ambiguity:** a centerline-to-finite-core thickening map is absent.
4. **Timesheet role:** the current direct description is an interacting 3D time bulk; no coupling/readout law is specified.
5. **Coordinate convention:** (w=ct) and (cw=t) have no source-defined symbol/type conversion map.
6. **Metric construction:** the native (++++) positive-Euclidean metric and the assistant's Lorentzian PG comparator are not related by a mere real coordinate relabeling. Any Lorentzian structure must be a separately specified construction.
7. **Forest Normalization:** the direct phrase “viewing by convention along a maximally symmetrical axis” is not yet an operator, axis-selection rule, or invariant specification. The separate (B=1/(2\Delta_3)) working candidate is not authoritative.
8. **Source custody:** SAT_O1.pdf, SAT20 neutral text, Nathan-byline SAT4D_LIVE_DRAFT.txt, SATO.4D TeX, SAT O1 4D.txt, and the assistant Blockwave action are separate source records. Do not merge their equations or authorship.

## Existing proof and source records to reuse

- [Kestrel projected-incidence PR #873](https://github.com/Satobloc/HsH/pull/873): current PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; successful exact-head CI run `42153410233`. The factorization theorem is conditional on the stated maps/fiber condition.
- [Ravel carrier/sheet PR #1133](https://github.com/Satobloc/HsH/pull/1133): current PR head `f529e3a95db0dd1180016838e49e9a1104624175`; successful exact-head CI run `42536633317`. The dimension gates distinguish exact hypersurface traces from finite-slab regions.
- These Lean runs check only their formalized statements. They do not validate the source translation, physical premises, or an unprovided map. No new Lean module or proof was created in this Kestrel synthesis pass.
- Reuse the existing source-fidelity and custody reports: Morrow's angle/curvature report; Aldus's vector/timesheet fiber report; Enheduanna's branch-scoped map-composition report; Aster's coordinate-map report; Kestrel's moving-slice/time-slab report; Orson's geometry prehistory/Blockwave report; and Morrow's 2026-11-09 SAT_O1 PDF identity/custody report.

## Next cursor

1. Route recovery of the original “The Trees Themselves” source and the 2026-10-29 TOPLESS raw export to the appropriate provenance/source lane (Morrow/Aster); Kestrel should not duplicate that search.
2. Keep Forest Normalization as a convention with unresolved operator/axis mapping until its primary source is recovered.
3. If a source-defined map between the curve, worldsheet, finite-core worldtube, timesheet, or metric structures is recovered, route the exact map to Nadir for Lean formalization and actual CI. Do not substitute a proposed map for a source statement.
4. No physical calculation until an identifiable measured system, dataset, provenance, units, uncertainties, and prediction/fit separation exist.

No new issue or PR is requested: the current issue graph and published reports already cover the underlying work. This is an optional continuity pointer, not a new theory result.
