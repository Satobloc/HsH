# Ravel sandbox — P9 cancellation is a stratified readout zero set

**Status:** `GEN/CANDIDATE` numerical sandbox result; **reject as an intrinsic/canonical particle law**.  
**Question:** after the straight P9 cancellation line failed, does a locally unique mirror-odd zero curve `o=g(a)` survive strict nuisance-branch tracking?  
**Answer:** only piecewise and only relative to the selected readout-height ladder. The sharp morphology of the recovered curve moves exactly with a square-root contact threshold in that ladder.

## Exact source coverage this run

### Historical SAT source actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/AUDIT CYCLE 1-7.txt`, lines 1–1000, sequentially. The passage begins from an attempted 4D superhelical worldline/Whirligig Lagrangian, then repeatedly revokes premature validation: the recursive worldline product is undefined; a curve must be explicitly typed as `H: R -> R^4`; R4 needs a valid invariant set rather than generic “torsion”; imposed constraint/coupling terms must be labeled; equilibrium and the full second variation/linearization must precede resonance claims; and numerical anchoring is removed until the structure is derived. Historical particle/anchor labels were not used as targets. `⟦SRC:ARCHIVE-AUDIT-C1-7·L1-1000⟧`

### Current H(s)H source actually read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`, lines 2451–3100, sequentially. This region contains the embedded Run 127 endpoint hierarchy, Run 111 support-projection theorem, Runs 105–106 finite-slab fold/branch-aware inverse discriminator, and Run 092 thin-sheet oblique-projection/transversality discriminator. The directly relevant controls are: keep inverse branches explicit, flag local rank loss/folds, distinguish support/contact-set observables from full carrier shape, and treat a contact/transversality boundary as geometry rather than a mere numerical division error. `⟦SRC:HSH-PRECLOSE·L2451-3100⟧`

### Supporting-resource boundary

The Common front door and Reference Desk were refreshed before work. The 5 October HSH_RESOURCES packet remains routing/reference machinery, not theory authority. No `PRIOR_ART` or quarantined source was opened. No external physical model or historical numerical constant entered this construction.

## Source facts → translation → new conjecture

### Source facts

1. The archive audit’s usable residue is methodological: a 4D curve/history needs explicit type, invariants, variations, and stability tests before physical interpretation.
2. The September H(s)H work treats finite-core inference as a branch-aware readout problem: support projection may reduce an existence observable, but inverse folds and contact thresholds must remain visible.

### Ravel translation

The present two-ended finite-core fixture is not the modeled worldtube itself. It is a readout map acting on a finite-support morphology. Therefore a zero in a fitted signed-response coefficient can be intrinsic only if it survives changes in the resolver/acquisition geometry, or if its dependence on that geometry is carried explicitly.

### New sandbox conjecture

The P9 cancellation set is a **stratified resolver-relative zero set**. Inside a cell with fixed contact topology it can be locally written as an odd graph `o=g_j(a)`. Cell boundaries occur when a sampled height crosses a one-sided support. The union of these graphs is mirror covariant, but it is not a single intrinsic smooth material law.

## Geometry and equations

Use the existing normalized support coordinates

\[
\rho_+=1-a,\qquad \rho_-=1+a,
\]

and a common odd baseline morphology

\[
m_1=m_3=m_5=o,\qquad m_2=m_4=m_6=-0.01.
\]

For omitted mode P9, the held-out noncentrality is fit over signed injection `delta` as

\[
\lambda_9(\delta)=A\,x^2+B\,x^3+C\,x^4,
\qquad x=\delta/0.0025,
\]

and the tested cancellation functional is

\[
F_9(a,o)=B/A.
\]

The two-ended contact kernel contains square-root branches of the form

\[
K(h,z;\rho)=
\frac{\sqrt{(h-z)_+}-\sqrt{(-h-z)_+}}{\sqrt{h+\rho}}.
\]

For the expanding support, a sampled height `h_j` changes contact topology at

\[
\boxed{a_j^\star=h_j-1}\qquad(\rho_-=1+a).
\]

Thus the implicit zero equation is cellwise:

\[
F_9^{(j)}(a,g_j(a))=0,
\qquad a\in(a_{j-1}^\star,a_j^\star),
\]

not globally a single polynomial graph unless the contact-boundary dependence has first been removed or modeled.

## Numerical operation

