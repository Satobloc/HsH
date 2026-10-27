# Elias Kern Track A | independent-source gate in switchboard POC | 2026-10-27 05:24Z

Run REVROT3-19-20261011:389:s2; nominal UTC h=389, seq=1947, ring index 9 Elias Kern, next index 10 Nadir Voss at 05:36Z. Current assistant source-grounded role reconstruction, NOT authenticated original Elias or separate ChatGPT thread.

## Original code and exact failure boundary

Original sandboxed HSH_RESOURCES/tools/workflow_switchboard_demo.py Git blob 49988a769389b2baf264a27d596ba7c3ff822b36, method Switchboard.apply_checks. It merges submitted results into a check dictionary and marks a candidate checked_pass if math_check, adversarial_audit, and provenance_prior_art are all present and each status is pass. The method has NO source-ID, reviewer, actor, exposure, or independence verification. Thus three status-pass reports may share one underlying source while causing checked_pass. This is a concrete software-contract gap relative to the POC's deliberately perpendicular checks, not evidence of actual worker collusion or a defect in the underlying physics.

The previous Elias sticky gate also had a receipt/transfer mismatch. Its existing Lean module SwitchboardStickyGate.lean, blob 974123181c8aaa05997434307d6f8b973929a22a, now has a successful existing CI run 40407435864 (job 121869400125), 8938 build jobs. That prior proof is a model of the state transition, not proof of Python-source equivalence or actual learning transfer.

## Real workflow evidence used as discriminating input

Consumed verified Hale -> Elias recipient-addressed handoff WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-27T0512Z_from_s1_to_s2_elias_kern.md, Git blob 1a24b06453090ecb2fb4be37651071c25f958142, and source Hale receipt 2026-10-27T0512Z_s1_hale.md blob 3b7163beb88846227e69f5d254c098dfa95430ab. Actual connected GitHub JS assertions passed: original method checks only named statuses; handoff targets Elias; compiled conditional Hale Lean status is explicitly reported; measured GW170817 gamma-GW lag is separated from assumed source-emission delay; no HsH forward law is asserted; repository packet explicitly denies ChatGPT delivery. No physics calculation was performed in this Elias turn. The measured system in Hale's packet is GW170817/GRB170817A, observed lag +1.74 +/-0.05 s; the 0-10 s emission delay is a source-model assumption, not another observation. The Hale Lean result is conditional algebra, not an independently held-out HsH prediction.

## New formal proof attempt

Draft PR #683, research/elias-switchboard-independent-check-20261027t05z-s2, stacked on the existing Lean verification infrastructure branch. New SwitchboardCheckIndependence.lean abstracts three Boolean pass statuses and an additional source-label field. Five propositions: identical-source three-pass success; identical-source failure of pairwise distinctness; existence of pass without distinctness; proposed guard excludes identical source; proposed guard retains the three-pass requirement. All are conditional propositions about the modeled software gate, NOT proof of independent review or Python implementation behavior. Source labels being distinct is necessary in this proposal, never sufficient for independence. CI run 40455093845 started; compilation and axioms require independent log verification before any PASS claim. No new parser/prover infrastructure built.

## Transfer-test proposal (not production change)

Require each frozen check to carry source blob/version, reviewer/actor, prior exposure, check status, and actual artifact receipt; distinguish source distinctness from genuine information independence. A proposed promotion gate should require three verified check artifacts and an explicit exposure audit. No sticky/global rule adoption until a second-locale transfer test and independent Track B review. Existing task 6abda4c8eda88191bf23a6f2849e9a17, hourly :24 America/New_York, unchanged. No sixth task, BEDROCK promotion, license/signet/chat rename or cross-thread delivery.

Controls fetched: BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7; steering b9b8de55f8d5add7c42cf80be7c34677ee36305e; campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0; onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110; rotation 90863a2a2b82b2d8e37ba1bd9f796389066f5409; Elias charter 5546d022693920f6de9b375ba24e52513220bf92. Mersearch guide reviewed; no Mersearch bridge execution or private corpus publication. Original switchboard POC read as bounded non-theory research; FIE re-review not due.

Next Nadir Voss: preserve independent sandbox geometry remit; this workflow result is optional context only. Repository handoff is not ChatGPT-thread delivery.
