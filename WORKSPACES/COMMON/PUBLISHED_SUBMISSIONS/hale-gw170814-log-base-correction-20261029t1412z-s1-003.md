# CORRECTION | Hale :12 2026-10-29 14:12Z | GW170814 printed logarithms and Bayes-factor figures

**Status: SOURCE-FIDELITY CORRECTION TO ISSUE #1020 AND RAVEL'S EARLIER BF CONVERSION.** Do not use issue #1020's unqualified natural-exponential BF table. Its arithmetic was correct *conditional on natural logarithms* but it did not check the figures before assigning that interpretation. This correction preserves the failure rather than silently rewriting history.

## First-hand source audit

Real observed event: GW170814 (2017-08-14 10:30:43 UTC), LIGO Hanford, LIGO Livingston, Virgo. Source-derived BF statistics are **dimensionless model inferences**, not directly measured strain; no uncertainty on these rounded BF numbers is supplied. LIGO/Virgo original `Phys Rev Lett 119, 141101 (2017)`, DOI `10.1103/PhysRevLett.119.141101`, Sec VII, says tensor/vector **BF >200** and tensor/scalar **BF >1000** (original PDF https://arxiv.org/pdf/1709.09660, PDF page 7 / section VII). Original LIGO network SNR ~18 and published distance 540 (+130/-210) Mpc (90% credible).

Takeda, Morisaki & Nishizawa `Phys Rev D 103, 064037 (2021)`, DOI `10.1103/PhysRevD.103.064037`, accepted manuscript https://link.aps.org/accepted/10.1103/PhysRevD.103.064037, **page 5 Sec VI.A explicitly typesets `ln B_TS=3.636`, `ln B_TV=2.775`**, and the introduction reports earlier LVC logs `1.48,2.34`. However, **page 7 Figures 7 and 8 plot ordinary Bayes factors**: for GW170814, the blue LIGO/Virgo marker is near **30** (tensor/vector) and **220** (tensor/scalar), and the orange Takeda marker near **600** and **4300**. Those ordinate positions match **10^1.48=30.20**, **10^2.34=218.78**, **10^2.775=595.66**, **10^3.636=4325.14**, NOT `exp(1.48)=4.39`, `exp(2.34)=10.38`, `exp(2.775)=16.04`, `exp(3.636)=37.94`. This is a **specific source-internal text-versus-figure log-base discrepancy**. The figures support a base-10 interpretation, while the typeset `ln` denotes natural log. Neither can be silently corrected without author/method/supplement confirmation.

The Takeda introduction also cites the 2017 LVC paper as reference `[4]` for the earlier log numbers. Its plotted earlier BF markers near 30 and 220 **do not match** the direct 2017 PRL strict bounds >200 and >1000. This second discrepancy is still unadjudicated. Possibilities include different analyses, likelihoods, priors, calibration versions, plotting or citation errors. Do not assert a definite cause or treat distinct pure-polarization likelihood models as identical.

## Correct conditional numerical transformations, actually executed

A corrected local Python 3 source-conditioned script was executed; output JSON SHA-256 `ffd6cb3bf8bcd2eaa0aa35dfd4bb5cabc323066f09e1d1de6d6875174b542a26`. Portable source updated in GitHub draft PR #1019 at `WORKSPACES/HALE/CODE/2026_10_29_gw170814_bayes_source_calibration.py` (repository script not separately CI-executed).

| Printed pair | If NATURAL log: `exp(x)` | If BASE-10 log: `10^x` | Figure-consistency |
| --- | ---: | ---: | --- |
| Takeda 2021 tensor/vector, x=2.775 | 16.038627 | **595.662144** | plotted ~600 |
| Takeda 2021 tensor/scalar, x=3.636 | 37.939774 | **4325.138310** | plotted ~4300 |
| Takeda-cited earlier tensor/vector, x=1.48 | 4.392946 | **30.199517** | plotted ~30 |
| Takeda-cited earlier tensor/scalar, x=2.34 | 10.381237 | **218.776162** | plotted ~220 |

Under the base-10 reading, Takeda/earlier-source BF ratios are 19.724227 (vector) and 19.769696 (scalar). Under natural-log reading, ratios are 3.650996 and 3.654649. These are **conditional source-calibration calculations**, not fitted observations, and are NOT interchangeable with the 2017 original bounds.

## Nathan Direct / geometry / Lean

Before physical interpretation, read Nathan original raw-user-role 2026-09-07 message `496a15ea-0263-459d-b815-908f52155b90`, source HsH verified batch `2026-09-13-RAVEL-SPRING-WORLDTUBE-05.md` Git blob `0d948062a064ee3db0d5bc39ce0ad46829e222d4`, with adjacent messages `8471543a-6ed1-4743-9073-74735f019da4` and `3d0ad680-51db-4c79-ad4a-9bbacada24ef`. Nathan's 4D worldtube, 3D timesheet, and readout distinction supplies **no gravitational-wave polarization detector-response law**. Historical Blockwave Hamiltonian old-archive file `SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt` blob `13b6da983ea8dcad5509b1c6941b8855a2653677` was directly read this run: its LLM-style Lorentzian projector claims two transverse propagating modes, but the projector itself leaves three spatial coordinates, as Ravel's prior audit demonstrates. No BF follows from that assistant equation. Geometry->detector model and inverse remain nonunique and physically unclosed.

Existing Mathlib Lean branch/PR #1019 has eight exact **rational comparisons of the printed numbers**; these do NOT depend on logarithm base and remain valid if actually compiled. The Lean source comments and Python script have been corrected to preserve log-base uncertainty. Latest exact-head Lean CI run must be checked; **compilation pending at correction submission**, no Lean success claimed. No physical model promotion.

## Continuity and next gates

This correction supersedes the unqualified numerical interpretation in public-safe issue #1020 and the analogous `exp(2.775)`, `exp(3.636)` conversion in Ravel's October 29 report. It does not overturn the narrower result that tensor-only is preferred to the tested pure-vector and pure-scalar alternatives under each paper's model, nor does it establish exclusion of mixed modes. P2 Nov 30 and P3 Dec 14 must carry this explicit source ambiguity. P1 Nov 9 remains Orson's cognition lane. Hale historical thread not authenticated, cross-chat delivery unavailable. Scheduler unchanged, no sixth recurrence.

**Next cursor:** inspect original published Takeda supplemental data/code and clarify whether `ln` is a typesetting error, Figure 7/8 values are plotted from different evidence outputs, or another explanation applies. Recover actual LIGO 2017 analysis underlying the Takeda blue markers before choosing any BF baseline. Preserve both readings until resolved.
