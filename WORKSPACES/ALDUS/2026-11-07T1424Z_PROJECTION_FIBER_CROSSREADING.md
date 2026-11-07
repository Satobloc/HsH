# Aldus h662:s2 | Projection-Fiber Cross-Reading for Lane 24

**Run key:** `REVROT3-19-20261011:662:s2`  
**Nominal slot:** 2026-11-07T14:24Z  
**Selected ring label:** Aldus, index 6  
**Successor:** Calder, index 7  
**Classification:** source-grounded revival session in the scheduled turn; not an authenticated historical Aldus execution, not a new ChatGPT thread, and not a Nathan Direct theory statement.

## 1. Historical role and source boundary

The historical conversation is `Aldus [AUTO H(s)H Gitter]`, conversation ID `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, raw-export blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`. Its last fully inspected archived snapshot ends at 2026-09-08T22:27:06.256320-04:00.

The 2026-09-12 Common check-in, blob `36da6b7105ed4a93d49ac32862eea1ae5be9730c`, and the 2026-11-04 h578 receipt preserve the direct user-message anchors. The recovered original remit is broad cross-reading, cross-context comparison, and combining information not usually combined. The detailed proposal to read a collection without forcing a premature theme was assistant-authored and broadly endorsed, not a verbatim Nathan charter. The first-extant/first-public chronology, feature-specific T0, and Bayesian-convergence workflow are later operational specializations, not the original role.

The raw export was located this turn, but the connector returned an empty content payload for that large file. No fresh raw-message reread is claimed. The check-in and source-correction receipt were read. No authenticated current Aldus thread or manually reopened successor was found in the available continuity record. This run is therefore a source-grounded reconstruction, not literal continuity with the old process.

## 2. Cross-reading result: factorization is a representation-sufficiency test

Existing Kestrel PR #873 contains a useful generic set-map theorem in:

- `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`
- PR head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`
- File blob: `0fe5390faa10113830132b12cdb98172194adfee`
- Branch: `research/kestrel-original-slice-fidelity-20261028t0900z`

The theorem `hallway_factorization_iff_fiber_compatibility` states that a deterministic downstream map from the range of πI to Z exists exactly when πJ is constant on every fiber of πI:

`exists H : range(piI) -> Z, H(piI(x)) = piJ(x) for every x`

if and only if

`piI(x1) = piI(x2) implies piJ(x1) = piJ(x2).`

This is a general representation-sufficiency criterion. If two full states collapse to the same coarse representation but a target observable still distinguishes them, no deterministic downstream function of that coarse representation can recover the distinction. The companion theorem `downstream_readout_cannot_restore_coarse_collapsed_pair` proves that limitation. `joint_readout_injective_of_separating_pair` gives the complementary conditional result: two readout channels jointly identify a state if every distinct admissible pair is separated by at least one channel.

The module's own source comments are controlling: projected overlap is not physical intersection; the back-hallway construction is a conditional set-map theorem, not a supplied SAT/H(s)H projection or physical prediction. The cited Meridian user-role clarification says the corridors are metaphorical/mathematical and the earlier reciprocal filament/timesheet-deformation model is no longer current. The attached hallway proposal's exact author is unresolved. This is not a Nathan Direct physical equivalence.

## 3. Lane 24 interpretation, kept conditional

A future H(s)H generating representation could be tested with typed maps:

- `X`: admissible full physical configuration/history;
- `piW`: worldtube representation;
- `piT`: timesheet or slice representation;
- `piM`: responsive-medium state;
- `Pi = (piW, piT, piM)`: a proposed joint representation;
- `O`: an observable/readout;
- `Phi`: physical evolution.

For O to be determined by Pi, O must be constant on Pi's fibers. If it is not, the proposed representation has discarded information relevant to the observable. For a dynamics map to descend to a reduced representation, the projected evolution must also be constant on the fibers of the representation. The existing generic factorization theorem supplies the relevant mathematical criterion, but no H(s)H-specific Pi, O, or Phi has been defined or instantiated here. No hierarchy, nesting, equivalence, or composition map is claimed.

This gives a possible falsifier once a real measured system is admitted: identify two admissible histories with the same proposed reduced state but distinguishable target readouts or later states. That would falsify the sufficiency of that reduced representation. It is not yet an empirical prediction because no system or dataset has been selected.

## 4. A concrete measurement-map example already exists, but its scope is local

The same PR contains `KestrelKelvinVortexReadout.lean`, blob `ebc5ce9b05842946c43a78fe346b6401ae5e9fb9`. It formalizes the two-sided contour map from opposing interface radii to centerline displacement and mean core radius, with an exact inverse. It also proves that one opposing contour alone is non-injective. This is a concrete example of how adding a second readout channel can restore identifiability for the two measured coordinates.

The source record identifies Barckicke, Falcon and Gissinger, Nature Physics 22 (2026), DOI `10.1038/s41567-026-03175-w`; Barckicke, Falcon and Gissinger, Physical Review Letters 137 (2026), DOI `10.1103/t3bt-m431`; and Fonda et al., PNAS 111 (2014), DOI `10.1073/pnas.1312536110`.

The existing Lean `#eval` run returned the exact rational conversions:
- nominal core-readout uncertainty: 5/3 pixels;
- nominal contour width: 25/3 pixels;
- uncertainty-to-contour-width ratio: 1/5;
- reported PIV circulation uncertainty: 1/200 m^2/s;
- reported PTV vertical-velocity uncertainty: 1/20 m/s.

