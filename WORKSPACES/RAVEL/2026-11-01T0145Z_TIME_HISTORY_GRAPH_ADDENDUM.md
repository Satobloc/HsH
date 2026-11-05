# Ravel | Time-indexed spatial history and product-space dimension lemma

**Status:** Three set/product-space results are verified on the existing PR #1133 merge references. No physical claim or theory promotion is made.

## Formalized structure

For a time-indexed family of spatial supports S_t subset X, define H = {(x,t) in X x T : x in S_t}.

The existing Ravel formalization defines the history graph, time-labelled history points, spatial projection, time projection, and time slice.

The first two theorems establish:
1. The time slice of the history graph at t recovers exactly S_t.
2. If the same spatial point x belongs to S_t1 and S_t2 for distinct times, then the spatial projection (x,t) -> x is not injective on history events.

A third theorem proves, for a finite-dimensional real vector space V, dim(V x R) = dim(V) + 1. This is a product-space theorem only; it does not prove that a physical history is a smooth product manifold.

## Verification

- PR #1133.
- First commit: 2523f2c4517872045f72e3b589d0498a5eb6f659.
- First Actions run #41261202834 / job #124714661505: SUCCESS.
- First merge reference: fc9e94908c4ce651f2f1abe2e7d59c52ef4e56a5.
- Second commit: d63e788d39d2ac0f2c161eee64d05b4c1987506e.
- Second Actions run #41261628435 / job #124715902852: SUCCESS.
- Second merge reference: 5f339721beff6de5a5133d697540af65203c1c7e.
- Both target module blobs matched their PR-head blobs; both builds completed 8,945 jobs.
- The spatial-projection noninjectivity theorem has no axioms; slice equality uses propext and Quot.sound; product-space theorem uses propext, Classical.choice, and Quot.sound.
- No sorryAx appears in the retrieved logs.
- lake test, lake lint, nanoda, and the automated axiom-audit stage were skipped.

## Dimensional boundary

Under separate regular-product and transversality assumptions, a k-dimensional spatial support carried through one time dimension is expected to have a (k+1)-dimensional history. Its transverse intersection with a 3D hypersurface in 4D is expected to be k-dimensional:

| Spatial support | History | 3D transverse trace |
|---|---|---|
| Point | 1D worldline | 0D |
| 1D coil centerline | 2D worldsheet | 1D |
| 2D spatial surface | 3D worldvolume | 2D |
| 3D finite core | 4D worldtube | 3D |

These are conditional dimension expectations, not empirical measurements or a proof that the physical SAT/H(s)H object has the assumed regularity.

## Source boundary

The public flattened May 2026 SAT++ transcript lacks raw role/message metadata, so it is not used here as authenticated direct attribution. Later October 9–10 raw user-role messages in the HsH Meridian Free Build export distinguish a helical core, a hollow outer coil, a 4D filament, a 3D intersectional trace, and a time surface described as an interacting 3D bulk. An October 20 raw user-role message says the earlier reciprocal filament-only/timesheet-only description is no longer the current model since Klein Fabric became common.

The formalization does not define the expansion map, propagation-only control, centerline-to-core thickening map, or physical response operator. Those remain open.

Related existing work: PR #1133, PR #873, PR #734, and published issue #1165. This is a narrow time-history projection and product-space addition, not a replacement for those broader audits.
