# Calder :00 | Signature-aware Blockwave projector source-fidelity gate | 2026-10-27 05Z

**Run:** `REVROT3-19-20261011:389:s0`, Calder selected, next Hale at 05:12Z. Current-assistant reconstruction only, not historical Calder participation or cross-chat delivery. Existing task and hourly phase unchanged.

## Original versus translated geometry

The authenticated user-role October 30, 2025 FIE Extended message in HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/25.10.30•26.06.01•Fundamental Intuitions of SAT — raw.json` (blob `128150aef8a4a146652899bc7333bac119455881`) describes 4D filaments and a moving time surface. It does not fix a metric signature or projector.

Historical assistant-style `SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt` (blob `13b6da983ea8dcad5509b1c6941b8855a2653677`, complete 138 lines read) assumes Lorentzian `g(u,u)=-1` and uses `P=g+uu` (lines 10-22). This is **correct under that signature** with proper metric lowering. Its claim of two propagating modes does not follow from projector rank alone; the asserted independent second-class C2 needs canonical constraint analysis.

Compiled HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt` (blob `54f2f530697ab6e9c44758ce3406c4144915c73d`) instead declares Euclidean `delta(u,u)=+1` (lines 5-13) but line 112 writes `P=delta+uu`, which doubles the longitudinal component and is **not idempotent**. The same file uses the correct Euclidean `P=delta-uu` at lines 198, 314, 333, 439, 528, 580, 638, 918. Thus the conflict is internal to a compiled mathematical source, not proof of a dated Nathan correction. The original 2025 user geometry also leaves the signature underdetermined.

## Typed mapping and ledger

`Sigma_t` = time sheet; `u_E` = Euclidean unit normal; `u_L` = Lorentzian timelike unit normal; `u-flat` requires a named metric. `P_E=I-u_E tensor u_E-flat` and `P_L=I+u_L tensor u_L-flat` are different signature-aware formulas. An induced Householder `g_H=delta-2uu` may relate adapted frames algebraically but does not establish physical equivalence or dynamics. Discrepancy states: `HISTORICAL_CONDITIONAL_VALID`, `SOURCE_INTERNAL_SIGN_CONFLICT`, `INTERNAL_CORRECT_FORMULA_PRESENT`, `DYNAMICS_MISSING`, `DIRAC_CLASS_UNVERIFIED`, `USER_GEOMETRY_UNDERDETERMINED`.

## Formal proof and limits

Reused existing Lean 4.34.0 / Mathlib v4.34.0 infrastructure, no new parser. Draft PR #679, head `928dc28722916f265df33e10ef500f5e4a13cc76`. New source `FORMAL_VERIFICATION/HsHVerification/CalderProjectorSignature.lean` blob `68a99585644aa217cba679809adb17f170d1a2cb`; root import blob `ce3017d02f93846d3c6be75257bd24bd67802b8b`, both independently read back. Four theorems test plus non-idempotence, minus idempotence, longitudinal annihilation, and Lorentzian mixed-index plus correspondence. `#print axioms` included. **CI run #40452940342 in progress at packet creation; no verified compile yet.** No physical calculation or theory promotion.

All four Mersearch request lanes occupied; none overwritten. Bounded original GitHub reads used, not Mersearch or complete three-root search. Current BEDROCK, steering, campaign, onboarding, rotation and Calder specialist charter inspected. Next Hale: verify actual CI/axioms, then independently examine C1/C2 Poisson brackets before accepting ghost-free/second-class assertions. No scheduler, license, signet or chat mutation.
