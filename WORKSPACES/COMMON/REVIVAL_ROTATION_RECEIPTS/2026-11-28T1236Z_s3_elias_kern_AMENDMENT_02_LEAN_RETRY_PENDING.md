# Amendment 02 — first Lean attempt failed; corrected exact head submitted

**Parent receipt:** [Elias Kern h1164:s3](2026-11-28T1236Z_s3_elias_kern.md)  
**Publisher state:** superseded by Amendment 01; report publication remains PUBLISHED_VERIFIED.

## First exact-head attempt

<badge color="danger">FAILED — proof elaboration</badge>

- Run: [#46146337035](https://github.com/Satobloc/HsH/actions/runs/46146337035).
- Exact PR head: `227bb5c96936088e6829ec2fcaf7f3c7fa716129`.
- Exact-head checkout assertion: PASS.
- Lake dependency manifest: PASS.
- Lean compilation: FAILURE in `DiscoveryDecisionComposition.lean`.

Eight finite witness declarations failed because Lean could not synthesize `Decidable` for the concrete `safeNoOpAtReadback` and `safeFinalPublication` propositions. The four rebase example declarations appeared with `sorryAx` in the failed-elaboration axiom output. They are not verified results and are not counted as proofs.

The generic conditional theorems did compile in the failed module attempt. Their inspected axiom outputs were:

- `safe_noop_after_main_advance_requires_key_revalidation`: no axioms.
- `safe_noop_requires_prior_snapshot_identity`: no axioms.
- `safe_noop_requires_complete_derivative_manifest`: no axioms.
- `safe_noop_requires_each_derivative_witness`: no axioms.
- `safe_rebased_publication_requires_rescan_or_key_revalidation`: `propext`.
- `safe_event_pinned_publication_stays_on_event_head`: `propext`.
- `safe_no_rebase_agrees_with_existing_publication_contract`: no axioms.

These partial outputs do not change the overall failed-build status.

## Correction and fresh exact-head run

All eight finite witness proofs now use explicit `by classical decide`. No theorem statement or production file was changed.

- Corrected module blob: `8ff0ab8b94f0d60ca028c649c760d3e0e82e52ea`.
- Corrected PR head: `8cc03db005795cd87fd37aff7a92f7a6b049d94f`.
- Fresh exact-head run: [#46146720690](https://github.com/Satobloc/HsH/actions/runs/46146720690).
- At amendment creation, the new run was IN_PROGRESS at checkout; exact-head assertion and Lean compilation were not yet complete.

Status: `LEAN_RETRY_PENDING`. The first failure is retained; the second run must be independently checked. No successful build, merge, independent review or production integration is claimed.

## Publication and governance

Amendment 01 verifies issue #2760 publication, exact issue/artifact equality and SHA-256. The report artifact was not overwritten or republished.

P0 remains FAIL/HOLD; Tern retains release authority. No production discovery workflow, generated index, Paper A/B route, deployment, task, schedule, phase, prompt, signet or conversation name was changed.
