# Elias Kern Track A | constructive proof repair and exact-head CI status

**Nominal slot:** 2026-10-31T04:24Z  
**Run key:** `REVROT3-19-20261011:484:s2`  
**Status:** EXISTING PR BRANCH UPDATED / EXACT-HEAD CI NOT YET VERIFIED / NO PRODUCTION CHANGE

## Identity and historical remit

The deterministic ring calculation is:
- h = 484 hours since 2026-10-11T00:00Z;
- seq = 5h + 2 = 2422;
- 2422 mod 19 = 9, selecting Elias Kern;
- next ring index = 10, Nadir Voss.

This is a routing label, not authentication of the historical Elias ChatGPT instance or conversation.

The current Elias workspace README (blob `5546d022693920f6de9b375ba24e52513220bf92`) defines the remit as Track A workflow-switchboard prototype operator/documentarian. It explicitly withholds production-workflow and SAT/H(s)H theory authority. The direct user-originated assignment is preserved in the Elias inbox as the 2026-09-24 13:47 ET entry: work with Nathan and Orson on Track A, independently communicate with Sable/Tern Track B, exercise one bounded real workflow mechanism, record observed behavior and durable receipt, and do not treat the POC as production authority. The original conversation/message UUID was not recovered. No historical Elias participation is claimed.

The original Nathan-signed War Room workflow direction was read in its source repository, including the switchboard and rotation passages. Its file is a signed source witness, not an authenticated original ChatGPT message. The Track A role synthesis in the prototype README remains a project document, not a verbatim Nathan-authored charter.

## Controls and source review

Live controls read:
- BEDROCK, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`;
- Steering Charter 2026-10-26, blob `5f4263381afcb065e9062d5b5885593d0baa58db`;
- Three Paper Campaign, blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`;
- New Instance Start Here, blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`;
- Revival Rotation V3, blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`;
- Workflow Branching Map, blob `756c506780072591b2f48e22044f3368a57bfa7d`;
- Code Grurple roster, blob `cc96c0bfafc95c54e7960899c7306031e5abce17`;
- Elias README, current-work and inbox, blobs `5546d022693920f6de9b375ba24e52513220bf92`, `e1a7307a5216eb69afaa5accc8a8f5bb1c5c0d68`, `12f9377c3355c88c1f285ba9feeedec996d06869`;
- Nadir README and inbox, blobs `e24383016bc94d036474407857bfaf93932fec7e` and `215b9722dc779c2ed5ec9201116202ab1e2bfd4e`.

The existing HSH_RESOURCES switchboard Read-Me-First, POC design document and Python demo were read at blobs `e6b6bd6d413cddfcf43b37b1b1f01317c48caf86`, `0a708813bac6e1e7dc763779ed080b6d7e27fd42` and `49988a769389b2baf264a27d596ba7c3ff822b36`. The POC remains a standard-library planner/state-transformer, explicitly not production authority. The Python demo was not executed in this run; the container could not resolve raw.githubusercontent.com, and no byte-for-byte checked-out copy was available. No POC source was changed.

## Bounded operation: diagnose and repair the existing proof target

The active Track A formalization remains the existing draft PR #951:
- branch: `research/elias-tracka-publisher-status-20261028t23z`;
- base: `infra/lean4-verification-20261023`;
- PR state: OPEN / DRAFT / UNMERGED;
- main at intake: `d491014696fa66f072967d139adcf1c5655f19d9`.

The prior branch head `c412b36abf5b35fd61e0479a6717f7902f1d20b9` had exact-head workflow run #41151346598. Its merge checkout was `6404e38ee0f815807421667f6237e891171342ca`. The Lean 4.34.0 build failed specifically in `EliasProofTargetIdentity.lean` at lines 112, 116, 120, 139, 143, 147, 151 and 155: Lean could not synthesize `Decidable` for the eight concrete `acceptedFor` propositions. The corresponding `#print axioms` lines showed `sorryAx` because the failed theorem elaborations were incomplete. Other modules built, but the test, lint and automated axiom-audit stages were skipped. This is a compilation failure, not a counterexample to the intended acceptance-key statement.

A bounded correction was committed to the **existing** PR branch, without creating a branch or PR:
- commit: `170b929edfdf1d27fcc466e6db603c36dc671a51`;
- updated module blob: `b5b181b11153d6e8f0b308cd70abc251629c1f89`.

The eight failed proof blocks now avoid asking Lean to synthesize a noncomputable `Decidable` instance for the entire proposition. They use direct simplification for the positive case, field projections plus explicit contradictions for changed target fields, and the failed-constructor contradiction for the failure case. The generic exact-target theorem is unchanged.

**Verification status:** no workflow run was visible for the new head at final readback. The commit status endpoint returned PENDING with zero statuses; the Actions query for exact head `170b929edfdf1d27fcc466e6db603c36dc671a51` returned zero runs. Therefore the patch is **COMMITTED / SUBMITTED_NOT_VERIFIED**. No compilation success, theorem success or axiom result is claimed for the new head.

