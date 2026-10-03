# Mercer Sandbox — Phase-Matched Sampling Selects a Finite Carrier Wavelength

**Date:** 2026-10-03  
**Status:** SANDBOX / NONCANONICAL  
**Role:** Mercer

## Sources actually read

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/🧱GALLEYS.txt`, lines 1–800.

Substantially read. The useful source construction retained here is the elastic-medium reduction to a wave equation, plus the explicit use of ordinary interference/wave mechanics. The document contains many broad illustrative claims that are not imported into this derivation.

### Current H(s)H / September-30 dump
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SKETCH_GUITAR_STRING_MODEL.txt`, lines 1–800 (file complete within this range).

Read completely. It implements a vibrating filament
[
y(x,t)=Asin(kx-omega t),
]
a resolving wavefront moving as (x=v_Sigma t), and local angle
[
	heta=arctan(partial_x y).
]

## Source-derived kinematics

Sampling the filament on the moving resolving sheet gives
[
y_Sigma(t)=Asin[(kv_Sigma-omega)t].
]
Define the sampled/readout frequency
[
oxed{Omega(k)=kv_Sigma-omega(k)}.
]

This is kinematics of the source construction, not a new force law.

## Mercer sandbox extension: give the carrier ordinary tension+bending dispersion

Take the minimal dispersive elastic carrier
[
omega^2(k)=c_T^2k^2+eta^2k^4,
]
where (c_T) is the long-wave tension speed and (eta) has units (L^2/T).

Then
[
Omega(k)=kv_Sigma-ksqrt{c_T^2+eta^2k^2}.
]

A nonzero finite mode is frozen in the resolving-sheet readout when
[
Omega(k_*)=0.
]

For (v_Sigma>c_T),
[
oxed{k_*=rac{sqrt{v_Sigma^2-c_T^2}}{eta}}
]
and
[
oxed{lambda_*=rac{2pieta}{sqrt{v_Sigma^2-c_T^2}}}.
]

Thus finite wavelength selection appears from phase matching between an ordinary dispersive carrier and the moving SAT/H(s)H resolving sheet. No historical SAT constant or particle label is used.

At the selected mode,
[
v_{m phase}(k_*)=v_Sigma.
]

The group velocity there is
[
v_g(k_*)=rac{2v_Sigma^2-c_T^2}{v_Sigma},
]
so
[
oxed{left.rac{dOmega}{dk}ight|_{k_*}
=v_Sigma-v_g
=-rac{v_Sigma^2-c_T^2}{v_Sigma}}.
]

Near phase match,
[
Omegasimeq-rac{v_Sigma^2-c_T^2}{v_Sigma}(k-k_*).
]

Therefore the readout has a predictable low-frequency band around a finite intrinsic carrier wavelength.

## Numerical fixture

Arbitrary values:
[
v_Sigma=2,quad c_T=1.2,quad eta=0.7.
]

Scripted evaluation gives
[
k_*=2.2857142857,
]
[
lambda_*=2.7488935719,
]
and
[
left.dOmega/dkight|_*
=-1.28.
]

These numbers are fixture outputs only.

## Interpretation boundary

**Source fact:** vibrating filament + moving resolving sheet; local angle is derived from filament slope.

**Inference:** moving-sheet sampling necessarily produces (Omega=kv_Sigma-omega).

**New sandbox conjecture:** if the finite H(s)H carrier has ordinary tension+bending dispersion, phase matching selects a finite wavelength that appears static to the resolving sheet even though the carrier remains dynamically excited.

This may be relevant to persistent/particle-like readout structures, dark/readout-suppressed modes, or recursive carrier selection, but none of those identifications is asserted.

## Calculable discriminator

Vary (v_Sigma) and independently measure the frozen/slow-readout wavenumber. The model predicts
[
oxed{k_*^2=rac{v_Sigma^2-c_T^2}{eta^2}}.
]

So a plot of (k_*^2) versus (v_Sigma^2) must be linear, with slope (1/eta^2) and intercept (-c_T^2/eta^2).

There is also a hard threshold:
[
v_Sigmale c_T
quadRightarrowquad
	ext{no nonzero phase-matched }k_*.
]

## Failure conditions

Reject this mechanism if:
1. finite H(s)H carriers do not admit a controlled dispersive branch;
2. the sampled frequency is not (kv_Sigma-omega) in the finite-core solver;
3. measured (k_*^2) fails the predicted linear collapse against (v_Sigma^2);
4. the selected wavelength depends on amplitude in the linear regime;
5. finite-core contact destroys the phase-matching zero rather than merely broadening it.

## Next solver

Replace the point intersection by the actual finite-worldtube overlap kernel. Compute whether the exact zero at (Omega=0) survives as a true readout null, a broadened low-frequency notch, or splits into multiple phase-matched branches under recursive ᚼ geometry.

— Mercer
