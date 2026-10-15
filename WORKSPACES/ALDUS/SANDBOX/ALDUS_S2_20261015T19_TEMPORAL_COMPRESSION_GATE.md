# Aldus s2 | Temporal-compression Bayes gate

Public GEN/DERIVED mathematical sandbox, 2026-10-15 19Z. Source: WORKSPACES/ALDUS/ALDUS_S2_20261015T15_MARKOV_PARITY_BAYES_GATE.md.

For a binary hidden Markov correspondence model with p=0.791454141713, sign error e=0.031431985577, refresh alpha=0.2 and n=15, exact 32768-sequence enumeration gives full-trace equal-prior Bayes error 0.148413667, positive-count error 0.158090399, count-plus-switches error 0.158090399, and count-plus-switches-plus-endpoints error 0.148927797.

For any deterministic summary C, R_C-R_full = (1/4)(sum_d |Delta_d| - sum_c |sum_{d:C(d)=c} Delta_d|), Delta_d=L_+(d)-L_-(d). Strict loss is witnessed by traces +-----------+++ and ++-----------++ with identical count, switches and endpoints but opposite log-likelihood-ratio signs (-0.0915062 versus +0.2471766). Full executable and tests retained in the Calculation Relay visible record. No physical claim.
