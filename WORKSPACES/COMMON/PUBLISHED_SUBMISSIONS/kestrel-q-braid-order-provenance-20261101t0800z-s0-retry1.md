# Kestrel \| Q-count is not braid order

## Source-provenance addendum: the retired Z3 cap

**Run:** `REVROT3-19-20261011:512:s0`\
**Date:** 2026-11-01\
**Status:** source-fidelity addendum; no theory promotion.

### Finding

The archive does not support converting a local three-strand/interlock
condition into a universal global `Q <= 3` constituent-count law.

Several quantities must remain distinct:

-   `n_local`: strand count in one local braid/interlock.
-   `Q_const`: total fundamental-filament count at constituent
    resolution.
-   `d_braid`: braid degree or nesting level.
-   `o_super`: internal superhelical order.
-   `N_eff`: effective worldtube count after a specified
    coarse-graining.
-   `Q_top`: a topological invariant, if separately defined.
-   `S(n)`: a historical draft stability predicate, not a measured law.

No source-defined map equates these quantities.

### Source genealogy

1.  **Nathan Direct, 2024-03-22.** Raw `DIMENSIONAL GRAVITY` export,
    blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`, conversation
    `252d05c0-22ed-4ea2-a474-7966ab13145a`. User messages describe
    strings forming braided cords and nested ropes, from proton-scale
    structures through planets, star systems, and a universe-scale
    network. A later direct message describes a static 4D structure with
    apparent 3D dynamics arising from changing intersections with an
    advancing 3D time surface. This is conceptual geometry, not a
    derived cosmological solution.

2.  **Historical SAT4D draft, June 2025.** `SAT4D_LIVE_DRAFT.txt`, blob
    `2a79fe25018cce7e99a2c33786d88b0551db6ae7`. The draft states
    `S(n)=0` for `n >= 4` in a 4D interlock, then extrapolates to no
    tetraquarks/pentaquarks and no SU(4)/SU(5) sectors. The document
    header names Nathan McKnight, but later sections switch to a
    `SAT4D Collaboration` author line; line-level authorship of the cap
    is unresolved. The draft does not define the ambient link space,
    object dimension, deformation class, boundary conditions, or
    stability criterion, and supplies no proof or independent dataset.

    The separate July 2025 `SAT4D_4.txt` glossary (blob
    `efc88f4523b2fd616e64898737c2aa45e5f39b9a`) and `SAT4D_6.txt`
    directive (blob `167136310cdf33ca8f986f33634692314c1a0946`) do not
    independently restate the same universal cap.

3.  **Nathan Direct, March 2026.** The raw `Ontology and Math Check`
    conversation defines `Q` as three fundamental filaments per nucleon
    (`eedd8dce-44f0-4904-9234-2f3d9e7ef550`). A later user message gives
    He-3 as `Q=6` while writing "3 quarks × 3 nucleons"
    (`2fa35549-edc3-4e32-9c1f-07f96ab781a9`). That is an arithmetic
    slip: the stated rule gives 9. The immediately following assistant
    response corrects it to 9. The correction is arithmetic, not an
    independent physical measurement.

4.  **User-authored/attributed HsH ARCHITECT document, July 6, 2026.**
    Blob `926dd9685471f311570112ebc72d4c0be158f4c6`. It explicitly
    retires the Z3 fusion gate as a geometric necessity and separates
    braid degrees from superhelical orders. The archive ledger
    attributes the material to July 6, but the raw message UUID was not
    recovered.

5.  **Current BEDROCK control, October 2026.** Blob
    `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`, lines 455--456 and
    470--478, records resolution-dependent Q accounting: He-3 may be
    described as nine constituent worldlines/worldtubes in three
    triplets or three effective hadron worldtubes, and no universal hard
    `Q <= 3` cap is to be imposed.

    The associated October 18 relay export is not actually empty: blob
    `43824dfb5486640f8d350c4703347fff01a4544c` is 2,029,469 bytes with
    56 assistant-role nodes and zero user-role nodes. It is not the
    missing raw Nathan message. BEDROCK is the current control
    transcription; the underlying direct message UUID remains
    unrecovered.

### Typed map boundary

``` text
fundamental filaments / worldlines
       |                    |
       |                    +-- internal superhelical order o_super
       +-- local braid/interlock B(n_local)
       +-- nested braid degree d_braid
                    |
                    | nesting/cabling map (not defined)
                    v
          composite worldtube hierarchy
                    |
                    | coarse-graining map C (not defined)
                    v
              effective count N_eff
                    |
                    | physical timesheet section
                    v
                3D readout
```

The He-3 example shows why `Q_const` and `N_eff` cannot be silently
identified. It does not establish that every higher-order braid is
physically stable. It establishes only that a local strand count is not,
by itself, a global composite-count bound.

### Lean status

Existing Kestrel PR #873 contains conditional formalizations in:

-   `KestrelIntersectionDimensionGate.lean`: dimension identities under
    explicit finite-dimensional and transversality assumptions.
-   `KestrelProjectedIncidence.lean`: projection overlap, injectivity,
    and loss of distinctions under coarse-graining.
-   `KestrelMovingSlice.lean`: earlier moving-slice geometry.

These theorems do not prove the historical `S(n)` cap or physical braid
stability. No new Lean code was added because the source does not yet
define `n`, `Q`, braid degree, superhelical order, effective count,
ambient link space, and stability as distinct types with explicit maps.
Formalizing the cap now would encode an assistant-selected
interpretation.

PR #873 remains open/draft. Its latest exact-head workflow #41240068390
failed overall in `KestrelKelvinVortexReadout`; no successful exact-head
whole-PR build is claimed.

### Disposition

This addendum extends, rather than duplicates, issues #354, #1112,
#1130, #1165, and #1169. No CODATA scoring, physical calculation,
prediction, SAT-O equation change, Blockwave equation change, BEDROCK
edit, paper-gate advancement, or theory promotion was made.

**Next cursor:** recover the raw July 6 and October 18 source messages;
define the local-braid, constituent-count, braid-degree,
superhelical-order, and effective-worldtube types; then specify nesting
and coarse-graining maps before attempting a theorem about any cap.
