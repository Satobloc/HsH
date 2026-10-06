# Ravel sandbox checkpoint — P9 cancellation-line blind test

**Status:** sandboxed negative/repair result; not canonical H(s)H theory. The previously proposed straight cancellation line failed its blind test.

## Bounded question

The previous response-surface build proposed

\[
o=-0.16981194\,a,
\qquad
a=\frac{\rho_- - \rho_+}{\rho_-+\rho_+},
\]

as the full-refit P9 zero-response line. Does this line predict sign cancellation at new support asymmetries, new baseline skews, and a new signed-amplitude ladder?

## Source record

### Controlling workflow

Before the build, refreshed `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, the Common Reference Desk, current workflow/task routing, symbol controls, citation policy, and toolbox namespace controls. The 5 October `HSH_RESOURCES` packet remains a navigation/tool/standard-reference surface only. `PRIOR_ART` was not entered.

### SAT archive source substantially read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MAY 2026 REFINEMENT FORMALIZATION.txt`
- Coverage: sequential lines 1–1200.
- Retained source fact: several audit cycles correctly reject the inference “symmetry group contains a subgroup, therefore a discrete physical constraint follows.” A constraint requires an explicit variational condition, conserved quantity, topological invariant on a defined configuration space, or a derived operator.
- Quarantined: Z3 fusion-gate claims, lattice language, undefined holonomy/torsion quantities, particle assignments, numerical anchors, and any downstream mass claim.

### H(s)H source substantially read

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`
- Coverage: sequential lines 2050–2450, including the complete embedded `2026-09-26_RUN_137_EXACT_QUADRATIC_CROSSOVER_SPAN.md` construction.
- Retained source fact: in an explicitly declared quadratic contact model, a topology transition can be exact (there, \(\Lambda_c=\sqrt2\)); the same source explicitly warns that omitted higher-order terms can move the threshold. This is methodological precedent for testing rather than assuming a leading-order locus.

Also read `WORKSPACES/WORLDTUBE_LAB/FINITE_THICKNESS_READOUT_PACKET_001.md` in full. It is explicitly quarantined and therefore did not control this construction; its historical covariance/non-identifiability discussion is recorded only as provenance context.

## Source / inference / conjecture boundary

**Source:** symmetry alone is not a derived constraint; exact readout loci require a declared forward model and can move when higher-order structure is restored.

**Inference:** the exact mirror covariance of the finite-contact solver constrains the P9 signed response \(F_9\) only by

\[
F_9(-a,-o)=-F_9(a,o).
\]

It does not require a straight zero line.

**New sandbox conjecture:** if \(\partial_oF_9(0,0)\ne0\), the implicit-function theorem gives a local cancellation curve \(o=g(a)\) with

\[
g(-a)=-g(a),
\qquad
g(a)=c_1a+c_3a^3+c_5a^5+\cdots.
\]

The earlier straight line was only a coarse leading-order estimate, not an exact mechanism.

## Blind protocol

The coefficient \(-0.16981194\) was frozen before evaluation. New points used

\[
a\in\{-0.07,-0.05,-0.03,0.03,0.05,0.07\},
\]

\[
o=-0.16981194a+d,
\qquad
d\in\{-0.003,-0.0015,0,0.0015,0.003\},
\]

and the new moment-isolated amplitude ladder

\[
|\delta|\in\{0.0006,0.0011,0.0016,0.0021,0.0026,0.0031,0.0036\}.
\]

For each point the P8 and P9 responses were independently refitted as

\[
\Lambda(x)=Ax^2+Bx^3+Cx^4,
\qquad x=\delta/0.0025.
\]

## Result: the straight line is rejected

Only four of the six support asymmetries showed a P9 zero inside the preregistered \(|d|\le0.003\) window. The two \(|a|=0.05\) cases retained the same sign across the whole window. Where an interior root was recovered, its displacement from the frozen line reached

\[
|d_*|=0.00232163,
\]

with RMS displacement \(0.00194791\). At the frozen line itself, the full-refit P9 response remained as large as approximately \(1.01\times10^{-4}\) in \(|B/A|\).

This is not a quadrature or mirror-covariance failure:

- maximum 16→32 contact-quadrature change in \(B/A\): \(3.00\times10^{-7}\);
- maximum mirror-covariance error: \(6.30\times10^{-7}\);
- maximum protected lower-moment drift: \(6.96\times10^{-13}\);
- optimizer retries/failures: 0/0.

The P8 control remained negative along the frozen P9 line:

\[
-0.002245\le (B_8/A_8)_{\rm full}\le-0.001759,
\]

and respected even mirror covariance. Thus the failure is specifically the assumed **linearity of the P9 zero set**, not the even/odd parity mechanism.

## Post-hoc repair attempt

The lowest mirror-allowed cubic response surface is

\[
F_9(a,o)=c_{10}a+c_{01}o+c_{30}a^3+c_{21}a^2o+c_{12}ao^2+c_{03}o^3.
\]

On the blind grid, the full-refit coefficients were

\[
(c_{10},c_{01},c_{30},c_{21},c_{12},c_{03})
=(0.0071795,0.0288766,-0.235164,0.191345,2.95664,12.1255).
\]

However, its RMSE was \(1.50\times10^{-5}\), maximum residual \(1.85\times10^{-5}\), and its candidate zeros retained order-32 residuals as large as \(1.87\times10^{-5}\). It is therefore a descriptive curvature diagnosis, **not** an accepted replacement law.

## H(s)H translation

Within this model, support imbalance \(a\) and internal fore–aft morphology \(o\) are two parity-breaking coordinates of a finite worldtube/readout pair. Their observational cancellation is generically a curved codimension-one locus, not a constant-ratio rule. The finite carrier can therefore pass through a zero signed-response state while both asymmetries remain nonzero, but the location depends on nonlinear contact geometry and nuisance projection.

## Failure condition and decisive next test

The straight-line prediction is already falsified at the tested resolution. The repair should also be rejected unless a branch-tracked continuation solver can recover a unique smooth odd curve \(g(a)\) satisfying:

1. \(F_9(a,g(a))=0\) under strict multistart fitting;
2. \(g(-a)=-g(a)\) to numerical tolerance;
3. the root persists under amplitude-window, quadrature, and training/holdout changes;
4. crossing the curve reverses the P9 sign;
5. P8 retains its even nonzero response across the same sweep.

The next solver should use pseudo-arclength continuation from the exact symmetric point, with branch identity checked by fit cost and Hessian spectrum. Independent root searches without continuation are unsafe because nuisance-fit branch changes can imitate curvature.

No external particle prediction is earned.

## Artifacts

- Solver: `WORKSPACES/RAVEL/CODE/p9_cancellation_blind_validation.py`
- Data: `WORKSPACES/RAVEL/DATA/p9_cancellation_blind_validation.json`
- Class-P diagnostic: `WORKSPACES/RAVEL/FIGURES/p9_cancellation_blind_validation.svg`

