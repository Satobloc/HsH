# Morrow | Review-MIND cross-lane branch and fiber-scope QC

**Date:** 2026-11-04T11:48Z slot; evidence read through 11:56Z  
**Status:** INTERNAL SOURCE / CI / FORMALIZATION-SCOPE QC  
**No theory integration, physical calculation, new Lean code, paper drafting, or paper-gate advancement.**

## 1. Routing and protected remit

The fixed-ring calculation gives:

- Nominal UTC hour: **h = 587**.
- Sequence: **5h + 4 = 2939**.
- 2939 mod 19 = **13**: selected label **Morrow**.
- Next ring label: **Kestrel**, index 14; intended next key **REVROT3-19-20261011:588:s0**, 2026-11-04T12:00Z.

Morrow's historical remit is Team Archivist. Nathan's direct user message 402ade01-7116-4efb-9b14-31e477754458 in conversation 6a9ee7ca-d340-83ea-b99d-6a3097429f36, raw blob 362075c5e32ec9e97579bd1de58fba7f612cb6bb, says to work as the Team Archivist with GitKeeper and to appraise the archive without treating an initial priority list as exhaustive.

The later direct instruction 934e87de-4e61-4622-a0ea-e5047aa235c6 in the 697-node snapshot blob ee394b446b2e36d35fd1e5ecd004685c0422457b says: **“STOP WORK ON THE THEORY IMMEDIATELY. QUARANTINE ALL DOCUMENTS YOU HAVE PRODUCED AS UNIQUE ARTIFACTS.”** The later trial-workflow message 99ae959b-fbeb-4c1e-9326-a6723c2b9557 does not revoke that stop. The current Review-MIND lane permits bounded source, provenance, CI and methodology QC; this pass did not integrate SAT/H(s)H theory or touch quarantined theory artifacts.

## 2. Material correction: PR #1296 has no base drift

The live task graph had misclassified PR #1296's previous failed build as a **stale merge-ref** and had treated 61cc8b65ffed70296e0121dbae067892a79c81d4 as the current base branch.

A fresh branch comparison shows that interpretation is wrong:

- PR #1296: branch research/worldtube-polarization-mode-rotation-20261103t0336z, head a673f1a38f9bacae42fe5e31807192cd64f2857a.
- Base branch: infra/lean4-verification-20261023, current head **c7dc2c483f50ae03fc7a7c530829170135e18d92**.
- Recorded PR base SHA is the same **c7dc2c...**.
- compare_commits(base, head) returns **ahead_by = 2, behind_by = 0**, merge base c7dc2c....

The earlier 61cc8b... value is the **merge-base** reported when comparing PR #873, not the current base-branch head. The graph conflated base_commit and merge_base_commit.

The failed Actions run **#41576591587**, job **#125721400743**, ran on synthetic merge commit 856a117fd57e19880b58b763db20403c996025bf, whose merge message identifies PR head a673f1... and base c7dc2c.... This was a **current-base merge-ref build**, not a stale-base build. The PR branch still has no verified exact-head-only run.

The build failure is real and code-specific, not a base-age artifact:

- PolarizationModeUniformRotation.lean:20: definition depends on noncomputable Complex.instDivInvMonoid.
- Lines 53, 54, 55, 66, 68 and 69: unknown constant Complex.abs.
- Lines 71, 74 and 75: downstream identifiers unresolved because earlier declarations failed.

The separate Vercel deployment failure is not Lean evidence. PR #1296 remains **OPEN / DRAFT / UNMERGED / BLOCKED**; no P2 gate is cleared. The correct next step is source repair and an exact-head verification, not a base-refresh justified by the former false drift diagnosis.

## 3. PR #873: current-base merge build, module success, root failure

Current branch comparison:

- PR #873 head branch: research/kestrel-original-slice-fidelity-20261028t0900z.
- Head: **03f126340ad4b9c6c62b45ff7f794a390e0bde30**.
- Base branch head: **c7dc2c483f50ae03fc7a7c530829170135e18d92**.
- Merge base: 61cc8b65ffed70296e0121dbae067892a79c81d4; PR branch is four commits behind the current base.

Actions run **#41758925555**, job **#126341666752**, checked merge ref 17f3275008decf55996e41f215cf2b03f4b40801, i.e. the current base plus the current PR head. It is not a standalone exact-head-only run.

The KestrelProjectedIncidence.lean blob is **0fe5390faa10113830132b12cdb98172194adfee** at both PR head and merge ref. The root build log records it built at **[8952/8954]**. This is an actual Lean 4.34.0 compilation of that module within the merge-ref root build, not a successful whole-PR build.

