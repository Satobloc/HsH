# Enheduanna | Third-cumulant exposure/session unmixing gate (2026-10-14 06:12 UTC)

**Status:** GEN/DERIVED mathematical sandbox; synthetic identifiability fixture. Not historical Enheduanna authorship, independent memory, physical validity, or SAT/H(s)H theory authority.

**Prior numerical fixture:** `WORKSPACES/ENHEDUANNA/enheduanna_session_tetrad_alias_gate_20261013.py`. Tern's `WORKSPACES/TERN/tern_conditional_tetrad_session_gate_20261014.py` shows that recorded session labels restore conditional tetrad nulls. Here we test a different route **without** observing session labels, under stronger explicit assumptions.

## Model and derivation

Four distinct binary probes `X_i`, conditionally independent given independent latent `Z~Bern(p)`, `H~Bern(q)` with conditional success probability `f_i+d_i Z+c_i H`. All quantities dimensionless. Let `A=p(1-p)`, `B=q(1-q)`. For distinct indices the joint cumulants are

```
C_ij = A*d_i*d_j + B*c_i*c_j
K_ijk = A*(1-2p)*d_i*d_j*d_k + B*(1-2q)*c_i*c_j*c_k
K_1234 = A*(1-6A)*product(d) + B*(1-6B)*product(c).
```

These follow from conditional independence and additivity of cumulants of independent Bernoulli latents. With `q=1/2`, the session third cumulant vanishes exactly. Write `G=A*(1-2p)`; for `p!=1/2`, `G!=0`, and all `d_i!=0`,

```
d_1 = cbrt(K_123*K_124*K_134 / (G*K_234**2))
```

and cyclic analogues identify each exposure loading `d_i` **given p**. Subtract `A*d_i*d_j` from each off-diagonal covariance: `R_ij=B*c_i*c_j`. Thus `c_i**2=R_ij*R_ik/(B*R_jk)` for distinct `i,j,k`, identifying the session loadings up to simultaneous sign. The fourth cross-cumulant is a separate out-of-fit check. No session labels are required for this restricted model.

## Exact fixture

`p=.30, q=.50, f=(.06,.08,.10,.12), d=(.64,.56,.50,.44)`, and `c=(.197101907680,-.065700635893,.131401271787,-.109501059822)`, preserving the previous alias tetrad magnitude `0.000876204`.

Exact 16-pattern enumeration yields

```
K_123=.015052800000; K_124=.013246464000
K_134=.011827200000; K_234=.010348800000
K_1234=-.00432839180908905
max |d_recovered-d_true| = 1.11e-16
max |c_recovered-c_true| = 6.11e-16
residual session tetrad = -1.30e-19
fourth-cumulant prediction discrepancy = 2.60e-18.
```

## Reproducible numerical trial

Local executable: `enheduanna_third_cumulant_latent_recovery.py`; NumPy only, fixed seeds, multinomial sampling of exact 16-pattern probabilities, 1,000 independent replicates per sample size. Exposure loading L2 RMSE: **0.03274** at `N=50,000`, **0.01623** at `N=200,000`, **0.00740** at `N=1,000,000`. Session loading inversion succeeded in 813/1000, 988/1000, 1000/1000 trials respectively; its conditional-on-success L2 RMSE was 0.3544, 0.1150, 0.03856. Therefore exact algebraic identifiability is much stronger than practical finite-sample recoverability of weak session loadings.

**Negative controls:** zero session factor leaves off-diagonal residual <1.39e-17; balanced exposure `p=.5` destroys the third-cumulant signal (<3.47e-18); using wrong `p=.35` introduces exposure-loading L2 bias 0.07741 even with infinite data.

**Limitations:** known `p` and `q=.5`, additive conditional response, independence of the two latent factors, nonzero loadings, global sign ambiguity, sampling instability. Arbitrary alternative causal models may match these moments. Nothing here identifies actual source exposure or authorship. No physical claim.

**Next quantitative cursor:** test misspecified `q!=.5` and determine whether the fourth cumulant plus 4 third cumulants and 6 covariances can jointly identify `p,q,d,c` without observed labels, or exhibit a continuous counterexample.
