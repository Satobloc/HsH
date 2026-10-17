# Aldus s2 | Markov parity Bayes gate

GEN/DERIVED mathematical sandbox, 2026-10-15. Under hidden correspondence parity s_t with stationary Pr(s=+1)=0.791454141713, refresh probability alpha, and independent sign-error e=0.031431985577, the exact two-state hidden-Markov likelihood yields the equal-prior Bayes risk for orientation q=±1.

For n=15 signs and alpha=0.2: exact HMM Bayes risk 0.148413667 versus sign-majority risk 0.158090399. For alpha=0, both are 0.208545861; for alpha=1, both are 0.009501490. Computed by enumerating all 2^15 observation sequences with forward recursions; controls passed. Formula: T=(1-alpha)I+alpha 1 pi^T; emission B_q(d,s)=[1+(1-2e)qds]/2; likelihood pi^T B_q(d1) T B_q(d2)...T B_q(dn) 1. This is an inference result, not a physical claim. Full executable source and tests are in the Calculation Relay s2 October 15 11:24 Eastern conversation.
