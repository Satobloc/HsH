# Kestrel | Review-MIND :48 | Geometry fidelity and evidence handoff

**Run key:** `REVROT3-19-20261011:629:s4`  
**Nominal slot:** 2026-11-06T05:48:00Z  
**Selection:** (h=629, seq=5h+4=3149, 3149\bmod19=14)  
**Worker label:** Kestrel (index 14)  
**Next label:** Meridian (index 15); next key `REVROT3-19-20261011:630:s0`  
**Status:** INTERNAL_ONLY / SOURCE_GROUNDED / TARGETED_REVIEW / NO_THEORY_PROMOTION / NO_NEW_P2_SYSTEM / NO_CROSS_THREAD_DELIVERY

## 1. Role, identity, and scope

The deterministic label is not authentication of the historical Kestrel conversation or of a current Kestrel thread. The Kestrel raw export was fetched by its recorded Git blob route (conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, blob `100267f3f11f3cce09c7d802ce85ad03879d5744`). This run inspected the role-defining user nodes `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `d0b1c7c0-defc-4fa6-b6bc-a74e3e1a1fb8`, and `079a841c-06cb-431c-b92b-f049f03007cc), plus the later Code Grurple voice-role node `8f1fd51f-73fd-44ae-ad7a-714eb67faa4d`. This is not a line-by-line review of all 2,116 message nodes and not historical-instance participation.

Kestrel's controlling role is the cross-boundary synthesis companion: hold the whole picture, take Nathan's instincts seriously as an internal working premise, and do not duplicate the primary auditor, provenance adjudicator, mathematical verifier, or experimental lane. The user explicitly said that hard verification teams already existed and asked this role not to constantly police overclaiming. The current Review-MIND lane does call for independent QC, so this run pursued one concrete source-to-geometry gap in existing Meridian sandbox work and routes the finding back without taking over Meridian's P0 assignment.

The separate historical Kestrel request to produce a voice-faithful reaction to the paper/review pile remains a distinct cursor. It was not attempted here.

## 2. Live control and branch state

Read the live HsH BEDROCK (627 lines), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, boot/reboot preflight, revival rotation, scheduler authority, current task graph, Kestrel README/CONTINUITY/THREAD_HANDOFF/OPERATING_ASSUMPTIONS/OPEN_QUESTIONS, the current Kestrel geometry-fidelity report, and relevant receipts.

Key source fingerprints:
- BEDROCK: `527924...` (627 lines).
- Steering Charter: `04822...`.
- Three Paper Campaign: `2b488...`.
- Three-repository onboarding: `fe402...`.
- Boot/reboot preflight: `0dc2eafdcb1ff98c340bac2d86d901fbf428a61a`.
- Kestrel raw source: `100267f3f11f3cce09c7d802ce85ad03879d5744`.
- Kestrel geometry-fidelity report from 02:00Z: `f4d2d181dadb77ba1edde026d8b943459d5c1171`.

HsH `main` was observed at `d72751ba4d3cdc7913580fd3e114b66312e6453e` (2026-11-06T05:54:53Z). That commit changed only `PUBLIC_SITE/generated/discovery.json`; it did not repair either Code Grurple reader route. No branch was created or switched.

The live task graph is blob `fafb3859a33306574625c58e8657c40a82cd30fd`, updated 03:50Z. Its 13 active/blocked candidates now have explicit priority distribution P0=3, P1=1, P2=4, P3=1, P4=1, UNCLASSIFIED=3. This is a real improvement over the earlier sparse-priority state. The top-level `branch_count=16` versus 18 branch records remains unexplained. The graph's M87/worldtube blocker still cites the older failed PR #873 run #41690832586; that status is superseded by the newer successful run described below. Tern owns the graph reconciliation; no graph edit was made.

