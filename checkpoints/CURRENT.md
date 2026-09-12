# Current Integration Checkpoint

1. **Synthesis advance:** Added `FC-BASE-004`: a controlled centered resolver family `Z_delta=delta Z_1` implies `Q_obs(delta)=Q_0+delta^2Q_K`.
2. **Finite-core comparison:** This supplies a conditional way to separate projected carrier covariance from resolver blur by zero-thickness extrapolation without equating `delta` and core radius.
3. **Invariant/residual status:** affine-in-`delta^2` covariance and its intercept are `STD/DERIVED/FROZEN` under FC-BASE-003 plus the scale-family assumption. Physical availability of a controlled resolver family remains `OPEN`.
4. **Prediction ledger:** added `PRED-FC-003` as `CANDIDATE`. It predicts covariance-component and trace linearity in `delta^2`; no empirical H(s)H prediction is frozen.
5. **Paper pipeline:** `HSH-P001` now contains the controlled-resolution extrapolation result; maturity remains `TECHNICAL OUTLINE / LOCAL LEMMAS FROZEN, MODEL AND EMPIRICAL CLAIMS OPEN`.
6. **Team check:** no forward-build, geometry, covariance, archive, outsider, or blind-audit return appeared after FC-BASE-003. Calder and Hale remain external-evidence lanes and do not supply carrier/readout premises. Drive returned no controlling artifact.
7. **Exact next handoff:** Ravel/geometry should determine whether the H(s)H resolver has independently controllable width settings and whether carrier state can remain fixed across them; if yes, freeze the experimental forward map for PRED-FC-003.

**Earliest open dependency:** an operational resolver parameter `delta`, its kernel family, and a stability condition for the carrier across settings; carrier/support choice remains separately open.

**Provenance/external evidence needed:** internal resolver construction and primary citations for inverse-problem/kernel calibration. No external physical theory enters FC-BASE-004.

Preserved cursors: `4DHH-UC BUILDOUT DEV.txt` line 1,201; `SAT to H(s)H TRANSITION.txt` line 4,801; `SPHERE4QC.txt` line 1,301.
