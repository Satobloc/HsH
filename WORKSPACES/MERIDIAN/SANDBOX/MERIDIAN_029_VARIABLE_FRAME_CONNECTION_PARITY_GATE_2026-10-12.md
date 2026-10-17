# Meridian 029 | Variable-frame connection and half-turn leakage gate
2026-10-12 | SANDBOX | Source-grounded relay reconstruction, not original Meridian participation.

## Provenance
Continuation of Meridian 028 (blob d40d22a3a4800ce140b116116ef3160d03567a2e) and Meridian 026 transported-metric gate (blob 6bb56af5dba59bc980973e7c4b873db3fd43c483). New result concerns nonconstant **orthogonal** S(s), so the Euclidean metric stays fixed. No physical H(s)H claim, external comparator or restricted material.

## Exact model
H(s)=(cos2s,sin2s,cos3s,sin3s)/sqrt(2), P=diag(1,1,-1,-1), H(s+pi)=PH(s).
L0=kappa D^4+k I+4lambda H H^T, f0=cos(s)e1; T0 eta(s)=P eta(s+pi), T0 f0=-f0.
Let J=E31-E13 and S(s)=exp(theta(s)J) in SO(4). Define Htilde=S H, ftilde=S f0,
T_S eta(s)=S(s) P S(s+pi)^(-1) eta(s+pi).
With A=S'S^-1, covariant derivative nabla=D-A satisfies nabla^4 eta=S D^4(S^-1 eta) exactly, including every connection derivative.
Lcov=kappa nabla^4+kI+4lambda Htilde Htilde^T = S L0 S^-1; [Lcov,T_S]=0. Thus eta_cov=S eta0 has zero T_S=+1 leakage.
The **fixed Euclidean bending law** LE=kappa D^4+kI+4lambda Htilde Htilde^T differs by kappa(D^4-nabla^4), despite S^T S=I. This isolates derivative connection, not pointwise metric anisotropy.

## Exact parity controls
For theta=epsilon sin(s), S(s+pi)=P S(s) P and T_S=P is constant. Thus [LE,T_S]=0 and leakage is exactly zero despite variable S(s).
For theta=epsilon cos(2s), S(s+pi)=S(s), T_S(s)=S(s)P S(s)^(-1) varies, and LE need not commute with T_S. Forbidden-sector leakage is permitted.

## Scripted test
Periodic spectral solver N=256, kappa=.02, k=1, lambda=.6; preconditioned CG. Forbidden fraction = ||(eta+T_S eta)/2||/||eta||.
epsilon | Euclidean odd | Euclidean even | covariant even
0.03 | 1.03e-16 | 0.00835241161978787 | 1.05e-16
0.10 | 1.06e-16 | 0.02782480240367941 | 1.04e-16
0.20 | 1.17e-16 | 0.05554068653338917 | 1.04e-16
At epsilon=0 all are below 1e-16. Relative residuals below 4.1e-10, forcing-sector residual below 4e-16. Independent N=128 grid reproduces nonzero leakage within 2e-17. All scripted assertions passed.
Reproducible Python script SHA256: 3a74daec536b985e16d332b5c52ed2cfc93bf3d5630fe7377e1dd58805241f30.
JSON results SHA256: 99630d3c239a558d92115aa4797be2fb08d58fee211332953d09417749c745ec.
Class P figure SHA256: 919e9c66e5565075cac18c48a849255ebf484a18188e937bf0e4eff503f25cac.
Local full note SHA256: f079cef38ddef63a51eb87f0a82533cdaba769f00bfe805509174a781e8531a9.

## Interpretation / next cursor
A varying orthogonal frame can generate forbidden half-turn-sector response under an ambient Euclidean bending law even when no metric stretch occurs; an antiperiodic frame variation is an exact nontrivial null. Visible anisotropy alone does not identify the constitutive connection. This is a synthetic fixture only, not an electron-to-planet equation. Next source-verify endpoint equations and test whether their connection is transported or physically changed.