These are unit conversions of published rounded quantities, not newly calculated physical results, error distributions, or covariance estimates. The module explicitly separates the 2014 superfluid-helium acquisition values from the 2026 classical air-water vortex values. It also records that the 2026 dispersion analysis fits Gamma and vertical velocity to dispersion data, then checks them a posteriori against PIV/PTV measurements; this is not a blind holdout prediction. The two-coordinate contour inversion does not reconstruct the full 3D core or a 4D worldtube.

Other existing modules remain conditional:
- `WorldtubeInertiaCoordinate.lean`, blob `11604832bcec6b7ccc2182d6f55a1214e9c99d8a`, proves algebra from F = m a and a = c^2 kappa. It does not prove the coordinate-curvature premise or a finite-core worldtube-to-trace map.
- `WorldtubeCurveCurvatureLift.lean`, blob `79597de14cd0c69a93c19c2697bc1b8dcf2456d2`, proves a Gram-curvature identity for an explicit affine Euclidean lift X(w) = (x(w), w). It does not establish a Lorentzian worldtube metric, physical parameterization, or H(s)H curvature law.

The assumptions of these modules have not been composed into one physical map. The climbing-rope mechanics comparison remains a first-blush geometric heuristic only, not a physical equivalence.

## 5. Lean/CI evidence and limits

PR #873 remains open, draft, and unmerged. Its PR-triggered build was run #42153410233, job #127681789766, on merge commit `a2c3304b79d0a5a49b0d0d5bbfd24a9b3d8f1c2a` with base `61cc8b3f4f5d4a1d7a0b` as reported by the PR metadata. The build used Lean 4.34.0 and Lake 5.0.0 and completed 8,955 jobs successfully.

The theorem-specific axiom output for `hallway_factorization_iff_fiber_compatibility` was `[propext, Classical.choice, Quot.sound]`. The simpler downstream no-restoration theorem reported no axioms. No `sorryAx` or bare `admit` token appeared in the captured job log. However, tests, lint, nanoda, and the separate global axiom audit were skipped. This was a merge-ref build, not an exact-head-only build against current main. It establishes only that the formalized statements compiled in that build environment. It does not establish soundness of translation, truth of physical premises, or observational validity.

No local Lean executable was installed in this runtime. The existing CI route was reused; no new Lean project, module, PR, tool, or subscription was created.

## 6. Live controls and blocked evidence

