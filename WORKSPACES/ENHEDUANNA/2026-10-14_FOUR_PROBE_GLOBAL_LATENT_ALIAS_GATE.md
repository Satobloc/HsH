# Enheduanna | Four-probe global latent-factor alias (2026-10-14 13:48 UTC)

**GEN/DERIVED mathematical sandbox, not actual source-exposure evidence, historical Enheduanna participation, or established SAT/H(s)H physics.** Extends `WORKSPACES/ENHEDUANNA/2026-10-14_THIRD_CUMULANT_EXPOSURE_SESSION_UNMIXING_GATE.md` (blob `656b8f801c66d58fd5fe23523e455f9692b9739f`), removing its known-p and q=1/2 assumptions.

## Model and equations

Independent Bernoulli latent variables Z~Bern(p), H~Bern(q). Four observed binary probes X_i are independent given Z,H, with P(X_i=1|Z,H)=f_i+d_i Z+c_i H in [0,1]. All dimensionless.

Let A=p(1-p), B=q(1-q), v_i=sqrt(A)d_i, w_i=sqrt(B)c_i, alpha=(1-2p)/sqrt(A), beta=(1-2q)/sqrt(B). For distinct indices:

```
C_ij   = v_i v_j + w_i w_j                         (6 covariances)
K_ijk  = alpha prod(v_i) + beta prod(w_i)           (4 third cumulants)
K_1234 = (alpha^2-2) prod(v_i) + (beta^2-2) prod(w_i)
```

Four means plus these eleven cross-cumulants determine all sixteen joint probabilities via moment inversion. Unknowns after fitting means: v(4),w(4),alpha,beta (10). Ten unknowns with eleven constraints do **not** guarantee global uniqueness.

## Two observationally identical, valid models

```
                 ORIGINAL                       DISTINCT ALTERNATIVE
p                0.300000000000                 0.302059480354502
q                0.400000000000                 0.0919480455385645
f                .35,.36,.37,.38                .378336401465,.356711520673,.387838262292,.378951236844
d                .32,.28,.25,.22                .329511116671,.266491238082,.258434355814,.215635401657
c                .098550953840,-.0328503179465 .0821335935363,-.0690373863683
                 .0657006358935,-.054750529911 .0585052657767,-.217363686870
conditional min  0.325249470089                 0.161587549974
conditional max  0.768550953840                 0.789981111672
```

The unordered canonical prevalence sets {0.30,0.40} and {0.091948,0.302059} differ: not factor swaps or binary label complements.

**Executed benchmarks:** seeded multistart SciPy least-squares, independent exact 16-pattern enumeration, set-partition cumulants, and 70-digit mpmath Newton refinement. Double-precision maximum cell difference 4.16e-17; total variation 9.71e-17. At 70-digit precision, maximum cell difference **2.83e-72**, maximum all-eleven cumulant residual **1.41e-73**. Ten independent constraints: 6 covariances, 3 third cumulants, 1 fourth cumulant; omitted third-cumulant residual 1.77e-74. Jacobian (11 by 10) has rank **10**, smallest singular value 8.4282e-6, condition number 3.63026e4. Thus local identifiability coexists with a global discrete alias. High-precision numerical evidence, not a formal symbolic certificate.

## Fifth-probe control

For an independent fifth probe with original (f5,d5,c5)=(.35,.30,.18), fix the first four alternative loadings and optimize the two new fifth loadings against Cov(X_i,X_5), i=1..4. Best-fit alternative (d5',c5')=(.324599773485,.203088008033) gives covariance residuals (+.0004756012513,-.0008450205300,-.0000889542134,+.0004241580556), L2=**.0010621107073**. This breaks **this particular** four-probe alias, not a proof of universal five-probe identifiability.

Reproducible local files supplied to user: `enheduanna_four_probe_global_alias.py`, `enheduanna_four_probe_global_alias_results.json`, and `enheduanna_four_probe_global_alias_class_P.png`. Source, solver, and numerical figures are mathematical sandbox results, not H(s)H physical claims.

**Next to Tern Rook:** seek symbolic elimination/certificate of the two positive-probability branches and the smallest independent calibration that guarantees global identification.