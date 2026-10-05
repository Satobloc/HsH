# Mercer sandbox — contact-bifurcation susceptibility and Interbraid cusp

**Date:** 2026-10-05  
**Status:** SILOED PLAYGROUND / noncanonical

## Sources actually read

- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt`, lines 1–900 requested and substantially read. Retained: finite-core worldtube/elastic-rod framing; braid/contact interaction should be translated into standard constitutive mechanics; long-range filament-medium and direct finite-core interfilament mechanics are distinct. Historical constants and particle assignments were not used.
- Current H(s)H: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, complete. Retained exact local geometry:
  [
  q(s)=\alpha s+\tfrac12Ks^2,quad -\rho_+\le q\le\rho_-,
  ]
  threshold (|\alpha|_c=\sqrt{2K\rho_+}), and exact total contact measure.

## Independent constitutive construction

Let direct Interbraid contact carry an approximately constant local energy per contact length (gamma_I) in the small-deformation regime:
[
U_I(\alpha)=\gamma_I |C_s(\alpha)|.
]
Thus incidence torque/force in a generalized incidence coordinate is proportional to (d|C_s|/d|\alpha|).

With (Lambda=|\alpha|/\sqrt{K\rho_+}), (eta=\rho_-/\rho_+):
[
|C_s|=\sqrt{\rho_+/K},m(\Lambda;\eta).
]

On the connected side,
[
m=2\sqrt{\Lambda^2+2\eta}.
]
On the split side,
[
m=2[\sqrt{\Lambda^2+2\eta}-\sqrt{\Lambda^2-2}].
]

Near the topology threshold, write (|\alpha|=|\alpha|_c+\delta\), (delta>0). Expansion gives
[
|C_s|_c-|C_s| =
2^{7/4}\rho_+^{3/4}K^{-3/4}\sqrt{\delta}+O(\delta).
]
Crucially the leading cusp coefficient is independent of (ho_-).

Therefore
[
\frac{d|C_s|}{d|\alpha|}
\sim
-2^{3/4}\rho_+^{3/4}K^{-3/4}\delta^{-1/2}.
]

So a smooth microscopic contact-energy density generates a nonanalytic coarse Interbraid susceptibility solely from finite-core contact topology.

## Prediction / solver test

Sweep incidence quasistatically through (|\alpha|_c) for several asymmetric cores with fixed (K,\rho_+) but widely different (ho_-). Measure contact energy or generalized incidence force. The split-side singular piece should collapse under
[
(|C_s|_c-|C_s|)/\sqrt{|\alpha|-|\alpha|_c}
\to 2^{7/4}\rho_+^{3/4}K^{-3/4},
]
independent of (ho_-).

Finite compliance/core smoothing should round the divergence. If the rounding width is (\Delta\alpha), the peak susceptibility should scale approximately (\chi_{\max}\propto(\Delta\alpha)^{-1/2}).

## Failure conditions

Reject this minimal contact-energy bridge if the exact geometric contact measure is correct but measured Interbraid energy does not track it in the small-deformation regime; if the split-side exponent is not (1/2) after resolution convergence; or if the leading cusp amplitude retains strong (ho_-) dependence at fixed (K,\rho_+). Such failure points toward nonuniform contact energy, tensorial orientation dependence, or additional internal state variables.

## Interpretation

The local geometry supplies a candidate mechanical criticality without inserting a special force threshold:
[
\text{finite-core contact topology}\rightarrow
\text{square-root cusp}\rightarrow
\text{large Interbraid susceptibility}.
]
This is a sandbox conjecture, not canonical H(s)H.
