# Ravel sandbox — damped hybrid-mode resolvability

**Status:** siloed playground checkpoint; not canonical theory  
**Date:** 2026-10-02  
**Narrow question:** When do losses hide or destroy the avoided crossing of a physically coupled finite core and resolving medium, and how can the intrinsic contact-coupling exponent still be recovered?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT XYZ/SAT-Y ThetaProof.txt` — full sequential read. The user-originating thread asks whether discontinuous stable masses could reflect resonance between a finite filament and the advancing time surface, with off-resonant energy transferred into surface strain, filament modes, or nearby filaments. This is retained only as the historical construction question. Its generated particle assignments, threefold restriction, mass laws, and spectrum targeting are excluded.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/COMPLEX_RESONANCES.txt` — full sequential read. This is an executable multi-harmonic filament/slice visualization. It establishes that complex apparent loops can arise from superposed frequencies, but it has no reciprocal coupling, damping law, or pole analysis.
3. Google Drive targeted searches for damped coupled modes, avoided crossings, linewidths, and filament–timesheet resonance — no relevant controlling derivation found.
4. Common Slack targeted searches for avoided crossing and linewidth/coupling — found the immediately preceding physical-hybrid packet, but no prior linewidth resolvability calculation.

## Source / inference / new conjecture

**Source fact:** the archive proposes resonance as a possible stability selector; the HsH code shows multi-harmonic traces but not physical hybridization.  
**Inference:** a physical core–medium interaction with losses is a non-Hermitian two-mode problem whose complex poles, not peak heights alone, determine whether there is genuine level repulsion.  
**New sandbox conjecture:** if particle/nonparticle states are hybrid modes, some missing states may be dynamically broadened rather than absent. No observed mass spectrum is used as input or comparator here.

## Damped physical model

Mass-normalize one finite-core mode (x_c) and one local resolving-medium mode (x_Sigma):

[
ddot x_c+kappa_cdot x_c+omega_c^2x_c+Gx_Sigma=f(t),
]

[
ddot x_Sigma+kappa_Sigmadot x_Sigma+omega_Sigma^2x_Sigma+Gx_c=0.
]

Here (G) has units of frequency squared. Near a common frequency (omega_0), define the rotating-wave coupling

[
g=rac{G}{2omega_0},
]

the bare detuning

[
Delta=omega_c-omega_Sigma,
]

and the linewidth difference

[
Deltakappa=kappa_c-kappa_Sigma.
]

The complex pole matrix is

[
H_{m eff}=
egin{pmatrix}
omega_c-ikappa_c/2 & g\
g & omega_Sigma-ikappa_Sigma/2
end{pmatrix}.
]

Its poles are

[
oxed{
widetildeomega_pm=
rac{omega_c+omega_Sigma}{2}
-irac{kappa_c+kappa_Sigma}{4}
pm
sqrt{
left(rac{Delta}{2}
-irac{Deltakappa}{4}ight)^2+g^2
}
}.
]

## Two distinct gates

At exact resonance (Delta=0), the real-frequency separation is

[
oxed{
S=
2sqrt{g^2-rac{(Deltakappa)^2}{16}}
}.
]

### Gate 1: real pole repulsion

[
oxed{
g>rac{|Deltakappa|}{4}
}.
]

At equality the two-mode truncation reaches an exceptional point. Below it, the real pole frequencies coincide while the decay rates split. Thus nonzero physical coupling does not guarantee a visible frequency gap.

### Gate 2: conservative peak resolvability

Demand that the real pole separation exceed the common resonance-scale full width

[
S>rac{kappa_c+kappa_Sigma}{2}.
]

This gives

[
oxed{
g^2>
rac{kappa_c^2+kappa_Sigma^2}{8}
}.
]

This is a declared one-FWHM resolution criterion, not a universal theorem about every instrument or drive channel. It is stricter than pole repulsion. Consequently there is a finite regime in which physical hybridization exists but ordinary spectra show one overlapping feature.

The usual cooperativity

[
mathcal C=rac{4g^2}{kappa_ckappa_Sigma}
]

