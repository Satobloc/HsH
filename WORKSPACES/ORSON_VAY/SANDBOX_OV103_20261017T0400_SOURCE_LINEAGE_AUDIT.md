# Orson Vay OV-103 | Source-lineage audit sensitivity
2026-10-17 04:00 UTC | SANDBOXED synthetic cognition model | scheduled source-grounded reconstruction, not an administered LLM experiment.

Sources: ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md (blob dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd); ORSON_VAY/orson_independent_source_allocation_gate_20261015.py (blob 02bba849ba12dfabc6c899caacaff1f5c742f4b8); ORSON_VAY/SANDBOX_2026-10-15_S0_AUTHENTICATED_SOURCE_AUDIT_GATE.md (blob dc94c3728e2a0ea3ef48bf4c49f1d6407b00b6ec). Paths relative to WORKSPACES.

N=12 reports, G groups, m=N/G; prior pi=.1; H=1 positive rate t=.9. Under H=0 source contamination Z~Bern(q=.08), positive rates c=.9 (contaminated) or f=.02 (clean). Audit sensitivity .9, false-positive rate .05. With probability lambda all groups share one Z, otherwise group Z are independent. Distinct audits are conditionally independent given Z.

Let B_p(k)=BinomialPMF(m,k;p), A_z(a)=P(audit=a|Z=z).
L0i=product_g[(1-q)B_f(k_g)A_0(a_g)+q B_c(k_g)A_1(a_g)];
L1i=product_g[B_t(k_g)((1-q)A_0(a_g)+q A_1(a_g))].
L0s=(1-q)product_g[B_f(k_g)A_0(a_g)]+q product_g[B_c(k_g)A_1(a_g)];
L1s=product_g B_t(k_g)*[(1-q)product_g A_0(a_g)+q product_g A_1(a_g)].
Lh(lambda)=(1-lambda)Lhi+lambda Lhs; P(H=1|E)=pi L1/(pi L1+(1-pi)L0).

Evidence E: all reports positive and all G audits positive. G=6: posterior lambda=0 -> .682436947673; .00001 -> .380722179186; .0001 -> .149574297538; .001 -> .105363930887; crosses .5 at lambda=4.243609861018e-6. G=12: lambda=0 -> .972396611218; .00001 -> .100002893668; .001 -> .100000028908; crosses .5 at lambda=3.917304513076e-11. Literal G copies of ONE audit are ONE observation, yielding posterior .154046997389 for positive audit regardless of G.

Exact checks: 2^G latent enumeration G=3, full 1000-outcome normalization under both hypotheses, q=0 lineage-invariance; all passed. Executed full source SHA-256 2fb7098bfadbc2bea7006ed629324bc07db9eb6abbc8e671f0f62e255b906960. Full runnable code, numeric table and Class P plot preserved in scheduled conversation. This is a conditional rare-evidence sensitivity, not average model performance or physical SAT/H(s)H evidence.

Next Sable: inspect whether source-lineage and audit independence are actually authenticated before treating many report records as independent corroboration.
