# Ravel sandbox checkpoint: causal intersection-scar dispersion

**Status:** GEN/CANDIDATE — exploratory construction, not canonical H(s)H.

## Result in one sentence

If a finite-core SAT worldtube is resolved through a physical structure rather than merely drawn on an abstract hypersurface, the smallest causal version of the old “scar then healing” image is a spatially dispersive relaxing field on that resolving structure; it predicts a relaxation pole and loss peak affine in spatial mode number squared, a discriminator absent from a lumped single-time hysteresis model.

## Provenance and actual read coverage

### Controlling onboarding / workflow

Read in `Satobloc/HsH`:

- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — complete file, blob `2e788d4a6338d8b3795702e3937df2647730d1e5`.
- `WORKSPACES/COMMON/REFERENCE_DESK/README.md`, `CURRENT_WORKFLOW_ORIENTATION_V2.md`, `TASK_BRANCH_GRAPH.json`, `NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`, `terminology/SYMBOL_REGISTRY.md`, `CITATION_AS_DEFAULT_POLICY.md`, `TOOLBOX_INGESTION_NAMESPACE_PRIORITY.md`, `terminology/TOOLBOX_NAMESPACE_LEDGER.md`, `MERSEARCH_RELEASES.md`, `MERSEARCH_RESEARCH_PLATFORM.md`, `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`, and `SHARED_STATE_WRITE_SAFETY.md` — current routing, symbol, provenance, Mersearch, execution, and safe-write instructions.
- `WORKSPACES/RAVEL/CONTINUITY.md` and `WORKSPACES/RAVEL/STATE.md` — current Ravel state.

The requested HSH_RESOURCES packet was treated as routing/tool familiarity, not as theory authority. No packet claim was imported into the mechanism below.

