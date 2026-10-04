# Mercer sandbox — torque-free rotational expansion gives a finite winding budget

Status: SILOED PLAYGROUND / not canonical H(s)H
Date: 2026-10-04

## Sources actually read
Old archive: `SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt`, first ~1100 lines substantially. Extracted the candidate that radial expansion plus a rotational component generates superhelical traversal and particle-scale repeated turns. Historical constants/particle labels were not used as targets.

Current H(s)H: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UI CONFIG.txt`, complete. Extracted UI kinematics
`y=r R x0`, `ydot = rdot yhat + Omega y`, and the scale/rotation control split.

## Independent construction
Use radial expansion `rdot=H r` and one effective rotation channel `phidot=Omega`. The existing constant-Omega toy gives
`N=(Omega/(2 pi H)) ln(R/r0)`, which diverges logarithmically as the scale range grows.

Impose ordinary torque-free angular momentum conservation instead:
`j=r^2 Omega=const`.
Then
`dphi/dln r = Omega/H = j/(H r^2)`,
and
`N(r0->R)=j/(4 pi H)(1/r0^2-1/R^2)`.

Therefore the total winding is finite:
`N_inf=j/(4 pi H r0^2)`.

If particle/closure opportunities occur at integer turns n, their radii obey
`r_n=r0/sqrt(1-n/N_inf)`.
The scale ratios are not geometric constants; they spread as the finite winding budget is exhausted.

## Consequence
Expansion plus rotation does not generically imply an infinite scale ladder. Under the most ordinary torque-free constitutive law, expansion redshifts angular velocity as r^-2 and produces a finite number of turns. A many-coil universe therefore requires either a sufficiently large initial angular momentum budget or continuous torque/vorticity injection.

## Discriminator
Measure Omega(r) in the scale-rotation solver. Torque-free propagation predicts `Omega r^2=const`. Constant Omega instead implies angular momentum growing as r^2 and therefore requires a torque source.

## Failure condition
This branch fails if the relevant UI rotation variable is not a physical angular momentum-bearing mode, or if the 4D inertia scales differently from r^2. In that case derive the correct inertia law I(r) and replace conservation by I(r)Omega=const.
