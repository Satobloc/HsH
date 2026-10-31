# VEY-023 execution amendment 01 | Lean, publication, and numerical corollary

**Date:** 2026-10-31  
**Scope:** additive correction to the VEY-023 report; no P1 gate change.

## 1. Lean repair and verification history

The initial module at PR #850 head 4bb05c762a91176e034a2d1246c5e06713b1495b was built by Actions run #41244151207 and failed in the equal-channel commutation proof. The failure was an unsolved additive-normalization goal and a resulting sorryAx dependency. This failure is retained; it is not erased by later success.

The repair added the needed ring normalization. Actions run #41244476754 then **SUCCEEDED** with 8,975 build jobs on source commit 24a14402057420f3c5b00f64123db2b432330768. The PR-branch and merge-reference file blobs matched for both the module and root aggregator. The complete log contains zero sorryAx. The six theorem-specific axiom outputs use only standard dependencies: propext, Classical.choice, and Quot.sound. Tests, lint, nanoda, and the separate automated axiom audit were not run.

That successful build exposed an unused-tactic warning from a broad <;> ring cleanup. The proof was narrowed: the first branch now uses simp [update, ha] followed by ring; the second closes with simp [update, hd].

Current PR #850 head:
- Commit: fb44ce3bd3ac240142345e2613031b24e6a57e52
- Branch: research/orson-p1-shared-nli-bound-20261028t06z
- Module blob: 1e05539c4f215785e9760dec2f7a98fd6a68610d
- Root aggregator blob: 8d9817accf811d002f3e43ce0fdcce18613eeec2

Fresh exact-head-associated Actions run #41244897947 is IN_PROGRESS at checkout / awaiting build. Do not describe the cleaned final head as build-verified until the complete run and theorem-specific axiom outputs are read. The earlier successful build verifies the same six theorem statements and the prior tactic script, not this final cleanup commit.

The module formalizes only the scalar composition algebra. It does not validate the empirical evidence-integration law or establish peer-interaction effects.

## 2. Numerical corollary from the paper's reported interval

The paper reports an arithmetic-panel prior weight approximately:

`1+a \in [0.20,0.65]`.

Therefore:

`a \in [-0.80,-0.35]`.

Under the equal-channel order identity:

`L_12-L_21=a(d_1-d_2)`,

the conditional magnitude obeys:

`0.35 |d_1-d_2| \lesssim |L_12-L_21| \lesssim 0.80 |d_1-d_2|`.

This is a derived bound on the model's order-effect coefficient, not an observed order-effect size. No numeric evidence-tilt gap was supplied, so no absolute margin difference is calculated. For d_1>d_2 and a<0, the model predicts L_12<L_21: the later message receives the unattenuated tilt while the earlier message is downweighted. This remains conditional on the equal-channel update law.

For different source-channel weights, the assistant-derived extension remains:

`L_12-L_21=a_2d_1-a_1d_2`.

Its commutation condition is a_2d_1=a_1d_2; it is not a measured result.

## 3. Publication closure

Corrected issue-publisher intake #1172 completed successfully (Actions #41244723168). Publisher receipt comment #6549502248 records commit bc26177bb37aa465170b2cc8d5284dd7850bca7c and SHA-256:

`260711428099269a55d9dfada004412bb828a2c4dac5c5d210710e9e137b4c58`.

Published path:

`WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-vey023-receiver-relative-evidence-20261031t2124z-s2-001.md`

Independent readback: Git blob b3c81a49300399825e41aeab9682ead2ae0887de; 13,439 characters; exact content equality with the issue #1172 payload.

The two earlier intake attempts (#1170 and #1171) were rejected for SHA mismatch and closed not-planned. Neither wrote an artifact. #1172 is the sole published artifact for this submission ID.

## 4. P1 and operational boundary

P1 #564 remains OPEN / SOURCE–EXPERIMENT READINESS. The original OV-49–OV-53 answer-keyed bank and raw October 9 user-role source remain unrecovered. All four Mersearch lanes remain occupied. No authorized inference endpoint, model call, human-subject session, API spend, or new trial occurred.

No paper gate, ownership, task, automation, cadence, branch, or BEDROCK theory status changed. No physical calculation or CODATA comparison was performed.
