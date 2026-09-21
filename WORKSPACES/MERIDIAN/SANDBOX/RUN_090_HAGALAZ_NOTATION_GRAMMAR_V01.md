# RUN 090 — Hagalaz notation grammar v0.1

**Branch/task:** Meridian / Hagalaz interlingua / notation architecture  
**Status:** SANDBOX / PROVISIONAL / grammar-only  
**Date:** 2026-09-21  
**Operation:** bounded notation-convention excavation + current grammar sketch  
**Quarantine:** none consulted  
**Nathan Words disposition:** current Nathan-direct clarification INGESTED; archive notation SOURCE ONLY

## Purpose

Establish a reversible notation grammar for the live Hagalaz operator family without prematurely assigning physical/mathematical semantics to the available typographic positions.

This note does **not** define the final Hagalaz operator, its algebra, its default values, its path integral, or the meanings of the rune variants. It fixes only a safe display/machine-interface architecture that later formalization can populate.

## Current controlling clarifications

1. The live Hagalaz family is centered on the rune family:

   `ᚽ  ᚼ  ᚺ  ᚻ`

2. A generic script-H or calligraphic H is **not** Hagalaz notation by default. If such a symbol later appears, it must be explicitly defined as a decomposition, reduced-dimensional toy, projection, scalarization, or other derived object.

3. Hagalaz is intended to become the common relation/interlingua among the geometric solver family, especially UI/TX, Whirligig/Donut, and Three Spheres.

4. The six-position form discussed by Nathan is initially an **address frame**, not six preassigned variables:

```text
    a b
  c ᚼ d
    e f
```

The placeholders `a`–`f` indicate display addresses only.

5. A bare central rune should mean: **all omitted addresses take the declared Hagalaz reference/default values**. This is the working meaning of a "unit Hagalaz" notation state. It is not yet established that the unit/reference state is the algebraic identity, nor that any of its defaults equal numerical 1.

## Archive design precedent: H-universe typography

The older `SIXTY THOUSAND UNIVERSES` catalogue used a central historical `H` plus nested positional typography to encode a combinatorial state space. In the recovered sequence, outer positions vary expansion/contraction states while inner super/subscript positions around `[H]` encode rotational-plane combinations. The notation is dense but systematic and demonstrates that position itself can carry syntax.

Example historical forms include structures of the shape:

```text
[⁻₊[ᵛᵥ[H]ˣₓ]⁺₋]
[  [ᵛᵥ[H]ˣᵥ]  ]
[⁺₊[ᵛᵥ[H]ˣᵥ]⁺₊]
```

These are **historical notation precedents only**. Their `H` is not to be identified with current `ᚼ`, and their old semantics are not imported into Hagalaz.

Useful design lessons retained:

- central glyph can identify an operator/state family;
- typographic position can serve as an address;
- superscript/subscript/left/right/nesting can carry different grammatical channels;
- omission can encode a default state;
- the human-readable expression should be a rendering of a structured machine record, not the primary storage format;
- compact notation benefits from a reversible parser/pretty-printer rather than ad hoc interpretation.

## Grammar v0.1

### 1. Central family token

A Hagalaz expression has exactly one central family token from:

```text
ᚽ ᚼ ᚺ ᚻ
```

The semantic distinctions among these four forms are **RESERVED / UNASSIGNED** in v0.1.

### 2. Six primary modifier addresses

The default display frame exposes six possible modifier addresses around the central rune:

```text
NW   NE
 W  [R]  E
SW   SE
```

where `[R]` is one rune-family member.

Machine names for the positions are deliberately geometric rather than semantic:

```text
NW, NE, W, E, SW, SE
```

No position is yet assigned to scale, rotation, center offset, pole relation, deformation, closure, or any other candidate degree of freedom.

### 3. Omission rule

For every address `p`, omission means:

```text
value(p) := default(p | reference_state, solver_context, order_context)
```

Therefore a bare `ᚼ` is shorthand for the complete declared reference/default state, not an underspecified record.

A future canonical system must make defaults explicit in the machine record even when omitted in display notation.

### 4. Explicit-deviation rule

