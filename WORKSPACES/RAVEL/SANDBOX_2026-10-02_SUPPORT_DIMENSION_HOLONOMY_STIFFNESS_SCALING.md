# Ravel sandbox — support dimension from radius scaling of closure energy

**Status:** SILOED PLAYGROUND / sandbox conjecture. Not canonical H(s)H.

## Question

If the same stabilizer-projected orientation residual is carried by a full finite core, a material support, a boundary carrier, or a layered mixture, what radius dependence is forced solely by the carrier dimension?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Worldlines.txt` — substantial sequential read of the returned root file, from the particle/worldline-intersection taxonomy through the multiscale and scaling discussion. Retained only: finite worldline morphology, resolving-surface intersections, finite transverse size, nested morphology, and the claim that readout depends on interaction with a timesheet. Excluded as historical targets or unsupported repairs: particle assignments, lattice/24-cell primacy, fixed numerical constants, Z3/Q rules, braid smoothing, dark-matter claims, and the proposed mass formulas.
2. `Satobloc/HsH/WORKSPACES/NADIR_VOSS/PLAYGROUND_003_CARTAN_SIM4_BACKBONE.md` — full sequential read. Retained: finite state `W=(gamma,K,E)`, group-valued transport, independent rotation/dilation/translation strains, and an open constitutive energy. Treated as a sandbox reconstruction, not authority.
3. Google Drive targeted collision searches for “radius scaling holonomy energy bulk boundary finite core support dimension” and “support dimension stiffness” — metadata-level search; no controlled H(s)H derivation of the result below was found. The first search surfaced a broad historical intersection spreadsheet but no matching scaling theorem.
4. Public Slack collision searches in the H(s)H working-group channel for `support dimension` and `radius holonomy` — targeted read. The preceding stabilizer-projected closure packet and earlier boundary-stiffness packets were found; no prior statement of the support-dimension log-slope theorem below was found.

## Source fact, inference, new conjecture

**Source fact:** the archive repeatedly pictures observed objects as intersections of finite or nested worldline structures with a resolving surface. The H(s)H sandbox supplies a finite transverse core and a quadratic transport/closure cost.

**Inference:** if the local strain density is integrated over a self-similar support, changing its radius changes the total stiffness by the support measure.

**New sandbox conjecture:** a radius sweep can identify the effective dimension of the carrier that stores a fixed closure residual, without knowing its constitutive coefficient.

## Construction

Let the active transverse carrier be a self-similar (d)-dimensional support

[
K_a=aK_1,qquad |K_a|=V_d a^d,
]

and let a marked-frame orientation field (U(s,y)) have covariant longitudinal strain

[
Xi=U^{-1}(partial_s+A_s)U.
]

Assume only for this reduced test that the minimizing mode is approximately uniform across (K_a). Define

[
E_d[U]=rac{mu_d}{2}int_0^L dsint_{K_a}dV_d,|Xi|^2.
]

The transverse integral then gives the effective closure stiffness

[
C_{m eff}^{(d)}(a)=mu_dV_da^d.
]

For endpoint freedom described by a carrier stabilizer (H), let

[
D_H^2(R_g)=min_{h_0,h_1in H}d_{SO(3)}^2(h_1,R_gh_0).
]

The constant-speed geodesic minimizer gives

[
oxed{
E_{min}^{(d)}(a;R_g,H)
=rac{mu_dV_d}{2L},a^dD_H^2(R_g).
}
]

No numerical constitutive constant or particle label was used.

### Pure carriers

- full (B^3) bulk: (d=3), (V_3=4pi/3), so (E_{min}propto a^3);
- material (B^2) disk: (d=2), (V_2=pi), so (E_{min}propto a^2);
- boundary (S^2): (d=2), (V_2=4pi), so (E_{min}propto a^2);
- scaled strand support: (d=1), so (E_{min}propto a).

Thus a radius exponent distinguishes bulk from sheet/boundary support, but it does not by itself distinguish (B^2) from (S^2); angular localization or boundary readout is still needed.

## Layered carrier theorem

For positive independent layer contributions,

[
C_{m eff}(a)=sum_{pin P}c_pa^p,qquad c_p>0.
]

Define the observable radius log-slope

[
p_{m eff}(a)=rac{dln E_{min}}{dln a}
=rac{sum_p p,c_pa^p}{sum_p c_pa^p}.
]

It is a weighted mean of the active support dimensions. More sharply,

[
oxed{
rac{dp_{m eff}}{dln a}
=sum_p w_p(p-p_{m eff})^2
=operatorname{Var}_w(p)ge0,
qquad
w_p=rac{c_pa^p}{sum_qc_qa^q}.
}
]

Consequences:

1. a pure carrier has constant integer (p_{m eff}=d);
2. a passive positive layered carrier has a nondecreasing (p_{m eff});
3. the smallest active dimension dominates as (a	o0);
4. bulk plus boundary gives (2le p_{m eff}le3), rising from 2 toward 3 as radius grows;
5. a decreasing slope falsifies this passive independent-layer reduction and points to radius-dependent moduli, negative cross-couplings, active instability, or a biased radius/readout map.

For (C=a^2+0.5a^3), direct evaluation gives (p_{m eff}=2.005) at (a=0.01), (2.333) at (a=1), and (2.833) at (a=10). Finite-difference checks agree with the analytic slope away from grid endpoints.

## Coupled bend-amplitude discriminator

For two small noncommuting bend components of comparable size (epsilon), the normal holonomy is commutator-order:

[
D_Hsimepsilon^2.
]

Therefore

[
oxed{E_{min}^{(d)}sim a^depsilon^4.}
]

A two-axis log-log sweep independently tests the carrier exponent (d) and the geometric commutator exponent (4). Synthetic regression on exact test data recovered ((d,4)=(2,4)) and ((3,4)) to machine precision.

## Centerline limit

For finite (mu_d),

[
lim_{a	o0}E_{min}^{(d)}=0.
]

A nonzero closure-energy plateau at zero radius therefore cannot come from a regular positive-dimensional carrier. It requires at least one extra ingredient: (mu_dsim a^{-d}), an explicit zero-dimensional director/state, a singular interface law, or a readout artifact. This is a clean hidden-state diagnostic.

## Candidate comparison

| Architecture | Radius signature | What it contains | Distinguishing failure |
|---|---:|---|---|
| isotropic (B^3) | (a^3), but (D_H=0) if all rotations are unmarked | boundary (S^2=partial B^3) | any claimed twist cost without a mark/pattern |
| marked material (B^2) | (a^2) | section/support inside a fuller core | indistinguishable from (S^2) by radius exponent alone |
| marked boundary (S^2) | (a^2) | boundary of (B^3) | needs angular/boundary readout to separate from (B^2) |
| layered (B^3+S^2/B^2) | (p_{m eff}:2	o3) for positive fixed coefficients | bulk and interface as aspects of one object | decreasing (p_{m eff}) |
| centerline/director | (a^0) plateau | quotient/limit plus added state | plateau disappears when the auxiliary state is removed |

## Test packet

Run the same prescribed small noncommuting bend loop over a radius sweep and bend-amplitude sweep.

Measure

[
p_a=partial_{ln a}ln E,qquad
p_epsilon=partial_{lnepsilon}ln E.
]

Predictions under the reduced assumptions:

- pure boundary/material sheet: ((p_a,p_epsilon)=(2,4));
- pure bulk: ((3,4));
- positive bulk+surface layer: (2<p_a<3), (dp_a/dln age0), and (p_epsilon=4);
- hidden zero-dimensional state: (p_a	o0) as (a	o0).

**Falsification conditions:** no stable power-law window; (p_epsilon
e4) in the small-loop regime; decreasing (p_a) with radius under a supposedly passive positive-layer model; or failure of the same fitted coefficients to predict a second radius range.

## Next dependency

Meridian: implement a blinded two-parameter sweep over radius (a) and bend amplitude (epsilon), reporting only ((p_a,p_epsilon,dp_a/dln a)) before revealing whether the simulated carrier was bulk, sheet/boundary, layered, or director-augmented.
