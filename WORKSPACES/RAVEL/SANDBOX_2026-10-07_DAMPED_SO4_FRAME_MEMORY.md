# Ravel sandbox — damped SO(4) frame memory

**Status:** `GEN/CANDIDATE`, siloed sandbox. This is not canonical SAT/H(s)H theory.

## Result in one sentence

If a finite core carries a transverse SO(4) frame, ordinary overdamped elastic relaxation does not immediately destroy order memory: after two weak noncommuting kicks separated by \(\Delta\), the endpoint-matched memory is

\[
\chi_{\rm mem}=\varepsilon^2\!\left(r-\frac{r^2}{2}\right)+O(\varepsilon^3),
\qquad r=e^{-\Delta/\tau_r},
\]

and an anisotropic finite-core intersection signal has the same retention factor \(2r-r^2\) relative to its zero-separation value.

## Provenance and reading coverage

### Controlling onboarding / routing

Refreshed `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` (blob `2e788d4a...`) and its role-relevant pointers: three-repository orientation, Reference Desk, symbol-management/registry, citation policy, toolbox namespace, workflow orientation/branching, scheduler authority, Carpe Turnem, and exploration routing. Refreshed the HSH_RESOURCES human index, H(s)H Toolkit route, Tool Chest/War Room route, and Nathan preference BOOT. HSH_RESOURCES remained a supporting-resource lane; no external theory premise was imported.

### Fresh archive source — read sequentially in full

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2023 SPACETIME CHAT.txt`
- blob `fcc645ded44c4b9b3a531a0f99e9fcea615b2636`; 62,536 characters; 776 GitHub-style lines read.
- What was actually read: the 2023 spacetime-rigidity/susceptibility dialogue, duplicated Tully–Fisher/modified-source discussion, logic digression, and the full 2024 `DIMENSIONAL GRAVITY` line/helix/plane construction through the 2026 retrospective stitching discussion.

### Fresh H(s)H source — read sequentially in full

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_PATH_FORWARD.txt`
- blob `870c3601b358ee249e62244a93056eb5ce2407fb`; 39,911 characters; 274 lines read.
- What was actually read: the complete Phase I–IX roadmap, including formal closure, dynamics, particle/cosmology/quantum programs, falsifiability, computational tooling, experimental validation, and publication/community plans.

The H(s)H roadmap is a generated programmatic source with repeated unsupported success language and old guarded machinery (direct topology-to-particle assignments, mass-by-\(Q\), automatic gauge recovery). I used only its legitimate demand for explicit dynamics, simulation, controls, and falsifiability.

## Source facts, inference, and conjecture

### Source facts (`SRC/HISTORICAL`)

1. The old geometric construction places a straight line and a helix through a perpendicular plane; at any one plane position the intersections are two points, while moving the plane makes the helix intersection circulate. The observed point is therefore not the whole curve.
2. The 2023 dialogue asks whether a matter-dependent effective susceptibility could change geometric response; it does not derive such a law.
3. The Sep-30 roadmap asks for a defined configuration space, dynamical law, consistency tests, numerical tools, and explicit falsifiers; it does not supply them.

### Translation into current H(s)H (`SAT/ACTIVE`)

- Whole object: finite-core worldtube carrying a local orthonormal material frame \(F\in SO(4)\).
- Interaction: matter/environment applies angular/torsional transport to the time-normal/material frame, not an old dual-shell or \(H_0+c\) mechanism.
- Observation: a finite resolving intersection measures a support tensor of the core; the instantaneous intersection does not exhaust the worldtube history.
- “Rigidity”: translated narrowly as a relaxation time \(\tau_r\), not as a new spacetime substance.

### New sandbox conjecture (`GEN/CANDIDATE`)

A particle-like core may retain a bounded, continuously decaying record of ordered interactions in its transverse frame even after its endpoint normal is matched. This requires observable transverse anisotropy; it is not implied by a normal-only worldline.

## Minimal mechanics

Use two noncommuting generators \(J_{01},J_{02}\in\mathfrak{so}(4)\). A weak kick has angle \(\varepsilon\). Between kicks, impose the smallest overdamped elastic restoration to a reference frame:

\[
\dot F=-\tau_r^{-1}\operatorname{Log}(F)F.
\]

Along the principal logarithm branch this has the exact solution

\[
F(t)=\exp\!\left[e^{-t/\tau_r}\operatorname{Log}F(0)\right].
\]

For \(r=e^{-\Delta/\tau_r}\), the two histories are