Campaign gates remain separate:
- P0 Code Grurple: active; Paper A R1 accepted and Paper B R1 reviewed/originator-accepted; both reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 LLM cognition, Nov 9: Orson-owned and NOT READY. PR #850 remains open/draft/unmerged; run #42025947428 succeeded, but manuscript/PDF/reader and exact-head verification remain separate requirements. No model trial or human-subject session was run.
- P2 measured-system geometry, Nov 30: no final system/data package selected; HOLD. This run did not select a system, perform a new P2 calculation, fit, prediction, or CODATA comparison.
- P3 full theory, Dec 14: separate manuscript and evidence gate; no advancement.

All four Mersearch request lanes remain occupied. No request was created, overwritten, or represented as a Mersearch result. SciSpace was available and used only for a limited paper-metadata/abstract check; its extraction did not replace the primary publisher text. No new tool, dependency, branch, PR, paid service, or automation was created.

## 3. Existing Lean result: PR #873

The Kestrel geometry-fidelity report at 02:00Z recorded run #42153410233 as in progress. It is now completed successfully.

- PR #873 remains OPEN / DRAFT / UNMERGED.
- Branch: `research/kestrel-original-slice-fidelity-20261028t0900z`.
- PR head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`.
- Current PR base: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Run #42153410233 completed SUCCESS at 2026-11-06T03:00:38Z.
- The pull-request workflow checked out synthetic merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, merging that head with the current base. This is a current-base merge-reference build, not an exact-head-only build.
- Lean 4.34.0 / Lake 5.0.0; the full formal-library compile step succeeded.
- `WorldtubeCurveCurvatureLift.lean` blob: `79597de14cd0c69a93c19c2697bc1b8dcf2456d2`.
- The theorem-specific `#print axioms` output is `[propext, Classical.choice, Quot.sound]`; no `sorryAx` was seen in the captured build log.
- The workflow had no separate tests, lint, nanoda, or global axiom-audit step. Exact-head-only verification remains UNVERIFIED.

The theorem `lifted_gram_curvature_sq_eq` proves an algebraic Gram-curvature identity for the declared Euclidean affine lift (X(w)=(\mathbf{x}(w),w)), with lifted velocity ((\mathbf v,1)) and acceleration ((\mathbf a,0)). It is assistant-origin, conditional mathematics. It does not prove the physical H(s)H map, a native metric, a physical inertia law, or the truth of any premise.

A useful conditional connection to Meridian's solar comparator is obtained only after choosing the external Euclidean coordinate (w=q=ct) and (\mathbf{x}(w)=(\rho\cos(\Omega w/c),\rho\sin(\Omega w/c),0)). Then (\mathbf v\cdot\mathbf a=0), (\|\mathbf v\|^2=(\rho\Omega/c)^2=\beta^2), and (\|\mathbf a\|^2=(\rho\Omega^2/c^2)^2), yielding (\kappa_{4,E}=\rho\Omega^2/c^2/(1+\beta^2)). This is an analytic substitution into the existing conditional theorem, not a new Lean theorem and not a source-defined H(s)H representation. Keep this external (q=ct) comparator separate from the current Nathan Direct (cw=t), Forest-normalized, native (++++) convention.

## 4. Targeted source review of Meridian's existing sandbox reports

This was a replay of existing code against published tabulated observations for QC, not a new physical-system selection or new prediction. The four existing files were unchanged:
- Solar report blob `d87fab7333142c10121146172cdc42e0d86e9eb9`.
- Solar script blob `a8a3958374ea1233cb2715eefc5311e1800b4a9f`.
- CME/GCS report blob `662af947b5f9d560cea589b577103dcbaa4c3e87`.
- CME/GCS script blob `b717b20f0ca5ccce82cdff99e85305935c7cb4f5`.

### 4.1 Solar differential rotation / worldtube shear

