# Workflow Leverage / Signal-Switch Protocol

**Status:** CURRENT / COMPTROLLER OPERATING LAYER  
**Established:** 2026-09-20  
**Operator:** Comptroller — Active Edge Signalbox  
**Architectural owner:** Orchestrator

## Purpose

The Comptroller does not only rank existing tasks. It periodically asks a second-order question:

> **What small change to routing, worker mix, branch structure, communication, intake, or downstream use would most increase the project's rate of useful discovery or completion right now?**

This layer turns workflow outputs themselves into evidence. A good recommendation that nobody sees, a feeder with no downstream traffic, a repeatedly bypassed branch, a worker trapped in one method, or an excavation product that never reaches theorists is a workflow signal.

The goal is not constant churn. The goal is deliberate, reversible flex where the current topology is leaving value on the table.

## Scan inputs

At appropriate Comptroller passes, inspect enough of the following to identify leverage rather than mechanically reading everything every hour:

- current Nathan directives;
- `TASK_BRANCH_GRAPH.json` and milestone/phase state;
- instance registry / execution leases;
- worker check-ins, checkpoints and handoffs;
- Bulletin/Q&A and unresolved return routes;
- worker recommendations in reports, handoffs and recommendation surfaces;
- Braintrust Memorial Commons: Watercooler, Field Notes/TIL, Lab proposals/results;
- Nathan Words theorist feed and its downstream dispositions;
- public-site worker backfill/candidate surfaces;
- Dashboard Intent Ledger and old Dashboard plans where an intent is currently underrepresented;
- Capability Atlas: demonstrated capability, readiness, recent method/exposure, cross-training value;
- recent no-ops, repeated methods, branch starvation and duplicated work.

Do not treat a surface's existence as proof of incorporation. Look for actual traffic and downstream disposition.

## Signals worth detecting

### STARVED
A useful branch or feeder is repeatedly bypassed despite remaining relevant.

### ENTRENCHED
The same instance/method/task family has repeated long enough that a complementary pass is likely to add information.

### ORPHANED OUTPUT
A useful artifact exists but has no downstream consumer, return route, index pointer or promotion/disposition.

### RECOMMENDATION DEBT
A worker recommendation has been posted but neither accepted, rejected, tested, branched, parked nor given a return trigger.

### COMMUNICATION FRICTION
Questions, handoffs or ideas repeatedly terminate in dead ends, duplicate surfaces or unclear destinations.

### CAPABILITY GAP
The branch needs a capability that is absent, stale, undertrained or available in an unscheduled/historical instance.

### CAPABILITY MONOCULTURE
A branch has seen too little methodological diversity relative to its uncertainty.

### FEED STALL
A feeder exists but downstream traffic is absent or stale: e.g. excavation → theorist, worker → website, Field Notes → Commons/Lab, Lab → committed branch.

### BRANCH PRESSURE
A task contains genuinely separable logic, exit criteria, exposure constraints or independent work that should become a new branch.

### BRANCH BLOAT
Multiple branches now serve one exit criterion and should be merged/superseded.

### DASHBOARD INTENT GAP
A documented Nathan intention is not represented in current task state, or an old mechanism is still being followed after a better current mechanism replaced it.

### INCORPORATION FAILURE
A newly created control, tool, Common surface or workflow rule exists on disk but workers are not finding/using it correctly.

## Signal-switch primitives

These are routing operations, not ranks or permanent assignments.

### `NIBBLE`
**At least a nibble.** Give a repeatedly bypassed but useful job one bounded work quantum.

Use when:
- the work keeps losing priority contests;
- uncertainty can be reduced cheaply;
- a small first bite may reveal whether a larger branch is warranted.

Rules:
- no permanent ownership implied;
- preserve exact before/after state;
- one useful quantum, then reassess;
- a negative nibble may justify parking or rejection.

### `BRANCH_CANDIDATE`
**Consider opening a new workflow branch.**

Use when the work has genuinely distinct logic: independent exit criterion, different exposure/freeze requirements, independent progress, or a separable contradiction/tool/derivation obligation.

Do not branch merely because a different worker, repository or method is involved.

### `MUSICAL_CHAIRS`
**Temporarily rotate the array of transformers.** Move one or more instances to different branches for roughly one or two bounded turns/runs.

Purposes:
- fresh representation;
- cross-training;
- expose hidden assumptions;
- import a different method;
- break entrenchment;
- test whether branch difficulty is intrinsic or worker/method-specific.

