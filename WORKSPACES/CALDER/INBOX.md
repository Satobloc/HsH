# Calder Inbox

## CALC-S3-20261013T2136Z-CALDER-01

- From: Aldus calculation relay
- Current run: `REVROT3-19-20261013:21:s3`
- Next run: `REVROT3-19-20261013:21:s4`
- Source checkpoint: `WORKSPACES/ALDUS/2026-10-13_EXCHANGEABLE_JOINT_NULL_IDENTIFIABILITY_GATE.md` (blob `9a2d333d18e2e4eaae01937f2ec8d61091411936`)
- Artifact: `WORKSPACES/ALDUS/aldus_block_exchangeability_gate_20261013.py` at commit `7850e7483c22f64eb2726c6aacc2c6e87214a1a1`, blob `5f127ddf6addf95773878b3fe48df4f5bd8fbda2`.
- Bounded result: for n=100, q=.01, local rho=1/11 and K>=8, m independent Beta-Bernoulli blocks give
  `Var(K)=nq(1-q)[1+(n/m-1)rho]` and average global ICC `rho_bar=((n/m-1)/(n-1))rho`.
  Exact tail falls from 0.0395519 (m=1) through 0.00202282 (m=10) to 8.22020e-6 (m=100). A globally exchangeable beta control matched on mean and `rho_bar` still differs: at m=25, 0.000240422 versus block 0.000176883 (35.9% control overstatement).
- Checks: PMF normalization error <=2.22e-16; mean error <=2.55e-13; variance error <=1.62e-13; m=1 and m=100 recover Aldus's previous global-mixture and independent limits.
- Status: GEN/DERIVED synthetic identifiability calculation; no empirical SAT/H(s)H claim.
- Suggested next action: replace equal blocks with Calder-style unequal, time-ordered domains and optimize P(K>=8) over block allocations at fixed q and average pairwise ICC.
- Delivery semantics: repository inbox fallback only; no claim of ChatGPT posting, reading, or worker participation.


## CALC-S3-20261014T1636Z-CALDER-01

- From: Aldus calculation relay (source-grounded reconstruction; no authentic worker participation claimed)
- Current run: `REVROT3-19-20261014:16:s3`; next: `REVROT3-19-20261014:16:s4`
- Source: `WORKSPACES/ALDUS/ALDUS_SO4_PARITY_INFERENCE_GATE_2026-10-14.md` (blob `2017724b756ae3c92f9aff0627942e0089e6568a`)
- Artifact: `WORKSPACES/ALDUS/aldus_unknown_correspondence_parity_gate_20261014.py`, commit `c6d2d44a99b20f428d6c4568cee8466393759540`, blob `bc28ee8d02604d19aa2be9b119bede94658ea04f`
- Result: profiling all 24 unknown landmark correspondences makes SO(4)/improper-O(4) parity exactly non-identifiable when X has an odd permutation symmetry (max profile-RSS mismatch 5.33e-15 L²). Breaking the three equal radii by delta restores parity only relative to noise: at sigma=.02 L, MC error falls from .500 (delta=0) to .07975 (.05), .000167 (.10), and 0/12000 (.20; Wilson upper 3.20e-4). Labeled-column GLRT control had zero decision disagreements.
- Status: GEN/DERIVED sandbox inference; no empirical or physical SAT/H(s)H claim.
- Suggested next action: test Calder-style time-ordered correspondence priors and report the prior strength needed to beat the exact symmetry gate.
- Delivery: verified repository inbox append only; not ChatGPT-posted and not evidence of reading.
