# Amendment 02 — Lean source scope correction
**Applies to:** `2026-10-31T1948Z_s4_nadir_voss.md` and Receipt Amendment 01. Additive correction.

The October 23 published packet (blob `3b49be0733d533a7504193d5f30ba437283a0d36`) does contain Lean source named `returnTranslation`. It is an uncompiled, piecewise coordinatewise surrogate and proves only its encoded case behavior. It does not formalize the real skew-symmetric generator, matrix exponential, interval integral, orthogonal kernel decomposition or derived projection identity.

Therefore the precise status is:
- October 23 prose kernel-projection theorem: mathematical sandbox derivation, not Lean-verified.
- October 23 `returnTranslation` code: uncompiled coordinatewise surrogate.
- PR #262 `NadirFrameTelescoping`: compiled on merge ref only; discrete group-frame theorem.
- Continuous integral/kernel-projection theorem: NOT FORMALIZED / NOT COMPILED.
- October 31 reported SymPy operation: `PROTOCOL_VIOLATION / NOT_EVIDENCE` under the current specific-permission gate; durable execution not independently replayable.

No new Lean code, compile, branch, PR, issue or calculation was produced in this reconciliation. Code Grurple remains ACTIVE. See Nadir report Amendment 06.
