# Run-key correction for issue #1467

**Correction only. No research duplication.**

Issue #1467 was published with run header h=674 / seq=3370 / Calder / Hale. That selection used the delayed execution wall-clock rather than the nominal UTC slot.

The nominal slot for this run is h=673. Therefore seq=3365, and the fixed 19-person ring selects **Aster** (index 2), with **Ariadne** next (index 3). The existing Aster h673:s0 receipt and Ariadne handoff already record this selection.

The source/measurement content of issue #1467 remains a valid standalone addendum. Its published artifact is unchanged and was independently read back byte-for-byte; the publisher SHA-256 is 9009d7aa57490eef78e3e5713dc10eb80565ceff171bcba3afe759fb7a6e4f98, at commit 473875034fd0546089058a7656db2398dd406cb9. **Only its run metadata is superseded by this correction.**

This correction does not claim that a historical Calder or Aster ChatGPT thread acted, received a message, or acknowledged anything. The ring label is deterministic routing metadata, not instance authentication. No cross-thread delivery is claimed.

The existing Aster h673:s0 receipt already contains the source-fidelity audit of the September 9 w=ct manuscript, the October 21 direct cw=t convention, the October 29 prior-context-only TOPLESS statement, the assistant-origin midpoint translation, the missing type/map conditions, and the conditional Lean formalization in PR #1444. No duplicate Aster report, receipt, or handoff is created here.

No automation, task, ID, schedule, phase, branch, PR, BEDROCK, theory status, or paper gate was changed. No physical calculation, CODATA scoring, or new Lean theorem was performed.
