# EQ-0005 — Field action to periodic wave dynamics

**Worker:** Orson Vay  
**Status at submission:** NUMERICALLY CHECKED / LEAN SUBMISSION PENDING / NOT AN H(s)H CANDIDATE / PHYSICALLY UNVALIDATED

## Provenance and original mathematics

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `SAT O Derivations/CODE-LOCKED DERIVS.txt`
- Blob: `783b05d39d59bf854b92090e15d205e6823b51c8`
- File commit: `d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc`
- Commit date: `2025-10-27T01:15:21Z`
- Locator: D2, lines 21–29 and expanded D2, lines 72–114
- Read extent: complete file, 420 lines / 18,289 decoded characters

Verbatim historical mathematics:

```tex
V_{\rm tension}[\xi] \approx \frac{1}{2} \int d\lambda\,d\lambda'\,\xi^\mu(\lambda)\,K_{\mu\nu}(\lambda,\lambda')\,\xi^\nu(\lambda')
K_{\mu\nu}(\lambda,\lambda') = -T\,\delta_{\mu\nu}\,\frac{\partial^2}{\partial\lambda^2}\,\delta(\lambda-\lambda')
\int_0^L d\lambda'\,K_{\mu\nu}(\lambda,\lambda')\,\phi_n^\nu(\lambda') = m\,\omega_n^2\,\phi_n^\mu(\lambda)
\phi_n^\mu(\lambda)=\frac{1}{\sqrt{L}}\,\varepsilon^\mu\,e^{ik_n\lambda},\qquad k_n=\frac{2\pi n}{L}
\omega_n = |k_n|\,\sqrt{\frac{T}{m}}
```

## Reconstruction and definite correction

The minimally typed classical field action is

\[
S[\xi]=\int dt\int_0^L ds\left[
\frac{\mu}{2}|\partial_t\xi|^2-
\frac{T}{2}|\partial_s\xi|^2\right].
\]

Its Euler–Lagrange equation is

\[
\mu\,\partial_t^2\xi-T\,\partial_s^2\xi=0.
\]

For periodic boundary conditions, `xi(s+L,t)=xi(s,t)`, the modes have
`k_n=2*pi*n/L` and

\[
\omega_n^2=\frac{T}{\mu}k_n^2,
\qquad
\omega_n=|k_n|\sqrt{T/\mu}.
\]

The archive's symbol `m` is dimensionally valid here only if it denotes mass
per unit length. Calling it a point mass would give `sqrt(T/m)` units of
`sqrt(length)/time`, not a wave speed. The definite correction is therefore
`m -> mu`, `[mu]=M/L`, while retaining the historical expression verbatim.

The local conservation law follows from `v=xi_t`, `q=xi_s`:

\[
\partial_t\left(\frac12\mu v^2+\frac12Tq^2\right)
=\partial_s(Tvq).
\]

This is a standard linear-string result. It does not determine an H(s)H
constitutive law, finite-core bending term, damping, nonlinear interaction, or
coupling to other sectors.

## Dimensions, signs, limits and topology

- `[mu]=M L^-1`, `[T]=M L Tau^-2`; hence `[T/mu]=L^2 Tau^-2` and
  `sqrt(T/mu)` is a velocity.
- Hyperbolic propagation and positive quadratic energy require `mu>0`, `T>0`.
- `T -> 0` gives independent free material points; `mu -> infinity` gives
  vanishing wave speed; `k=0` gives the constant zero-frequency mode.
- The selected topology is a periodic domain `S^1`. Fixed endpoints instead
  give `k_n=n*pi/L`; topology/boundaries are inputs, not consequences.
- Adding stiffness, damping, nonlinear tension or finite-core geometry changes
  the operator and dispersion; none is justified by D2 alone.

## Executed numerical test

Declared SI test inputs: `L=0.65 m`, `mu=5.0e-4 kg/m`, `T=80 N`, periodic
mode `n=3`. They are laboratory-scale test inputs, not fitted SAT constants.

```text
L=0.650000000000000 m; mu=5.000000000000000e-04 kg/m; T=80.000000000000000 N
c=sqrt(T/mu)=400.000000000000000 m/s
mode n=3; k=28.999316802367321 m^-1
omega=11599.726720946928253 s^-1; f=1846.153846153846189 Hz
period=5.416666666666666e-04 s
N dx[m] dt[s] steps relative_L2 max_relative_discrete_energy_drift
 64 1.015625000e-02 1.014994569e-05   1074 3.019043593e-01 1.345363682e-15
128 5.078125000e-03 5.077336594e-06   2147 9.124261959e-02 6.005855333e-15
256 2.539062500e-03 2.538668297e-06   4294 2.370612386e-02 4.994854935e-15
512 1.269531250e-03 1.269481969e-06   8587 5.980653222e-03 1.747322938e-14
observed convergence orders: 1.726312 1.944448 1.986885
dimensions T/mu=(0, 2, -2); sqrt(T/mu)=(0, 1, -1) (expected velocity)
ALL ASSERTIONS PASS
```

The centered second-order scheme approaches order two under refinement. Its
exact discrete staggered-energy invariant remains constant to approximately
`1.75e-14` at the finest grid.

## Backbone placement and empirical gate

This fills a standard-physics edge:

`quadratic field action -> Euler–Lagrange equation -> local energy balance -> periodic modes -> linear dispersion`.

It does not yet connect to stress tensors, three-dimensional continuum balance,
constitutive closure, viscosity, Euler flow or Navier–Stokes.

CODATA comparison is not applicable. No fundamental constant is inferred and
no independently measured observable is predicted; all dimensional quantities
are declared numerical test inputs.

## Required readings

- Live `BEDROCK.md`: complete, 548 lines; blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`.
- `STATE_OF_THE_THEORY.md`: complete, 155 lines; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Mersearch request slot remains occupied by
  `2026-10-21-orson-nlm-big-haul-math-001` with status `requested`; bounded
  direct primary-source reads were therefore used.
- Random substantial file pool: ten equation-bearing archive files returned by
  a bounded `section` search. Python `secrets.randbelow(10)` returned index 5:
  `_AUTO_EXTRACTED_TEXT/Minkowski-1-6.txt`, read completely, 256 lines / 13,124
  characters; blob `c21aa98971b9eb94daecc147735b1d743f71b055`.
  Honest takeaway: it is a later extracted synthesis that places a Master SAT
  Lagrangian beside braid-force and Z3 claims, but contains OCR damage and
  assertion-level links. It is useful for locating historical terminology,
  not evidence for the D2 wave equation or its H(s)H applicability.

## Exact discriminator

Supply a current finite-core H(s)H field action with a declared material
coordinate, measure, boundary conditions and independently derived positive
coefficients. Derive its linearization and show whether D2 is recovered as a
controlled limit. Only then can the standard wave backbone be considered for
H(s)H candidacy; cross-sector candidacy still requires additional independent
sectors without retuning.
