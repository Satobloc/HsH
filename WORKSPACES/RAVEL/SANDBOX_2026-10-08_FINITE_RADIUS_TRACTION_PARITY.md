# Ravel sandbox — finite-radius traction parity

**Date:** 2026-10-08  
**Status:** sandbox / conditional geometry (`GEN/CANDIDATE` except where marked `STD/DERIVED`)  
**Scope:** continue the threefold helical-traction construction by replacing each centerline load with a load integrated over a finite circular tube surface. This is not a canonical H(s)H result and does not identify a particle.

## Result in one sentence

A centered tube with an antipodally paired contact pattern cannot acquire an axial-torque correction linear in its core radius: its first correction is quadratic in the core-to-helix radius, while one-sided contact generically restores a linear term. Thus the exponent of the small-radius torque correction is a direct discriminator of the resolving/contact architecture.

## Controls and provenance

### Current project controls actually read

- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` — complete rendered file (78 lines / 49 loc), including its current Common and Reference Desk pointers.
- `WORKSPACES/COMMON/REFERENCE_DESK/README.md` — complete file; overviewed the BigBook, toolkit, historical/Kerr/Einstein-Minkowski, data/index/info/tool, source-inventory, Tool Chest, preference router, and War Room routes.
- Current Common orientation, symbol-management, citation, toolbox namespace, workflow, exploration, scheduler, and write-safety controls named by the front door, with task-relevant portions read.
- `[RESOURCES]/HQ/THE_WAR_ROOM/DECLARATION.txt`, `indexes/ai_source_index/HSH_TOOLKIT.md`, `info/TOOLKIT_DIGESTION.md`, `HQ/TOOL_CHEST.md`, `!_HSH_RESOURCES_INDEX.md`, and `info/NATHAN_PREFERENCES/BOOT.md` — routing/familiarization only. No supporting-resource proposition was imported as theory authority. `PRIOR_ART` was not opened.

### Mersearch before generic corpus search

Submitted request `2026-10-08-ravel-finite-radius-traction-001` through `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`:

> `((finite radius OR tube surface OR tubular neighborhood OR cross-section) AND (traction OR drag OR contact pressure OR torque) AND (helix OR helical OR braid OR worldtube)) OR ((surface integration OR boundary traction) AND (chirality OR handedness OR threefold) AND (cancellation OR correction OR parity))`

No indexed response carrying that request ID was visible before construction. Only then was bounded GitHub search used to select primary files. Search hits were treated as navigation, not evidence.

### Primary SAT/H(s)H sources substantially read

1. `[[GLASS]]/H(s)H Dev +/HsH ARCHITECTING.txt`, lines 1–900 requested and read as a contiguous source region. The useful Nathan correction inside this mixed conversation says that any rotating object has a helical worldtube; the scale problem therefore requires comparing helix proportions, worldtube thickness, bending/dissipation, nested/internal rotations, and especially chirality cancellation. It also frames charged rotating apparatus as an attempt to reduce cancellation, while explicitly asking for the missing scaling calculation. The surrounding generated material repeatedly overclaims mechanisms and numbers; those passages are retained as historical conversation, not support.
2. `[[HsH]]/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, complete file. This sandbox source defines one-sided support radii and derives the separation between the curvature-facing support controlling a contact-set threshold and the sum of supports controlling maximum contact measure. Its main transferable lesson is geometric: finite-core asymmetry must be parameterized, not averaged away.
3. `[[HsH]]/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md`, complete file. This source integrates a finite circular normal fiber against a resolving slab and distinguishes an exact leading local geometry from a full-worldtube or detector claim. It supplies a useful precedent for exact finite-core integration and explicit model limits.

Historical constants, named particles, and inherited force labels were not targets and were not used as inputs.

## Source fact → inference → new conjecture

### Source facts (`SRC/HISTORICAL` or `GEN/CANDIDATE`)

- The older construction asks why coherent fundamental helices would couple differently from large rotating worldtubes and names chirality cancellation, thickness, radius-to-pitch ratio, deformation, dissipation, and internal nesting as unresolved controls.
- Run 110 shows that one-sided supports can control different observables independently.
- Run 104 shows how a declared finite normal fiber can be integrated exactly without claiming that the toy integration is the full physical model.

### Ravel inference (`GEN/ACTIVE`)

The centerline C3 selection rule is incomplete until each strand's traction is integrated over its finite cross-section. The first question should not be “what is the coefficient?” but “what powers of the core radius are even allowed by the contact symmetry?”