\[
F_{AB}=e^{\varepsilon J_{02}}e^{r\varepsilon J_{01}},\qquad
F_{BA}=e^{\varepsilon J_{01}}e^{r\varepsilon J_{02}}.
\]

The BA endpoint normal is mapped exactly onto the AB endpoint normal by the shortest closing rotation. Because the protocols end with different last kicks, this comparison has a nonzero fully-forgotten baseline at \(r=0\); that baseline is measured and subtracted. A Baker–Campbell–Hausdorff expansion then gives

\[
\chi_{\rm mem}=\varepsilon^2\left(r-\tfrac12r^2\right)+O(\varepsilon^3).
\]

Thus normalized retention is

\[
\mathcal M(\Delta)=\frac{\chi_{\rm mem}(\Delta)}{\chi_{\rm mem}(0)}
=2e^{-\Delta/\tau_r}-e^{-2\Delta/\tau_r}.
\]

This is not a fitted particle constant; it is the discriminator of this one minimal relaxation architecture.

## Numerical check

The solver exponentiates the exact SO(4) kicks/relaxation, endpoint-matches normals, subtracts the \(r=0\) control, and evaluates both full-frame holonomy and a finite-core support readout with

\[
D=\operatorname{diag}(1.00^2,0.79^2,0.61^2,0.47^2).
\]

At \(\varepsilon=0.12\):

| \(\Delta/\tau_r\) | \(\chi_{\rm mem}\) | support RMS | normal mismatch after closure |
|---:|---:|---:|---:|
| 0 | 7.2177e-3 | 5.2156e-4 | 1.13e-16 |
| 1 | 4.3181e-3 | 3.1200e-4 | 1.13e-16 |
| 3 | 6.9856e-4 | 5.0471e-5 | 3.34e-16 |
| 5 | 9.6638e-5 | 6.9821e-6 | 2.23e-16 |

Across \(0\le\Delta/\tau_r\le3\), the leading formula matches the exact matrix result to within 0.25%. Small-kick fits give powers 2.0022, 1.9990, and 1.9993 at separations 0, 1, and 3 respectively. The isotropic-core support signal is numerical zero.

## What must follow if the 4D picture is taken seriously

The state needed by H(s)H is conditional on detector access:

- If the finite core is transversely anisotropic, \(F\in SO(4)\) (or its observable equivalence class) carries order memory not recoverable from the endpoint normal alone.
- If the core is transversely isotropic or all measurements resolve only the normal, the stabilizer sector is gauge-like/unobservable and the minimal state reduces to the unit normal.
- Therefore “history matters” becomes a testable representation question: does a transverse observable survive after equal endpoint data and baseline subtraction?

## Failure conditions

This architecture fails or becomes empirically empty if any of the following holds:

1. no finite transverse anisotropy exists;
2. the resolving interaction is normal-only;
3. relaxation is much faster than every controllable pulse separation (\(\Delta/\tau_r\gg1\));
4. measured retention is not compatible with \(2e^{-\Delta/\tau_r}-e^{-2\Delta/\tau_r}\) after independently calibrated linear relaxation;
5. the logarithm branch is crossed by large kicks, where this minimal constitutive law ceases to be single-valued and must be replaced rather than patched.

## Tight solver/experiment candidate

Use an anisotropic 4D finite-core proxy in a covariant rod/frame solver. Apply two equal weak torques in orthogonal normal-containing planes in AB and BA order, vary separation \(\Delta\), endpoint-match the normal, and measure a transverse quadrupole/support observable. Fit one independently measured \(\tau_r\); do not fit the curve shape. The sharp candidate prediction is

\[
\Delta S(\Delta)/\Delta S(0)=2e^{-\Delta/\tau_r}-e^{-2\Delta/\tau_r},
\qquad \Delta S\propto\varepsilon^2.
\]

An exponential \(e^{-\Delta/\tau_r}\), zero signal at all separations, or persistent nonzero plateau would distinguish different internal architectures.

## Artifacts

- `WORKSPACES/RAVEL/CODE/damped_so4_frame_memory.py`
- `WORKSPACES/RAVEL/DATA/damped_so4_frame_memory.json`
- `WORKSPACES/RAVEL/FIGURES/damped_so4_frame_memory.svg`

Next cursor: replace the imposed single-time relaxation law with a covariant finite-rod constitutive equation and check whether its lowest transverse mode reproduces the same retention kernel without inserting it by hand.
