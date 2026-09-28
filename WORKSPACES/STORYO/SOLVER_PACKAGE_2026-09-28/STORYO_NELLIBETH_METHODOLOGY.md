# STORYO / Nellibeth Methodology

Status: current deterministic story-mechanics method.

## Core pipeline

> **record -> connect -> mutate -> propagate -> classify -> render**

The object of study is story mechanics, not reader modeling.

## Primitive objects

### Record
A manuscript-supported proposition, event, attribution, revelation, action, object-state, or other concrete unit.

### Connection
A typed relation between records, e.g. `causes`, `requires`, `contradicts`, `confirms`, `supersedes`, `attributes`, `reveals`, `motivates`, `echoes`.

### Dependency
A connection whose alteration forces downstream reconsideration.

### Consistency rule
A deterministic constraint capable of blocking a mutation.

### Mutation
One explicit change to one record/field at a time.

### Bud
A newly emergent object/class made possible by a mutation. Budding is default OFF and may be enabled only with bounded focus/depth.

## Step-by-step

1. Preserve the manuscript verbatim as provenance.
2. Atomize only as much as necessary.
3. Type each record.
4. Add explicit typed links.
5. Add deterministic consistency rules.
6. Propose one mutation only.
7. Propagate along affected dependencies only.
8. Classify the result: `COMMIT`, `BLOCK`, or bounded `BUD`.
9. Record a complete mutation ledger.
10. Render a readable story view only after the mechanical pass.
11. Repeat serially so interacting premise changes never get hidden in one multi-edit.

## Nellibeth v0.3 result

17 mutation intentions were tested:
- 3 COMMIT
- 14 BLOCK

The surviving examples were:
1. Mac attribution `Doug-2` -> `possible Doug-2`
2. move the Nellibeth-2 revelation earlier
3. move Doug self-modification explanation earlier

The point is not that these are aesthetically superior. The result means they survived the current dependency/consistency machinery while the others did not.

## Growth controls

- `bud_enabled = False` by default
- maximum bud depth
- focus bound
- follow-only selected entity/character/object
- stop on contradiction
- stop on dependency explosion
- manually promote a bud into the main graph

## Relation to older modular-story work

The older `MODULAR STORY` skeleton already described a dependency lattice in which successive layers are linked by emotional reciprocity and ethical inversion. The vignette-expansion notes likewise treated a vignette as an interlocking module with links, internal stages, outward iteration, and optional recursive reactivation.

STORYO tightens this into explicit records, typed links, serial mutations, propagation, and deterministic checks.

## Doctrine

**NO METAPHORS: ONLY ANALOGUES.**

A representation should be no richer than the manuscript-supported distinctions it must preserve.
