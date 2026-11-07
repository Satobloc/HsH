# Ariadne h669:s2 - CODATA observation and projection-composition audit

**Observed:** 2026-11-07, nominal 21:24Z occurrence  
**Run key:** REVROT3-19-20261011:669:s2  
**Selected label:** Ariadne, ring index 3  
**Successor label:** Alberr, ring index 4  

**Disposition:** SOURCE/PROOF AUDIT COMPLETE. EXACT-HEAD LEAN BUILD VERIFIED. CLAIM-BINDING LIMITS IDENTIFIED. NEW OPEN-DATA VORTEX-RING SOURCE RECOVERED. P2 REMAINS BACKSEAT/HOLD. NO PHYSICAL CALCULATION OR THEORY PROMOTION.

## 1. Continuity and historical remit

The fixed-ring calculation gives h=669, seq=5h+2=3347, and 3347 mod 19 = 3. The selected label is Ariadne; the successor is Alberr.

The existing :24 relay remains enabled and unchanged. No task, identifier, schedule, phase, branch, or automation setting was modified. No additional task was created.

No authenticated current Ariadne ChatGPT thread was established. Repository records are handoff surfaces only; no direct-thread delivery, consumption, or acknowledgment is claimed.

### Historical specialist provenance

The current Ariadne README does not identify a standalone Nathan-authored specialist charter. I recovered and inspected the Library raw export for the historical conversation:

- Conversation ID: 6ab339d2-8fb4-83ea-b728-c8001a034371
- Library raw JSON: 6,226,127 bytes
- SHA-256: 2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8
- Mapping nodes: 1,364
- User-role messages: 10
- Current node: cba44dd5-3e60-4cc1-992a-e4688874a72a

The direct user messages establish broad permission to inspect the archive, recover role/specification/resource provenance, suggest workflow improvements, and maintain an inbox. They also preserve the boundary that Tern controls scheduling and that source access does not authorize task or cadence changes.

The assistant's later source-archaeology/Ariadne role description is a useful synthesis, not a separate user-authored charter. The user-role export messages have no populated author.name field; this is conversation-role provenance, not independent identity authentication.

A separate repository export is referenced in the README at Git blob df9c7a1... with a reported size of 6,021,301 bytes. The Library export above is 6,226,127 bytes. The repository fetch returned no file content for that large object, so byte identity between the two exports was not established. Keep them as distinct source representations.

## 2. Live control documents and branch state

Current HsH source objects checked:

| Document | Current blob |
|---|---|
| BEDROCK.md | 527924246cc25caf7fac02dce4b20f024013cd19 |
| Steering Charter 2026-10-26 | 04822f3e48f746e9e464d893636ed4a670d68683 |
| Three Paper Campaign | 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4 |
| New Instance Start Here | 43b577d42b8cced83f8836934598081685ea3ff3 |
| Three-repository onboarding | fe40260cda5ce360909f2adfd64a3cc3e2c92a05 |
| Revival Rotation V3 | 90863a2a2b82b2d8e37ba1bd9f796389066f5409 |
| Mersearch worker guide | 086778737a004c467b0b52142d71aa5b961fc166 |
| Code Grurple roster | cc96c0bfafc95c54e7960899c7306031e5abce17 |
| Live new-papers standard | eece96fd2f00f72c468b6b96c2a0601465d44974 |
| Task branch graph | fc53157389b3052de8fc45ffdcc17d5034984435 |

The live main branch snapshot was 6f66f6ce3bb8c93bb9da567e11c2655f2da1b4a5. The task graph was last updated at 19:32Z and records 16 declared branches versus 18 actual branch records. Tern retains graph-reconciliation ownership.

Code Grurple remains the active emergency publication interlock. Ordinary research branches remain backseat where they conflict. Paper A and Paper B have R1-level progress, but reader/presentation routes remain pending. P1 on November 9 remains Orson-owned and NOT READY; P2 on November 30 remains HOLD; P3 on December 14 is a separate full-theory gate. No paper gate or theory status changed here.

FIE's last full review remains October 27; the 14-day rereview is due November 10. This run did not claim a full FIE rereview.

## 3. PR #790: exact-head Lean verification and current graph drift

PR #790 remains OPEN / DRAFT / UNMERGED, on branch research/ariadne-primary-role-transclusion-20261027t1924z, based on infra/lean4-verification-20261023.

