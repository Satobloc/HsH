# Amendment 03 — successful Lean merge-reference build

**Applies to:** `2026-11-11T0024Z_LOCAL_GLOBAL_CONVERSION_AND_SOURCE_FIDELITY.md`.

## Verified build

The corrected verification run `42933770097` completed **SUCCESS**.

- Lean: 4.34.0.
- Lake: 5.0.0.
- Full root build: 8,952 jobs, successful.
- `HsHVerification.RavelRepresentationConversionCoherence`: BUILT.
- Root `HsHVerification` aggregator: BUILT.
- Build source/merge commit: `a03cc65099fadfee900c3026c4dfab146075cb23`.
- Merge commit message: merges PR head `aa13715efd5dbd90432cd619cf410be7928e8b82` into parent PR #262 head `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- New module blob at PR head and merge ref is identical: `c7fbd81a8730a66f3b6e0cfc8c012d0fcd6e03da`.
- The merge-ref aggregator differs from the PR-head aggregator because of the base merge, but both contain the new module import.

## Theorem-specific axiom output

The six new declarations all compiled. Their actual `#print axioms` output is:

| Declaration | Reported axioms |
|---|---|
| `conversion_round_trip_source` | `Quot.sound` |
| `conversion_round_trip_target` | `Quot.sound` |
| `conversion_path_independent` | `Quot.sound` |
| `observable_after_evolution_independent` | `Quot.sound` |
| `identity_conversion_does_not_force_dynamics_compatibility` | `Quot.sound` |
| `identity_conversion_does_not_force_readout_invariance` | `Quot.sound` |

No `propext`, `Classical.choice`, `native_decide`, `sorryAx`, or `admit` appears in the new module's theorem-specific output/build log. `Quot.sound` is inherited from the existing quotient-based `FiberTransport` construction; this is **not** an axiom-free result.

Tests and lint were skipped. Nanoda, leanchecker, reservoir eligibility, and the separate global axiom audit were skipped. No global axiom-free claim is made.

**Classification:** `MERGE_REF_BUILD_SUCCESS`; not an exact-head-only build. The module blob itself is identical at PR head and merge ref.

## Review and epistemic limits

PR #1133 remains OPEN / DRAFT / UNMERGED, with no independent review. Parent PR #262 remains open/non-mergeable and is not integrated into main. PR metadata still reports base SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`, while the actual merge commit used parent head `c7dc2c483f50ae03fc7a7c530829170135e18d92`; preserve this metadata/merge-ref discrepancy.

The theorem proves only the conditional mathematical interface: coherent invertible conversion, evolution intertwining, and observable naturality imply representation-independent evolved readout. The abstract Bool witnesses show conversion alone is insufficient. No topology/continuity, physical state space, wave equation, time-field variable, metric/action, instrument, units, or measured-system instantiation exists. No physical prediction or validation follows.

No rebase, retarget, merge, new PR, public issue, or theory promotion was performed.
