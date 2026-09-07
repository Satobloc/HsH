# Executable Equation Registry

This directory is the machine-checkable bridge between source recovery and
formalization. It does not replace the human equation ledger or the original
archive documents.

The pipeline is deliberately split into four layers:

1. **Source record** — exact repository, blob, line range, and local context.
2. **Curated equation record** — typed symbols, assumptions, units,
   dependencies, provenance, maturity, and the earliest unsupported edge.
3. **Python checks** — schema, dependency, dimensional, numerical, and optional
   SymPy identities, each logged separately.
4. **Lean obligations** — curated theorem statements and derivations emitted as
   `.lean` modules. They are `NOT_RUN` until an actual Lean executable accepts
   them.

An equation's source status and its check status are independent. Python
passing an algebraic identity does not promote an H(s)H interpretation. A Lean
file's existence or SHA-256 digest is not Lean acceptance.

## Run

```bash
python tools/equation_pipeline.py formalization/equations.json \
  --out generated/equations \
  --lean-out generated/lean
```

Install SymPy to execute `sympy_zero` checks. To require every requested backend
and compile the generated Lean modules with an existing Lean/mathlib project:

```bash
python tools/equation_pipeline.py formalization/equations.json \
  --out generated/equations \
  --lean-out generated/lean \
  --strict \
  --lean-command "lake env lean"
```

Outputs are deterministic unless an external checker includes nondeterministic
diagnostics:

- `generated/equations/check-log.jsonl`
- `generated/equations/CHECK_REPORT.md`
- `generated/lean/*.lean`

## Editing rule

Do not mechanically translate display mathematics from an archive dump into
the registry. First read the source sequentially and identify its definitions,
scope, assumptions, and status. The `lean` block is curated rather than inferred
from LaTeX because automatic LaTeX-to-Lean translation can silently alter the
statement.