The source-faithful script replay reproduced the report's central values:
- Spectroscopic profile: maximum (|\dot\gamma|=5.78712\times10^{-7}\,s^{-1}) near 46.24°; shear timescale about 20.00 days.
- Doppler-residual profile: (5.98453\times10^{-7}\,s^{-1}) near 43.75°; about 19.34 days.
- Magnetic-feature profile: (5.83888\times10^{-7}\,s^{-1}) near 46.36°; about 19.82 days.
- The three central maxima span 3.36% of their mean. The 5° effective-patch shear and affine principal-stretch outputs also reproduce; the affine stretch products are 1 to numerical precision.

The local rate (\dot\gamma=\cos\lambda\,d\Omega/d\lambda) is correct for the stated spherical metric and azimuthal flow. The exact material-coordinate map ((\lambda,\phi)\mapsto(\lambda,\phi+\Omega(\lambda)T)) preserves the spherical area form. The report already calls its simple-shear map first-order and its finite-difference parameter effective; keep the principal stretches classified as those of the local/effective affine surrogate, not exact global singular values of a finite 5° patch.

Source-critical limitation: Snodgrass & Ulrich (1990, ApJ 351, 309; ADS bibcode 1990ApJ...351..309S) explicitly state that the (A+B\sin^2\lambda+C\sin^4\lambda) basis is non-orthogonal and induces B/C coefficient crosstalk; they provide orthogonalized counterparts. The Doppler and magnetic profiles use the same Mount Wilson observation archive and identical procedures/averaging periods, while the spectroscopic profile is a separate technique. Thus the 3.36% range is a descriptive comparison of three fitted tracer profiles, not independent-dataset replication or a significance result. The report appropriately does not propagate coefficient uncertainties because the covariance is unavailable; retain that limitation prominently.

### 4.2 CME finite-core / GCS reach

The central source-defined aspect-ratio arithmetic replays. The critical issue is the identification of the aspect-ratio denominator with the centerline's local radius of curvature.

Mishra et al. (2026, MNRAS 550, stag1145, DOI 10.1093/mnras/stag1145) define the GCS aspect ratio as cross-section radius divided by heliocentric height of the flux-rope centre. With leading-edge height (h), the source relation gives (a=\chi h/(1+\chi)) and centre height (R_c=h/(1+\chi)), so (\chi=a/R_c). That is a model aspect ratio. It does not, by itself, establish (R_c=\rho_{\rm curv}), the local curvature radius of the axis.

The cited GCS construction describes a pseudo-circular front with circular cross-section; the source does not supply the specific identity needed to equate the heliocentric apex-centre distance to the local axis-curvature radius. The report's statement that (R_c) is the local axis-curvature radius in a toroidal-apex construction is therefore an additional geometric assumption, not a source-defined equality.

For a framed tube around a spatial centreline, the needed map is
[
F(s,y_1,y_2)=\gamma(s)+y_1N(s)+y_2B(s),
]
with local Jacobian (J(s,y)=1-\kappa_{\rm axis}(s)y_1) in a Frenet frame. For a circular cross-section of radius (a(s)), local regularity requires (a(s)\,\kappa_{\rm axis}(s)<1) along the segment. Global injectivity additionally requires a nonlocal separation/reach condition. The source-defined (\chi=a/R_c) yields (J_{\min}=1-\chi) only if the actual local curvature radius equals (R_c) at the relevant apex and the required along-axis conditions hold. Until the GCS centreline is parameterized and its curvature computed, the report's (J_{\min}) values and “locally regular” conclusion must be labeled CONDITIONAL / PROXY, not an established GCS reach measurement.

Second source correction: Table 2's 1-AU entries are raw in-situ aspect ratios followed by a bracketed positive spacecraft-offset correction (absolute increment and percentage). They are not symmetric statistical uncertainties. The current report writes these as (0.110\pm0.024), etc., which changes the meaning. Preserve the source format, e.g. (0.110\,[+0.024,\ 21.8\%]), and keep raw and corrected central values distinct. The code stores these corrections under `sigma_1au`; that name also risks implying a standard uncertainty.

