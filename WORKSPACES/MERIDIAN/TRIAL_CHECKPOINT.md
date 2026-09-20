# Meridian — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE / hourly :28 / autonomy protocol active / direct theory sandbox-limited  
**Authority:** newer explicit Nathan directives and Common controls govern.

## Hard controls
- Never rename/retitle/suggest renaming a user-visible conversation/thread/chat.
- Never reproduce or imitate Nathan's protected signet; perform the pre-send/output gate.
- Direct theory-bearing work remains sandboxed.
- nLab/PRIOR_ART/quarantine remain off-limits to Meridian.
- Current solver names are not projected backward onto unnamed antecedents without comparison.
- Suspended Integration-lane handoffs remain suspended unless reauthorized.
- Math status follows `WORKSPACES/MERIDIAN/LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`; local defects are not automatically disclaimers.

## Role / current direction
Source-first SAT geometric-solver work: Whirligig/Donut, UI/TX, Three Spheres, Hagalaz integration, exact maps/operators/representations/equivalences, reproducible controls, failures, representation invariance, and source history. Kerr/Kelvin remain distinct live H(s)H hypothesis lines.

Nathan moved this lane from predominantly archaeological recovery into constructive mathematical reconstruction while preserving provenance. Practical goal: efficient handling of hyper/superhelical architecture. Architecture checks are instrumentation; actual helical/equation throughput is the research product. GR↔QM remains a flagship target only after simpler machinery can discover useful shared transformations without being hand-fed the answer.

## Constructive artifacts / run sequence
- `WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md`
- `RUN_061_4D_DONUT_STEREOGRAPHIC_BRIDGE.md`
- `RUN_062_HOPF_CARRIER_CONNECTION_KERNEL.md`
- `RUN_063_CONNECTION_DECODER_AND_PARITY.md`
- `RUN_064_NESTED_FRAME_THROUGHPUT_BENCHMARK.md`
- `RUN_065_NESTED_EQUATION_GEOMETRY_CONTROL.md`
- `RUN_067_FOUR_MOMENT_DECODER_CONDITIONING.md`
- `RUN_068_DIMENSIONLESS_SEPARABILITY_INDICATOR.md`
- `RUN_069_CONNECTION_IDENTIFIABILITY_GATE.md`
- `RUN_070_CURVE_ONLY_GRAM_RATE_RESOLUTION.md`
- `RUN_071_SAME_SAMPLE_MODEL_SELECTION_BENCHMARK.md`
- `RUN_072_RAW_LINEAR_RECURRENCE_FAILURE.md`

## Durable current findings
- UI master representation: `y(lambda)=r(lambda)R(lambda)x0`, `R in SO(4)`; curve direction alone leaves an `SO(3)` stabilizer unless frame/director data are supplied.
- Whirligig intent: multiple admissible information-conserving curve encodings; compose geometrically; decode a joint description/path; search for a real shared identity. Bending/minimal action is a search criterion, not itself an isomorphism.
- Exact 4D toroidal carrier has compact adapted-frame/connection representation; nested noncommuting frame propagation reproduces direct Cartesian speed/acceleration/curvature at ~1e-15 while avoiding symbolic coordinate blow-up.
- North/south stereographic Donut charts are exact conformal/topological views of the 4D carrier, with chart-parity distinction; 4D remains primary for metric/frame/holonomy work.
- Constant 4D double rotation admits exact four-moment decoder `m_k=A x^k+B y^k`; exact rank determinant `D=AB(x-y)^2`. Equal rates are genuine lower-rank great-circle geometry, not merely decoder failure.
- Native connection carries compact rate/orientation information, but full connection is not identifiable from curve coordinates alone because of stabilizer freedom. Fair comparisons must either supply frame/director primitives or compare curve-identifiable gauge invariants.
- Curve-only lagged Gram kernel `g(tau)=a^2 cos(w tau)+b^2 cos(v tau)` is constant-SO(4)-invariant and independently loses two-rate resolution near equal-rate collapse.
- Run 071 puts derivative moments and Gram fitting on identical noisy 4D samples. With the fixed high-order differentiator tested, derivative moments are far less noise-robust than the nonlocal Gram representation; exact four-moment identity remains valid, but coordinate-level acquisition makes third-derivative estimation expensive.
- A one-mode baseline changes the question usefully from forced parameter recovery to whether observations justify resolving two modes at all.
- Run 072 derived the exact order-4 palindromic recurrence for the two-rate carrier, but naive global OLS on noisy coordinates fails catastrophically because noise contaminates predictors and response and the small-`dt` recurrence columns are nearly dependent. Noiseless decoding succeeds; estimator failure is retained separately from the exact identity.

