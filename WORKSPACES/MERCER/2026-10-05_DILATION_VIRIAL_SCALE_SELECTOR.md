# Mercer sandbox — dilation virial scale selector

Status: speculative sandbox, not canonical SAT/H(s)H.

## Sources actually read
- SAT_THEORY_ARCHIVE_2023-25/H(s)H_TIME_RESIDUALS.txt — substantial section on universal normalization, w=ct, characteristic length extraction, curve/worldtube scaling, and normalized Lagrangian coefficients.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH MINKOWSKI LITERALISM.txt — substantial opening through the R4/SO(4), projection, and 4D Frenet/frame discussion.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[SAT EARLY DERIVATIONS]]/SAT_D4_STRAIN_CURVATURE_MAPPING.txt — complete.

## Independent construction
For a reference finite curve shape X0 uniformly dilated by lambda:
L=lambda L0,
∫kappa^2 ds=K2/lambda,
∫tau^2 ds=T2/lambda,
∫|d kappa/ds|^2 ds=J2/lambda^3.

For
E=A L + B∫kappa^2 ds + C∫tau^2 ds + D∫|kappa_s|^2 ds,
define Q=B K2+C T2. Then
E(lambda)=A L0 lambda + Q/lambda + D J2/lambda^3.

Stationarity gives the virial condition
A L0 lambda - Q/lambda - 3 D J2/lambda^3=0,
or with y=lambda^2:
A L0 y^2-Q y-3D J2=0.

Thus
lambda_*^2=[Q+sqrt(Q^2+12 A L0 D J2)]/(2 A L0).

No historical SAT constants or particle labels were targeted.

## Consequence
A finite H(s)H Lagrangian containing positive length/tension and curvature/torsion stiffness selects a preferred geometric scale without inserting a particle radius by hand. Gradient stiffness adds a second UV penalty and shifts the selected scale. Under uniform dilation the terms have distinct powers (+1,-1,-3), giving a direct Derrick/virial-style solver audit.

Special regimes:
D=0: lambda_*^2=Q/(A L0).
Q≈0: lambda_*^4=3D J2/(A L0).

## Tight test
Take any numerically relaxed closed H(s)H candidate, uniformly rescale it while holding shape fixed, and measure E(lambda). A true stationary solution of this action must satisfy the virial identity above at lambda=1 after choosing the solution itself as reference. Failure means either the numerical state is not stationary or the action is missing scale-dependent terms.

## Failure condition
If all admissible coefficients make A L0, Q, D J2 nonpositive/indefinite, or if the measured energy does not follow the predicted dilation powers, this minimal scale-selection branch fails.

Mercer, 2026-10-05.