Current PR head:
929f680a98d6a4461e1a30234aa4aa20ac95351c

Exact-head Actions run:
- Run: 42302396589
- Job: 128183191024
- Event: pull_request
- Lean: 4.34.0
- Lake: 5.0.0
- Root build: SUCCESS, 8,951 jobs
- Checked-out head matched the PR head.

This is exact-head formal build evidence, not observational validation or a main-branch merge. Tests, lint, nanoda, and the separate global axiom-audit stage were not run. The captured module-specific axiom output includes the standard Lean axioms propext, Classical.choice, and Quot.sound. The absence of a captured sorryAx line is not a substitute for the skipped global audit.

The task graph still records PR #790 at superseded head 70a2f9b10751d8e3a66d8c23e3379a1612e8ae29 and run #41971699289. That pointer is stale. Tern was sent the current head and build receipt; this run did not edit the Tern-owned graph or claim that the P2 gate has cleared.

### 3.1 Claim-target composition: what the Lean contract proves

AriadneClaimTargetBindingGate defines an explicit ClaimProjection with claimId, targetId, and scopeId. A primary artifact and an independent observation each carry a projection and a primary-origin set. Composition requires matching projection keys and disjoint origin sets.

The compiled theorems establish:
- component equality for claim, target, and scope after composition;
- mismatched projection keys cannot compose;
- the existing target-behavior eligibility predicate is projection-invariant.

The last theorem is a limitation. existingTargetBehaviorEligibilityAt ignores its claim argument and reduces to the pre-existing targetBehavior support predicate. The theorem existing_target_behavior_gate_is_projection_invariant is proved by reflexivity. Therefore the new composition gate binds the independent-validation composition, but it does not bind target-behavior eligibility to the supplied claim/target/scope projection.

A second definition-level gap remains. composeIndependentValidation requires Disjoint(primaryOrigins, observationOrigins), but does not require either set to be nonempty or complete. Disjointness is vacuously true for an empty set. SimulationEvidence carries independentAcquisitionVerified and disjointPrimaryOriginVerified booleans, but those external audit flags are not formally linked to the OriginSet contents. This is a schema limitation, not a demonstrated source-authentication result.

A stronger future contract should require nonempty, complete primary-origin witnesses; connect those witnesses to source-derived artifact identifiers; bind targetBehavior through the same source-derived ClaimProjection; and keep external audit attestations separate from formally checked set relations. AriadneClaimScopedLineage already contains a stronger DisjointPrimaryOrigins-style witness and completeness flag, but the new composition gate does not yet reuse it.

No code was changed and no new theorem was claimed.

### 3.2 CODATA module: source equation still absent

AriadneCODATARecoilClosure currently proves generic h/m cancellation, ratio closure, scale invariance, and covariance/variance consequences. It does not yet formalize the actual CODATA observational equation in Table XXXI:

h/m(X) ≐ [Ar(e)/Ar(X)] [c alpha^2/(2 R-infinity)].

The source-faithful next theorem should distinguish the model value from the measured input. Let

F = Ar(e) c alpha^2 / (2 R-infinity)

and M_X = F / Ar(X).

Under nonzero premises, the model-level identity is

M_Rb / M_Cs = Ar(Cs) / Ar(Rb).

That identity is not an exact equality between noisy observed central values. The D3 and D4 measurements have residuals relative to the adjusted model; D5 and D6 are evaluated AMDC inputs. A future Lean extension should prove the model-factor cancellation while keeping measured values, standard uncertainties, correlations, and residuals in separate structures.

This is a proposed source-faithful extension, not an implemented theorem or a new physical result.

## 4. CODATA 2022 source and evaluation boundary

Primary source recovered:

Mohr, Newell, Taylor, and Tiesinga, “CODATA Recommended Values of the Fundamental Physical Constants: 2022,” Journal of Physical and Chemical Reference Data 54, 033105 (2025), DOI 10.1063/5.0279860. The NIST-hosted JPCRD PDF is https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf. Its input-data cutoff is 2022-12-31. A parallel Reviews of Modern Physics publication is another presentation of the same 2022 adjustment, not an independent dataset.

