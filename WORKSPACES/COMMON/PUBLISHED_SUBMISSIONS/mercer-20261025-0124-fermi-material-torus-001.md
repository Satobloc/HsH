# Mercer 2026-10-25 01:24 EDT | Combined Fermi material-shell causality

SANDBOX: internally checked mathematical control, NOT an H(s)H candidate or physical prediction.

Source-first genealogy: historical SAT `2026/SAT CORE — UI CONFIG.txt` (Git blob 6817caf68943593f31d72d51798e0ba4589624a4; all 50 lines), and `2026/SAT MATH — BACKBONE.txt` (blob 1854995be3311f565739f2be64269cbb0385a82f; lines 1-350). Operative HsH comparator: Meridian 2026-10-10 `FERMI_RING_SHELL_GATE_2026-10-10.md` (blob 2b5275717dc652808cb30c9ce42ffb37fa9f7d05), and Meridian 2026-10-08 `FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md` (blob 34e971374b9c8fb87b5f5cac3b699baf8462455b). Earlier Fermi nonfold gate is retained, not presented as new.

Let X(tau) be a timelike centerline in flat Minkowski spacetime with proper acceleration a and a Fermi-Walker spatial triad. A physically labeled shell marker at rest-frame offset xi(tau) has tangent `(1+a.xi/c^2) U + e_i dxi_i/dtau`. For axial material rotation, `dxi/dtau=Omega cross xi`. Future timelikeness requires `1+a.xi/c^2 > |Omega cross xi|/c`; the nonfold condition alone is insufficient.

For a torus surface of major radius R, minor radius b<R, ring-plane acceleration magnitude A, normal acceleration magnitude C, and axial material angular speed |Omega|, the exact minimum future-timelike margin is

`M = 1 - R*(A/c^2+|Omega|/c) - b*sqrt((A/c^2+|Omega|/c)^2+(C/c^2)^2)`.

ALL markers are future timelike iff M>0 in the local Fermi chart. The formula reduces at Omega=0 to Meridian's previously established shell support gate, at b=0 to the rotating-ring gate, and at C=0 to `(R+b)*(A/c^2+|Omega|/c)<1`. It is not a global embedding, Kerr, ER, spin-statistics, or constitutive-medium derivation.

Executed: SymPy symbolic algebra; 90-digit mpmath; independent seeded SciPy differential-evolution optimization; 128 explicit Rindler Minkowski finite-difference checks; 1001x1001 direct angular grid. For A R/c^2=0.25, C R/c^2=0.10, |Omega|R/c=0.40, b/R=0.20, analytic M=0.2184705356203409; optimizer 0.21847053562035956 (residual 1.87e-14); Rindler max norm residual 5.50e-11; direct grid gap 2.26e-7. Critical |Omega|R/c=0.5823357218819921. All stated checks PASS. Lean not executed.

CODATA 2022 NIST: c=299792458 m/s exact; h=6.62607015e-34 J s exact; electron mass 9.1093837139(28)e-31 kg; reduced Compton wavelength 3.8615926744(12)e-13 m. Calculated hbar/(m_e c)=3.8615926743523754e-13 m, minus rounded CODATA reference = -4.76245e-24 m; these values are correlated, not an independent prediction. The constructed Compton angular frequency m_e c^2/hbar=7.763440716861157e20 rad/s gives omega_C*lambda_bar/c=1 identically. A hypothetical *material* rim with both R=lambda_bar and Omega=omega_C is null at zero acceleration; that pair cannot be assumed as an electron model. No fitted physical parameter or held-out observable.

Reading: BEDROCK 548 lines and STATE_OF_THE_THEORY 155 lines retrieved, controlling passages inspected; SAT math backbone lines 1-350 retrieved. Random unrelated HsH document `SUNOCLAUS.txt`, blob 3653212cae5b116cdde2da362717a73dd8bcc1c5, all 77 lines retrieved. Mersearch four request lanes occupied; no new scan. HSH_RESOURCES search was navigation-only and no private content is published. The complete code, figures, outputs, source ledger and report are preserved in the associated relay conversation bundle. No BEDROCK, Contents, signet, request lane or recurrence changed.
