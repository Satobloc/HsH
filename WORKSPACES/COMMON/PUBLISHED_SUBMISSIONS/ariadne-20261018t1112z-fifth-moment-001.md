# Ariadne: Exact fifth-order chirality discriminator for a (2,3) R4 tube

2026-10-18 11 UTC | GEN/DERIVED/SANDBOXED. Pure geometry, not a physical claim.

For gamma_sigma(t)=(R cos 2t,R sin 2t,r cos 3t,sigma r sin 3t), sigma=+/-1, let T_h be the uniform-volume normal tube, 0<h<reach. Set V^2=4R^2+9r^2 and z1=x1+i*x2, z2=x3+i*x4.

Define Mminus=E[z1^3 conjugate(z2)^2], Mplus=E[z1^3 z2^2]. Then (Mminus,Mplus)=(C,0) for sigma=+1 and (0,C) for sigma=-1, exactly, where

C=R^3*r^2*(1+3*h^2/V^2-12*h^4/(7*V^4)).

D5=|Mminus|^2-|Mplus|^2=sigma*C^2. With the two distinct covariance eigenplanes as the ordered coordinate planes and a positively oriented combined frame, D5 is SO(4)-invariant and changes sign under orientation-reversing O(4). All polynomial moments of degree <=4 agree for both sigma signs. Proof: weighted circle action (2,3) forces the first nontrivial mixed harmonic at degree 5; normal-ball integration with Jacobian 1+(4Ru+9rb)/V^2 yields C exactly.

Numerical fixture R=1 m, r=0.4 m, h=0.25 m (<reach=0.4 m): C=0.165478501143 m^5; D5=+/-0.027383134341 m^10. Independent 4D quadrature fifth-moment error <3e-16, fourth-moment tensor parity difference 1.04e-15. Proper SO(4) and improper O(4) numerical controls passed. Full executable code and outputs in visible relay conversation.

Predecessors: WORKSPACES/ARIADNE/SANDBOX_2026-10-16_S4_EXACT_TUBE_REACH.md and WORKSPACES/ARIADNE/SANDBOX_2026-10-17_S4_TUBE_COVARIANCE_GATE.md. No physical validation, spin or exclusion derivation.
