# Amendment 07 - exact-head Lean verification and third scheduler snapshot

**Parent run key:** `REVROT3-19-20261011:745:s2`.  
**Classification:** source-grounded assistant reconstruction; no authenticated current Ariadne thread or historical-instance participation.

## 1. Existing PR #790: exact-head result now verified

The current PR head is `bcb3fcc0fec05ac65620abbf6ac3c1967aaf9d19`. The exact module at that commit is `FORMAL_VERIFICATION/HsHVerification/AriadneAntipodalContourReadout.lean`, blob `f9a0501d7c230b1d46c58cfb2d705589f5f44566`.

Actions run **#42944088253**, job **130272577725**, completed SUCCESS. The job's expected and actual checkout SHA match the PR head. Lean 4.34.0 / Lake 5.0.0; full root build completed successfully in 8,953 jobs and the target module was built.

The module contains ten theorem-specific `#print axioms` commands. All ten report the dependency set `[propext, Classical.choice, Quot.sound]`. The module contains no `sorry`, `admit`, or `native_decide`; the job log contains no `sorryAx`. This is **not** a global axiom-free result: tests, lint, nanoda, and the separate global axiom audit were skipped.

PR #790 remains OPEN / DRAFT / UNMERGED. The current review list is empty. Its description still cites an older PR head (`f84da2126d20dab90140998e3d9680348f077305)); that stale body text is not the current verification record. No PR title/body rewrite or merge was attempted.

### What the formalization establishes

1. The source-defined coordinate transformation `(r₀,rπ) ↔ (a,η)` is bijective.
2. Sampling an arbitrary angular profile at only two angles is non-injective when a third distinct angle exists.
3. The composed two-channel readout is therefore non-injective on arbitrary profiles.
4. A conditional finite-modal theorem returns the target coefficient when the target mode has normalized opposite samples and every other included mode has equal samples at the two readout positions.

The fourth result makes its basis-shape assumptions explicit. It does **not** derive them from the Euler/Rankine model, the paper's raw measurements, or an H(s)H construction. The module formalizes the encoded readout mathematics, not a 3D reconstruction, unique arbitrary Fourier recovery, physical dispersion validity, or a worldtube/timesheet equivalence.

## 2. Source and physical-evidence boundary

The source remains Barckicke, Falcon & Gissinger, *Nature Physics* 22, 409-414 (2026), DOI `10.1038/s41567-026-03175-w`; the article identifies Figshare DOI `10.6084/m9.figshare.30903347`.

The system is a classical air-water finite-core vortex, not an H(s)H worldtube and not a physical equivalence to the WWRD rope heuristic. The dataset DOI is identified, but the Figshare file inventory/version, raw bytes, per-file checksums, license, raw camera video, raw PIV/PTV fields, and joint covariance remain unrecovered. The paper's displayed dispersion analysis fits parameters and checks consistency with PIV/PTV; it is not an independent held-out prediction. No physical calculation, raw-data reanalysis, CODATA comparison, independent prediction, or P2 selection was performed.

The source-faithful equations remain as printed in the parent report. No SAT-O or Blockwave equation was edited or replaced. `CITE-2026-001` remains role COMPARISON on both citation ledgers; the Gilbert preprint is not an established standard or empirical measurement, and the 4D centreline/worldsheet projection remains an assistant reconstruction.

## 3. Scheduler observation: third positive start-time value

The existing :24 task remains enabled with its original saved task identity, hourly phase, prompt, and schedule unchanged. The same recorded h745:s2 occurrence was previously observed with start fields `01:27:46.449752Z` and `01:55:03.490974Z`; the latest exact-ID peek now reports `02:17:06.948370Z`. The latest two values differ by **22m03.457396s**; the first and latest differ by **49m20.498618s**.

The latest record remains IN_PROGRESS, with no completion timestamp and no run-level conversation reference. The cached latest result is still the preceding h744 Ravel occurrence, completed at `01:02:24.788627Z`, not the current Ariadne-labelled occurrence. Task-level last-run/update metadata remain stale relative to the current run.

Classification: `SAME_RUN_ID_STARTED_AT_CHANGED_THIRD_SNAPSHOT / CURRENT_RUN_IN_PROGRESS / CACHED_RESULT_FROM_PRIOR_OCCURRENCE / CAUSE_UNKNOWN`. No attempt identifier, retry counter, complete event history, or diagnostic cause is exposed. Do not infer retry, restart, duplicate execution, worker identity, or backend cause. Tern retains scheduler authority.

## 4. Current branch, P0, Mersearch, and campaign

- HsH `main` at inspection: `a2a51481c9e531e99df217d604c05b4b0a58ca7f`; 62 commits ahead and 0 behind the h745 report baseline `41439cc0ad17d60954eb9ffca580d5f494e4f4a0`.
- Protected Code Grurple files: **8/8 exact blob matches**. No protected P0 path changed in the baseline comparison. Both reader routes remain PRESENTATION_PENDING / NOT_OBSERVED; no live route probe was made. P0 remains ACTIVE.
- Task graph: 16 declared branches against 18 branch records; not edited.
- All four Mersearch request lanes remain `requested`; all twelve expected request-scoped manifest/compact-receipt paths are absent. The pinned stable release is `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. No local three-root checkout or Mersearch connector is available in this runtime. GitHub retrieval was a bounded fallback, not a Mersearch search. No request was submitted, overwritten, or retriggered.
- Campaign: P0 ACTIVE; P1 November 9 cognition OVERDUE / NOT READY / Orson-owned; P2 November 30 geometry HOLD; P3 December 14 full theory INCOMPLETE.

## 5. Lateral reading and return cursor

Continued the unrelated SAT archive source `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, blob `9be7a256d08fcb1aacf3e77b807db0e9555681c4`, lines 221-260. The excerpt is a mixed dialogue fragment: a user corrects an overbroad “Diaspora English” label and asks for a name grounded in speakers' own usage; the subsequent “ChatGPT said” claims about actual community usage are not substantiated by this excerpt. This is a provenance/attribution observation only, not linguistic evidence or a theory connection. **Next cursor: line 261.** No physical break is claimed.

No task, schedule, phase, prompt, enabled state, branch ownership, paper gate, equation, or theory status was changed. No sixth task or new public issue was created.
