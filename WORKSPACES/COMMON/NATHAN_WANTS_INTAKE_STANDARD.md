# Nathan Wants Intake Standard — 2026-09-24

**Status:** STANDING RULE / Nathan directive
**Purpose:** preserve actionable Nathan-origin proposals that would otherwise disappear into conversational flow.

## Default intake trigger

When Nathan says something in the neighborhood of:

- `best practices is ...`
- `best practice should be ...`
- `we should start doing X`
- `we should probably ...`
- `from now on ...`
- `I want us to ...`
- `this should be a standing rule ...`

then, at minimum, treat the statement as a **Nathan Wants candidate** and ensure it is captured for assessment/adoption.

This is an intake rule, not an automatic-policy rule. Capture first; assess second; promote according to context and authority.

## Immediate-directive exception

If the surrounding context clearly makes the statement an immediate controlling directive rather than a proposal for assessment, execute/promote it through the normal directive path and also record enough durable state that the system can recover what changed.

## Do-not-log / defer conditions

Do not mechanically log every sentence containing `should`.

A candidate may be omitted when it is **obviously both tongue-in-cheek and actively disruptive if taken literally**.

If the statement is clearly part of an unfinished deliberation, do not prematurely freeze one branch as Nathan's settled preference. Mark it mentally/in working state as `DELIBERATING`.

### Deliberation grace period

If a substantive deliberation remains unresolved after roughly **two conversational turns** (context may justify slightly more or less), either:

1. add the unresolved proposal to the Nathan Wants ledger as `PINNED / DELIBERATION OPEN`, or
2. leave an explicit durable pin/handoff pointing to the unresolved question and source context.

The purpose is to prevent unfinished but important ideas from evaporating simply because the conversation moved on.

## Minimum ledger fields

Each captured item should preserve, where practical:

- date/time or source-turn context;
- Nathan's actual proposal, quoted or conservatively paraphrased;
- trigger phrase/context;
- status;
- scope;
- whether it is immediate directive, candidate best practice, open deliberation, adopted, declined, superseded, or parked;
- assessment/adoption owner if one exists;
- relevant implementation/control artifact;
- next review trigger;
- any reason not to adopt.

## Status vocabulary

Suggested lightweight states:

- `NEW — ASSESS`
- `DELIBERATING`
- `PINNED — DELIBERATION OPEN`
- `ADOPTED`
- `PARTIALLY ADOPTED`
- `DECLINED — REASON RECORDED`
- `PARKED — RETURN TRIGGER`
- `SUPERSEDED`

Do not create bureaucracy for its own sake. The ledger is an anti-forgetting surface, not a requirement that every idea become policy.

## Assessment principle

A `Nathan Wants` item should be assessed for:

- intended scope;
- interaction with newer/older directives;
- implementation cost;
- reversibility;
- whether a lighter mechanism already exists;
- whether the proposal was exploratory versus settled;
- whether adoption would create hidden coercion, staleness, or workflow drag;
- whether the idea can be tested before general adoption.

Nathan-origin does not mean `automatically good`; it means `do not silently lose this before somebody actually considers it`.

## Relation to conversational hazards

Nathan may derail a conversation while simultaneously dropping a valuable best-practice proposal. WfCHRp/continuity rules should preserve active work **and** capture substantive Nathan Wants candidates rather than forcing a choice between conversation and task continuity.

## Compact intake operator

`NATHAN_SIGNAL(best-practice|we-should|standing-rule) > CAPTURE > CLASSIFY(directive|candidate|deliberating|joke/disruptive) > ASSESS/PIN > ADOPT|PARK|DECLINE|SUPERSEDE`

If deliberating:

`DELIBERATING > ~2 turns unresolved > PIN`
