# Kestrel h941:s2 | Three boundaries of evidence transport

**Run key:** REVROT3-19-20261011:941:s2  
**Nominal slot:** 2026-11-19 05:24 UTC  
**Selection:** h=941; seq=5h+2=4707; 4707 mod 19 = 14, Kestrel. Next: Meridian, index 15.  
**Attribution:** source-grounded assistant reconstruction. No authenticated current Kestrel thread, historical-instance participation, or cross-thread delivery is claimed.  
**Disposition:** P0 ACTIVE / P2 HOLD / NO PHYSICAL RESULT / NO THEORY PROMOTION.

## Executive synthesis

The current project has three different boundaries at which information or identity can be lost:

1. **Representational boundary:** a physical/geometric state is mapped to an instrument readout.
2. **Temporal-provenance boundary:** events and outputs are associated with one particular producer execution.
3. **Presentation boundary:** repository records are projected into a public discovery and reader surface.

They are structurally comparable as evidence-transport problems, but they are not the same mathematical map and are not physical equivalents. Each needs its own explicit contract and witness. A successful theorem, a timestamp ordering, a public reader target, or a matching digest proves only the property actually checked.

The central design rule is: **preserve the identity and distinctions required by the downstream claim, or state exactly which distinctions have been collapsed and what cannot be recovered.**

## 1. Kestrel source and remit

The historical Kestrel source is the raw conversation titled “Science Made Stupid,” conversation ID 6ab070ce-2384-83e9-b76f-4661c55867c4, blob 100267f3f11f3cce09c7d802ce85ad03879d5744. The recovered user-role source messages support a cross-boundary synthesis role, trust-first reasoning with Nathan, and verification when a consequential decision depends on it. They do not establish a standalone signed specialist charter. User-role attribution is not by itself proof of sole Nathan authorship.

Kestrel is not the primary P0 auditor, P2 data-acquisition owner, or sole mathematical-verification authority. This report synthesizes existing work by the relevant lanes rather than taking over their ownership.

### Historical geometry boundary

The SAT archive’s FINDING THE DONUT (nolat).pdf has source SHA-256 63b884c150954cd0f4eee5de55aef9db0c2c54d24fb7e972d61e26cae91a5dae; its extracted text is blob a788b5cc415f90de2d0382d3596ef07d68604687. Pages 24–27 describe an exploratory sphere/torus construction involving projected curves, a crossbar and a 3D toy version.

A later user-role clarification in the Meridian Minkowski Ring Analysis export, conversation 6ad7e9c0-e8a0-83e9-984e-94d020de3abf, message 090f5160-1020-486d-9c42-df3d7dff2063, explicitly characterizes the “corridors” as metaphorical mathematical corridors and says the earlier reciprocal filament/timesheet-deformation model was no longer being used after the Klein Fabric model became common.

Therefore the generic factorization theorem in Kestrel’s existing Lean work must not be treated as an adopted physical construction, as a Nathan Direct equation, or as a reason to revive the superseded reciprocal-deformation picture. The user-supplied “Back hallways” attachment has unresolved embedded authorship and was not used as an authoritative equation source.

## 2. Representational boundary: projection, fibers and readout

Existing Kestrel PR #873 contains KestrelProjectedIncidence.lean and KestrelKelvinVortexReadout.lean.

### Actual Lean execution

- Current PR head: 94b6d96c91806a95505260a3c52220f4af294185
- Exact-head Actions run: #44090154878
- Job: #134062868110
- Lean 4.34.0 / Lake 5.0.0
- Full root build: 8,956 jobs
- Exact PR-head checkout assertion passed
- Target modules compiled; #eval and theorem-specific #print axioms executed
- Tests, lint, nanoda and the separate global axiom audit were skipped
- No sorryAx or admit appeared in the inspected log

The PR remains OPEN / DRAFT / UNMERGED. GitHub comparison against current main reports 111 commits ahead and 22,416 behind, with merge base e2e738facee0890bdfbbc563e9936db174f63074. This is a successful branch-local build, not current-main integration or theory promotion.

### Formal results already available

The existing module proves conditional statements including:

- A non-injective readout can make distinct source states appear identical.
- A downstream readout cannot recover a pair already collapsed by an upstream map.
- A joint readout is injective if its component readouts collectively separate every distinct admissible pair.
- A downstream map factors through an upstream map exactly when it is constant on each fiber of the upstream map.
- A geometry sensitivity direction is locally absorbable by nuisance variation when its Jacobian range is contained in the nuisance range; if it is not contained, a separating first-order direction exists.

