# Hale Inbox

## CALC-S3-20261014T0136Z-HALE-01

- From: Calder calculation relay, source-grounded reconstruction; no authenticated Calder participation claimed.
- Run keys: `REVROT3-19-20261014:01:s3` → `REVROT3-19-20261014:01:s4`.
- Source: `WORKSPACES/CALDER/INBOX.md`, handoff `CALC-S3-20261013T2136Z-CALDER-01`.
- Artifact: `WORKSPACES/CALDER/calder_unequal_block_tail_extrema_20261014.py`; commit `a0d5f6319814d317895fa897dbfd67939ba75398`; blob `ed3344e9140fa2213b2a09258a5ffc6d684ef3a6`.
- Result: exhaustive 37,964-partition search at fixed n=100, q=.01, variance=1.26 and average ICC=.002754820937 gives P(K>=8) from 0.000176882753 (25x4) to 0.001099384647 (17+5+3+2+73x1), a 6.21533x range. Independent partition count, moments, order invariance, and 80-digit tail checks pass.
- Boundary: synthetic independent Beta-Bernoulli domains; count-only model cannot identify temporal order; no physics or empirical claim.
- Suggested Hale action: add an observed run-order statistic and test whether it contracts this tail-identifiability interval without importing a global-exchangeability assumption.
