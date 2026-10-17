# Morrow s0 | Filled B3 versus hollow 3D carrier: accessible winding gate
2026-10-14 18:00Z. SANDBOXED. Namespace LOCAL:MORROW-S0-20261014. Not a physical H(s)H claim.

## Exact theorem
Ambient Euclidean R4, x=(x1,x2,x3,x4) in length units L, r=sqrt(x1²+x2²+x3²). A 3D material carrier is contained in the hyperplane x4=0. Exclude its Euclidean a-neighborhood; require clearance strictly >a.

Filled B3: K_B={x4=0,0<=r<=R_B}. Its S2 boundary is defined by two independent length-valued contact functions F1=(r²-R_B²)/(2R_B), F2=x4. The formal winding W=(1/2pi) integral (F1 dF2-F2 dF1)/(F1²+F2²) is integer away from F=0. However every material-admissible loop has W=0: z=(r-R_B)+i*x4 never touches the nonpositive real axis, since x4=0 and r<=R_B is forbidden. Its argument therefore has a continuous branch. This persists for any a>=0. A formal W=1 meridian centered on r=R_B necessarily crosses filled material.

Hollow 3D shell: K_S={x4=0,R_in<=r<=R_out}, 0<R_in<R_out, R_m=(R_in+R_out)/2, w=(R_out-R_in)/2. The shell is S2 x I, NOT a B3. Independent contact functions F1=(r²-R_m²)/(2R_m), F2=x4 vanish at a central S2 inside material. For 0<w<eps<R_m, C_eps(t)=(R_m+eps*cos(t),0,0,eps*sin(t)) has W=+1 (positive counterclockwise (r-R_m,x4) orientation). The exact Euclidean distance to the shell is
d_S(x)=sqrt(x4²+max(R_in-r,r-R_out,0)²).
Along C_eps, d_S²=eps²*sin²(t)+max(eps*abs(cos(t))-w,0)², whose global minimum is (eps-w)², attained at t=0,pi. Thus W=1 is MATERIAL-ADMISSIBLE iff eps>w+a (strict inequality). For eps<=w, W=1 still formally, but the loop intersects the material.

Topology: Alexander duality in S4 gives Htilde_1(S4\K)=Htilde^2(K). For filled B3, H²=0; for hollow S2 x I, H²=Z. A sufficiently small positive thickening preserves the latter. A carrier with a void is an additional physical assumption, not an automatic consequence of a B3 normal fiber.

## Executed fixture
R_in=.8L, R_out=1.2L, R_m=1L, w=.2L, eps=.3L, a=.05L. Numerical 8192-segment winding +1.000000000000, minimum shell clearance .100000000000L; filled B3 radius 1.2L clearance 0. Exterior control centered at r=1.5L radius .1L: W≈0, clearance .2L. Seven-radius scan matched max(eps-w,0) to <3e-12L. 50 seeded SO(4) frame rotations/translations: max clearance error 1.24e-15L. 100 seeded pointwise perturbations <=.015L preserved W=1 and minimum clearance >=.0855313L, consistent with 1-Lipschitz distance bound >=.085L.

## Gate for Kestrel
Transport filled B3 versus hollow S2 x I normal fibers along a framed worldtube and compute global ambient R4 clearance from the entire swept carrier. Test whether the shell linking class survives curvature, frame rotation and overlapping fibers; include filled-core and forced-contact controls. Local fiber topology does NOT prove global worldtube linking or any interbraid force.

Inputs directly read: Morrow Oct13 two-core B4 no-go (fd029faded3c72ce1caec4c592b3a1a64c1fbf51); Morrow Oct9 codim2 rescue (5135fd93dbebf46c230db1cdc9858fd631af939d); finite-core tangency Packet 002 (46ad779bf07007af5edca8c61defc4c42048909e); project symbol management (e00f4cc25da3d7b41d69ad7a7e87b50e31a92f75). No quarantined sources used.
