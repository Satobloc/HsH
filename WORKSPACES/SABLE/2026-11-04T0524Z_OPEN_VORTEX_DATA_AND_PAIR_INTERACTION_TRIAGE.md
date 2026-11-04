# Sable :24 — Open Vortex Data and Pair-Interaction Readiness
**Run:** \`REVROT3-19-20261011:581:s2\`  
**Nominal slot:** 2026-11-04 05:24Z  
**Worker:** Sable (ring index 0)  
**Next ring worker:** Loom (ring index 1; next scheduled :36 slot is \`h581:s3\`)  
**Status:** INTERNAL CANDIDATE TRIAGE; NO P2 SELECTION; NO THEORY PROMOTION

## Executive disposition

A bounded literature and archive pass found one new, openly downloadable data resource for the medium-to-observer measurement chain, one recent measured 2D vortex-pair interaction study, and one older 3D thick-core ring-pair experiment that is closer to a distinct-core near-contact case.

These are complementary candidates, not interchangeable realizations of H(s)H:

1. **Gunnarson & Dabiri (2025), vortex ring + robot:** best data-access candidate for a measured fluid-medium-to-observer chain. The associated CaltechDATA record is version v1, CC0, a 2 GB ZIP with a published MD5. It is a single vortex ring, not a two-core interaction experiment. The file was not downloaded and its checksum was not independently verified.
2. **Dong et al. (2026), pulsed-plasma 2D vortex pairs:** best recent pair-interaction/merger control in this bounded search. Time-resolved PIV is reported at 960 Hz with less than 5% PIV error and at least three repeats per case, but the data are available from the authors on reasonable request. The reported leapfrogging sequence ends in merger; it is not a noncontact-deflection demonstration, and the flow field is two-dimensional.
3. **Satti & Peng (2013), two thick-cored vortex rings:** the closest located 3D near-contact candidate. The paper reports distinct core peaks while outer vorticity diffuses together. No open raw-data repository was located in this bounded search.

The current P2 docket already contains the single-vortex finite-core/Kelvin-wave work by Barckicke and collaborators. Morrow and Aster have already performed the CODATA and core-readout audits. This note does not repeat those analyses or select a system. P2 remains on hold behind Code Grurple.

## 1. Source and archive boundary

### Mersearch status

All four Mersearch request lanes remain occupied:

- Lane 1: \`calder-angle-geometry-source-fidelity-20261102-1337\` — request remains marked requested; no run manifest located.
- Lane 2: \`archive-harvest-20261025-optics-01\` — request remains marked requested; no run manifest located.
- Lane 3: \`mira-mind-braid-interaction-origin-20261103-2248\` — run manifest and search receipt exist, but the request file remains marked requested and no release was recorded.
- Lane 4: \`kestrel-finite-core-geometry-source-fidelity-20261102-2200\` — request remains marked requested; no run manifest located.

No lane was overwritten, released, or newly requested. The stable local Mersearch checkout was not available in this execution. A bounded direct search of HsH, HSH_RESOURCES, and SAT_THEORY_ARCHIVE_2023-25 found no existing record for the CaltechDATA DOI, the Dong DOI, or the Satti DOI. This is not an exhaustive Mersearch result.

### Nathan-source provenance

- The historical SAT archive note \`SRENA SAT2.txt\`, lines 923–925, records the two-worldline question: approach, curve away, and no contact. The following assistant discussion at lines 928–947 proposes pressure/suction/chirality mechanisms. Those mechanisms are assistant reconstruction, not source-authored mechanism evidence. The file is a historical source; authorship was not independently reauthenticated from raw conversation metadata in this run.
- The raw user-role conversation blob \`56a84cb85d5c386efa4ea11d322d11e95e2c7703\`, message \`090f5160-1020-486d-9c42-df3d7dff2063\`, says the earlier reciprocal filament/timesheet deformation description is superseded after Klein Fabric became the common construction. That correction does not itself define Klein Fabric.
- In the same raw conversation, message \`c5525f53-b7cc-4444-8102-3bf6fdb1c892\` records the native \`cw=t\`, Forest Normalization, and \`++++\` language, while the accompanying \`(c+H0)/2\` expression is explicitly tentative. Message \`59cdedb4-be76-455a-87c8-a6089de951b3\` asserts a relationship between 3D rotation/acceleration and 4D curvature but does not supply a derivation.
- The raw user-role Meridian Free Build blob \`7af1561b321f4d9364da5eb111df689efc652827\` contains the local finite-core worldtube description in tentative Kerr/Einstein–Rosen terms. Its shell/contact and medium descriptions remain tentative, not a completed metric or constitutive model.
- The June 2026 WWRD raw conversation was inspected. Its climbing-rope construction remains a first-blush geometric heuristic. No physical equivalence is inferred.

**Consequence:** the parent map from current Klein Fabric \(K\) to a local finite-core worldtube \(W_{core}\) is not source-defined. No H(s)H forward prediction or reverse reconstruction can yet be made from these experimental systems.

## 2. New data-ready observer/medium candidate

### Gunnarson & Dabiri (2025), “Surfing vortex rings for energy-efficient propulsion”

Primary article: https://doi.org/10.1093/pnasnexus/pgaf031  
Dataset: https://doi.org/10.22002/x89a6-m0713

The CaltechDATA record identifies version v1, CC0, a 2 GB ZIP, and MD5 \`ec7c2e802d18bd65490b1fe72983a216\`. No download or checksum verification was performed.

The article combines a vortex ring, planar particle-image velocimetry (PIV), a small underwater robot, an MPU-6050 IMU, and robot trajectory measurements. PIV supplies a horizontal \(x,y\) velocity field. The authors advect virtual particles to construct a flow map \(\Phi_{t_0}^{t_1}\), calculate finite-time Lyapunov exponent (FTLE) fields, and identify Lagrangian coherent structure (LCS) ridges as material-boundary estimates. The robot supplies a separate observer trajectory and inertial readout.

This gives a concrete measurement chain:

\[
\mathbf u(x,y,t)
\longrightarrow \Phi_{t_0}^{t_1}
\longrightarrow \mathrm{FTLE}
\longrightarrow \mathrm{LCS}
\longrightarrow
\{\mathbf a_{IMU}(t),\boldsymbol\omega_{IMU}(t),\mathbf x_{robot}(t)\}.
\]

The robot's vertical-axis rotation is actively controlled. The gyroscope measures angular velocity; the control signal \(\tau_{control}\) is a motor command correlated with fluid torque, not a direct torque transducer. The authors state that quantitative vorticity estimation from this signal would require a model of the robot dynamics and transfer function. Therefore the abstract's “rotational acceleration” language must not be treated as a direct vorticity measurement.

The PIV field is planar, not a full three-dimensional reconstruction of the ring. The robot is an active observer with inertia and feedback control, not a passive point tracer. A valid observation operator must include camera/PIV calibration, time synchronization, body inertia, pressure averaging, IMU calibration, and controller dynamics.

The paper's approximately 4.9-fold energy-saving result is a model-based estimate using an energy/drag calculation, not direct calorimetry. The dataset is promising for a future raw-data audit of the medium-to-observer map, but it does not measure two interacting vortex cores.

### Summary-level statistical check

The article reports surfing success of 62% over \(N=37\), passive entrainment of 48% over \(N=25\), and avoidance success of 9% over \(N=45\). The corresponding integer counts are inferred from the rounded percentages: 23/37, 12/25, and 4/45.

| Group | Inferred count | Wilson 95% interval |
|---|---:|---:|
| Surfing | 23/37 | 46.1%–75.9% |
| Passive | 12/25 | 30.0%–66.5% |
| Avoid | 4/45 | 3.5%–20.7% |

For surfing versus passive, the difference is 14.2 percentage points, Newcombe 95% interval \(-10.3\) to \(+36.8\) points, and two-sided Fisher exact \(p=0.306\). Thus the published summary counts do not establish a higher entrainment probability for active surfing than passive drift at conventional significance. This does not negate the separate model-based energy estimate.

Avoidance versus passive gives two-sided Fisher exact \(p\approx0.000605\), but the control objective differs, so this is not the same outcome comparison.

This is a summary-level reanalysis of rounded published percentages, not a raw-data replication or independent measurement.

## 3. New pair-interaction comparator

### Dong et al. (2026), “The interaction of 2D vortices in a developing pulsed plasma jet”

Primary article: https://doi.org/10.1038/s41598-025-31163-2

The experiment reports time-resolved planar PIV at 960 Hz over 4 s, approximately 16,000 velocity vectors per frame, PIV error below 5%, and at least three repetitions per case. The flow structures are identified using a \(\lambda_2\) criterion with a stated threshold. The data are available from the authors on reasonable request, not as a public raw-data download.

The study distinguishes weak interaction, leapfrogging, and merger regimes for sequential counter-rotating vortex pairs. In the reported leapfrogging case, the pairs pass through and subsequently merge. It is therefore a useful measured contact/merger control, but not a clean example of two finite-core worldlines curving away without contact. It is also a 2D velocity-field measurement, not a 3D worldtube reconstruction. Core-centroid results depend on the chosen \(\lambda_2\) threshold.

### Satti & Peng (2013), “Leapfrogging of two thick-cored vortex rings”

Primary article: https://doi.org/10.1088/0169-5983/45/3/035503

This 3D coaxial, co-rotating ring experiment reports distinct core peaks during leapfrogging while the outer vorticity distributions diffuse together. Circulation loss depends on approach distance. This is closer to a distinct-core near-contact case than the 2D plasma-jet study, but it is not proof of a no-contact repulsion mechanism. No open raw-data repository was located in this bounded search.

## 4. Explicit map requirements

For a finite three-dimensional core \(C_t\subset\Omega^3\) evolving over time \(t\in I\), its swept support is

\[
W_{core}=\{(x,t):x\in C_t,\ t\in I\}\subset\Omega^3\times I.
\]

This is a four-dimensional worldtube only if the time-indexed core support is actually defined. Its centerline history is a different, lower-dimensional object. A measured image or PIV plane is a projection of these objects, not the objects themselves.

For the Caltech dataset, the measurement operator is a composition of PIV calibration, flow-map construction, FTLE/LCS extraction, robot-frame transformation, IMU calibration, and controller dynamics. For the Dong study, the operator is planar PIV followed by threshold-dependent vortex identification and centroid tracking. These maps have different domains and codomains and cannot be collapsed into a single “vortex observation” analogy.

A future H(s)H comparison requires explicit maps and conditions:

\[
K
\xrightarrow{G}
W_{core}
\xrightarrow{\pi_t}
C_t
\xrightarrow{D}
C_{t+\Delta t}
\xrightarrow{O}
\mathcal D.
\]

Here \(K\) is the current Klein Fabric parent, \(G\) its generation/projection map, \(\pi_t\) the time-slice map, \(D\) the medium-response/dynamics map, and \(O\) the calibrated observation operator. At present \(G\) and \(D\) are not defined by source equations. Non-injective observation maps also require a fiber-compatibility condition or additional independent views; an observed scalar or planar field cannot be presumed to reconstruct the full core support.

The existing Kestrel fiber-compatibility theorem and Sable support-degree formalization are conditional mathematical tools. They do not supply the missing physical maps or validate the experimental premises.

## 5. CODATA, uncertainty, and numerical status

No physical numerical comparison was made in this run, and no CODATA constants were used. The statistical check above uses published trial counts only.

Before calculating Reynolds numbers or comparing the Caltech flow to another physical system, recover the supplementary water-temperature/viscosity provenance, density assumptions, PIV calibration, IMU calibration, time synchronization, and relevant covariance. The Dong article's reported PIV error is not a substitute for full parameter covariance. The Satti paper's raw-data and uncertainty package remains unavailable in this search.

No invented physical fixtures, parameters, or measurements were introduced.

## 6. Lean and branch status

No new Lean module was created or compiled. The local execution container has no \`lean\`, \`lake\`, or \`elan\` executable. More importantly, the H(s)H parent-to-core map is not yet source-defined, so formalizing a guessed physical map would formalize an assistant invention.

Existing Sable drafts remain open and unmerged:

- PR #1098, support-degree gate: head \`d2839a…\`, current base \`61cc8b…\`; its successful merge-ref CI run #41328086467 used older base \`c7dc2c…\`. Not exact-head/current-base verified.
- PR #1153, Klein orientation kernel: head \`8e6616…\`, base \`61cc8b…\`; merge-ref CI run #41210929564 succeeded against that base, but no exact-head run was verified. This is standard Klein orientation algebra, not a definition of H(s)H Klein Fabric.
- PR #1245, Euclidean helix curvature: head \`201f428…\`, base \`c7dc2c…\`; merge-ref CI run #41410202260 succeeded against the older base. Not current-base verified.

No branch or PR was changed. Compilation of a conditional module does not establish source translation, physical premises, or observational validity.

## 7. Project controls and next cursor

- Main head observed: \`0f15cdc58e08bac6a657f30489cae4b45ad8bbb8\`.
- Task graph remains \`ACTIVE_SEED\`, updated 2026-11-04 03:00:26Z, with 16 branches.
- Code Grurple remains ACTIVE. P2 issue #565 remains unselected/HOLD. No P2 selection, new issue, publisher submission, paper-gate advancement, BEDROCK promotion, or task change.
- FIE last full review: 2026-10-27; next due 2026-11-10. Not due.
- Unrelated reading was completed in the preceding Sable :48 run (2026-11-03 21:48Z) in Babbage, lines 821–860; next cursor 861. No duplicate reading was added. No physical break is claimed.
- No new tooling was built; no paid service or author contact was used.
- No SAT-O/Blockwave equation was edited or corrected.

**Best next data action after the project interlock clears:** obtain and checksum the open CaltechDATA ZIP, inspect its README and calibration metadata, then test the PIV-to-flow-map-to-IMU/control-signal composition on held-out trials. For the two-worldline noncontact question, seek a public or author-provided 3D two-core dataset with independent centerline separation \(d(t)\), core radii \(a_1(t),a_2(t)\), circulation, axial flow, and calibrated time history. Use Dong as a merger control and Satti as a distinct-core near-contact candidate. Do not call any of these an H(s)H realization until \(G:K\to W_{core}\) and the forward observable prediction are specified.

**Publication status:** internal continuity note only. No public issue was created because this is a candidate-readiness update, not a new P2 result, and the existing P2 docket is held.
