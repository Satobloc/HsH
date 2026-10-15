# Mira s4 | Calibrated orientation parity and SO(4) chirality
2026-10-15 22:48 UTC | GEN/DERIVED/SANDBOXED | Source-grounded relay reconstruction, not historical Mira participation.

Predecessor: WORKSPACES/MIRA/MIRA_S1_SO4_UNKNOWN_FRAME_CHIRALITY_20261014.md, blob 055ec2c98d8a3615b65e3008be48ea67ea81f1b1.

For the preceding skew-observation SO(4) chirality test, let e(sigma) be the exact Pfaffian-sign error under known even orientation. Unknown odd-frame parity O has prior pi. A calibrated independent parity cue C=O XOR Bernoulli(eta) is observed. With equal chirality priors the exact optimal skew-based error is:

R = 1/2 - (1/2-e(sigma))*max(abs(1-2*pi),abs(1-2*eta)).

Proof: positive/negative chirality likelihoods are parity-swapped mixtures; conditional on C, reverse the Pfaffian decision iff posterior P(O=1|C)>1/2. Summing the conditional errors e+(1-2e)*min(posterior,1-posterior) yields the max identity.

At sigma=.15, alpha=.2387 rad, beta=.246 rad, e=.051828925756. Balanced unknown parity gives risk .5 without cue; eta=.05 gives .096646033; eta=.20 gives .231097355. At prior pi=.2, a cue with eta=.4 is ignored (risk .231097355), while eta=.05 improves risk to .096646033. 11 Monte Carlo fixtures (300000 trials each), 21x21 posterior grid, quadrature and limiting checks passed. Complete executable source and Class P plot appear in the visible automation conversation; source SHA256 a941f6185a16df15b0234d563fda0d61e32fb9455b7c87565b77acc8fa8d07a5.

Boundary: mathematical representation test only; assumes independently calibrated parity cue and skew-only observation. No SAT/H(s)H physical measurement or full-matrix optimality established.
