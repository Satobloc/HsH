# OV-100 | Shared-source authority-laundering calculation
Date: 2026-10-14 19:00 UTC; s0; Orson Vay methodological lane.
Status: SANDBOXED synthetic cognition model, not an administered LLM experiment. Full executable package retained locally as orson_20261014_s0_shared_authority_package.zip.

Let T=1 mean an artifact exists, P(T=1)=pi=.10. Conditional on T=1, each worker reports "verified" with probability t=.90. Conditional on T=0, a common source is contaminated with probability q=.08; each worker reports "verified" with probability c=.90 if contaminated and f=.02 otherwise. Workers are conditionally independent only given the shared-source state.

For K positive reports among N:
P(K=k|T=1)=C(N,k)t^k(1-t)^(N-k).
P(K=k|T=0)=(1-q)C(N,k)f^k(1-f)^(N-k)+q C(N,k)c^k(1-c)^(N-k).
P(T=1|K=k)=pi L1/(pi L1+(1-pi)L0).
For all-positive reports, since c=t and f<t, the posterior converges to pi/(pi+(1-pi)q)=0.5813953488372093.

N=1: exact posterior .525210084, naive independent .525210084.
N=2: exact .580016498, naive .916756848.
N=3: exact .581364636, naive .990961898.
N=5: exact .581395334, naive .999907991.
N=10: exact .581395349, naive .999999999.
Naive independence uses marginal false-positive probability (1-q)f+qc=.0904, incorrectly raising that to the Nth power.
Under T=0, conditional pairwise report correlation = q(1-q)(c-f)^2/[fbar(1-fbar)] = .693145289965.

A genuinely independent artifact inspection with sensitivity .99 and specificity .995 updates P(T=1) after 10 yes reports to .996376812 if positive and .013766520 if negative. Another ten echoes of the same shared source do not improve the displayed posterior.

Mutual information I(T;K), bits: N=1 .219883686, N=5 .298029849, N=10 .300270174, N=20 .300298270, N=40 .300298275. Exact ceiling H2(pi)-h H2(pi/h)=.30029827486183935 bits, h=pi+(1-pi)q=.172. With one independent direct inspection, I(T;K,D) at N=10=.457937888 bits. The gain from one independent audit (~.157668 bits) exceeds the gain from thirty more shared-source reports (~.0000281 bits).

Executed local Python fixture: exact binomial enumeration, exhaustive 2^N patterns for N<=5, 200,000 seeded synthetic trials. For N=6 false-artifact all-positive probability exact .0425152801, Monte Carlo .0427700, standard error .000451153. Normalization, q=0 independent-worker negative control, q=1 no-information control, and information bounds passed. Class P precision figure generated locally. All probabilities are stipulated, not empirical estimates.

Experimental next step: hold number of agents and prompt lengths fixed; randomize whether their reports draw from one seeded false checkpoint or independent direct file inspections. Measure correlation and false-verification assertions. Lack of predicted correlation or intervention effect would falsify applicability.

Read continuity: WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md (dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd); OV99_20261012_COUNTERBALANCED_EVIDENCE_ORDER_GATE.md (67d11b6d7677c107fa30c920598fd2e8a25751bb); OV98_20261012_EXACT_PAIRED_POWER_GATE.md (66dd697cc4f124025507fc14b80f68fa6c0a2e9e).
