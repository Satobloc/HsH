# Orson Vay | OV-43 | Observer-resolution / multipole / Hessian gate
**2026-10-09 | SANDBOX / NONCANONICAL | namespace LOCAL:ORSON-OV43**

## Primary provenance (actually read)
- SAT_THEORY_ARCHIVE_2023-25: `2026/GRAVITY TWIST.txt`, lines 1150–1600. Nathan's literal physical 4D filament wrapping correction; assistant linking/history gloss is not doctrine.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BOSONIC TIME AND TWO GRAVITIES.txt`, lines 250–700. Nathan's demand to isolate mechanisms and not overclaim macroscopic resonance; assistant elastic locks unverified.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`, lines 2700–2940, supplemental; no generated numerical constants imported.
- Read Common front door, reference desk, War Room declaration, relevant symbol/citation/tool/workflow pointers, and HSH_RESOURCES routing. No PRIOR_ART access. Mercer_Searcher `tools/search_archive_content.py` inspected; exact-file direct reads were used, not corpus-wide GitHub search.

## Independent geometric fixture
Euclidean R4 mirrored centerlines:
`X_h(s)=(s,0.4(1-cos s),0.8 sin s,h*1.2(s-sin s))`, h=±1.
Full metric tube radius a=0.52; 3D t=0 intersection Omega_h computed from closest 4D centerline distance, not local tangent approximation.
Unnormalized Gaussian probe centered c=(0,0.48,0.25):
`U_h(c,sigma)=integral_{Omega_h} exp(-|r-c|²/(2 sigma²)) d³r`.
Energy lambda*U is a **stipulated** contact law, not derived H(s)H mechanics.

Analytic derivatives:
`grad_c U = sigma^-2 integral (r-c) exp(...) d³r`;
`H_ij = sigma^-4 integral [(r_i-c_i)(r_j-c_j)-sigma² delta_ij] exp(...) d³r`.
Radial integration correctly uses `r² dr dOmega`.

## New exact/asymptotic result
Reflection makes signed volume and first moments vanish, but
`Delta M_yz = integral yz (chi_+ - chi_-) d³r = 0.00055887650664`.
Therefore, for broad Gaussian probes:
`U_+-U_- = c_y*c_z*Delta M_yz / sigma^4 + O(sigma^-6)`.
Independent coefficient `6.70651808e-5`. Numeric tail slope (sigma≥4): **-3.98360**; at sigma=12, direct integration is 99.772% of asymptotic value.
For very narrow probes centered inside both tubes, the difference also vanishes. Thus absolute chiral contrast has an intermediate optimum: **sigma*=0.2613802**, **Delta U_max=0.0006387530** (fixture values, not universal constants).

At sigma=0.33: `U_+=0.17437928156, U_-=0.17378872229`; `Delta grad U=(0.0001607253,0.0001191389,0.0013669119)`.
Contact Hessian eigenvalues: plus `(-0.99454385,-0.93999192,0.14125542)`; minus `(-0.99060901,-0.93070565,0.14801854)`. Contact-only stability **not established** (indefinite Hessian and nonzero force).
With separately stipulated harmonic support `k|c-c0|²/2`, k=1, lambda=0.1, both equilibria have positive-definite total Hessians (smallest eigenvalues 0.91051, 0.91094); parity-dependent `Delta c_z=-0.00011775251`. First-order prediction `Delta c*=-(lambda/k)Delta grad U(c0)+O(lambda²)` gives `Delta c_z=-0.00013669119`.

## Checks / failure conditions
Reflection energy error 2.78e-17; analytic-vs-finite-difference Hessian max error 6.53e-7; 70x140 vs 110x220 angular-grid contrast difference 4.92e-12; nearest-distance control max error 2.22e-16; 80 rays checked, none multiply crossing. No global proof of positive reach or radial star-shapedness. Gaussian profile unnormalized; normalizing changes sigma scaling and optimum interpretation. No physical lambda, elasticity, or observer-noise law derived. Parity signal reverses with reflected apparatus; no fundamental parity violation inferred.

## External comparison (post-derivation, abstract-level)
Chen & Niles-Weed (2021), *Asymptotics of Smoothed Wasserstein Distances*, DOI 10.1007/s11118-020-09895-9: moment matching controls Gaussian-smoothing asymptotics in a different mathematical problem. Not imported as proof.

## Continuity
Full derivation, standalone solver, results, four precision plots and 20 paired cognition assays prepared in this Orson conversation as `Orson_OV43_Observer_Resolution_Hessian_Packet.zip`. Assays **not administered**. Next: replace probe/support fixture with recovered finite-core elastic deformation functional, then re-evaluate parity-sensitive Hessian; separately administer blinded neutral/authority cognition pairs.
**Orson Vay**
