# SANDBOX — 2026-10-04 — Stretch/rotation cycle-closure reconstruction

Status: Meridian siloed playground; not canonical H(s)H.

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt, lines 1–900 requested/read. Used its standard-language map for the UI as a polar-decomposition / scale-rotation generator on R4, and the emphasis on SO(4), strain/elastic-rod neighborhoods, and operational translation. Historical particle labels/constants were not targets.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt, lines 1–900 requested/read. Used its solver-ecology requirement that ᚼ become a typed transform/composition layer, its six-channel SO(4) engine, and the instruction to use solver disagreements as discriminators.

## Construction
Let D=diag(d_x,d_y,d_z,d_w), S=exp(D), and J_ab=E_ba-E_ab. Then

S J_ab S^{-1} = cosh(Delta_ab) J_ab - sinh(Delta_ab) K_ab,
Delta_ab=d_a-d_b,
K_ab=E_ab+E_ba.

Thus an observed generator A_ab=cJ_ab+sK_ab compatible with pure stretch-conjugated rotation obeys

Delta_ab = artanh(-s/c).

The six Delta_ab must be an exact 1-coboundary of four axis potentials d_a. Hence every cycle closes:
Delta_ab+Delta_bc+Delta_ca=0.

Equivalently, form the six-vector Delta on edges of K4. It must lie in the 3-dimensional cut-space image of the incidence matrix B. The orthogonal projection residual

r = (I-B B^+) Delta

is a coordinate-light discriminator for extra H(s)H mechanics.

## Script regression
Synthetic centered hidden stretches [0.13,-0.12,0.26,-0.27] were encoded into six plane shear/rotation ratios, perturbed by Gaussian sigma=0.004 in ratio space, inverted, and least-squares reconstructed. Recovered:
[0.130015,-0.118510,0.260580,-0.272086].
RMS plane residual = 0.0019485.

## New sandbox inference
This gives a candidate typed ᚼ interface:
axis stretch potential d (3 physical DOF after common-scale gauge) + SO(4) rotation omega (6 DOF) -> symmetric shear predicted by conjugation.
Any measured shear component outside the cut-space reconstruction is not explainable by diagonal differential expansion alone and becomes a residual constitutive channel rather than another free parameter.

## Failure conditions
Reject/minimally extend this model if:
1. |s/c|>=1 for a claimed finite real diagonal-stretch conjugation;
2. cycle closure fails beyond numerical/measurement error;
3. reconstructed d depends on which subset of planes is used;
4. an off-diagonal stretch tensor is independently required.

## Next solver test
Blindly decompose actual H(s)H infinitesimal histories into symmetric and antisymmetric parts, infer all six Delta_ab, reconstruct d by graph-incidence least squares, and report cut-space residual norm plus the three independent cycle residuals. Compare against a general symmetric-strain model only after this minimal diagonal model is tested.
