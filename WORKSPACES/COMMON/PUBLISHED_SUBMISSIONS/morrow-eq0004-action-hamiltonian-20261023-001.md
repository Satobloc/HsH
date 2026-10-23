# EQ-0004 — Action-to-Hamiltonian audit

**Worker:** Morrow  
**Status at submission:** NUMERICALLY CHECKED / LEAN SUBMISSION PENDING / NOT AN H(s)H CANDIDATE / PHYSICALLY UNVALIDATED

## Provenance

- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `SAT O Derivations/CODE-LOCKED DERIVS.txt`
- Blob: `783b05d39d59bf854b92090e15d205e6823b51c8`
- File commit: `d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc`
- Commit date: `2025-10-27T01:15:21Z`
- Locator: lines 3–18 (D1)
- Read extent: complete file, 420 lines / 18,289 decoded characters.

Verbatim historical mathematics:

```tex
S = \int d\lambda \left( \frac{1}{2} m \left( \frac{d\xi^\mu}{d\lambda} \right)^2 - V(\xi^\mu) \right)
\pi^\mu = \frac{\partial L}{\partial \dot{\xi}_\mu}
\mathcal{H} = \frac{1}{2m} \pi^\mu \pi_\mu + V(\xi^\mu)
[\xi^\mu, \pi^\nu] = i \hbar \delta^{\mu\nu}
```

## Result and definite correction

The Legendre transform is correct for a finite-dimensional coordinate when
`lambda` is the evolution parameter:

\[
L=\frac12m\dot q^2-V(q),\quad p=m\dot q,\quad
H=p\dot q-L=\frac{p^2}{2m}+V(q).
\]

The source calls the result a *Hamiltonian density* while writing an action
with only one integration variable and no independent filament coordinate.
That wording is not sufficient for a filament field.  The uniquely standard
field correction is to distinguish evolution time `t` from material/arclength
coordinate `s`:

\[
\mathcal L=\frac{\mu}{2}|\partial_t\xi|^2-
\frac{T}{2}|\partial_s\xi|^2-U(\xi),\qquad
\pi=\mu\partial_t\xi,
\]

\[
\mathcal H=\pi\partial_t\xi-\mathcal L=
\frac{|\pi|^2}{2\mu}+\frac{T}{2}|\partial_s\xi|^2+U(\xi).
\]

This is a correction of mathematical type/wording, not a derivation of the
filament parameters or an H(s)H action.  Canonical quantization is downstream
and additionally requires a declared field domain, boundary conditions and
delta distribution; it is not established by the Legendre identity alone.

## Dimensions and limits

Particle form: `[m]=M`, `[q]=L`, `[t]=Tau`, `[p]=M L Tau^-1`, and every term
in `H` has dimension `M L^2 Tau^-2`.  Field form: `[mu]=M L^-1`, `[T]=M L
Tau^-2`, so every term in `mathcal H` is energy per length `M L Tau^-2`.
The transform requires nonzero mass/density; positivity requires positive
mass/density.  At zero velocity, `H=V`.  At zero slope the field expression
reduces pointwise to kinetic plus potential density.  For periodic or fixed
boundary conditions, integration of the density gives the conserved field
Hamiltonian when the Lagrangian has no explicit time dependence.

Topology: none is implied by the Legendre transform.  Filament closure or
boundary topology enters only through the field domain and boundary conditions.

## Executed Python

Script: `morrow_eq0004_action_hamiltonian.py`  
SHA-256: `de588f17fccbf7e9b6c9f54c0d8c137328c41ea9ce505cbb207085e761a0b090`

```text
particle Legendre max residual=2.274e-13
field-density Legendre max residual=1.421e-14
harmonic omega=sqrt(k/m)=1.673320053068151 s^-1
harmonic period=3.754921418445276 s
Verlet steps=100000; dt=1.0e-03 s
max relative Hamiltonian drift=6.956e-07
ALL ASSERTIONS PASS
```

The complete script is included in the durable report and retained by hash.

## Backbone placement

`action -> canonical momentum -> Legendre transform -> Hamiltonian` is exact
standard mechanics.  The field correction supplies the proper entry to
continuum mechanics.  Still missing are: a selected H(s)H action, constitutive
law, balance laws, dissipation/Rayleigh functional, stress tensor, and the
controlled assumptions leading to Euler and Navier–Stokes equations.

No CODATA comparison is admissible: all numerical values in the harmonic test
are explicit test inputs, not independently predicted constants or observables.

## Required readings

- Live `BEDROCK.md`: full 548 lines, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`.
- `STATE_OF_THE_THEORY.md`: full 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Random substantial archive draw: Python `secrets.randbelow(122)` returned
  index 103, `TADA.txt`; full 560 lines / 22,409 decoded characters, blob
  `76400bef13d359d13311537b39134915f8e40ed5`. Honest takeaway: it preserves
  user corrections that SAT is Minkowski-first and that the UI/Whirligig/
  Spheres are representational solvers, while its 3+3 scaling discussion is
  exploratory and explicitly catches the invalid addition of `H0` and `c`.

Mersearch-first check found the shared request slot occupied by request
`2026-10-21-orson-nlm-big-haul-math-001` (`requested`), so this packet used
bounded direct primary-source reading and records that limitation.

## Exact discriminator

Recover an operative action whose variation yields the current finite-core
equations, identify the field coordinate and measure, derive positive `mu` and
`T`, then show which additional constitutive and dissipative terms lead to the
required continuum and Navier–Stokes limits.  Until then this is mathematically
sound standard backbone material, not an H(s)H candidate or physical prediction.
