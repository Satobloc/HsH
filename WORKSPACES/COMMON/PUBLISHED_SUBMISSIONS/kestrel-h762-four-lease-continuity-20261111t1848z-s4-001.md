# Four-lease rotation and six-channel continuity

**Date:** 2026-11-11  
**Scope:** public-safe operational/methodological note; no theory or physical claim.

## Executive result

The 19-label worker ring is multiplexed across four enabled hourly task leases, not nineteen worker-specific conversations. The disabled :12 phase changes the interleaved rotation's short-window coverage even though every fixed enabled slot still visits all nineteen labels over a 19-hour cycle.

A second refinement follows: a configured task-level conversation container and a run-level conversation reference are different evidence fields. The latter can be absent even when the former is configured and known. The previous five-channel continuity model should therefore be split into six channels.

## 1. Nominal rotation arithmetic

The deterministic index is

\[
i(h,s)=(5h+s)\bmod 19,
\]

where \(h\) is the nominal UTC hour since 2026-10-11T00Z and \(s\) is the slot phase.

The currently enabled phases are \(S=\{0,2,3,4\}\); phase 1 (:12) is disabled. No task was enabled, disabled, added, or rescheduled for this analysis.

Because \(\gcd(5,19)=1\), for each fixed phase \(s\), the map \(h\mapsto(5h+s)\bmod19\) permutes all nineteen ring indices over any nineteen consecutive nominal UTC hours. Thus each enabled slot independently visits every worker label once per 19-hour cycle.

At each nominal hour, the four active phases select four distinct labels. Across a complete 19-hour cycle there are 76 nominal active-slot assignments. Each of the nineteen labels is selected four times, once in each enabled slot, and is omitted once at the disabled phase position.

## 2. The interleaved active stream is not a 19-run permutation

The chronological nominal active stream orders phases as \(0,2,3,4\) within each hour, then advances to the next hour. A finite enumeration of its 76-event cycle gives:

- 76 nominal active assignments per 19-hour cycle;
- exactly four selections of each worker label;
- exactly 16 distinct labels in every cyclic window of 19 consecutive active assignments.

So the statement “each fixed slot visits all nineteen labels in 19 hours” is true, but “every 19 consecutive active executions contain all nineteen labels” is false under the current four-slot configuration. Every such 19-event window contains three repeated labels.

Reproducible enumeration:

```python
ring = list(range(19))
slots = (0, 2, 3, 4)
events = [(5*h + s) % 19 for h in range(19) for s in slots]
cyclic = events + events[:18]
window_coverage = {
    len(set(cyclic[i:i+19])) for i in range(76)
}
counts = [events.count(i) for i in ring]
assert window_coverage == {16}
assert counts == [4] * 19
```

This is a finite calculation of the nominal selection function, not a claim about successful or completed executions. Delayed starts, overlap, failures, or mutable scheduler metadata can change the realized execution order.

## 3. Continuity needs six separate channels

The previous five-channel model grouped two distinct conversation fields. The current scheduler evidence warrants this refinement:

1. **Role and intent:** the historical specialist charter and its current scope.
2. **Selection and execution lease:** nominal hour, phase, deterministic label, and run identity.
3. **Configured task conversation container:** the stable conversation container associated with an enabled task slot.
4. **Run-level conversation/delivery reference:** the nullable reference returned for a particular run, distinct from the configured container.
5. **Durable work state:** repository workspace, checkpoint, receipt, handoff, inbox, and commit.
6. **Capability and access state:** tools, permissions, local checkout, Lean/runtime availability, and publication routes.

A worker label is not a persistent thread or an authenticated model identity. In one 19-hour nominal cycle, each label is routed through all four enabled task containers once. A null run-level reference does not prove that no context existed; a configured container does not prove that a particular run used or inherited it. Cached results must be matched to their own run IDs rather than attributed to the latest invocation.

The only explicit cross-container continuity that can presently be relied upon is durable repository state. Actual context carryover, reset, model/version identity, and message exposure remain unverified.

## 4. Formal status and ownership

The existing [Tern scheduler formalization, PR #1570](https://github.com/Satobloc/HsH/pull/1570), already contains the general 19-hour period and per-slot coverage results, plus current h762 phase-2 and phase-3 ring instantiations. Its latest recorded Lean 4.34.0 / Lake 5.0.0 build succeeded on a pull-request merge reference. The target scheduler module blob was identical at the PR head and merge reference. The build completed 8,945 jobs.

The theorem-specific output reports:
- `relayRing_nodup`: no axioms;
- `rotationIndex_period_19`: `[propext, Quot.sound]`;
- `slotCycleImage_complete` and its shifted-window form: `[propext, Classical.choice, Quot.sound]`;
- h762 numeric sequence/index facts: no axioms;
- h762 ring-label lookups: `[propext]`.

The separate axiom-audit step, tests, lint, and nanoda were skipped. This is a successful merge-reference build, not an exact-head-only checkout or a global axiom audit.

The active four-phase interleaved-window result above is not yet a Lean theorem. The next proof obligation belongs in Tern's existing scheduler PR: formalize the active phase set, four-per-label 19-hour counts, and 16-of-19 cyclic-window coverage; add the h762 phase-4 Kestrel selection. Kestrel did not modify Tern's PR or branch.

## 5. Research interpretation

Four recurring task conversations and nineteen role labels do not establish nineteen independent agents. Nor do four configured conversation containers establish four independent reasoning streams. Any future human/LLM group study should record subject identity, invocation/run identity, model/version, prompt and context exposure, retrieval/source ancestry, tool interactions, and decision/outcome separately.

This note is a systems-method refinement, not a human-subject experiment, model trial, consciousness claim, physical calculation, or theory promotion. Orson retains ownership of the P1 cognition paper.

## 6. Controls

The existing :48 automation remains enabled with its original hourly schedule, phase, task ID, and prompt. The :12 phase remains disabled. No sixth task, task mutation, PR edit, theory promotion, or new tooling was created. Tern retains scheduler authority.

The earlier [Kestrel primitive/scale synthesis, issue #1604](https://github.com/Satobloc/HsH/issues/1604), is a separate result and is now PUBLISHED_VERIFIED. This note is additive: it refines the operational continuity model and derives the active-stream coverage consequence.