## Run 072 — raw global linear-recurrence negative control
**Actual start:** 2026-09-20 09:30:37 -04:00. Artifact commit `ad2987f859604aab36ce8a7bec438c93f73849c5`.

**Must-reads reread:** live `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, `COORDINATION.md`, `HANDOFFS.md`, Sable `README.md`, `LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`, and prior checkpoint. New/important current output gate on protected signet was reread and applied. No-conversation-renaming, sandbox, quarantine, and math-status controls remain active. Suspended Integration handoffs were not executed.

**Exact operation:** followed Run 071 cursor with one bounded estimator target. Derived a curve-only order-4 recurrence for each coordinate of the constant double-rotation carrier and fit its two coefficients globally across all four coordinates by ordinary least squares on the identical Run-071 primitive sampling model: `a=1.2`, `b=0.65`, `w=1.1`, 161 samples on `[-2,2]`, `dt=0.025`, iid coordinate Gaussian noise `sigma=1e-4`. Gaps `0.1,0.03,0.01,0.003`; 200 trials each.

**Benchmark/exploration result:** exact/noiseless recurrence decoding recovered the two rates to ~2e-8 in spot checks. Under coordinate noise, naive OLS failed catastrophically: median relative separation errors about `886, 3027, 9082, 30267` across the four gaps. At gap `0.1`, true recurrence coefficients `(3.9986188302,5.9972381330)` became `(0.7026160221,-0.5923720838)` in one noisy realization and decoded rates `[1.07837,91.04734]`. This is classified as estimator failure / errors-in-variables plus near-collinearity, not failure of the exact recurrence identity.

**Status:** sandbox / CLAIMED numerical benchmark; negative control retained. No validation/disclaimer promotion.

**Exact sources/coverage:** current Common controls and checkpoint listed above; mathematical construction generated from established sandbox Runs 067–071. No external literature, historical archive, nLab, PRIOR_ART, quarantine, Kerr, or Kelvin source used.

**Exposure/cross-reading:** no quarantine or external-prior-art exposure. Kerr/Kelvin not used as solver premises.

**Archive/infrastructure:** created `WORKSPACES/MERIDIAN/SANDBOX/RUN_072_RAW_LINEAR_RECURRENCE_FAILURE.md`; refreshed owner-local checkpoint. No public/canonical theory surface changed.

**Enrichment/capability:** added global discrete recurrence representation and an explicit errors-in-variables failure diagnostic; sharpened distinction between exact compact representation and robust acquisition estimator.

**Failures/uncertainties:** naive OLS is unusable here despite exact recurrence. Need a noise-aware structured estimator before comparing recurrence architecture to Gram. No blocker and no Nathan action required.

## Current frontier / next cursor
Implement a noise-aware structured low-rank Hankel / total-least-squares recurrence estimator on the same noisy 4D samples, with no frame/director information. First demand stable two-rate recovery away from collision at `sigma=1e-4`; only if that succeeds compare its model-selection boundary against Run 071 Gram fitting.

Secondary frontier: source-first inspect non-quarantined Whirligig/UI/Hagalaz sources for an independently specified director/frame observation channel before any frame-observation benchmark. Retain stronger blind W6 transformation-discovery test, Pfaffian/holonomy/Graticule invariant constraints, historical ordinary/anti Graticule source check, and later SAT/H(s)H-shaped operator/GR↔QM flagship after sufficient nontrivial controls.

**Handoffs/questions:** none opened this run. No workflow/cadence/ownership redesign proposed.