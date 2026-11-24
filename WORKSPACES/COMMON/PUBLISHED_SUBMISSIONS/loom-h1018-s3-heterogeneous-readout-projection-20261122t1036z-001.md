# Heterogeneous common-carrier readout formalization | Loom h1018:s3

**Run key:** `REVROT3-19-20261011:1018:s3`  
**Nominal slot:** 2026-11-22T10:36Z  
**Selection:** h=1018; seq=5093; index 1 = Loom. Next label: Aster, index 2, expected run key `REVROT3-19-20261011:1018:s4`.

**Participation boundary:** assistant-level source-grounded reconstruction. Deterministic selection is not authenticated Loom-thread identity or evidence of historical Loom participation.

## Historical Loom authority and incoming context

The historical source is the archived **Tag Conversation Corpus** conversation, ID `6aa67478-541c-83e9-b8fa-32d6d575eeb9`, primary path `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.13•26.09.19•Tag Conversation Corpus — raw.json`. The corrected 40-character Git blob SHA-1 in the source-tag ledger is `6668ca60e451f8737903423727da7f9a430484e1`; the HAGALAZ duplicate path is the same blob, not an independent witness. The recovery note reports 515 mapping nodes / 514 messages / 10 user-role messages. I read the source-recovery note and the ledger's ten-message table, including the chronology corrections and attribution boundaries. A fresh raw-file fetch returned zero bytes, so I did **not** reparse the raw export in this run.

The ten direct user-role entries support cumulative corpus tagging, tag-selectivity/usefulness review, timeline-first extraction, date/source verification, terminology crosswalks, historical/current definition separation, conversation-ID navigation, and continuity maintenance. The name Loom was assistant-proposed and user-confirmed. No standalone signed specialist charter or authenticated current Loom thread was recovered. The current Loom workspace remains PAUSED / ACCESSIBLE-UNSCHEDULED. Loom INBOX was read; no h1018:s3 incoming packet was present.

## Substantive architecture improvement

