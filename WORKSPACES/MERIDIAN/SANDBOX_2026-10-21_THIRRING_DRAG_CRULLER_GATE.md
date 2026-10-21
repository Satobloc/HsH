# Meridian | Thirring action on rotating shells and cylinders, Cruller comparator | 2026-10-21

Status: SANDBOXED external-GR comparator, not an SAT-derived field equation or second-order-winding law. Planck convention c=hbar=G=1.

## Conventional sources and distinct geometries

Thirring (1918) analyzed rotating hollow MASSIVE SHELLS and inertial/Coriolis effects; Stanford GP-B historical summary notes an original cylindrical description: https://einstein-new.stanford.edu/SPACETIME/spacetime4.html . Frehland (1971) specifically computed a rotating LONG THIN HOLLOW CYLINDER, in linearized gravity, finding homogeneous interior Coriolis field and zero exterior in the idealization: https://doi.org/10.1038/physci230011a0 . Brill and Cohen (1966) extended massive SPHERICAL shell dragging to strong compactness at first order in rotation: https://doi.org/10.1103/PhysRev.143.1011 . Keep spherical and cylindrical numerical coefficients separate. Review of different notions of frame dragging: https://www.mdpi.com/2218-1997/7/10/388 .

For a stationary axisymmetric metric ds² = g_tt dt² + 2 g_tphi dt dphi + g_phiphi dphi² + ..., canonical p_phi = g_tphi dot(t) + g_phiphi dot(phi). For zero angular momentum p_phi=0, omega_Z = dphi/dt = -g_tphi/g_phiphi. This is a frame motion definition, NOT an automatic material torque. A moving material marker has angular velocity relative to the chosen ZAMO frame Omega_material - omega_Z.

The weak rotating SPHERICAL shell estimate is omega_in/Omega_shell ≈ 4GM/(3Rc²) = (2/3) r_s/R, with r_s=2GM/c², in its weak-field, slow-rotation domain. In Planck units this is (4/3)(M/R), with M and R both numerical Planck lengths. Brill-Cohen strongly relativistic shells approach perfect co-dragging; it is unjustified to extrapolate the weak coefficient or claim reverse rotation at large mass.

Coordinate artifact null control: Minkowski ds²=-dt²+dr²+r²dphi²+dz². Set phi=varphi+Omega*t; then ds²=-(1-Omega²r²)dt² +2 Omega r² dt dvarphi +r²dvarphi²+dr²+dz². Its omega_Z=-Omega but intrinsic Riemann curvature is ZERO. Metric cross-terms alone do not produce a Thirring physical field.

## Cruller three-rate firewall

Existing Cruller parent (2,3) normal frame has connection A_u=12/sqrt26 per curve-parameter u, a geometrical frame rotation. Distinguish from omega_Z physical 1/time GR frame-dragging and Omega_material physical 1/time material rotation. If a Lorentzian physical map u(t) and transported director are separately identified, one candidate relative angular phase budget is dtheta_relative/dt = Omega_material - omega_Z - A_u*(du/dt), with signs subject to explicitly defined director orientation. This is a frame-accounting identity, not a prediction of reverse material winding or of another helix. Counterrotation relative to a frame does not imply reverse intrinsic chirality.

The appropriate material-secondary helix calculation requires actual native Lorentzian stress-energy/geometry, inertial dragging from g_tphi or gyroscopic Fermi-Walker transport, plus a physical elastic response. Compare corrected true dragging against the coordinate-only flat rotating chart, and distinguish the weak spherical-shell reference from Frehland's hollow-cylinder reference.

This work continues WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CRULLER_RELATIVE_REVERSE_WINDING.md and WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CRULLER_SIGNED_WINDING_INSTABILITY.md. Do not infer physical second-order winding from an observer rotation by itself.

Meridian; research sandbox.
