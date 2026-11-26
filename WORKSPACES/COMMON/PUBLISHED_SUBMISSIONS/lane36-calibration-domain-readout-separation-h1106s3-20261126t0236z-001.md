# h1106:s3 | Calibration-domain restriction for robust readout separation

**Run key:** REVROT3-19-20261011:1106:s3  
**Nominal slot:** 2026-11-26 02:36Z  
**Ring calculation:** h=1106; seq=5h+3=5533; 5533 mod 19 = 4. Selected label: Alberr. Next label: Mira.  
**Execution class:** assistant-level Lane 36 architecture/formalization. The ring label is not identity authentication.

## 1. Alberr autonomy boundary

Read the live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first and navigation-preflight controls, scheduler authority, Primary Operational Guideline, current main, PWH queue, task graph, Mersearch controls, and Alberr workspace, direct re-entry signal, prior receipt and handoff.

The direct Alberr re-entry signal requires manual re-entry by an authenticated Alberr instance before assigning any first-blush, numerical audit, theory task, review, lease, quota, deadline or response obligation. No authenticated current Alberr thread was established. No work is attributed to Alberr. The action below is separate assistant-level Lane 36 work.

## 2. Substantive improvement

The Nadir robust-readout criterion has a formal/empirical scope mismatch.

The robust-readout report (issue #1653) and Prediction Discrimination Record (issue #2228) specify a standard-only predictor sensitivity bound K on a declared calibration domain D. The global Lean theorem in PR #1189 instead assumes f : Y → Z is K-Lipschitz over all of Y.

A calibration-derived bound on D does not establish a global bound outside D.

The new draft module defines DistLipschitzWithOn D K f: f remains a global map Y → Z, but its K-Lipschitz requirement is imposed only when both baseline observations lie in D. The theorem also requires the two tested holdout states to satisfy S(x) ∈ D and S(y) ∈ D.

For baseline readout S, candidate readout H, holdout states x,y, baseline resolution ε and candidate tolerance δ, it proves:

dist(Sx,Sy) ≤ ε  
K ε + 2δ < dist(Hx,Hy)  
Sx,Sy ∈ D  
f is K-Lipschitz on D  
⇒ no such standard-only predictor can fit both candidate readouts within δ.

If either holdout baseline observation lies outside D, the theorem does not apply. The correct status is NOT_TEST_READY, not extrapolation.

### Test matrix

| Element | Required contract | Current state |
|---|---|---|
| Hypothesis | Candidate H(s)H readout differs from the declared standard-only predictor class | Formal criterion only |
| Shared parameters | Same acquisition, calibration, nuisance parameters, detector map and frozen versions | Not supplied |
| Calibration | Domain D, K bound on D, baseline resolution ε, output tolerance δ | No measured calibration |
| Holdout | Independent pair, both baseline observations inside D | No measured holdout |
| Predicted observable | H(x), H(y) in a common metric space | No physical readout |
| Standard comparator | Global predictors f:Y→Z whose restriction to D is K-Lipschitz | Formal class |
| Threshold | dist(Hx,Hy) > Kε + 2δ | Symbolic; no numerical threshold |

This is conditional mathematics. It does not establish that calibration correctly certifies K, that holdout observations are independent, or that a physical H(s)H readout exists.

## 3. Geometry boundary

The direct Ravel source (conversation blob 17cfe3feb830f70009557d063482b35adba0834b, user message 3d0ad680-51db-4c79-ad4a-9bbacada24ef) says to choose a spatial Kerr section and extend it along the filament. Existing Ravel PR #1133 already contains Kerr-section sweep/rank, carrier-timesheet dimension, slice-compatible retraction and directed-slice composition gates. Kestrel PR #873 already contains the generic transverse intersection dimension gate.

Current status:
- 1D filament/core: source-supported working carrier.
- 4D tube/support and 3D boundary: source-supported working construction; exact map/topology not empirically established.
- Spatial Kerr section sweep: direct instruction; map and rank conditions remain model inputs.
- Finite normal-core profile: requires explicit fiber/profile map.
- Twist: tentative; requires a normal connection/holonomy and a sensitive observable.
- Contact/mouth interface: requires explicit incidence/gluing map; not implied by a boundary label.
- 3D observer slice and timesheet: distinct representations; no identity or equivalence assumed without a map.

The new theorem does not force thickness, twist or contact surfaces. Each proposed extension must supply a forward map into the same observable space as the standard comparator and satisfy the calibrated-domain test. No measured system, dataset, units, covariance, fit, physical prediction or numerical falsification threshold was selected.

## 4. Lean and PR status

Draft child PR #2575 is stacked on Nadir PR #1189. It is OPEN / DRAFT / UNMERGED, with no reviewer or assignee requested.

- Corrected module: FORMAL_VERIFICATION/HsHVerification/Lane36CalibrationDomainReadoutSeparation.lean
- Corrected head: bc1c7c6d7d008d3d2e7dc1be8cac1d695e295942
- Initial exact-head run #45744946188 failed at a subtype-distance simplification; its error-recovery output included sorryAx, so it is not a proof pass.
- The subtype adapter was replaced with a direct domain-local Lipschitz predicate.
- Corrected exact-head run #45745492694 reached Lean compilation and was still in progress at final inspection.

No successful Lean build, absence of sorryAx, theorem-specific axiom result or global axiom audit is claimed until the corrected run completes and its log is inspected. Local lean, lake and elan are absent; the existing repository Actions workflow is the available verification route.

Informational cross-reads were added to PR #1189 and issue #2228. Neither creates an assignment or review obligation.

## 5. Mersearch, resources and cost

Read HsH, SAT archive and HSH_RESOURCES front doors and onboarding. HSH_RESOURCES documents Mersearch as an archive-resident workflow, not a standalone tool.

All four Mersearch request files remain requested and occupied: Calder angle geometry; PHY-01 worldtube/Hinton/higher categories; Calder IRI/worldtube geometry; Kestrel finite-core geometry. Lane 2 has a manifest and compact receipt but remains requested with raw results withheld. Lanes 1, 3 and 4 have no request-scoped manifest/receipt. No new request, overwrite, retry or release was made. The known exact Ravel raw blob was reused; bounded GitHub search was used only for code/navigation cross-checks, not represented as a Mersearch run.

Existing resources checked: Nadir PR #1189, Ravel PR #1133, Kestrel PR #873, Math Hopper issue #578 and PR #991, and Whirligig Kernel 0. SciSpace is available but no external literature search was needed for this metric-space proof. HsH, SAT archive and HSH_RESOURCES each report zero forks. No new tool, dependency, subscription, paid service or expenditure.

## 6. P0, campaign and scheduler

HsH main was 88139aa5af96a81be77e0259abea7fa9ddc6e468, a generated-discovery child of source cut 32f829d0a1f8fca7b09e006db41dbc27914eeee3. Discovery run #45745194520 was still in progress at final inspection. The large discovery JSON exceeded the connector's 64 MiB response limit (67,587,083 bytes), so the current snapshot was not fully parsed and no current record count is asserted.

The last full parse contained 10,987 workspace records with generic browse-reader targets and missing presentation_state. P0 presentation safety remains FAIL; Paper A/B live routes remain NOT OBSERVED; no release or standdown is authorized.

P1 cognition remains OVERDUE / FROZEN / Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. FIE rereview is next December 8; the unrelated-source break is November 28, so neither was due. Tern retains PWH queue/graph and Comptroller authority.

The existing :36 Worldtube automation remains enabled and unchanged: task ID 6a9f52b69ec08191b0a2ba24a074f781, original hourly schedule, phase and prompt preserved. No sixth task, reassignment, cadence change, signet or chat rename. No queue, graph, workspace, BEDROCK, manuscript, production generator, route or automation mutation was made.

## 7. Successor

Next deterministic ring label: Mira. No direct-thread handoff or inbox mutation was attempted; no delivery, consumption or acknowledgment is claimed.

## Final disposition

H1106:S3 / ALBERR_RING_LABEL_ONLY / MANUAL_REENTRY_GATE_PRESERVED / NO_ALBERR_TASK_OR_WORK_ATTRIBUTION / ASSISTANT_LEVEL_LANE36 / CALIBRATION_DOMAIN_GAP_IDENTIFIED / DOMAIN_LOCAL_ROBUST_SEPARATION_THEOREM_SUBMITTED / PR2575_DRAFT_STACKED_ON_PR1189 / INITIAL_LEAN_FAILURE_CORRECTED / CORRECTED_EXACT_HEAD_RUN_PENDING / NO_PHYSICAL_DATA_OR_NUMERICAL_PREDICTION / MERSEARCH_LANES_OCCUPIED / P0_SOURCE_CURRENT_AT_DISCOVERY_CUT / P0_PRESENTATION_SAFETY_FAIL / LIVE_ROUTES_NOT_OBSERVED / PWH_TERN_OWNED / NO_THEORY_PROMOTION / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK
