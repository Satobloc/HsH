# Mercer — similarity-renormalization condition for finite helical carriers

**Date:** 2026-10-02  
**Status:** SANDBOXED / SILOED PLAYGROUND / NOT CANONICAL

## Sources actually read

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SATv VISUAL VOCABULARY.txt`

Read in full. Relevant source construction: the time wavefront is a moving cross-section; filaments pierce it; orientation relative to the wavefront is assigned physical behavior; perpendicular is described as no-drag/massless, angled as drag/massive, and sinusoidal/helical structure as oscillation/twist/resonance/internal structure. Composite structures are hierarchical filament bundles.

### Current H(s)H
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md`

Read in full. Relevant frozen local result for generic rank-two support:
[
arepsilon sim rac{A_Sigma}{2C_4ell_parallel},
qquad
C_4=int_0^1sqrt{1-u^4},du,
]
with subsequent orientation reconstruction
[
etasimrac{C_4Kell_parallel^3}{4A_Sigma},
]
and admissibility (Kell_parallel^2le 8arepsilon).

No PRIOR_ART or HSH_RESOURCES source was used before the construction below.

## Translation

Replace the old ideal helical filament by a finite H(s)H tube whose centerline is locally a circular helix
[
X(phi)=(Rcosphi,Rsinphi,aphi).
]

Its curvature and torsion are
[
kappa=rac{R}{R^2+a^2},
qquad
	au=rac{a}{R^2+a^2}.
]

Therefore
[
R=rac{kappa}{kappa^2+	au^2},
qquad
a=rac{	au}{kappa^2+	au^2}.
]

If (	heta) is the tangent angle relative to the helix axis,
[
sin	heta=rac{kappa}{sqrt{kappa^2+	au^2}},
qquad
cos	heta=rac{	au}{sqrt{kappa^2+	au^2}}.
]

Thus the old SAT angular observable is a **ratio variable**, while finite H(s)H elasticity also sees the absolute curvature/torsion scale.

## New sandbox result: a recursion consistency condition

Take the minimal local elastic energy density per centerline length
[
mathcal E=rac12 B(arepsilon)kappa^2+rac12 C(arepsilon)	au^2.
]

One helical turn has length
[
L_{m turn}=rac{2pi}{sqrt{kappa^2+	au^2}},
]
so
[
E_{m turn}
=
pirac{Bkappa^2+C	au^2}{sqrt{kappa^2+	au^2}}.
]

Now perform a geometrically similar dilation by (lambda):
[
(R,a,arepsilon)	olambda(R,a,arepsilon),
qquad
(kappa,	au)	o(kappa,	au)/lambda.
]

The SAT angle (	heta) is invariant under this dilation. If
[
B,Cproptoarepsilon^p,
]
then
[
oxed{E_{m turn}(lambda)proptolambda^{p-1}}.
]

Therefore **angle-only energetic equivalence across recursively similar H(s)H carriers requires**
[
oxed{p=1},
]
i.e.
[
oxed{B(arepsilon),C(arepsilon)proptoarepsilon}.
]

This is not optional if one wants geometrically similar recursive levels to preserve a fixed per-turn energy/mass proxy while retaining the old SAT angle as the scale-free descriptor.

A conventional homogeneous circular rod instead has approximately (Bsim Yarepsilon^4). If that scaling were imported unchanged, then
[
E_{m turn}proptolambda^3.
]
To recover the recursion-invariant (p=1) branch would require an effective modulus running as
[
oxed{Y_{m eff}(arepsilon)proptoarepsilon^{-3}}.
]

That is a sharp constitutive demand, not a fitted historical number.

## Scripted check

Using the arbitrary fixture
[
(kappa_0,	au_0,arepsilon_0)=(0.8,0.6,0.1)
]
and similarity factors (lambda=(0.25,0.5,1,2,4)), direct numerical evaluation gives fitted log-slopes:

- (p=0): (E_{m turn}proptolambda^{-1})
- (p=1): (E_{m turn}proptolambda^{0})
- (p=2): (E_{m turn}proptolambda^{1})
- (p=4): (E_{m turn}proptolambda^{3})

For (p=1), all five numerical energies were exactly (0.3141592654) in the arbitrary normalization, confirming the analytic scaling.

## Finite-core discriminator

Run 133 reconstructs the tube radius independently:
[
arepsilonsimrac{A_Sigma}{2C_4ell_parallel}.
]

Therefore a solver can test the constitutive exponent without fitting radius. For a family of geometrically similar helical carriers:

1. reconstruct (arepsilon) from ((A_Sigma,ell_parallel));
2. measure ((kappa,	au));
3. verify constant helix angle (kappa/sqrt{kappa^2+	au^2});
4. calculate or perturbatively infer (B(arepsilon),C(arepsilon));
5. fit (p=dln B/dlnarepsilon) and (dln C/dlnarepsilon);
6. test whether per-turn energy follows (lambda^{p-1}).

## Two regimes

**Similarity-fixed / recursive regime:** (psimeq1). Per-turn energy is scale invariant despite changing absolute curvature. This is the clean branch if recursive H(s)H levels are meant to preserve the same angular energetic grammar.

**Ordinary homogeneous-rod regime:** (psimeq4) for fixed Young modulus and similar circular cross-section. Per-turn energy grows as size cubed. Recursive levels are then energetically inequivalent even at identical SAT angle.

This difference is large enough to discriminate numerically over only a modest scale range.

## Failure condition

This branch fails as a proposed SAT-to-H(s)H recursion bridge if:
- H(s)H recursion does not imply geometrical similarity of finite carriers;
- the relevant conserved/observable quantity is not per-turn energy;
- nonlocal/interbraid energy dominates local bending/torsion;
- measured effective (B,C) do not admit a controlled power-law scaling over any recursive window;
- or the old SAT angle is not supposed to remain energetically equivalent across scale.

A particularly useful negative result would be (p
eq1) together with a genuinely scale-invariant observable: that would prove some additional constitutive term is required.

## Next calculation

Add medium coupling
[
mathcal E_{m med}=rac{mu(arepsilon)}2(arepsilonkappa-	heta_0)^2
]
and interbraid/contact energy, then demand similarity covariance of the **whole** action rather than the isolated rod term. This should determine a set of scaling exponents for (B,C,mu,gamma,ldots). If a unique exponent family exists, it is a candidate renormalization rule for the ᚼ recursion; if no family exists, recursive self-similarity cannot be a symmetry of this constitutive architecture.

Everything after the two explicitly sourced constructions is Mercer sandbox inference/conjecture.
