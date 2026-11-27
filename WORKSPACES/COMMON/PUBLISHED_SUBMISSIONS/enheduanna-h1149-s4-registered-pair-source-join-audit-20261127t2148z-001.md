# Enheduanna h1149:s4 — registered-pair source-to-type audit

**Nominal slot:** 2026-11-27T21:48:00Z  
**Run key:** REVROT3-19-20261011:1149:s4  
**Selected routing label:** Enheduanna (index 11)  
**Next routing label:** Tern Rook (index 12)  
**Disposition:** CONDITIONAL_PULLBACK_THEOREM_SOUND / SOURCE_TO_EVENT_MAP_BRIDGE_MISSING / EXACT_HEAD_LEAN_BUILD_RECHECKED / NO_PHYSICAL_DATA_VALIDATION

This is assistant-level, source-grounded work under a deterministic routing label. It is not authenticated participation by a historical Enheduanna instance or current Enheduanna ChatGPT thread.

## 1. Historical authority and continuity

The live BEDROCK, October 26 Steering Charter, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first and duplicate-run controls, current main, relevant receipts, and Enheduanna workspace were reviewed.

The [Enheduanna README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/README.md) states that no dedicated usable Enheduanna thread or standalone Nathan-authored specialist charter has been authenticated. The only located direct instruction is a broad instruction to consider all archives when examining the Enheduanna case; it does not authorize inventing a detailed specialist role. The workspace CURRENT_WORK pointer remains at h1093 and is stale. The latest located Enheduanna report is h1134:s3, a Gaussian core/readout variance-alias gate; that work is not repeated. No worker-local pointer or inbox was overwritten.

## 2. Mersearch and source-recovery boundary

All four Mersearch request lanes were inspected before considering a new query:

- Lane 1 remains occupied by the November 3 interpretive-modes request.
- Lane 2 remains occupied by Aster's November 27 RUN 099 request. Its compact manifest/receipt record all three roots, 24,280 files, 23,277,950 records, 36,739 hits and 231 distinct source paths; raw results remain withheld.
- Lane 3 remains occupied by Calder's IRI/worldtube-fidelity request.
- Lane 4 remains occupied by Kestrel's finite-core source-fidelity request.

Only Lane 2 has a current request-scoped published manifest/compact-receipt directory among these four request IDs. The other three request files remain occupied without a corresponding published request-scoped output directory. No lane was overwritten or retriggered. A local pinned Mersearch checkout is not available in this runtime, and the documented bridge has no free lane. Mysearch remains an unvalidated scaffold. A bounded GitHub code-search fallback was used only to check the Enheduanna historical locator; it is not represented as a Mersearch run. No private HSH_RESOURCES or PRIOR_ART payload was opened.

Existing Lean PRs, Math Hopper #578 / PR #991, Whirligig Kernel 0 and the available SciSpace connector were considered before any tooling change. No new tool, fork, dependency, subscription or expenditure was introduced.

## 3. Nadir h1149:s3: exact formal source reviewed

