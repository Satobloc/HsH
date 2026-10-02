# Mercer Sandbox — Dynamic skin-depth inverse map

**Date:** 2026-10-02  
**Status:** SANDBOXED / noncanonical constitutive extension  
**Role:** Mercer  
**Central question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Sources actually read this run

### Old SAT
`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt`

Substantially read the opening construction through the active worldline-timesheet interaction and subsequent objections/replies. Source facts used here:
- SAT treats worldline + timesheet as the minimal Minkowski grammar.
- acceleration is represented by changing worldline angle / curvature;
- internal degrees are tentatively placed into curve oscillation / helix geometry;
- the timesheet is promoted from passive slice to active participant;
- filament-timesheet interaction transfers energy in both directions;
- particle/worldline distortion should therefore distort the timesheet;
- later clarification says particle mass ratios should come from worldline geometry, while filament-timesheet mutual distortion is downstream of that geometry.

### Current H(s)H / September-30 dump
`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md`

Read completely. Frozen local result used:
[
ell_parallel=2sqrt{rac{2ho_{m eff}}{K}},qquad
ho_{m eff}=ho_n+h,
]
and
[
ho_{m eff}=rac{Kell_parallel^2}{8}.
]
Run 136 proves effective support and incidence are identifiable for fixed (K), but (ho_n) and (h) are not separately identifiable from the same static observables.

No PRIOR_ART or HSH_RESOURCES source was used before the construction below.

---

## Mercer inference

The static ambiguity (ho_{m eff}=ho_n+h) is exactly what should happen if a finite carrier is measured through a finite responsive medium: a static contact span only sees total support.

But old SAT makes the timesheet an **active energy-bearing medium**, not a rigid ruler. An active medium should generally possess a response time / penetration law. Therefore repeat the same contact measurement dynamically rather than inventing a new geometric observable.

This suggests that Run 136's static non-identifiability may be broken by frequency dependence.

---

## New sandbox conjecture: frequency-dependent effective support

Use the minimal linear diffusive response as a first constitutive fixture:

[
partial_t u=D,partial_z^2u.
]

For harmonic forcing (upropto e^{-iomega t}), the penetration depth scales as

[
delta(omega)=sqrt{rac{2D}{omega}}.
]

For a resolving layer of physical thickness (h), use the smooth bounded fixture

[
oxed{
h_{m eff}(omega)
=
h	anh!left(rac{delta(omega)}{h}ight)
=
h	anh!left(sqrt{rac{2D}{omega h^2}}ight)
}
]

so that
- slow forcing penetrates the whole medium: (h_{m eff}	o h);
- fast forcing probes only a skin depth: (h_{m eff}	osqrt{2D/omega}).

Replace the static support in the frozen H(s)H span law by

[
ho_{m eff}(omega)=ho_n+h_{m eff}(omega).
]

Then

[
oxed{
ell_parallel^2(omega)
=
rac{8}{K}
left[
ho_n+
h	anh!left(sqrt{rac{2D}{omega h^2}}ight)
ight].
}
]

This is a constitutive extension, not a result contained in Run 136.

---

## Two asymptotic regimes

### Slow / fully penetrated regime

For
[
omegallomega_c,qquad
omega_c:=rac{2D}{h^2},
]

[
oxed{
ell_{m low}^2
	o
rac{8}{K}(ho_n+h).
}
]

This reproduces the Run-136 static observable exactly.

### Fast / skin-depth regime

For
[
omegaggomega_c,
]

[
	anh xsimeq x
]

and therefore

[
oxed{
ell_{m high}^2(omega)
simeq
rac{8}{K}
left[
ho_n+sqrt{rac{2D}{omega}}
ight].
}
]

Hence

[
oxed{
lim_{omega	oinfty}
rac{Kell_parallel^2}{8}
=
ho_n.
}
]

The high-frequency intercept reconstructs the finite carrier support directly.

