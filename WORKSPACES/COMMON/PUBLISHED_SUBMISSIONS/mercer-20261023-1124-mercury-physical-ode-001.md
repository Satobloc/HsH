# Mercer | Mercury numerical orbit and historical SAT comparison | 2026-10-23

Status: standard-GR reference numerical simulation PASS; independent H(s)H prediction NOT ESTABLISHED.

Inputs: JPL DE440 GM_sun=1.32712440041279419e20 m3/s2; IMCCE Mercury a=57,909,083 km, e=0.20563, period=87.9693 days; exact SI c=299792458 m/s. Numerical SciPy DOP853 integration of Binet u=1/r equations, 28 perihelia, 2e-13 relative tolerance, half-step convergence.

Newton u''+u=GM/h2: +0.0000014472 arcsec/Julian century (numerical error, exact zero).
Schwarzschild u''+u=GM/h2+3GM*u2/c2: +42.9805637150 arcsec/century; leading analytic +42.9805535695; halved-step +42.9805621811.
Historical Plummer surrogate u''+u=(GM/h2)(1+ell2*u2)^(-3/2) at ell=1000 km: -0.2624133066 arcsec/century; analytic -0.2624147318.
At historical ell_f=0.793732 fm, Plummer-only precession is -1.65324033207693e-43 arcsec/century (70-digit precision). The Plummer contribution is retrograde, so it cannot by itself explain prograde Mercury relativity.

MESSENGER 2018 fit beta-1=(-1.6 +/- 1.8)e-5 (1 sigma), assuming a metric gravity theory and external gamma constraint. GR beta=1 gives residual -0.889 sigma. At gamma=1, this corresponds conditionally to 42.980793 +/- 0.000258 arcsec/century for the isolated leading relativistic component. MESSENGER total precession 575.3100 +/- 0.0015 arcsec/century cannot be directly compared to a Sun-only GR component without N-body, solar J2 and frame contributions.

CODATA 2022 G=6.67430(15)e-11 m3 kg-1 s-2 and exact c are input references, NOT independently predicted outputs. No H(s)H-specific effective solar metric or orbital readout was supplied, so no H(s)H empirical validation is claimed.

Historical SAT progress log ec1c19c8f14f010286340b245b4963e9529ec2b4 asserts 42.98 +/- 0.02 arcsec/century but admits full SAT static solar field equations were not solved. SAT static-Sun memo fcfb809a414e02009185158e8816783add6ce075 adopts Schwarzschild background. Legacy HsH ADFA 2be246e2db9d3ccbeafe747466f78bad113e95b1 proposes Plummer softening, not a current H(s)H law. Later H(s)H correction-first constraints govern; no substitution of legacy surrogate into current canon.

All numerical assertions and convergence checks passed. No Lean proof, no new Mersearch request, no BEDROCK, Contents or schedule changes. Full script, captured stdout, JSON, source/reading ledger and two Class P plots preserved in the conversation packet.
