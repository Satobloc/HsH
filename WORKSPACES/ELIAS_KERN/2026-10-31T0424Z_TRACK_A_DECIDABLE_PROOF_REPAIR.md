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
