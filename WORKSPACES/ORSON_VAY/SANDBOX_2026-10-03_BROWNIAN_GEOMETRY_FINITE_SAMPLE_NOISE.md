# Orson Vay sandbox — finite-sample geometry noise / "Brownian readout"

Status: SILOED SANDBOX, not canonical H(s)H.

Sources read:
- SAT_THEORY_ARCHIVE_2023-25/DEV CONVERSATION/SAT-OLD.txt (opening dark-matter / "Brownian motion of space" discussion and continuation into block-universe temporal-force question).
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002. Discreet Space and Dark Matter.txt (complete file; same old question newly exposed in Sep-30 HsH dump).
- SAT_THEORY_ARCHIVE_2023-25/SAT XY/JUNE PHASE I-V PROGRESS.txt, lines 1801-3000 (strain-wave / pulsar timing construction; used only as historical context, not numerical target).

Independent sandbox construction:
For unit microscopic 4-directions n_a, define M_N=(1/N) sum_a n_a n_a^T. For isotropic independent directions in d=4,
E[M_N]=I/4,
E[n_i n_j n_k n_l]=(delta_ij delta_kl + delta_ik delta_jl + delta_il delta_jk)/24.
Under the microscopic Householder candidate g_a=I-2 n_a n_a^T, the block estimate is g_N=I-2M_N and its fluctuation about the isotropic mean is delta g=-2(M_N-I/4).

Exact Frobenius variance:
E ||delta g||_F^2 = 3/N,
so RMS geometry noise = sqrt(3/N).

Monte Carlo (4000 ensembles) checked:
N=4: 0.86454 vs exact 0.86603
N=16: 0.43213 vs 0.43301
N=64: 0.21654 vs 0.21651
N=256: 0.10858 vs 0.10825
N=1024: 0.05412 vs 0.05413.

Interpretation:
A finite-resolution observer sampling a granular H(s)H orientation field generically sees tensor-valued finite-sample metric/readout noise even when the ensemble mean is perfectly smooth. This is a literal candidate "Brownian geometry" signature: not a fitted extra mass term, but a scale law and covariance tensor.

If independent cells have correlation 4-volume V_c and the readout samples V_4, N_eff ~ V_4/V_c, hence RMS(delta g) ~ sqrt(3 V_c/V_4). Correlations replace N by N_eff and are therefore measurable through the scale law.

Important negative result:
Zero-mean finite-sample noise cannot by itself produce a systematic dark-matter-like mean field. Any such mean requires a derived nonlinear rectification, anisotropic covariance, long-range correlation, or coupling to matter. Do not call the noise dark matter.

Discriminator / solver test:
1. Generate fine H(s)H configurations without imposed metric noise.
2. Block them at several 4-volumes V_4.
3. Measure M_L, delta g_L, full component covariance, and spatial/temporal correlation functions.
4. Test RMS ~ N_eff^{-1/2} and the isotropic fourth-moment tensor above.
5. Compare induced timing/path jitter against deterministic strain-wave channels. Random finite-sample geometry predicts scale-dependent stochastic variance, not a coherent GR-like polarization template.

Failure:
Kill the mechanism if fluctuations do not follow the derived moment/correlation statistics; if the microscopic metric-induction map is wrong; or if coarse propagation homogenization erases these fluctuations before any physical readout can couple to them.

Carry-forward:
<||delta g||_F^2> = 3/N_eff.
This is a clean candidate for a "Brownian motion of H(s)H geometry" and, more importantly, a solver diagnostic for whether microscopic orientation discreteness survives finite readout.