### Sandbox conjecture (`GEN/CANDIDATE`)

If an H(s)H resolving structure couples to a finite-core worldtube through an antipodally paired surface pattern, its core-radius correction to handed axial torque begins at even order. A resolving/contact pattern that selects one side of the tube generically produces an odd, leading linear correction. The measured exponent therefore reports morphology of the coupling, not merely its strength.

## Local geometry and symbol table

All symbols below are `LOCAL:RAVEL-FRTP` unless marked otherwise.

| Symbol | Meaning | Type / dimensions |
|---|---|---|
| `R_h` | distance from bundle axis to a strand centerline | positive length |
| `a_c` | circular strand core radius | positive length |
| `x=a_c/R_h` | small finite-radius ratio | dimensionless |
| `varphi` | polar angle around the strand cross-section | angle, radians |
| `f(r)` | azimuthal traction magnitude sampled at bundle radius `r` | force per selected surface measure |
| `w(varphi)` | nonnegative contact/resolution mask | dimensionless weight |
| `mu_n` | normalized weighted moment `<cos^n varphi>_w` | dimensionless |
| `sigma_ch` | handedness convention | `+1` right-handed, `-1` left-handed |

At one strand, let the global tangential traction direction be fixed to leading order and let a surface point have bundle-axis lever arm

\[
r(\varphi)=R_h+a_c\cos\varphi.
\]

The normalized axial torque factor is

\[
\mathcal T(x)=
\frac{\left\langle r(\varphi)f(r(\varphi))\right\rangle_w}
{R_h f(R_h)},
\qquad
\langle q\rangle_w=
\frac{\int q(\varphi)w(\varphi)d\varphi}
{\int w(\varphi)d\varphi}.
\]

For a smooth traction profile, Taylor expansion gives the finite-core law

