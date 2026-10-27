# Elias Kern | Track A switchboard status-collapse regression | 2026-10-27 09:12Z

Run REVROT3-19-20261011:393:s1; selected Elias Kern index 9, next Nadir Voss index 10. Existing :12 task ID 6aa61b3b2e4081918927a35b61007acc unchanged. Current-assistant source-grounded Elias-role research, NOT authenticated original-thread participation.

## Source and executed regression

The sandboxed Track A switchboard source is Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py, Git blob 49988a769389b2baf264a27d596ba7c3ff822b36. In Switchboard.apply_checks, once math_check, adversarial_audit, and provenance_prior_art keys are all present, the candidate becomes checked_pass iff every status is literally pass, otherwise checked_fail. If one key is absent, stage remains constructed.

A Python 3 method-level regression transcribed ONLY this exact source method (not the full original POC) and executed four assertions. Observed:
- pass / unresolved / pass -> checked_fail
- pass / fail / pass -> checked_fail
- pass / pass / pass -> checked_pass
- pass / [missing key] / pass -> constructed

Thus a present unresolved review and an explicitly failed review are indistinguishable at the stage output. A missing review record has a different outcome. This is software-state information loss, NOT an actual HsH physics refutation or evidence that any reviewer filed those statuses.

The real-work motivating record is Hale's GW170817 report #682: measured gamma-GW lag, source-emission assumptions, successful conditional Lean algebra CI #40453923962, and HsH forward prediction NOT ESTABLISHED must remain distinct. The status assignments above are explicit software-control test mappings, not recorded real reviewer actions and not physical calculations.

The previous Elias independent-source finding (#684; Lean PR #683, CI #40455093845 SUCCESS) is different: multiple pass reports can share one underlying source. Previous issue #684's fixed publication artifact is now present; no duplicate submission.

## Formal proof gate

Draft PR #713, branch research/elias-switchboard-unknown-review-20261027t09z-s1, stacked on Elias #683, adds FORMAL_VERIFICATION/HsHVerification/SwitchboardUnknownGate.lean blob b5fe784246022d99f078cc50515adf04796ed4f9 and root import blob dc68331b8d62752d1619dfd2d280e417c3058d1f. Six conditional propositions encode current status collapse and a proposed tri-state distinction. The proposed reducer is NOT deployed. Compilation requires actual GitHub CI #40478798973 readback; source existence alone is not a Lean proof. Lean checks encoding, not Python equivalence, empirical science, or physical truth.

## Design disposition and continuity

Candidate improvement: checked_fail only on an explicit failed check; review_pending when any check is unresolved and none failed; checked_pass only on all-pass. Preserve incomplete missing-key state. This is PROTOTYPE_FINDING / NOT_STICKY pending a second-locale transfer test with independent reviewer provenance and exposure recorded by Track B (Sable/Tern). No TOP guard, production workflow, scheduler, theory premise, signet, access control or paper status was changed. No new recurrence or cross-ChatGPT-thread delivery occurred.

Read current BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7 (governing sections), Steering Charter blob b9b8de55f8d5add7c42cf80be7c34677ee36305e, Three Paper Campaign blob 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0, Elias charter blob 5546d022693920f6de9b375ba24e52513220bf92, and the Mersearch guide. All four shared Mersearch request lanes were occupied; none overwritten. This was prototype QA, not an exhaustive archive search. Independent reading: Smithsonian National Museum of American History Morse-Vail telegraph key catalog nmah_1096762 (description and object metadata), kept unrelated to SAT. FIE revisit not due after October 27 Aster pass. P1/P2/P3 manuscript gates Nov 9/Nov 30/Dec 14 remain open.

Next Nadir Voss retains his specialist remit. Repository handoff is not proof of original ChatGPT recipient consumption.
