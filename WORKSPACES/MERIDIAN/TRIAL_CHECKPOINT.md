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
- `RUN_073_BLOCK_HANKEL_TLS_FAILURE.md`

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
- Run 073 replaces OLS with block-Hankel TLS plus palindromic projection. This removes the narrow OLS formulation defect but still fails catastrophically under the same coordinate noise; adjacent-sample recurrence acquisition remains dominated by clustered roots/near-dependent Hankel columns at `dt=0.025`.

## Run 073 — block-Hankel TLS negative control
**Actual start:** 2026-09-20 10:30:11 -04:00. Artifact commit `8c245a0f9d013b1931c76530a00fe058ca28817a`.

**Must-reads reread:** live `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, `COORDINATION.md`, `HANDOFFS.md`, relevant Sable/Meridian response, `LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`, and prior checkpoint. Current protected-signet output gate reread and applied. No-conversation-renaming, sandbox, quarantine, and math-status controls remain active. Suspended Integration handoffs were not executed.

**Exact operation:** followed Run 072 cursor with one bounded estimator target. Built a stacked five-column Hankel matrix from all four coordinate series; took the smallest right singular vector as a TLS annihilating-filter estimate; projected it onto the exact palindromic family `[1,-s1,s2,-s1,1]`; decoded the two rates. Same primitive sampling model as Run 072: `a=1.2`, `b=0.65`, `w=1.1`, 161 samples on `[-2,2]`, `dt=0.025`, iid coordinate Gaussian noise `sigma=1e-4`; gaps `0.1,0.03,0.01,0.003`; 400 trials each.

**Benchmark/theory/exploration result:** noiseless recovery succeeds (`0.1 -> [1.0,1.1]`; `0.03 -> [1.06999997,1.10000003]`). Under coordinate noise, median relative separation errors are approximately `320.1, 2428.6, 8520.3, 27905`, with valid decode counts `398/400,399/400,400/400,400/400`. Thus generic block-Hankel TLS does not rescue the adjacent-sample recurrence acquisition. This is an estimator/conditioning negative result, not failure of the exact recurrence identity and not a claim about all structured low-rank/subspace estimators.

**Status:** sandbox / CLAIMED numerical benchmark; negative result retained. No validation/disclaimer promotion.

**Exact sources/coverage:** current Common controls and checkpoint listed above; mathematical construction generated from established sandbox Runs 067–072. No external literature, historical archive, nLab, PRIOR_ART, quarantine, Kerr, or Kelvin source used.

**Exposure/cross-reading:** no quarantine or external-prior-art exposure. Kerr/Kelvin not used as solver premises.

**Archive/infrastructure:** created `WORKSPACES/MERIDIAN/SANDBOX/RUN_073_BLOCK_HANKEL_TLS_FAILURE.md`; refreshed owner-local checkpoint. No public/canonical theory surface changed.

**Enrichment/capability:** added a block-Hankel/TLS acquisition test and separated errors-in-variables repair from the deeper small-lag root-clustering/conditioning problem.

**Failures/uncertainties:** the tested TLS estimator remains unusable at the present adjacent-sample lag. More sophisticated structured low-rank/subspace methods may differ. No blocker and no Nathan action required.

## Current frontier / next cursor
Test **lag/decimation as the conditioning variable** while retaining the exact palindromic recurrence architecture: use stride `L` five-point windows, scan a bounded set of `L`, and demand stable recovery first at the easy gap `0.1`, `sigma=1e-4`. Only if a reasonable lag restores stability proceed toward collision/model-selection comparison. If it does not, retain Gram as the practical curve-only baseline and return the next bite to source-first Whirligig/UI/Hagalaz representation work.

Secondary frontier: source-first inspect non-quarantined Whirligig/UI/Hagalaz sources for an independently specified director/frame observation channel before any frame-observation benchmark. Retain stronger blind W6 transformation-discovery test, Pfaffian/holonomy/Graticule invariant constraints, historical ordinary/anti Graticule source check, and later SAT/H(s)H-shaped operator/GR↔QM flagship after sufficient nontrivial controls.

**Handoffs/questions:** none opened this run. No workflow/cadence/ownership redesign proposed.

## Run 074 — environment scan / Mersearch role reset
**Actual start:** 2026-09-20 10:49 -04:00.

**Must-reads reread:** live `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, current `COORDINATION.md`, `HANDOFFS.md`, `CHECKINS.md`, Sable workspace inventory/current systems surfaces, and this checkpoint. New hard pre-send signet gate remains active. No conversation-title action taken. Quarantine remains untouched.

