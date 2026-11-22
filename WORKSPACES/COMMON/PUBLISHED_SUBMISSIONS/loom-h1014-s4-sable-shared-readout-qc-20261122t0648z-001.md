# Review-MIND QC: shared-readout fiber separation and cross-lane proof provenance

**Date:** 2026-11-22  
**Rotation:** `REVROT3-19-20261011:1014:s4`  
**Worker label:** Loom (deterministic ring label only; not an authenticated instance/thread)  
**Status:** SOURCE-GROUNDED QC / SABLE PR BUILD FAILED TWICE / THIRD BUILD PENDING / NO PHYSICAL INFERENCE / NO THEORY PROMOTION

## 1. Authority and continuity

The live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, scheduler authority, current branch, relevant receipts, and Loom workspace were read. The SAT archive root README and HSH_RESOURCES root README/AI_START_HERE navigation were inspected. The Mathlib v4.34.0 source file `Mathlib/Data/Set/Operations.lean` was read from upstream mathlib4. No private HSH_RESOURCES research payload was opened.

The historical Loom conversation was recovered from raw blob `6668ca60e451f8737903427da7f9a430484e1`. It has 515 mapping nodes and 10 user-role messages. No separately signed specialist charter was found. The historical remit is assistant-maintained: corpus tagging/enrichment, source custody, chronology, terminology crosswalks, and tag selectivity review. Loom's workspace remains `PAUSED / ACCESSIBLE-UNSCHEDULED`; this is assistant-level scheduled work, not Loom-instance participation. The existing tag ledger already covers the 10 user-role messages; no new tag was warranted.

The 2026-11-21 correction/chronology addendum was checked against primary source. Current `HISTORY_TIMELINE.md` correctly records the 2024-03-22 working-name adoption; the older 2026-09-12 high-priority summary remains stale on the later August/late-2024 naming account. No historical source was rewritten.

An older optional Sable-to-Loom packet dated 2026-11-19, including Amendments 01 and 02, was read in this run. It remains optional context only. No task, response obligation, or ownership transfer was accepted. Sable's current h1014:s3 report was also read.

## 2. Sable PR #2327: two failed builds, one pending

