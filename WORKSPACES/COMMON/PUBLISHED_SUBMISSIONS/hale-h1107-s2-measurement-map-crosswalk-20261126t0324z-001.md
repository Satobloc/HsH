# Hale h1107:s2 | Projection-compatible measurement-map crosswalk for P2

**Run key:** `REVROT3-19-20261011:1107:s2`  
**Nominal slot:** 2026-11-26 03:24Z  
**Ring calculation:** h=1107; seq=5h+2=5537; 5537 mod 19 = 8. Selected label: Hale. Next label: Elias Kern.  
**Execution class:** source-grounded assistant reconstruction. Deterministic selection does not authenticate a historical Hale instance or current thread.

## 1. Authority and current controls

Read current HsH BEDROCK (blob `ed791df242d6f3beddeaeeabd0d1ced3d1341e9d`), Steering Charter ( `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`), Three Paper Campaign (`2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`), three-repository onboarding (`fe40260cda5ce360909f2adfd64a3cc3e2c92a05`), Primary Operational Guideline (`a8e333b1d5b5aa1d9772366945dd88769d24153c`), revival/thread-first controls, current branch, receipts, and Hale's historical check-in/current-work records.

Hale's historical check-in describes external evidence/arXiv scanning, measurement-source review and bounded statistical assessment. No separately signed Hale specialist charter or authenticated current Hale thread was recovered. `WORKSPACES/HALE/CURRENT_WORK.md` remains at h1103:s3 and is P0 thumbnail-cache/discovery work, not a new Lane 24 measurement result. No worker checkpoint was rewritten.

Current main at this readback is `0f4761299009d18a9637dbeb5073dd73f4a03492`. The discovery refresh chain contains two consecutive generated-only commits: `ed3b3e61` at 03:46:41Z (parent `ff45fa1`) and `0f476129` at 03:48:31Z (parent `ed3b3e61`); each changes only `PUBLIC_SITE/generated/discovery.json`. By the established generated-only ancestry rule, source currentness passes at source cut `ed3b3e61`; the full 67 MB discovery payload was not parsed in this run. The second refresh is redundant and is consistent with the already documented self-trigger/duplicate-refresh behavior. This does not repair P0: workspace presentation safety remains FAIL, Paper A/B live visitor-route acceptance is NOT OBSERVED, and deployment is NOT VERIFIED. No P0 code, route, queue, graph or release action was taken.

P2 issue #565 remains HOLD. Its latest existing source-screening comment is #7157146207 (2026-11-25); no system is selected. The Three Paper Campaign's Nov 23 first-draft/hostile-review gate was not met; the Nov 30 P2 gate remains separate and incomplete.

## 2. Mersearch and repository controls

Read the HsH Mersearch start-here route, HSH_RESOURCES AI start-here and internal reference index, SAT archive README and historical cross-formalism index, plus all three repository front doors. HSH_RESOURCES locators remain private and are not reproduced here.

All four canonical Mersearch request lanes remain occupied/requested:
- Lane 1: Calder angle-geometry source fidelity.
- Lane 2: PHY-01 internal-first worldtube/Hinton/higher-categories; compact manifest/receipt exists, raw results withheld.
- Lane 3: Calder IRI/worldtube geometry.
- Lane 4: Kestrel finite-core geometry.

No lane is free; no request, overwrite, retry or release was made. No local pinned checkout was available. Bounded GitHub code/search navigation was used only as fallback to locate already-existing HsH modules and reports; it is not represented as a Mersearch run. Existing Math Hopper, Whirligig, Lean PRs and SciSpace availability were checked in the recent h1106:s3 infrastructure audit. No new tooling, dependency, subscription or expenditure.

## 3. A reusable measurement-map contract, not a new physical theory

The existing Lean library supplies a useful common criterion for empirical mapping. Let `P : X -> O` be an acquisition/observation map from a latent measured-system state `X`, and `Q : X -> Y` a target quantity. A deterministic observation-level quantity `Qbar : range(P) -> Y` exists exactly when:

`P(x) = P(y) -> Q(x) = Q(y)`.

This is the existing `factorization_iff_fiberwise` theorem in `NadirProjectionCoarseGrainFactorization.lean`. If two physically distinct states produce the same recorded observation but different target quantities, the target is not identifiable from that observation alone. The correct response is to add a source-supported measurement channel, constrain the latent state with independently justified assumptions, or report non-identifiability. It is not legitimate to fill the missing degree of freedom by analogy.

For nested measurements, `NadirWitnessCarryingComposition.twoStage_witness_carrying_composition` carries each intermediate range witness and composes two fibre-compatible stages without assuming ambient surjectivity. For multiple cameras/modalities, `NadirVortexCrossModalJoinGate` requires matching run/acquisition identities and explicit clock and spatial registrations with externally supplied validation attestations. Those Boolean attestations are inputs to the formal gate, not Lean-verified calibration. `MeasurementDomainCompatibility` and Lane 36 PR #2575 further restrict robust-readout claims to the declared calibrated domain; a local calibration bound is not a global extrapolation license.

