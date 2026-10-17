# Ravel sandbox: dynamic material director and pinned phase-slip memory

**Status:** `GEN/CANDIDATE`, quarantined sandbox construction.  This is a standard elastic-director model attached to an H(s)H morphology observable.  It is not evidence for H(s)H and does not promote a rod model into the represented worldtube itself.

## Result in one sentence

Promoting the elliptic-core material angle to a field does not by itself produce robust memory: a homogeneous rod loses its retained twist bubble under grid refinement, whereas a localized finite-core anchoring region supports a stable kink–antikink pair and turns the previous torque-null contour into a history-dependent set of crossings.

## Source record

The Common front door, current routing controls, and HSH_RESOURCES reference desk were reviewed before construction.  HSH_RESOURCES was used only for navigation and tool familiarity.  No `PRIOR_ART` material was opened.

Mersearch request `2026-10-08-ravel-dynamic-director-hysteresis-001` was posted before bounded repository fallback.  Its manifest was unavailable during construction, so no unseen search result was treated as evidence.

### SAT archive source substantially read

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/HsH ARCHITECT.txt`, sequential lines 1–1400, blob `f3c4dfd…` repository view.

What was actually read and retained:

- Nathan distinguishes superhelical **orders** from braid **degrees** and describes alternating material-plane orientations across orderly coiling levels.
- The battery/apparatus discussion asks why macroscopic helical worldtubes differ from proposed fundamental-scale helices, explicitly naming radius-to-pitch ratio, tube thickness, resistance to bending, energy dissipation, internal helical structure, and chirality cancellation.
- The source proposes spin-history measurements but warns that multiple mechanisms are mixed together.
- Most importantly, Nathan rejects introducing an elastic modulus, smoothing factor, or similar repair merely to make a target number work.  Any elastic term must be mechanically defined, independently constrained, and tested across more than one use.

Not imported: Kerr/event-horizon identifications, particle assignments, historical constants, mass formulas, charge identifications, or claims about backward/forward temporal forces.

### HsH September 30 source substantially read

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/SAT PRE-H(s)H TIGHTENING.txt`, sequential lines 1–1400, blob `054a76d…`.

What was actually read and retained:

- The document is a generated survey/audit conversation, not a controlling derivation.
- It repeatedly invokes bifurcation corridors and a filamental elastic modulus, but does not supply a usable rod energy for the present problem.
- Nathan corrects the goal from “prove” to accurately testing whether the mathematics is convincing.
- The subsequent audit finds a five-order arithmetic discrepancy in a claimed gravity-scale calculation, reinforcing the need to separate arithmetic agreement from mechanical derivation.

Not imported: named constants, particle targets, mass ladders, lattice attenuation, the raw angle notation, or any “locked” status asserted by generated prose.

## Independent construction before cross-pollination

### 1. Standard benchmark field

Let `s in [0,L]` parameterize the material centerline and let `psi(s)` be the independently transported angle of the elliptic cross-section relative to a chosen normal frame.  This is a representation variable, not the worldtube itself.

The smallest homogeneous energy with torsional stiffness and head–tail locking is

\[
E_0[\psi;\Theta]
=\int_0^L\left[
\frac{C_T}{2}(\partial_s\psi)^2
+\frac{K_A}{2}\sin^2\psi
\right]ds
+\frac{K_D}{2}[\psi(L)-\Theta]^2.
\]

`C_T` is torsional stiffness, `K_A` is the elliptic/director locking strength, `K_D` is apparatus stiffness, and `Theta` is the controlled end rotation.  The base is clamped, `psi(0)=0`.  A finite `K_D` is essential: an ideal Dirichlet drive cannot report a separate apparatus torque.

The Euler–Lagrange equation and natural end condition are

\[
-C_T\psi''+\frac{K_A}{2}\sin 2\psi=0,
\]

\[
C_T\psi'(L)+K_D[\psi(L)-\Theta]=0.
\]

The measured drive torque is therefore

\[
M_D=K_D[\Theta-\psi(L)].
\]

### 2. Homogeneous architecture fails the continuum check

The periodic locking admits coarse-grid kink-like states.  However, the returned two-wall state disappears between `N=61` and `N=81` for the tested homogeneous parameters.  At `N=81` and `N=101`, its returned total variation falls to numerical zero.

That is a useful failure, not a nuisance: in one dimension a free kink and antikink attract and annihilate.  Periodicity alone does not mechanically support retained history.  Any durable memory requires topology, a constraint, a defect, a nesting interface, or another independently visible pinning mechanism.

### 3. Minimal pinned finite-core architecture

Introduce one localized region where the inner nesting/contact geometry prefers the opposite head–tail orientation:

\[
g(s)=\exp\!\left[-\frac{(s-L/2)^2}{2\sigma_P^2}\right],
\]

\[
E_P[\psi;\Theta]=E_0[\psi;\Theta]
+\int_0^L K_Pg(s)[1+\cos\psi]ds.
\]

The new field equation is

\[
-C_T\psi''
+\frac{K_A}{2}\sin 2\psi
-K_Pg(s)\sin\psi=0.
\]

This is the smallest extra mechanics found here: one spatially resolved anchoring region.  It does not assume an exotic force.  The unrotated state remains locally stable when the local quadratic coefficient satisfies approximately `K_A - K_P g(s) > 0`, while a driven `pi`-oriented interior domain can also be stable because it lowers the pinning energy enough to pay for two walls.

### 4. Coupling to the preceding torque observable

