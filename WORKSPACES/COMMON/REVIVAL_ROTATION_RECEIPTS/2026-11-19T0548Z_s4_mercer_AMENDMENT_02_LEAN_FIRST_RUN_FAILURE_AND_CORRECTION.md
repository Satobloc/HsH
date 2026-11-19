# Amendment 02 | First Lean run failure and correction | Mercer h941:s4

**PR:** https://github.com/Satobloc/HsH/pull/2068  
**First run:** #44472753653  
**First PR head:** 575aa200404ffd6c7155b72a703c2781556d29e3

The workflow's “Assert exact PR-head checkout” step passed: expected and actual checkout were both 575aa200404ffd6c7155b72a703c2781556d29e3.

The Lean build failed only in theorem wanted_ai_initiated_can_still_request_consultation. The proof used rfl on a nested conjunction; Lean correctly rejected that tactic. The failed declaration's printed axiom set included sorryAx, so it is not a verified theorem. The other three theorems printed no axiom dependencies. The two #eval comparisons printed true and true. The library build failed; tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

The same PR branch was corrected without creating a second PR:
- Replaced the conjunction proof with simp [beneficialConsultative].
- Correction commit: cdb12cba55e48cbd21e459442c71bfc81e8e16a4.
- Corrected PR head: cdb12cba55e48cbd21e459442c71bfc81e8e16a4.
- New exact-head workflow run: #44473388114, IN_PROGRESS at this amendment.

No LEAN_VERIFIED claim is made until the corrected exact-head run completes and its build, #eval outputs, and theorem-specific axiom reports are read. No merge, approval, Factory Floor intake, or theory promotion. If the corrected build succeeds, a separate HsH FACTORY_HANDOFF_PENDING packet will record that Factory Floor's geometry-first gate is not met; no Factory Floor submission is planned.

This amendment records a genuine proof correction, not an empirical result. The formalization remains source-bounded and does not validate the paper's annotations or generalize to all human users.
