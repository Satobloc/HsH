# Nadir lens | GP-B axial spin-down source-critical readout audit | 2026-10-27T20:48Z

**Actor:** current assistant, not authenticated historical Nadir. **Status:** measured-data replay PASS; Lean new-head compilation PENDING; no H(s)H prediction.

**Primary observed system:** Gravity Probe B, four quartz gyros, 2004-2005. Everitt et al., PRL 106 221101 (2011), DOI 10.1103/PhysRevLett.106.221101. **Secondary reanalysis:** Wei-Tou Ni, arXiv:1105.4305v1 (2011-05-22), PRL 107 051103, DOI 10.1103/PhysRevLett.107.051103, original Tables II-III and surrounding derivation. Ni is not a second independent experiment.

**New source-critical result:** Ni's axial anomalous torque-per-angular-momentum figure `(0 +/- 3.60) x 10^-13 s^-1` comes from taking the smallest of four bounds obtained by allowing 30% of each gyro's measured spin-down for unexplained torque. Ni's 30% is a phenomenological/systematic allowance, partly informed by private communications, NOT a measured Gaussian one-sigma standard error. The plus/minus typography should not turn this into a statistical measurement of axial precession.

**Executed exact-rational Python replay:** For each gyro, `b = 0.30 * |df/dt| / |f|`, converting microHz/hour to Hz/second. Original source magnitudes and results in units 10^-13 s^-1:

| gyro | |f| Hz | |df/dt| microHz/hour | reproduced b | Ni rounded |
|---|---:|---:|---:|---:|
| G1 | 79.39 | 0.57 | 5.98312130 | 5.98 |
| G2 | 61.82 | 0.52 | 7.00959776 | 7.01 |
| G3 | 82.09 | 1.30 | 13.19689771 | 13.20 |
| G4 | 64.85 | 0.28 | **3.59804677** | **3.60** |

All four published rounding checks and minimum check passed. Python source SHA256 `b0b6b310f0808c63c24f348879728effef2015f7c630288ae24e9cb6fde17d23`; executed JSON SHA256 `b3600f44ea1178bec158a909d16f806d14d204eb57c5f4c130c12416adf50e4a`. Printed source inputs are rounded and no independent input uncertainty or joint covariance was recovered.

**Geometric readout distinction:** change of spin-axis direction (S2, transverse orientation) and change of spin-frequency magnitude (longitudinal spin-rate) are different projections. The latter constrains a modeled anomalous axial torque, not a hidden SO(4) frame plane or an axial orientation precession. A native H(s)H projection/composition map and new independent forward prediction are missing.

**Lean:** reused existing draft PR #744 on Nadir GP-B, adding `NadirGPBNiAxialBound.lean` with three theorem targets: exact G4 bound `14000/3891` in units 10^-13 s^-1, G4 strictly smallest, and G4 displayed rounding. Commits `21b933f8d9fd820a4d188f1d7d1305ff661126b6`, `4f5a1500be026fe58d52ebb252208c6091f07130`; module blob `bab972047deca6839dea0d6c1fe9d3dc034541e9`, import blob `9d3ed2542277292077786123bbf6710f591277cc`; readback verified. CI #40581628335 PENDING at submission. Earlier PR #744 commit CI #40511421777 succeeded but cannot prove this new commit. Even successful Lean proves source-encoded rational arithmetic, not physical premise or model truth.

**Source discipline:** Nadir sandbox README blob `e24383016bc94d036474407857bfaf93932fec7e`; live BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7`; Steering `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`. Existing Math Hopper/Lean infrastructure reused, no new tooling. No SAT-O equation recovered or Mersearch run claimed. No invented physical data, BEDROCK promotion, scheduler mutation, sixth task, signet/access change or cross-ChatGPT-thread delivery.

**Next:** recover GP-B original spin-down error budget/time-series and specify separate physical orientation/frequency observation maps before assigning Ni's axial bound to any finite-core holonomy mechanism. Orson Nov 9 cognition paper protected; Nov 30 physics and Dec 14 full theory separate. Next rotation identity Enheduanna retains source-critical specialist charter.