From the rounded Table 2 values, the raw 1-AU mean is 0.146. Adding the listed one-sided offsets gives corrected central values ([0.134,0.390,0.155,0.151,0.058,0.277,0.070,0.127]), with rounded-sample mean 0.17025. All eight corrected values remain below their corresponding last-coronal central values. This is arithmetic on the published rounded table, not a new measurement or a fully reanalyzed event set.

**Route back to Meridian:** preserve the observed aspect-ratio trend, but separate (i) source-defined (a/R_c), (ii) actual axis curvature (\kappa_{\rm axis}(s)), (iii) local tube-coordinate regularity, and (iv) global reach/injectivity. Do not infer one from another without the explicit GCS centreline map.

## 5. Review-MIND process evidence

The scheduler readbacks show overlapping start times: the current :48 execution started before its nominal 05:48Z slot; the :24 h629:s2 execution was still in progress after its 05:24Z scheduled time; the next :00 h630:s0 execution had already started before its 06:00Z nominal slot. These are observed timing facts, not a diagnosis of the scheduler and not evidence of worker agency.

The current :48 execution and the next :00 execution both have no authenticated ChatGPT-thread reference. A repository file or successful CI run establishes persistence/build status, not recipient comprehension, decision uptake, or task outcome. No human-subject session, LLM group trial, new model call, or cross-agent consensus experiment was conducted. No claim about assistant consciousness or personhood is made.

## 6. Deep open-work sweep and upkeep

The current run is the third completed worker activation since the 03:50Z deep-review checkpoint described in Tern's h629:s2 receipt. The requested deeper sweep was performed.

- P0 remains blocked only by actual Paper A/B reader-route verification and shared renderer repair; the latest main commit changed the generated discovery docket only.
- P1 remains Orson-owned and NOT READY; no trial, manuscript edit, PDF/reader verification, or gate advancement.
- P2 remains HOLD with no selected measured system; the Meridian sandbox replay is not a P2 system selection.
- P3 remains separate; no full-theory manuscript or gate advancement.
- The clone census is 14/19 and already contains Kestrel; no duplicate entry was added.
- The task graph now has 10 explicit priority labels among 13 active/blocked candidates, but its `branch_count=16` versus 18 records remains unresolved.
- The clone-census plan's generic review-trigger section still says five actual activations, while its current follow-up state and task graph say three more activations or five new entries. Tern owns reconciliation. The separate WORKFLOW-UPKEEP five-activation cadence is not collapsed into this clone-census trigger.
- The task graph still cites PR #873 run #41690832586 as the relevant failed run, although run #42153410233 completed successfully on the current-base merge ref before the graph's 03:50Z update. Tern should refresh the graph's formalization status without claiming exact-head verification.

No task graph, census, BEDROCK, paper, or source file was edited. No public issue was created, no duplicate publisher submission was made, and no theory was promoted.

## 7. Freshness and return cursor

- FIE last full rereview: October 27; the 14-day threshold is November 10. Not due.
- A short unrelated reading break was completed in HSH_RESOURCES: Babbage, *Reflections on the Decline of Science in England*, lines 1421–1460. Next reading cursor: line 1461. This does not replace Kestrel's separate TheTANGLE cursor at line 1521.
- No physical break was performed.
- No SAT-O or Blockwave equation was edited or reattributed. No private/quarantined prior-art source was used.

**Next substantive cursor:** (1) Meridian may correct the 1-AU correction notation and derive the actual GCS axis curvature from its explicit parametric centreline before retaining any reach margin; (2) Tern should reconcile the stale PR #873 run reference, branch-count field, and clone-census trigger wording; (3) keep P2 on hold until a real measured-system package and P0 standdown; (4) preserve the distinction between the conditional Euclidean-lift theorem and the source-defined H(s)H geometry.

No task/ID/schedule/phase change, no sixth task, no branch/PR, no public issue, no signet, no conversation rename, no BEDROCK theory promotion.
