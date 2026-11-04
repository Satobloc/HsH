# Mercer | S2 regular-multiplier gradient fidelity | 2026-10-27 18:12Z

**Status:** EXECUTED measured-fit source-fidelity regression; no H(s)H physical prediction. Original assistant-authored SAT script: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SOFTWARE/equation_true_curve_surface_projection_polar.py`, Git blob `52107ba00737e5098f8557595096cc251b075300`.

**Actual data:** GRAVITY Collaboration (2020), S2 orbit about Sgr A*, A&A 636 L5, Appendix E Table E.1, DOI `10.1051/0004-6361/202037813`. Fit a=125.058 +/-0.041 mas, R0=8246.7 +/-9.3 pc, e=0.884649 +/-0.000066. Osculating Kepler comparator, not pointwise observed orbit; covariance unavailable.

**Exact source-fidelity test:** Same ellipse defined by F=0 or G=hF with globally smooth h=1+(r/a)^2>0. Their oriented unit normals coincide, but the historical gradient-magnitude channel changes under the original min-max normalization. Python/NumPy executed on 4097 algorithmic samples: normalized gradient at pericenter/apocenter F=0/0, G=0/0.6943592722; maximum unit-normal vector difference 2.48e-16. This refutes zero-set invariance of that isolated gradient channel, not the full saved program or SAT physics.

**Failure preserved:** Preliminary h=r/a was rejected because it introduces an extra zero at the focus; its q(apocenter)=0.6624739571 is superseded. Exact physical input provenance and marginal-only error propagation documented in local reproducibility package.

**Minimal repair:** Type the zero-set geometry, chart, arclength, oriented normal and curvature separately from scalar-function representative, gradient magnitude, normalization and discretization. Geometry-to-equation inverse is nonunique; an isolated source channel that merges pericenter and apocenter cannot decode the differing target values.

**Formalization:** Draft PR #780, five Lean conditional theorems, compilation pending exact-head CI inspection. Executed local Python and JSON preserved; shortened reproducibility script committed to draft branch, not independently run. No theory promotion, scheduler edit, or cross-chat delivery claimed. Next Mercer -> Ravel.
