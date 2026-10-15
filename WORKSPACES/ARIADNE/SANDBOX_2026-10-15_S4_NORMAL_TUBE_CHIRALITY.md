# Ariadne s4: finite-core orientation token
Run: REVROT3-110-20261015T1448Z-s4. GEN/DERIVED; Python executed; SANDBOXED.
Source: WORKSPACES/ARIADNE/ariadne_so4_bivector_chirality_gate_20261014.py.

For gamma_sigma(t)=(R cos(Pt),R sin(Pt),r cos(Qt),sigma*r sin(Qt)),
(P,Q,R,r)=(2,3,1,0.4), let v0=hypot(P*R,Q*r), a1=Q*r/v0,
b1=P*R/v0. An orthonormal normal frame is n1=e_r1, n2=e_r2,
n3=a1*e_theta1-b1*e_theta2. For fixed z=(u,v,w) in a radius-h
normal 3-ball, x_z=gamma+u*n1+v*n2+w*n3.
The oriented loop area B_ij=1/2 integral(x_i dx_j-x_j dx_i) obeys
B12=pi*P*((R+u)^2+a1^2*w^2),
B34=sigma*pi*Q*((r+v)^2+b1^2*w^2),
with all mixed components zero by Fourier orthogonality (P!=Q).
Pf(B)=sigma*pi^2*P*Q*((R+u)^2+a1^2*w^2)
*((r+v)^2+b1^2*w^2). Thus sign(Pf)=sigma for all nondegenerate
offset loops, invariant under SO(4), reversed by det=-1 reflection.

For uniform radius-h normal 3-ball, E[u^2]=h^2/5,
E[u^2*v^2]=h^4/35, E[w^4]=3h^4/35.
E[B12]=pi*P*(R^2+(h^2/5)*(1+a1^2)),
E[B34]=sigma*pi*Q*(r^2+(h^2/5)*(1+b1^2)).
E[Pf(B)]=sigma*pi^2*P*Q*(R^2*r^2+
(h^2/5)*(R^2*(1+b1^2)+r^2*(1+a1^2))+
(h^4/35)*(2+3*a1^2*b1^2)).
E[Pf(B)]-Pf(E[B])=-sigma*pi^2*P*Q*h^4*
4*(1-2*a1^2*b1^2)/175.

At h=.25: E[B12]=6.382515074903, E[B34]=1.712398995666,
Pf(E[B])=10.929412404089, E[Pf(B)]=10.926183316391.
100,000 seeded normal-ball draws gave mean Pf=10.922636365367;
64 full 256-point polygon loops had max analytic residual 3.91e-14;
200 random SO(4) rotations max Pf residual 6.22e-15. PASS.

Geometric result only; no physical interaction/force/mass claim.
For sufficiently small h, normal-tube coordinates are embedded.
No arbitrary-large-h embedded-tube claim. Ambient orientation must be
calibrated. Full tested Python and Class P figure preserved in the
corresponding visible relay response for manual archival.
