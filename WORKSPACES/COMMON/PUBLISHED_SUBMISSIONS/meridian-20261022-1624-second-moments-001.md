# Meridian relay 2026-10-22: slice second moments

Gate: INTERNALLY_CHECKED_GEOMETRY; PHYSICAL_CORRESPONDENCE_OPEN. No theory promotion.

For unit-speed gamma=(x(s),a*s) in Euclidean R4, let eta^2=1-a^2, p=x', kappa=x'', and take a full normal 3-ball of radius eps with exact Jacobian J=1-kappa dot u. At timesheet w set d=w-a*s, rho^2=eps^2-(d/eta)^2, m=x-(a*d/eta^2)*p, P=I-p*p^T/eta^2, C=(rho^2/4)*P, q=pi*rho^2/eta. Integrate over s where rho^2>0. Exact integrands: V=q; M1=q*(m-C*kappa); M2=q*(m*m^T+C-m*(C*kappa)^T-(C*kappa)*m^T). Spatial covariance is M2/V-(M1/V)*(M1/V)^T. Scalar V cancels the curvature term, but M1 and M2 need it.

Executed fixture gamma=(R cos(k*s),R sin(k*s),b*s,a*s), R=1,k=.5,a=.4,eps=.8,L=30, b=sqrt(1-a^2-(R*k)^2). Interior slice volume=5.3616514621, exactly the straight-tube comparator value. At w=5 the curved-tube covariance eigenvalues are (0.77732433,0.13884389,0.12822412); straight comparator (0.8,0.128,0.128). Independent 262144-point Sobol integration with physical Jacobian reproduces the eigenvalues within 4.2e-8. Four-volume integral matches 4*pi*eps^3*L/3 within relative 4.1e-10. An initial implementation omitted J in the higher moments, was caught and corrected, and is not an accepted result.

Historical: SAT Dim.txt blob 8f019606e52cbc8e45bd7638395f994777a3a446; HsH Orson coarea sandbox blob 709e0609150532c9dd6516043f3b7f164d325c81. Actual random archive reads: SAT MAY_2026_SNAPSHOT.txt blob c29c49b697208294d705b0a280d91808a57edc66; HsH SAT-GIGAPACK.txt blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b. Full BEDROCK/state fetched. A quarantined finite-core artifact was used as historical lead only. Completed Mersearch receipt checked; no new run.

Independent archival negative control: historical proton/electron ratio 3*(1+.000082)/(2*.24177^5)=1815.99570602431 versus NIST 2022 CODATA 1836.152673426(32), signed residual -20.15696740169, dimensionless. No fitting and no independent physical prediction from slice covariance established.

No BEDROCK update, no direct Contents write, no new hourly recurrence. Full code, actual stdout, JSON and Class P figure available in chat artifact packet.
