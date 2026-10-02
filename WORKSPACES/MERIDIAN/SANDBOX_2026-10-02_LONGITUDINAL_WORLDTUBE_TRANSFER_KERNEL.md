# Meridian XXI — longitudinal worldtube transfer kernel

**Status:** siloed sandbox / speculative / not canonical H(s)H

## Fresh source intake

### SAT
`SAT_THEORY_ARCHIVE_2023-25/Ontic 2.txt.txt`

Substantially read opening architecture. Used: the (SO(4)\times\mathbb R^+) frame, six rotational generators plus dilation, recursive flow
[
\Phi(t,x)=e^{tv_n}\cdots e^{tv_1}x_0,
]
and its superhelical/worldtube interpretation.

Not used as targets: particle assignments, historical numerical claims, cosmological identifications, ontological claims.

### H(s)H / newly exposed old material
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt`

Read completely. The historical question was whether a localized interaction between two extended 4D particle-filaments at one temporal section should mechanically affect remote temporal portions of the same filaments. The useful distinction is between ordinary local causal physics and a speculative filament-wide tension/response.

No PRIOR_ART or HSH_RESOURCES used in forming this construction.

---

## Central construction

Do not initially identify the longitudinal coordinate with observer time. Let
[
\lambda
]
be a material/recursive coordinate along an H(s)H worldtube, and let
[
q(\lambda)
]
measure a small longitudinal deformation state.

Use the simplest positive quadratic constitutive energy:
[
E[q]
=
\frac12
\int
\left[
B(q')^2+Kq^2
\right]d\lambda
-Jq(0),
qquad B>0, K>0.
]

Variation gives
[
\left(
-B\frac{d^2}{d\lambda^2}+K
\right)q
=
J\delta(\lambda).
]

Define the constitutive operator
[
\boxed{
\mathcal C
=
-B\partial_\lambda^2+K.
}
]

On an infinite tube the bounded Green function is
[
\boxed{
G(\lambda)
=
\frac{1}{2\sqrt{BK}}
e^{-|\lambda|/\ell},
\qquad
\ell=\sqrt{\frac BK}.
}
]

Therefore
[
\boxed{
q(\lambda)
=
\frac{J}{2\sqrt{BK}}
e^{-|\lambda|/\ell}.
}
]

The remote-to-local response ratio is
[
\boxed{
\frac{q(L)}{q(0)}
=
e^{-L/\ell}.
}
]

## Interpretation boundary

SAT's 4D picture may say the whole filament exists in the map. It does **not** imply that a local event exerts instantaneous force on every other section.

Remote response requires constitutive mechanics:
[
\boxed{
\text{localized encounter}
\rightarrow
\mathcal C^{-1}
\rightarrow
\text{distributed worldtube response}.
}
]

If
[
B=0,
]
then
[
Kq=J\delta(\lambda),
]
and there is no longitudinal transfer.

Thus 4D extension alone does not supply mechanical communication. The transfer length
[
\boxed{
\ell=\sqrt{B/K}
}
]
is an H(s)H constitutive quantity.

## Candidate ᚼ grammar

Let recursive level (n) carry
[
\mathcal C_n
=
-B_n\partial_\lambda^2+K_n,
qquad
\mathcal G_n=\mathcal C_n^{-1}.
]

A mechanics-aware ᚼ may therefore act as
[
\boxed{
ᚼ:\mathcal C_n\rightarrow\mathcal C_{n+1}.
}
]

Two SAT drawings are mechanically equivalent in this channel when their response operators are equivalent under an allowed representation map (U):
[
\boxed{
\mathcal C_2=U\mathcal C_1U^{-1}
}
]
and hence
[
\boxed{
\mathcal G_2=U\mathcal G_1U^{-1}.
}
]

For recursive levels define
[
\ell_n=\sqrt{\frac{B_n}{K_n}}.
]

A self-similar response hierarchy would require a stable scale ratio such as
[
\boxed{
\frac{\ell_{n+1}}{\ell_n}=s.
}
]

Cross with an independently selected deformation wavelength (q_n^{*-1}) via
[
\boxed{
\chi_n=q_n^*\ell_n.
}
]

Interpretive regimes:
- (\chi_n\ll1): constitutive response spans many preferred wavelengths.
- (\chi_n\gg1): deformation decays before communicating across one preferred coil.
- (\chi_n\sim1): selected geometric wavelength and mechanical communication length coincide.

No historical SAT number is targeted by this construction.

## Tight discriminator

For the constant-coefficient fixture,
[
\boxed{
\log\frac{|q(L)|}{|q(0)|}
=
-\frac{|L|}{\ell}.
}
]

A semilog response-amplitude plot versus longitudinal separation must be a straight line.

Observed power-law tails, oscillatory transfer, compact support, directional asymmetry, or multiple decay lengths falsify this minimal operator and point toward higher derivatives, chirality, anisotropy, multiple fields, boundaries, or nonlinear/topological contact.

## Causal tripwire

If (\lambda) is identified with Lorentzian observer time, the elliptic operator above is not an acceptable propagation law. Replace it with a causal hyperbolic dynamics, schematically
[
\boxed{
\rho\,\partial_t^2q
-
B\,\partial_s^2q
+
Kq
=
J,
}
]
with characteristic propagation speed
[
\boxed{
c_q=\sqrt{B/\rho}.
}
]

Therefore an elliptic worldtube response kernel must not be interpreted as instantaneous physical signaling through observer time.

## Failure conditions

The construction fails if:
1. the worldtube has no meaningful longitudinal stiffness or memory;
2. (\lambda) cannot be separated from observer time where required;
3. nonlinear contact/topology dominates so strongly that a quadratic response operator is meaningless;
4. finite boundaries substantially alter the infinite-line kernel;
5. full H(s)H constitutive mechanics demands additional coupled internal fields.

These are productive failures because each identifies a missing mechanical ingredient.

## Compact grammar

[
\boxed{
\text{SAT 4D filament map}
\rightarrow
\text{localized encounter}
\rightarrow
\mathcal C
\rightarrow
\mathcal G=\mathcal C^{-1}
\rightarrow
\text{distributed finite-core deformation}
\rightarrow
\text{intersection/readout}.
}
]

Conceptual boundary:
[
\boxed{
\textbf{4D coexistence is kinematics.}
}
]
[
\boxed{
\textbf{Remote response requires constitutive mechanics.}
}
]

— Meridian
