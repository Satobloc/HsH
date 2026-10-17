# Ravel sandbox — contact-dressed wall action

**Status:** GEN/CANDIDATE. Synthetic mechanics and reduction test; not canonical SAT/H(s)H theory and not empirical evidence.

## Result

The earlier bare-wall estimate failed because a finite-core director wall does not cross the contact region at its zero-contact shape. A five-coordinate, boundary-exact wall profile that pays the computed contact potential predicts the full field’s global state-selection threshold to better than 1% across four contact-edge widths. The annular control has no energetic crossing in either description.

This gives a smaller H(s)H mechanics candidate: a retained finite-core morphology can be represented, for this job, by two wall locations, two wall widths, and one interior amplitude, provided the read/write contact operator remains explicit.

## Provenance and actual reading

The controlling project front door and its materially relevant workflow, symbol, citation, reference-desk, and Mersearch pointers were refreshed before construction.

A new request, `2026-10-08-ravel-contact-wall-action-001`, was submitted to Mersearch in commit `b63ce1b07a9d946d26902291563020bf488c604a`. Its result manifest was not yet present during this build. The preceding contact-memory request had produced a manifest by this run and was used only as a routing aid.

### Archive source

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/MISC/SAT FIRST LEG 3 of 3.txt`

Coverage: sequential lines 1–1200, followed by a targeted read at the start of the next chunk containing the proposed `DomainWallToyModel.ipynb` / 1D sine-Gordon-kink task.

What was actually found: the sequential region is a mixed generated work log dominated by attempted atomic/molecular calculations, runtime failures, and unwarranted statements that standard constants or minimal-basis outputs had been derived from SAT. The later task list proposes a one-dimensional sine-Gordon kink as a toy model of an angular domain wall. The latter is retained only as a historical proposal to calculate a wall; the chemistry claims, numerical targets, particle assignments, and claims of validation are not imported.

### H(s)H September-30 source

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT FORMALIZATION ROUND 3ish.txt`

Coverage: sequential lines 1–1200.

What was actually found: a generated three-minimum angular-field construction, a proposed static wall, wall-tension calculation, kink–antikink dynamics, and optical-retardance applications. It repeatedly promotes the construction to particles, mass, `Z3` sectors, and experimental anomalies without the needed dependency chain. Only the generic field-mechanics question—can a transition profile and its tension be calculated?—is admitted here. The old `theta4`, `tau`, mass, fusion, optical, and particle identifications remain historical/quarantined.

## Source fact, inference, and new construction

| Layer | Statement |
|---|---|
| Source fact | Older SAT material proposed one-dimensional angular kinks/domain walls and asked for their tension and interaction. |
| Source fact | The read sources do not derive the present unilateral contact potential or a contact-dependent wall action. |
| Inference | The previous threshold error can arise because a wall changes shape while traversing the contact-energy landscape. |
| New construction | Replace the fixed bare-wall cost by a Ritz minimization over a boundary-exact kink–antikink family while retaining the exact tabulated contact potential. |

## Full field retained from the preceding checkpoint

The comparison uses the same field functional and independently computed contact potential:

\[
E[\psi]=\int_0^1\left[
\frac{C_T}{2}(\partial_s\psi)^2+
\frac{K_A}{2}\sin^2\psi+
\Lambda g(s)U_c(\psi)
\right]ds,
\qquad \psi(0)=\psi(1)=0,
\]

\[
U_c(\psi)=\frac12\int_0^{2\pi}w(\phi)
[d+u\cos2\phi-v\cos2(\phi-\psi)+e\cos(\phi-\psi)]_+^2d\phi.
\]

The one-sided polar geometry breaks half-turn symmetry; the annulus is the compulsory null and remains exactly `pi`-periodic.

## Contact-dressed wall family

Define a boundary-normalized rising wall

\[
L(s;x_-,w_-)=
\frac{\tanh[(s-x_-)/w_-]-\tanh[-x_-/w_-]}
{\tanh[(1-x_-)/w_-]-\tanh[-x_-/w_-]},
\]

and an analogous falling wall

\[
R(s;x_+,w_+)=
\frac{\tanh[(x_+-s)/w_+]-\tanh[(x_+-1)/w_+]}
{\tanh[x_+/w_+]-\tanh[(x_+-1)/w_+]}.
\]

The reduced morphology is

\[
\psi_R(s;\mathbf q)=
\pi A\frac{L(s;x_-,w_-)R(s;x_+,w_+)}
{\max_s[LR]},
\]

with

\[
\mathbf q=(x_-,x_+,w_-,w_+,A).
\]