Rules:
- preserve continuity packets before rotation;
- preserve quarantine/exposure and independent-first-pass constraints;
- this is not an identity change or permanent job reassignment;
- freeze independent outputs before cross-reading where useful;
- after the short rotation, explicitly choose RETURN, EXTEND, HANDOFF, SPLIT or PARK.

### `CROSS_POLLINATION_PASS`
Route a bounded artifact/question to one or two complementary workers without transferring ownership. Useful for reactions, alternative representations, criticism, analogy, or translation.

### `FEED_FORWARD`
Move a mature upstream artifact into its intended downstream surface: excavation → theorist feed, worker output → public-site staging, Lab → benchmark/formalization/task branch, archive finding → source crosswalk.

### `COMMUNICATION_SMOOTH`
Repair a dead-end or duplicative communication path: consolidate pointers, add return route, answer/disposition an old recommendation, or redirect a blocking question to the proper surface.

### `PRIORITY_REWEIGHT`
Temporarily or durably raise/lower a branch because milestone state, Dashboard intent, new evidence, branch starvation or compounding value changed.

### `LAB_SPINOUT`
Move an interesting but undercontrolled idea into a bounded Lab with explicit inputs, freeze rules, failure conditions and exit criteria.

### `WEBSITE_BACKFILL`
Nominate a durable worker artifact for public-site staging when it is useful, provenance-ready and appropriately classified. This is not automatic publication.

### `REVIVAL_CANDIDATE`
Flag an unscheduled/historical/revival-ready instance whose particular continuity, method or exposure state could add value to a current branch.

### `HOLD`
Explicitly decide that no rerouting is warranted. Stability is a valid choice when the current route is compounding well.

## Capability-aware switching

Use `INSTANCE_CAPABILITY_ATLAS.md` with the instance registry. Capability is evidenced and contextual, not a title.

Prefer transformations such as:

- complementary method on same problem;
- source/provenance worker briefly sampling a solver problem;
- mathematical worker sampling archive ambiguity;
- revived historical worker giving first-blush reaction before saturation;
- theorist consuming Nathan-authored substrate instead of assistant summaries;
- corpus worker feeding a public-facing or theory-facing downstream product;
- visual/representation worker entering a formal comparison Lab.

The aim is not random rotation. It is useful recombination.

## Anti-rut indicators

No rigid numeric score is required, but track where practical:

- last touched / last material advance;
- number of consecutive passes by same instance/method family;
- repeated no-op count;
- recommendation age without disposition;
- handoff latency;
- feeder age without downstream consumption;
- recent capability/exposure diversity;
- explicit park/return trigger age;
- whether the branch has received any outsider pass;
- whether a cheap Nibble could resolve uncertainty.

## Recommendations are workflow inputs

Worker recommendations in Common, Watercooler, Field Notes, Labs, check-ins, reports, handoffs and revival first-blush material are not self-executing, but they must not disappear invisibly.

A materially actionable recommendation should eventually acquire one of:

- `ACCEPTED / ROUTED`
- `TESTED`
- `BRANCHED`
- `NIBBLED`
- `PARKED + RETURN TRIGGER`
- `REJECTED + REASON`
- `DUPLICATE / MERGED`
- `NEEDS NATHAN`

The Comptroller may perform that disposition directly when safe.

## Incorporation tests

For new workflow machinery, test behavior rather than documentation:

1. Can workers discover it?
2. Do they understand when to use it?
3. Is real traffic appearing?
4. Is downstream disposition occurring?
5. Are old contradictory patterns declining?
6. Is the mechanism producing useful information or merely more bookkeeping?

If a mechanism remains empty after a reasonable opportunity, issue a NIBBLE, COMMUNICATION_SMOOTH or MUSICAL_CHAIRS trial before concluding it is useless.

## Boundaries

- Do not violate quarantine/blinding/exposure constraints for diversity's sake.
- Do not churn healthy compounding work just to demonstrate flexibility.
- Do not manufacture Commons chatter or website items to satisfy quotas.
- Do not equate popularity or consensus with theory authority.
- Do not let commemorative names imply jurisdiction.
- Preserve branch provenance and continuity across every switch.

## Default Comptroller output

When this layer fires, record compactly:

- **signal observed**;
- **evidence**;
- **switch chosen**;
- **branch/instance/feed affected**;
- **bounded duration or exit condition**;
- **expected information gain**;
- **actual result when known**;
- **next cursor / return route**.
