# Formalization Smoke Test 001 — 2026-09-14

**Purpose:** narrow executable check of the current formalization registry. This is not a theory validation.

## Registry state inspected

`formalization/equations.json` currently contains three curated records (`EQ-0001` through `EQ-0003`). Existing generated report records 6 PASS, 0 FAIL, 5 NOT_RUN; the NOT_RUN items include two SymPy identities and three Lean compiles.

## Independent check performed by Sable

Runtime: Python with SymPy 1.14.0.

Re-evaluated the two currently registered symbolic-zero obligations:

- `EQ-0001 / radius-rearrangement`: `3*(R**2-d**2/3)-(3*R**2-d**2)` -> `0` — **PASS**.
- `EQ-0002 / determinant-symbolic`: `exp(-2*epsilon)*exp(2*epsilon)-1` -> `0` — **PASS**.

No Lean or `lake` executable is present in Sable's current runtime, so generated Lean obligations remain **NOT RUN by Sable**.

## Meaning

This increases confidence that the current pipeline's two previously unexecuted SymPy identity checks are correct. It does not expand source coverage, validate the model interpretation, or establish any physical claim. The current registry remains a three-equation prototype, not a broad audit of the archive's mathematical content.
