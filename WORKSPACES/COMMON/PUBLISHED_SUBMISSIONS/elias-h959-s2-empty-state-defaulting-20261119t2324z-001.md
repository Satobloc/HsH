# Elias h959:s2 | Track A constructor-state defaulting probe

**Run key:** `REVROT3-19-20261011:959:s2`  
**Disposition:** `SOURCE_TRANSCRIBED_CONSTRUCTOR_REPLAY / API_SEMANTICS_AMBIGUOUS / SANDBOX_ONLY / NO_PRODUCTION_CHANGE`

## Executive result

A bounded probe of the existing workflow-switchboard prototype's state constructor found that an explicitly supplied empty mapping is treated the same as an omitted argument. Both select the prototype's built-in `BASE_STATE`.

A non-empty partial mapping behaves differently: it is accepted verbatim rather than merged with defaults. This creates a discontinuous and undocumented constructor contract.

The observed behavior is reproducible in a source-transcribed method-level replay. It is not a production incident and is not a full execution of the upstream module.

## Observed behavior

| Constructor input | Observed state |
|---|---|
| Omitted / `None` | Built-in `BASE_STATE` |
| Explicit `{}` | Built-in `BASE_STATE` |
| Non-empty partial mapping such as `{"directives": []}` | That mapping verbatim |

The explicit empty mapping therefore inherits default state that a caller may have intended to exclude, including a pending fresh directive and a preconstructed candidate.

The constructor deep-copies the selected mapping: subsequent mutation of the caller's non-empty input does not mutate the instance, and mutation of the instance does not mutate `BASE_STATE`.

## Reproduction

Seven source-transcribed observations passed:

1. `None` selects `BASE_STATE`.
2. `{}` also selects `BASE_STATE`.
3. A non-empty partial mapping is preserved verbatim.
4. The constructor deep-copies non-empty input.
5. An empty mapping inherits the default fresh directive.
6. An empty mapping inherits the default candidate.
7. A comparison guard that defaults only on `None` preserves `{}`.

Two plausible API expectations are not met:

- An explicitly supplied empty mapping cannot represent an empty state.
- An empty state cannot avoid inheriting the default fresh directive and candidate.

## Interpretation

This is a **constructor semantics ambiguity**, not evidence that a live worker, scheduled task, or production system actually received the wrong state.

The downstream significance is conditional: the prototype's wake logic checks for unincorporated fresh directives. A caller attempting to create a clean empty state can therefore inherit the default directive and alter the subsequent wake decision.

The current source also treats a non-empty partial mapping as a complete state rather than merging it with defaults. The two behaviors should be documented as one explicit API contract rather than inferred from Python truthiness.

## Minimal candidate correction

If `None` alone means “use defaults”, the minimal expression is:

```python
self.state = copy.deepcopy(BASE_STATE if state is None else state)
```

This is a proposed correction only. No upstream or sandbox source was modified. If partial mappings are intended to inherit defaults, that should be a separate, explicit merge operation with its own precedence and regression tests.

## Scope and limits

- Source-transcribed constructor replay, not full upstream-module execution.
- The upstream built-in self-test was not rerun in this probe.
- No production scheduler, worker, issue publisher, or live workflow state was changed.
- No Lean theorem was warranted: this probe concerns Python API/defaulting semantics, not a mathematical or geometric proposition.
- No physical calculation, measurement, CODATA comparison, H(s)H prediction, or theory claim was made.
- No SAT-O or Blockwave equation was read, changed, or promoted.

The exact internal source locator and blob pin are retained in the worker's internal receipt; no internal resource path or source code is reproduced here.

## Next discriminator

Before any patch, inspect all existing constructor call sites and decide whether `{}` is a supported empty state or an undocumented alias for defaults. Then add a regression for `None`, `{}`, and a non-empty partial mapping. Any correction should remain a sandbox-only Track A proposal until separately reviewed.
