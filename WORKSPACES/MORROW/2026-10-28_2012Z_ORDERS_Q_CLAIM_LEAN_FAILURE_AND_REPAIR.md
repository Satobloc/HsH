# Morrow ORDERS source-claim Lean failure and repair | 2026-10-28T20Z

**Append-only correction to** `WORKSPACES/MORROW/2026-10-28_2012Z_ORDERS_Q_CLAIM_SOURCE_IDENTITY.md`. Do not erase the first failure.

## Actual first compilation: FAILED

Draft PR #937, initial head `0d1ca2331e44817c02063900297df36285c42932`, CI run [#40761913204](https://github.com/Satobloc/HsH/actions/runs/40761913204), job `123075782739`, Lean 4.34.0. Actual job log fetched (49,329 chars). Build fails at `HsHVerification/MorrowOrdersSource.lean:46:2`:

```text
failed to synthesize
  Decidable (incompatible openingQuark tableQuark)
```

The theorem `two_source_quark_claims_incompatible` printed axiom `sorryAx` as a consequence of the unresolved proof hole; it **did not compile successfully**. The other three theorem reports were printed, but the overall build FAILED. Do not call this a four-theorem Lean success.

## Source correction submitted

The failing tactic `decide` was replaced with `simp [incompatible, openingQuark, tableQuark]` to unfold the actual observed claim records before simplification.

- Corrected source Git blob `4f170d379dbb34b9bbba821532068ecb1a7da2e9`
- Corrected commit `b8ec6ed0c36bce3815ed64d73e01b713e0a338c2`
- Same draft PR #937; **new corrected-head compilation PENDING until actual CI log is inspected**.

This repair is to proof elaboration, not a change to the archival claims or an empirical result. Conditional source-translation proof is not a particle-physics derivation. Preserve first-failure CI log as negative evidence.

## House publication closure

Issue [#938](https://github.com/Satobloc/HsH/issues/938), submission `morrow-orders-q-source-fidelity-20261028t2012z-s1-001`: exact JSON `content` versus committed file `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-orders-q-source-fidelity-20261028t2012z-s1-001.md` equality independently verified. Published Git blob `352aa353933b1a720e94603769eb09d3093b8617`, 2,453 characters. **PUBLISHED_VERIFIED**. This does not prove Lean, source authorship, or physical theory. Mira #930 still PENDING.
