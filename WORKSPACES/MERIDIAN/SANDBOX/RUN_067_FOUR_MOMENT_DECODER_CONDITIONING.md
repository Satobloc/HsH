# RUN 067 — Four-moment decoder conditioning near rate collision

**Status:** SANDBOX / numerical benchmark / current math status CLAIMED  
**Run start:** 2026-09-20 04:29:45 -04:00  
**Exposure:** internal constructive math only; no PRIOR_ART, nLab, quarantine, external literature, or suspended Integration handoff used.

## Object and operation

One object: the constant 4D double-rotation invariant packet

`m_k = A x^k + B y^k`, k=0,1,2,3,

with `A=a^2`, `B=b^2`, `x=omega^2`, `y=nu^2`.

One operation: numerical conditioning stress test of the existing four-moment decoder as `x-y -> 0`.

The exact determinant is

`D = m0*m2 - m1^2 = A B (x-y)^2`.

Decoder used:

`S=(m0*m3-m1*m2)/D=x+y`,

`P=(m1*m3-m2^2)/D=xy`,

then recover `x,y` as roots of `z^2-Sz+P=0`, followed by a 2x2 solve for `A,B`.

## Numerical protocol

Fixed `A=1.44`, `B=0.4225`, `x=1.21`. For each gap `Delta=x-y`, perturb every moment independently by Gaussian relative noise of scale `1e-12`. Run 2,000 trials per gap. Score the maximum relative error of the unordered recovered squared-frequency pair.

## Results

| Delta | exact D | median relative frequency-pair error | 95% error |
|---:|---:|---:|---:|
| 1e-1 | 6.084e-3 | 2.07e-9 | 5.68e-9 |
| 3e-2 | 5.476e-4 | 2.15e-8 | 6.27e-8 |
| 1e-2 | 6.084e-5 | 1.97e-7 | 5.74e-7 |
| 3e-3 | 5.476e-6 | 2.19e-6 | 6.14e-6 |
| 1e-3 | 6.084e-7 | 1.96e-5 | 5.69e-5 |
| 3e-4 | 5.476e-8 | 2.18e-4 | 7.22e-4 |
| 1e-4 | 6.084e-9 | 2.53e-3 | 7.45e-3 |
| 3e-5 | 5.476e-10 | 2.83e-2 | 8.49e-2 |
| 1e-5 | 6.084e-11 | 2.35e-1 | 8.44e-1 |

The deterioration is far faster than the injected `1e-12` moment noise because the decoder divides by a determinant quadratic in the rate gap and then solves a nearly repeated-root problem.

## Explicit numeral-by-numeral witness

At `Delta=1e-4`, exact moments were:

- `m0=1.862500000000000`
- `m1=2.253582750000000`
- `m2=2.726784009225000`
- `m3=3.299346803161328`

A fixed relative perturbation vector of order `1e-12` produced perturbed moments differing only at about `7e-13` to `3e-12`, yet decoded

- squared frequencies `1.209935680415`, `1.203919447812`
- versus true `1.210000000000`, `1.209900000000`;
- decoded amplitudes `A=1.875389333`, `B=-0.012889333`
- versus true `A=1.44`, `B=0.4225`.

The perturbed determinant itself remained close (`6.099e-9` versus exact `6.084e-9`), so monitoring D alone does not guarantee stable component recovery.

## Result

The four-moment packet is an exact algebraic compression away from degeneracy, but it is **not a robust component decoder near equal squared frequencies**. The equal-rate great-circle sector from Runs 062–063 is therefore not merely an exact endpoint singularity; it has a substantial numerical boundary layer in which separate mode/radius recovery becomes unreliable before exact collision.

Operational consequence: use an adaptive-rank policy. When rate separation is below a noise-conditioned threshold, return a merged/lower-rank carrier unless independent frame/director/connection information supplies the split. Do not force the high-derivative moment decoder to return two physical components.

This is a negative/limiting result for the decoder and a positive result for the adaptive-rank architecture.

## Failure / uncertainty

The threshold is not universal: it depends on measurement/noise model, amplitude ratio, scaling, and whether moments are independently measured or derived from noisy trajectory samples. This run does not establish a general condition number formula.

## Next cursor

Derive or numerically map a dimensionless conditioning indicator combining `D`, moment scale, and estimated moment noise, then compare it directly against native-connection/SVD recovery on the same synthetic noise budget.