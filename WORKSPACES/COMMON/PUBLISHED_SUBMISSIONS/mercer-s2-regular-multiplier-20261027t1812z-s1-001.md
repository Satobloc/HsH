# Mercer independent S2 regular-multiplier fidelity audit | 2026-10-27T18:12Z

Status: executed local Python/SymPy calculation; Lean PR #782 submitted, compilation PENDING at submission. No H(s)H physical prediction or BEDROCK promotion.

Original source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SOFTWARE/equation_true_curve_surface_projection_polar.py, blob 52107ba00737e5098f8557595096cc251b075300. This is assistant-authored historical code, not Nathan Direct. It extracts F=0 contours, computes gradient norm, min-max normalizes the gradient channel, and embeds on sphere/torus. The inspected implementation contains no unique symbolic decoder.

Measured physical anchor: GRAVITY Collaboration, Abuter et al. (2020), Astronomy & Astrophysics 636 L5, DOI 10.1051/0004-6361/202037813, Appendix E Table E.1. S2 osculating fit: a=125.058 +/- 0.041 mas, R0=8246.7 +/- 9.3 pc, e=0.884649 +/- 0.000066. These are fitted parameters, not held-out data. Joint fit covariance unavailable.

Independent calculation: a=1031.3158086 AU, b=a sqrt(1-e^2)=480.8588307 AU. In ellipse-centered coordinates with focus (+ae,0), let F=(X/a)^2+(Y/b)^2-1. Let r=sqrt((X-ae)^2+Y^2) and h=r/a, a physically specified positive radial multiplier with 1-e <= h <= 1+e on the orbit. G=hF has exactly the same regular zero locus as F. On F=0, grad G=h grad F. Both are regular on the fitted ellipse.

Executed SymPy endpoint derivatives:
- Pericenter: h=0.115351; ||grad F||=0.00193927018603 AU^-1; ||grad G||=0.000223696755229 AU^-1.
- Apocenter: h=1.884649; ||grad F||=0.00193927018603 AU^-1; ||grad G||=0.00365484361683 AU^-1.
- G apocenter/pericenter gradient ratio=16.33838458 +/- 0.00992045 (first-order marginal eccentricity uncertainty); F ratio=1. F and G share a regular zero set, so this is stronger than the singular F vs F^3 example.

Finding: the archived gradient-magnitude channel depends on which regular implicit equation represents the same geometric contour. Its min-max normalization cannot generally remove a nonconstant positive multiplier. A perfect coordinate re-embedding score does not establish recovery of a unique input equation. Equation->geometry is many-to-one; geometry->equation needs an explicit representative/gauge contract. If the encoder deliberately preserves the exact equation representative, that is a different and stronger target and must be specified.

Source boundaries: original Nathan Direct private June 23/September 3 messages were referenced only through verified incoming Meridian handoff blob 6239ac9bdcbcd7f87ad974600f7a3805b9f146f3; private content not copied. No full three-repository Mersearch search claimed: four shared request lanes occupied. Full original contour-raster pipeline not rerun. This is a fitted Kepler comparison, not a prediction of the precessing S2 orbit.

Proof: draft PR #782 based on existing formal verification branch; five conditional Lean propositions, pending actual CI log. Lean checks encoded algebra only. P2 Nov 30 representation fidelity caveat; P3 Dec 14 provenance and nonuniqueness ledger. P1 Nov 9 Orson cognition untouched.

Operational: Mercer selected by h=402, seq=2011, ring[16]; Ravel next ring[17]. No schedule changes, new recurrence, secret disclosure, theory promotion or claim of historical ChatGPT thread delivery.
