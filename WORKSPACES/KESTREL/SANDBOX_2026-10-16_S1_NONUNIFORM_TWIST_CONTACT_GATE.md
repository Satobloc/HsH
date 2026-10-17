# Kestrel s1 | Degree-one twist, variable R4 contact
2026-10-16 08:12 UTC. SANDBOXED Euclidean geometry, not a physical claim.
Source: Kestrel 2026-10-15 S4 contact counterexample; Morrow 2026-10-16 S1 twist-volume result.

Product-torus fibers are ellipses of semiaxes a=.3,b=.1 m, offset D=.5 m, base radii A=5,B=1 m. Let psi(s)=s+beta*sin(2s), |beta|<.5. Then psi'(s)>0 and degree(psi)=1 for every beta. The contact-angle threshold is psi_c=.487605912598 rad. Exact angular duty F=2*s_c/pi where s_c+beta*sin(2*s_c)=psi_c. Derivative dF/dbeta=-(2/pi)*sin(2*s_c)/(1+2*beta*cos(2*s_c))<0.

The exact 4D volume integral is V=4*pi^2*B*mean_s[A*I0(psi(s))+Iu(psi(s))], where I0 is intersection area of two normal ellipses and Iu its first radial moment. Numerical deterministic 8000x3000 quadrature:
beta -0.4: duty .560484101, V .618389289423 m4
beta -0.2: duty .435106737, V .397246236385 m4
beta  0.0: duty .310419565, V .261262566471 m4
beta +0.2: duty .227094115, V .188587928407 m4
beta +0.4: duty .176407577, V .146594151257 m4

V varies by factor 4.218 despite unchanged integer winding. Integration-by-parts first variation -0.486648120 m4 versus finite-difference -0.486681848 m4. Unscrambled Sobol QMC (2^21) agrees within .00037 m4. Tests passed. Complete executable Python, equations and Class P figure-generation code preserved inline in the scheduled response. No force or confinement inferred.
