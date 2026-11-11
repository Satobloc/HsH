# Scale-location map contract and witness-carrying hierarchy

This note separates four operations that are often compressed into the phrase “scale factor” in nested worldtube proposals:

1. **Generator-parameter scaling** changes amplitudes, frequencies, phases, or parameterization of a one-dimensional curve.
2. **Finite-core scaling** changes cross-sectional profile or thickness around a generator.
3. **Braid/constituent scaling** changes the organization of filaments or constituents.
4. **Hierarchy/coarse-graining** maps a lower-level configuration into a parent or effective representation.

These are different map types. The June 23, 2026 SAT Overview user-role source (conversation `6a3a279a-10cc-83ea-9abf-4fc1dab9fb55`, raw blob `023ff77688672546aeff02deb3745289f6709c90`, message `28895d46-780e-46d9-a4cd-646f92fad193`) proposes one recursively nested 4D Nth-order superhelical worldline/worldtube but explicitly leaves scale placement unresolved: inside/outside, exponent, dot product, limit, or separate nesting.

The July 11, 2026 Reasoning with SAT-HSH source (conversation `6a51def1-1224-83ea-8b56-d9405e694034`, raw blob `b7868607d89f66bbc0e638398182fb2d6b2da2ce`) treats a Q=3 three-filament braid and He-3 scale repetition as a testable model commitment (message `357fae86-dd21-41fc-bf92-646bb4c336ac`; follow-up `c3f309e3-fc8d-4cca-98f7-4072c322e722`). A separate user-role message `95993cdf-7794-4270-84cb-af391d7cbaf1` distinguishes braid nesting from superhelical nesting. These must not be collapsed into one recursive operator.

## Conditional Lorentzian generator gate

The historical SAT4D bylined draft (June 2025; source blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; exact first-authoring event unresolved) displays:

```
gamma^mu(lambda) =
  (lambda,
   A_x sin(k_x lambda + phi_x),
   A_y sin(k_y lambda + phi_y),
   A_z sin(k_z lambda + phi_z))
```

Under the explicit conditional assumptions c=1 and Minkowski signature (-+++), the displayed tangent components have norm

```
eta(v,v) = -1
  + sum_i A_i^2 k_i^2 cos^2(k_i lambda + phi_i)
```

Pointwise timelikeness is equivalent to the sum being strictly below one at every lambda. This constrains a scale operation only if it acts on the generator parameters and the same Lorentzian parameterization is used at each level. It does not constrain core thickness, braid organization, or coarse-graining. It is not a law of the current H(s)H native positive-definite geometry; the representation map between those geometries remains unspecified.

## Explicit map contract

A future hierarchy must identify, rather than assume, each map:

- generator curve: `gamma_l : I_l -> M^4`;
- optional finite-core lift: `Phi_core,l : E_l -> M^4` (if a tubular-neighbourhood construction is selected; its domain and embedding conditions are not source-defined yet);
- separate braid/constituent data;
- parent/child assembly or nesting map;
- coarse-graining map;
- literal intersection with a timesheet, if intended, distinguished from a projection map;
- instrument/readout map.

Composition is allowed only when codomain and domain match. A 1D generator is not itself a finite-core 4D region; a 3D slice obtained by literal intersection requires a full-dimensional support and appropriate transversality. Projection and intersection are different operations.

## Formal composition result

Nadir's `NadirWitnessCarryingComposition` module is present on the current Nadir PR branch (module blob `babec58f7bcdf3b25b3688888c5dc5f2648876ea`). Exact-head Actions run #42953033586/job #130301572681 successfully built the full root library with Lean 4.34.0 / Lake 5.0.0 (8,956 jobs). The two-stage theorem composes induced maps between projection ranges when each stage's target readout is constant on the preceding projection's fibres. The intermediate range witness makes the next map well-typed. This proves an abstract composition condition, not any physical H(s)H map.

A separate conditional Kestrel Lean module has been added to the existing Kestrel PR #873 branch. Its first CI attempt failed because Greek `λ` was parsed as a reserved token; the source was corrected to ASCII `lam`. The follow-up run was still pending at publication time. No Kestrel Lean success is claimed in this artifact. The module is limited to the algebraic norm identity and pointwise timelike iff for the declared tangent components; it does not prove differentiation from the curve, proper-time normalization, or physical translation.

## Real-data anchor and test boundary

CREMA's 2025 muonic-3He 2S–2P spectroscopy plus bound-state/nuclear-theory extraction reports a helion rms charge radius of **1.97007(94) fm** (Science 388, 854–858; DOI 10.1126/science.adj2610). The existing Ravel audit is published at [issue #994](https://github.com/Satobloc/HsH/issues/994).

This radius is a charge-density second moment, not automatically a braid-envelope radius or a 4D worldtube boundary. The full raw spectroscopy package and joint experimental/nuclear-theory covariance were not recovered here. The H(s)H map from worldtube/timesheet/medium to 3D electromagnetic charge/current density, form factor, and muonic transition energies remains missing.

The 2025 helion result is therefore a real reference/calibration anchor, not a blind holdout and not an H(s)H prediction. A future test must freeze shared parameters before an independent transition/isotope/acquisition holdout, predict the full form factor or transition energies, compare with the conventional nuclear-structure/QED pipeline, and preregister a covariance-aware falsification threshold. No numeric threshold is assigned until the full covariance and data package exist.

The historical assistant-composite 0.0196 fm number is not a Nathan-authored prediction and is excluded. No new physical calculation, fit, H(s)H prediction, or independent validation is claimed. No SAT-O or Blockwave equation is modified.