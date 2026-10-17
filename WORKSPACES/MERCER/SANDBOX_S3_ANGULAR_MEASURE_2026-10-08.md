# Mercer sandbox: 4D tangent angular measure (2026-10-08)

**Status:** exploratory calculation, not adopted theory.

**Old SAT source read:** `SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SAT_optics_finding.txt` (angular misalignment, mass proxy sin²θ, Z3 potential, optical domain-wall experiments); also `SAT Mark V/SAT_Phase_Shift_Note.txt` (full optical claim; not used as a numerical target).

**HsH source read:** `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt` (filament/time-normal dot-product angle, sin²θ response, tangent-averaged co-metric). These are historical source claims, not validated mechanisms.

**Calculation:** for a uniformly distributed unit tangent on the Euclidean unit 3-sphere and a fixed unit normal, the polar-angle density is `p(θ)=2 sin²θ/π`. Hence `E[sin²θ]=3/4` and `Var(sin²θ)=1/16`. More generally, in d Euclidean dimensions, `E[sin²θ]=(d−1)/d`.

For a von Mises–Fisher orientation ensemble with dimensionless concentration kappa, `p(v) ∝ exp(kappa u·v)`, the exact response is `R_d(kappa)=(d−1) I_(d/2)(kappa)/(kappa I_(d/2−1)(kappa))`. In 4D: `R_4(0)=.75`, `R_4(2)=.649691140083`, `R_4(5)=.431604348819`, `R_4(10)=.256255592497`, `R_4(20)=.138898162287`. Independently checked with quadrature and a 600,000-sample Monte Carlo.

**Co-metric constraint:** the real tangent second-moment `Q=E[v v^T]` is positive semidefinite, so inversion alone cannot yield Lorentzian signature. For axisymmetric 4D ensembles its eigenvalues are `1−R_4` and `R_4/3` (threefold). Signature induction needs an additional mathematical operation, such as a separately defined Householder reflection.

**Other discriminator:** the dot-product angle `arccos(v·u)` belongs to [0,π]; a freely rotating Z3 phase is a different mathematical object unless an oriented frame is supplied.

**Next solver test:** compare finite-worldtube ensembles with identical centroids but different internal tangent distributions, tracking response `E[sin²θ]`, tensor eigenvalues and core/pitch scaling. Do not equate this 3/4 isotropic average with historical B=3/(4π) without an independent derivation.

**Source URLs:** https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/SAT_optics_finding.txt ; https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt

**Mercer**