Moreover, plotting (ell^2) against (omega^{-1/2}) gives

[
oxed{
ell^2
simeq
rac{8ho_n}{K}
+
rac{8sqrt{2D}}{K},omega^{-1/2}.
}
]

Thus:
- intercept -> (ho_n);
- slope -> (D);
- low-frequency plateau -> (ho_n+h), hence (h).

The static ambiguity is therefore broken by one frequency sweep.

---

## Synthetic numerical check

A scripted fixture used independently chosen values

[
ho_n=2,qquad h=5,qquad D=3,qquad K=4.
]

It gives

[
omega_c=rac{2D}{h^2}=0.24,
]

[
ell_{m low}=sqrt{rac{8(2+5)}4}=3.7416573868,
]

and

[
ell_{infty}=sqrt{rac{8(2)}4}=2.
]

I generated 200 logarithmically spaced frequencies from (10^{-3}) to (10^5), added independent 0.2% Gaussian measurement noise to (ell), and fitted ((ho_n,h,D)) back from the full curve. The recovered values were

[
oxed{
ho_n=1.99988,qquad
h=5.00255,qquad
D=2.99165.
}
]

This is only an identifiability demonstration for the fixture, not evidence that the H(s)H medium is diffusive.

---

## Physical reading if the construction survives

The same finite carrier can present different apparent support at different forcing timescales:

[
	ext{slow probe}
ightarrow
ho_n+h,
]

[
	ext{fast probe}
ightarrow
ho_n+delta(omega).
]

That gives a concrete coarse-graining mechanism. Slow collective deformation recruits the full resolving medium; rapid/local oscillation recruits only a near-carrier layer.

A possible later interpretation is that smooth gravity-like response and rapid interbraid/electrogravity response may sample different constitutive depths of the same 4D carrier-medium system. That identification is **not** made here; only the scale-dependent support law is proposed.

---

## Tight discriminator / solver test

Hold geometric (K) fixed and impose a small harmonic incidence/contact perturbation over several decades in (omega). Measure (ell_parallel(omega)).

The diffusive fixture predicts all of the following simultaneously:

1. low-frequency plateau:
[
Kell^2/8	oho_n+h;
]

2. high-frequency intercept:
[
Kell^2/8	oho_n;
]

3. high-frequency correction:
[
Kell^2/8-ho_nproptoomega^{-1/2};
]

4. crossover scaling:
[
oxed{omega_c h^2/D=2.}
]

After reconstructing ((ho_n,h,D)), vary them independently in simulation. Curves should collapse under

[
R(Omega)
:=
rac{Kell^2/8-ho_n}{h}
=
	anh(Omega^{-1/2}),
qquad
Omega:=rac{omega h^2}{2D}.
]

That master-curve collapse is the strongest discriminator.

---

## Failure conditions

This branch fails in its present form if:
- dynamic H(s)H simulations show no frequency-dependent support;
- the fast correction is not asymptotically (omega^{-1/2}) when the medium is demonstrably diffusive;
- the inferred high-frequency intercept does not recover independently known carrier radius/support;
- no single ((ho_n,h,D)) fits low plateau, crossover and high-frequency tail;
- medium dynamics are wave-like, viscoelastic, nonlocal or strongly nonlinear over the relevant regime.

The last condition does not kill the broader strategy. It kills only the diffusive constitutive fixture. A wave-like medium would replace (delta(omega)) by its own response/penetration law while preserving the basic proposal: **use dynamic contact spectroscopy to separate carrier support from resolving-medium thickness.**

## Durable next cursor

Implement the same inverse problem for three constitutive classes:
1. diffusion / skin depth;
2. damped wave / finite propagation speed;
3. Kelvin-Voigt or Maxwell viscoelastic response.

Ask whether each class leaves a distinct dimensionless (ell_parallel(omega)) fingerprint. If so, the finite-core contact geometry becomes a constitutive spectrometer rather than merely a static geometry test.
