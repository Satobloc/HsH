# Mercer sandbox — fold-lock backreaction law

**Status:** SANDBOX / noncanonical  
**Date:** 2026-10-02

## Sources actually read

1. `SAT_THEORY_ARCHIVE_2023-25/SAT TIMELINE.txt`, lines 1–500. Read the Fundamental Intuitions through the historical/version material. Relevant old construction: particle = wavefront/worldline intersection; bidirectional energy transfer; filament interaction exerts force back on the time surface; aggregate back-transmission produces time-surface curvature; mass is associated with intersection misalignment; filaments/time surface have finite tension/flexibility.
2. `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, read in full. Frozen local geometry: asymmetric finite core with one-sided supports rho_+, rho_-, quadratic signed-distance q(s)=alpha s + K s^2/2, threshold |alpha|_c=sqrt(2 K rho_+), exact contact measure, unique maximum at the fold.

No PRIOR_ART was used.

## Independent translation

Take old SAT's force-back statement literally only as a constitutive hypothesis: H(s)H finite worldtubes exchange energy with a resolving medium in proportion to their finite contact measure. Let gamma be an effective contact energy per unit carrier parameter length. A minimal attractive/locking interaction is

U_int(alpha) = -gamma |C_s(alpha)|.

With Lambda=|alpha|/sqrt(K rho_+), eta=rho_-/rho_+,

|C_s| = sqrt(rho_+/K) m(Lambda;eta),

where Run 110 gives

m = 2 sqrt(Lambda^2+2 eta), Lambda <= sqrt(2),

m = 2[sqrt(Lambda^2+2 eta)-sqrt(Lambda^2-2)], Lambda >= sqrt(2).

Thus the geometry itself makes the fold the maximum-contact / minimum-energy state.

## New result: square-root lock and divergent differential stiffness

Let Lambda_c=sqrt(2), delta=Lambda-Lambda_c > 0. Immediately above the fold,

m_c - m = 2 sqrt(2 sqrt(2)) delta^(1/2) + O(delta).

Therefore

U_int-U_c =
2 gamma sqrt(rho_+/K) sqrt(2 sqrt(2)) delta^(1/2)+O(delta).

Because delta=(|alpha|-|alpha|_c)/sqrt(K rho_+),

U_int-U_c ~ A (|alpha|-|alpha|_c)^(1/2),

with a calculable coefficient A from gamma,K,rho_+.

Hence the generalized restoring load conjugate to incidence,

Q_alpha = -dU_int/d|alpha|,

has the one-sided fold scaling

|Q_alpha| proportional to (|alpha|-|alpha|_c)^(-1/2).

This is not inserted as a special force law; it follows from finite-core contact geometry plus the minimal contact-energy constitutive assumption.

A scripted log-log regression over delta=1e-10...1e-3 for eta=0.6 gave exponent 0.499974 for m_c-m, against the analytic 1/2. The fitted leading coefficient was 3.361 versus analytic 2 sqrt(2 sqrt(2)) = 3.3636.

## SAT -> H(s)H implication

Old SAT says microscopic filament/time-surface exchange back-reacts into curvature. This local H(s)H construction supplies a candidate microscopic nonlinearity: finite-core incidence has a geometric fold at which contact, and therefore any contact-mediated backreaction, is extremized.

At dilute/coarse scales, an ensemble with number density n and orientation/incidence distribution f(alpha,K,rho_+,rho_-) has contact-energy density

W = -n gamma <|C_s|>_f.

A medium strain e that shifts alpha by alpha(e) then receives stress

sigma_e = dW/de
        = -n gamma < (d|C_s|/d alpha)(d alpha/de) >.

Thus a smooth distribution far from the fold gives an ordinary approximately linear constitutive response, while a population accumulating near the fold gives a strongly nonlinear susceptibility. This offers a concrete way for one microscopic contact grammar to have two regimes:

- **far from fold:** weak, smooth, coarse-grainable response;
- **near fold:** lock/snap regime with large susceptibility and likely need for nonlinear regularization.

That is a possible bridge between smooth gravity-like strain response and discrete/local interbraid locking without assigning either identity yet.

## Tight discriminator

Numerically sweep explicit asymmetric finite cross-sections while coupling incidence to a compliant medium coordinate e:

E_tot(e)= (Y/2)e^2 - gamma |C_s(alpha_0 + beta e)|.

Measure equilibrium e and small-signal stiffness versus alpha_0. The local model predicts the fold location from geometry alone,

|alpha|_c=sqrt(2 K rho_+),

and a pre-regularization square-root cusp with differential response exponent -1/2 on the split-contact side.

Then add finite medium correlation length or higher-order contact geometry. A viable constitutive completion should round the divergence while retaining convergence toward the 1/2 fold exponent as the regularizer is reduced.

## Failure conditions

This branch fails if:
- direct numerical finite-core contact does not reproduce the 1/2 fold exponent;
- realistic cross-section/support geometry removes the fold generically rather than perturbing it;
- backreaction energy is not monotone in contact measure even locally;
- coarse-grained stress is dominated by unrelated terms so strongly that the fold leaves no identifiable constitutive signature;
- regularization shifts the threshold by order unity with no controlled limit.

No historical SAT constants or particle labels were targeted or fitted.
