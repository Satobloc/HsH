# Mercer Sandbox — Chiral Constitutive Term Beyond the Holonomy-Blind Spectrum

**Date:** 2026-10-03
**Status:** SANDBOX / NONCANONICAL
**Role:** Mercer

## Sources actually read

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/SAT PRE-H(s)H TIGHTENING.txt`, lines 1–900 substantially.

Retained: braid/link bookkeeping; phase closure and holonomy as candidate quantization machinery; filament/worldtube object language. Rejected as targets: historical fitted particle constants and NotebookLM-era numerical coincidences.

### Current H(s)H
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt`, lines 1–900 substantially.

Retained: nested holonomy as transformation memory, action-angle / symplectic framing, and the distinction between static state labels and transport/history. No numerical targets imported.

## Starting point from previous independent Mercer construction

A reciprocal phase-weighted Interbraid energy
[
E_A={Jover2}sum_{(ij)}|z_i-e^{iA_{ij}}z_j|^2
]
depends only on closed-loop holonomy (Phi=sum_C A_{ij}) after local phase gauge changes. For a triangle its scalar stiffness spectrum is
[
lambda_n=2-2cos[(Phi+2pi n)/3].
]
This detects nonzero holonomy but obeys
[
operatorname{spec}L_A(+Phi)=operatorname{spec}L_A(-Phi),
]
so reciprocal quadratic stiffness alone cannot distinguish handedness.

## New sandbox constitutive term

If H(s)H has a preferred oriented transport/readout direction, the next minimal term is not another static potential. It is an antisymmetric velocity coupling. In a triangle Fourier sector let
[
	heta_n={2pi nover3}+{Phiover3},
]
[
K_n=g+2J(1-cos	heta_n),
qquad
C_n=2gammasin	heta_n.
]
The linear mode equation is
[
mddot z_n-iC_ndot z_n+K_nz_n=0.
]
For (z_npropto e^{-iomega t}),
[
momega^2-C_nomega-K_n=0,
]
so the positive-frequency branch is
[
oxed{omega_n={C_n+sqrt{C_n^2+4mK_n}over2m}}.
]

The static stiffness is even under orientation reversal; the velocity term is odd. Therefore a fixed oriented background makes (+Phi) and (-Phi) spectrally distinguishable.

## Scripted fixture

Using arbitrary dimensionless values
[
m=1,quad g=0.7,quad J=1,quad gamma=0.22
]
with no historical SAT constants:

At (Phi=pi/6):
- (+Phi): 0.89368137, 1.64442363, 2.17202111
- (-Phi): 0.81727617, 1.83496155, 2.05788838
- maximum sorted spectral split: 0.19053792

At (Phi=pi/3):
- (+Phi): 0.98424195, 1.54238661, 2.20347210
- (-Phi): 0.83375308, 1.92064555, 1.97570202
- maximum split: 0.37825894

At (Phi=pi/2):
- (+Phi): 1.09997434, 1.43782991, 2.21811546
- (-Phi): 0.87997434, 1.87782991, 1.99811546
- maximum split: 0.44

## Small-gamma prediction

For (|C_n|ll2sqrt{mK_n}),
[
omega_nsimeqsqrt{K_n/m}+{C_nover2m}+O(gamma^2).
]
Thus the leading chiral shift is linear:
[
oxed{deltaomega_nsimeq{gammaover m}sin	heta_n.}
]

This gives a clean constitutive discriminator: static holonomy splitting scales with (J); handed spectral splitting scales linearly with the independent oriented-response coefficient (gamma).

## Interpretation boundary

**Source:** SAT/H(s)H contains braid/phase/holonomy and oriented/nested transport motifs.

**Inference:** reciprocal stiffness should first be represented by a phase-weighted Hessian.

**New conjecture:** genuine handed spectral asymmetry requires an antisymmetric velocity/transport constitutive term, not merely a chiral static label. (gamma) is not identified with any Standard Model parameter or historical SAT constant.

## Failure conditions

Kill this branch if:
1. finite H(s)H carriers show (+Phi/-Phi) frequency splitting with (gamma=0) and no independently identifiable parity/time-orientation term;
2. the splitting is not odd to first order in the oriented coupling;
3. local rephasing changes physical frequencies;
4. no controlled antisymmetric velocity response emerges from the actual 4D carrier/timesheet dynamics.

## Next solver test

Construct matched (+Phi) and (-Phi) finite worldtube loops. First disable all oriented constitutive terms and verify isospectrality. Then turn on exactly one independently measured orientation-sensitive coupling and test
[
Deltaomegaproptogamma
]
at small (gamma). This cleanly separates geometry/holonomy from constitutive chirality.

— Mercer
