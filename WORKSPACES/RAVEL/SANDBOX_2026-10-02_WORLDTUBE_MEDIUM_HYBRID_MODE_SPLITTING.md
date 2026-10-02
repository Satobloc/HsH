# Ravel sandbox — physical worldtube–timesheet hybrid modes

**Status:** siloed playground checkpoint; not canonical theory  
**Date:** 2026-10-02  
**Narrow question:** If the finite worldtube and the resolving timesheet/medium are physical interaction partners, what spectral effect distinguishes genuinely interaction-generated particle/nonparticle states from a passive change of slice or observation basis?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt` — substantial full sequential read. Retained source facts: rotating bodies have helical worldtubes; fundamental and macroscopic helices may both stir a medium; differences may arise from pitch/radius, material resistance, dissipation, nested helical structure, and chirality cancellation; the file explicitly separates medium-vortex effects from direct filament-on-filament mechanics. Historical battery/gravity targets were not used.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt` — full sequential read. Retained source facts: a dynamic timesheet field has inertia, tension, bending, and reciprocal coil loading; an angle-only interaction gives torque but no long-range translation; source–load normalization remains underived; passive moving-sheet sampling changes sampled frequencies but is not itself a physical interaction law.
3. Targeted Google Drive search for `worldtube timesheet coupled modes resonance` and `filament medium mode splitting` — no relevant controlling note found.
4. Targeted common-Slack search for `timesheet coupling` and `mode splitting` — no prior avoided-crossing construction found.

## Source / inference / conjecture boundary

**Source fact:** the archive supplies the physical-medium motif and the H(s)H bridge supplies reciprocal dynamical degrees of freedom.  
**Inference:** if both have inertia and restoring response, their linearized local dynamics must be treated as a coupled generalized eigenproblem, not only as a sampling map.  
**New sandbox conjecture:** some particle/nonparticle distinctions may be bright/dark hybrid normal modes of the finite core plus resolving medium. No Standard Model or cosmological identity is assigned.

## Minimal typed construction

Take one localized finite-core rotational/deformation coordinate (	heta(t)) and one localized timesheet/medium coordinate (phi(t)). They are physical coordinates, not observation labels. Let

[
L=rac12 I_cdot	heta^2+rac12 I_Sigmadotphi^2
-rac12K_c	heta^2-rac12K_Sigmaphi^2-g(a)	hetaphi .
]

Definitions:

[
omega_c^2=rac{K_c}{I_c},qquad
omega_Sigma^2=rac{K_Sigma}{I_Sigma},qquad
G=rac{g}{sqrt{I_cI_Sigma}} .
]

The squared normal-mode frequencies are

[
oxed{omega_pm^2=
rac{omega_c^2+omega_Sigma^2}{2}
pmrac12sqrt{(omega_c^2-omega_Sigma^2)^2+4G^2}}
]

and the mixing angle obeys

[
oxed{	an 2chi=rac{2G}{omega_c^2-omega_Sigma^2}} .
]

At exact resonance,

[
omega_pm^2=omega_0^2pm |G|,
qquad
oxed{Delta(omega^2)=2|G|}.
]

Stability of this two-mode quadratic truncation requires

[
oxed{g^2<K_cK_Sigma}.
]

Two useful invariants are

[
omega_+^2+omega_-^2=omega_c^2+omega_Sigma^2,
]

[
omega_+^2omega_-^2=omega_c^2omega_Sigma^2-G^2.
]

## Physical-interaction discriminator

Let an external instrument couple through

[
O=q_c	heta+q_Sigmaphi.
]

The pole locations are (omega_pm); the modal residues are

[
Z_pm=|qcdot v_pm|^2.
]

Changing the observation basis (q) can change or even cancel a residue, but it cannot move the poles. A physical coupling (g
eq0) moves the poles and produces level repulsion.

Therefore:

[
oxed{	ext{passive slice/basis change: amplitudes change, poles fixed}}
]

[
oxed{	ext{physical core–medium interaction: poles split and avoid crossing}}
]

