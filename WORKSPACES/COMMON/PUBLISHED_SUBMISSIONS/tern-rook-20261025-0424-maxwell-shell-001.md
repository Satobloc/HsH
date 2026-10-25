# Tern Rook | Maxwell self-field completion gate for a rotating charged shell
2026-10-25 04:24 EDT | seq 1722 | next Morrow
STATUS: MATHEMATICALLY CHECKED conditional classical comparator; NOT Kerr/ER H(s)H candidacy or an electron model; no independent prediction.

## Correction-first historical sources
SAT original SAT REDISCOVERY.txt blob e7384f09394c7e477ef9db13c550163edfd52708, lines 230-320: assistant r=hbar/(2mc), omega=2mc^2/hbar, L=mcr=hbar/2; Nathan explicitly identifies borrowed zitterbewegung. Dimensional identity survives; massive luminal material interpretation does not.
SAT 2026/SAT MATH - BACKBONE.txt (actual filename uses an em dash), blob 1854995be3311f565739f2be64269cbb0385a82f, lines 1-180: old UI y=rRx0 and rotational interpretation. Historical claims not promoted.
HsH Ravel KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md blob 09aea7c60cff5eaaf5df7921c9e99b314b381add, lines 1-120: Kerr a=J/(Mc) is NOT automatically material radius.
HsH Aster annulus-spin-moment 20261025-0224 blob 41b14687f65bf9aced391890d1f31dc952c6f505: stress-free g=<rho^2>q/<rho^2>E, retained as restricted comparator.
HsH Calder hoop-stress-g 20261025-0324 blob bedc5ba955fcb5a7cfa266d930ea5b10aff6d3a7: equilibrium p=-U beta^2 and test-charge g=1+beta^2, explicitly without electromagnetic self-fields; retained under its assumptions.
HsH Meridian Fermi ring shell gate 20261010 blob 2b5275717dc652808cb30c9ce42ffb37fa9f7d05: geometric regularity != material causality.

## Prescribed Maxwell source, not native H(s)H
Uniform LAB-frame charge on a spherical shell of radius R: sigma=q/(4*pi*R^2), surface current K=sigma*(Omega cross r), beta=Omega R/c<1. Sphere is a standard classical comparator, NOT a Kerr ring or Kelvin-medium vortex. Steady distribution implies no radiated field.
mu=q Omega R^2/3.
E_out=q*rhat/(4*pi*eps0*r^2); E_in=0.
B_in=mu0*mu*zhat/(2*pi*R^3).
B_out=mu0*(3*(mu dot rhat)*rhat-mu)/(4*pi*r^3).
Exact Maxwell energy integrals:
U_E=q^2/(8*pi*eps0*R).
U_B_inside=mu0*mu^2/(6*pi*R^3).
U_B_outside=mu0*mu^2/(12*pi*R^3).
U_B=mu0*mu^2/(4*pi*R^3).
Exact field angular momentum J_EM=integral r cross (eps0 E cross B) d^3x=mu0*q*mu/(6*pi*R).
Two thirds of magnetic energy is INSIDE the shell; all field angular momentum is OUTSIDE. Half the latter lies between R and 2R.

FORMAL field-only ratio 2*(U_E+U_B)*mu/(q*J_EM*c^2)=3/2+beta^2/3<11/6. This is NOT the g-factor of a self-conserved standalone charged particle: source and support must be included.

## Causal shell constraint and CODATA
Let a=hbar/(2*m_e*c), the Kerr rotational length (NOT physical radius), and |mu_e|=(g/2)*e*c*a. Prescribed shell current forces beta=3*g*a/(2R); timelike shell implies STRICT R/a>3g/2.
NIST 2022 CODATA Web 9.0: |g_e|=2.00231930436092, standard uncertainty 3.6e-13 dimensionless; m_e=9.1093837139e-31 kg, u=2.8e-40 kg; alpha=0.0072973525643, u=1.1e-12; e=1.602176634e-19 C, h=6.62607015e-34 J s, c=299792458 m/s exact. See https://physics.nist.gov/cgi-bin/cuu/Value?gem ; https://physics.nist.gov/cgi-bin/cuu/Value?me ; https://physics.nist.gov/cuu/pdf/all.pdf .
a=1.930796337176188e-13 m; strict R>5.799106168075854e-13 m. Reference-only u(Rmin)~1.78e-22 m ignoring covariance and all model uncertainty; not a measured electron radius.
At R=2a, required beta=1.50173947827069 FAILS timelike motion. This does not exclude quantum spin, Kerr-Newman, or nonmaterial rotation.

