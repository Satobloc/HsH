# Nadir Voss Playground 006 | Two-harmonic affine translation convolution
**Date:** 2026-10-12 19:48 UTC (nominal). **Status:** PLAYGROUND/SANDBOX; CLAIMED VERIFIED in frozen numerical fixture. **Participation:** source-grounded relay reconstruction, not original historical Nadir or physical theory. **Namespace:** LOCAL:NADIR-FOURIER.

## Source and scope
Continues Nadir's [Playground 005](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/PLAYGROUND_005_SIM4_FOURIER_TRANSLATION_SELECTION.md), source blob `883d3cf28c9b79124852a01c3fff1ed2b5ba8343`. Playground 004 (blob `e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f`) corrected the antecedent oriented-similarity/closure provenance. Historical SAT `Donut canon.txt` (blob `be985c292bfcae7352983d596c38e7f172f6029d`) was inspected as a different SO(3) moving-frame construction, **not** claimed as the origin of the Fourier rule.

## Exact derivation
Right-body convention: `G'=GA`, `G=[[rho Q,t],[0,1]]`, `Q(s)=exp(s Omega)`, `rho>0`. The upper-right block is `t'=rho Q v(s)`. For constant commuting double rotation with integer windings `m_j`, `L=2pi`, and complex plane identification, write `v_j(s)=sum_n vhat_{j,n} exp(i n s)`. Define `rhohat_p=(1/L) int_0^L rho(s) exp(-i p s) ds`. Direct integration gives

`t_j(L)=L sum_n rhohat_{-m_j-n} vhat_{j,n}`.

This is an exact convolution, not a physical quantization claim. Endpoint `Q(L)=I` and `rho(L)=1` alone do not ensure affine closure.

## Frozen two-harmonic fixture
Set `m=(1,2)`, `rho(s)=exp(0.4 sin(k s))` and

`v_1(s)=exp(i s)+(0.3+0.1 i) exp(3 i s)`;
`v_2(s)=0.6+(-0.2+0.25 i) exp(2 i s)`.

The Bessel expansion `exp(epsilon sin(k s))=sum_r I_r(epsilon) exp(-i r pi/2) exp(i r k s)` implies `rhohat_{-2}=i I_1(0.4)`, `rhohat_{-4}=-I_2(0.4)` when `k=2`. Thus

`t_1(2pi)=2pi [i I_1(0.4) - (0.3+0.1i) I_2(0.4)]`
`t_2(2pi)=2pi [0.6 i I_1(0.4) + (0.2-0.25i) I_2(0.4)]`.

| Dilation harmonic | Plane 1 | Plane 2 |
| --- | --- | --- |
| k=2 | -0.038204286655 + 1.269203151678i | 0.025469524437 + 0.737325842792i |
| k=3 | 0 | 0 |

At `k=3` neither occupied combined frequency 2 or 4 is divisible by 3, so both translations close even though dilation and body translation vary. Both cases have `Q(L)=I` and `rho(L)=1`.

**Verification:** Independent SciPy adaptive quadrature and 65,536-point periodic trapezoid agreed with exact modified-Bessel convolution for all four cases to <1.4e-15 absolute error; endpoint and hit/miss assertions passed. Local reproducible code and JSON: `nadir_two_harmonic_probe.py`, `nadir_two_harmonic_results.json`. Precision figures `nadir_precision_paths_k2.png` and `nadir_precision_paths_k3.png` produced locally. These files were not yet committed.

**New discriminator:** If `-m_j` is absent from `supp(rho)+supp(v_j)`, that plane closes. Overlap is necessary but not sufficient for nonclosure because coefficients may cancel.

**Next cursor:** perturb `Omega(s)=Omega_0+eta Omega_1(s)` with noncommuting generators and test first Dyson/path-order correction. Do not use scalar Fourier selection outside the stated commuting fixture. No target-fitted constants or particle labels.