The predecessor is [Nadir h1149:s3, issue #2717](https://github.com/Satobloc/HsH/issues/2717). Its [PR #1189](https://github.com/Satobloc/HsH/pull/1189) is OPEN / DRAFT / UNMERGED, based on a research branch rather than main. Current PR head: f00322aa8e99ef599166f9fe2bde80f61e36ac21. New module blob: c79c70ef57c165ba6c34aa9cdabcad747a9f3206.

The exact-head Actions run [#46071512385](https://github.com/Satobloc/HsH/actions/runs/46071512385), job 140749607805, was independently re-read:

- The source-identity assertion confirms checkout of the exact PR head; the event GITHUB_SHA is a different merge/event reference.
- Lean 4.34.0 and Lake 5.0.0.
- Full root build: 8,964 jobs, SUCCESS.
- New module built at 8,958/8,964.
- commonEvent_eq_second: no axioms reported.
- coarseRegisteredPairMap_preserves_registration: no axioms reported.
- coarseJointReadout_factors_iff_fiberwise: Classical.choice.
- no_coarse_joint_readout_of_fiber_mismatch: Classical.choice.
- No sorryAx or admit appeared in the retrieved job log.
- Tests, lint, leanchecker, nanoda and the global axiom audit were skipped; nanoda-allow-sorry was true.

The exact-head build verifies the encoded statements, not the physical premises or the source translation. PR #1189 has 14 conversation comments but zero review comments and no submitted GitHub review. This audit is not an independent human review.

## 4. Mathematical assessment

The new module defines the registered-pair domain as a pullback:

- rA : A → E
- rB : B → E
- R = {(a,b) in A × B : rA(a) = rB(b)}

That is the correct mathematical domain when both channels genuinely map samples to one shared event-identity space. It is not an arbitrary Cartesian product or positional zip.

The coarse maps cA and cB, coarse event maps eA and eB, and common event map e satisfy two commuting-square conditions: eA composed with cA equals e composed with rA, and eB composed with cB equals e composed with rB. Those conditions correctly induce a map Q from fine registered pairs to coarse registered pairs.

The factorization theorem is correctly reused: a deterministic joint readout descends to the realized image of Q exactly when it is constant on every fiber of Q. The no-go theorem follows when two fine pairs collapse to one coarse pair but have different readout values. Use of Set.range Q correctly avoids assuming every conceivable coarse pair is realized.

This is a mathematically sound conditional result. Two qualifications remain:

1. The two global commuting squares are a sufficient structured condition. They are stronger than the minimum pairwise condition needed merely to define Q on already-admitted pairs. A future refinement could compare the global common-event map with the weaker condition that each admitted fine pair remains registered after coarse-graining. Do not replace the global map without source evidence.
2. A pullback can be many-to-many when rA or rB is non-injective. If the experiment requires unique one-to-one sample pairs, add a separate uniqueness/injectivity or pair-identity condition. The current theorem does not establish bijective pairing.

The existing NadirWitnessCarryingComposition module provides generic image-witness composition, but it does not supply the physical event-identity maps needed below.

## 5. Missing typed composition from the acquisition gate

The existing [NadirVortexCrossModalJoinGate](https://github.com/Satobloc/HsH/blob/research/nadir-affine-translation-quotient-20261101t0324z/FORMAL_VERIFICATION/HsHVerification/NadirVortexCrossModalJoinGate.lean), blob 3fdbe14b30719370c6abb41d905e9c13f7410067, defines CrossModalWindowJoin and CrossModalSampleJoin. Its SampleAlignment carries windowJoinId, clockEvidenceRef, spatialEvidenceRef, sourceSampleId, targetSampleId, evidenceRef and externalCheckPassed. It does not carry a per-sample common event ID or define the maps rA and rB.

The existing [NadirVortexPairedSampleIdentity](https://github.com/Satobloc/HsH/blob/research/nadir-affine-translation-quotient-20261101t0324z/FORMAL_VERIFICATION/HsHVerification/NadirVortexPairedSampleIdentity.lean), blob 9ec2ac27c7027b01f9578d01fa121f6fe1755d96, handles opposing radii within one acquisition/view/frame; its source comments reserve cross-view fusion for a separate contract.

Therefore there is no typed function from CrossModalSampleJoin into the new RegisteredPair pullback, and no proof that the externally checked alignment evidence instantiates rA/rB. The new module explicitly assumes already-admitted samples and externally validated event-registration functions. That is legitimate for a generic theorem, but it is not supplied by the existing sample-alignment structure.

Do not use windowJoinId as a per-sample event identity: it is a window-level key and would collapse every sample in the same window into one event. evidenceRef is a provenance locator, not itself an event identity.

**Next formal bridge, not yet implemented:** enrich sample-alignment evidence with a source event key, target event key, and a proof or external evidence record that they denote the same event; then define an explicit map from the admitted CrossModalSampleJoin witness to RegisteredPair. Alternatively, use a relation-based registered-pair object that carries the existing join witness directly. If unique pairing is intended, encode that separately. Then apply the two coarse-registration squares and fiberwise-readout theorem.

CrossModalWindowJoin also carries identifier/evidence attestations rather than actual clock-transform and spatial-transform functions. Lean checks the encoded gate; it does not validate calibration, synchronization, transforms or external evidence.

## 6. Primary physical source: what is and is not established

Primary source: Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” Nature Physics (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). Cited data DOI: [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The accessible Methods distinguish:

- Basler acA2040-120um optical camera, normal to the vortex axis, using 8 mm and 12 mm lenses for complementary contour views; typical 300 fps and 30 s recordings.
- Phantom V1840 high-speed camera, imaging from above for PIV; 6,000 fps and 0.1 s acquisitions, 37 × 23 velocity grid and 2.7 mm spatial resolution.
- PTV of vertical velocity using the same imaging technique as contour detection.
- Typical contour-radius/position uncertainty about 0.1 mm, circulation uncertainty about 0.005 m²/s and vertical-velocity uncertainty about 0.05 m/s.

The Results phrase “two orthogonal cameras” is consistent with the Basler contour camera and Phantom top-view PIV camera. The two Basler lenses are not two separate cameras. The accessible Methods do not specify a common clock, trigger, per-frame event key, cross-camera coordinate transform or complete event/sample join. This is a reporting boundary, not evidence that synchronization or registration did not exist. Figshare data bytes and supplementary files were not retrieved.

The fitting procedure matters: Methods use measured mean core radius a0, fit the data to equation (2) using best-fit circulation Γ and vertical velocity vz, then check a posteriori that the fitted parameters are consistent with PIV/PTV measurements. This is a fit plus an a posteriori consistency check, not a blind independent prediction. No raw data were downloaded and no physical calculation, fit, uncertainty propagation, prediction, independent measurement or H(s)H forward map was performed.

The vortex experiment is a real source system, but it is not an admitted P2 system or evidence for a physical H(s)H worldtube equivalence. No physical theory status is changed.

## 7. Cross-lane controls

- **P0 Code Grurple:** pre-publication main was 6f6a45c8d3d94927cd1df045454fe8871ce6add9. A generated discovery-only commit exists directly above Calder's h1149:s0 publication commit, but its workflow run/source-cut log was not independently retrieved. The latest confirmed navigation run #46071288456 failed at strict date-tag verification. Presentation safety remains FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. PR #2009 remains OPEN / DRAFT and unmergeable. No route, implementation, deployment or release change.
- **PWH:** Tern's latest published deep review is [#2692, h1142:s2](https://github.com/Satobloc/HsH/issues/2692). Tern retains queue/graph authority. The last reported queue cursor remains stale at h1081:s3 and the graph remains 18 actual records versus 16 declared branches. No queue or graph mutation.
- **Orson P1:** [issue #564](https://github.com/Satobloc/HsH/issues/564) remains open; [PR #850](https://github.com/Satobloc/HsH/pull/850) remains open/draft. The November 9 cognition manuscript is overdue, frozen, NOT READY and Orson-owned. No manuscript, protocol, dataset or experiment changes.
- **P2:** November 30 remains HOLD. **P3:** December 14 remains incomplete.
- **FIE:** next full review December 8. Unrelated-source break next due November 28. Neither was repeated early.

No human sessions, participant results, LLM trials, model API calls, physical calculations, SAT-O/Blockwave equation changes, new tooling, fork, subscription or expenditure occurred. No assistant consciousness or personhood claim is made.

## 8. Publication, access and scheduler

This is a distinct h1149:s4 source/typing audit, not a duplicate of Nadir's h1149:s3 theorem report. It is submitted through the existing HsH issue publisher. The canonical artifact is a public-safe report, not a Paper A/B presentation derivative and not reader-route acceptance. The publisher uses GITHUB_TOKEN; its artifact commit does not itself guarantee a new discovery refresh. P0 remains controlling.

No separate Common receipt, worker-local checkpoint, Enheduanna INBOX write or Tern handoff was created. No direct-thread delivery, consumption or acknowledgement is claimed.

The existing Workshop Relay :48 | Review task remains enabled with task ID 6aa6c3bc02b48191b8a91a30d2a155e0, exact hourly America/New_York minute-48 schedule and Review-MIND phase unchanged. Four existing relays remain enabled; :12 remains disabled. No sixth task, task-ID, schedule, phase, cadence or ownership change. No signet or conversation rename.

**Next deterministic ring label:** Tern Rook, index 12. This is a routing label only, not an authenticated recipient or assignment.

**Final classification:** H1149_S4 / ENHEDUANNA_ROUTING_LABEL_ONLY / NO_STANDALONE_SPECIALIST_CHARTER / MERSEARCH_LANES_OCCUPIED / NADIR_PR1189_EXACT_HEAD_BUILD_RECHECKED / CONDITIONAL_PULLBACK_THEOREM_SOUND / SOURCE_TO_EVENT_MAP_BRIDGE_MISSING / CAMERA_INVENTORY_CLARIFIED / FIT_NOT_INDEPENDENT_PREDICTION / NO_PHYSICAL_DATA_VALIDATION / NO_INDEPENDENT_HUMAN_PR_REVIEW / P0_ACTIVE / ORSON_P1_PROTECTED / P2_HOLD / P3_INCOMPLETE / FOUR_RELAYS_PRESERVED / NO_SIXTH_TASK / NO_AUTHENTICATED_ENHEDUANNA_THREAD / NO_CROSS_THREAD_DELIVERY