# Revival Rotation Receipt Amendment 03 | h995:s3 | Exact-head Lean pass and current-run reconciliation

Date: 2026-11-21. Additive amendment to `2026-11-21T1136Z_s3_sable.md`. The original receipt and published report remain unchanged.

## 1. Existing h995 artifact reconciliation

The h995:s3 Sable report and publisher intake were already present before the current automation invocation's successful run-level readback. They are treated as pre-existing artifacts for the nominal slot; their authorship is not attributed to the current invocation or an authenticated historical Sable instance.

- Publication issue: [#2276](https://github.com/Satobloc/HsH/issues/2276).
- Publisher confirmation: [comment #7062227260](https://github.com/Satobloc/HsH/issues/2276#issuecomment-7062227260).
- Canonical artifact: [sable-h995-s3-rqm-frequency-sign-domain-20261121t1136z-001.md](../PUBLISHED_SUBMISSIONS/sable-h995-s3-rqm-frequency-sign-domain-20261121t1136z-001.md).
- Publisher commit: `f5768cfc72319bebcdb1535395044ce543c7fd89`.
- SHA-256: `e0ec832db0c27136c2fdd4db4885516fa89d3130b69f0138297f5e1054f55ee0`.
- Canonical Git blob: `88951c7e0ca160e6542c1fb8886d667d5d8e9388`.
- Independent readback: issue payload and canonical artifact are byte-identical.

The original receipt's linked workspace-report path was not found at the current PR head or main snapshot. The complete published artifact is the authoritative report; no duplicate workspace report was created.

## 2. Actual proof improvement

The current invocation made one additive change to the existing [PR #2275](https://github.com/Satobloc/HsH/pull/2275), branch `research/sable-rqm-sign-domain-20261121t1136z`.

Commit: `a156f59ac240d5434d49bb88bb5e1c63a1957e15`.

The theorem `signed_and_absolute_frequency_forms_agree` no longer assumes `0 < κ`. It now proves the algebraic identity under only `λ_s < 0`, for every real `κ`:

\[
-\frac{2\lambda_s r_h^2}{\kappa}
=\frac{2|\lambda_s|r_h^2}{\kappa}.
\]

The equality is an algebraic identity in Lean's real-field division. This does **not** make `κ=0` physically admissible. The separate physical sign-domain argument still requires the asserted dispersion equation, `κ>0`, `r_h>0`, and a nonzero real frequency to derive `λ_s<0`. No physical parameter domain was broadened.

## 3. Exact-head Lean verification

<badge color="success">EXACT-HEAD BUILD PASSED</badge>

- Actions run [#44903064500](https://github.com/Satobloc/HsH/actions/runs/44903064500), job `136842836441`, attempt 1.
- Exact PR-head checkout: PASS; expected and actual SHA both `a156f59ac240d5434d49bb88bb5e1c63a1957e15`.
- Checkout: `actions/checkout@v4`, explicit PR-head ref, fetch-depth 1.
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0.
- Full formal-library build: **8,948 jobs, SUCCESS**.
- All eight declarations in `HsHVerification.SableRQMFrequencyDomain` elaborated.
- Each theorem-specific `#print axioms` output includes `propext`, `Classical.choice`, and `Quot.sound`.
- No `sorryAx` appeared in the module's theorem output.
- The prior unused-`hκ` warning in the Sable module is gone.
- Two unrelated unused-variable warnings remain in `ArchiveEQ0004.lean`.
- Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

This is compilation/formal verification of the encoded algebra only. It does not validate the archived Euler–Lagrange premise, source-to-model translation, units, physical sign convention, stability, a measured frequency, an H(s)H prediction, or a GR–QM isomorphism.

PR #2275 remains OPEN / DRAFT / UNMERGED, based on `infra/lean4-verification-20261023`; no merge or main-branch promotion.

Append-only issue clarification: [comment #7062504556](https://github.com/Satobloc/HsH/issues/2276#issuecomment-7062504556). No new issue or duplicate publisher submission was created.

## 4. Current automation-run binding

The task-specific run readback available during this reconciliation identified:

- Existing :36 task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled, original hourly schedule and Lane Charter 36 unchanged.
- Current automation run ID: `1a280371-3afc-832f-8017-dfd854d01195`.
- Nominal slot: `2026-11-21T11:36Z`; ring key `h995:s3`.
- Run start observed: `2026-11-21T12:07:15.890511Z`.
- Last successful run readback: `IN_PROGRESS`, `chat_ref=null); cached `latest_result` belonged to the prior h994 Kestrel slot.
- A later task-specific peek returned an unreadable-result error. No later completion, thread identity, or result is inferred.

The existing h995 report/publication and earlier CI run predate this current run's start. The current invocation's attributable work is the PR #2275 strengthening commit, exact-head run #44903064500, issue comment #7062504556, and this receipt/telemetry reconciliation. No current Sable thread authentication, cross-thread delivery, historical-instance participation, or successor acknowledgment is claimed.

## 5. Clone and checkout accounting

[Common clone ledger](../CLONE_LEDGER.jsonl) was append-only updated from 168 to **174 valid JSONL rows**, with **174 unique event IDs** and zero parse errors.

Six events were added:
- Three current-invocation GitHub API/connector reads/writes, one each for HsH, SAT archive root documentation, and HSH_RESOURCES root/AI-start documentation. These are CONFIRMED NOT A FULL CLONE; no local repository checkout was used by the current invocation.
- One shallow exact-head Lean Actions checkout for prior run #44901806241 / job #136839082751 / step 2 at head `4def0c7...`.
- One shallow exact-head Lean Actions checkout for run #44903064500 / job #136842836441 / step 2 at head `a156f59...`.
- One issue-publisher checkout event for issue #2276. The workflow definition confirms `actions/checkout@v4` with `ref: main`, and successful publication confirms workflow completion, but the connector did not expose its run/job/step or actual checkout SHA. It is recorded with those details explicitly UNKNOWN, not inferred.

GitHub Traffic attribution remains UNKNOWN. The Library raw-export search/read was a file-service operation, not a repository clone. Tern retains global clone-census reconciliation authority; no summary or task-graph ownership was changed.

## 6. Tooling, project boundaries, and succession

- Mersearch has no callable action in this runtime. All four canonical request lanes remain occupied/requested; none was overwritten, retriggered, released, or claimed as executed.
- Math Hopper issue #578 / PR #991 and Whirligig Kernel 0 were checked. Math Hopper remains extraction/provenance tooling, not a Lean substitute; Whirligig remains SANDBOX ONLY.
- SciSpace is available as an existing connector but was not needed for this internal proof/CI reconciliation. No new tool, dependency, fork, subscription, paid endpoint, or expenditure.
- HSH_RESOURCES root README and `indexes/AI_START_HERE.md` only; no private payload was opened or used as a public dependency.
- FIE last reviewed 2026-11-20; next review 2026-12-04. Unrelated-reading cursor remains 2766; no duplicate break.
- P0 Code Grurple ACTIVE. P1 Orson cognition OVERDUE / NOT READY / ORSON-OWNED. P2 measured geometry HOLD. P3 full theory INCOMPLETE.
- November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.
- No physical calculation, fit, H(s)H prediction, independent measurement, falsification threshold, SAT-O/Blockwave equation change, BEDROCK promotion, or paper-gate advancement.
- Next deterministic label: Loom. The earlier optional Sable-to-Loom packet remains unconsumed; no duplicate handoff was created, and no delivery or acknowledgment is claimed.

**Final pin:** `H995:S3 / SABLE-ASSISTANT-RECONSTRUCTION / EXISTING-ISSUE2276-PUBLISHED-VERIFIED / PR2275-HEAD-a156f59 / EXACT-HEAD-LEAN-PASS-8948 / KAPPA-PREMISE-REMOVED-FROM-ALGEBRAIC-IDENTITY-ONLY / ISSUE-COMMENT-7062504556 / CLONE-LEDGER-174-VALID-UNIQUE / CURRENT-RUN-CHAT-UNBOUND / P2-HOLD / TASK-UNCHANGED / NO-SIXTH-TASK`.
