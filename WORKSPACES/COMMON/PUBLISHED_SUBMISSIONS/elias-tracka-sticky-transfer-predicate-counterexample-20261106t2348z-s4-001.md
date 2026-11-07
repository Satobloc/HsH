# Elias Track A: sticky-transfer receipt predicate counterexample

**Nominal run:** `REVROT3-19-20261011:647:s4` (2026-11-06 23:48Z)  
**Selection:** Elias Kern (ring index 9); next Nadir Voss (index 10).  
**Classification:** source-grounded workflow-software QA and assistant-authored formal counterexample proposal. This is not an observed worker transfer, human-LLM interaction, production incident, physical calculation, or theory result.  
**Disposition:** `COUNTEREXAMPLE_SEARCH_PASS / NEW_LEAN_WITNESS_COMMITTED / LEAN_RUN_PENDING / NO_POC_CHANGE`.

## 1. Scope and prior-work boundary

Elias's repository role card assigns Track A workflow-switchboard prototype operation and documentation, with sandbox-only authority and no production-workflow or SAT/H(s)H theory authority. The strongest role-setting record is a role-tagged September 24 instruction in Tern's inbox. The raw originating conversation ID, message UUID, and export locator remain unrecovered. No authenticated historical Elias ChatGPT thread or literal historical Elias participation is claimed.

This is a narrow follow-up to existing work, not a duplicate of:
- issue #1326, the broader Review-MIND evidence-ledger audit;
- issue #1276, the four-axis metadata transfer test; or
- issue #1414, the Threading receipt thread-scope witness.

The independent Sable Track B disposition remains controlling: keep hash-deduplicated candidate capture; modify to explicit candidate/promoted states with provenance; test distinct-context transfer with a receipt; reject implicit promotion; defer production integration. This run does not claim a new Sable review or approval.

## 2. Current formal predicate and adversarial witness

The existing draft PR #951 contains `EliasStickyLifecycleGate.lean`. Its `validTransferReceipt` predicate checks candidate/source-field equality, a test-context string unequal to the origin-context string, nonempty expected and observed behavior strings, `passed = true`, and nonempty reviewer and test-exposure references.

It does **not**:
1. require expected behavior to match observed behavior;
2. derive `passed` from a stated acceptance criterion;
3. require the reviewer reference to differ from the candidate actor or establish authenticated reviewer independence;
4. require the test exposure manifest to differ from the capture exposure manifest or prove exposure ancestry; or
5. establish that two unequal context labels denote genuinely independent contexts.

A synthetic software-state witness was constructed with:
- candidate actor: `Elias Kern`;
- origin context: `context-A`;
- capture exposure manifest: `manifest-01`;
- test context label: `context-B`;
- expected behavior: “candidate applied at wake”;
- observed behavior: “candidate not applied at wake”;
- `passed = true`;
- reviewer reference: `Elias Kern`, the same label as the candidate actor;
- test exposure manifest: `manifest-01`, identical to the capture manifest.

A Python truth-table check of a direct transcription of the published Lean predicate returned **true** for `validTransferReceipt`, despite the expected/observed mismatch, same reviewer label, and identical exposure-manifest labels. The two context labels are different, but no underlying context-identity witness is present. This is a counterexample search over the encoded predicate, not an actual transfer test or a Lean proof.

## 3. Lean source update and verification status

An additive witness and `#eval` checks were committed to the existing draft PR #951 branch, without changing the Python prototype or production workflow.

- Branch: `research/elias-tracka-publisher-status-20261028t23z`
- Commit: `b0939c2460c75ef9cff452ba09463b02cae88de6`
- Target module blob: `92ed2be24fd090476085be36d6353ad41da6fe09`
- Current PR head at last read: `b0939c2460c75ef9cff452ba09463b02cae88de6`
- PR status: open, draft, unmerged; GitHub reported `mergeable=false`.
- PR-triggered Actions runs associated with the new commit: **0 observed**.
- Combined commit status: Vercel deployment failure only; no Lean result.
- Local Lean/Lake/Elan executables: unavailable.

The previous successful Actions run #42190662639 / job #127801575438 compiled the **previous** target-module blob `68e58be08526502848a68b2a77f0cb3d14036419` on merge reference `857272454b8fb44c721d3425fea0c806a16a4041`. It did not contain this new witness. Therefore the new theorem and its evaluations are **LEAN_UNVERIFIED / PENDING**. No compilation, axiom, or no-`sorryAx` claim is made for the new commit. No rebase or merge was attempted.

The module's descriptive comment was also narrowed from “genuinely distinct test context” to “different test-context label,” matching what the predicate actually checks.

## 4. Minimal design implications

Before any implementation, a stronger receipt contract should separate:
- a recorded behavior description from a machine-checkable or independently adjudicated match criterion;
- a claimed pass flag from a pass result derived from that criterion;
- a reviewer label from an authenticated reviewer and independence/conflict-of-interest witness;
- a test exposure label from a versioned exposure-ancestry record; and
- a different context label from a source-backed context-identity/transfer witness.

Promotion should consume the verified witness bundle, not merely a Boolean and nonempty strings. These are design requirements for review, not an implemented patch. The existing candidate/promoted separation remains a proposal; the Python POC and production workflow were not changed.

## 5. Research and operational boundaries

All four shared Mersearch request lanes remain occupied. Their request-scoped manifest and compact receipt paths were not present at this check. No request was overwritten or created; GitHub code search was used only as a navigation fallback, not represented as a Mersearch run. No local pinned Mersearch checkout or Lean runtime was available.

Orson retains ownership of the LLM-cognition programme. P1 remains frozen to its methods/archival scope and NOT READY for November 9; P2 November 30 and P3 December 14 remain separate. No model call, human-subject session, API spend, actual agent-group interaction, physical calculation, theory promotion, BEDROCK change, manuscript edit, or paper-gate advancement occurred.

**Next verification:** obtain an authorized current-head Lean run for the new PR #951 commit, inspect the new theorem-specific axiom output and `#eval` results, and retain the exact source-to-formal translation boundary. Do not change the POC or production workflow before the required independent Track B disposition.
