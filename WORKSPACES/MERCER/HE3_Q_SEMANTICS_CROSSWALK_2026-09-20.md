# He-3 Q Semantics Crosswalk — source-first

**Date:** 2026-09-20  
**Worker:** Mercer  
**Status:** provenance/reconstruction aid; not theory authority, mathematical validation, or physical validation  
**Primary source inspected:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — HELIUM STANDARD ATOM 2.txt`  
**Recovered ancestry source:** raw `Homes in Cardinal Order` conversation export, conversation UUID `6a39839c-0d50-83ea-afe2-f8e15a97f76a`, user message `4fa4d67f-dd2c-4853-a1e2-ba599413aa81`, attachment `Q COUNTING CONCERNS.pdf`, file ID `file_00000000e4b4720ca036a4d181b63c73`, 80,845 bytes; parsed attachment text preserved in the export. A co-attached/recovered `Orders and Q numbers.pdf` supplies the explicit braid/coiling-order statement summarized below.

## Purpose

Keep distinct the incompatible-looking uses of `Q` instead of normalizing them into one quantity. The recovered audit ancestry adds a documented **braid/coiling-order axis** and a **fundamental-vertex versus emergent/world-tube axis** to the earlier local-versus-total distinction. This crosswalk records what sources say and the level/object each occurrence appears to count. It does not decide whether the later use is an intentional coarse-graining, a changed convention, or an internal inconsistency.

| Record | Q definition / level | Object counted | Source wording / context | Mass stage / formula | Reconstruction status |
|---|---|---|---|---|---|
| A | `Q=3` first-order subunit / local triplet | one nucleon modeled as a stable Borromean triplet; local fundamental ground-state vertex is capped at three filaments | `SAT CORE — HELIUM STANDARD ATOM 2.txt` gives three nucleons, each a stable Borromean triplet (`Q=3`). Recovered `Q COUNTING CONCERNS.pdf` text scopes the `Q≤3` restriction to fundamental ground-state vertices. Recovered `Orders and Q numbers.pdf` identifies the nucleon as a first-order `Q=3` object. | Early material uses topological + induced inertial mass language and proportional-Q discussion; no new derivation performed here. | Explicit historical source usage. Local/subunit count, fundamental-vertex cap, and first-order braid status are now source-supported axes. Mathematical claims remain historical/source claims; no new validation status assigned. |
| B | `Q_total=9` second-order nuclear total | all nine primary filaments of He-3 / three first-order Q=3 nucleons combined | `SAT CORE — HELIUM STANDARD ATOM 2.txt` explicitly gives total `Q=9` and nine primary filaments. Recovered `Orders and Q numbers.pdf` explicitly describes He-3 as a **second-order braid/supercoil** made from three first-order `Q=3` nucleons and states He-3 is `Q=9`. | Same early proportional-mass context; source later flags a `Q=9` scaling bottleneck / complexity-inversion risk. | Explicit source mapping: three first-order Q=3 nucleons compose a second-order He-3 Q=9 structure. This is stronger than a merely inferred local-versus-total distinction. |
| C | later whole-anchor `Q=3`; `Q` redefined as integrated topological charge / effective intersection density | whole He-3 holotype / isotope-scale ensemble entry | Later “He-3 Holotype: Geometric Anchor” calls He-3 a fermionic `Q=3` bundle. Later mass-scaling section defines Q as integrated topological charge/effective intersection density rather than simple nucleon count and tabulates He-3 anchor `Q=3.0`. | Later block states `m_eff ≈ m0/Q` and tabulates isotope values. This conflicts in direction/convention with earlier proportional-Q language unless an unstated stage/redefinition relates them. | Explicit later source usage, but its relation to A/B remains unresolved. The recovered audit ancestry does **not** yet supply an explicit transformation from first-/second-order counts to this integrated/effective Q. Do not silently identify C with A or B. Formula is not newly validated/disclaimed. |
| D | later namespace cleanup: `Q_fund`, `Q_top`, `Q_eff` | respectively absolute fundamental filament count; topological winding/linking/twist class; scale-effective count | Later in the same raw `Homes in Cardinal Order` conversation, Nathan asks for the “full stack ... sans maximax”; the assistant-produced `SAT CORE STACK — CORRECTED / STANDARDIZED / SANS MAXIMAX` explicitly separates these three symbols. It gives `Q_fund(N)=3`, `Q_fund(He3_nuc)=9`, and warns not to conflate `Q_top`, `Q_fund`, braid degree, flavor, or spin. | The same assistant synthesis moves effective mass to persistent co-distortion/topology/braid functionals rather than supplying the earlier inverse-Q isotope formula. | Important later reconstruction/notation evidence, **not Nathan-authored mathematics and not an explicit map for record C**. It shows that the conversation later recognized Q-overloading and introduced separate namespaces, but `Q_eff` is only named “scale-effective count”; no recovered equation maps C's whole-anchor `Q=3` to `Q_fund=9` or `Q_top`. |

## Recovered scale/order axis

The recovered Q-counting attachment distinguishes **fundamental filaments** from **emergent world tubes** and limits the `Q≤3` ground-state restriction to fundamental vertices, while discussing different effective counting behavior after the macroscopic/world-tube transition. The co-attached `Orders and Q numbers.pdf` independently makes braid order explicit: a first-order Q=3 nucleon is a constituent of the second-order He-3 Q=9 braid/supercoil.

This means historical `Q` interpretation requires at least these fields to be kept separate in reconstruction:

- object/level counted (local vertex, nucleon/triplet, whole nucleus/ensemble);
- braid/coiling order (first-order constituent versus second-order composite);
- regime (fundamental-filament versus emergent/world-tube counting);
- mass-stage/formula context (early proportional-Q versus later inverse-Q effective scaling).

None of those distinctions by itself supplies the missing map to record C.

## Later namespace cleanup in the same conversation

A later assistant synthesis in the source-identifiable `Homes in Cardinal Order` conversation materially changes how the historical ambiguity should be reconstructed. Nathan's immediately preceding user instruction is only: `So, let’s do the full stack, in a code window, sans maximax`. The resulting assistant artifact labels itself `SAT CORE STACK — CORRECTED / STANDARDIZED / SANS MAXIMAX`, includes `Q-counting cleanup`, and explicitly introduces:

- `Q_fund` = absolute fundamental filament count;
- `Q_top` = topological class / winding / linking / twist count;
- `Q_eff` = scale-effective count.

It then preserves the nested He-3 construction as `He3_nuc = B_3^(2)[B_3^(1)[q]]` with `Q_fund(He3_nuc)=9`, and explicitly says the nested second-order braid is not equivalent to a flat first-order nine-braid.

This is useful **provenance of a later attempted notation repair**, but it is assistant-produced reconstruction rather than a Nathan-authored derivation. Under the standing LLM-math provenance rule, its equations remain historical LLM claims unless separately worked through. Most importantly for the present adjudication target, it does **not** define a transformation such as `Q_eff=f(Q_fund,Q_top,b,...)`, nor does it explicitly identify the earlier whole-anchor `Q=3` with the new `Q_eff`. Therefore it narrows the likely nature of the problem—historical symbol overloading followed by a later namespace split—without repairing record C.

## Scoped origin check — Run 134

A direct reread of the primary helium source confirms that the phrases `integrated topological charge` and `effective intersection density`, together with the inverse relation `m_eff ≈ m0/Q`, occur together inside the later `Technical Data Sheet: SAT Nuclear Topology and Mass Scaling` block. In that block He-3 is tabulated as `Q=3.0`; complex nuclei are described in terms of integrated winding/linking; and the prose explicitly says this Q is not a simple nucleon count. This establishes the **local document context** of record C, but not its authorship ancestry or derivation.

A bounded GitHub code-search pass over `Satobloc/SAT_THEORY_ARCHIVE_2023-25` for `integrated topological charge`, `effective intersection density`, and an inverse-Q mass-expression query returned no indexed matches. Under Mercer's standing search-recall caution, these zeroes are only weak scoped search evidence and are **not** repository-wide absence evidence. No claim is made that the terminology originated in this file. The next useful source-first target is therefore the attributable precursor/conversation segment that generated or supplied this Technical Data Sheet block, rather than additional blind code-search zeroes.

## What is established by the sources

The source family explicitly supports a multilevel count: first-order `Q=3` Borromean nucleon/triplet units make a second-order He-3 structure with nine primary filaments and `Q_total=9`. The Q-counting audit also explicitly warns that the fundamental-vertex restriction should not simply be carried unchanged into emergent/world-tube counting.

The later isotope-scaling block introduces a separate whole-anchor usage: He-3 is labeled `Q=3`, Q is described as integrated topological charge/effective intersection density, and mass is written inversely in Q. In the source material recovered through Run 134, no explicit transformation/coarse-graining equation has yet been found that maps this later quantity onto first-order Q=3 constituents or second-order Q=9 He-3. A still-later assistant synthesis does explicitly split the overloaded namespace into `Q_fund`, `Q_top`, and `Q_eff`, but does not supply that missing transformation.

## Do not infer

Do not infer that later whole-anchor `Q=3` is automatically the same variable as first-order nucleon/local `Q=3`. Do not replace `Q_total=9` with `Q=3`, or vice versa. Do not infer that `m∝Q` and `m_eff≈m0/Q` refer to the same mass stage or are mutually repaired. Do not turn the recovered fundamental/emergent distinction into a transformation law unless a source actually states one. Do not treat the later `Q_fund/Q_top/Q_eff` namespace split as retroactively authoritative over earlier sources or as a derivation of record C. Do not treat polished language, an audit document, an assistant synthesis, or this crosswalk as mathematical or physical validation.

## Next adjudication target

Recover the attributable precursor/conversation segment for the `Technical Data Sheet: SAT Nuclear Topology and Mass Scaling` block in `SAT CORE — HELIUM STANDARD ATOM 2.txt`. Determine whether `integrated topological charge` / `effective intersection density` and `m_eff ≈ m0/Q` were Nathan-supplied, assistant-generated, inherited from an attachment, or copied from an earlier source. A negative search is only scoped evidence for the searched corpus, not a global absence claim.