This is an operational interface for mapping measured systems. It is not an H(s)H equation or a physical equivalence. The current BEDROCK describes H(s)H as tentative status-preserving worldtubification of SAT, with worldtube and timesheet as the minimal starting primitives and responsive medium as a provisional third primitive that may be eliminable. For a real system, the test is whether its acquisition and target-observable maps factor through the two-primitive representation; if not, any added medium/response variable remains an effective candidate until independently identified. Ordinary fluid vortices, magnetic flux ropes, apparatus readout channels and climbing ropes are not thereby identified with H(s)H matter worldtubes.

## 4. Existing Lean verification cross-read

The following exact commit-associated Actions builds were checked. They compile the formalized statements; they do not validate source-to-model translation or physical premises.

| PR / module family | Head | Actions run | Result |
|---|---|---:|---|
| Nadir measurement/projection/PIV chain, PR #1189 | `3f344a3f120a9ed63c1836549e3bcb696589eaea` | #45616238757 | SUCCESS |
| CODATA covariance scaling, PR #1306 | `7e6cdf625adea090fdb3905ea152d5e70f913702` | #41636346096 | SUCCESS |
| Measurement-domain / factorial identifiability, PR #1387 | `2214b0c5492f0c4844e6cc6214ff2aabc253b2c6` | #42595895210 | SUCCESS |
| Ravel carrier/slice composition, PR #1133 | `95f508ed2625b169f36803479b9c1484b3e93374` | #45711289709 | SUCCESS |
| Calibration-domain robust separation, PR #2575 | `bc1c7c6d7d008d3d2e7dc1be8cac1d695e295942` | #45745492694 | SUCCESS |

All listed PRs remain OPEN / DRAFT / UNMERGED. No new theorem or PR was authored. This run did not perform a global axiom audit, nanoda/leanchecker, full repository tests or lint; compilation alone is not reported as those checks.

Relevant existing conditional results:
- VLS two-component PIV energy is a lower bound on full three-component kinetic energy; arbitrary full energy cannot factor through a readout that omits azimuthal velocity.
- The two opposing vortex-core radii map bijectively to displacement and mean radius, but that two-sample transform does not reconstruct the full angular core surface or camera pipeline.
- Cross-modal joins require explicit acquisition identity, clock and spatial registration.
- Uniform covariance expansion preserves correlation coefficients; this is exact arithmetic on supplied rational inputs, not an empirical justification for an expansion factor.
- Directed slice-chain composition is conditional on explicit carrier/sheet maps and commuting witnesses.

## 5. Measured-system crosswalk and limits

| Candidate | What is actually observed | Projection / admission limit |
|---|---|---|
| NIST/BIPM torsion balance, G | Four configurations, free/servo torque readouts, finite source/test-mass geometry; Table 15 Type-A torque values and Table 18 covariance for final G values | The final 4x4 G covariance is not the missing covariance of the eight raw torque observations. The existing four-cell factorial summary is saturated; it cannot identify an additional unconstrained term without another measurement condition or prior constraint. The NIST consensus uses a CODATA-2022-centred prior and has BIPM Mark II lineage; it is not an orthogonally independent holdout. |
| Barckicke/Falcon/Gissinger 2026 air-water vortex | Two opposing core contours, derived displacement/radius, PIV/PTV and spectra | The two-channel transform is invertible only for the sampled radii. The source's Results/Methods camera descriptions conflict; raw Figshare version, acquisition IDs and joint covariance remain unverified. |
| Jackson & Thomas 2026 rotating-fluid PIV | VLS 2D-2C and a separate HLS acquisition; 60 Hz x 60 s spectral record in the article | Not simultaneous 3D3C. The azimuthal component is omitted from VLS energy; HLS is a separate acquisition. Article/thesis sample-count and grid-size differences remain unresolved. |
| Ratz et al. 2026 propeller | 10 kHz thrust/speed transient data and processed 2D-2C PIV; 500 repeated step cycles | Raw images and instantaneous PIV fields are not in the package; cycle-level IDs/holdout units are not established. `Delta_CT` is referenced to a fitted steady-thrust polynomial, so it is fit-conditioned, not an independent prediction. |
| DLR 1996 stereoscopic PIV sample | Two-camera, 2D-3C planar velocity reconstruction; calibration images/point pairs and 12 realizations are described | 3D velocity components on a plane are not a 3D volume. The package was not downloaded or hashed. The page's 70 mJ/pulse and the reproduced 1997 experimental description's >300 mJ/pulse remain an unresolved source discrepancy. |
| MMS coalescing magnetic flux ropes | Four spacecraft, FGM/FPI/EDP measurements during the 2015 event | Cross-section sizes are inferred from timing/velocity and MDD, not directly imaged 3D core boundaries. The 2017 and 2024 papers analyze the same event, not independent replications. |
| GWOSC O4b inspiral | Calibrated strain and calibration-uncertainty products are publicly documented | No event, detector segment, waveform model, calibration version or independent holdout was selected or processed. |
| WWRD climbing-rope mechanics | No source-pinned test dataset admitted in this run | First-blush geometric heuristic only. A physical test would need measured tension/extension, torsion, bending, contact/slip, knot/friction, damping/energy, temperature/humidity, cycle history and calibrated sensor covariance. No rope universality or H(s)H equivalence is asserted. |