### Required HsH source

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATO_4D_assessment.txt` — complete file read, blob `24c3f52349300b3dc0fa1ccab46f1ab35a574774`. The materially used passage distinguishes a helix axis from its local tangent, then proposes a vibrating filament meeting a time interface, leaving a temporary “scar” while the supporting medium heals. The file supplies imagery and qualitative relaxation, not a constitutive equation.

### Required old-archive source

- `SAT_THEORY_ARCHIVE_2023-25/HsH Classic Run.txt` — sequential lines 1–1600 read, blob `02bcd4f48644a915bc4454945170c7bb296ce9ee`. The covered material includes coiling memory, pastward back-pull, centrifuge/projective-resistance apparatus, “Cross-Temporal Tug: Worldline Tension,” proposed spin hysteresis, and the source’s own warning that its mixed-stage material must be audited rather than accepted. The file extends beyond the read window; no claim of complete-file coverage is made.

### Discovery record

A bounded Mersearch request was written to `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` as request `2026-10-07-ravel-temporal-memory-apparatus-001`, commit `f7852b81eb0f14a01ef7589039f946eb04d1579a`. The expected result manifest was still absent when checked, so no unreturned Mersearch hit is treated as evidence. Direct repository search was used only to locate the exact files above; conclusions rely on the underlying file reads, not search excerpts.

## Clean epistemic boundary

### Source facts

1. The old material repeatedly considers extended 4D histories, deformation or “coiling” memory, delayed resistance, rotating apparatus, and hysteretic response.
2. The September 30 HsH conversation explicitly offers a temporary interface scar followed by healing/relaxation.
3. Neither selected source supplies a causal field equation, a Green function, or a spatial-mode discriminator for that proposal.

### Ravel inference

If the readout is a physical intersection between a finite-core worldtube and a resolving structure, then “scar” must denote a degree of freedom carried by that structure, not an edit to an already-complete past. A history representation may be globally constrained while the apparatus response remains retarded. This removes any need to interpret a symmetric static 4D profile as backward signaling.

### New sandbox conjecture

Let (h(\xi,t)) be the scalar amplitude of the least-damped deformation mode on the resolving structure, (p(\xi,t)) the local load deposited by the finite-core intersection, (\tau_s>0) its relaxation time, (\ell_s>0) its lateral healing length, and (\alpha_s) a coupling. The minimum stable causal law is

\[
\tau_s\,\partial_t h+h-\ell_s^2\partial_\xi^2h=\alpha_s p.
\tag{1}
\]

This is deliberately ordinary linear response. H(s)H enters only through the proposed identification of (p) with worldtube–resolver intersection load. The PDE itself earns no exotic interpretation.

## Geometry and response

For (p=P_q e^{iq\xi-i\omega t}), equation (1) gives

\[
H_q(\omega)\equiv\frac{h_q}{P_q}
=\frac{\alpha_s}{1+(\ell_s q)^2-i\omega\tau_s}.
\tag{2}
\]

The free decay pole is

\[
s_q=-\frac{1+(\ell_s q)^2}{\tau_s},
\qquad
\tau_q=\frac{\tau_s}{1+(\ell_s q)^2},
\tag{3}
\]

and the phase lag is

\[
\arg H_q=\tan^{-1}\!\left(\frac{\omega\tau_s}{1+(\ell_s q)^2}\right).
\tag{4}
\]

For a real harmonic drive (p_q=P_0\cos\omega t), the magnitude of the load–deformation loop area is

\[
|W_q|=\pi\alpha_s P_0^2
\frac{\omega\tau_s}
{[1+(\ell_s q)^2]^2+(\omega\tau_s)^2}.
\tag{5}
\]

Therefore the loss maximum obeys the tight relation

\[
\boxed{\omega_{\rm pk}(q)\tau_s=1+(\ell_s q)^2.}
\tag{6}
\]

The causal Green function of the homogeneous operator, with (D_s=\ell_s^2/\tau_s), is

\[
G_R(\xi,t)=\Theta(t)\frac{e^{-t/\tau_s}}
{\sqrt{4\pi D_s t}}
\exp\!\left[-\frac{\xi^2}{4D_s t}\right].
\tag{7}
\]

The response to the load is (h=(\alpha_s/\tau_s)G_R*p). Thus the model has no pre-response. By contrast, a symmetric static boundary profile such as (e^{-|\xi|/\ell_s}) is a configuration solution, not a retarded propagator. Confusing the two is precisely what would manufacture an apparent past-directed force.

## Competing architectures

| Architecture | Minimal response | Decisive behavior |
|---|---|---|
| Lumped scar | (\alpha_0/(1-i\omega\tau_0)) | Same pole for every spatial pattern |
| Dispersive resolver scar (candidate) | equation (2) | Pole and loss peak affine in (q^2) |
| Pure static 4D constraint | real (H_q(0)), no constitutive clock | No phase lag or relaxation transient |
| Ordinary apparatus mechanics | full finite-element transfer function | Geometry-dependent resonances, damping, and thermal/EM couplings; must be subtracted before any H(s)H reading |

The apparatus is retained even though some historical interpretation around it is speculative. What is discarded is only the unsupported inference from “memory” to backward influence. The drive, resolver, parity reversals, and complex-response measurement remain useful.

## Blind solver test

`timesheet_scar_dispersion.py` generated synthetic complex data from equation (2) for training modes (q=1,2), 18 log-spaced frequencies from 0.09 to 12, and per-quadrature Gaussian noise (2\times10^{-4}). It fitted the three-parameter candidate and a two-parameter (q)-independent null, then predicted a preregistered withheld mode (q=3).

| Quantity | Result |
|---|---:|
| Truth ((\alpha_s,\ell_s,\tau_s)) | (0.075, 0.34, 0.82) |
| Recovered | (0.074900, 0.339430, 0.818808) |
| (\Delta\mathrm{AIC}), candidate over null | 429.71 |
| Withheld (q=3) complex RMS, candidate | (2.684\times10^{-4}) |
| Withheld (q=3) complex RMS, null | (1.604\times10^{-2}) |
| Null/candidate withheld-error ratio | 59.74 |
| Fitted (q=3) pole | -2.48766 |
| True (q=3) pole | -2.48829 |

This is a code-and-identifiability check, not evidence that nature uses equation (1).

## Apparatus/calculation proposal

Drive one resolver/specimen in at least three calibrated spatial harmonics with matched total injected energy. This could be patterned torque, pressure, or electrical actuation, provided the load pattern (q) is independently measured. Record the complex force–displacement or drive–readout transfer function over frequency.

1. Fit (q=1,2) jointly to equation (2).
2. Freeze (\alpha_s,\ell_s,\tau_s) and predict (q=3).
3. Compare against a (q)-independent relaxer and a pre-registered thermo-electromagnetic finite-element model.
4. Repeat under drive reversal, rotation reversal, charge/spin parity changes where physically available, resolver-thickness changes, and detector-orientation changes.

The first target is not an anomalous constant or particle label. It is the structural law (\omega_{\rm pk}=\tau_s^{-1}+(\ell_s^2/\tau_s)q^2).

## Failure gates

Reject this scalar mechanism if any of the following survives calibration uncertainty:

- decay poles or loss maxima are not affine in (q^2);
- the withheld (q=3) prediction does not beat the lumped null;
- extracted (\ell_s,\tau_s) drift incompatibly across nominally equivalent readout geometries;
- a pre-response appears, violating the retarded kernel assumed here;
- a converged finite-element implementation fails to reproduce equations (2)–(7) in the linear uniform limit;
- ordinary mechanical resonance, detector phase, thermal diffusion, or electromagnetic pickup explains the entire response.

The last outcome would not make the historical apparatus worthless; it would make it a successful null test with no residual warranting an H(s)H interpretation.

## Cross-pollination after construction

Only after deriving equations (1)–(7), I read `WORKSPACES/RAVEL/SANDBOX_2026-10-07_DAMPED_SO4_FRAME_MEMORY.md` completely (blob `4e784a80cfa6cb14d5edec0ba8684dc3a1318817`). Its stated next cursor was to replace an imposed single-time relaxation law by a finite-rod constitutive equation and inspect the lowest transverse mode. Equation (1) supplies that minimal constitutive replacement: the earlier single (\tau_r) becomes the measurable spectrum (\tau_q=\tau_s/[1+(\ell_s q)^2]). This is a genuine bridge, not source support for the independently formed model.

## Next cursor

Promote (h) from a scalar to a covariant resolver displacement or frame variable, derive its allowed couplings to finite-core orientation, and ask whether parity reversal changes only (\alpha_s)'s sign while leaving the (q^2) pole spectrum invariant. That sign/pole separation would be a sharper geometry test than generic hysteresis.