is useful, but (mathcal C>1) alone does not guarantee the one-FWHM criterion when the linewidths are unequal.

## Damping-corrected contact inversion

The preceding lossless packet used the intrinsic squared-frequency gap

[
Delta(omega^2)_{m int}=2G.
]

Using only the observed real pole separation (S) biases this quantity downward. From the pole equation,

[
g^2=rac{S^2}{4}+rac{(Deltakappa)^2}{16}.
]

Therefore

[
oxed{
Delta(omega^2)_{m int}
=
2omega_0
sqrt{
S^2+rac{(Deltakappa)^2}{4}
}
}.
]

This is the central recovered residual. It remains nonzero at the exceptional point even though (S=0).

Define

[
mathcal G(a)=
2omega_0(a)
sqrt{
S(a)^2+rac{Deltakappa(a)^2}{4}
}.
]

If

[
mathcal G(a)propto a^zeta,
]

then the earlier contact-support inversion remains valid:

[
oxed{
q=zeta+rac12(e-2s+j_Sigma)
}.
]

For fixed local medium inertia,

[
oxed{q=zeta+rac e2-s}.
]

The exponent must be fitted from (mathcal G(a)), not raw peak separation.

## Numerical fixture and precision visual

The script used

[
omega_0=1,quad
kappa_c=0.08,quad
kappa_Sigma=0.04.
]

It returned

[
g_{m EP}=0.0100000,
]

[
g_{m resolve}=0.0316228.
]

At (g=0.02), the poles already repel with real separation (S=0.0346410), but their widths overlap strongly. At (g=0.08), the separation is (S=0.1587451) and two hybrid modes are clearly resolved.

- [Class P visual: damped hybrid-mode regimes](../VISUALS/damped_hybrid_mode_regimes.svg)
- [Reproducible solver](../SCRIPTS/damped_hybrid_modes.py)

The left panel plots the complex-pole real parts and linewidth bands versus detuning. The right panel plots the driven core response for uncoupled, hidden-repulsion, and resolved regimes. It draws the model equations, not an illustrative analogy.

## Candidate comparison

| Candidate | Pole locations | Peak amplitudes | Avoided crossing |
|---|---|---|---|
| Passive observation-basis change | unchanged | may change or vanish | none |
| Physical coupling, weak/unequal loss | shifted complex poles | often one broad feature | may be hidden |
| Physical coupling above resolution gate | shifted complex poles | two resolved peaks | visible |
| Coupling below exceptional-point gate | coincident real parts; split decay rates | one feature | no real-frequency repulsion |
| Multiple medium modes | several pole branches | drive dependent | multi-crossing spectrum |

## Failure conditions

This truncation fails or requires enlargement if:

1. measured complex poles cannot be fit by a two-mode determinant;
2. damping is strongly frequency dependent or non-Markovian;
3. coupling is dissipative/complex rather than reciprocal and real;
4. nonlinear frequency pulling changes with excitation amplitude;
5. several resolving-medium modes lie within one linewidth;
6. radius changes the identity of the tracked mode;
7. inferred (mathcal G(a)) is not stable across drive and probe channels.

A passive probe change must leave all fitted poles invariant. If fitted poles move when only the observation basis changes, the fitting or control protocol is contaminated.

## Prediction / solver packet

At each radius (a):

1. sweep the bare medium frequency across the core frequency;
2. fit the full complex poles (widetildeomega_pm);
3. measure (kappa_c,kappa_Sigma,S);
4. compute (mathcal G(a));
5. regress (zeta=dlnmathcal G/dln a);
6. combine with independently measured (e,s,j_Sigma) to infer (q);
7. repeat under multiple probe bases to confirm pole invariance.

**Falsification:** if the apparent splitting changes under probe rotation but the complex-pole determinant does not, it is a visibility effect. If the determinant itself shows no coupling term, the physical hybrid-state construction fails for that mode pair.

## Exact next dependency

Replace constant (kappa_c,kappa_Sigma) with a causal frequency-dependent medium self-energy (Sigma_Sigma(omega)). Determine whether its real and imaginary parts obey the required dispersion relation and whether a memory kernel can mimic or displace the two-mode contact exponent.
