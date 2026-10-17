# Meridian 014 | Finite-core Weyl quadrupole junction
**SANDBOXED | 2026-10-11 | Meridian | Not canonical SAT/H(s)H**

## Result
The exact static axisymmetric Weyl exterior with
`psi=1/2 log[(x-1)/(x+1)] + eps Q_2(x)P_2(y)`
can be joined to a static Minkowski interior on a **deformed equipotential thin shell**. This avoids the singular x=1 horizon boundary of the decaying quadrupole by excision at x>1. The complete Israel surface stress was computed. This is an established-GR thin-shell construction, not a derivation of SAT medium dynamics.

**Equipotential boundary:** `psi(x_b(y),y)=psi_S(x_b)`; `x_b'=-psi_y/psi_x`; at first order `delta x=-eps (x_b^2-1) Q_2(x_b) P_2(y)`. A constant-x quadrupole shell has nonconstant lapse and cannot match a static flat interior with one global time rescaling.

**Flat interior embedding:** On the boundary, `E=exp(2gamma-2psi)(rho'^2+z'^2)`, `R=exp(-psi)rho`, and `Z'^2=E-R'^2>=0`. Interior time is rescaled by the constant boundary lapse. The Weyl gamma field is integrated from its exact vacuum closure equations with gamma=0 on the regular axis.

**Israel tensor:** `sigma=-([k_mer]+[k_phi])/(8pi)`, `p_mer=([k_t]+[k_phi])/(8pi)`, `p_phi=([k_t]+[k_mer])/(8pi)`, with outward normals. For the spherical flat/Schwarzschild shell, `s=sqrt(1-2M/a)`, `sigma=(1-s)/(4pi a)`, `p=(1-s)^2/(16pi a s)`. Dominant energy condition requires `a/M>=25/12`.

**Numerical witness (G=c=M=1):** `x_b=1.7, eps=0.6`, 801 latitudes. Minimum x=1.65347, minimum embedding discriminant Z'^2=5.63718, max equipotential error=2.89e-15. Surface sigma=0.0139723..0.0148922, meridional p=0.0034515..0.0034878, azimuthal p=0.0034578..0.0035115. Minimum sampled DEC margin=0.0104795. Exact spherical Israel controls agree to ~1.7e-16. Pressure anisotropy changes sign near |y|=0.422 (parameter-specific). Axis endpoints and general-amplitude global bounds remain unproved.

**Failure gates:** horizon crossing, fold psi_x=0, negative Z'^2, conical/axis irregularity, unwanted stress-energy/DEC failure, dynamical instability. Next: sweep (x_b,eps) and derive finite-thickness medium constitutive stress independently.

## Source/provenance
Historical SAT: `SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt` complete read (SO4/constraint/medium tool proposals). Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt` lines 240-500 and `FUNDAMENTAL INTUITIONS.txt` complete read. Historical numerical targets not used. Standard Weyl/Israel mathematics independently computed. Private reference index was navigation only, no private links. Live symbol registry and Cross-Formalism Index consulted; symbols are STD or LOCAL:MERIDIAN014. No theory promotion.

Full executable solver, checkpoint and four precision figures preserved in the Meridian task-thread attachments if repository file upload cannot carry binary artifacts.
