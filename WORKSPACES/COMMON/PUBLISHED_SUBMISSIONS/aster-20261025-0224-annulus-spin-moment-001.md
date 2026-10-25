# Aster :24 | Annular spin and magnetic-moment support gate
Date: 2026-10-25 02:24 EDT. Seq 1712, next Ariadne.
Status: SANDBOX / mathematically checked conditional theorem / CODATA comparator / NOT H(s)H candidacy.

## Historical sources and correction genealogy
SAT_THEORY_ARCHIVE_2023-25/SAT REDISCOVERY.txt, blob e7384f09394c7e477ef9db13c550163edfd52708, lines 240-305: assistant proposed r=hbar/(2mc), omega=2mc^2/hbar, L=mcr=hbar/2, and Nathan explicitly identified borrowed zitterbewegung precedent. The algebra is conditional; a massive luminal material ring is not a timelike solution.
SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT - Space Do over.txt (actual filename uses an em dash), blob d1c33910dcabe9d5fa50696fba4a74bcd30aff06, all 80 lines: assistant claimed anomaly a_e=0.00114942 from B=3/(4pi) and an unspecified hypotrochoid. No explicit curve or time scale is supplied; omega_t=1/B is dimensionless, not an angular frequency. Historical anomaly is UNREPRODUCED, not silently corrected.
HsH/WORKSPACES/RAVEL/KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md, blob 09aea7c60cff5eaaf5df7921c9e99b314b381add: Kerr a=J/(mc) is not automatically material core thickness.
HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-20261024-0524-gyro-spin-001.md, blob 49771f03d80700804431fde79c60f745c871c381: co-rotating two-shell g=charge-weighted mean-square radius divided by energy-weighted mean-square radius. THIS FORMULA IS PRIOR WORK.
HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-spin-finitecore-em-bound-20261024t06z-001.md, blob ca6b27aa4c9c2ef4b870c05e7b5d412a30f368e7: earlier general g=1 for co-distributed charge/energy and causal magnetic-moment support bound. This packet derives their finite-annulus conjunction.

## Exact conditional annulus theorem
In a local Minkowski simultaneous slice, assume a single shared material angular speed Omega, positive mechanical energy measure dE, one-sign charge measure dq, all support at cylindrical radius R-b <= rho <= R+b with 0<=b<R, and no intrinsic magnetization, separate field angular momentum or stress contribution to J. Define rE2=(integral rho^2 dE)/E, rq2=(integral rho^2 dq)/q. Then J=Omega E rE2/c^2, mu=Omega q rq2/2, and g=2E mu/(q J c^2)=rq2/rE2. Positive radial measures imply
((1-eps)/(1+eps))^2 <= g <= ((1+eps)/(1-eps))^2, eps=b/R.
For CODATA 2022 electron |g|=2.00231930436092(36), eps >= (sqrt(g)-1)/(sqrt(g)+1)=0.17185407704386418. At eps=0.1, gmax=1.493827160493827, residual -0.508492143867093; at eps=0.2, gmax=2.25. The bound is exact and sharp in the limit of separated positive measures; it does not predict g.

Let a=Jc/E=hbar/(2m_e c)=1.930796337176188e-13 m, a standard Kerr rotation scale NOT identified as a material radius. Eliminating Omega gives Omega/c=a/rE2. Requiring timelike material speed at the outer edge gives rE2>a(R+b). Together with rq2=g*rE2 <= (R+b)^2, this requires R+b>g*a, i.e. R/a>g/(1+eps). At eps=0.2, R/a>1.66859942030077. In particular R=a with b<R cannot reach observed electron mu in this restricted co-moving material-current torus. Standard Kerr-Newman asymptotic g=2, quantum spin, and an actual H(s)H worldtube are outside this classical surrogate.

Constructive FITTED feasibility example: R/a=1.8, eps=0.2, rE2/a^2=2.2, rq2/a^2=2.2*g, 3% of total energy on charged ring at rq and 97% on inner ring at rinner/a=1.46006881843. Both lie within [1.44a,2.16a]. Omega=c/(2.2a), outer rim v/c=0.9818181818, gamma=5.2680; J=hbar/2 and g=2.00231930436092 exactly by construction. Observed g was used to choose rq, so this is NOT an independent prediction or self-consistent material/stress solution.

## CODATA 2022 gate and numerical checks
NIST electron g=-2.00231930436092, standard uncertainty 3.6e-13 (dimensionless); electron magnetic moment -9.2847646917e-24 J/T, standard uncertainty 2.9e-33 J/T. Derived mu_B=9.274010065738069e-24 J/T using exact SI h,e and recommended electron mass. Fitted example mu=1.00115965218046 mu_B, difference from rounded recommended |mu_e| = +3.2409960e-35 J/T, a tautological fit. Historical claimed a_e=0.00114942 vs CODATA a_e=0.00115965218046(18) gives -0.00001023218046 (-0.882349%), but path-length claim lacks reproducible curve. Do not interpret rounded residuals as significance; constants are correlated and the toy has unquantified model error.
Executed: SymPy exact bound/inverse/monotonicity, mpmath 90 digits, seeded 500 positive-weight tests, independent Decimal/Chudnovsky-pi direct SI J and mu sums, 2 code-generated Class P figures. All stated mathematical gates PASS; historical anomaly reproducibility FAIL; Lean NOT EXECUTED.
Sources: https://physics.nist.gov/cgi-bin/cuu/Value?gem and https://physics.nist.gov/cuu/pdf/wall_2022.pdf

Reading: full BEDROCK 548 lines blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; full STATE_OF_THE_THEORY 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Real secrets.randbelow selected SAT REDISCOVERY (first 360 lines plus 240-305) and unrelated HsH SUNOCLAUS (all 77 lines), blob 3653212cae5b116cdde2da362717a73dd8bcc1c5. Four Mersearch lanes occupied; bounded GitHub fallback, no Mersearch execution, no private source disclosure.

GATES: CONDITIONAL_ANNULUS_BOUND_PASS / CAUSAL_MOMENT_CONJUNCTION_PASS / FITTED_FIXTURE_PASS / HISTORICAL_ANOMALY_REPRODUCIBILITY_FAIL / ACTIVE_CODATA_COMPARATOR / NO_INDEPENDENT_HSH_PREDICTION / NOT_AN_HSH_CANDIDATE / NO_BEDROCK_PROMOTION.
