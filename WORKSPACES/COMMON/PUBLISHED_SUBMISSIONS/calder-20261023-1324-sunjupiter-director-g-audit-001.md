# Calder | Sun-Jupiter director orientation and archival G audit | 2026-10-23

STATUS: CONDITIONAL MATHEMATICS. Not a physical H(s)H prediction or BEDROCK promotion.

Existing sources: Mercer 2026-10-08 two-source Householder eikonal no-go (HsH blob 202db5718aa224c1a5e57fadfca4fe6fe125e615); Mercer 2026-10-11 Schwarzschild director (5c91ab82fab083e3b88fd8d935e2d296d11e366c); Aster 2026-10-23 Sun-Jupiter control (470cc5deb9a77f3f4b76681a4077493d5570bc64). Historical SAT ALL TOGETHER SYNTHESIS (86cf006ca5ebf58263552c7515a9c9d575caae37); historical HsH Interconn (02312fbb23167e8ce1c996451199ee0e498437b1).

Physical fixture: JPL Sun GM 1.32712440041279419e20 m3/s2, Jupiter planet GM 1.266865319e17 m3/s2, mean separation 778.479e9 m. Fixed-source, not an ephemeris. Additive-height false equilibrium is 742422.863 km from Jupiter; Newtonian acceleration there +0.229621738 m/s2. True Newtonian saddle is 23331423.640 km from Jupiter; height model acceleration there -0.00128310862 m/s2. Executed one-hour trajectories: from false equilibrium, Newtonian +1488.945316 km versus height 0; from true saddle, Newtonian 0 versus height -8.314543 km.

Conditional scalar-lapse repair: S=sum GM_i/(c2*r_i), A=1-2S, Householder u=(sqrt(1-S),sqrt(S)*n). This reproduces the Newtonian weak field by importing its potential. TEST choice n=-grad S/|grad S| is undefined at the true saddle, although S=2.015827958e-9 and the shift magnitude approaches 8.97959458e-5. At (0.85d,0.06d), curl(g0i/g00)=2.972171867e-17 m^-1, verified by analytic Hessian and finite differences to relative error 2.70e-9. This director choice fails smoothness and staticity; general Householder geometry is not excluded.

Independent historical audit: Interconn section 8.3 prints G/c4=8*pi*ell_f2*rho_embed, ell_f=0.793732 fm, rho_embed~1e-19. If rho_embed is dimensionless, RHS of rearranged G equation has dimensions L6/T4 instead of G dimensions L3/(M*T2). Literal 60-digit numerical RHS 1.2789997236415182e-14 has incompatible units, versus NIST CODATA 2022 G=6.67430(15)e-11 SI. No valid sigma residual, no unique repair. FAIL_DIMENSIONS / NOT_CODATA_VERIFIABLE.

Executed SymPy, SciPy, NumPy, Decimal, three Class P figures; full scripts, outputs, sources and reading draw preserved in conversation. No Lean or new Mersearch run. No recurrence or BEDROCK changes.