These are mathematical results about the formalized maps and finite-dimensional linear algebra. They do not supply the H(s)H physical map, actual Jacobians, instrument calibration, covariance, or an empirical discriminator. The factorization result is a generic map theorem, not an adopted “back hallway” physical equivalence.

The theorem downstream_readout_cannot_restore_coarse_collapsed_pair has no axiom dependencies in the recorded theorem-specific output. Other results use standard Lean dependencies such as propext, Classical.choice and Quot.sound.

### Kelvin-vortex readout connection

The existing KestrelKelvinVortexReadout module transcribes the Nature Physics 2026 two-opposing-contour operator:

\[
\eta=(r_0-r_\pi)/2,\qquad a=(r_0+r_\pi)/2
\]

with inverse:

\[
r_0=a+\eta,\qquad r_\pi=a-\eta.
\]

The paired transformation is algebraically invertible. A single opposing radius cannot identify both displacement and mean radius. This is a useful source-grounded example of the distinction between a joint readout and a one-channel projection.

The two derived quantities are transformations of the same two contour samples, not independent acquisitions. The module also converts rounded source-reported values: 60 micrometres/pixel, approximately 0.5 mm contour width, approximately 0.1 mm typical core-position/radius uncertainty, PIV circulation uncertainty approximately 0.005 m²/s, and PTV vertical-velocity uncertainty approximately 0.05 m/s. Those conversions are not exact error distributions or covariance estimates.

The module carefully separates the Nature Physics campaign from the later PRL turbulence paper. The latter’s m=2 flattening and the two-antipodal-profile displacement channel form an unresolved mode/readout seam. This may reflect additional image processing, nonlinear coupling or a different inference path; it is not evidence of experimental error. Do not assign m=2 from the displacement spectrum alone without the raw contour pipeline.

The Nature Figshare DOI 10.6084/m9.figshare.30903347 remains a locator, not acquired raw data. The PRL paper states that its data and software are not publicly available. No raw frames, calibration lineage, paired covariance, acquisition identifiers or independent holdout were acquired in this run.

**Measurement-design consequence:** complementary channels can recover distinctions only if their combined map actually separates the admissible states. That condition must be tested on the real calibrated acquisition. The existence of several files, spectra, derived statistics or detector channels does not itself establish independent acquisitions or joint injectivity.

## 3. Temporal-provenance boundary: ordering is not identity

Existing PR #2032 contains AldusTemporalProvenance.lean and ProducerQuiescence.lean.

### Actual Lean execution

- Current PR head: 472d84b99c8c7385100a943a435de25f80afbe89
- Exact-head Actions run: #44461116185
- Job: #135347840123
- Lean 4.34.0 / Lake 5.0.0
- Full root build: 8,952 jobs
- Exact PR-head checkout assertion passed
- AldusTemporalProvenance and ProducerQuiescence compiled
- Tests, lint, nanoda and the separate global axiom audit were skipped

The PR remains OPEN / DRAFT / UNMERGED. GitHub comparison against current main reports 73 commits ahead and 22,416 behind, with the same old merge base e2e738.... This is a successful exact-head branch build, not current-main integration.

The formal theorem establishes conditional interval ordering, for example producer completion before prediction sealing and prediction sealing before holdout unblinding imply producer completion before unblinding. It does not establish that those intervals came from the same provider execution.

The current TemporalEvidence record has subject, actor, comparison, event kind, event time, observation time, source ID/blob/location, clock domain, precision and authority fields. It has no adopted sourceRunId or attempt identity. ChronologyBoundP2Bundle carries prediction sealing and holdout unblinding, but not producer-run start and completion records. The theorem accepts already-constructed intervals rather than joining source-bound events.

The h937 Kestrel ProducerEventJoin / source-run witness remains a proposal, not an adopted schema. The missing step is an identity-bearing join from one exact producer run/attempt to its start, completion, output digest, prediction seal and holdout event. No schema change was made here.

## 4. Presentation boundary: discovery is not reader acceptance

Current HsH main at the final source read was 8aec0dcc598928163311557dae30d1c913de39a1. The generated discovery index blob is dd3d1e18c7615464cca0afd51644684948fc8bba, updated 2026-11-19 05:26 UTC and based on HsH source commit 8652e1d875865c93d0b9890d592e66d55f827ea5.

The complete parsed snapshot contains:

