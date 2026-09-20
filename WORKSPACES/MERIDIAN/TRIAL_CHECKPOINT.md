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

## Durable current findings
- UI master representation: `y(lambda)=r(lambda)R(lambda)x0`, `R in SO(4)`; curve direction alone leaves an `SO(3)` stabilizer unless frame/director data are supplied.
- Whirligig intent: multiple admissible information-conserving curve encodings; compose geometrically; decode a joint description/path; search for a real shared identity. Bending/minimal action is a search criterion, not itself an isomorphism.
- Exact 4D toroidal carrier has compact adapted-frame/connection representation; nested noncommuting frame propagation reproduces direct Cartesian speed/acceleration/curvature at ~1e-15 while avoiding symbolic coordinate blow-up.
- North/south stereographic Donut charts are exact conformal/topological views of the 4D carrier, with chart-parity distinction; 4D remains primary for metric/frame/holonomy work.
- Constant 4D double rotation admits exact four-moment decoder `m_k=A x^k+B y^k`; exact rank determinant `D=AB(x-y)^2`. Equal rates are genuine lower-rank great-circle geometry, not merely decoder failure.
- Native connection carries compact rate/orientation information, but full connection is not identifiable from curve coordinates alone because of stabilizer freedom. Fair comparisons must either supply frame/director primitives or compare curve-identifiable gauge invariants.
- Curve-only lagged Gram kernel `g(tau)=a^2 cos(w tau)+b^2 cos(v tau)` is constant-SO(4)-invariant and independently loses two-rate resolution near equal-rate collapse.
- Run 071 puts derivative moments and Gram fitting on identical noisy 4D samples. With the fixed high-order differentiator tested, derivative moments are far less noise-robust than the nonlocal Gram representation; the exact four-moment identity remains valid, but coordinate-level acquisition makes third-derivative estimation expensive.
- A one-mode baseline changes the question usefully from forced parameter recovery to whether the observations justify resolving two modes at all.

## Run 071 — same-sample curve-only resolution/model-selection benchmark
**Actual start:** 2026-09-20 08:30:12 -04:00. Artifact commit `4c2d9de9bedcfbe701d6fd5b5f64cba084eb1686`.

**Must-reads reread:** live `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, `COORDINATION.md`, `HANDOFFS.md`, Sable `README.md`, `LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`, `SHARED_STATE_WRITE_SAFETY.md`, and prior checkpoint. Current output-gate/signet rule, no-conversation-renaming rule, sandbox boundary, quarantine exclusion, math-status discipline, and Sable workflow authority remain controlling. Suspended Integration handoffs were not executed.

**Exact operation:** followed Run 070's cursor. Both estimators received the same noisy 4D coordinate samples from the constant double-rotation carrier: `a=1.2`, `b=0.65`, `w=1.1`; 161 samples on `[-2,2]`; iid coordinate Gaussian noise `sigma=1e-4`; gaps `0.1,0.03,0.01,0.003`; 40 trials each. Four-moment derivatives used fixed Savitzky-Golay window 41 / degree 7 with edge trimming. Gram used lags 0..60 and bounded two-cosine fits with three fixed starts. A one-cosine Gram fit supplied a BIC baseline.

**Benchmark result:** median relative separation errors (moment / Gram) were `2.55 / 0.157` at gap `0.1`, `72.7 / 0.0469` at `0.03`, `480.6 / 0.227` at `0.01`, and `1845.6 / 0.999` at `0.003`; valid moment decodes fell from `40/40` to `24/40`. Median `Delta BIC = BIC_one-BIC_two` moved from `+571` and `+274` at gaps `0.1/0.03`, to `+57` at `0.01`, to `-8.19` at `0.003`; fraction favoring two modes was `1.0,1.0,0.825,0.325` respectively.

**Status:** sandbox / CLAIMED numerical benchmark. No validation/disclaimer promotion. The moment failure is retained as an estimator result, not interpreted as failure of the exact identity. BIC is not treated as calibrated likelihood evidence because lag residuals are correlated.

**Exact sources/coverage:** current Common controls and checkpoint listed above; mathematical construction generated from established sandbox Runs 067–070. No external literature, historical archive, nLab, PRIOR_ART, or quarantine source used.

**Exposure/cross-reading:** no quarantine or external-prior-art exposure. Kerr/Kelvin not used as solver premises.

**Archive/infrastructure:** created `RUN_071_SAME_SAMPLE_MODEL_SELECTION_BENCHMARK.md`; refreshed this owner-local checkpoint using current blob SHA. No public/canonical theory surface changed.

**Enrichment/capability:** added explicit same-primitive-data estimator comparison and model-selection framing; demonstrated that exact invariant compression and practical acquisition robustness must be tracked separately.

**Failures/uncertainties:** high-order local differentiation is extremely noise-amplifying; Gram optimizer and BIC assumptions remain imperfect; thresholds are observation/estimator dependent. No blocker and no Nathan action required.

## Current frontier / next cursor
Replace pointwise high-order differentiation with a global curve-only spectral/linear-recurrence estimator on the identical noisy samples, and compare its two-mode resolution/model-selection boundary against the Gram fit without supplying frame/director information.

Secondary frontier: source-first inspect non-quarantined Whirligig/UI/Hagalaz sources for an independently specified director/frame observation channel before any frame-observation benchmark. Retain stronger blind W6 transformation-discovery test, Pfaffian/holonomy/Graticule invariant constraints, historical ordinary/anti Graticule source check, and later SAT/H(s)H-shaped operator/GR↔QM flagship after sufficient nontrivial controls.

**Handoffs/questions:** none opened this run. No workflow/cadence/ownership redesign proposed.