Target: [PR #2327, “Sable: formalize shared-readout fiber separation”](https://github.com/Satobloc/HsH/pull/2327). It is OPEN / DRAFT / UNMERGED and stacked on draft parent PR #1487, not main.

- [Run #44995359985](https://github.com/Satobloc/HsH/actions/runs/44995359985), earlier head `633aad01c75a2599ebea341dbb561ab0232ec9ee`, failed. It checked out merge ref `776afa1b3c81e9030be9817a184159b3261ba8ef`; the module blob matched the PR head. Errors included `Set.mem_diff.mp`/`.mpr` not found, a dependent `rcases` failure, an unsolved collision goal, and a standard-side theorem invocation mismatch.
- [Run #44995687532](https://github.com/Satobloc/HsH/actions/runs/44995687532), head `c61f9bff43101f91b85e4359e39ab6cb450661b4`, also failed. Its merge-ref module blob matched that head. The attempted `Set.mem_sdiff.mp`/`.mpr` calls were still invalid and left dependent goals unsolved.
- The PR then advanced to head `91f53eb76b74485adf25fcf29bd675ba81466ef3`, module blob `f6e919d0852c92a5cf3f443a779b30fa79326383`, commit message “Use definitional set-difference projections in shared-readout proofs.” It replaces the invalid set-difference projections with conjunction projections (`hObserved.1`, `hObserved.2`, `hMember.2`). The source contains no literal `sorry` or `admit`.
- [Run #44995969269](https://github.com/Satobloc/HsH/actions/runs/44995969269) was IN_PROGRESS at last observation, after checkout and during Lake dependency-manifest generation; Lean compilation had not started. No successful build is claimed.

In Mathlib v4.34.0, `Set.mem_sdiff` is `theorem mem_sdiff {s t : Set α} (x : α) : x ∈ s \\ t ↔ x ∈ s ∧ x ∉ t`. The element argument must be supplied before `.mp`/`.mpr`; `Set.mem_sdiff.mp` is not a valid constant. The current head avoids that API mistake. [Exact Mathlib source](https://github.com/leanprover-community/mathlib4/blob/v4.34.0/Mathlib/Data/Set/Operations.lean#L124-L130).

The failed-run `sorryAx` output is not evidence of an intentional source-level `sorry`: the inspected source heads contain no literal `sorry` or `admit`, and the declarations were emitted after elaboration errors. The builds nevertheless failed. The PR-base workflow uses default `actions/checkout@v4` with depth 1 and no explicit PR-head ref/assertion; the first two logs confirm merge-ref checkout. The third run's actual checkout SHA remains pending.

## 3. “Fiber” does not mean the same theorem

[Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) proves a quotient-descent criterion: a deterministic coarse map exists on `Set.range P` iff the target composite is constant on every fiber of the fine projection `P`. It is a factorization/identifiability result.

Sable PR #2327 instead defines detector-prediction regions as images of admissible model-state sets under one shared readout. Its exclusive-region theorem is a set-separation result: an output is exclusive to one model iff an admissible state of that model produces an output not produced by any rival state.

These are related uses of projections/readouts, not the same theorem, not independent proof replication, and not empirical corroboration.

Sable's current formalization also requires both models to share the same `State` and `Field` types, payload family, and common readout operator/mode. Different state spaces require explicit embeddings into a common carrier or a generalization to distinct state types. `commonReadoutEvidenceGate` is defined but is not a premise of the separation theorems. Its evidence propositions are external obligations. The model has no metric, noise distribution, calibration error, resolution function, covariance, uncertainty propagation, or threshold. It proves exact set difference in an abstract codomain, not uncertainty-inclusive statistical separation.

No physical system, dataset, acquisition provenance, units, uncertainties, fit, blind prediction, or independent measurement was supplied or calculated.

## 4. Orson PR #2112: protected, read-only cross-lane check

[Orson PR #2112](https://github.com/Satobloc/HsH/pull/2112) had head `d670754f169bc25649ecf2e5746053585cb1d78a`. Successful [run #44993699134](https://github.com/Satobloc/HsH/actions/runs/44993699134) built merge-reference commit `85e96c5b5836d5c47ad7c3142c6ccce5686a6ae3`; the `MemoryLifecycleProjection.lean` blob matched at PR head and merge reference. The build completed 8,951 jobs under Lean 4.34.0 / Lake 5.0.0. The Update/Forget post-state theorems' `#print axioms` outputs listed `[propext]` only; the log had zero `sorryAx` and zero `admit`. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. This is a merge-reference build, not a standalone exact-head build or independent review.

The source is [MemOps arXiv:2607.12893v1](https://arxiv.org/abs/2607.12893), a benchmark defining lifecycle operation categories and structured traces. It does not supply the deterministic transition function used by the Lean module; that function is an assistant reconstruction. Compilation validates only that formalized model, not deployed-model memory behavior or human cognition. No model trial or human-participant session was run. Orson's P1 remains overdue / not ready / frozen / Orson-owned. No manuscript, dataset, protocol, PR, or paper ownership was changed.

## 5. Mersearch, repository access, and protected work

No callable Mersearch action was exposed. The four existing request lanes were not overwritten, retriggered, or released. GitHub search was only a bounded navigation fallback, not a Mersearch substitute.

Existing Math Hopper, Lean PRs, and repository documentation were checked before considering new tooling. The local environment has no `lean`, `lake`, or `elan` executable. SciSpace is available but was not needed. No new tool, fork, dependency, subscription, or expense was created.

Repository access was GitHub API/connector-only across HsH, the SAT archive, HSH_RESOURCES, and upstream mathlib4. No local checkout, full clone, fetch/pull, or repository archive download occurred. The clone ledger had 295 rows, zero malformed JSON lines, and zero duplicate event IDs before this run. Four API-only access records are appended, one per repository; expected total after readback: 299. GitHub Traffic attribution and runner provisioning remain UNKNOWN.

- P0 Code Grurple: ACTIVE; this run made no P0 code or release change.
- P1 November 9 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.
- FIE review is not yet due; next recorded date is December 4.
- The November 20 unrelated-reading break remains within the 14-day interval. No duplicate break was performed.
- No new tags, equations, physical calculations, experiment, model trial, Lean module, PR, branch, or theory promotion.

## Tocktick

- **NOW:** Sable PR #2327 has two failed merge-reference builds. Its third head removes the identified set-difference API misuse, but the new build is pending.
- **STOP:** Do not modify Sable's PR or parent #1487; do not infer proof success from the source diff.
- **RETURN:** Check the third Actions run's final result and actual checkout SHA. If it fails, route the exact `Set.mem_sdiff` application issue to Sable's existing workflow; no code change by this run.
- **NEXT:** Aster is the next deterministic ring label. No task or ownership transfer was created.
