# Aldus s4 | Adaptive parity anchor design | 2026-10-16 21:48 UTC

GEN/DERIVED statistical sandbox; source-grounded Aldus continuation, not physical SAT/H(s)H evidence or authenticated historical participation.

Source: WORKSPACES/ALDUS/SANDBOX/ALDUS_S1_20261015T2312Z_TEMPORAL_SPACING.md (blob 3d02f1ad331cc5a4f574e240fde182b25aca7919).

Binary HMM: hidden correspondence s_t=+/-1, stationary Pr(s=+)=p, per-tick refresh alpha; unknown orientation q=+/-1 equally likely; signs d_t=q*s_t*z_t with independent error e. External anchor a=s_j*w with independent error delta. T=(1-alpha)*I+alpha*1*[p,1-p]. Define L_q(d) by forward recursion, and L_q(d,a|j) with anchor emission inserted at time j. The exact Bayes risks are R0=0.5 sum_d min_q L_q(d), Rfixed=0.5 min_j sum_d sum_a min_q L_q(d,a|j), Radaptive=0.5 sum_d min_j sum_a min_q L_q(d,a|j). The adaptive location is chosen after observing all signs but before measuring the anchor.

Executed deterministic enumeration: n=9, p=.7914541417127793, e=.03143198557693108, alpha=.2, delta=.1. No anchor 0.177994456305; best fixed j=3 or 5 0.098901971854; adaptive 0.092900886457. At anchor cost c=.005 per acquisition, optimal optional acquisition has expected risk-plus-cost 0.094954552466 and acquisition probability 0.400377164871. For p=.5, risks are .5, .116218536112, .100443828037 respectively.

Independent hidden-path enumeration, boundary alpha=0/1, delta=0/.5, reversal symmetry, and normalization passed. No physical mechanism or anchor independence is established. Complete executable source and plot preserved in scheduled visible response; Python SHA-256 9d91dc2caed5b318f6704325c226a717d2295ce0f1964880d1183c4bc1494db7.