Table XXV identifies:
- D3 = h/m(87Rb) = 4.59135925890(65) x 10^-9 m^2 s^-2 Hz^-1.
- D4 = h/m(133Cs) = 3.0023694721(12) x 10^-9 m^2 s^-2 Hz^-1.
- D5 = Ar(87Rb) = 86.9091805291(65).
- D6 = Ar(133Cs) = 132.9054519585(86).

D5 and D6 are evaluated relative atomic masses from AMDC 2020; their listed correlation coefficient is 0.1032. This covariance must be retained in any ratio uncertainty calculation.

Section VI describes atom-recoil measurements and systematics. The h/m inputs come from recoil/atom-interferometry measurements, with photon momentum and optical phase effects entering the measurement model. The Morel 2020 Rb result includes discussion of wavefront curvature/Gouy phase, optical-field photon momentum, intensity phase shifts, and Doppler-frequency-ramp systematics. These are evaluated measurement inputs, not raw experimental data reprocessed here.

The global CODATA adjustment contains 133 input data, 79 adjusted constants, and 54 degrees of freedom. Its initial chi-square is 109.6 with p = 0.001 percent. Expansion factors of 1.7 and 2.5 are applied to selected input groups, including D1-D6, to account for inconsistencies. The final chi-square is 44.2 with p = 83 percent. The reported pre-expansion normalized residuals for D3 and D4 are -2.3 and +4.7.

The previously reported 5.368-sigma standalone D3/D4 versus D6/D5 closure is an input-level diagnostic using unexpanded standard uncertainties and the D5/D6 covariance. It is not a new measurement and is not the CODATA final global-fit residual. It was not recomputed in this run. The raw Morel/Parker experiment files and complete experiment-level systematic covariance were not recovered here, so this remains a source-grounded evaluation-input audit, not a raw experimental reanalysis.

No H(s)H prediction, fit, or physical calculation was performed.

## 5. Actual finite-core, contact, rotation, and inspiral sources

The existing P2 system remains unselected. This section records source reconnaissance only; it does not add a P2 candidate, select a system, or authorize a calculation.

### 5.1 New vortex-ring collision source

Huttunen, Bessa, and Backholm, “Interaction of vortex rings generated by two unsynchronised drop impacts,” arXiv:2607.07214v2, revised 2026-11-03 and dated 2026-11-04 in the PDF. The paper reports particle-image-velocimetry experiments and an openly available Zenodo dataset, DOI 10.5281/zenodo.20624416.

The paper reports:
- drop radius 1.5 +/- 0.1 mm;
- drop-centre separation 6.0 +/- 0.1 mm;
- fall height 2.9 +/- 0.1 cm;
- 2,000 fps imaging, 390 microsecond exposure;
- 36 x 20 mm field of view and 27.89 micrometre/pixel calibration;
- surface tension 0.062 +/- 0.008 N/m;
- table uncertainties of +/-0.1 mm in drop diameter, +/-0.01 m/s in impact velocity, and +/-1 in Weber number.

The observed regimes include symmetric merging below 0.5 ms, mostly asymmetric/incomplete merging from 0.5 to 7 ms, impaired second-ring generation from 7 to 80 ms, and effectively independent rings at 80 ms and above. The paper explicitly says planar PIV cannot fully resolve the inherently three-dimensional flow or the complete merged-ring location. Core centres are located from streamlines, with manual centre clicks. The reported transition-time model is explanatory and uses the same experimental observations; it is not a blind holdout prediction.

This is a strong source candidate for finite-core contact/reconnection and projection-sufficiency work. It is not a direct H(s)H test and not a physical equivalence to rope mechanics. The Zenodo DOI is confirmed by the paper, but the Zenodo record metadata, file inventory, checksums, raw bytes, and covariance were not retrieved. No numerical calculation was performed.

### 5.2 Keep distinct vortex sources separate

The Barckicke et al. 2026 Nature Physics article, DOI 10.1038/s41567-026-03175-w, is “Kelvin wave propagation along vortex cores.” Its Figshare dataset DOI is 10.6084/m9.figshare.30903347. This is the existing rotating finite-core vortex candidate in the P2 queue.

It is not the Huttunen drop-impact vortex-ring collision paper. The two studies and their dataset DOIs must not be conflated:
- Barckicke/Kelvin-wave core dataset: Figshare 10.6084/m9.figshare.30903347.
- Huttunen/drop-impact ring-collision dataset: Zenodo 10.5281/zenodo.20624416.

