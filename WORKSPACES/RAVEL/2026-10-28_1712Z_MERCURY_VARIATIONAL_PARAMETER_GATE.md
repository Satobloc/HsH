# Ravel :12 | Mercury measured-orbit variational parameter gate | 2026-10-28 17:12 UTC

**Run:** REVROT3-19-20261011:425:s1. Selected Ravel (17), successor Orson Vay (18). **Status:** EXECUTED REAL-SYSTEM KEPLER CONTROL / CONDITIONAL SOURCE-DEFINITION GATE; NOT a SAT prediction, physical validation, original Ravel-thread participation, or BEDROCK promotion.

## Original mathematical source and provenance

- Historical original: Satobloc/SAT_THEORY_ARCHIVE_2023-25, `HsH SAT 2026 ROUNDUP/SAT PARTICLE LAGRANGIAN.txt`, Git blob `199618ae856702bb942a48328de59232487555c2` (122,391 characters; opening construction/action sections read, NOT complete line-by-line audit). The document explicitly says TENTATIVE and its signed March 13, 2026 note distinguishes Nathan's conceptual guidance from largely LLM-written formal prose. It writes `S=int_0^L [(T/2)|X'(s)|^2+(kappa/2)|X''(s)|^2] ds` and calls `s` a path parameter. The **equation's original Nathan authorship is not verified**.
- Later formalism: HsH `synthesis/FORMALISM_SELECTION.md`, Git blob `4761319f195c07ad21442bf43dcb230a8059c8bd`, explicitly uses an **arclength-parametrized** curve in R4 with SO(4) moving frame, distinguishing gauge rotation from material twist. This is a plausible clarification, not physical proof.
- Incoming Mercer source identity audit: handoff `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-28T1700Z_from_s0_to_s1_ravel.md`, blob `3e44ed26de56c3acde30156af072fecb77da80c7`, read. Its PR #917 proves conditional unlabeled-section/labeled-continuation distinctions; this is a different information-loss gate.

## Real-world measured/fitted inputs, units and uncertainty

**Physical system:** Mercury's observed heliocentric orbit, represented by a standard Keplerian two-body *kinematic control*, not an asserted H(s)H worldtube.

- NASA/JPL Solar System Dynamics [Approximate Positions of the Planets](https://ssd.jpl.nasa.gov/planets/approx_pos.html), Table 1, J2000, fitted approximation valid 1800-2050: `a=0.38709927 AU`, `e=0.20563593`. JPL states the elements are fitted, not raw tracking data, and reports Mercury nominal position-model errors 15 arcsec longitude, 1 arcsec latitude, 1000 km radial. These are **not** a covariance matrix for a/e.
- NASA/NSSDC [Mercury Fact Sheet](https://nssdc.gsfc.nasa.gov/planetary/factsheet/mercuryfact.html): period `87.969 days`, semimajor axis `57.909 million km`, eccentricity `0.2056`, maximum orbital speed `58.97 km/s`, minimum `38.86 km/s`. NASA orbital summaries are correlated with the same standard ephemeris, not held-out independent measurements.
- `1 AU=149597870700 m` and `1 day=86400 s` are definitions. No observational standard errors are given for these orbital elements; last-digit *print-rounding* bounds below are **not** 1-sigma errors.

## Geometry -> equation and inverse map

Use the observed ellipse's Keplerian approximation `X(E)=(a(cos E-e),a sqrt(1-e^2) sin E,0,0)`, where the zero coordinates are a mathematical 4D embedding **without additional physical-field assumptions**. The same trace has two natural normalized parameters on [0,1]: `u=t/P` (Kepler `2pi u=E-e sin E`) and `v=arclength/L`.

Define `J[q]=int_0^1 |dX/dq|^2 dq` (units m^2), only a *kinematic diagnostic* until a physically dimensioned coefficient and parameter are specified. For Keplerian time `J_time=(2pi a)^2`; for normalized arclength `J_arc=L^2`, `L=4a E(e^2)` with complete elliptic integral E (parameter m=e^2).

**Actual executed Python/SciPy results** (source JPL a,e and NASA P):

| Quantity | Result |
|---|---:|
| a | 57,909,226,541.52439 m |
| period | 7,600,521.6 s |
| ellipse perimeter L | 359,976,854,550.08704 m |
| J_time | 1.3239002538601686e23 m^2 |
| J_arc | 1.2958333581177452e23 m^2 |
| **J_time/J_arc** | **1.0216593403515957** |
| **difference** | **+2.165934035159567%** |

Independent numerical quadrature of the eccentric-anomaly integrand reproduces J_time to floating-point precision. The geometry -> action map is therefore **not unique without a parameter convention**. An action scalar alone also cannot reconstruct the geometric trace or time history. Fixing arclength removes this particular ambiguity. If historical `s in [0,L]` already means arclength, the finding is a *presentation ambiguity*, not an error in the intended model.

Using NASA's **own rounded** a,e,P, the Kepler formula returns perihelion `58.9745367416 km/s` and aphelion `38.8597976008 km/s`, versus tabulated 58.97 and 38.86. Differences `+0.00454` and `-0.00020 km/s` are consistent with 0.01 km/s printing. This is a **correlated standard-physics consistency check, NOT an independent SAT prediction**. Conservative NASA print-rounding envelopes: perihelion [58.97061,58.97846] km/s, aphelion [38.85721,38.86238] km/s, ratio [1.02164080,1.02166238]. Missing ephemeris covariance prevents an observational confidence interval.

## Accuracy / precision / fidelity and next review

- **Accuracy:** Kepler integral independently quadrature-checked; NASA speed table consistency passed. No H(s)H physical comparison or fit.
- **Precision:** computed digits reflect numerical evaluation, NOT observational certainty. JPL model error and missing covariance remain explicit.
- **Fidelity:** tentative, mostly LLM-written source action versus later explicit arclength. The historical action's `s` cannot silently be read as physical time. Proposed typed arclength functional `int [tau+(kappa/2)|d^2X/dell^2|^2] dell` is an **assistant conditional repair**, not Nathan Direct or a validated constitutive law.
- **Lean:** Draft PR #920 targets existing `infra/lean4-verification-20261023` base. Four conditional algebra/inequality lemmas; compilation status requires **actual CI readback**. The full Kepler integral is NOT formalized in Lean.
- **Hostile check:** Is s already arclength? Are material coefficients, 4D normal-bundle cross-section, contact boundary conditions and timesheet response independently specified? **No**. Mercury is not a measured filament. Do not infer a force, finite-core parameter, or SAT prediction.
- **Campaign:** Nov 9 Orson cognition P1, Nov 30 measured-system P2, Dec 14 P3 source genealogy remain OPEN review, source, LaTeX and PDF/reader gates. This provides a P2/P3 mathematical typing control only.
- **Search:** Mersearch guide consulted; shared request lane occupied by Indicatrix, not overwritten. Bounded three-repo GitHub search and direct original blob retrieval, not a full Mersearch run. FIE reread Oct 27 (<14 days); unrelated reading next cursor TheTANGLE.txt line 716.

**Reproducibility:** executed script `mercury_variational_parameter_audit.py`, JSON output and full report preserved in current run's local artifact bundle. PR #920 contains Lean source. No scheduler changes, extra recurrence, signet, promotion, or original-thread delivery.


## Additive full-source dimensional reconnaissance (post-initial publication)

The **complete 122,391-character original SAT composite** was subsequently scanned for `arclength`, `arc length`, `unit-speed`, `path parameter`, and related formulas. **No literal arclength or unit-speed definition was found** (a bounded string search, not proof that the author never intended one). The text repeatedly calls `s` a *path parameter* and writes `s in [0,L]`.

A second **within-document notation discrepancy** was recovered. Near original character offset ~92,810 the source correctly writes angle progression as `theta(s)=2*pi*n*s/L`, dimensionally compatible with length-valued `s` and dimensionless winding count `n`. Near offset ~95,005 it instead writes `theta_i(s)=n_i*s+phi_i` while calling `n_i` winding numbers. The latter is dimensionally valid only if `s` is dimensionless or `n_i` has inverse-length units, neither stated in that passage. Earlier opening superhelix expressions also use `n_i*s`. This is **notation/normalization drift inside a tentative LLM-era composite**, not a Nathan Direct mistake or a falsified physical prediction. Source Git blob remains `199618ae856702bb942a48328de59232487555c2`.

**Action:** any extracted equation must carry a typed `parameter_kind` (arclength, normalized phase, proper time, coordinate time, unspecified) and `winding_units` field before comparing actions or importing it into a paper. Do not silently repair missing factors of `2*pi/L`.
