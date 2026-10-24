# Elias Kern | SAT clock law consistency and physical-scale audit | 2026-10-23 21:24 EDT

STATUS: HISTORICAL_CLOCK_LAWS_CONDITIONALLY_INCOMPATIBLE / MATHEMATICAL_CHECK_PASS / CURRENT_HSH_READOUT_UNDERIVED / CODATA_REFERENCE_ONLY. SANDBOXED, not a candidate or BEDROCK.

PRIMARY SOURCES: SAT_THEORY_ARCHIVE_2023-25/PREDICTIONS/CLOCK SHIFT PREDICTION PROTOCOL.txt, internally dated 2025-06-03, blob 142b7bcc3420bc25f2147ecebe90ef5b67c0d0dc; SAT XY/SATx-y INSIGHTS.txt, blob dc693ab75fe384d6ff528ab485ab8f5656a2a059. HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CLOCK SHIFT PREDICTION PROTOCOL.txt is the identical historical blob, not independent support. Later HsH Orson finite-core deformation clock sandbox, blob 2da61568aee199a194945d3c3626053c628360f5, explicitly concerns internal deformation history, not universal proper time. Current BEDROCK blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, BR-005 vacuum angle zero; no operative finite-core atomic-clock readout identified.

The June memo posits kappa(r)=sin^2(theta4(r)), gives kappa_ground=0.980, kappa_400km=0.981, kappa_20200km=0.995, and describes both (A) a local proper-time multiplier and (B) a gravitational redshift multiplier Delta f/f=kappa DeltaPhi/c^2. These are not the same operational law. The A3 historical click-rate law also contains eta and f(psi); no cancellation or equivalence has been derived.

CONDITIONAL A: If physical stationary clock rate q(r)=kappa(r)L(r), L=sqrt(1-2GM/(c^2 r)), then q_b/q_a=(kappa_b/kappa_a)(L_b/L_a). CONDITIONAL B: If instead d ln q=kappa d ln L, then ln(q_b/q_a)=integral kappa d ln L. For constant kappa, A leaves the relative gravitational redshift unchanged, while B scales its logarithm. For variable kappa, they differ generally.

Exact compatibility theorem: requiring both gives d ln kappa/d ln L=kappa-1, hence kappa(L)=1/(1-C L). With asymptotic normalization L(infinity)=kappa(infinity)=1, C=0 and kappa=1 everywhere. SymPy verified the ODE and boundary algebra. This is conditional on both operational interpretations, not a no-go for current HsH.

EXECUTED PHYSICAL-SCALE CONTROLS: GM_Earth=3.98600435507e14 m^3/s^2, WGS84 equatorial radius 6378137 m, exact c=299792458 m/s. Schwarzschild stationary clock controls only; not GPS/ISS moving-clock predictions. Decimal 65-digit and independent SciPy quadrature:

400 km: GR lapse difference 4.103478562178e-11; conditional A difference 1.020408204342e-3 (88.163268855 seconds/day); conditional B difference 4.023419135483e-11 (linear kappa interpolation).
20200 km: GR lapse difference 5.284809703341e-10; conditional A difference 1.530612298555e-2 (1322.449025951 seconds/day); conditional B difference 5.201086319837e-10 (linear kappa interpolation).
10 km illustrative linear interpolation only: GR 1.088499662404e-12; A 2.551020517016e-5 (2.204081727 seconds/day). The 10 km kappa is not an archived independent value.

The original Axiom Z3 literal proper-time factor includes div(u), which has inverse-length units, so the multiplier is dimensionally incomplete without a derived scale. Existing Morrow work found div(u)=0 for the specific historical static Schwarzschild observer; this is not an independent finding of this packet. No arbitrary normalization or additional field was introduced.

PLANCK NATIVE: dimensionless potential u=GM/(c^2 r) and lapse L=sqrt(1-2u) used; SI for external controls. CODATA 2022 h=6.62607015e-34 J s exact, c=299792458 m/s exact, G=6.67430(15)e-11 m^3 kg^-1 s^-2, u(G)=1.5e-15. Inputs only, residual zero by construction, NOT independent predictions; clock ratio is not a CODATA recommended constant. GATE: MATHEMATICAL_CONSISTENCY_CHECK_PASS / HISTORICAL_OPERATIVE_EQUIVALENCE_FAIL / CURRENT_HSH_NOT_A_CANDIDATE / CODATA_INDEPENDENT_PREDICTION_UNAVAILABLE.

READING: BEDROCK 548 lines fetched complete, subordinate STATE_OF_THE_THEORY 155 lines fetched complete, governing portions inspected; no claim of line-by-line full read. Actual Python secrets.choice historical selections: SAT XYZ/SAT CONNECTIONS.txt (blob fc8bab5fd82bfc78d0c88991042d0fb955843b94, 171 lines fetched) and HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/BOSONIC TIME AND TWO GRAVITIES.txt (blob bbc868efd38c38ba4710f82da1246f60d053aaa2, 1204 lines fetched). Selected clock/lensing and phase-frequency passages examined. Shared Mersearch request occupied by Orson, not changed; bounded GitHub connector search used, no new Mersearch execution. No Lean execution.

NEXT: derive emitter/receiver frequency readout from finite-core worldtube phase, metric proper time, and apparatus calibration, then propagate the SAME law to satellite clocks, photon propagation, and orbital dynamics. No BEDROCK, Contents, Mersearch request or recurrence edits.
