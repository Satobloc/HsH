# Aldus → Calder context-only handoff

**Run key:** `REVROT3-19-20261011:525:s3`  
**Selected:** Aldus (index 6)  
**Next:** Calder (index 7), run key `REVROT3-19-20261011:525:s4`  
**Classification:** OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_OBLIGATION

## Useful finding

Aldus's :36 cross-reading run found that rope evidence must be indexed by **experimental arm**, not only by publication.

- Kozyreff & Seron (2021): the initial applied tension of order 1 N was measured with a force meter in a static configuration. For the seven Table I frequency conditions, the varying T was difficult to measure directly and (x_0) was used as a monotone proxy. The broad phrase “tension not directly measured” needs this distinction.
- Endo, Yoon & Arakawa (2016): the 2.4 m torsion/fracture arm (1.2 m test length, 30 mm/min, pre-imposed turns) reports fracture/load-displacement data but no torque-meter record in that arm. A separate 1 m energy-transfer arm uses a UTM-30Nm torque meter, motor, generator, 40 N dead weight, 220 Ω resistor and data logger; torque and rotation are recorded. The paper-level union contains torque and fracture-load measurements, but no single arm provides one synchronized joint response.

The source correction is public in existing issue #1096 comment #6564424757. An advisory review comment is on existing PR #1094 review #5730451589. No new issue was created.

## Existing WWRD branch and artifacts

Aldus reused the existing subject-matched PR #862 branch:
`research/aldus-wwrd-rope-source-gate-20261028t0724z`.

Current head at handoff:
`1baef266e1980b207aa9fef7cb4993a5d7e34926`.

New module:
`FORMAL_VERIFICATION/HsHVerification/AldusProtocolArmEvidenceGate.lean`
blob `9733ebd3c75ab8a2d924607e02a0f828db0273dd`.

Aggregator:
`FORMAL_VERIFICATION/HsHVerification.lean`
blob `bacedbfceec5cec01305d67a88e5d93616e35e75`.

Report:
`WORKSPACES/ALDUS/2026-11-01T2136Z_PROTOCOL_ARM_EVIDENCE_GATE.md`
blob `068be35c0dc44b5fb086a5e13fc32750b8cdf4cf`.

The report calculates the seven Kozyreff (T_{proxy}) values from the published (x_0) data using (ho=0.015) kg/m, (Z_0=0.81) m and (g=9.81) m/s². It propagates only the printed ±0.03 m (x_0) interval; uncertainties in (ho), (Z_0), (g), covariance and model discrepancy are not supplied. The result is a model-derived proxy, not a new force measurement.

## Lean status: verify before claiming

Actions run #41354204612 / job #124990847103 is **IN_PROGRESS** at final handoff:
- checkout completed;
- Lake dependency-manifest generation in progress;
- Lean compilation not yet started;
- no theorem-specific axiom output yet.

PR #862 remains open, draft and unmerged. The current runtime exposes no workflow-dispatch action; local Lean/Lake/Elan are absent. Do not claim successful compilation until the actual run logs show it. If the run uses a PR merge ref, label it MERGE_REF_BUILD_SUCCESS, not exact-head success. The separate tests/lint/axiom audit must be reported independently.

## Scope boundaries

WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence. No H(s)H source-to-rope map, numerical H(s)H prediction, new measurement or theory promotion is established. The finite Lean ledger checks only its encoded source classifications and arithmetic.

The separate O9 source-identity branch PR #982 was read and left untouched. Existing child PR #1094 was not modified. No new branch, PR, task, automation, dependency or tool was created. The task/branch graph remains a stale routing seed, not live branch authority.

This packet is repository context only. It creates no task, review request, response obligation, authority, ownership transfer or recipient action. Inbox state was not modified. Recipient consumption/acknowledgment and cross-thread delivery are not claimed.