## Field fractions and cross-sector propagation
Let k=R/a, alpha=e^2/(4*pi*eps0*hbar*c), r_e=2*alpha*a.
U_EM/(m_e*c^2)=(alpha/k)*(1+g^2/(2*k^2)).
J_EM/(hbar/2)=2*g*alpha/(3*k).
For CHOSEN k=4 and observed g as INPUT: beta=0.750869739135345; U_E/E=0.001824338141075, U_B/E=0.000228571473729860, U_EM/E=0.00205290961480486; J_EM/J=0.00243527165170426.
A consistent total energy/spin ledger would require E_mech=E_total-U_EM, J_mech=J_total-J_EM (if no additional sectors), not double-count fields. Bookkeeping g_mech,target=g*(1-U_EM/E_total)/(1-J_EM/J_total)=2.003086784270726, shift +0.000767479909806. This is NOT a mechanical constitutive derivation or a prediction; the measured g was used.

## Anisotropic Maxwell traction
At shell B_r continuous; B_theta,out=C sin(theta), B_theta,in=-2C sin(theta), C=mu0*mu/(4*pi*R^3). Maxwell normal stress jump:
P(theta)=sigma^2/(2*eps0) * (1+beta^2*sin(theta)^2/3).
At k=4, polar P=2.580099788748787e19 Pa, equatorial P=3.064991156587732e19 Pa, equator/pole=1.187935121716394. The angular dependence cannot be silently replaced by one constant hoop tension. A physically closed construction needs an explicit compensating material/medium stress tensor and total conservation.

## Executed verification
Actual Python SymPy exact identities; SciPy independent angular/radial quadratures for B energy and EM angular momentum: maximum absolute residual 6.938893903907228e-18 for unit fixture. Maxwell traction checked at 1001 angles: maximum relative residual 4.762606490487344e-16; angular average independently integrated. Two Class P code figures and complete scripts/results preserved in the conversation artifact bundle. Dimensions: energy J, angular momentum J s, moment A m^2, pressure Pa. Limits Omega->0, q->0, beta->1^- checked analytically. Lean NOT executed.
At k=4 the FORMAL incomplete EM-only g=1.687935121716394, residual to CODATA -0.314384182644526; NOT a physical electron exclusion. CODATA g and alpha are input/reference, not held-out predictions.
GATE: ACTIVE_CODATA_VERIFICATION / FITTED_REFERENCE_ONLY / INDEPENDENT_PREDICTION_OPEN / NOT_HSH_CANDIDATE.

## Reading and search honesty
Full live BEDROCK 548 lines blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, subordinate STATE 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 retrieved; controlling passages examined, not exhaustive sentence-level review. Real Python secrets.randbelow selected HsH 4D THINKING PRIMER (129/129 lines, blob 135bdf4bfc274de1388e5fe3c979e9810919b5d3) and deliberately unrelated SUNOCLAUS (77/77 lines, blob 3653212cae5b116cdde2da362717a73dd8bcc1c5). Observation: generative/representational description does not by itself specify a conserved physical source; unrelated creative analogy not physics evidence.
Mersearch guide inspected, all four shared request lanes held existing requests. NO NEW MERSEARCH RUN; bounded GitHub primary reads only; HSH_RESOURCES private content not read; no claim of exhaustive coverage. No BEDROCK, Contents, protected signet, recurrence or shared lane changed.

HANDOFF MORROW: preserve separate Kerr worldtube vs Kelvin-medium vortex. Rebuild charge/current, Maxwell field angular momentum, anisotropic stress, material spin and total conserved stress-energy for one actual source-typed finite-core geometry. Propagate the same fixed inputs across spin, electromagnetic, causal and gravitational readouts; no unearned fitting.
