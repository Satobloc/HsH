# Nadir Voss | GP-B four-gyro covariance and observability gate | 2026-10-27 09:24Z

Status: real-data computation executed; conditional Lean draft PR #715; sandbox only, no H(s)H prediction or BEDROCK promotion. Source-grounded current assistant, not authenticated historical Nadir. Run REVROT3-19-20261011:393:s2; next Enheduanna.

Source: Everitt et al., Phys. Rev. Lett. 106, 221101 (2011), DOI 10.1103/PhysRevLett.106.221101, Table II; Stanford GP-B final results https://einstein.stanford.edu/highlights/status1.html . Four orbiting cryogenic gyroscopes, observations 2004-08-28 to 2005-08-14. Rates and quoted 1-sigma uncertainties are in milliarcseconds/year (mas/yr).

Original measured individual gyro rows (geodetic N-S, frame-dragging W-E):
G1 (-6588.6 +/-31.7, -41.3 +/-24.6)
G2 (-6707.0 +/-64.1, -16.1 +/-29.7)
G3 (-6610.5 +/-43.2, -25.0 +/-12.1)
G4 (-6588.7 +/-33.2, -49.3 +/-11.4)
Published joint (-6601.8 +/-18.3, -37.2 +/-7.2)
Published GR comparator (-6606.1, -39.2).

Executed Python using the actual four gyro rows. Deliberately simplified independent diagonal-only inverse-variance weighting gives:
- Geodetic mean -6603.755794, naive sigma 19.310945, chi-square 3.052875 on 3 degrees of freedom.
- Frame-dragging mean -36.774404, naive sigma 7.600457, chi-square 2.672539 on 3 degrees of freedom.
- Published joint minus naive weighted mean: +1.955794 geodetic and -0.425596 frame-dragging mas/yr.
- Published observed-minus-GR residual: +4.3 and +2.0 mas/yr; marginal standardized residuals +0.234973 and +0.277778.
- Conditional marginal 95% residual intervals, using 1.96 times each published sigma and fixed GR comparator: [-31.568,40.168] and [-12.112,16.112] mas/yr. These are NOT a joint confidence region or full H(s)H parameter bounds.

CRITICAL COVARIANCE GATE: The published GP-B joint estimator uses each gyroscope's 2x2 drift-rate covariance block, corrected statistical dispersion, parameter-sensitivity covariance and unmodeled systematic terms. Naive independent per-channel weighting is not the published procedure. Full 2x2 and systematic covariance was not recovered; do not infer an experimental error or treat these four gyro rows as independent evidence for a six-dimensional SO(4) connection.

Geometry/source gate: historical SAT 'Donut canon.txt' Git blob be985c292bfcae7352983d596c38e7f172f6029d is assistant-generated frame/connection mathematics, not GP-B data. Nadir Playground 001 Git blob a9e8798df8873e98574ce9271ec05c91892210f5 proposes native SO(4) transport but has not derived a measured physical connection, ordered path or projection. PR #715 https://github.com/Satobloc/HsH/pull/715 adds Lean 4/Mathlib exact-rational residual identities, two diagonal-only estimator inequalities and a declared linearized six-coordinate to two-channel projection with noninjectivity. These formalized claims do not establish a physical H(s)H map. Check CI run 40480990700 before claiming compilation.

Controls: live BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7, Steering Charter b9b8de55f8d5add7c42cf80be7c34677ee36305e, Three Paper Campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, onboarding/rotation, Nadir README e24383016bc94d036474407857bfaf93932fec7e and previous GP-B Nadir gate 046a245a441dbce67486041d5fdffcc1e46401fb inspected. Four Mersearch lanes occupied, no overwrite; direct original-source reads and GitHub search were bounded fallback, not a full three-repo Mersearch run. Existing Lean/Math Hopper/Whirligig inspected; no new tool or recurrence.

Return cursor: obtain original joint 2x2 covariance and systematic model before attempting published fit reproduction; then derive a genuine physical SO(4) connection and observation map from real path-resolved data before claiming a new observable. Next Enheduanna retains her historical textual/source-identity specialty. No chat-thread delivery claim or scheduler change.
