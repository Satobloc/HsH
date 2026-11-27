# Ravel h1139:s3 — relative-mode calibration cancellation gate

**Nominal slot:** 2026-11-27T11:36:00Z  
**Run key:** `REVROT3-19-20261011:1139:s3`  
**Selected routing label:** Ravel (index 17)  
**Next routing label:** Orson Vay (index 18)  
**Disposition:** `CONDITIONAL_OBSERVABLE_REFINEMENT / LEAN_SUBMITTED_NOT_VERIFIED_AT_REPORT_FREEZE / NO_MEASURED_SYSTEM / NO_THEORY_PROMOTION`

This is assistant-level work under the deterministic Ravel routing label, not authenticated participation by a historical Ravel instance or conversation.

## 1. Historical remit and source boundary

The historical Ravel role is supported by direct user-role messages in the raw Syncmathcek export: primary co-theorist (2026-09-07), conceptual cohesion/drift detection/epistemic hygiene/full-theory probing/methodological-risk review (2026-09-08), and accuracy-first public record plus accessible citation lineage (2026-09-13). No standalone signed specialist charter or authenticated current Ravel thread was recovered. The raw export is conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`, SHA-256 `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`, Git blob `17cfe3feb830f70009557d063482b35adba0834b`.

Preflight covered live BEDROCK, Steering Charter, Three Paper Campaign, onboarding, Revival Rotation V3, Mersearch guidance, current main, current Ravel source/continuity, recent receipts, PWH queue, task graph, P0 control, existing Lean PRs and the relevant historical specialist material.

Mersearch was checked first. No callable Mersearch action was available in this execution; all four canonical request lanes remain occupied. No lane was overwritten, released, or retriggered. Existing Ravel records show prior checks of Math Hopper #578 / Lean PR #991, Whirligig Kernel 0 and SciSpace; this run reused the existing Lean CI and did not introduce a tool, dependency, fork, subscription or expense.

## 2. Substantive improvement: relative complex-mode readout

The existing Ravel sandbox `WORKSPACES/RAVEL/SANDBOX_2026-10-07_TWIST_PROFILE_TOMOGRAPHY.md` is explicitly `GEN/CANDIDATE`, not canonical H(s)H. It defines the candidate complex response

\[
Z_n(L)=\epsilon_C e^{2i\psi_{\rm det}}G_n(L).
\]

Here \(\epsilon_C\) is a common anisotropy amplitude and \(\psi_{\rm det}\) a common detector-frame orientation in that sandbox representation.

The new conditional observable is the relative complex mode ratio

\[
R_{nm}(L)=\frac{Z_n(L)}{Z_m(L)}
          =\frac{G_n(L)}{G_m(L)},
\]

provided the common factor is nonzero and \(G_m(L)\ne0\).

**New architectural consequence:** if the same complex calibration factor multiplies every mode, the relative ratio cancels both the common amplitude and common detector-frame phase. A candidate distributed-twist test therefore need not use absolute detector orientation as its primary discriminator; it can compare relative complex responses across modes and lengths.

The domain restrictions matter:

- If \(\epsilon_C=0\), the orientation-sensitive signal vanishes and the ratio is undefined.
- If the reference mode \(G_m=0\), that ratio is undefined at a coherence zero.
- If the detector transfer is mode-dependent, \(Z_n=c_nG_n\), the common factor does not cancel unless the relative transfer \(c_n/c_m\) is independently calibrated or modeled.
- The cross-product identity \(Z_nG_m=Z_mG_n\) avoids division, but at coherence zeros it does not supply a usable phase ratio.

This improves the proposed measurement architecture by identifying a calibration-invariant candidate channel and its exact failure conditions. It does not show that the sandbox integral is a physical readout, that a real detector has mode-independent calibration, or that H(s)H possesses a measurable material-twist profile.

## 3. Lean formalization

Added to the existing Ravel branch for PR #1133:

- Branch: `research/ravel-carrier-slice-reconstruction-20261031t0212z`.
- Module: `FORMAL_VERIFICATION/HsHVerification/RavelTwistModeCalibrationCancellation.lean`.
- Module commit: `66e8e922324a3c2f9031757ced06ac13bfc14ee9`.
- Module blob after readback: `486505a11cd2c1f41c4fc73b1ea0568b04a76768`.
- Root aggregator commit: `1070d8657c2633cbf6f70cfd4b6444cbe7b8be3e`.
- Aggregator blob: `0edaa3a892c02be9c018a4aa4e8b914cc26ca6d2`.

The module proves:
1. common nonzero multiplicative calibration cancels from a relative mode ratio when the denominator mode is nonzero;
2. the corresponding cross-product identity, without division;
3. an executable rational smoke expression is included.

Exact-head Actions run [#45991965979](https://github.com/Satobloc/HsH/actions/runs/45991965979), job `140481744816`, was **IN_PROGRESS** at report freeze. Checkout had not yet completed; the exact-head assertion, Lake manifest, Lean compilation, #eval output and theorem-specific axiom reports were still pending. No Lean success is claimed. No retry or duplicate run was initiated.

The new module is on the existing PR #1133 branch; PR #1133 remains OPEN / DRAFT / UNMERGED and stacked on the unmerged Lean infrastructure parent #262. No rebase, merge, or base change was attempted. The PR received an informational source/scope comment, not an independent review or approval.

Lean verifies only the encoded field identities. It does not validate the source-to-model translation, detector calibration, mode response, physical twist, or H(s)H premises.

## 4. Source and epistemic status

- **Historical source:** direct Ravel user messages establish the co-theorist/epistemic-hygiene remit; they do not establish this tomography equation.
- **Assistant reconstruction / GEN-CANDIDATE:** the twist-profile sandbox and its response formula. It remains quarantined from canonical theory.
- **Standard mathematics:** cancellation of a common nonzero field factor in a ratio.
- **Physical measurement:** none acquired or analyzed.

No SAT-O or Blockwave equation was retrieved, changed, corrected or reattributed. No physical system was selected; no data, calibration, covariance, fit, prediction, numerical falsification threshold or independent measurement was produced.

## 5. Project and governance controls

- P0 Code Grurple remains source-level presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. Meridian retains implementation, Mercer independent A/B QA, Tern release authority.
- P1 cognition remains overdue/frozen and Orson-owned.
- P2 November 30 measured-system paper remains HOLD.
- P3 December 14 full-theory paper remains incomplete.
- FIE rereview remains due December 8.
- The unrelated-source break is due November 28; it was not performed early in this run.
- PWH queue and task graph were read but not written under the P0 interlock.
- No BEDROCK theory promotion, paper-gate advancement, task/ID/schedule/phase mutation, signet, conversation rename, or sixth task.

## 6. Successor and scheduler boundary

Next deterministic ring label: **Orson Vay**. This geometry/readout work is outside Orson's protected P1 cognition remit; no assignment or ownership transfer is made. No direct Orson-thread delivery, consumption or acknowledgment is claimed.

The existing Workshop Relay :36 task remains enabled with its original ID `6a9f52b69ec08191b0a2ba24a074f781`, original hourly America/New_York :36 VEVENT, and Worldtube phase unchanged. The current invocation was still in progress at report freeze; its cached prior result belongs to Tern h1138:s3 and is not attributed to this Ravel run. No scheduler mutation occurred.

## Return cursor

First read back the final status of exact-head Lean run #45991965979. If successful, record the exact checked-out head, build count, actual #eval output, theorem-specific axioms, and skipped audits. If failed, preserve the failure and repair only the demonstrated source issue on the existing branch. Then obtain independent review of the conditional common-calibration assumption before treating the ratio as an experimental design. Keep the sandbox GEN/CANDIDATE and P2 HOLD until a real, authorized measured system, mode-resolved data, mode-dependent calibration, covariance and independent holdout exist.
