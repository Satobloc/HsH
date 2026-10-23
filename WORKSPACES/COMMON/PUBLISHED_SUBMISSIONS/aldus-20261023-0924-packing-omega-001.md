# CODE 000 | Aldus | 2026-10-23 09:24 EDT | Historical packing and Omega audit

STATUS: INTERNALLY_CHECKED / CODATA_ACTIVE / NEGATIVE_RESULTS_RETAINED. No new law or BEDROCK promotion.

## Historical equations, unchanged
HsH GRQM lines 801-825:
V_occ(n)=sum_i integral_0^ell pi*epsilon^2*(1+ell*|grad theta4|) ds;
|grad theta4|=2*pi/ell;
V_node_1=ell^3*B; V_node_2=(4*pi/3)*(ell*B)^3;
omega_i=exp(-alpha*V_occ_i/V_node); Omega=mean_i omega_i.
Archived ell=0.793732 fm, epsilon=2e-21 m, B=3/(4*pi), Omega=9.55e-40.
Alpha is NOT identified with the electromagnetic fine-structure constant.

## Exact calculations
For constant gradient, V_occ(n)=n*pi*epsilon^2*(1+2*pi)*ell.
Variant 2 r(n)=V_occ/V_node_2=(3*n/4)*(epsilon/ell)^2*(1+2*pi)/B^3.
Variant 1 r(n)=n*pi*(epsilon/ell)^2*(1+2*pi)/B.
At B=3/(4*pi), r2/r1=4*pi/3 exactly.

Executed SymPy + 70-digit mpmath:
r2(3)=7.6468384993663953e-9;
r2(4)=1.019578466582186e-8;
r1(4)=2.4340642923991459e-9;
r2(n)=1 only near n=392318995.65403077.
Thus the printed volume formula does NOT enforce an n<=3 strand cap. A separate braid/torsion constraint could still do so.

## Exact overlap lower bound (new)
For alpha>=0 and all local r_i<=r_max,
Omega=mean exp(-alpha*r_i)>=exp(-alpha*r_max).
To attain Omega_arch=9.55e-40, alpha must satisfy
alpha>=-ln(Omega_arch)/r_max, with -ln(Omega_arch)=89.846862565269188.
Necessary alpha bounds:
n<=3, 3D variant2: 1.1749543628090714e10;
n<=4, 3D variant2: 8.8121577210680356e9;
n<=4, 3D variant1: 3.6912279945042553e10.
For alpha=1 and n=4, variant2 gives Omega=0.99999998980421539.
These alpha inversions are fits/constraints, NOT independently derived coefficients.

## Dimensional geometry comparator
A straight one-dimensional line thickened by a 3-ball radius epsilon in FOUR spatial dimensions has V4_tube=n*(4*pi/3)*epsilon^3*ell. A 4-ball node radius B*ell has V4_node=(pi^2/2)*(B*ell)^4. Their ratio at n=4 is 1.67225154644296e-14; alpha lower bound 5.3728078623328e15. This is a conditional 4D comparator, NOT an adopted worldtube geometry. A 3D timesheet slice could justify 3D volumes if explicitly constructed.

## Historical calibration provenance
HsH SAT_CONVOS_22/2026 LAGRANGIAN CLOSURE + QM-GR ISOMORPHISM.txt, lines 2552-2578, explicitly says: solve for Omega to match r_s=3 km for solar mass; computes Omega=(3e3 m)/(3.14e42 m)=9.55e-40; only THEN proposes formalizing Omega as a lattice average. Therefore this numerical value is a SOLAR-RADIUS CALIBRATION, not an independent lattice prediction.

## CODATA 2022, NIST Web Version 9.0
G=6.67430(15)e-11 m^3 kg^-1 s^-2; standard uncertainty 1.5e-15.
Historical G_model=c^2*ell*Omega/m0, m0=1.007276e-27 kg:
G_model=6.7634795426508803e-11, residual +8.9179542650880303e-13, ratio 1.0133616323286158.
Inverse Omega_G=9.4240789224029936e-40; G-only conditional u=2.1179926559496113e-44.
No source uncertainties for ell,m0,Omega: NO legitimate sigma significance from G alone.
Previously recovered mass-free product G*hbar=c^3*ell^2*B*Omega yields closure 0.54984814669998774, not 1.
These are calibrated comparisons, NOT independent SAT predictions.

## Additional type gate
The archived E_torsion=sum_i (kappa/2)|H_i''|^2 > lambda_s lacks an arclength integral. For kappa [J*m], H'' [1/m], left has [J/m]; quartic-radius potential coefficient lambda_s has [J/m^5]. Without a separately defined barrier energy the inequality is not homogeneous. Correction unresolved.

## Provenance and execution
HsH GRQM blob 33785afb8d46804122d79056b952169f99b325e2; 3899 lines.
HsH source conversation blob 5a5309f7afbfa97356131ab4e7f069b926571689; 3205 lines.
SAT SAT_CONCEPTS__May2026.txt blob 47660297bec8e95c1d2e3e9a727cec63793d14b5; 38 lines.
SAT THE_WHIRLIGIG.txt blob e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057; 741 lines.
Current BEDROCK blob c2dde0448485152ecbb3a63a9deaa30c5a1c46f8, 511 lines; state blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines.
Full files retrieved; selected passages read, not all lines. Original speaker/date attribution unresolved.
Real Python secrets.choice bounded draw: SAT THE_WHIRLIGIG and HsH GRQM.
Completed three-repository Mersearch manifest inspected (Orson request 2026-10-21-orson-nlm-big-haul-math-001); no new query, no request overwrite. Direct search preceded Mersearch inspection this turn, a logged process deviation.
Executed source: calculate.py, stdout.txt, results.json, Class P figures locally preserved for manual archiving. Lean NOT executed.

GATES: VOLUME_ALGEBRA_PASS; PACKING_n<=3_NOT_DERIVED; OMEGA_ALPHA_UNDERIVED; OMEGA_SOLAR_FITTED; CODATA_CONDITIONAL; TORSION_BARRIER_UNRESOLVED; NO_BEDROCK_PROMOTION.

Handoff: recover the already-operative torsional energy/barrier and independent alpha geometry, preserving 3D versus 4D types.