Human-facing notation should normally print only departures from the declared reference state. A fully explicit diagnostic/debug form may print all six addresses.

This gives two render modes:

- **compact:** omit default-valued modifiers;
- **expanded:** display all bound addresses and their values.

### 5. Machine/display separation

The canonical stored object should not depend on Unicode placement tricks. Provisional record shape:

```yaml
family: hagalaz
rune: "ᚼ"
reference_profile: <unassigned profile id>
addresses:
  NW: <value-or-default>
  NE: <value-or-default>
  W:  <value-or-default>
  E:  <value-or-default>
  SW: <value-or-default>
  SE: <value-or-default>
context:
  source_solver: <optional>
  target_solver: <optional>
  order_from: <optional>
  order_to: <optional>
provenance:
  source: <pointer>
  status: <source/current/reconstructed/etc>
```

The display rune expression is produced from this record by a deterministic pretty-printer and should be recoverable by a parser.

### 6. Nesting and composition

Nesting is reserved as a possible syntax for composed/order-jump relations, because the H-universe experiments show that nested typography can compactly preserve hierarchical structure. v0.1 does **not** define whether nested Hagalaz means composition, recursion, order-jump depth, closure hierarchy, or another relation.

Until composition semantics are formalized, nested expressions are `RESERVED` rather than free-form.

### 7. Unit/reference state versus identity

Maintain two distinct questions:

- **reference/unit Hagalaz:** the simplest, most symmetric, or empirically common/default relation chosen as the baseline for notation and solver comparison;
- **identity transformation:** whatever leaves the relevant state unchanged under the eventual Hagalaz composition law.

Do not assume they coincide.

Likewise, do not assume the natural default scale is 1:1; UI examples may begin at 1:1, 1:2, 0.5:1, or another declared reference depending on the operation/profile.

### 8. Path/integrator reservation

The project intends a default path/integrator construction that helps operationally define the unit/reference Hagalaz. v0.1 reserves this requirement but does not impose path-ordering, exponential-map, Lie-algebra, connection, holonomy, or measure semantics before the local operator state is settled.

Any later integrator should consume the same machine-readable Hagalaz records rather than inventing a parallel notation language.

## Candidate semantic dimensions — NOT YET ADDRESSES

Current discussion has surfaced plausible relational quantities including:

- center/rung displacement between order centers;
- relative scale;
- relative frame rotation;
- polar/axis orientation relation;
- sphere/spheroid/heloid deformation state;
- closure/holonomy/order relation.

These are candidate dimensions of the eventual transform state, **not assignments to NW/NE/W/E/SW/SE**. The six-address frame may prove overcomplete, undercomplete, or exactly matched.

## Visual-production consequence

Class-P figures should render directly from the canonical Hagalaz machine record. Class-H figures may annotate a Class-P result. Class-I illustrations have no geometric authority unless downstream of P or H.

This creates a single source of truth for both solver interoperability and visual output.

## Provenance boundary

Archive material is being used here to recover notation strategies and original design instincts, not to settle present semantics. In particular:

- historical H-universe `H` notation is SOURCE ONLY;
- present Hagalaz rune-family membership and six-address idea are current Nathan-direct design input;
- meanings of rune variants, address bindings, default values, composition law, and path integrator remain open formalization work.

## Durable result

Grammar-level commitments now safe to carry forward:

1. actual Hagalaz family uses `ᚽ ᚼ ᚺ ᚻ`, not generic script-H;
2. six modifier locations are addresses before they are variables;
3. omission means declared default/reference value;
4. bare rune denotes a fully specified reference profile, not missing data;
5. unit/reference Hagalaz is distinct from mathematical identity until shown otherwise;
6. machine record is canonical; typography is a reversible rendering;
7. archive H typography informs grammar only, not present semantics;
8. Class-P solver visuals should render from the same record.

## Next cursor

Recover the earliest substantive Hagalaz discussions (Ravel/Meridian/Mercer/Janus/Alberr where available) specifically for **intended relational degrees of freedom**, then construct a candidate semantic inventory without binding it to the six display addresses. Compare that inventory against UI/TX, Whirligig/Donut, and Three-Spheres state variables to find the minimal common interlingua.