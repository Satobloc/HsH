# Meridian run — minimal Whirligig restricted-class benchmark specification

**Run start:** 2026-09-20 00:30 EDT  
**Status:** benchmark design from source-frozen historical contract; no mathematical validation or theory promotion  
**Sandbox/quarantine:** no PRIOR_ART/nLab/quarantine exposure; no external literature imported; held-out GR↔QM case untouched.

## Startup / controls
Reread `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `CURRENT_HSH_HYPOTHESIS_STATUS_2026-09-14.md`, current `COORDINATION.md`, `HANDOFFS.md`, `WORKSPACES/SABLE/README.md`, `WORKSPACES/MERIDIAN/LLM_MATH_PROVENANCE_VERIFICATION_PROTOCOL.md`, the available current portion of `WORKSPACES/MERIDIAN/TRIAL_CHECKPOINT.md`, and `SHARED_STATE_WRITE_SAFETY.md` before writing. Newer Nathan directives control. Suspended Integration handoffs remain suspended. No conversation-title action taken.

## Exact source coverage
Primary continuity artifact: `WORKSPACES/MERIDIAN/RUN_2026-09-19_2330_WHIRLIGIG_OUTPUT_CONTRACT.md`, which source-typed the historical ReDonut contract into three independently scorable outputs: relationship, parameter recovery, and source-component recovery.

Primary historical content rechecked through Library search: `SAT 2026 WHIRLYGIG — ReDonut.txt` as reproduced in archived conversation material. Relevant claims: opposite-hemisphere encoding of two periodic inputs `Q(t), R(t)`; rolling/toroidal synthesis; Lissajous-like composite; closure for rational frequency ratios; extraction of frequency ratio and phase from toroidal coordinates; projection/deconvolution back to original sinusoidal components; and the claim that the composite represents `QwrtR`. This run does not treat those claims as presently verified.

## One bounded operation
Freeze the smallest nondegenerate input pair and scoring contract for a first reproducible Whirligig/Donut benchmark. Do **not** reconstruct missing historical mechanics in the same bite.

## Benchmark B0 — input pair
Use one common parameter `t ∈ [0, 2π)`:

`Q(t) = 2 cos(t)`

`R(t) = 3 sin(2t + π/3)`

Why this pair:
- both are closed periodic oscillators, matching the ReDonut restricted class;
- frequency ratio is rational and relatively prime: `1:2`;
- amplitudes differ (`2`, `3`), so amplitude recovery cannot pass by symmetry/default normalization;
- phase is nonzero and nonquadrature (`π/3`), so phase recovery is genuinely exercised;
- the pair closes over `2π` and is simple enough for exact/numerical cross-checks;
- it is not the held-out GR↔QM case and imports no physical interpretation.

The reference parametric derivative, for the relationship-level score only, is

`dQ/dR = (-2 sin t) / (6 cos(2t + π/3)) = -sin(t) / [3 cos(2t + π/3)]`

where the denominator is nonzero. Singular parameter values must be masked/handled explicitly rather than silently smoothed away.

**Math status:** this derivative is a fresh Meridian calculation and is `CLAIMED` pending an independent check; it is not a validation of the historical `QwrtR` claim.

## Three independent scores

### B0-A — parameter recovery
From the composite output alone, recover, up to declared equivalence:
- frequency ratio `1:2`;
- amplitudes `2` and `3` if the historical operator claims amplitude retention;
- relative phase `π/3` modulo the equivalence rules below.

Pass/fail must report each parameter separately. A frequency-ratio pass cannot conceal phase or amplitude loss.

### B0-B — source-component recovery
Decode two component signals and compare them to `Q` and `R` over a dense common grid. Score after optimizing only over equivalences declared *before* execution:
- common cyclic reparameterization `t -> t+t0`;
- reversal `t -> -t` only if the recovered historical operator itself is orientation-blind;
- exchange of the two channels only if hemisphere/channel labels are not retained by the operator.

Do **not** allow arbitrary monotone reparameterization, independent phase shifts of the two channels, arbitrary amplitude rescaling, or post-hoc filtering; those operations could manufacture recovery.

Recommended numerical score once executable: normalized RMS error for each recovered component plus Fourier peak/amplitude/phase error. Preserve the raw decoded curves.

### B0-C — relationship recovery
Compare the decoded relationship claimed by the composite against the reference parametric derivative on nonsingular samples. Record separately:
- pointwise/normalized RMS discrepancy on the finite domain;
- whether singular locations are reproduced at the correct parameter values;
- whether the output preserves sign changes and branch structure.

This tests the historical `QwrtR` output claim without assuming that source recovery must succeed first.

## Representation-invariance extension — B0-R
The historical Nathan instruction permits *an* information-conserving curve rather than one canonical representation. Therefore the first executable benchmark must use at least two admissible encodings of the same B0 inputs. However, **this run does not invent those encodings**: the historical admissibility/information-conservation rule and actual Donut operator must be recovered first.

Freeze the comparison rule now: raw torus traces need not be identical. After decoding and quotienting only the predeclared equivalences above, B0-A/B/C outputs should agree within numerical tolerance. Every encoding-specific choice counts in the intervention budget.

## Intervention budget
Record separately:
1. input-to-curve encoding choices;
2. hemisphere/channel assignment;
3. sphere/torus radii and initial contact/orientation;
4. rolling/no-slip convention;
5. phase synchronization convention;
6. sampling density/integration step;
7. decoder/projection choices;
8. any optimization used in quotienting equivalences.

No parameter may be tuned against the known answers (`1:2`, `2`, `3`, `π/3`, or the derivative curve) and still count as an independent recovery.

## Failure / uncertainty
This is a benchmark **specification**, not an execution. The currently recovered ReDonut prose does not yet supply a trustworthy executable rolling/contact map and decoder sufficient to run B0 without adding substantial Meridian-authored machinery. Inventing that machinery now would confound historical solver performance with repair performance. The next bite should therefore recover the smallest historical operator specification needed to instantiate B0, or freeze the exact missing arrows if no such source is found.

## Archive / capability result
The benchmark now has a fixed nondegenerate test pair, predeclared equivalence budget, three separable outputs, singularity handling, and an intervention ledger. This is enough to prevent post-hoc success criteria from drifting while historical operator recovery continues.

## Exposure / cross-reading
No Kerr/Kelvin construction material, nLab, PRIOR_ART, quarantine, external literature, or suspended Integration handoff was read. Historical ReDonut content was reached through ordinary Library/archive material only.

## Current frontier / next cursor
Recover the **minimal historical Donut operator** for B0: explicit map from the two encoded periodic curves to sphere motion/contact trace/toroidal coordinates and the corresponding decoder. Do not repair or generalize it in the same pass. Once recovered, execute B0 exactly as frozen here before any representation-invariance variant or GR↔QM test.

## Checkpoint/write note
`TRIAL_CHECKPOINT.md` remains too large for the connector to return as a complete safe replacement body. Under `SHARED_STATE_WRITE_SAFETY.md`, do not reconstruct/overwrite a semantic checkpoint from a truncated fetch. This run record is the durable owner-local continuation for this bite; checkpoint consolidation awaits a safe append/patch or complete-current-content path.

## Handoffs / Nathan attention
No workflow redesign, Sable ownership change, or Nathan action required.
