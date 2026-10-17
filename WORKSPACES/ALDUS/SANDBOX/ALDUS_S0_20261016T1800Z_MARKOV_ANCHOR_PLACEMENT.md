# Aldus s0 | Markov calibration anchor placement | 2026-10-16 18Z

GEN/DERIVED/SANDBOXED. Synthetic exact enumeration, not a physical SAT/H(s)H claim.

Let q,s_t in {±1}, d_t=q s_t z_t with Pr(z_t=-1)=e. Independent external anchors a_j=s_{t_j} ξ_j with Pr(ξ_j=-1)=c. Hidden correspondence evolves via T=(1-α)I+(α/2)11ᵀ with stationary uniform prior. The exact forward likelihood for each q is computed by multiplying readout and anchor emissions at each t, applying T between times, then summing hidden states. The equal-prior MAP error is R=(1/2)Σ_{d,a}min(L_-,L_+).

Without anchors, (q,s_t)↦(-q,-s_t) is an exact gauge ambiguity, so R=1/2. At α=0, R=B_n(e)+B_K(c)-2B_n(e)B_K(c), where B_j(x) is majority-binomial error with randomized ties. At α=1 with K distinct anchored times, R=B_K(e+c-2ec). Both formulas were checked against complete finite enumeration.

Exact numerical fixture: n=9, e=.05, c=.10. Rows: α | anchor times | raw MAP | nearest-anchor-product MAP.
0.0 | (0,8) | .1000265778 | .1000265778
0.0 | (3,5) | .1000265778 | .1000265778
0.0 | (0,4,8) | .0280313618 | .0371031494
0.1 | (0,8) | .1063440622 | .1063440622
0.1 | (3,5) | .1023553410 | .1024871401
0.1 | (0,4,8) | .0443078270 | .0449753880
0.5 | (0,8) | .1220473355 | .1220473355
0.5 | (3,5) | .1156917983 | .1160813750
0.5 | (0,4,8) | .0532957942 | .0533120000
1.0 | (0,8) | .1400000000 | .1400000000
1.0 | (3,5) | .1400000000 | .1400000000
1.0 | (0,4,8) | .0533120000 | .0533120000

For α=.1, moving two anchors from endpoints to (3,5) reduces MAP error by .0039887212. At α=0, placement is irrelevant if raw observations are retained. Compression into nearest-anchor products never beats raw-data MAP risk and sometimes loses information (α=0, three anchors: .0090717876 excess error). Deterministic exact enumeration passed endpoint and data-processing controls.

Provenance: WORKSPACES/ALDUS/ALDUS_S0_20261015_0455Z_JOINT_IDENTIFICATION.md; WORKSPACES/ALDUS/ALDUS_S1_FIXED_VS_RESAMPLED_CORRESPONDENCE_PARITY_2026-10-15.md. Complete runnable Python, derivation and all results are in the visible Calculation Relay session. Do not treat as canonical physics.
