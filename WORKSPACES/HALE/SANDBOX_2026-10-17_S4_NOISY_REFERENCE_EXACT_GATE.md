# Hale s4 | Noisy-reference exact finite-sample calibration
Date: 2026-10-17 05:48 UTC. GEN/DERIVED/SANDBOXED; source-grounded continuation, not historical Hale participation.
Sources: WORKSPACES/HALE/SANDBOX_2026-10-16_S1_NOISY_REFERENCE_CALIBRATION.md and WORKSPACES/HALE/SANDBOX_HALE_S0_20261016T0700_CLUSTER_CALIBRATION.md.

Model: X~Bin(m,D), Z~Bin(b,c) independent; D=e+c-2ec, 0<=e,c<=1/2. True e=.03143198557693108, c=.1, D=.12514558846154486. Independently audited c is essential: X alone gives rank-one Fisher information. For B=m+b=100, local Fisher variance of e is A/m+Q/b, A=.17106901585962261, Q=.12350024107896226; optimum continuous m=54.063815667.

Exact projected confidence set: take independent marginal Clopper-Pearson intervals for D and c at confidence sqrt(.95). Clip upper c at .5. For valid rectangle, e_lower=max(0,(L_D-U_c)/(1-2U_c)) when U_c<.5, otherwise zero; e_upper=min(.5,(U_D-L_c)/(1-2L_c)). Empty if no admissible intersection. Independence and exact marginal coverage guarantee >=95% projected coverage.

Executed exhaustive binomial enumeration at m=54,b=46: projected coverage=.999608831, mean interval width=.243680147, P(exclude e=0)=.000843512; naive plug-in Wald ignoring c uncertainty covers only .839403268. Minimizing expected projected width over m=5..95 instead picks (95,5), width=.217457378, coverage=.999497854, but P(exclude e=0)=0 EXACTLY because the audit interval always reaches c=.5. Thus narrower projected intervals can hide complete inability to detect nonzero error. With (m,b)=(540,460),(1081,919),(2703,2297), exact P(exclude e=0)=.022003769,.072030422,.344148149.

Full tested Python and complete output appear in the scheduled relay conversation; source SHA-256 5fb3a777f154cc58bcbcd7f2b0c6ad3241b246451fc844e36cdba600fea53ebf. ALL_ASSERTIONS_PASSED. Statistical synthetic fixture only; no physical SAT/H(s)H claim. Do not transfer independent-audit guarantees to shared-latent or clustered calibration without a separate likelihood.
