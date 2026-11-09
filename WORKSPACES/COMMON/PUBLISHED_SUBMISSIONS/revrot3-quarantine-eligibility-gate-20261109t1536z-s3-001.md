# REVROT3 eligibility gate: selection remains deterministic, access is separate

**Status:** ASSISTANT-AUTHORED OPERATIONAL PROPOSAL; DRAFT IMPLEMENTATION; FULL REPOSITORY CI PENDING. This is not Nathan Direct, theory authority, a security boundary, or evidence of worker/thread participation.

## Problem

The five-lease revival rotation deterministically selects a ring label from the nominal UTC hour and slot. The live Code Grurple roster separately imposes a quarantine boundary for one selected label: only cleared operational answers may cross; quarantined research material must not be exposed to authors or reviewers. The previous h711:s2 receipt correctly recorded that the next label was quarantined and created no research handoff.

The workflow needs to preserve four separate facts:

1. Selection: the ring formula still selects the same identity.
2. Eligibility: a separate access gate determines what work or payload is permitted.
3. Participation: a selected label is not an authenticated ChatGPT thread or worker.
4. Delivery: a repository packet is not proof of chat delivery, consumption, or acknowledgment.

A quarantine hold must not silently reroll the ring, become a missed check-in, or be treated as refusal.

## Implementation

Draft follow-up PR #1533 extends the existing read-only tools/audit_revival_rotation_v3.py auditor, stacked on draft PR #1173.

The new declared-metadata gate recognizes CLEAR, OPERATIONAL_ONLY_CLEARANCE, QUARANTINE_HOLD, NO_ACCESS, and MANUAL_REENTRY_REQUIRED.

For quarantine/no-access/manual-reentry states, the receipt or handoff must explicitly declare no payload, no private-material access, no inbox write, and no missed check-in/invitation count. It also rejects a claim of genuine revived-instance execution.

For operational-only clearance, the payload must be absent or explicitly classified OPERATIONAL_ONLY; private/quarantined access is rejected, and an inbox write requires the operational-only classification. The same check is applied to handoff recipients.

The deterministic selected identity remains checked against the ring formula. Eligibility changes disposition, not selection.

## Regression checks

Ten local policy-function checks passed:

- quarantine hold with no payload/access/write/miss is accepted;
- the selected ring index and next index remain unchanged;
- altered selected identity is rejected;
- research payload, private access, inbox write, and missed-check-in counting under quarantine are rejected;
- operational-only clearance rejects research payload;
- a quarantined handoff recipient cannot receive a research payload.

The test fixtures are temporary metadata-only software fixtures, not actual message, delivery, or worker-participation records.

## Verification status and limits

- PR-head source was independently fetched; its blob matches the committed blob.
- PR #1533 remains OPEN / DRAFT / UNMERGED and is stacked on #1173.
- The default-branch Math Hopper smoke workflow currently does not include a pull-request trigger or the rotation-auditor step. No Actions run was returned for the new PR head. Full repository self-test/CI is therefore PENDING_DEPENDENCY_ON_1173.
- The ten local checks exercise the eligibility function, not the complete repository script.
- Existing Tern H591 Lean evidence contains a successful merge-reference build of a specific scheduler snapshot. It is not a general proof of quarantine eligibility or no-reroll policy. This change adds no new Lean theorem and makes no new Lean compilation claim.
- The auditor validates declared metadata only. It does not inspect payload semantics, authenticate a thread, enforce GitHub permissions, or prove that a declared classification is truthful. It is a consistency check, not a security boundary.

## Scope preserved

No Mira private workspace, inbox, restricted HSH_RESOURCES material, PRIOR_ART/MIRA content, reviewer material, or quarantined research payload was opened, copied, or forwarded. No handoff to the quarantined selected label was created. No missed check-in or refusal is inferred.

No scheduler ID, enabled state, schedule, phase, cadence, ring formula, or task count was changed. No new tool, dependency, fork, paid service, or automation was introduced. No physical calculation, empirical prediction, SAT-O/Blockwave equation change, manuscript change, BEDROCK promotion, or paper-gate advancement occurred.

The November 9 P1 cognition paper remains Orson-owned / NOT READY; November 30 P2 remains HOLD; December 14 P3 remains INCOMPLETE. FIE rereview is due November 10, not yet due.

## Source controls

- WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md
- WORKSPACES/COMMON/REVIVAL_RELAY_THREAD_FIRST_RULE_2026-10-11.md
- WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md
- WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md
- WORKSPACES/COMMON/REVIVAL_ROTATION_DUPLICATE_RUN_KEY_GUARD_2026-11-07.md

**Return state:** ELIGIBILITY_GATE_DRAFT / LOCAL_POLICY_CHECKS_10_PASS / FULL_CI_PENDING / NO_PRIVATE_ACCESS / NO_THEORY_PROMOTION
