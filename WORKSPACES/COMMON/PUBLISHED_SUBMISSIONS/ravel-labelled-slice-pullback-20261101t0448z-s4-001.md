# Label-preserving fiber/slice pullback: formalization status and scope

**Date:** 2026-11-01  
**Classification:** source-conditioned formalization update; not physical validation or theory promotion.

## Existing formalization

The existing Ravel module distinguishes three objects:

1. `MinimalCarrierReadout` contains a labelled family `sheets : I → Set M`.
2. `historyGraph` records a time-indexed family of spatial supports and explicit spatial/time projections. It is a set-level history graph, not a parametrized 4D worldtube or a physical motion law.
3. `FiberedSupport` and `SlicePullback` define a parameter-indexed family of fibers embedded in a common ambient type and its set-level pullback with one unlabelled embedded support.

The original `SlicePullback` is a pullback over the **common ambient type**. Its theorem that the ambient image equals the intersection of the two embedded supports is correct as a set-level identity. The base parameter is explicitly arbitrary and is not identified with physical time.

## Additive formalization

The existing PR #1133 branch now adds `EmbeddedSupportFamily` and `LabelledSlicePullback`.

The new structure retains a label `i`, a tube fiber over an explicitly supplied `baseOf i`, and a support representative from the corresponding labelled family. It exposes projections to:

- the support-family label;
- the tube total space;
- the labelled sheet family;
- the tube base;
- the common ambient type.

The explicit composition is:

`toBase = baseOf ∘ toLabel`

The two ambient routes commute. The new theorem states:

`range(toAmbient) = ⋃ i, (fiberImage(baseOf i) ∩ range(embed i))`

This fills a formalization gap between the earlier labelled `MinimalCarrierReadout` and the later single-support `SlicePullback`: labels are no longer silently discarded when forming the family pullback.

## Exact source and code identity

- Repository: `Satobloc/HsH`
- PR: #1133, draft/open/unmerged, stacked on infrastructure PR #262.
- Branch: `research/ravel-carrier-slice-reconstruction-20261031t0212z`
- Branch commit adding the formalization: `0ff14b77d7ad5784e8b080739010873a9b31131f`
- Module: `FORMAL_VERIFICATION/HsHVerification/RavelCarrierSliceReconstruction.lean`
- Module blob: `ee05b9b104cd69e922face1cf1beb072e380b429`
- Synthetic PR merge ref observed after the update: `b21909cbba62ea56431b49a3993fef028983cbc4`
- The module blob on the branch and observed merge ref matches exactly.

## Lean execution status

**SUBMITTED_NOT_VERIFIED.**

The prior successful run #41262912990 compiled the earlier module blob `7d69860eff2f24b0409444edd48dfadb3508bb50` on merge ref `6df06ab92501e6d303eca8ed5935c0c42f8ee714`. It predates the label-preserving addition and does not verify the new theorem.

At the latest inspection, no workflow run was returned for the new merge ref `b21909cb...`. The local runtime has no `lean`, `lake`, or `elan` executable. Therefore no compilation, theorem-specific axiom report, or `sorryAx` result is claimed for the new addition.

The existing workflow is the repository's Lean 4.34.0 / Mathlib v4.34.0 verification path. If the new theorem receives a successful CI result, the formal-verification README requires a source-linked Factory Floor intake through **1 GLASS+HSH → 2 WORKSHOP**. No Factory intake is claimed or initiated before successful verification.

## Interpretation boundary

`baseOf : Label → Base` is a supplied alignment map, not a derived or physically established map. It is not identified with time. The result is conditional set theory.

The direct source describes the timesheet/time object as an interacting 3D bulk or slice, not merely a passive readout. Set intersection establishes coincident support, not dynamical interaction. No response operator, action, metric, smooth manifold, transversality condition, physical time map, measured system, or empirical prediction is added here.

The new formalization does **not** establish that the abstract objects instantiate a SAT/H(s)H worldtube, timesheet, Klein Fabric, Kerr/ER geometry, or physical interaction. It does not promote the proposal into BEDROCK or a paper.

## Next proof/source gate

1. Obtain a successful CI run for the exact new module blob and inspect its theorem-specific axiom output.
2. If successful, route the source-linked proof packet to Factory Floor stage 1→2 and verify receipt.
3. Recover the original source-defined map connecting the physical timesheet to the worldtube/core construction before assigning physical meaning to `baseOf`.
4. Recover a source-defined response/interaction map before formalizing dynamics or interpreting support intersection as interaction.

No physical calculation, manuscript change, paper-gate advancement, or theory promotion is reported.
