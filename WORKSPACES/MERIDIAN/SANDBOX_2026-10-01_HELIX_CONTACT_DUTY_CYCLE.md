# Meridian sandbox — helical phase/contact duty-cycle law

**Status:** SILOED PLAYGROUND / not canonical.

## Fresh source intake
- `SAT_THEORY_ARCHIVE_2023-25/SAT XYZ/SATy IfThen.txt` — substantially read the intersection-slice discussion: helical world-trace as a candidate particle/intersection geometry, questions about individual/composite filament contact with the time surface, and the explicit warning that these were exploratory branches rather than established dynamics. Historical particle labels/numerical claims were not used as targets.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md` — read in full. Used its bounded local contact model q(s)=alpha s +(K/2)s^2 and threshold |alpha|_c=sqrt(2 K rho_+).

No PRIOR_ART used.

## Independent construction
Take a circular helix centerline
z(s)=(a cos ks, a sin ks, b s)
and a purely transverse local sheet normal n=(cos phi,sin phi,0). At phase delta=ks-phi,
|alpha|=a k |sin delta|,
K_n=|n dot z''|=a k^2 |cos delta|.

Run 110's topology threshold therefore becomes
sin^2(delta) > 2 (rho_+/a) |cos(delta)|.

Let epsilon=rho_+/a. Writing x=|cos delta| gives
x^2+2 epsilon x-1<0,
so the bifurcated phase sector is
|cos delta| < x_c,
x_c=sqrt(1+epsilon^2)-epsilon.

For uniform phase sampling, the exact bifurcated duty fraction is
F(epsilon)=(2/pi) asin(sqrt(1+epsilon^2)-epsilon).

This is independent of k: winding density cancels between incidence and curvature in this local quadratic model. Thus the topology occupancy reads the dimensionless core/helix scale ratio rho_+/a rather than pitch frequency.

Numerical Monte Carlo/grid check (500,000 phases) matched the analytic fractions:
epsilon=.01: analytic .91011909, numeric .910116
epsilon=.1: .72024009 vs .720244
epsilon=.5: .42414120 vs .424140
epsilon=1: .27188667 vs .271884
epsilon=2: .15171761 vs .151716.

At epsilon=1/2, x_c=(sqrt(5)-1)/2, so the golden-ratio conjugate appears algebraically, not as a fitted target.

## H(s)H translation
A helical SAT map plus a finite H(s)H core yields a phase-dependent contact-topology gate. In the transverse fixture the gate's phase occupancy is a one-parameter invariant F(rho_+/a), while k controls how rapidly the gate is traversed, not the fraction of a cycle spent bifurcated.

Candidate grammar:
SAT helix (a,k,phase) -> local (alpha,K_n) -> finite-core ratio epsilon=rho_+/a -> contact-topology word.

## Failure conditions
The k-cancellation fails if the sheet normal has an axial component (b n_z adds an incidence bias), if finite-core support varies materially with phase/orientation, or if higher-order centerline terms invalidate Run 110's local quadratic contact model. These failures are useful because they isolate pitch, anisotropic-core, and nonlocal corrections.

## Next solver
Sweep general n=(n_perp cos phi,n_perp sin phi,n_z). Then
alpha=b n_z-a k n_perp sin delta,
K_n=a k^2 n_perp |cos delta|.
Measure topology duty cycle versus the two dimensionless controls rho_+/a and beta=(b n_z)/(a k n_perp). Test whether the biased duty-cycle curve can independently reconstruct core scale and axial pitch/normal tilt.
