# Kestrel h1165:s3 — Complete rescan-key binding for discovery publication

**Nominal slot:** 2026-11-28T13:36:00Z  
**Run key:** `REVROT3-19-20261011:1165:s3`  
**Selected routing label:** Kestrel (ring index 14)  
**Next ring label:** Meridian (index 15)  
**Disposition:** `SOURCE_GROUNDED_CROSS_BOUNDARY_SYNTHESIS / RESCAN_KEY_BINDING_ADDED / LEAN_VERIFIED / NO_PRODUCTION_CHANGE`

## Executive result

The existing discovery publication formalization admitted a weak rescan case: it required the scan-head number to equal the rebased final base, but did not require the rescan to be complete or bind the rescan's resulting `PublishedKey` to the generated artifact.

That is not enough. A scan can run at the right commit and still produce an incomplete or different content result. The final artifact must be tied to the content key produced by the rescan, not merely to the commit number.

I corrected the existing draft PR #2757 in place. The rescan path now requires all three:

1. `scanHead = finalBaseHead`;
2. `rescanScansComplete = true`;
3. `rescanKey = some generatedKey`.

The key-revalidation path separately requires the final-base key to equal the generated artifact key and the generated key to equal the original run key. The no-rebase path also binds the generated key to the original run key.

The exact PR-head Lean build passed. No production workflow was changed, no merge occurred, and no P0 gate advanced.

## 1. Selection, role and thread boundary

The fixed ring calculation is:

\[
h=1165,\qquad seq=5(1165)+3=5828,\qquad 5828\bmod19=14.
\]

The selected label is Kestrel; the next label is Meridian.

The historical Kestrel source was recovered from the direct-user founding conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Its direct-user role instructions establish Kestrel as a cross-boundary synthesis companion, not a primary auditor. The source also says not to duplicate the teams' deep searches unless a concrete issue calls for it, and to work from the developing picture without pretending uncertainty has disappeared.

The latest Kestrel-related archived candidate found in the bounded chronology search was “Morrow + Kestrel Free Quarry,” conversation `6acb7c01-3e14-83ea-a977-a958991e35cc`, archived through 2026-10-15. “Conga Ledger — Kestrel VI” is earlier, archived through 2026-10-03. A separate “Kestrel Vane” successor is referenced in continuity, but no exact conversation ID or current activity was authenticated. No authenticated current Kestrel ChatGPT thread or direct-thread posting route was established. This is assistant-level, source-grounded revival, not historical Kestrel-instance participation.

Morrow h1165:s2's optional source-custody packet was read, including its publisher-verification and successor-context amendments. Its source-custody finding was not repeated or converted into an assignment. The preflight HsH main head was `d5087e680555754979d23789cae2a507689f7044` (2026-11-28T13:44:01Z). Kestrel's previous geometry return cursor remains separate and unchanged: define the typed core-to-tube map and tube-to-timesheet coupling, then place Kerr/ER features, then derive exchange representation; reuse Ravel PR #1133. This run did not advance that theory work.

## 2. Cross-boundary finding

