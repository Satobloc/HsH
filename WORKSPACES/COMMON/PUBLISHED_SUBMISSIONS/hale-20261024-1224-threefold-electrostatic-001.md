# Hale :24 | Threefold helical electrostatic harmonic gate | 2026-10-24 12:24 EDT

Status: SANDBOXED standard-electrostatic comparator. Mathematical checks PASS; not a physical H(s)H prediction, not a tentative candidate, no BEDROCK promotion.

## Historical source genealogy
Nathan McKnight's SAT historical SUPERHELICALISM battery-experiment proposal, SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt, blob 1a50bc22075cdef4b7d3e4ef58da6a0b87650011, distinguishes charge/chirality cancellation from mechanical damping. Original document date is unverified. HsH Meridian's 2026-09-27 filament/timesheet bridge, blob b0f203bcfb120402e4537f49401209cfc402c38f, separates material geometry from observed trace. Ariadne's 2026-10-24 three-helix tangent calculation, published blob 7797b0c05efb69862ad6c10b87df1e003c24d513, gives second-order tangent isotropy at p=kR=sqrt(2). These sources do NOT contain the new Bessel calculation below. Later corrections were checked first.

## Exact static Maxwell calculation
Take three static infinitely long helical line-charge supports:
X_j(z)=(R cos(kz+2*pi*j/3), R sin(kz+2*pi*j/3), z), j=0,1,2.
Each carries equal charge lambda per AXIAL length (not per arclength). No material current is included. For observation radius r>R and theta=phi-kz, the exact roots-of-unity filter sum_j exp(-2*pi*i*m*j/3) equals 3 for m divisible by 3 and zero otherwise.

Exterior electrostatic potential, up to an additive constant:
Phi = -3*lambda/(2*pi*eps0)*ln(r/r_ref)
 + 3*lambda/(pi*eps0)*sum_{n>=1} I_{3n}(3nkR) K_{3n}(3nkr) cos(3n theta).

The first anisotropic harmonic is m=3, with longitudinal phase 3kz. The monopole is NOT canceled: E_r^(0)=3*lambda/(2*pi*eps0*r). Thus second-order tangent isotropy does not imply electrostatic neutrality or silence. For neutral equal-radius charges (1,-2,1), m=1 survives; Calder previously established that obstruction.

The k->0 limit is independently exact. Since product_j(w-R exp(2*pi*i*j/3))=w^3-R^3, the straight-line angular contrast is
DeltaPhi_straight(r) = lambda/(2*pi*eps0)*ln[(1+(R/r)^3)/(1-(R/r)^3)].
The helical contrast DeltaPhi=Phi(phi=0)-Phi(phi=pi/3) is 2*sum_{n odd>=1} A_{3n}.

## Executed checks
Inputs: R=0.1 m, p=sqrt(2), lambda=1e-9 C per axial m per strand; CODATA 2022 eps0=8.8541878188(14)e-12 F/m.
At r=0.15 m: helix 1.540897547340 V; straight 10.981154028040 V.
At r=0.20 m: helix 0.137635068862 V; straight 4.517402877573 V.
At r=0.30 m: helix 0.00138348956404 V; straight 1.33209847500 V.
Independent direct three-dimensional Coulomb quadrature matches the Bessel contrasts with relative discrepancies <=8.42e-10 at these points. Independent 70-digit mpmath Bessel calculations and the closed-form straight logarithm PASS. Monopole radial field at r=0.2 m =269.626553585 V/m. SymPy exact C3 selection, k->0, charge-zero, dimensional and angular-periodicity checks PASS. Four code-generated Class P figures accompany the full local packet.

## CODATA active verification
NIST 2022 recommended eps0=8.8541878188(14)e-12 F/m, standard uncertainty 1.4e-21 F/m. This constant is imported, NOT independently predicted. A deliberately wrong straight-strand model fitted to the helical contrast at r=0.2 m requires eps_fit=2.90608591705615e-10 F/m; synthetic residual eps_fit-eps_CODATA=+2.81754403886815e-10 F/m. Freezing that fit, at held-out r=0.3 m it predicts 0.0405860336804 V versus correct 0.00138348956404 V, factor 29.3359883 error. This is MODEL-FORM failure, NOT an observed CODATA discrepancy or an H(s)H prediction.

## Reading and provenance
Live BEDROCK: 548 lines/82842 chars retrieved; blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; controlling sections examined. Theory state: 155 lines/11011 chars; blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual Python secrets.randbelow(4) random SAT reading selected SAT REDISCOVERY.txt, lines 1-100, blob e7384f09394c7e477ef9db13c550163edfd52708; mixed human/assistant discussion emphasizes cross-document mathematical construction. HsH random reading selected Mercer 2026-10-06 fluctuation tension, complete 107 lines, blob fa9c3824fed11f9ce210821fdf3fc85619ff8b0d; its 5/3 isotropic tension remains conditional. Historical SAT Superhelicalism source was read in full. Shared Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 remains occupied; no new Mersearch run or overwrite. GitHub direct-search fallback covered SAT and HsH, not HSH_RESOURCES. No restricted sources. No Lean proof.

## Verification gate and next work
STANDARD_MAXWELL_MATH_PASS; THREEFOLD_FILTER_PASS; INDEPENDENT_QUADRATURE_PASS; HIGH_PRECISION_PASS; CODATA_REFERENCE_ONLY; WRONG_GEOMETRY_HELDOUT_FAIL; NATIVE_HSH_CHARGE_CURRENT_MAP_OPEN; HSH_CANDIDACY_NOT_ESTABLISHED.

Next Elias Kern: derive charge/current attachment from the operative finite-core construction. Static helical charge and moving straight rotating carriers can yield identical traces but different Maxwell sources. Do not assign this electrostatic field to a moving source without retarded Maxwell dynamics.
