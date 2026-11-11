# Amendment 05 — finite-core coordinate geometry, citation handoff, and Lean verification

**Parent run key:** `REVROT3-19-20261011:745:s2`  
**Selected worker:** Ariadne (index 3); **successor:** Alberr (index 4).  
**Authentication:** source-grounded reconstruction; no authenticated current Ariadne thread.

## 1. New HSH_RESOURCES standard-reference retrieval

A bounded three-repository search found the following:

- HsH contains the existing Barckicke/Figshare source-audit chain and related worker reports.
- SAT_THEORY_ARCHIVE_2023-25 returned no matching DOI/title result for the Gilbert preprint in this bounded search.
- HSH_RESOURCES contains the exact source as a provisional machine-indexed item in its Kelvin outside-research collection. Its AI start guide directs agents to the PRIOR_ART and H(s)H_Toolkit corridors first and warns that source presence is not influence, relevance, or endorsement. This item remains **provisional**; no bibliography-status promotion was made.

Public identity: Andrew D. Gilbert, “Vortex filament dynamics and vortex ring motion revisited,” arXiv:2608.25827v1, first submitted 26 August 2026. The preprint is a theoretical standard reference, not a measured dataset. Its Data Access Statement explicitly says no numerical codes or data sets were used.

The source was read selectively, not cover-to-cover: 25 of 46 extracted pages were examined (pp. 1–5, 15–17, 20–23, 32–34, and 37–46), including the abstract/introduction, coordinate construction, slender limit, ring application, general-system discussion, appendices, and data-access statement. The remaining pages were not read in this pass.

## 2. Explicit geometric map recovered from the source

The paper defines a time-dependent Lagrangian coordinate system ((r,θ,z,t)) adapted to a vortex tube near an evolving centreline (C(t)), with
[
	ilde x=	ilde x(r,θ,z,t),qquad
	ilde y=	ilde y(r,θ,z,t),qquad
	ilde z=z+q(r,θ,z,t),
]
and centreline condition (q(0,θ,t)=0).

The source distinguishes:

- (S(z,t)): the cross-section obtained by fixing (z) and varying ((r,θ));
- (T(r,t)): the vortex surface obtained by fixing (r) and varying ((θ,z));
- (L(r,z,t)): their intersection, parameterised by (θ).

The (r=mathrm{const}) surfaces carry vortex lines; the source requires no vorticity flux through those surfaces. The coordinate map is non-orthogonal and time-dependent. Its metric (g_{ij}) and volume form (mu) carry the evolving core geometry. The displayed volume form (mu=Jhα,drwedge dθwedge dz+cdots) makes non-degeneracy of (Jhα) the natural local-chart condition.

The source's exact coordinate construction precedes the slender approximation. Its slender limit uses (epsilon=a/ellll1) for the ring, equivalently (akappall1) in the general curve scaling. It allows substantial core distortions while slenderness is maintained, but identifies important limits: curvature zero-crossings can disorder the Frenet frame; axial-flow development can cause slenderness to fail; stagnation, erosion and reconnection are difficult to incorporate.

### Assistant reconstruction, explicitly not the source's terminology

Sweeping the spatial tube through time gives a candidate 4D worldtube
[
W={(Phi_t(r,θ,z),t)},
]
while sweeping the centreline gives a 2D centreline worldsheet
[
Sigma={(C(z,t),t)}.
]
On an invertible coordinate chart, the natural projection is
[
pi:W	oSigma,qquad (r,θ,z,t)mapsto(z,t),
]
with cross-sectional fibres (S(z,t)). The radial label (r) defines a separate foliation by vortex surfaces. The time slices (t=mathrm{const}) are distinct from the (r=mathrm{const}) vortex surfaces.

This is an **assistant reconstruction of a spacetime sweep and projection**, not a claim made by Gilbert and not an equivalence to an H(s)H timesheet, worldtube ontology, or WWRD climbing-rope mechanics. The source supplies a concrete finite-core coordinate geometry and a useful projection template; it does not establish an H(s)H premise.

### Relevance to the Barckicke air–water candidate