- Current HsH main at inspection: `a44278250d55ff4b0a5df245b12f27ebb9433223`.
- Current task graph remains an `ACTIVE_SEED`, 16 declared branches versus 18 actual records. Tern retains reconciliation ownership.
- Code Grurple P0 remains ACTIVE. Both R1 manuscript gates are closed, but the reader-facing presentation/version gate remains open.
- November 9 P1 remains Orson-owned; November 30 P2 and December 14 P3 remain separate. No paper gate changed.
- Lane 24 remains BACKSEAT/HOLD under P0. No measured system was selected, no physical calculation or CODATA comparison was performed, and no prediction-versus-fit claim was added.
- All four Mersearch request lanes remain occupied with status `requested`: Calder angle geometry, archive optics, Calder IRI/worldtube, and Kestrel finite-core geometry. For each current request ID, `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md` were absent at the request-scoped path. No Mersearch run is claimed; no lane was overwritten or retriggered. GitHub code search was used only as a bounded navigation fallback, not as Mersearch.
- No original SAT-O or Blockwave equation was recovered or changed. No corrected equation was proposed. Mersearch-first source recovery remains required before that work.
- FIE was last fully reviewed 2026-10-27. The 14-day rereview threshold is reached on 2026-11-10, not this run.

## 7. Unrelated reading break

Continued the existing Aldus-lane creative-source cursor in the exact archive source:
- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- Path: `SAT Mark V/TheTANGLE.txt`
- Blob: `3181b6cad85bbd76bd1017938e0dbf67baf03752`
- Actual extent: lines 2011-2050.
- Next cursor: line 2051.

The passage distinguishes `weaveaday` (ordinary friction that can thicken social bonds) from `mushsalt` (a deeper injury that changes seating/relationship), then develops the Oxbow children's phrase “un-salting the bandage.” This is creative worldbuilding, not physics evidence or a formal equivalence.

## 8. Next work and regeneration seed

After independently evidenced Code Grurple standdown, resume Lane 24 only with an identified measured system and a source-complete dataset: version/DOI, raw files, acquisition and calibration chain, units, uncertainty distributions, covariance/correlation, evaluation/model dependence, and a declared prediction-versus-fit split. Recover Nathan's subject-specific direct statements and exact SAT-O/Blockwave source equations through Mersearch when a lane is released. Define the worldtube, timesheet, responsive-medium, observation, and evolution maps before deriving a hierarchy or nesting claim. Use existing Lean modules and CI rather than duplicating tooling. Keep Orson's P1 cognition ownership and all other specialist remits intact.

### Paste-ready manual continuation seed

You are a source-grounded continuation of the historical Aldus lane, not the same authenticated process. Historical conversation: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`; raw export blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`; last inspected archived message: 2026-09-08T22:27:06.256320-04:00. The original direct remit is broad cross-reading, cross-context comparison, and combining information not usually combined. Do not present assistant-authored elaborations as verbatim Nathan Direct.

Read current HsH BEDROCK, Steering Charter, Three Paper Campaign, three-repository onboarding, current branch, current receipts, and the Aldus check-in before substantive work. Code Grurple P0 is ACTIVE. Lane 24 H(s)H generation/CODATA is BACKSEAT/HOLD. Do not perform a physical calculation without a real measured system and source-complete data, or a data-free calculation without specific Nathan permission. Do not promote a theory claim or alter a paper gate. Keep Orson's November 9 cognition P1 and other specialist remits protected.

The current cross-reading is a generic representation-sufficiency criterion from Kestrel PR #873, not a physical H(s)H map. Reuse the existing Lean/CI result; do not duplicate the theorem or claim empirical validation. All four Mersearch lanes were occupied at h662:s2, with no current request-scoped receipts. Do not overwrite them. No original SAT-O/Blockwave equation was recovered or changed.

Continue the unrelated reading cursor at `SAT Mark V/TheTANGLE.txt` line 2051. FIE rereview is due 2026-11-10. Preserve exact provenance, no signet, no conversation rename, no task/ID/cadence change, and no cross-thread delivery claim. A manually created continuation would be a new thread, not the historical original.
