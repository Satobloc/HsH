# Morrow h1047:s3 | Source-inventory snapshot-binding crosswalk

**Date:** 2026-11-23  
**Nominal slot:** 2026-11-23T15:36:00Z  
**Run key:** `REVROT3-19-20261011:1047:s3`  
**Status:** `SYMLINK_GUARD_EXACT_HEAD_PASS / SAMPLER_SUMMARY_NOT_SNAPSHOT_BOUND / ORCHESTRATOR_MANIFEST_UNVERIFIED`

## 1. Selection, identity and authority

- \(h=1047\); \(seq=5h+3=5238\); \(5238\bmod19=13\). Selected ring label: **Morrow**, index 13. Next label: **Kestrel**, index 14.
- Runtime run ID: `46836dbb-3fd0-832b-8b17-78a42f7eab0a`; scheduled for 15:36Z; last observed `IN_PROGRESS`, `chat_ref=null`. The cached latest result belongs to the prior h1046:s3 Hale run and is not this run's output.
- Historical Morrow evidence is a user-role assignment as “Team Archivist” (raw export blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`, message `402ade01-7116-4efb-9b14-31e477754458`), a separate September 13 direct theory stop (`934e87de-4e61-4622-a0ea-e5047aa235c6`), and a later invitation to a bounded archive/maintenance trial (`99ae959b-fbeb-4c1e-9326-a6723c2b9557`). No standalone signed Morrow charter was found. The later invitation does not expressly release the earlier theory stop.
- This is source-grounded assistant work under a deterministic ring label, not an authenticated historical Morrow instance or current Morrow thread. Work stayed within archive/source-custody and workflow QA. No theory integration, equation correction, physical calculation, prediction, paper work, Lean theory proof or BEDROCK promotion.

## 2. One substantive workflow improvement: separate symlink safety from snapshot identity

The existing Morrow **Source Identity Gate, Layer 8** requires the pinned repository-snapshot tuple:

`(repository_full_name, commit_sha, tree_sha, path_at_commit, blob_sha)`

It also requires byte length, an independently computed SHA-256, exact membership-check method/result, and retrieval time or an explicit absence.

The Cross-Repo Script Execution Safety Standard independently requires each nontrivial multi-repository run to record its run ID, tool version, exact source repository and commit/ref for every input, declared read roots, and write destination. GitHub Actions should record the checked-out commit SHA of every repository scanned.

The current Sable source-inventory sampler's own output does not satisfy those input-snapshot requirements by itself:

- HsH `main` preflight commit: `846ea0a100cb87473c6b56c43afdf976c004931e` (2026-11-23T15:16:09Z).
- Current-main sampler blob: `32ad549bff5cf9a34ed26f6b5059f2ad746642e7`, version `sable-source-inventory/0.2.1`.
- [PR #2222](https://github.com/Satobloc/HsH/pull/2222) head: `3c56938e024accfc0a5097927ae3e106ee68dc09`; sampler blob `efcd135392be267d0c79dd79903094a519cf9b0b`, version `sable-source-inventory/0.2.2`.
- PR #2222 is OPEN / DRAFT, with three changed files (sampler, tests and workflow). Exact-head Actions run [#44812295233](https://github.com/Satobloc/HsH/actions/runs/44812295233) succeeded. This verifies the PR's bounded symlink/quarantine regression suite; it does not establish source-snapshot identity.
- The sampler's `FileRecord` contains only repository label, relative path, top directory, suffix, kind, byte size, file SHA-256 and optional line count. At PR head, the summary keys are `tool`, `seed`, `sample_per_stratum`, `file_count`, `sample_count`, `inventory_sha256`, `kinds`, `repositories`, `prior_art_quarantine_roots_pruned`, `prior_art_pruned_by_repository`, `symlink_entries_skipped`, `symlink_entries_skipped_by_repository`, and `quarantine_policy`. There is no `run_id`, source commit/tree, or per-row Git blob field.
- `inventory_sha256` is computed over the joined `(repository, path, size_bytes, content_sha256)` rows. It is an inventory-content digest, not a Git tree identity. The upload helper's returned `commit_sha` identifies the destination commit for a generated output file, not the source commit of each scanned repository.

**Precise disposition:** the sampler summary alone is `SNAPSHOT_MEMBERSHIP_NOT_VERIFIED`. A separate orchestrator-side run manifest may supply the missing input identities, but its content was not inspected in this run because it resides in the private supporting-resource area and Morrow's no-payload boundary remains in force. Therefore the end-to-end inventory workflow is **UNKNOWN / ORCHESTRATOR_MANIFEST_UNVERIFIED**, not proven defective.

This distinction is the improvement: a green symlink-safety test, an inventory digest, and a source-snapshot membership proof are separate acceptance claims. Do not let one stand in for another.

## 3. Applied acceptance crosswalk

No new schema or tool is proposed. Apply the existing Layer 8 and Cross-Repo Script Execution Safety Standard to each inventory run:

1. Pin every input repository independently to its exact commit and tree.
2. Record the exact declared root and ref for each input.
3. Bind each retained inventory row to its path at that commit and Git blob SHA; retain the independently computed content SHA-256 and byte length.
4. Bind the run ID and sampler version to the output inventory digest.
5. If an orchestrator manifest supplies these fields, verify that manifest and its exact repository identity before declaring `SNAPSHOT_MEMBERSHIP_VERIFIED`.
6. Otherwise retain `SNAPSHOT_MEMBERSHIP_NOT_VERIFIED`; do not infer source identity from a repository label, path, output-upload commit, or aggregate digest.

The symlink/quarantine gate remains a separate control. PR #2222 was not modified, approved, merged, or treated as a full pipeline provenance certification.

## 4. Public coordination

A non-blocking scope note was added to PR #2222: the symlink fix can be evaluated on its own merits, while Layer 8 snapshot binding remains a separate acceptance requirement. The note does not request a scope expansion or claim that the PR's existing tests failed.

## 5. Three-repository and tooling boundaries

- SAT archive `main` preflight: `d10dd333f2487054807bda398995300c538caa7e` (2026-11-20T17:54:09Z).
- HSH_RESOURCES branch metadata was checked, and its visible root index was read. No private payload or run-manifest content was opened or copied into this public report.
- No local HsH checkout was present in the active working directory. No clone was created.
- Mersearch was checked first. No callable Mersearch action was available in this runtime; all four canonical request lanes were still `requested`. No lane was overwritten, retriggered or treated as a completed search.
- Existing Math Hopper #578 / PR #991, Whirligig orientation, the reference/toolbox router and SciSpace availability were checked. The three repositories report zero forks. No new tool, dependency, subscription or expenditure was introduced.

## 6. Workflow health and campaign boundaries

- Task graph: 18 records against 16 declared branches; 5 completed, 12 active, 1 blocked; 17/18 reachable. No graph mutation.
- The previous deep PWH review was Elias h1046:s4; the five-activation threshold was not newly reached by this single run. Lightweight per-activation review found no authorized reason to change the graph or coordinator-owned queue.
- P0 Code Grurple remains active. P1 Orson cognition remains overdue / frozen / not ready / Orson-owned. P2 November 30 remains HOLD; no measured system selected. P3 December 14 remains incomplete.
- FIE last full review: November 20; next due December 4. Unrelated-reading break completed November 21; neither was repeated.
- No physical data, calculation, fit, prediction, uncertainty estimate, falsification threshold, SAT-O/Blockwave equation or BEDROCK theory status was changed.

## 7. Return and stop conditions

**NOW:** Layer 8 is explicitly applied to the Sable sampler: its own summary is not a source-snapshot witness; the separate orchestrator manifest remains uninspected.

**NEXT:** An authorized owner of the private inventory workflow can verify whether the orchestrator manifest binds every scanned repository to exact commit/tree identities and whether inventory rows map to exact path/blob identities. If it does, record that evidence and leave the sampler scoped to symlink safety. If it does not, route a bounded follow-up to the sampler/workflow owner. This report does not assign that work.

**STOP:** No HSH_RESOURCES payload access, no occupied Mersearch-lane mutation, no Sable PR edit/approval/merge, no theory integration, no task or scheduler changes.

**RETURN:** [PR #2222](https://github.com/Satobloc/HsH/pull/2222), [Morrow Source Identity Gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md), and the Morrow h1047:s3 canonical receipt.
