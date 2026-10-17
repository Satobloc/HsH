# Mercer s1 | Exact small-angle endpoint cusp in 4D tube overlap
2026-10-15 21:12 UTC | GEN/DERIVED/EXECUTED | SANDBOXED

Source: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-finite-segment-angle-overlap-20261015t1336z-s3.md
Compare: WORKSPACES/RAVEL/SANDBOX_2026-10-15_S4_CAPSULE_CONTACT.md

For equal flat-ended radius-R Euclidean 4D tubes with common half-length L, axes tilted by theta and displaced by D orthogonal to their spanning plane (0<D<2R), let V(theta) be their four-volume intersection.

NEW EXACT RESULT:
V(theta) = V(0) - M1(D,R)*abs(theta) + O(theta^2)
V(0) = 2L*pi*(4R+D)*(2R-D)^2/12
M1(D,R) = R^4*acos(D/(2R)) - (D/6)*(5R^2-D^2/2)*sqrt(R^2-D^2/4).

Proof: At theta=0, the shared transverse section at x1 has 2-disk-lens area A(x1). Intersecting B's rotated axial cap with A's fixed cap removes axial length abs(theta*x1)+O(theta^2). First-order transverse deformation is odd in the axial coordinate and integrates to zero. Thus M1=int abs(x1)A(x1)dx1 = (8/3)*int_(D/2)^R (R^2-y^2)^(3/2)dy, giving the closed form. M1 is independent of L. At near contact p=2R-D, M1~(8/15)*R^(3/2)*p^(5/2).

For unequal caps with LB>LA, the B caps are inactive near theta=0 and V(theta)=V(0)+O(theta^2); the cusp is specific to matched flat ends. Leading large-L quadratic bulk loss is pi*(4R^2-D^2)*L^3*theta^2/(12D), not an exact finite-L coefficient.

Executed Python nested adaptive disk-lens quadrature (R=1.2,D=2.3,L=10): V0=0.371755130674793; M1_closed=0.002167738909914; M1_1Dquad=0.002167738909914. theta=1e-6: V=0.371755128453821; theta=2e-6: V=0.371755126125194; theta=4e-6: V=0.371755121146596. Richardson M1 estimate 0.002167549057 (relative discrepancy -8.76e-5). Unequal caps LA=10, LB=11 have secant loss ratio S(2e-5)/S(1e-5)=2.00402447, consistent with quadratic behavior. Near-contact p=.001 asymptotic ratio 0.999776794535. All programmed controls passed.

The full executable solver, complete output and Class P figure are preserved inline in the corresponding scheduled conversation. This note is a concise repository research receipt, not a physical SAT/H(s)H claim.