The prior elliptic-core calculation supplied the local quadratic coefficient structure.  In the normalized field test it becomes

\[
\overline C_2[\psi]
=\frac1L\int_0^L
\left[A_0+A_2\cos 2\psi+B_2(\partial_s\psi)^2\right]ds.
\]

The coefficients used here are arbitrary dimensionless test values, not particle fits or recovered historical constants.  The diagnostic question is whether the zero set `C2bar=0` remains single-valued under reversal of `Theta`.

## Numerical continuation

The solver discretizes the energy, follows local minima as `Theta` increases from `0` to `5.5*pi`, then reverses the same drive.  Every reported state satisfies a positive discrete Hessian margin and a small gradient residual.

Nominal dimensionless parameters:

| Parameter | Value |
|---|---:|
| `N` | 101 |
| `C_T` | 0.001 |
| `K_A` | 1.0 |
| `K_D` | 0.2 |
| `K_P` | 0.55 |
| `sigma_P/L` | 0.12 |
| `(A0,A2,B2)` | `(-0.275, 0.30, 0.0002)` |

Key results:

| Check | Result |
|---|---:|
| Increasing-drive `C2bar=0` crossings | 2.92709, 3.09741, 3.46278 rad |
| Decreasing-drive `C2bar=0` crossings | 3.46278, 2.82637 rad |
| Maximum branch separation in `C2bar` | 0.04920 |
| Maximum stationarity residual | `1.27e-8` |
| Smallest forward Hessian margin | `5.20e-5` |
| Smallest reverse Hessian margin | `9.30e-5` |

At the same zero drive:

| Preparation | `C2bar` | total director variation / `pi` | peak `psi/pi` |
|---|---:|---:|---:|
| Fresh, unrotated | +0.02500 | 0 | 0 |
| Returned after rotation cycle | -0.02406 | 1.99405 | 0.999998 |

The returned state is a pinned kink–antikink pair: both ends return almost to the same orientation, but the central finite-core region remains rotated by approximately `pi`.  This changes the sign of the quadratic torque coefficient without changing the instantaneous external control.

### Grid test

For the pinned architecture, returned variation converges from `1.99427*pi` at `N=41` to `1.99405*pi` at `N=101`; returned `C2bar` converges from `-0.02307` to `-0.02406`.  The homogeneous retained bubble instead vanishes at `N>=81`.  The pinning region is therefore doing identifiable mechanical work rather than merely decorating a pre-existing numerical artifact.

## What follows if the 4D picture is taken seriously

Conditional on a finite-core worldtube representation with an independently transported material director:

1. A torque-null state is not specified by local cross-section shape alone; it depends on the director field along the represented history.
2. If a nested/core-contact region can favor an opposite material orientation, identical instantaneous end geometry can have opposite quadratic torque response after different preparation histories.
3. The retained object is not an unexplained scalar “memory.”  It is a spatially reconstructible pair of director walls.
4. If no independent pinning/nesting interface exists, the present model predicts that apparent hysteresis should collapse with spatial refinement or slow relaxation.

## Apparatus / solver discriminator

Use an ordinary anisotropic elastic rod, ribbon, printed elliptic tube, or optical director analog with:

- a clamped base;
- a calibrated finite-stiffness rotary drive;
- distributed orientation readout;
- a removable, localized anchoring sleeve or interior nesting insert centered near midspan.

Protocol:

1. Sweep end rotation upward and downward at decreasing rates.
2. Measure end torque and the full director profile.
3. Repeat with the anchoring region removed, shifted, broadened, and sign-reversed.
4. Fit `C_T`, `K_A`, `K_D`, `K_P`, and `sigma_P` from independent static or small-amplitude tests before predicting the cycle.
5. Preregister both the retained wall positions and the direction-dependent `C2bar=0` crossings.

The tight prediction is co-localization: history dependence must disappear with the anchoring region, and any retained response must be accompanied by a resolved kink–antikink profile at that region.  A lumped hysteresis element can reproduce a loop but not the predicted spatial wall pair or its movement when the sleeve is shifted.

## Failure conditions

The candidate fails or is demoted if any of the following occurs:

- the retained state persists in the homogeneous continuum limit without a topological or pinning mechanism;
- the wall pair is not spatially resolved where the independent anchoring profile predicts it;
- the fitted pinning strength changes arbitrarily between drive directions;
- the measured null crossings do not converge under spatial and rate refinement;
- ordinary friction, backlash, plasticity, thermal drift, or detector lag explains the full loop;
- removing or translating the anchoring region does not remove or translate the retained walls;
- the Hessian loses positivity before an allegedly stable branch is reported.

## Provenance and maturity boundary

- Standard variational rod/director mechanics used here: `STD/DERIVED` within the toy model.
- Mapping `psi(s)` to the elliptic H(s)H material frame: `GEN/CANDIDATE`.
- Localized nesting/contact pinning as a finite-core mechanism: `GEN/CANDIDATE`.
- Historical SAT/H(s)H statements about elasticity, hysteresis, particles, or temporal pulls: `SRC/HISTORICAL` or `SRC/CANDIDATE` unless separately reconstructed.
- Numerical continuation: implementation verification and discriminator design, not empirical support.

## Next cursor

Replace the prescribed Gaussian pin with contact mechanics derived from an explicit nested elliptic tube.  Compute `K_P` and `g(s)` from sleeve pressure, frictionless normal contact, and director-dependent cross-sectional energy; then test whether the wall pair and hysteretic nulls survive without a phenomenological pinning potential.
