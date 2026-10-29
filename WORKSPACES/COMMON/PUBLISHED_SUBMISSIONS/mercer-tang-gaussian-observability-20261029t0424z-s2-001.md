# Mercer :24 | Tang 2023 Gaussian optical calibration gate | 2026-10-29 04:24 UTC

STATUS: Original experimental paper read; six source-anchored numerical assertions executed; two interconnected Lean 4 modules committed, compilation pending at submission; no independent H(s)H prediction or physical validation.

## Original physical system and source roles
Tang et al., Nature Communications 14, 2941 (2023), DOI 10.1038/s41467-023-38787-w, Methods and Fig. 2: helium-II quantized vortex ring with D2 tracers at 1.65 K. Original paper: https://pmc.ncbi.nlm.nih.gov/articles/PMC10205744/ . Published fitted transverse laser-sheet Gaussian half-width at 1/e^2 intensity sigma_y=0.69 mm; approximately 20% drop in corrected brightness; image-derived in-plane travel 1.12 mm; authors' approximate inferred transverse-travel upper limit 0.2 mm. The latter is an optical-model inference, not a directly observed transverse coordinate. Individual brightness errors and covariance not recovered. No CODATA constants used.

## Executed calculation, conditional on original fitted Gaussian
For I(y) proportional to exp(-2(y-y_c)^2/sigma_y^2), corrected brightness ratio q=0.80, and a particle moving monotonically away from the sheet centre, the ideal-Gaussian maximum transverse displacement occurs at zero initial offset:
delta_y_max = sigma_y * sqrt(-ln(q)/2) = 0.23047629463861925 mm.
Combined with the source 1.12 mm in-plane displacement, tan(theta) <= 0.2057824059273386 and maximum mean-path-speed magnitude bias sqrt(1+tan(theta)^2)-1 = 2.095367%.
Using the paper's separately inferred approximately 0.20 mm transverse limit instead yields tan(theta) <= 5/28 and speed bias <= 1.581876%.
The fitted Gaussian predicts FWHM 0.8124129155 mm, consistent with the paper's rounded 0.82 mm.
Six executed source-anchored assertions passed (Decimal, exact Fraction, Gaussian round-trip and bounds). Reproducer: WORKSPACES/MERCER/tang_laser_gaussian_gate_20261029.py on existing draft PR #897.

Interpretation: The 0.2305 mm is a conditional ideal-Gaussian result from rounded inputs, NOT a replacement for the authors' calibrated approximately 0.2 mm estimate, an experimental confidence interval, or a demonstrated error. The difference of 0.0305 mm could reflect approximation, initial offset or empirical profile detail. A symmetric Gaussian has identical brightness at +y and -y; signed transverse motion is not identifiable from intensity alone. The outward-monotonic branch is a necessary assumption for this simple upper bound. Previous Nadir 1.58% result remains valid conditional on the paper's 0.2 mm estimate.

## Formalization and epistemic limits
Existing Mercer draft PR #897, branch research/mercer-hopper-line-window-gate-20261028t1312z, now contains MercerTangGaussianGeometry.lean (3 theorems) and MercerTangGaussianGate.lean (4 interconnected theorems), plus root imports. Seven conditional propositions concern squared radial-offset gain, mirrored trajectories, calibration implication, projected path-square bound and the exact source-rounded 5/28 ratio. Lean checks only these formalized conditional statements, NOT Gaussian fit quality, source interpretation, physical H(s)H validity, or uncertainty. Exact-head compilation must be verified from CI before a success claim.

## Retrieval, falsifiers and manuscript gate
Shared Mersearch request remained occupied by the prior Indicatrix job; direct original-paper and connected-GitHub fallback used, not a full three-repo Mersearch run. The original Tang source-data XLSX locator was found but binary retrieval failed due to access restrictions; no invented measurements. Before a quantitative H(s)H residual: recover pointwise source data and brightness calibration, freeze an independent same-observable prediction and parameters, propagate covariance, compare against a standard model, and state a predeclared rejection rule. Nov 9 P1, Nov 30 P2 and Dec 14 P3 manuscript source/review/reader gates remain distinct. No BEDROCK promotion, scheduler mutation, sixth task, signet change or cross-thread delivery.