\[
\boxed{
\mathcal T(x)=1+
x\mu_1\left(1+R_h\frac{f'_h}{f_h}\right)
+x^2\mu_2\left(
R_h\frac{f'_h}{f_h}
+\frac{R_h^2}{2}\frac{f''_h}{f_h}
\right)+O(x^3)
}
\]

where `f_h=f(R_h)`.

## Parity theorem

If the contact mask is antipodally paired,

\[
w(\varphi+\pi)=w(\varphi),
\]

then every odd weighted moment vanishes, including `mu_1=0`. Therefore

\[
\boxed{\mathcal T(x)-1=O(x^2)}.
\]

For complete circumferential contact, `mu_2=1/2`, hence

\[
\boxed{
\mathcal T_{\rm pair}(x)=1+
x^2\left[
\frac{R_h f'_h}{2f_h}
+\frac{R_h^2 f''_h}{4f_h}
\right]+O(x^4)
}.
\]

This cancellation is stronger than circular uniformity: any antipodally paired mask removes the linear term. The tube-surface Jacobian `1-a_c kappa cos(varphi)` for a smooth curved centerline changes the quadratic coefficient but not the absence of the linear correction, because its first-order term is also odd and integrates to zero over a paired mask. (`STD/DERIVED` within the stated smooth local geometry.)

For one-sided contact `varphi in [-pi/2,pi/2]`,

\[
\mu_1=\frac{2}{\pi},\qquad \mu_2=\frac12,
\]

so the generic leading correction is

\[
\boxed{
\mathcal T_{\rm one}(x)-1=
\frac{2}{\pi}
\left(1+R_h\frac{f'_h}{f_h}\right)x+O(x^2)
}.
\]

The linear coefficient vanishes only at the tuned profile condition `R_h f'_h/f_h=-1`; parity does not protect it.

## Threefold bundle consequence

For three identical strands related by exact 120-degree rotation and carrying the same co-rotating mask,

\[
\tau_z=3\,\sigma_{ch}\,R_h F_0\,\mathcal T(x),
\]

while the transverse vector sum remains zero by C3 symmetry. Thus finite radius can renormalize handed axial torque without generating drift. If the three masks differ, the earlier first-harmonic imbalance channel reopens and transverse drift can accompany the torque change.

This separates two measurements:

- the power law in `a_c/R_h` diagnoses within-strand contact parity;
- transverse drift diagnoses between-strand C3 imbalance.

## Numerical solver check

The solver uses the deliberately target-free profile

\[
f(r)=\exp[-g_{tr}(r-R_h)/R_h],\qquad g_{tr}=1.3,
\]

and evaluates

\[
\mathcal T(x)=\left\langle(1+x\cos\varphi)
e^{-g_{tr}x\cos\varphi}\right\rangle_w
\]

with one million angular points per radius. The value `1.3` is a toy gradient, not fitted to an observable.

Analytic coefficients:

\[
\mathcal T_{\rm pair}(x)-1=
\left(\frac{g_{tr}^2}{4}-\frac{g_{tr}}2\right)x^2+O(x^4)
=-0.2275x^2+O(x^4),
\]

\[
\mathcal T_{\rm one}(x)-1=
\frac{2}{\pi}(1-g_{tr})x+O(x^2)
=-0.1909859317x+O(x^2).
\]

Numerical regressions over small `x` returned:

| Architecture | fitted leading coefficient | log-log slope |
|---|---:|---:|
| complete circumference | quadratic `-0.2275000069` | `2.0000003151` |
| one-sided contact | linear `-0.1909859329` | `1.0006186536` |

The computed odd part of the complete-circumference response was at floating-point noise (`1.11e-16`).

Artifacts:

- `WORKSPACES/RAVEL/CODE/finite_radius_traction_parity.py`
- `WORKSPACES/RAVEL/DATA/finite_radius_traction_parity.json`
- `WORKSPACES/RAVEL/FIGURES/finite_radius_traction_parity.svg`

## Tight discriminator / apparatus

Use three geometrically identical helical tubes at fixed centerline radius and pitch. Vary `a_c/R_h` while holding the zero-radius extrapolated total traction fixed. Run two coupling sleeves:

1. an annular sleeve that contacts each tube in antipodal pairs;
2. a windowed sleeve that contacts only the bundle-facing half of each tube.

Reverse helix handedness without changing the apparatus geometry. Measure signed axial torque and transverse force.

Candidate signature:

- annular sleeve: handed torque reverses sign; magnitude correction scales as `(a_c/R_h)^2`; transverse force remains zero under exact C3 balance;
- windowed sleeve: handed torque reverses sign; magnitude correction scales generically as `a_c/R_h`; transverse force still cancels only if the three windows are exactly C3-related.

The most economical test is a log-log fit of `|tau_z(a_c)-tau_z(0)|` against `a_c/R_h`. A slope near two supports paired contact in this local model; a slope near one supports one-sided contact. This is an apparatus-level discriminator even though its proposed H(s)H interpretation remains speculative.

## Failure conditions

Reject or revise this mechanism if any of the following occurs:

1. **Paired-contact linear term:** after controlling tube eccentricity, mask imbalance, pitch, and traction normalization, a robust `O(a_c/R_h)` torque term appears under an antipodally paired mask. That falsifies the declared local traction geometry.
2. **No exponent separation:** annular and one-sided sleeves show the same stable leading exponent under the same traction law.
3. **Handedness failure:** signed torque does not reverse when helix handedness is reversed while all nonchiral conditions are fixed.
4. **C3 leakage:** identical co-rotating masks produce persistent transverse force that does not vanish with manufacturing asymmetry; the strandwise force law or its direction field is incomplete.
5. **Nonanalytic contact:** thresholding, frictional stick-slip, corners, self-contact, or a nonsmooth resolver field makes the Taylor expansion invalid. Fractional powers or jumps would then diagnose a different contact architecture rather than rescue this theorem.
6. **Large-core regime:** `a_c/R_h` is not small, tubes overlap, or normal coordinates cease to be injective. The local expansion is then out of scope.

## What follows if the 4D picture is taken seriously

Finite core is not a decorative thickness parameter. Once the represented history has an extended cross-section, a resolving/contact mechanism must specify which parts of that cross-section participate. That participation symmetry becomes observable in the radius scaling before any detailed constitutive dynamics is known. In this sandbox, “particle-like” stability can therefore begin with a small mechanics: threefold centerline balance selects torque over drift, while cross-sectional parity selects even over odd finite-core response.

The result does **not** establish that spacetime is a material medium, that H(s)H supplies this traction law, or that a laboratory sleeve maps directly to a resolving structure. It supplies a clean conditional bridge and a killable exponent.

## Next cursor

Replace the fixed global tangential direction by the full normal-bundle traction field on a helical tube,

\[
X(s,\varphi)=c(s)+a_c[\cos\varphi\,n(s)+\sin\varphi\,b(s)],
\]

include the exact surface Jacobian and a transported material frame, and determine which combinations of curvature, torsion, pitch, and mask harmonics enter the quadratic coefficient. The key check is whether paired contact remains even in `a_c` after the direction field is allowed to rotate across the tube.