At every signed amplitude and every `(a,o)` point, the six retained moments plus two support adjustments were refit from four fixed starts. The lowest-cost solution was used; distinct minima were deduplicated in parameter space. The augmented Gauss–Newton spectrum and fit costs were retained. Roots were continued with bracketing rather than inferred from a global polynomial.

### Initial continuation

All seven positive asymmetries `a=0.01,...,0.07` bracketed P9 zeros. Root residuals obeyed

\[
\max |F_9(a,g(a))|=6.27\times10^{-8}.
\]

The local transverse slopes never approached zero:

\[
\min |\partial F_9/\partial o|=2.95\times10^{-2},
\]

and all three explicit `o±0.001` controls reversed sign. Nuisance fits did not show rank loss:

- minimum augmented Hessian eigenvalue: `1.34698e4`;
- maximum Hessian condition number: `3.24618e3`;
- all fixed starts collapsed to one deduplicated nuisance solution;
- order-16 → order-32 maximum change in `F9`: `2.63e-8`;
- P8 control stayed nonzero, with minimum `|B/A|=1.822e-3`.

So the zero is not a generic optimizer failure, quadrature failure, or loss of transverse root rank.

However, the recovered roots made a sharp excursion near `a≈0.0613`. The exact train-height ladder contains

\[
h_{11}=1.0612574218504076,
\]

hence predicts

\[
a_{11}^\star=0.0612574218504076.
\]

The most negative resolved root occurred at `a=a*−0.0001`, inside the threshold neighborhood.

### Shifted-ladder discriminator

Changing only the common height scale from `HREF=1.30` to `HREF=1.31` moves the same sampled height and predicts

\[
a_\star: 0.0612574218504076
\longrightarrow 0.0694209404800261,
\]

or

\[
\Delta a_\star=0.0081635186296185.
\]

The observed sharp-feature location moved from `0.0611574218504076` to `0.0693209404800261`:

\[
\boxed{\Delta a_{\rm feature}=0.0081635186296185}
\]

with zero shift-prediction discrepancy at the resolution of the chosen offset grid. The two full curves did **not** become identical after recentering (maximum aligned-root difference `0.00786`), which is expected because changing the ladder changes the full readout operator, not just one boundary.

## Disposition

### What survives

- Mirror covariance survives: a negative-asymmetry partner exists with the parity-required sign to numerical tolerance.
- Within contact-topology cells, the P9 zero is transverse and numerically recoverable.
- A resolver-calibrated cancellation atlas may be useful for inverse diagnostics.

### What fails

- The rejected straight line is **not** repaired by promoting a global cubic/quintic `g(a)`.
- The finite-amplitude `B/A` zero curve is not intrinsic: its sharp morphology tracks the acquisition ladder.
- A smooth global polynomial fit is misleading across `a=h_j-1` strata.

### Failure condition

Any claimed intrinsic cancellation law fails if a change in the resolver height ladder moves its singular/turning features with `h_j-rho_- = 0`, or if the inferred root remains dependent on the finite injection endpoint. This run satisfies that failure condition for the present finite-amplitude P9 construction.

## Next tight test

Replace the global finite ladder coefficient by the local signed limit

\[
F_{9,\mathrm{loc}}(a,o)
=\lim_{\delta\to0}
\frac{\lambda_9(\delta)-\lambda_9(-\delta)}
{\delta\,[\lambda_9(\delta)+\lambda_9(-\delta)]}.
\]

Run nested amplitude ladders whose maximum `|delta|` halves successively, and independently jitter or densify the `h_j` grid. Two outcomes are sharply distinct:

1. roots converge away from contact strata and cusp amplitude shrinks with `delta_max`: a local material-response curve may survive cellwise;
2. roots continue to move materially with the height grid or fail to converge as `delta->0`: P9 cancellation is purely a readout-calibration artifact.

The solver must report the contact-stratum label, nuisance Hessian spectrum, root transverse derivative, and both one-sided limits. Do not smooth across a threshold.

## Durable artifacts

- `WORKSPACES/RAVEL/CODE/p9_zero_curve_continuation.py`
- `WORKSPACES/RAVEL/DATA/p9_zero_curve_continuation.json`
- `WORKSPACES/RAVEL/FIGURES/p9_zero_curve_continuation.svg`
- `WORKSPACES/RAVEL/CODE/p9_contact_threshold_shift_control.py`
- `WORKSPACES/RAVEL/DATA/p9_contact_threshold_shift_control.json`
- `WORKSPACES/RAVEL/FIGURES/p9_contact_threshold_shift_control.svg`

