# Calder | S2 measured-orbit curvature/null-control | 2026-10-27T20:12Z

Status: Executed Python/SymPy 1.14 calculation; conditional Lean PR #795 submitted, CI must be checked. No H(s)H physical prediction or theory promotion.

REAL SYSTEM: S2 around Sagittarius A*. GRAVITY Collaboration, A&A 636 L5 (2020), Appendix E Table E.1, DOI 10.1051/0004-6361/202037813. Fitted orbital inputs: a=125.058 ±0.041 mas, R0=8246.7 ±9.3 pc, e=0.884649 ±0.000066 (marginal fit errors). No full covariance; fitted elements are not independent held-out measurements.

ORIGINAL SAT SOURCE: SAT_THEORY_ARCHIVE_2023-25/SOFTWARE/equation_true_curve_surface_projection_polar.py, blob 52107ba00737e5098f8557595096cc251b075300, lines 1-210. Assistant-authored implementation, not Nathan Direct. Curvature and gradient channels have different invariance properties.

EXECUTED NULL TEST: For fitted ellipse F=X²/a²+Y²/b²−1, b=a sqrt(1−e²), and positive focus-distance multiplier h=r/a, G=hF has the same regular zero locus. On F=0, grad G=h grad F. Implicit curvature numerator scales h³, as does |grad|³, so curvature and oriented unit normal agree; gradient magnitude changes with equation gauge. Inverse from locus, normal and curvature to original equation is nonunique.

Derived from real fitted inputs: a=1031.3158086 AU, b=480.8588307088 AU. Pericenter/apocenter curvature F=G=0.004460222075 AU^-1; upper/lower quadrature curvature F=G=0.0004520997285 AU^-1. Pericenter gradient magnitudes: F=0.001939270186, G=0.000223696755 AU^-1; apocenter F=0.001939270186, G=0.003654843617 AU^-1. Curvature apsis/quadrature ratio 9.865571232 ±0.007948892 (first-order eccentricity marginal sensitivity only, NOT joint CI). Four curvature/normal equalities and separate parametric cross-check PASS. Gradient magnitude invariance FAILS AS EXPECTED.

PRESERVED FAILURE: First SymPy run wrongly assumed Y>0, creating spurious negative signed curvature at lower quadrature. Corrected X,Y to unrestricted real; reran all assertions PASS. Sign/domain handling is a genuine source-fidelity gate.

LEAN: draft PR #795, five conditional theorems on locus, gradient scaling, curvature numerator scaling, ratio invariance and inverse nonuniqueness. Compilation status pending actual job log. Algebraic proof is not physical validation.

GENEALOGY: SAT archive SATOBLOC/SATO-BLOCK-INT.txt blob 2cd00dec3a8464dc303fe96f14ae71d7fcf8f31e includes Nathan Direct question then imported NotebookLM response; SAT XYZ/SAT-Y 4D.txt blob 9806853dd09ca6b36bcfc530d8333bed53d956c contains ChatGPT-generated mode descriptions; LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt blob b128efd3004fe34e48dc7da2c39bdd14f9926ddc has sorry/undefined objects, not compiled proofs.

ACCESS/BOUNDARIES: All four Mersearch bridge lanes occupied; no pinned three-root Mersearch execution or lane overwrite. Bounded original-source GitHub fallback, not exhaustive corpus coverage. Historical Calder thread not authenticated; no cross-chat delivery. Existing hourly :12 task and five-lease schedule unchanged. P2 Nov30 review/PDF gates open; Orson P1 protected.

LOCAL REPRODUCTION: workshop_20261027_2012Z_calder contains REPORT.md, s2_curvature_null_gate.py, s2_curvature_null_result.json and stdout. Derived ellipse cardinal positions are not separate observations. Next: actual Lean CI readback, hostile review of orbital covariance and full encoder pipeline, physical worldtube/timesheet forward map before prediction.