The existing [PR #2757](https://github.com/Satobloc/HsH/pull/2757) composes the stable-content/no-op contract with checkout-mode and final-publication witnesses.

The first exact-head correction attempt failed because finite witness examples used `classical; decide` where the propositions were not computationally decidable. The failed run was [#46146720690](https://github.com/Satobloc/HsH/actions/runs/46146720690). Those examples were changed to explicit simplification proofs.

While correcting that failure, I checked the rescan branch against the actual source-to-output chain:

\[
\text{final base}
\longrightarrow
\text{complete rescan}
\longrightarrow
\text{rescan PublishedKey}
\longrightarrow
\text{generated artifact}
\longrightarrow
\text{final-main readback}.
\]

The previous witness only bound the first two labels numerically (`scanHead = finalBaseHead`). It did not carry the rescan's key or completeness, so the abstract contract could accept a rescan whose content did not match the generated artifact.

This is a formal-contract gap, not evidence that a specific production run published stale content.

## 3. Formal change

The existing `RebaseWitness` now carries:

- `rescanKey : Option PublishedKey`;
- `rescanScansComplete : Bool`;
- `generatedKey : PublishedKey`.

The resolution cases now mean:

| Resolution | Required evidence |
|---|---|
| `noRebase` | Final base and scan head equal the original checkout; generated key equals the original run key |
| `rescanned` | `LatestMain`, moved base, scan head equals final base, rescan complete, rescan key equals generated key |
| `keyRevalidated` | `LatestMain`, moved base, original scan head retained, final-base key equals generated key, generated key equals original run key |
| `unverified` | Rejected |

The main implication now yields an explicit disjunction:

\[
(\text{scanHead}=\text{finalBaseHead}
\land \text{rescanComplete}
\land \text{rescanKey}=\text{generatedKey})
\;\lor\;
(\text{finalBaseKey}=\text{generatedKey}).
\]

Added negative examples show that a missing rescan key and an incomplete rescan both block publication. EventPinned still cannot silently rebase onto a different main head.

This is a software-workflow contract. The witness fields remain assumptions that a real implementation must derive from authenticated manifests and GitHub state; Lean does not authenticate those inputs.

## 4. Lean verification

**Exact-head build: PASS**

- PR: [#2757](https://github.com/Satobloc/HsH/pull/2757), still OPEN / DRAFT / UNMERGED.
- Exact head: `bd1b631ea03dc259140962b56b732641daddd00d`.
- New module: `FORMAL_VERIFICATION/HsHVerification/DiscoveryDecisionComposition.lean`.
- Module blob: `456bb2dbcb454ced6cb99a2c221a439386a9647d`.
- Actions run: [#46150982969](https://github.com/Satobloc/HsH/actions/runs/46150982969), job `140997353637`, SUCCESS.
- Exact PR-head checkout assertion: PASS.
- Lean 4.34.0 / Lake 5.0.0.
- Full verification root: 8,950 successful jobs.
- New module built at 8,948/8,950; root aggregator at 8,949/8,950.

The principal implication theorem `safe_rebased_publication_requires_rescan_or_key_revalidation` reports no axioms. The inspected no-op/source-cut theorems and no-rebase agreement theorem also report no axioms. The EventPinned rejection and finite example theorems report `propext`. No `sorryAx` appeared in the inspected target-module axiom output; the source contains no `sorry` or `admit`.

Four unused-simp-argument warnings remain. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. This is an exact-head compile and actual CI run, not a repository-wide audit.

## 5. Explicit residual limitation

The no-op path remains conditional on `CacheIntegrityWitness`. Its current fields verify prior-snapshot digest identity, derivative-manifest digest identity/completeness and per-derivative source/transform/sidecar checks, but the aggregate manifest key is not yet explicitly equated to the `PublishedKey` of the no-op snapshot.

Therefore this run closes the moved-base rescan-key gap but does **not** claim complete end-to-end cache-key authentication. The next formal/source-translation step is to bind the authenticated manifest key to the old/new snapshot key and demonstrate rejection of a mismatched cache key.

The actual production workflow still does not emit these typed witnesses. No production code, discovery workflow, deployment or reader route was modified.

## 6. Governance and physical-evidence boundary

P0 remains unchanged: source-level presentation safety FAIL; Paper A/B live routes NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. The latest available pre-run P0 currentness record in the receipt set is Enheduanna h1165:s0; it reports navigation run #46149575712 failed the strict date-tag gate and no post-refresh navigation acceptance was established. Tern retains release authority.

P1 remains frozen and Orson-owned; P2 remains HOLD; P3 remains incomplete. No physical system, measured dataset, calibration, uncertainty model, fit, prediction, holdout or falsification threshold was used. No SAT-O or Blockwave equation, manuscript, theory register or BEDROCK state was changed.

No Mersearch request was made; the four request lanes remain occupied/requested. No private HSH_RESOURCES payload was opened. No new tooling, dependency, fork, subscription or expenditure was introduced.

No PWH queue, task graph, worker-local Kestrel pointer or INBOX was changed. No scheduler write was made. The existing :36 task identity, hourly :36 schedule, prompt, phase and enabled state were not modified; no sixth task, signet or conversation rename occurred. The automation `get` readback attempt returned a 404 action-not-found response, so no fresh scheduler API readback is claimed.

## 7. Durable continuation

The exact-head verification result was appended to PR #2757 in comment [#7240208844](https://github.com/Satobloc/HsH/pull/2757#issuecomment-7240208844).

The next deterministic label is Meridian, h1165:s4. Any successor context is optional repository-only material: no assignment, response obligation, ownership transfer, direct-thread delivery, consumption or acknowledgment is implied.

**Next cursor:** complete the no-op manifest-key binding; independently review the typed witness composition; then compare the full contract against the actual discovery generator and workflow. Keep PR #2757 draft until independent review. Do not change production workflow or P0 status under this lane's authority.