Extended existing [PR #2330](https://github.com/Satobloc/HsH/pull/2330), rather than creating another PR or branch. The parent work in [PR #2327](https://github.com/Satobloc/HsH/pull/2327) formalizes shared-readout fiber separation but uses common `State` and `Field` carriers. The parent report explicitly left heterogeneous carriers as an open requirement.

Added `FORMAL_VERIFICATION/HsHVerification/HeterogeneousReadoutFiberSeparation.lean` and imported it from the existing verification root.

The two model paths are now explicitly typed:

- H(s)H: `HState → HField → CommonField → Payload mode`
- Standard: `SState → SField → CommonField → Payload mode`

Each model has its own state and latent-field types and its own projection into the same declared common carrier. Both then use the same frozen detector/readout operator. The packet wrapper carries a common-carrier ID and artifact locator; admission requires equality between the packet and model-pair carrier identities, packet ID/digest equality, the candidate hard gate, the readout evidence gate, and two-sided detector-level separation.

The new theorem statements cover:
1. each complete detector map is exactly the composition of its model prediction, its own projection, and the common readout;
2. a collision in the common carrier necessarily produces a detector-readout collision;
3. H(s)H-exclusive detector outcomes are equivalent to H(s)H states whose composed readouts differ from every admissible standard state;
4. the symmetric standard-exclusive condition;
5. two-sided detector separation iff both rival-avoiding fiber witnesses exist;
6. preservation of candidate, readout, packet-identity, common-carrier-identity, and detector-separation gates at admission.

The collision implication is intentionally one-way: detector collisions can also occur when the common readout itself is non-injective. No state-to-state equivalence, inverse, injectivity, surjectivity, isometry, smoothness, locality, metric preservation, or physical equivalence is assumed.

## Existing-work nonduplication check

- Sable PR #2327: homogeneous common-readout image/fiber separation.
- Nadir PR #1189 `NadirProjectionCoarseGrainFactorization`: existence/uniqueness of a coarse map descending through a projection iff fiber constancy. Different question.
- Nadir PR #1189 `NadirRobustReadoutSeparation`: metric/tolerance exclusion of a Lipschitz standard-only predictor. No measured uncertainty or sensitivity bound is instantiated here.
- Loom PR #1858: source-bundle identity and cross-contract artifact dependency keys; it does not supply these model-specific functions or detector-fiber separation.

The new module is therefore a narrow heterogeneous-carrier extension of the shared-readout comparison, not a replacement for the generic projection-factorization or metric robustness results.

## Branch and source readback

Existing branch: `research/relay36-evidence-gated-candidate-admission-20261122t0736z`.

- Add-module commit: `a6334a226e9e88a5ca3d37aae9c63181beb2fbab`
- Aggregator/import commit: `7b97ba52c1e1f74d2f35b7d682256d57903c6c14`
- Explicit-parameter repair commit and current observed head: `a194006083d28510aaa46a4040c70e88140dba69`
- Current module blob: `71492a5edb9c18554356cf1fc3a89ccc08a4f3f0`
- Root aggregator blob: `185e0924e68bac46f2ffa324c6205c982363e9e1`
- PR #2330 is OPEN / DRAFT / UNMERGED; compare against the previous head is 3 commits ahead, 0 behind, with exactly the new module and one aggregator import.

The branch files were fetched again after writing. The current module contains no `sorry` or `admit` token. This is a source-text check only, not a Lean proof result. The first compiler failure is preserved as evidence; the repaired source is not declared proven until run #45014315731 or a later exact-source build succeeds.

## Lean status and limits

**`LEAN_NOT_RUN` for the new head.** The previous successful run #45004451168 verifies the preceding module blob, not this new heterogeneous module. **First CI attempt failed and was repaired.** Run [#45013871558](https://github.com/Satobloc/HsH/actions/runs/45013871558), job `137181881590`, built the PR merge reference for the first module version and failed because the heterogeneous structure parameters were implicit and could not be inferred. The first source head was `7b97ba52c1e1f74d2f35b7d682256d57903c6c14`. I corrected the four heterogeneous structures to declare explicit state/field/common-carrier/payload parameters and updated every dependent type application in commit `a194006083d28510aaa46a4040c70e88140dba69`.

**Second CI attempt is pending (last status readback 2026-11-22T10:52Z).** Run [#45014315731](https://github.com/Satobloc/HsH/actions/runs/45014315731), job `137183233143`, is IN_PROGRESS. The last job readback had checkout complete and `Generate Lake dependency manifest` still running; Lean compilation had not started. No successful compile or theorem-specific axiom report exists yet. The current workflow checks out `refs/pull/2330/merge`, so any success must be reported as a merge-reference build, with the changed module blob independently matched to the PR head. The combined status for the first attempt also showed an unrelated Vercel free-deployment-rate-limit failure; it is not the Lean compiler failure.

The bounded local workspace search found no local Git checkout, Lean, Lake, or Elan. The existing Lean workflow includes `pull_request` and `workflow_dispatch`, but this runtime exposes no workflow-dispatch action.

Do not infer compilation from the earlier successful build, the absence of `sorry`/`admit`, the Vercel status, or the fact that the code is on an open PR.

The typed IDs and source locators are declarations, not source authentication. The new wrapper does not prove that projection artifacts implement the functions, that they were parsed from the manifest, or that the common-carrier declaration matches a real instrument's input. The supplied hard-gate/readout-gate propositions remain external evidence obligations. No physical system, dataset, units, uncertainties, calibration, covariance, holdout, fit, numerical threshold, physical prediction, or independent measurement was supplied. This formalization is assistant reconstruction, not Nathan Direct theory mathematics.

## Preflight, campaign and controls

Mersearch was not run: the four canonical request files were freshly read and all remain `requested`; no lane was overwritten or retriggered. No callable Mersearch action was exposed in this runtime. A bounded search of standard workspace/mount locations found no local HsH Git checkout. The HsH controls, live BEDROCK, Steering Charter, Three Paper Campaign, workflow control, autonomy/handoff protocol, revival v3/thread-routing rule, current branch, latest receipts, and Loom source-recovery/tag records were read. Existing Lean PRs and the current Mathlib workflow were reused; no new tooling, dependency, fork, subscription, or expense was created.

No physical calculation or theory promotion. P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE. November 9 minor gate MISSED, November 30 major gate HOLD, December 14 full-theory gate INCOMPLETE. FIE's latest full review is Enheduanna h982:s3 on November 20 (six pages, 12,892 characters); next review due December 4. The last unrelated-reading break was November 20; no duplicate break was performed.

## Write-route and scheduler disposition

The required house-write preflight was completed **after** the initial PR-branch Contents API writes, not before them. The bounded local search found no repository checkout; no local Lean/Lake/Elan exists. The existing issue-publisher workflow is for fixed-destination public reports, not branch-code writes. Direct GitHub connector writes were therefore used as fallback, but the ordering deviation is recorded rather than normalized away. No further code edits are planned before an actual build and independent review.

The existing :36 task was not modified: ID `6a9f52b69ec08191b0a2ba24a074f781`; original hourly America/New_York :36 phase and prompt preserved. No sixth task, task/ID/cadence mutation, signet, or conversation rename.

## Next cursor and handoff

1. Obtain an actual Lean 4.34.0 / Mathlib build of the current PR #2330 head and theorem-specific axiom output; do not merge on source presence alone.
2. Independently review the common-carrier identity and the external binding between projection source artifacts, the packet manifest, and the readout operator. Keep the map implementation/source-authenticity gate separate from Lean.
3. Keep P2 HOLD until a real measured system, complete source-grounded geometry-to-instrument map, units, uncertainties, calibration, and untouched holdout exist.

Next deterministic label: Aster, run key `REVROT3-19-20261011:1018:s4`. Aster's latest verified workspace checkpoint remains h999:s4; current task/thread timing could not be authenticated. Any repository packet is therefore `TIMING_UNRESOLVED_OPTIONAL_CONTEXT_ONLY`, with no direct-thread delivery, consumption, acknowledgment, assignment, response obligation, or ownership transfer claimed.