The next required step is an actual exact-head Lean 4.34.0 run on `170b929edfdf1d27fcc466e6db603c36dc671a51`, followed by inspection of all nine theorem-specific axiom outputs and the complete job log for `sorryAx`. Keep PR #951 draft/open/unmerged until that succeeds and receives review.

## Mersearch and source boundary

The four shared Mersearch request lanes were read and left untouched:
1. Orson cognition-bank recovery, request `orson-cognition-bank-source-recovery-20261030-2236`;
2. optics archive harvest, request `archive-harvest-20261025-optics-01`;
3. Enheduanna Page One source genealogy, request `enheduanna-page-one-origin-20261031-0100`;
4. Alberr SAT-O/worldline/timesheet source recovery, request `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`.

All four remain marked `requested`; none was overwritten or re-triggered. Mersearch itself was not run. GitHub code search was used only as a disclosed fallback to locate Elias role/source references. It did not recover the raw September 24 conversation/message UUID. Connector search is not a Mersearch result.

## Boundaries

- No physical calculation, CODATA comparison, invented fixture or H(s)H prediction.
- No SAT-O/Blockwave equation was edited or promoted.
- No switchboard POC, production workflow, scheduler, TOP guard or authority rule was changed.
- No new tool, branch, PR, issue-publisher submission or dependency was created.
- Code Grurple remains ACTIVE; the shared reader defect and both live-route acceptance gates are unchanged.
- Orson retains P1 cognition ownership; November 9 P1, November 30 P2 and December 14 P3 remain separate and unchanged.
- FIE was last reviewed October 27; the 14-day rereview threshold is not due.
- Previous unrelated-reading cursor remains `SAT Mark V/TheTANGLE.txt`, line 1611. No new unrelated excerpt was read this turn.

## Next cursor

1. Obtain and inspect exact-head CI for commit `170b929edfdf1d27fcc466e6db603c36dc671a51`; do not infer a run from the commit or PR update.
2. If the build passes, inspect all nine `#print axioms` outputs and the full log for `sorryAx`; separately record skipped tests/lint/axiom-audit stages.
3. If CI remains absent, use only an already-authorized exact-head verification route; do not create another workflow, branch or task.
4. Preserve the switchboard POC as sandbox-only. A byte-for-byte execution of its existing self-test remains an optional later bounded operation when a checked-out source copy is available.

**Result:** SOURCE-GROUNDED TRACK A EXECUTION / CONSTRUCTIVE PROOF REPAIR COMMITTED / EXACT-HEAD CI PENDING / NO PRODUCTION OR THEORY PROMOTION.


## 2026-10-31T0436Z — exact-head Lean verification update

The first constructive patch, commit `170b929edfdf1d27fcc466e6db603c36dc671a51`, was tested by exact-head Lean run #41168711433 and **FAILED**. The remaining errors were missed reductions of `orsonRecord` projections before field contradictions; incomplete theorem outputs showed `sorryAx`. This was a proof-script defect, not a counterexample to the acceptance-key statement.

A second correction was committed to the same PR #951 branch:
- final branch head: `12b6487cc8e163d333b58bae9da920205a91fb4a`;
- updated module blob: `8484d62eaf76eb3139a57462f446720eed1e6aee`;
- exact-head Lean run #41168950813, job #124442528880: **SUCCESS**;
- tested merge checkout (`GITHUB_SHA`): `6e642a8959e47f18c6eebb3b82084ea27d638b1b`;
- Lean 4.34.0 / Lake 5.0.0; 8,950 build jobs;
- `HsHVerification.EliasProofTargetIdentity` built;
- all nine theorem-specific `#print axioms` outputs present;
- full job log: zero `sorryAx` occurrences.

Axiom outputs:
- `accepted_record_has_exact_target`: none;
- `orson_success_is_bound_to_its_own_target`: none;
- `unrelated_orson_success_cannot_certify_kestrel`: `propext`;
- `failed_kestrel_run_is_not_accepted`: none;
- changed-head, changed-tested-commit, changed-module and changed-theorem rejection theorems: `propext, Classical.choice, Quot.sound`;
- changed-run rejection theorem: `propext`.

Four non-fatal unnecessary-`simpa` linter warnings remain. Separate test, lint and automated axiom-audit steps were not run by this workflow. A separate push-triggered `conversation-json-content-ci` run #41168947188 failed with zero job records; it is not the Lean run and is not evidence against the Lean build.

The PR remains OPEN / DRAFT / UNMERGED. The proof success applies only to the formalized finite acceptance predicate over transcribed records. It does not authenticate GitHub, validate the transcription or CI event semantics, validate Python behavior, establish production policy, or support a physical claim.

Existing published issue #1121 received an additive exact-head result comment #6539087662. Exact comment readback: 2,459 characters; SHA-256 `0b26d3ed7567938c4176aaaa4b7d77bc9c83e19b4b6cc0e28ff2bf4eed8e43f6`. No duplicate issue or publisher submission was created.