**Operation / environment finding:** paused the next equation benchmark to inspect the project around Meridian after Nathan's prompt. Recent repository history shows a material infrastructure transition: Mersearch/Mercer_Searcher 1.0 is now a pinned green worker release at ref `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`; Common now explicitly greenlights it for research-worker archive discovery/provenance-bearing retrieval. Development is simultaneously moving toward indexed multi-reader architecture, API/human clients, file/record modes, facets, math-expression search, source/conversation relations, chronology, and public allowlisted profiles. The throughput plan is explicitly designed for five round-the-clock recurrence loops plus interactive research: build/update once, search many times, immutable index generations, atomic publication, concurrent readers, and source-boundary enforcement at index/profile construction.

**How this changes Meridian's job:** source-first solver work no longer needs to treat archive archaeology as a mostly bespoke/manual prelude. Meridian should use the pinned stable Mersearch release for targeted Whirligig/UI/TX/Three-Spheres/Hagalaz source recovery, terminology/ancestry queries, derivation-chain discovery, math-notation retrieval, and provenance-bearing candidate generation, then inspect underlying raw sources before consequential historical/currentness/mathematical claims. This raises the information value of returning from prolonged synthetic representation benchmarking to source-grounded solver reconstruction. The next equation benchmark remains useful but is no longer automatically the highest-value next operation.

**Representation/library implication:** Mersearch itself is becoming part of the representation problem Meridian studies: one archive, multiple information-conserving query/output representations, explicit provenance, stable-vs-development semantics, source-representation relations, and machine/human clients. Meridian can contribute solver-shaped acceptance cases (equation/notation variants, alias boundaries, derivation chains, negative retrieval controls) without taking over Mercer's ownership or Sable's workflow authority.

**Archive/infrastructure:** no Mersearch code changed by Meridian. Checkpoint records adoption posture and avoids duplicating Mercer development. Stable 1.0 limitations remain controlling: notation normalization is not algebraic equivalence; chronology is not supersession/currentness; duplicate exports are not yet canonicalized; search hits do not establish authority/correctness.

**Exposure/cross-reading:** no PRIOR_ART/nLab/quarantine content accessed. Recent Common/Sable/Mercer infrastructure surfaces only; no Kerr/Kelvin theory premise imported.

**Enrichment/capability:** Meridian now has an explicit project-native reproducible retrieval substrate to pair with geometry/solver work, reducing dependence on ad hoc archive search and enabling tighter source↔operator↔benchmark linkage.

**Failures/uncertainties:** direct CLI execution is not available inside this connector-only runtime; the stable release can still be treated as canonical worker tooling and its repository/source outputs inspected through available GitHub/Library surfaces. Development `main` must not be mistaken for the green worker release.

## Revised current frontier
First priority is now a **source-first Mersearch-assisted solver archaeology pass**: recover exact non-quarantined Whirligig/Donut, UI/TX, Three Spheres, and Hagalaz source statements/derivations, especially any independent frame/director observation channel and exact representation/equivalence language; crosswalk them against Runs 061–073 without retrofitting current names onto unnamed antecedents. Use stable 1.0 semantics and retain raw-source follow-through. Then choose the next synthetic benchmark from what the recovered solver actually requires. The stride/decimation recurrence test remains queued as a bounded negative-control continuation, not the automatic next task.

**Handoffs/questions:** no Nathan action required. Potential Meridian contribution to Mersearch is solver/math retrieval acceptance cases; consult Mercer/Sable before changing shared search semantics or ownership.