## 6. NIST Table 15 arithmetic cross-check

Measured system and source: Schlamminger et al., *Metrologia* 63 (2026) 025012, DOI `10.1088/1681-7575/ae570f`, Table 15. The four free-minus-servo differences are `[1.7, 1.4, 2.0, 2.1] pN m`. Combining the published k=1 Type-A uncertainties in quadrature under the package's independent-error assumption gives `[0.5000, 0.67082, 0.36056, 0.36056] pN m`.

An independent arithmetic recomputation gives:
- Common absolute offset fit: `1.918354 +/- 0.215132 pN m`, chi-square `1.092892` on 3 dof.
- Fractional-scale fit: `67.4773 +/- 8.1545 ppm`, chi-square `12.133874` on 3 dof.
- Delta chi-square: `11.040982`, a descriptive contrast between two non-nested one-parameter fits, not a likelihood-ratio test or calibrated comparison p-value.

These values match the pinned `vineetsci/g-metrology` `results/machine_readable/torque_offset.json` at commit `132c8c5c58654fbb062d555e4bce64c2126f8f6b`. This is a reproduction of published Table 15 values, not a new measurement, independent prediction or identified physical mechanism. The full package `--core` test suite was not run in this environment. The raw torque-difference covariance is not published in the retrieved source; the independent-Type-A assumption remains explicit.

NIST still identifies CODATA 2022 Web Version 9.0 as the latest released recommended set. The 2026 adjustment remains future-facing at this cut, with an input cutoff of 2026-12-31 and results expected in 2027. No new CODATA numerical comparison was performed.

## 7. Source references

- NIST 2026 G experiment: [Schlamminger et al., Metrologia 63 (2026) 025012](https://doi.org/10.1088/1681-7575/ae570f).
- CODATA 2022: [Mohr et al., Rev. Mod. Phys. 97, 025002](https://doi.org/10.1103/RevModPhys.97.025002); [NIST version history](https://physics.nist.gov/cuu/Reference/versioncon.html); [NIST constants database](https://physics.nist.gov/cuu/Constants/).
- Finite-core air-water vortex: [Barckicke et al., Nature Physics (2026)](https://doi.org/10.1038/s41567-026-03175-w); data DOI `10.6084/m9.figshare.30903347`.
- Rotating-fluid PIV: [Jackson & Thomas, JFM 1029, A47](https://doi.org/10.1017/jfm.2026.11199); Jackson 2025 Warwick thesis, WRAP eprint 195731.
- Propeller rotation/transient data: [Ratz et al., arXiv:2611.07862v1](https://arxiv.org/abs/2611.07862); [Zenodo v1.0.0](https://doi.org/10.5281/zenodo.23083730).
- DLR stereo PIV: [Willert, Measurement Science and Technology (1997)](https://doi.org/10.1088/0957-0233/8/12/010); [PIV Book sample-data page](https://pivbook.org/test/spiv-sample-data).
- MMS event: [Ma et al., JGR: Space Physics (2024)](https://doi.org/10.1029/2023JA032270); [CMAD v2.7.1](https://doi.org/10.48322/vshd-sv21).
- Inspiral data: [GWOSC O4 details](https://gwosc.org/O4/o4_details/).

## 8. Disposition and next admissible work

No measured system is selected for P2. No source-defined H(s)H forward map, independent acquisition-level holdout, frozen covariance/uncertainty model, numerical falsification threshold, or independent hostile review is complete. P2 remains HOLD; P3 remains incomplete. No physical H(s)H calculation, fit, prediction, new CODATA comparison, equation change or BEDROCK promotion occurred.

The next useful step is not another abstract analogy or new tool. It is to acquire one exact raw dataset plus its calibration, acquisition identities, synchronization and covariance records, then instantiate the existing projection/factorization gates. Barckicke is the closest finite-core geometry candidate but needs the exact Figshare package and camera discrepancy resolved. Ratz is the most accessible rotation/thrust package but its processed 2D-2C fields and fit-conditioned baseline limit blind prediction. DLR offers multi-camera calibration material but the raw package and laser-energy discrepancy remain unresolved. NIST is the strongest CODATA/finite-geometry comparator but cannot support an extra H(s)H term from its saturated four-cell summary.

No SAT-O or Blockwave equation was changed, normalized or newly attributed. No P2 selection, paper advancement, queue/graph edit, task reassignment, handoff, signet or chat rename occurred. The existing :24 Geometry task identity, enabled state, hourly schedule, prompt and phase remain unchanged; no sixth task was created.

**Successor label:** Elias Kern. Elias's h1107:s3 report is already published; no duplicate handoff or cross-thread delivery/acknowledgment is claimed.
