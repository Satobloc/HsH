# Mercer sandbox — dynamic timesheet susceptibility

Status: sandbox conjecture / calculable discriminator, not canonical H(s)H.

## Sources actually read
- Old SAT: `SAT_THEORY_ARCHIVE_2023-25/MISC/SECTION 1.txt`, lines 1–900. Used: dynamical time-flow/foliation, geometric mass/inertia, effective GR convergence. Rejected as targets: historical numerical predictions and one-anchor claims.
- Current H(s)H: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md`, complete. Used: strict dimensional typing and the rule that a candidate mechanism must pass both exponent and measure-dimension tests.

## Construction
Take the linear dynamic sheet equation
[
\rho_\Sigma(\partial_t^2-c_\Sigma^2\nabla^2+c_\Sigma^2\ell_b^2\nabla^4)h=\alpha\rho_m,
\qquad \Phi=\alpha h.
]
With universal metric coupling and (c_\Sigma=c), static normalization gives
[
\alpha^2/\rho_\Sigma=4\pi Gc^2.
]
Fourier transforming yields
[
\Phi(k,\omega)=\frac{4\pi G\rho_m(k,\omega)}
{k^2[1+\ell_b^2k^2-\omega^2/(c^2k^2)]}.
]
Thus
[
\frac{G_{\rm eff}(k,\omega)}G=
[1+\ell_b^2k^2-\omega^2/(c^2k^2)]^{-1}.
]

Static limit: (G_{\rm eff}/G=(1+k^2\ell_b^2)^{-1}).
Pole/propagating sheet branch:
[
\omega^2=c^2k^2(1+\ell_b^2k^2).
]
Long waves are relativistic, short waves bend-dominated ((\omega\sim c\ell_b k^2)).

## Discriminator
A driven finite-sheet solver must collapse onto the two dimensionless variables (x=k\ell_b), (y=\omega\ell_b/c). The static and dynamic measurements must infer the same (\ell_b). Failure of this collapse, or a different pole curve without an independently identified constitutive term, falsifies the minimal tension+bending branch.

## Next
Drive a localized periodic source, fit phase lag and amplitude versus radius/frequency, and compare the extracted pole dispersion with the free-sheet spectrum.