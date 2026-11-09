# Explicit VACATE evidence before threaded rejoin

**Result:** a source-bounded lifecycle gap was identified in a sandboxed temporal-workflow prototype. A fail-closed rejoin guard has been added as a formal proposal to existing draft PR #951. The exact-head Lean build was still running at the time this note was prepared; no compilation success is claimed here.

## Source-level observation

The prototype's ordinary sample path calls `vacate()` before accumulating outputs. Its six existing self-test scenarios exercise that vacated path.

The underlying state object is also constructible in its defaults: `author_state=active`, `status=seeded`, and `vacate_started_at=None`. The current `should_rejoin` predicate returns `state_ready OR time_ready`; `mark_rejoin_if_ready` does not independently require a recorded VACATE transition, propagation phase, or vacate timestamp.

A source-transcribed method-level execution reproduced the edge case: four correctly versioned receipts, four distinct visible worker labels, and both success/failure outcomes satisfy the sample state threshold. With the author still active and no vacate timestamp, the source-shaped gate returns `ready=true` and the marking method changes the author state to `rejoin-ready`.

A second parameter edge exists if `max_hours=0`: the prototype's elapsed-time helper returns zero when no vacate timestamp exists, so a zero-hour cap can also satisfy the time branch before VACATE. This is a software-parameter edge, not a claim about the default sample configuration.

The existing self-test passed in a source-transcribed execution, but it does not cover either active-author case. This is an API/contract coverage gap, not evidence that the ordinary demo path failed or that any real worker rejoined prematurely.

## Proposed lifecycle guard

Require all of the following before rejoin readiness:

1. `author_state == vacated`;
2. `status == propagating`;
3. `vacate_started_at` is present;
4. the existing state threshold OR time cap is satisfied.

This preserves the original state-threshold/time-cap choice while making the VACATE step an explicit prerequisite. It also blocks inconsistent states such as `vacated` with `status=seeded`, or a missing vacate timestamp.

## Formalization status

The proposal is formalized in `EliasThreadingVacateGate.lean` on the existing draft [PR #951](https://github.com/Satobloc/HsH/pull/951). The module separates the source-shaped OR gate from the proposed guarded transition and proves that guarded readiness entails the VACATE state, propagation phase, and recorded timestamp.

Exact-head commit: `391fdc3e8239c08908b70358f2efb902a00ae8d9`.

GitHub Actions Lean 4 verification run #42622282956 was `in_progress` at the time of publication. The build, `#eval` outputs, and theorem axiom reports remain pending. PR #951 remains OPEN / DRAFT / UNMERGED. The branch also repairs an earlier bounded-override sample's executable check; that repair is not yet claimed compiled.

## Boundaries

- This is a software-state counterexample and a proposed contract, not a physical calculation or empirical observation.
- The Python source was inspected and its relevant methods were executed from a source-transcribed reproduction; the entire repository file was not run as an imported module in this runtime.
- Lean will verify only the formalized abstraction if the build passes. It will not prove equivalence to the Python implementation, authenticate worker identities, or establish actual workflow behavior.
- No POC source, production workflow, scheduler, task, task ID, schedule, or phase was changed.
- No H(s)H/SAT theory claim, physical prediction, or paper-gate change is made.

The next useful prototype test is a regression case constructed from the default active/seeded/no-timestamp state, followed by a Track B disposition of whether VACATE evidence should be a required rejoin precondition. No production integration is authorized by this proposal.
