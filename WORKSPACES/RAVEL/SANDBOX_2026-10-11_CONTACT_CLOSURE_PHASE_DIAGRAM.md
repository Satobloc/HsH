# Ravel sandbox — contact closure phase diagram and scalar-memory no-go

**Status:** SILOED PLAYGROUND / `GEN/CANDIDATE`. This is a synthetic continuum-mechanics result, not canonical SAT/H(s)H theory and not evidence for a particle model.

## Result in one sentence

The “temporary scar that heals” construction becomes a distributed contact field: with the present second-order healing operator it passes directly from quasistatically slaved contact to a band of slow contact modes, with at most a numerically narrow but spectrally unisolated one-mode crossover; an isolated scalar memory coordinate requires different mechanics, with fourth-order surface bending providing the smallest explicit competing architecture.

## Exact source record

### Historical SAT archive — substantially read

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt`, contiguous lines 1–2500 requested and read as a transition/review transcript rather than as current theory authority.

Relevant material actually read:

- the declared transition is from worldline descriptions to finite worldtube mechanics;
- the document repeatedly proposes fourth-order elastic/path terms, stiffness, a microscopic Hessian, mode analysis, and a “fail-rigid” mathematical audit;
- Nathan explicitly instructs the builders not to steer calculations toward known constants or benchmarks;
- Nathan’s embedded corrections demote lattice and `Z3` machinery, treat the CP value as a baseline rather than a lock, correct the Whirligig description, and insist that standard physics and Minkowski geometry perform the initial mapping;
- generated passages repeatedly overclaim source ingestion, mathematical equivalence, and deletion readiness. Those claims were treated as `GEN/HISTORICAL` or `GEN/QUARANTINED`, not imported.

No historical constant, particle label, lattice rule, raw `theta4`, or claimed toolbox equivalence was used.

### H(s)H September 30 dump — read in full

`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATO_4D_assessment.txt`, lines 1–1000 followed by 1001–EOF empty, therefore complete.

Relevant Nathan-authored construction actually read:

- three candidate pictures are distinguished: straight worldlines intersecting a moving resolver, helical filaments with different axis and tangent angles, and a globally straight “guitar string” with local vibration;
- the source identifies the axis-angle/local-tangent-angle collision as a likely cause of earlier notation and tuning failures;
- Nathan proposes a second, explicitly tentative image: a rising viscous interface with a skin, temporarily scarred by a vibrating filament, followed by healing below the interface;
- Nathan does not promote this image over the block model and records it for possible return.

The generated reply’s claims about a physically growing spacetime, causality, entropy, and external frameworks were not treated as source facts.

### Onboarding and retrieval record

Before construction I re-read `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, the Common Reference Desk overview, current workflow orientation, task graph, symbol controls, toolbox namespace ledger, and `WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md`, especially CF-007, CF-009, and CF-013.

The shared Mersearch request slot was occupied by `2026-10-10-orson-one-drop-universe-math-001`, so it was not overwritten. Generic GitHub search was used only after inspecting that live slot. HSH_RESOURCES remained a quarantined routing/prior-art surface; no external proposition was imported.

## Source, inference, conjecture

**Source facts (`SRC/HISTORICAL`):** the old construction contains finite-worldtube elasticity and Hessian/mode-analysis intentions; the September source contains the tentative temporary-scar/healing image.

**Ravel inference (`SAT/ACTIVE` within this sandbox):** if “scar” and “healing” are to be more than renderer behavior, they require a state field and a relaxation operator. A single scalar scar is justified only if the field spectrum contains one isolated, strongly excited mode.

**New conjecture (`GEN/CANDIDATE`):** the order of the contact operator is a discriminator between membrane-like distributed healing and plate/shell-like nearly lumped memory. Second-order healing naturally gives a crowded low spectrum; fourth-order bending can isolate the fundamental.

## Minimal mapped system

Use local namespace `LOCAL:RAVEL-CCPD`. The existing director/contact energy is

\[
E[\psi,h]=\int_0^1\left[
\frac{C}{2}\psi_s^2+\frac{K}{2}\sin^2\psi+\Lambda hV(\psi)
+\frac{B_p}{2}h_s^2+\frac{A_p}{2}(h-h_{\rm tar})^2
\right]ds.
\]

The minimal healing dynamics are

\[
\eta_h h_\tau
=B_p h_{ss}-A_p(h-h_{\rm tar})-\Lambda V(\psi).
\]

With homogeneous Dirichlet ends on a unit interval, the uncoupled contact rates are exactly

\[
r_n^{(h)}=\frac{A_p+B_p(n\pi)^2}{\eta_h}
=\frac{A_p}{\eta_h}\left[1+(n\pi\ell_p)^2\right],
\qquad \ell_p=\sqrt{B_p/A_p}.
\]

Therefore

\[
\frac{r_2^{(h)}}{r_1^{(h)}}
=\frac{1+4q}{1+q},
\qquad q=(\pi\ell_p)^2,
\]

and hence

\[
1<\frac{r_2^{(h)}}{r_1^{(h)}}<4.
\]

This is the analytic core: a second-order healing field can never produce the predeclared decade spectral gap between its first two contact modes, for any `ell_p`. Slowing the pad slows a band, not one coordinate.

## Numerical closure phase diagram

The coupled generalized Hessian was solved at `C=0.010`, `K=0.050`, `A_p=40`, `Lambda=13.5`, `N=121`, with no historical constants or particle targets. For each `(ell_p,eta_h/eta_psi)`:

1. compute the retained polar equilibrium;
2. diagonalize the full director–pad generalized Hessian;
3. classify a mode as contact-dominated when its kinetic-metric contact participation exceeds 0.5;
4. use the third statically eliminated director rate as the low-frequency cutoff;
5. label the regime static/slaved, candidate one-contact-mode, or distributed;
6. independently require a factor-10 gap to the next contact mode for a strict scalar closure.

| `ell_p` | candidate one-mode interval in `eta_h/eta_psi` | distributed onset | strict gap ever passes? |
|---:|---:|---:|:---:|
| 0.012 | 20.50–21.00 | 21.25 | no |
| 0.018 | 20.50–21.00 | 21.25 | no |
| 0.025 | none | 20.75 | no |
| 0.035 | none | 21.00 | no |
| 0.050 | none | 21.65 | no |
| 0.075 | none | 22.50 | no |
| 0.100 | none | 24.00 | no |

The narrow thin-pad interval is a threshold-ordering artifact, not an isolated mode. Its first two uncoupled pad-rate ratios are only `1.00426` at `ell_p=0.012` and `1.00956` at `ell_p=0.018`.

For comparison:

| `ell_p` | exact discrete `r2/r1` at `N=121` |
|---:|---:|
| 0.012 | 1.00426 |
| 0.025 | 1.01839 |
| 0.050 | 1.07222 |
| 0.100 | 1.26941 |

### Grid refinement

At `ell_p=0.012`, grids `N=81,121,161` all returned the same candidate interval `20.50–21.00` and distributed onset `21.25`. At `ell_p=0.025`, all three grids returned no one-mode interval and distributed onset `20.75`. Equilibrium gradient residuals were between `4.58e-8` and `2.98e-7`.

### Annular control

At the symmetric zero-director annular state, the largest director/contact cross-Hessian entry was

\[
\max|H_{\psi h}|=2.95\times10^{-17}
\]

for every tested `ell_p`; the normalized cross-block norm ranged from `1.22e-17` down to `1.58e-18`. The polar slow-mode structure is therefore not a numerical feature automatically manufactured by pad compliance.

## Competing architecture: bending-supported contact skin

The smallest operator change capable of producing a genuine scalar gap is a fourth-order surface-bending term:

\[
\eta_h h_\tau
=-D_p h_{ssss}+B_p h_{ss}-A_p(h-h_{\rm tar})-\Lambda V(\psi).
\]

For the clean minimal pair `B_p=0`, `L=1`,

\[
r_n^{(4)}=\frac{A_p+D_p(n\pi)^4}{\eta_h}.
\]

A decade separation requires

\[
\frac{A_p+16D_p\pi^4}{A_p+D_p\pi^4}\ge10
\quad\Longleftrightarrow\quad
\frac{D_p\pi^4}{A_p}\ge1.5.
\]

Numeral by numeral,

\[
\frac{D_p}{A_p}\ge\frac{1.5}{\pi^4}=0.0153990,
\qquad
\ell_4=(D_p/A_p)^{1/4}\ge0.352268.
\]

At equality, the first three rates normalized by `A_p/eta_h` are

\[
(r_1,r_2,r_3)=(2.5,25.0,122.5).
\]

This architecture can support an isolated fundamental; the second-order membrane cannot. But `D_p` may be admitted only if finite-core boundary bending or shell mechanics independently produces it. It cannot be added merely to rescue scalar memory.

## What follows conditionally for H(s)H

If the temporary-scar image is taken seriously, H(s)H must distinguish:

- **intersection trace:** the resolver’s instantaneous geometric intersection;
- **contact state:** deformation retained by the resolving/contact structure;
- **material memory:** a state that remains after forcing is removed;
- **rendering memory:** coordinates retained only because code appends them.

For the present second-order contact law, the contact state is a continuum spectrum. A particle-like scalar “scar amplitude” is not mechanically licensed. The choices are then:

1. keep the full contact field;
2. retain several contact modes;
3. derive a bending-supported surface with an isolated fundamental;
4. abandon contact memory as the retention mechanism.

## Failure conditions

Reject the fourth-order rescue if:

- no finite-core surface constitutive law produces positive `D_p`;
- physically correct boundary conditions destroy the spectral separation;
- the forcing projects comparably onto several modes despite a rate gap;
- the gap or modal residue fails grid refinement;
- an annular control acquires comparable sign-selective coupling;
- nonlinear contact, unilateral separation, or self-contact eliminates the isolated branch.

The current calculation is limited to a one-dimensional synthetic pad, fixed load `13.5`, Dirichlet ends, linearized relaxation, and dimensionless coefficients. Its no-go applies to that second-order operator class, not to every possible finite-core contact geometry.

## Tight next test

Implement the mixed second/fourth-order contact operator with hinged and clamped boundary conditions, project the polar forcing onto every contact eigenmode, and compare transfer functions:

- second-order membrane: clustered relaxation corners with `r2/r1<4`;
- bending-supported skin: potentially isolated first corner and `n^4` high-mode spacing;
- annulus: no linear sign-selective director/contact residue.

A benchtop discriminator is frequency-domain indentation/orientation spectroscopy of the same asymmetric insert under a tension-dominated membrane and a bending-dominated thin plate. One extra Debye-like corner favors a justified scalar closure; multiple nearby thickness-dependent corners require a distributed field.

## Durable artifacts

- `WORKSPACES/RAVEL/CODE/contact_closure_phase_diagram.py`
- `WORKSPACES/RAVEL/DATA/contact_closure_phase_diagram.json`
- `WORKSPACES/RAVEL/FIGURES/contact_closure_phase_diagram.svg`

**Next cursor:** implement the fourth-order contact skin and test whether its apparent scalar mode survives forcing-residue, boundary-condition, nonlinear-contact, and annular-null gates.
