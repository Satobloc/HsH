# Elias Track A: receipt-gate contract coverage and vacate-gate CI reconciliation
Date: 2026-11-09
Run key: `REVROT3-19-20261011:712:s2`

**Disposition:** PR #951 remains OPEN / DRAFT / UNMERGED. A later Lean merge-reference build succeeded, and the receipt-gate self-test coverage gap is now formalized in the same PR. No Python POC change, production integration, physical calculation, or theory promotion occurred.

## Source and role boundary

The 2026-09-24 13:47 ET Nathan role record in the HsH workspace archive assigns Track A to Nathan, Elias Kern, and Orson Vey, with Track B assigned independently to Sable and Tern Rook. It specifies bounded prototype operations, durable before/after evidence, and independent KEEP / MODIFY / TEST / REJECT / DEFER dispositions from Track B.

That record is a contemporaneous role-tagged repository record, not a recovered raw conversation export. The deterministic Elias ring label does not authenticate a historical Elias ChatGPT instance. This is a source-grounded assistant reconstruction.

The internal sandbox prototype source was inspected. Its private locator and code are intentionally not reproduced in this public note. No Python source execution is claimed for this run.

## PR and actual Lean run

- PR: [#951](https://github.com/Satobloc/HsH/pull/951)
- Branch: `research/elias-tracka-publisher-status-20261028t23z`
- PR head: `f9fa0aad45408ab06e5430c834530854746235f0`
- PR target branch: `infra/lean4-verification-20261023`
- Live target-branch head at readback: `c7dc2c483f50ae03fc7a7c530829170135e18d92` (2026-11-01T11:18:10Z)
- PR API `base.sha` snapshot: `61cc8b65ffed70296e0121dbae067892a79c81d4` (2026-10-27T06:50:09Z); this differs from the live target-branch endpoint and is recorded as an unresolved metadata discrepancy
- Current HsH main at readback: `479d630dcbaae39a249b1f6dcf3ba3b59c75f101` (separate branch)
- Actions run: [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405)
- Job: `129302583788`, conclusion `success`
- Lean 4.34.0 / Lake 5.0.0
- Full formal-library build: `Build completed successfully (8961 jobs)`

The job checked out merge commit `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`, merging PR head `f9fa0aad...` into base snapshot `c7dc2c483f50ae03fc7a7c530829170135e18d92`. The `EliasThreadingVacateGate.lean` module blob is identical between PR head and this merge ref (`bf3c3bc6ed9203b2921c9a306ebf8a0bbe4d5c08`). The `EliasReceiptGateDependencyCoverage.lean` module blob is also identical (`7ed22583b4b7cd279864535631eddd20ea87d2a0`), and both root aggregators import it.

**Integration limit:** the job's merge commit uses PR head `f9fa0aad...` and base parent `c7dc2c...`, matching the live head of the PR's target branch. This is a successful current-target-branch merge-reference build. It is not an exact-head standalone build and does not test integration against HsH main, which is a separate branch. The PR API `base.sha` snapshot (`61cc8...`) disagrees with the live target-branch endpoint; that metadata discrepancy remains unresolved.

## Formalized results

### VACATE prerequisite

`EliasThreadingVacateGate.lean` encodes the source predicate as `stateThreshold OR timeCap`. Its proposed guarded predicate additionally requires a vacated author state, propagation status, and a recorded vacate timestamp.

The compiled witnesses show:
- the source predicate can mark an active, seeded author rejoin-ready when the threshold is met;
- the proposed guard blocks that active/seeded/no-timestamp state;
- the guard allows a vacated/propagating/timestamped state when either the threshold or time cap is met;
- the general guarded-readiness theorem extracts all three VACATE evidence requirements.

The five `#eval` outputs were `true, false, true, true, false`. The nine theorem-specific axiom reports include standard `propext` dependencies for the conjunction/state proofs. No `sorryAx` or bare `admit` match appeared in the retrieved job log.

### Receipt-gate self-test coverage

`EliasReceiptGateDependencyCoverage.lean` formalizes a source-shaped self-test that checks only whether the verifier and restore job names appear in the spawn list. A proposed stricter contract also checks uniqueness, gated relations, the explicit dependency edge, and the exact rewrite requiring a durable receipt OR an explicit failure packet.

The ten `#eval` outputs were:
`true, true, true, false, true, false, true, false, true, false`.

The formalized witnesses show that the source-shaped test accepts:
- a missing dependency;
- a wrong dependency;
- an ungated restore job;
- a rewrite missing the explicit failure-packet alternative.

The proposed contract rejects each witness. All eleven theorem-specific `#print axioms` outputs for this module report no axiom dependencies.

**Limit:** these are finite software-state abstractions. Lean checks only the encoded propositions. It does not prove the Python-to-Lean translation sound, execute the Python prototype, establish that planned jobs actually run, authenticate workers, or establish independent reasoning.

## Disposition and next gate

- Keep PR #951 OPEN / DRAFT / UNMERGED.
- Do not change the sandbox Python POC or production workflow in this run.
- Await the independent Track B disposition; no Track B review result is established here.
- Before any later integration claim, reconcile the PR API `base.sha` discrepancy against the live target-branch endpoint and obtain an exact-head standalone build if available. Do not treat the present merge-reference success as HsH main integration.
- P0 Code Grurple remains ACTIVE. Lane 24 remains BACKSEAT / HOLD. No physical system, CODATA comparison, measured prediction, fit, P2 selection, or BEDROCK theory promotion is claimed.
- No new tooling, dependency, fork, paid service, or scheduler change was introduced.

This is a distinct follow-up to the earlier PR #951 CI correction in [issue #1531](https://github.com/Satobloc/HsH/issues/1531). It does not edit or replace that earlier incident record.
