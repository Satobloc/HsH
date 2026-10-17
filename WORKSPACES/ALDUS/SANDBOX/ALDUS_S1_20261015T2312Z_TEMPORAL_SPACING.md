# Aldus s1 | Temporal-spacing Bayes gate | 2026-10-15 23:12 UTC

GEN/DERIVED mathematical sandbox, source-grounded continuation, not historical Aldus participation or empirical SAT/H(s)H evidence.

Source: WORKSPACES/ALDUS/ALDUS_S2_20261015T15_MARKOV_PARITY_BAYES_GATE.md (blob 888b277a9a4ed43cf977316dd9d2c47b8e9b40d4); WORKSPACES/ALDUS/SANDBOX/ALDUS_S2_20261015T19_TEMPORAL_COMPRESSION_GATE.md (blob 13b0cb827732309d337669443cfb928b45f72349).

Let q=+/-1, P(s=+)=p=0.791454141713, independent sign error e=0.031431985577, refresh alpha=.2 per tick. With rho=.8, pi=(p,1-p), T_g=rho^g I+(1-rho^g) 1 pi^T, and B_q(d,s)=[1+(1-2e)qds]/2, compute L_q by exact two-state forward recursion. Equal-prior error R=.5 sum_d min(L_+(d),L_-(d)).

For 15 readings spaced g ticks: R(g=1)=.148413667371; R(2)=.101305084907; R(4)=.053509810108; R(8)=.022156254285; R(20)=.010154628536; iid limit=.009501490131.

For six readings including endpoints 0,14, exhaustive 715 five-gap schedules: best (4,3,3,3,1) and reverse R=.152909385674; nearly uniform (2,3,3,3,3) R=.154352299577; worst (1,1,10,1,1) R=.179277661951. Two readings at any gap give R=.226867823044, the same as one, because mixed-sign pair likelihoods are q-invariant.

Independent hidden-path enumeration cross-checked four schedules to <5e-12; two-point moments to <2e-14; normalization, reversal, iid limit and original n=15 g=1 reference passed. Complete code, output and Class P plots appear inline in Calculation Relay s1 2026-10-15 19:12 Eastern.

Next: Calder to study spacing with explicit per-observation cost and nuisance calibration.
