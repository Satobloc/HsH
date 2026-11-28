# Ariadne h1140:s3 — helix projection and slice-resolved observability

**Nominal slot:** 2026-11-27T12:36:00Z  
**Run key:** REVROT3-19-20261011:1140:s3  
**Selected routing label:** Ariadne (index 3)  
**Next routing label:** Alberr (index 4)  
**Disposition:** SOURCE_GROUNDED_GEOMETRY_REFINEMENT / EXACT_HEAD_BUILD_PENDING / NO_MEASURED_SYSTEM / NO_THEORY_PROMOTION

This is assistant-level work under the deterministic Ariadne routing label, not authenticated participation by a historical Ariadne instance or conversation.

## 1. Preflight and source

Read live BEDROCK, Steering Charter, Three Paper Campaign, onboarding, Revival Rotation V3, Mersearch guide, thread-first rule, autonomy/handoff and write-safety standards, current main, Ariadne workspace record, recent receipts, PWH queue, task graph and P0 control.

Ariadne's workspace describes archive/source archaeology, revival/reentry reconstruction and provenance recovery. It explicitly says the README is assistant-maintained guidance, not a signed Nathan-authored charter. No standalone signed specialist charter or authenticated active Ariadne thread was established. Historical archived conversations are not live-thread authentication.

Primary source: Nathan Direct, “DIMENSIONAL GRAVITY,” conversation 252d05c0-22ed-4ea2-a474-7966ab13145a, raw Git blob 2cea1924266418e19b825b95ae51e6b7cbace7e1, 2024-03-22. Relevant user-role messages:
- aaa2269b-7eab-4781-9454-647098d6747f (15:20:20.623Z): a fixed transverse plane meets the helix at one point, not a spiral in the plane.
- aaa20670-fd77-4577-8e31-0a33a9e358c6 (15:23:19.544Z): clarifies the moving-plane setup.
- aaa2d0b1-017d-453e-b95a-b23915f87d32 (15:29:30.774Z): moving the plane makes the intersection trace a circle; rate depends on pitch and plane rate.
- aaa2a1cc-e884-4f6a-800f-8afc29ab221a (15:35:10.461Z): orbit radius is independent of pitch and set by cross-sectional distance from the axis.

Nathan's messages are descriptive, not the equations formalized below. The ideal constant-pitch helix parameterization is an assistant reconstruction already present in NadirHelixSliceGeometry.lean.

## 2. Mersearch status

All four canonical request files were read; all remain occupied and requested:
1. calder-angle-geometry-source-fidelity-20261102-1337
2. aster-run099-carrier-frame-source-genealogy-20261127t0901z-001
3. calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001
4. kestrel-finite-core-geometry-source-fidelity-20261102-2200

No lane was overwritten, released or retriggered; no Mersearch run is claimed. A bounded direct read of the already-identified HsH raw export was used instead; this is not exhaustive three-repository coverage.

## 3. Substantive improvement: explicit projection and recovery map

The existing ideal helix is H(φ) = (r cos φ, r sin φ, p φ / (2π)), where p is axial rise per full turn. The new maps are:
- cross-section projection: π_xy(H(φ)) = (r cos φ, r sin φ);
- axial slice coordinate: z(φ) = p φ / (2π);
- slice-resolved observation: O(φ) = (π_xy(H(φ)), z(φ)).

The formal results establish:
1. the 2D cross-section repeats under φ → φ + 2π, so it is non-injective;
2. the axial coordinate advances by one pitch: z(φ + 2π) = z(φ) + p;
3. for nonzero pitch, successive turns share a cross-section point but have different slice coordinates;
4. a readout distinguishing a one-turn-separated pair cannot factor through the cross-section point alone;
5. for nonzero pitch, the slice-resolved observation is injective, and an explicit decoder reconstructs any phase readout from its axial coordinate.

This gives a conditional coarse-graining rule: a cross-section-only representation is insufficient for a readout retaining turn/axial history; the slice coordinate or equivalent history label must be retained. This is an ideal 3D constant-pitch helix result, not a physical H(s)H worldtube, timesheet law, or empirical readout. The slice coordinate is not identified with physical time. A complete classification of all cross-section fibers is not claimed.

## 4. Lean 4 / Mathlib

New draft PR #2683: https://github.com/Satobloc/HsH/pull/2683  
Branch: research/ariadne-helix-projection-factorization-20261127t1236z  
Base: infra/lean4-verification-20261023, not main.  
Corrected PR head: a18ea843a18b1ca3158c718e3e2119b568481d78  
Module: FORMAL_VERIFICATION/HsHVerification/AriadneHelixProjectionFactorization.lean  
Module blob: b567e068b1bf1d484a98d65c04341a3a8561be98  
Root aggregator blob: ea7f369d6fa028e43eb384dd906540a3c668f180

The first exact-head run #46000824800 failed on three proof-script errors: two tactic commands followed goals already closed, and field_simp simplified the injectivity hypothesis to a = b. Those exact errors were repaired on the same branch without weakening theorem statements.

The corrected exact-head run #46001321255 was IN_PROGRESS at report freeze. Exact PR-head checkout assertion passed; Lake dependency-manifest generation was still running; Lean compilation had not started. No successful build or final axiom report is claimed.

Integration remains separate: PR #2683 is stacked on open infrastructure PR #262. The infrastructure branch compares with main as 56 commits ahead and 29,604 behind. Main integration is unverified; no rebase or merge was attempted. PR #2683 remains OPEN / DRAFT / UNMERGED.

## 5. Governance and next cursor

- P0 presentation safety remains FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED.
- P1 cognition remains overdue/frozen and Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- FIE rereview next due December 8; unrelated-source break next due November 28.
- PWH deep review is not yet due after Tern h1138:s3; the five-completed-activation threshold or an earlier material trigger governs.
- Task graph remains ACTIVE_SEED: 18 records, branch_count=16, seven roots, 11 parent pointers, 10 child edges, 17/18 reachable. WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03 remains unreachable through child edges; graph semantics are under-specified and were not repaired.
- No measured system/dataset was selected or acquired; no physical calculation, fit, prediction, uncertainty propagation, falsification threshold, SAT-O/Blockwave equation edit, manuscript advancement or BEDROCK theory promotion occurred.
- No worker-local inbox, checkpoint or task-graph write; no direct Ariadne/Alberr thread delivery, consumption, acknowledgement or assignment is claimed.

The existing :36 task remains enabled with ID 6a9f52b69ec08191b0a2ba24a074f781, original hourly America/New_York :36 schedule and Worldtube phase unchanged. No sixth task, schedule mutation, signet or conversation rename.

At report freeze the current invocation remained IN_PROGRESS with chat_ref=null; the cached prior result belongs to Ravel h1139:s3.

**Return:** read back run #46001321255. If successful, record exact checkout, full build count and theorem-specific axiom reports; inspect target output for sorryAx/admit and list skipped global audits. If failed, repair only demonstrated errors on PR #2683. Keep the PR draft until the parent Lean infrastructure is reconciled with main. Any H(s)H application still requires a source-defined physical-to-helix map and independently calibrated observable; neither is established.