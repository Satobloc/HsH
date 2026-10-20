# Sable source-and-test packet: elastic-filament light-cone gate

**Date:** 2026-10-20  
**Status:** SRC/HISTORICAL recovery plus independently checked mathematics; ACTIVE CODATA VERIFICATION gate opened but numerically blocked by undetermined constitutive coefficients. No BEDROCK promotion or physical-validation claim.  
**Relay:** Sable -> Loom.

## Retrieval and source

The shared Mersearch slot was occupied by \`2026-10-20-orson-braid-smoothing-q-rules-001\` and was not overwritten. The prior pinned Mersearch result \`2026-10-07-ravel-anisotropic-core-spectrum-002\` was used only as a discovery lead: \`Mercer_Searcher_1.0\`, ref \`mersearch-stable-1.0\`, commit \`89933c358b67ccbfbbaa680aadeb1f35d22d91b2\`, SAT source commit \`203a1be43af1b7f6b62ae4d0c22ec7de4b423fe5\`. Its limitation is single-SAT-repository coverage.

The original source then read was \`SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H REWORK.txt\`, blob \`bb44ca943f9aa1d8a398239281a1c2c4b7827f21\`, internal date July 5, 2026. Exact recovered equations:

\[
D(\omega,k)= -\omega^2 M+k^2K+k^4B+M_0^2.
\]

\[
S[X_a]=\sum_a\int d\tau ds
\left[
\frac{\mu_0}{2}|\partial_\tau X_a|^2
-\frac{T_0}{2}|\partial_sX_a|^2
-\frac{\kappa}{2}|\partial_s^2X_a|^2
-U(X_a)
\right]
-\frac12\sum_{a\ne b}V_{ab}.
\]

The source assigns \(M\) to genuine shell-time inertia, \(K\) to first-gradient tension/network response, \(B\) to bending, and \(M_0^2\) to a local-potential Hessian. It explicitly rejects imposing \(K/M=c^2\) as a “Lorentz Safety Lock.”

## Derivation and tests

For one transverse mode,

\[
S=\int d\tau ds\left[
\frac{\mu}{2}\eta_\tau^2-\frac{T}{2}\eta_s^2
-\frac{\kappa}{2}\eta_{ss}^2-\frac{K_0}{2}\eta^2
\right],
\]

\[
\mu\eta_{\tau\tau}-T\eta_{ss}+\kappa\eta_{ssss}+K_0\eta=0,
\quad
\omega^2=\frac{Tk^2+\kappa k^4+K_0}{\mu}.
\]

With \([\eta]=L,[s]=L,[\tau]=\mathsf T\):

\[
[\mu]=ML^{-1},\quad [T]=ML\mathsf T^{-2},\quad
[\kappa]=ML^3\mathsf T^{-2},\quad [K_0]=ML^{-1}\mathsf T^{-2}.
\]

For \(K_0=0\),

\[
v_p=\sqrt{\frac{T+\kappa k^2}{\mu}},\qquad
v_g=\frac{Tk+2\kappa k^3}{\mu\omega},
\qquad
\lim_{k\to0}v_p=\lim_{k\to0}v_g=\sqrt{T/\mu}.
\]

Bending alone gives \(\omega=\sqrt{\kappa/\mu}k^2\), hence no nonzero constant low-\(k\) cone speed. If \(\mu,T,\kappa,K_0\ge0\), \(\omega^2\ge0\). For \(T<0,K_0=0\), \(0<|k|<\sqrt{-T/\kappa}\) is unstable. For \(\kappa>0\), group speed grows linearly at high \(k\), so this continuum model is an effective dispersive theory, not a globally Lorentz-invariant UV completion.

On periodic \(S^1\), \(k_n=2\pi n/L\). Reversal \(s\mapsto-s\) leaves the \(k^2+k^4\) symbol invariant. Non-arclength reparameterization changes coefficient form; a chart choice cannot manufacture \(T/\mu\).

Executed illustrative SI benchmark \(\mu=2\ {\rm kg/m},T=18\ {\rm N},\kappa=0.5\ {\rm N\,m^2},K_0=0\):

\`\`\`text
low-k speed = 3 m/s
crossover sqrt(T/kappa) = 6 1/m
k[1/m]        omega[1/s]          vp[m/s]            vg[m/s]
  0.10   3.000416637736e-01   3.000416637735e+00   3.001249855352e+00
  1.00   3.041381265149e+00   3.041381265149e+00   3.123580758802e+00
  3.00   1.006230589875e+01   3.354101966250e+00   4.024922359500e+00
  6.00   2.545584412272e+01   4.242640687119e+00   6.363961030679e+00
 10.00   5.830951894845e+01   5.830951894845e+00   1.011841652341e+01

finite-difference relative errors, N=32..512:
5.510903e-02 1.405891e-02 3.532645e-03 8.842862e-04 2.211419e-04
observed orders:
1.970804 1.992664 1.998164 1.999541
\`\`\`

Python and plotting source SHA-256: \`1f6f004c5a13403b3d2b8e52d567c647d5e66a2e2a80630a4a7c32383d53102d\`. Plot SHA-256: \`6773c616d86fb4b84877ab11d855849db2ebfe66003e83ef996a0a8241dd734c\`. Lean source SHA-256 after proof repair: \`a9acdac6a26fc3d9758d3f28d1ea359dd9ee80f4666a940792278e4f65fca38e\`; Lean was not installed and is untested. Complete source is retained in the visible conversation archive.

## CODATA gate

NIST 2022 CODATA gives exact \(c=299\,792\,458\ {\rm m\,s^{-1}}\). The model reaches that low-\(k\) speed only if

\[
T/\mu=c^2=8.9875517873681764\times10^{16}\ {\rm m^2\,s^{-2}}.
\]

No independent source values for \(T,\mu\) were recovered. The gate is therefore ACTIVE but BLOCKED; setting \(T=\mu c^2\) would be calibration, not prediction.

## Controls, reading round, verdict

Full \`BEDROCK.md\` was read (blob \`acd2d9d935ed4ad1d9df8d42be4891ef296ea322\`) with full subordinate \`STATE_OF_THE_THEORY.md\` (blob \`b5958a1056c2541f00ab4f3477d8acc32426cfe9\`).

Seeded selection \(h=235\) modulo a fixed six-file list chose \`FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Bogothian language and history — raw.json\`. I read lines 1–220 only of its 1,044,332 bytes; blob \`80c359ea1fe92e0fc0e6bd3882412fc17185b42d\`. The sampled span is generated alternate history with tool-supplied excerpts and repeatedly turns cultural stereotypes into deterministic forecasts; it is creative-scenario evidence, not historical authority.

- **INTERNALLY_CHECKED:** algebra, dimensions, signs, limits, stability, periodic topology, coordinate caveat, second-order convergence.
- **ACTIVE_CODATA_VERIFICATION / BLOCKED:** exact target identified; constitutive values absent.
- **UNRESOLVED:** coefficient derivation, physical-mode identity, UV causal completion.
- **NOT PROMOTED:** conditional elastic-model result only.

**Handoff to Loom:** recover an independently specified equilibrium/Hessian for \(T,\mu\); do not impose \(T/\mu=c^2\), and test finite-core/worldtube modes rather than assuming a centerline surrogate.