A hybrid can be probe-dark when (qcdot v_pm=0) while still carrying energy. That is a genuine interaction-generated dark mode, but it is not assigned a particle or cosmological identity here.

## Finite-core contact/support discriminator

Let the core inertia scale as

[
I_c(a)propto a^{d_I+2},
]

the local medium inertia as

[
I_Sigma(a)propto a^{j_Sigma},
]

and the physical contact coupling as

[
g(a)propto a^q.
]

At tuned resonance,

[
Delta(omega^2)
=rac{2g}{sqrt{I_cI_Sigma}}
propto a^zeta,
]

with

[
oxed{zeta=q-rac12(d_I+2+j_Sigma)}.
]

Hence

[
oxed{q=zeta+rac12(d_I+2+j_Sigma)}.
]

Combining this with the prior static/dynamic support inversion (d_I=e-2s-2) gives

[
oxed{q=zeta+rac12(e-2s+j_Sigma)}.
]

For a fixed local medium mode (j_Sigma=0),

[
oxed{q=zeta+rac e2-s}.
]

Thus three independent slopes—static closure-energy (e), uncoupled core ringdown (s), and avoided-crossing squared-gap (zeta)—infer the contact exponent (q) without using a particle target.

Illustrative bulk-inertia case (d_I=3, j_Sigma=0):

| coupling support | (q) | predicted (zeta) |
|---|---:|---:|
| line/strand-like | 1 | (-3/2) |
| boundary-area-like | 2 | (-1/2) |
| volume-like | 3 | (+1/2) |

These labels are geometric interpretations of exponents, not assumed ontology.

## Numerical check

A direct (2	imes2) symmetric eigenproblem with (omega_c=1) and (G=0.08), sweeping (omega_Sigma) from (0.7) to (1.3), gave the minimum squared-frequency gap at (omega_Sigma=1):

[
Delta(omega^2)_{min}=0.16000000000000014,
]

matching (2G=0.16). Sum and product invariant errors were numerically zero. Log–log fits for (d_I=3, j_Sigma=0) gave (zeta=-1.5,-0.5,+0.5) for (q=1,2,3), respectively.

## Candidate comparison

- **Passive resolving map:** can alter sampled frequency or visibility, but cannot create an avoided crossing in the system poles.
- **Physical timesheet/medium mode:** naturally produces hybridization, pole splitting, energy exchange, and possible bright/dark partners.
- **Layered finite core:** supplies a separate contact exponent (q), so boundary-, strand-, and volume-dominated coupling become experimentally distinguishable.
- **Boundary-only carrier:** can reproduce the (q=2) scaling only if its inertia and medium participation satisfy the declared exponents; it is not automatically equivalent to the layered model.

## Failure conditions

This construction fails as a particle-state mechanism if:

1. tuning the uncoupled frequencies produces crossing rather than level repulsion;
2. the fitted minimum gap is compatible with zero after damping and calibration;
3. the inferred (q) is not stable across radius or excitation amplitude;
4. apparent dark states move under probe-basis changes while the pole spectrum remains unchanged;
5. (g^2ge K_cK_Sigma), yielding a soft instability instead of stable hybridization;
6. multiple medium modes, strong nonlinearity, or non-Hermitian damping invalidate the two-mode truncation.

## Proposed solver/experiment

At several core radii (a):

1. identify the uncoupled core ringdown (omega_c(a));
2. tune a resolving-medium stiffness through resonance;
3. fit both complex poles, not only observed peak heights;
4. test the trace and determinant invariants above;
5. record the minimum (Delta(omega^2)), infer (zeta), and combine with (e,s) to obtain (q);
6. rotate the probe/readout basis while holding the physical coupling fixed.

A true physical interaction keeps the avoided-crossing pole gap while redistributing residues. A passive slicing artifact changes residues without level repulsion.

## Next dependency

Build the damped (2	imes2) response matrix and determine the regime in which linewidth overlap can fake a crossing or hide one; the decisive quantity should be a resolvability bound involving (G) and both damping rates.
