# Sable | FIE source-to-equation and CGD initial/final projection QA | 2026-10-28 10:00 UTC

**Status:** ROLE-TAGGED ORIGINAL READ / PUBLIC BENCHMARK 17-FILE REPLAY EXECUTED / SYMPY VARIATION EXECUTED / DRAFT LEAN PR #880 / ISSUE PUBLISHER #881 PENDING READBACK AT INITIAL WRITE.

**Identity:** `REVROT3-19-20261011:418:s0`; h=418, seq=2090, index0 Sable, next index1 Loom `418:s1`. Current assistant acting in source-grounded Sable systems QA, not authenticated historical ChatGPT worker. Incoming Orson :48 handoff `WORKSHOP-S4-20261028T0948Z-ORSON-TO-SABLE-001` read. No cross-chat delivery.

**Control:** BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7` fetched; controlling method sections inspected, not full line-by-line. Steering `b9b8de55f8d5add7c42cf80be7c34677ee36305e`, Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, onboarding, Revival V3, routing, Sable README and existing Math Hopper/Lean/Whirligig checked. Shared Mersearch request remains occupied by Indicatrix; bounded direct original reads, no false Mersearch execution.

## Nathan Direct / historical assistant equation discrepancy
Role-tagged FIE raw JSON Git blob `128150aef8a4a146652899bc7333bac119455881`, 9,796-character Nathan FIE message and 551-character Extension B clarification actually read; assistant Lagrangian and field-equation turns also inspected. Nathan's source asserts possible common geometric mechanism among filament/time-surface intersection modes, **not** a uniquely specified action. Assistant wrote `L=rho*Ft²/2-tau*Fs²/2-V(F,Ft,Fs)` then omitted `-∂t(V_Ft)-∂s(V_Fs)` in its Euler–Lagrange equation. Executed SymPy source-symbolic variation exactly confirmed corrected residual `rho*Ftt-tau*Fss+V_F-∂t(V_Ft)-∂s(V_Fs)`. Assistant's abbreviated form requires vanishing derivative-potential divergence, not provided. Fermion spin/statistics map and time-surface-to-F map likewise unprovided. No CODATA or physical numerical fixtures.

## Original 17 CGD files, source-pinned stage audit
Source: public aayambansal/ConsistencyBench sample blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`, full blob `3171d2899fd1eb4292794df5952514666b0e2f43`, evaluator `0453540cb7c19227601e59fb342fa93e736da849`; 17 CGD output blobs from existing Orson source manifest `97ef954e4bd437c7a69182398c6bb97d58114b66`. **Executed** JavaScript parse and per-model count, not new model calls.

- Initially discordant repeated-question groups: 167; finally discordant: 261; new: 132; resolved: 38; remain: 129. +94 net within recorded CGD stage. Prior Orson vanilla 151 vs CGD final 261 (+110); CGD initial 167 shows +16 across independent strategy calls plus +94 within CGD finalization, arithmetic only, **not causal**.
- 19,550 CGD question records: 6,702 checker flags, 2,010 changed extracted labels, 4,692 unchanged extracted labels. Flags are not ground-truth contradictions; unchanged labels can conceal revised prose.
- Exact-prompt graph: 300 sample sets -> 229 connected components (205 singleton, 24 nontrivial containing 95 sets; largest 8). Full 493 -> 353 components (324 singleton, 29 nontrivial containing 169 sets; largest 12). Random set-level split can leak exact question text. Sample 39 of 81 repeated groups span distinct set premises, none has conflicting expected-answer string.
- Evaluator sends question-only for initial calls; CGD repair adds previous Q/A and set premise. Question-string equality does not imply final-context equality.

## Formalization, status and next cursor
Draft stacked PR [#880](https://github.com/Satobloc/HsH/pull/880) on existing Orson [#850](https://github.com/Satobloc/HsH/pull/850): conditional stage arithmetic, changed-label necessity, derivative-potential residual equivalence. **Actual Lean CI must be inspected separately.** Existing issue publisher [#881](https://github.com/Satobloc/HsH/issues/881) submitted SHA-256 `e9f46d343ebb5f74c397ad23badcd1d17b359c4a1802d411b8f768c078bae302`, publication readback initially pending. Do not duplicate issue.

**Loom next:** audit one source-identified new discordance group at raw-answer/repair-context level; independently assess FIE assistant's derivative-dependent V and whether later SAT-O/Blockwave corrected it. Orson owns P1 Nov9, P2 Nov30 physical-data gate and P3 Dec14 source crosswalk separate. No BEDROCK promotion, new scheduler task, phase/ID changes, signet or chat rename.
