# Meridian :00 | 2026-10-23 19Z | Kelvin-vortex pair and closed-ring physical gate

STATUS: SANDBOX. Standard-fluid numerical comparator, not H(s)H validation or a new force law.

Provenance: current BEDROCK.md 548 lines blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE_OF_THE_THEORY.md 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Primary historical SAT archive SRENA SAT2.txt, 1341 lines, blob fe01fc85b1874c1573843724f035ee292fd48961, lines 919-947. User proposed Kelvin mechanism for Coulomb; Srena assistant asserted same-circulation vortices repel and opposite attract. Original date unresolved. This is an assistant hypothesis, not a derived physical law.

Genuine random read: secrets.randbelow(4) -> 3, SAT2026 FIRST BLUSH.txt complete 826 lines, blob f75a71e87202e3ef0d0bd18e766cc564692b86cf. Four-file eligible pool documented in originating conversation. Public-safe. Existing Mersearch three-repo completed manifest 0f017d6f557d24c721e417d1fe3c49abf0653991 inspected, no new Mersearch execution.

STANDARD 2D INVISCID POINT VORTICES: dr_i/dt = sum_{j!=i} Gamma_j [zhat cross (r_i-r_j)]/[2 pi |r_i-r_j|^2]. Two equal vortices maintain fixed separation d and orbit the midpoint with Omega=Gamma/(pi d^2), period T=2 pi^2 d^2/Gamma. Opposite vortices maintain d and translate as a dipole at speed Gamma/(2 pi d). Neither gives radial repulsion/attraction in this comparator.

EXECUTED SI: Gamma=0.001 m^2/s, d=0.01 m, illustrative water nu=1e-6 m^2/s. Speed 0.01591549430919 m/s; equal-sign period 1.973920880218 s; opposite-sign displacement after same duration 0.03141592653590 m. SciPy DOP853 max separation errors 1.73e-13 m and 0; max trajectory errors 1.53e-13 m and 2.78e-17 m. Separate Coulomb comparator: two 1 nC charges at 1 cm repel with 8.987551786171e-5 N. No vortex-force equivalence inferred.

STANDARD CLOSED 3D RING: axial Biot-Savart velocity vz=Gamma A^2/[2(A^2+z^2)^(3/2)], asymptotic z^-3, NOT the Coulomb radial force z^-2. With A=1 mm, Gamma=0.001 m^2/s: vz(10A)=4.925926684208e-4 m/s, vz(100A)=4.999250093739e-7 m/s; ratio 0.001014885201147 versus inverse-square force ratio 0.01. Independent 20,001-segment numerical Biot-Savart quadrature agrees to <5e-16 relative. Regression over 20A-200A gives -2.998756052129, not exactly -3. First overly tight assertion failed; second bound-order programming assertion failed; analytic finite-window bound then passed. All failures retained.

Viscosity caution: diffusion-core estimate from 0.2 mm initial radius after 1.974 s is 2.817 mm, so ideal point-vortex trajectory is not a complete water experiment. Planck units c=hbar=G=1 are a unit conversion only; no Planck medium coefficients assumed.

GATE: standard-fluid mathematics and numerical checks PASS. Literal archived Srena assistant assertion FAILS for the specified ideal point-vortex model. Current SAT/H(s)H Kerr-associated 4D medium, time-wavefront support, charge/circulation map, and actual Coulomb force law UNRESOLVED. No CODATA observable predicted, no parameter fitting, no BEDROCK promotion. Complete runnable code, stdout, two Class P figures in manual conversation archive.
