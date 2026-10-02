# Ravel sandbox — static/dynamic inversion of finite-core support

**Status:** SILOED PLAYGROUND / sandbox derivation. Not canonical H(s)H.

## Narrow question

Does a torsional resonance identify whether closure strain is stored in a bulk (B^3), material (B^2), boundary (S^2), or layered finite core?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Frame dim .txt` — full sequential read. The user-originating question asks whether apparent “dimensions” could instead be relative-observability regimes. The generated response binds that question to historical numerical thresholds, lattice structure, blackout, and particle/cosmology claims; those dependencies are excluded. Retained only the methodological possibility that a measured regime change may reflect frame/readout structure rather than a new literal dimension.
2. `Satobloc/HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-02_SUPPORT_DIMENSION_HOLONOMY_STIFFNESS_SCALING.md` — full sequential read. Used as the immediate sandbox dependency: for fixed stabilizer-projected holonomy residual, static closure energy scales with the measure of its active support.
3. `Satobloc/HsH/WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_CROSS_SECTION_PACKET_001.md` — full sequential read. This file is explicitly quarantined and did not control the derivation. Its listed carrier families and moment distinctions were used only as a post-derivation collision check.
4. Google Drive targeted search for “torsional resonance radius rotational inertia finite core” — metadata search; only a broad historical conversation spreadsheet surfaced, with no controlled duplicate.
5. Public Slack collision searches for `torsional inertia radius` and `frequency radius support` — targeted read. They recovered the preceding static-radius packet and related finite-core work, but no static/dynamic support inversion.

## Translation of the old SAT motif

The archive file’s “frame dimensions” are not imported as literal dimensions or threshold levels. In the current finite-core language, the admissible translation is narrower:

[
	ext{apparent regime}
longrightarrow
	ext{carrier mechanics}
+	ext{relative readout}
+	ext{measured scaling exponents}.
]

A change of exponent may diagnose which part of a layered object stores strain or inertia. It does not by itself create a new spacetime dimension.

## Typed reduced model

Let (	heta(s,t)) be one small material orientation mode after quotienting coordinate-frame rotations and the carrier stabilizer (H). For a core radius (a), use

[
S_	heta
=
rac12int dtint_0^L ds
left[
mathcal J(a)dot	heta^2
-
mathcal C(a)(D_s	heta)^2
ight].
]

Here:

- (mathcal C(a)) is torsional stiffness per unit length;
- (mathcal J(a)) is rotational inertia per unit length;
- (D_s) includes the already-derived normal connection;
- only a carrier-visible orientation mode is retained.

For a self-similar (d)-dimensional support (K_a=aK_1),

[
mathcal C_d(a)=mu_dV_da^d.
]

Rigid angular motion has point speed (dot	heta,r_perp), so

[
mathcal J_d(a)
=
ho_dint_{K_a}r_perp^2,dV_d
=
ho_dJ_da^{d+2}.
]

The extra (a^2) is the lever-arm factor.

For a mode with longitudinal wavenumber (k_n),

[
oxed{
omega_n^2(a)
=
k_n^2rac{mathcal C_d(a)}{mathcal J_d(a)}
=
k_n^2
rac{mu_dV_d}{ho_dJ_d},a^{-2}.
}
]

Therefore

[
oxed{omega_n(a)propto a^{-1}}
]

for every co-located self-similar support dimension.

## Pure-carrier coefficients

For (k_n=1/L):

| Carrier and rotation axis | (mathcal C/mu) | (mathcal J/ho) | (omega aL/sqrt{mu/ho}) |
|---|---:|---:|---:|
| (B^3), any diameter | ((4pi/3)a^3) | ((8pi/15)a^5) | (sqrt{5/2}) |
| (S^2), any diameter | (4pi a^2) | ((8pi/3)a^4) | (sqrt{3/2}) |
| (B^2), normal axis | (pi a^2) | ((pi/2)a^4) | (sqrt2) |
| (B^2), in-plane axis | (pi a^2) | ((pi/4)a^4) | (2) |

A numerical log-log sweep over five decades returned slope (-1.0000000000000007) for all four fixtures. The prefactor contains shape and constitutive information, but the exponent does not reveal support dimension.

This is a useful null result: resonance radius scaling alone cannot select (B^3), (B^2), or (S^2).

## Static/dynamic support inversion

Let

[
e(a)=rac{dln E_{min}}{dln a}
=rac{dlnmathcal C}{dln a},
qquad
s(a)=rac{dlnomega}{dln a}.
]

Because (omega^2proptomathcal C/mathcal J),

[
rac{dlnmathcal J}{dln a}
=e-2s.
]

Removing the universal lever-arm power gives the effective inertia-support dimension

[
oxed{
d_K^{m eff}=e,
qquad
d_I^{m eff}=e-2s-2.
}
]

Thus static energy and ringdown frequency together separate where strain is stored from where moving mass is carried.

For locally pure powers, the support mismatch is

[
oxed{
Delta d
=
d_K-d_I
=
2(s+1).
}
]

Candidate signatures:

| Stiffness support | Inertia support | (e) | (s) | Inferred ((d_K,d_I)) |
|---|---|---:|---:|---:|
| bulk | bulk | 3 | (-1) | ((3,3)) |
| surface | surface | 2 | (-1) | ((2,2)) |
| surface | bulk | 2 | (-3/2) | ((2,3)) |
| bulk | surface | 3 | (-1/2) | ((3,2)) |

The universal co-location test is therefore

[
oxed{s=-1.}
]

It says only that stiffness and inertia have the same effective support dimension; (e) is still required to identify that dimension.

## Layered architecture

For

[
mathcal C(a)=sum_pc_pa^p,
qquad
mathcal J(a)=sum_q i_qa^{q+2},
]

the same local inversion remains exact:

[
d_K^{m eff}
=
rac{sum_ppc_pa^p}{sum_pc_pa^p},
]

[
d_I^{m eff}
=
rac{sum_qqi_qa^{q+2}}{sum_qi_qa^{q+2}}.
]

A numerical fixture with

[
mathcal C=a^2+0.4a^3,
qquad
mathcal J=0.7a^4+0.3a^5
]

recovered (d_I^{m eff}) continuously from (2.0005) at small radius to (2.9745) at large radius.

Unlike the static positive-layer slope, the curvature of the frequency slope has no fixed sign:

[
rac{ds}{dln a}
=
rac12left[
operatorname{Var}_{w_C}(p)
-
operatorname{Var}_{w_J}(q+2)
ight].
]

It compares the breadth of the active stiffness and inertia layers.

## Candidate comparison

- **Co-located (B^3):** ((e,s)=(3,-1)).
- **Co-located marked (B^2) or (S^2):** ((2,-1)); prefactor or independent moment/readout data must separate them.
- **Boundary stiffness on bulk inertia:** ((2,-3/2)), a natural layered signature.
- **Bulk stiffness with boundary-dominated moving mass:** ((3,-1/2)).
- **Hidden director stiffness:** a radius-independent static term drives (e	o0); with bulk inertia it gives (s	o-5/2), exposing the auxiliary state.
- **Isotropic unmarked (B^3):** the orientation mode is gauge, so no torsional resonance should exist at all.

## Solver / prediction packet

For the same carrier family and fixed longitudinal boundary conditions:

1. impose a small stabilizer-visible closure mismatch and measure (E_{min}(a));
2. release a small perturbation and measure the lowest underdamped ringdown frequency (omega(a));
3. fit local slopes (e(a)) and (s(a));
4. reconstruct (d_K^{m eff}=e) and (d_I^{m eff}=e-2s-2);
5. compare those exponents with a blinded carrier label.

Tight conditional predictions:

- every co-located self-similar passive carrier gives (s=-1);
- (s<-1) means inertia lives on a higher-dimensional support than stiffness;
- (s>-1) means stiffness lives on a higher-dimensional support than inertia;
- static (e=2) plus dynamic (s=-3/2) is the clean surface-stiffness/bulk-inertia signature.

No external particle observable is claimed; this is a sharp internal mechanics discriminator.

## Failure boundary

The inferred quantities cease to equal literal support dimensions when:

- (mu_d/ho_d) depends on radius;
- the cross-section deforms instead of rotating rigidly;
- surrounding medium contributes radius-dependent added inertia;
- damping is too strong to define a ringdown frequency;
- nonlocality or dispersion makes one (k_n) insufficient;
- the resolver biases the inferred radius;
- (H) changes with radius or the measured mode crosses into a gauge direction.

In those cases (d_K^{m eff}) and (d_I^{m eff}) remain measured scaling exponents, not geometric dimensions.

## Exact handoff

Meridian: extend the blinded (a	imesepsilon) sweep with a small-ringdown stage. Report ((e,s,d_K^{m eff},d_I^{m eff})) before revealing whether stiffness and inertia were assigned to bulk, boundary, sheet, or director layers.
