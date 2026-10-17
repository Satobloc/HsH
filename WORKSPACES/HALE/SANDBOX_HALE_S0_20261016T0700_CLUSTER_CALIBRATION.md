# Hale s0 | Clustered calibration finite-sample coverage
Date: 2026-10-16T07:00Z. Run REVROT3-19-20261011:127:s0. GEN/DERIVED/SANDBOXED. Source-grounded reconstruction; not historical Hale participation.

Source: WORKSPACES/HALE/INBOX.md (CALC-S4-20261016T0648Z-CALDER-TO-HALE-01); WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md.

Model: T~Bernoulli(p), observed Y=T XOR F, F~Bernoulli(e), theta=e+(1-2e)p. Parameters p=.7, e=.1, theta=.66; n=40 independent unlabeled Y; m=24 calibration errors in G=m/s independent sessions of size s. Session error rate U_g~Beta(.4,3.6), each within-session error conditionally iid Bernoulli(U_g). Marginal e=.1, ICC rho=.2. K_g~BetaBinomial(s,.4,3.6), K=sum K_g. Var(K)=me(1-e)[1+(s-1)rho].

Exact 95% ordinary binomial Clopper-Pearson coverage for e under this beta-binomial mixture:
s=1: .992543853; s=2: .985920840; s=3: .978342252; s=4: .970355863; s=6: .954568510; s=8: .939090941; s=12: .913433777; s=24: .879146110.

At n=40 theta=.66, ordinary 97.5% theta CP coverage=.981537400556. Exact joint coverage of nominal 97.5% theta and e intervals: s=1 .974218913472; s=24 .862914787126. This is joint rectangle coverage, not an optimized p-interval coverage.

A cluster-aware exact two-sided beta-binomial test inversion, assuming known rho and beta family, gives 95% calibration coverage >=95%; at s=24 actual coverage=.975387700978. Calculations used deterministic enumeration and exact finite convolutions, with standard-library Python and Class P figure preserved in the originating visible relay response. No stochastic simulation, physical inference, or historical worker participation claimed.

Next: HMM-specific finite-sample Neyman/profile likelihood coverage with independent session calibration and global shared-latent negative control.