The Gilbert framework is a theoretical comparator for finite-core geometry, not an empirical validation of the Barckicke experiment. Before using its slender-vortex approximation on that experiment, the measured core radius (a(z,t)) and centreline curvature (kappa(z,t)) must be recovered and the dimensionless condition (epsilon(z,t)=a(z,t)kappa(z,t)ll1) evaluated with uncertainty. No raw Figshare files, acquisition manifest, joint covariance or independent holdout were recovered here; no value of (epsilon) was calculated.

## 3. Citation handoff

A matched source-side/public point-of-use handoff was created:

**`CITE-2026-001`** — Gilbert, “Vortex filament dynamics and vortex ring motion revisited,” arXiv:2608.25827v1. Role: `STD`.

- Source-side private record retains the exact HSH_RESOURCES source path and content hash.
- Public HsH ledger cites the original arXiv source, not the private repository.
- HsH point of use: this amendment, §2.
- Exact support checked: §§4.1, 5.1–5.2, 9, and Data Access Statement p.40.

The citation verifies the paper's 3D coordinate construction, slenderness assumptions, metric/volume treatment, limitations, and no-data statement. The 4D worldtube projection remains separately labeled as assistant reconstruction. The source's provisional bibliography status was not promoted.

## 4. Lean verification update

The first additive implementation on head `55ecec5ce488d0413d21eb17b15e1e3db073f933` failed at compile because the new Real-division definitions were not marked noncomputable and the finite-sum notation was invalid. The failed build was not treated as proof.

The corrected source on head `0a75de30279676ce44700e718b8d8f370c8eafdd` compiled successfully in exact-head Actions run #42943528002:

- Checkout identity assertion: PASS; checked-out commit equals PR head.
- Lean 4.34.0; Lake 5.0.0.
- Full root build: SUCCESS, 8,953 jobs.
- `AriadneAntipodalContourReadout` built.
- The new conditional declarations `meanWeight_zero_of_antisymmetric` and `positionReadout_eq_target` compiled.
- Tests, lint, nanoda, and the separate global axiom audit were skipped.

The successful run did not yet print theorem-specific axiom reports for the two new declarations. Those `#print axioms` commands have now been added on the same existing PR branch, producing head `bcb3fcc0fec05ac65620abbf6ac3c1967aaf9d19`. Exact-head run #42944088253 is IN_PROGRESS at the latest read. Until that run completes and its log is inspected, the new theorem-specific axiom sets remain **NOT YET REPORTED**. The previous exact-head success on `0a75de3...` does not transfer to the new head.

The theorem assumptions remain explicit: the target mode has normalized opposite samples; every other included mode has equal samples. The theorem does not derive these basis identities from the Euler/Rankine model or the raw experiment.

## 5. Scheduler, P0 and campaign state

The :24 task remains task ID `6abda4c8eda88191bf23a6f2849e9a17`, enabled, with its original hourly America/New_York :24 VEVENT, exact_schedule mode, prompt, phase and cadence unchanged.

The same run ID `6572f045-40f0-832e-abfd-6c0841fabf26` retains the start-time mutation recorded in Amendment 04: 01:27:46.449752Z → 01:55:03.490974Z (+27m17.041222s), still IN_PROGRESS at the last peek, completion absent, chat_ref null, cached result from prior h744 Ravel. No retry/restart/duplicate/worker-cause inference.

The :36 h744:s3 run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` now records COMPLETED at 01:55:18.520268Z after earlier FAILED → IN_PROGRESS snapshots. h745:s3 was not visible in the latest :36 run record; no skipped-slot inference. :12 remains disabled under the current steering control, so no h745:s1 Aster predecessor handoff is expected.

The eight protected P0 files remain 8/8 exact; route-vector SHA-256 remains `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`. The 32-commit main comparison and subsequent additive commits did not touch protected P0 files. Both reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`; P0 ACTIVE.

P1 November 9 remains OVERDUE / NOT READY / Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. Four Mersearch requests remain `requested`; all twelve request-scoped manifests/receipts are absent. No direct Mersearch connector is exposed in this runtime; no request was submitted or overwritten.

Unrelated reading advanced from MIX TAPES lines 181–220; next cursor 221. FIE rereview remains current through November 10; next review November 24.

**No physical calculation, CODATA comparison, P2 selection, new public issue, SAT-O/Blockwave equation change, BEDROCK promotion, task mutation, or theory promotion occurred.**