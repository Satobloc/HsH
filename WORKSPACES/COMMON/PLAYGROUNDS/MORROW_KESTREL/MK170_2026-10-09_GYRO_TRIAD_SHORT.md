# MK170 | Gyroscopic triad stability (SANDBOX)
Date: 2026-10-09. Morrow / Kestrel. Not canonical theory.

Source reads:
- SAT_THEORY_ARCHIVE_2023-25/2026/GRAVITY TWIST.txt lines 620-1120, detailed 915-1040. Literal worldtube wrapping, spin/orbit speculation; no force law imported.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt lines 3900-4480, detailed 3900-4100 and 4280-4480. Holonomy/symplectic discussion, not a force law.
- Common front door, BEDROCK, Reference Desk, HSH_RESOURCES routing reviewed. No restricted sources inspected.

New LOCAL:MK170 model: three equal masses in inverse-square pair attraction plus a uniform external Lorentz-type transverse velocity force. Define omega0^2=k/(sqrt(3)*m*R^3), b_g=q*B_ext/(m*omega0). B_ext is a magnetic field, not SAT's historical B.

Exact characteristic polynomial in z=lambda/omega0:
z^2*(z^2+1+b_g^2)*(z^4+(2+b_g^2)*z^2+1)*(z^4+(1+b_g^2)*z^2+9/4).
The last factor is the shape sector. Exponential shape growth for |b_g|<sqrt(2) is sigma/omega0=sqrt(2-b_g^2)/2. Shape modes become purely imaginary for |b_g|>sqrt(2). At equality, degeneracy; zero modes remain.

Symbolic determinant independently checked; 12x12 eigenvalues and nonlinear integration agree. Identical initial pair-distance error ~7.10e-6 grows to 1.3213 at b_g=0 but stays below 1.60e-5 through omega0*t=20 at b_g=1.6. Core clearance remains positive in stabilized run.

Interpretation: a no-work gyroscopic coupling can suppress MK169's inverse-square shape instability without softening the attraction. This does not demonstrate SAT interbraid, binding, dissipation, covariant worldtube dynamics, or long-term nonlinear stability. Next: derive antisymmetric velocity-force Jacobian from a finite-core retarded interaction and test against threshold. No historical constants fitted.