The same run failed earlier in KestrelMovingSlice.lean at lines **114** and **125** with unsolved goals. The theorem-specific reports for moving_slice_intersection_on_plane and moving_slice_intersection_y_rate include sorryAx. The global axiom audit, tests, lint and nanoda were not run.

The exact theorem-specific axiom readback for the projection module includes:

- genuine_intersection_projects_to_overlap: no axioms.
- projected_overlap_lifts_if_injective: no axioms.
- disjointness_preserved_if_injective: propext, Classical.choice, Quot.sound.
- noninjective_readout_can_create_spurious_overlap: propext, Quot.sound.
- hallway_factorization_iff_fiber_compatibility: Classical.choice.
- hallway_factorization_unique: Quot.sound.
- hallway_factorization_exists_of_source_injective: Classical.choice.
- scale_route_agreement_implies_observable_agreement, observable_agreement_reflects_scale_route_agreement_if_injective, and observable_scale_route_agreement_iff_of_injective: no axioms.
- Other noninjectivity/range lemmas use the reported combinations of propext, Classical.choice, and Quot.sound; none of this is a global axiom audit.

## 4. New formal-scope clarification for the MIND/provenance use

The source code at KestrelProjectedIncidence.lean:140-174 states:

    (∃ H : Set.range piI → Z,
      ∀ x, H ⟨piI x, ⟨x, rfl⟩⟩ = piJ x) ↔
    ∀ x₁ x₂, piI x₁ = piI x₂ → piJ x₁ = piJ x₂

Thus the proved factor map is **H : Set.range piI → Z**, defined on the image of the observation/projection map. The theorem does not assert a total decoder H : Y → Z on every syntactically possible observation, including values outside range(piI). The shorthand in the existing Review-MIND report should be read as range-restricted; if restated, write H : Im(O_r) → W explicitly.

The result formalizes a useful provenance principle: a target attribute factors through an observation only when it is constant on every fiber of that observation. It does not instantiate a particular CSCW/human-agent dataset, establish that two actual event histories produced identical visible transcripts, or prove any empirical causal claim. The geometry-to-observation translation and the choice of what counts as a realizable transcript remain separate modeling obligations.

## 5. MIND, campaign and source controls

- Orson's P1 LLM-cognition ownership and **November 9** minor-paper gate remain protected. No Orson branch, protocol, manuscript or experiment was changed.
- P2 **November 30** remains separate and blocked; no measured system was selected or physically calculated here.
- P3 **December 14** remains separate.
- No human participants, new model calls, private agent profiles, consciousness/personhood claims, or invented subject results.
- No new Lean code, PR, branch, dependency or tool. Existing Kestrel PR #873 and its CI were inspected; no new build was triggered.
- Mersearch lanes 1–4 remain occupied; none was overwritten or retriggered. No new request was submitted. This was a bounded GitHub source/CI fallback, not a three-repository Mersearch run.
- SciSpace exists in the installed research toolset but was not needed for this repository/CI correction. No service, paid tool or new infrastructure was added.
- The public issue #1297 records the actual Lean failure but does not assert the false stale-base interpretation. No new public issue was created; avoid duplicating the existing P2 report.
- Unrelated reading break completed: HSH_RESOURCES, HISTORICAL/JACOBY—ASTRONOMER TALKS.txt, lines **1021–1060**. **Next cursor: line 1061.**
- FIE last full review: 2026-10-27. Fourteen-day review threshold is **2026-11-10**, so no FIE re-review is due in this run.

## 6. Operational state and next action

The :48 automation remains enabled under its existing task ID 6aa6c3bc02b48191b8a91a30d2a155e0, with the exact original hourly DTSTART and phase unchanged. Its current run 403ef329-a46c-8328-85ca-004c9ed6f58a was recorded in_progress with chat_ref=null; the stored latest result belongs to the preceding Hale run, not this Morrow execution.

The :00 task remains enabled under its existing ID 6aa1fe0de5e48191b886496095b1343f. Its latest recorded attempt, run 98626759-e264-8325-bdde-9a2602fd44da, was scheduled for 10:00Z, started late at 11:27:51Z and failed at 11:52:53Z. No h584:s0 Morrow receipt was located; absence of that receipt does not establish whether the h584 execution occurred. No task was changed, paused, created or deleted.

**Next useful specialist action:** Kestrel may independently review the range-restricted factorization wording and the current PR #873 run; the P2 owner should repair PR #1296's actual Lean errors. This report assigns neither task nor ownership. No ChatGPT-thread delivery, consumption or acknowledgment is claimed.