| Measure | Count |
|---|---:|
| All discovery documents | 16,097 |
| Workspace records | 9,165 |
| Workspace records with raw reader targets | 9,165 |
| Workspace records with excerpts | 8,938 |
| Rolling docket entries | 48 |
| Excerpt decoding errors | 6 |

The JSON itself contains the excerpts and reader-target metadata. This is a source-level discovery/presentation-policy mismatch. It is not proof that a live reader route successfully rendered or exposed every target; live route resolution remains NOT OBSERVED.

The controlling PUBLIC_SITE/PRESENTATION_GATE.md says that without a presentation derivative the public state should be presentation-pending or omitted, and raw source is secondary. The active Code Grurple roster keeps P0 ACTIVE until both accepted/reviewed papers pass their actual reader-route checks.

PR #2009 remains OPEN / DRAFT / UNMERGED. Against current main, GitHub comparison reports 3 commits ahead and 452 behind; merge base d47be7.... No exact-head Actions run or formal review was found. Its earlier local-test claims are not an exact-current-head CI result. No merge, rebase, deployment, route probe, manuscript edit or standdown was performed. Tern and the designated P0 owners retain this repair.

## 5. Cross-boundary synthesis

The three failure modes are distinct:

| Boundary | Failure mode | Required witness |
|---|---|---|
| Geometry to readout | Collapse: distinct states share one output | Explicit map, domain, fibers, calibrated complementary channels and nuisance-response conditions |
| Producer to evidence | Orphaning: ordered events are not bound to one execution | Exact run/attempt identity joined to event records and output digest |
| Repository to reader | Overprojection: workspace records receive raw reader targets/excerpts without the required presentation state | Explicit allowlist and source-layer reader/excerpt policy |

A content digest proves byte identity, not authorship, model validity or physical truth. A Lean build proves the formalized statement, not the soundness of translating a source claim into that statement. A reader target proves that a target was generated, not that the intended presentation derivative passed live acceptance.

The common design principle is therefore not “make everything transparent” or “use one universal projection.” It is to expose the right information while preserving the identities and distinctions required by each downstream decision. Operational transparency, interpretive transparency, physical observability, temporal provenance and public presentation remain separate dimensions.

## 6. Lane 24 and campaign disposition

P2 issue #565 and matrix #1855 remain candidate-only / HOLD. No system was selected. No raw dataset bytes, versioned file inventory, calibration, covariance or holdout were acquired. The source-grounded H(s)H maps Φ, Π, G_HsH, time correspondence, metric pullback, slice map and instrument readout O remain uninstantiated for a selected system.

For the air-water Kelvin-vortex candidate, the next evidence gate remains the versioned raw contour/frame package, acquisition/run identifiers, calibration and paired-channel covariance, plus an independent acquisition-block holdout. Resolve the m=1 versus m=0,2,3 assignment against the actual two-antipodal-profile operator and full contour pipeline. Do not infer independence from derived channels or separate papers from the same group.

No physical calculation, fit, prediction, CODATA comparison, independent measurement, Factory Floor admission, paper-gate advancement or theory promotion occurred. No new geometry was plotted because no P2 system has passed selection and observation-map gates.

## 7. Navigation and controls

- Mersearch is not exposed as a callable tool in this runtime. All four canonical request files currently say requested; each corresponding request-scoped RUN_MANIFEST and SEARCH_RECEIPT path returned 404. No lane was overwritten or retriggered. GitHub source retrieval was used only as a documented fallback, not reported as a Mersearch run.
- The HsH, SAT archive and HSH_RESOURCES root documentation were read. No HSH_RESOURCES private payload was opened.
- Existing Math Hopper, Whirligig and formalization infrastructure were checked. No new tool, fork, dependency, subscription or cost was introduced. SciSpace is available but was not needed for this internal synthesis.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 remains HOLD. P3 remains INCOMPLETE.
- Task graph remains ACTIVE_SEED with 16 declared branches and 18 records, last updated 2026-11-17; discrepancy unresolved.
- FIE last full review November 10, next due November 24. The Kestrel unrelated-reading cursor remains 2200; the five-activation reading quantum is not yet due.
- The existing :24 task remains enabled with its exact hourly America/New_York schedule, :24 phase and prompt unchanged. No task, ID, cadence, phase, signet or conversation name was changed. No sixth task was created.

**Next safe work:** P0 owners reconcile PR #2009 against current main and obtain exact-head CI; P2 owners acquire the real versioned data and complete the observation map; temporal-provenance owners adopt a source-run identity join before extending the chronology proof. Kestrel makes no ownership transfer or theory claim.
