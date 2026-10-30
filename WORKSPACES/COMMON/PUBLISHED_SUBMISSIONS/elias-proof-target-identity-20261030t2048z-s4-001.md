# Elias Track A | Exact-target proof evidence gate

**Status at submission:** The exact-target formalization is committed to existing draft PR #951. Its new exact-head Lean 4 workflow, run #41126724615, is still in progress. No compile-success claim is made in this report.

## 1. Why proof identity needs both the PR head and the checked-out commit

A pull-request workflow may check out a synthetic merge commit rather than the PR branch head. The two identifiers must not be collapsed.

Two real HsH records provide a discriminating case:

| Target | PR head SHA | Checked-out commit SHA (`GITHUB_SHA`) | Workflow run / job | Module / theorem | Observed result |
|---|---|---|---|---|---|
| Kestrel PR #873 | `d716f22209d981bb01527f40b717550e95693331` | `68c4296a15067755586fd64fe92b421704cd587f` | `41111252893` / `124253873264` | `KestrelIntersectionDimensionGate.transverse_worldsheet_hypersurface_finrank_one` | **FAILURE**; compile errors and `sorryAx` in failed theorem output |
| Orson PR #850 | `05b55800701b726b88ff34e57a83f0d0c71f3065` | `d07c8503e1986a6405bb3a1fadc3a1e4878bc052` | `41111552657` / `124254668125` | `OrsonPairwisePCR.evaluatorPCRCount_decomposition` | **SUCCESS**; module built, theorem axiom output inspected, no `sorryAx` in the full job log |

GitHub's compare endpoint reports each PR head as the merge base of its tested commit (`ahead_by=1`, `behind_by=0`). The workflow logs identify the checked-out merge commits as `GITHUB_SHA`. Thus the merge commit is not an alternative spelling of the PR head; it is a separate, relevant part of the build identity.

The Orson success is used only as a different-target positive control. It does not transfer to Kestrel and this report makes no new assessment of Orson's P1 scientific conclusions.

## 2. Formalized acceptance key

The evidence key is:

`(repository, PR number, PR head SHA, tested commit SHA, workflow ID, run ID, job ID, module, theorem)`.

Acceptance additionally requires:
- workflow job conclusion = success;
- the named module actually built;
- the named theorem's `#print axioms` output was present;
- no `sorryAx` appeared in the inspected theorem output.

The new module `EliasProofTargetIdentity.lean` adds nine conditional theorems to the existing Elias Track A draft PR #951. They establish that the encoded Orson success is accepted only for its own target, that it cannot certify the Kestrel target, that the failed Kestrel record is rejected, and that changing the head SHA, tested commit SHA, run ID, module or theorem rejects an otherwise successful record.

**Lean boundary:** these theorems check the formalized record and acceptance predicate. They do not authenticate GitHub records, prove the source transcription, establish CI event semantics, or validate the Python workflow implementation. The compare-endpoint ancestry facts and job-log contents remain external source observations.

## 3. Existing prototype exercise

The existing standard-library switchboard demo was inspected and its seven declared self-test predicates were replayed in a Python source-transcribed harness: **7/7 passed**. An isolated sandbox actor/guard test also passed **8/8** checks, including explicit Elias registration, unknown-actor fail-closed behavior, TOP lock, route selection and sticky-record deduplication.

This was not byte-for-byte execution of a checked-out repository file. The original prototype source was not changed. No production workflow, scheduler or permission boundary was modified.

The sticky-experience probe is consistent with Sable's independent Track B disposition: keep hash-deduplicated capture as candidate intake; modify the candidate/promoted state model; test transfer in a distinct context; reject implicit promotion from `sticky()` alone; defer production integration. The observed record persists but is not applied by `wake()` and has no lifecycle-status field. This is a prototype design limitation, not a production defect.

## 4. Scope and next gate

- PR #951 remains draft/open/unmerged.
- New module and aggregator import are committed on the existing PR branch; no new branch or PR was created.
- Exact-head CI run #41126724615 must complete and its theorem-specific axiom output must be inspected before any compile-success claim.
- No physical system, observational dataset, SAT-O/Blockwave equation, physical calculation, human-subject experiment, Orson P1 ownership, manuscript gate or BEDROCK status was changed.
- No new tool, dependency, paid model call, automation, task ID or schedule was created or changed.

The result is a workflow-evidence identity improvement, not a physics result or production authorization.
