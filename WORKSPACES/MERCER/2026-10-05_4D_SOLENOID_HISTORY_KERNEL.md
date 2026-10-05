# Mercer sandbox checkpoint — 4D solenoid history kernel

## Sources read
- SAT_THEORY_ARCHIVE_2023-25/SAT_CONCEPTS__May2026.txt, lines 1–900 requested and returned through the cosmology section. Used only the structural claims: 4D filaments, timesheet, braid/solenoid interaction, and historical-tension idea. Historical constants, lattice claims, particle fits and labels were not used.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT WEIRD IDEAS — Solenoidbit.txt, lines 1–900 requested and returned through the repeated 4D-chip/holonomic-envelope discussion. Used the proposed time-extended nested-solenoid picture and the question whether past turns can couple to the present. Brain/consciousness and particle identifications were not used.

## New sandbox construction
Represent repeated traversal of a spatial circuit as turns separated along the metricized time direction by p=cT. For two nearby history bundles separated spatially by d, assign a generic finite-coherence 4D mutual kernel

K(R)=K0 exp(-R/lambda)/R,  R_n=sqrt(d^2+(np)^2).

Then the present-turn historical coupling from N retained turns is

H_N = K0 sum_{n=0}^{N-1} exp(-sqrt(d^2+n^2p^2)/lambda)/sqrt(d^2+n^2p^2).

This is not claimed as the H(s)H kernel; it is a discriminator for any literal historical-coupling proposal.

For n p >> d, the tail behaves as exp(-np/lambda)/(np), hence converges for finite lambda. Effective memory depth is of order lambda/p=lambda/(cT) turns. In the unscreened lambda->infinity limit, H_N ~ (K0/p) log N, so an eternal 4D history generically produces secular logarithmic growth rather than a stationary constitutive response.

## Numerical fixture
For d=1, p=0.8, lambda=6, K0=1:
H_1=0.84648, H_10=2.65781, H_30=2.82848, H_100=2.83357; the 99->100 increment is 2.33e-8.

## Consequence
A literal past-worldline force needs one of:
1. finite coherence/screening in 4D history,
2. alternating/phase-canceling signed contributions,
3. derivative coupling that makes old straight segments cancel,
4. or a reformulation in which history is encoded only in current local state variables/holonomy.

Otherwise ordinary repeated currents or long-lived matter should acquire interaction strength approximately logarithmically with age/history length.

## Tight test
For a periodic source of period T, vary T while holding present geometry fixed. A screened-history law predicts the number of dynamically relevant turns N_mem ~ lambda/(cT), while the physical lookback length c T N_mem ~ lambda stays constant. Collapse the measured history response against N p/lambda. Failure of this collapse rejects the one-length exponential kernel.

## Failure condition
If a first-principles H(s)H Green function has an unscreened positive 1/R-like historical tail and no exact cancellation, stationary macroscopic behavior is endangered by secular accumulation. Historical tension cannot then be a literal additive force from all past turns.