Its contact-dressed action is not a fitted constant:

\[
E_R(\Lambda)=\min_{\mathbf q}E[\psi_R(\mathbf q);\Lambda].
\]

The five variables have direct geometric meanings: the two transition locations, their two thicknesses, and the retained interior rotation. The contact potential is not absorbed into those variables.

## The failed reduction

Ignoring contact deformation of the walls gives

\[
\Lambda_{bare}=
\frac{4\sqrt{C_TK_A}}
{(\int g\,ds)[U_c(0)-U_c(\pi)]}
=4.50820.
\]

The full-field crossing near the default edge width is `11.92067`, so the bare-wall estimate is low by a factor of `2.644`. This is a rejected quantitative approximation for the present parameter regime.

## Solver test

The contact plateau and its integrated width were held fixed while the smooth edge width of `g(s)` was varied. For each geometry, the full field used 201 nodes and continuation from strong contact; the reduction independently minimized its five coordinates on a 3001-point quadrature grid.

| Contact-edge width | Full-field crossing | Reduced crossing | Relative error |
|---:|---:|---:|---:|
| 0.012 | 11.86717 | 11.97675 | 0.923% |
| 0.018 | 11.92067 | 12.02089 | 0.841% |
| 0.030 | 12.07982 | 12.15952 | 0.660% |
| 0.050 | 12.47625 | 12.52894 | 0.422% |

At the default edge width, the reduced and full profiles near the crossing differ by an RMS of `0.01104 pi`. The annular null has no crossing in either calculation; its lowest scanned domain excess is `0.23369` in the full field and `0.23547` in the reduction.

Thus the reduction predicts both the existence and location of polar state selection without fitting a threshold. It also captures the monotonic increase in threshold as the contact edge is broadened.

## Mechanism extracted

The contact edge is part of the wall mechanics, not a negligible boundary detail. A broader transition region forces more of the angular wall to occupy intermediate orientations where `U_c(psi)` is high. The energetic write threshold therefore contains three separable ingredients:

1. bare transport/bulk wall cost;
2. interior orientation bias `U_c(0)-U_c(pi)`;
3. contact-dressed transition cost determined by the spatial edge profile and the complete angular barrier.

This resolves the prior discrepancy without adding a new field or fitting the numerical crossing.

## Concrete discriminator

Use otherwise matched anisotropic finite-core filaments with a verified polar/off-axis marker and one-sided contact pads. Manufacture pads with the same plateau length and integrated normal-load window but different calibrated edge tapers. Infer `U_c(psi)` independently from quasi-static torque, then predict the domain-selection load using the five-coordinate reduction without refitting.

The synthetic model predicts, for the tested family, that broadening the edge from `0.012` to `0.050` raises the crossing from `11.867` to `12.476`, about `5.13%`. A complete annular sleeve must show no orientation-selection crossing even if it retains a local wall pair.

Spatial director imaging is essential: a lumped friction or backlash model may reproduce a torque loop but does not predict the two wall locations, wall broadening, and profile evolution from the measured contact potential.

## Failure conditions

Reject or enlarge this reduction if:

1. its preregistered crossing error exceeds 5% when the measured contact potential and edge profile are supplied without threshold fitting;
2. it predicts the crossing but fails the spatial profile comparison;
3. a centered annular control develops a repeatable orientation-selection crossing after fixture asymmetry is bounded;
4. changing edge taper while holding plateau and integrated load fixed produces no systematic threshold change;
5. the threshold trend reverses without a corresponding change in the measured `U_c(psi)`;
6. mesh refinement changes the full-field crossing materially;
7. stick–slip, plasticity, thermal lag, or detector history accounts for the result without the predicted wall morphology.

## H(s)H translation

Conditional on the finite-core director model, H(s)H need not represent every field degree of freedom to track this retained state. For this mechanism, a compact morphological record can consist of two transition locations, two transition thicknesses, and one interior angular amplitude, together with the external contact/readout map. The reduction fails if the external map is discarded: wall morphology and contact geometry are coupled.

This is a representation claim, not an assertion that particle histories contain these specific walls. The next admissible step is to replace the prescribed contact window by a deformable pad or nested sleeve whose edge profile follows from force balance, then test whether the same five-coordinate closure survives.

## Artifacts

- Solver: `CODE/contact_dressed_wall_action.py`
- Numerical record: `DATA/contact_dressed_wall_action.json`
- Class-P figure: `FIGURES/contact_dressed_wall_action.svg`

All displayed curves and thresholds are synthetic outputs of the stated model.