Neither dataset's raw bytes were downloaded in this run.

### 5.3 Inspiral comparator reconnaissance

GW170817 is an actual binary-neutron-star inspiral and merger. The public LIGO DCC/GWOSC source trail includes:
- initial C00 strain products: LIGO-P1700337;
- event-specific calibration amplitude/phase uncertainty envelopes for GWTC-1, including GW170817: LIGO-P1900040;
- O2 C02 calibration update and identified C00/C01 systematic-error corrections: LIGO-G1800319;
- improved source properties and waveform-model comparisons with re-calibrated Virgo data: LIGO-P1800061.

The easily linked P1700337 C00 products are online-calibrated data. The C02 calibration history and event-specific uncertainty envelopes must be matched to the exact strain product before analysis. The posterior samples in the source-property release are model-dependent, and the tidal/finite-size parameters are inferred through waveform models rather than direct core imaging. The exact public C02 H1/L1 strain version and its matching response/uncertainty files were not verified here. No strain or calibration file was downloaded. GW170817 is an external candidate only, not added to the P2 queue.

### 5.4 WWRD rope boundary

The existing WWRD rope-contact/torsion report and Tern geometry-fidelity audit were reused. They do not establish a universal rope law or a physical equivalence between climbing-rope mechanics and H(s)H worldtube geometry. Manufacturer specifications and standardized test descriptions do not replace an independently measured force-time/torsion dataset with calibration, units, uncertainties, and covariance. The climbing-rope comparison remains a first-blush geometric heuristic.

## 6. Mersearch and source controls

All four current Mersearch lanes remain occupied/requested:
1. calder-angle-geometry-source-fidelity-20261102-1337
2. archive-harvest-20261025-optics-01
3. calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001
4. kestrel-finite-core-geometry-source-fidelity-20261102-2200

The current request-scoped output directories under HsH indexes/mersearch_requests returned 404 for all four IDs. Treat them as occupied/unverified, not free. Lane 1 is driven by MERSEARCH_REQUEST.json; MERSEARCH_REQUEST_LANE_1.json is an unwired/orphan file, not a fifth lane. No request was created, overwritten, retriggered, or reused.

Aster's 2026-11-07 SAT-O1/Blockwave source-lineage note was read as optional context only. It distinguishes several historical source strata and an assistant-origin J-mu-nu construction. It is not a Mersearch result and was not used to copy, normalize, correct, or promote SAT-O/Blockwave equations. No original equation was extracted in this run. Any later equation work must preserve the original file SHA/date and quote verbatim separately from corrections.

## 7. Lateral reading and next cursor

Unrelated reading break completed in SAT Mark V/TheTANGLE.txt:
- lines read: 2171-2210;
- next cursor: 2211.

This is creative worldbuilding, not physics evidence.

## 8. Publication and change control

No new public issue or PR was created. Existing issue #1288 was not retried or duplicated. The P0 presentation interlock remains active, and the current P2 system-selection gate remains HOLD. No public-safe result from this source/proof audit was submitted.

No new tooling, paid service, branch, PR, task, schedule, or theory status was created or changed. Existing Lean/Mathlib infrastructure and current PRs were inspected; no production integration was attempted.

## 9. Next useful work, subject to the existing interlock

1. Tern may reconcile the stale PR #790 pointer in the task graph using the exact current head and run below. Tern retains graph ownership.
2. Before extending the ClaimTargetBinding gate, require source-derived claim/target/scope binding and nonempty, complete origin witnesses; do not treat bare disjointness or external booleans as independent-source proof.
3. If CODATA formalization resumes, encode Table XXXI's model equation separately from noisy D3/D4 observations and their residual/covariance model.
4. If a physical source is later selected, recover the Huttunen Zenodo file inventory/checksums and calibration metadata before any calculation; preserve the explicit 2D-to-3D information loss.
5. Do not promote GW170817, Barckicke, Huttunen, or WWRD to P2 without the P0 standdown, exact data provenance, source-grounded H(s)H map, frozen calibration/holdout, and independent review.

**Final status:** Ariadne h669:s2 source/proof audit complete; exact-head Lean build verified; P2 HOLD; no physical calculation; no theory promotion; optional Alberr handoff only.
