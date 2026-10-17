# Mersearch math search, M1–M3 candidate

**Implemented 2026-10-09 in the development branch.** The pinned stable 1.0 engine and its now-active three-repository bridge are unchanged. This candidate has passed synthetic regression, but is NOT promoted as a full-corpus research release.

## Install once

~~~bash
python -m pip install -r tools/requirements-mersearch-math.txt
python tools/search_archive_content.py --capabilities
~~~

The capabilities command explicitly reports whether SymPy is available, lists the new fields and examples, and identifies supported versus excluded proof classes. If SymPy is absent, the normal lexical/notation search works and new symbolic queries fail visibly.

## Search all three repositories

The development CLI discovers the original SAT archive, HsH and HSH_RESOURCES when they are sibling checkouts. Restricted PRIOR_ART and QUARANTINE are excluded. Always inspect the coverage report and actual source locations.

~~~bash
python tools/search_archive_content.py --coverage
python tools/search_archive_content.py --expr 'equiv:"B=3/(4*pi)"' --sort origin
python tools/search_archive_content.py --expr 'contains:"3/(4*pi)"'
python tools/search_archive_content.py --expr 'value:"B=0.2387;atol=0.003"' --sort date
python tools/search_archive_content.py --expr '(equiv:"B=3/(4*pi)" OR value:"B=0.2387;atol=0.003") AND era:mid-2025'
python tools/search_archive_content.py --expr 'equiv:"B=3/(4*pi)"' --math-inventory --out /tmp/mersearch-math
~~~

`equiv:` proves equivalence only for supported polynomial equalities with the **same named variables**, constant nonzero scaling and constant denominators. It matches `4πB=3` to `B=3/(4*pi)`, but does **not** falsely equate `X=3/(4*pi)`, `B^2=(3/(4*pi))^2`, symbolic rational-function domain changes or a rounded decimal.

`contains:` checks literal symbolic-AST substructure inside a parsed source equality. It is **not** general semantic similarity.

`value:` compares explicit or linearly solved numeric quantities with a bounded **absolute tolerance**, default 0.001 and overridable with `;atol=...`. It can find `B≈0.239` or `4πB=3` near `B=0.2387`, recording the numeric deviation, whether a linear solution was calculated, and the tolerance. **NUMERICALLY_CONSISTENT does not mean identical observable, units, physical prediction or derivational equivalence.**

The original `math:` notation search remains unchanged; Boolean, version/era, path, role and provenance filters combine with the new mathematical queries.

## Source evidence and equation inventory

Each matching hit in `SEARCH_RESULTS.json` contains `math_evidence` with its exact extracted formula, position within the record, symbol names, classification, and proof or comparison details. Dates and source identities remain separate. `--math-inventory` streams `MATH_EXPRESSIONS.jsonl`, including repository, record/message location, source line, original and normalized expression. Parse refusals, skipped long lines and candidate truncations are reported. This is a **partial supported-subset index**, not an exhaustive mathematical reading of every uploaded PDF.

Only safely whitelisted Python AST operators/functions can be parsed; no eval, exec, unsanitized SymPy text parser, imported code execution, or arbitrary expression evaluation. Supported Unicode and LaTeX notation is intentionally bounded.

### Still excluded

General nonlinear solution equivalence, variable-denominator domains, trigonometric identities, dimensional/unit analysis, matrix/tensor calculus, assumptions-dependent CAS transformations, general LaTeX, symbolic alpha-renaming, complete expression OCR, and cross-document derivation genealogy.

### Immediate SAT use

- Search `equiv:"B=3/(4*pi)"` for earlier algebraic variants, then `value:"B=0.2387;atol=0.003"` for independently rounded or derived variants.
- Combine with optical phase, refractive index, theory-name and version searches. Do **not** assume early experimental phase shift and later projection constant refer to the same physical observable.
- Compare true message timestamps, archival dates, historical quotations and duplicate exports before asserting earliest origin.
- Trace algebraic lineage manually until the proposed M4 equation-genealogy layer has actual provenance relationships.

## Validation and release discipline

`WORKSPACES/MERCER/test_mersearch_math.py` tests positive matches, false equivalences, numerical tolerance, code-injection-shaped inputs, three-repository Boolean composition, source provenance and the equation-inventory sidecar. The mathematical CI is run alongside stable search and chronology regression.

The human research UI has a separate Equation match selector and displays symbolic evidence. The public Pages catalog intentionally disables mathematical search because it only indexes curated conversation titles/paths. Full math search must never be represented as live on the public site before a separately reviewed backend/index exists.

**Not yet green for stable promotion:** real-corpus speed/coverage and false-positive audit, varied archival mathematical notation, and physical-unit interpretation. The stable worker bridge remains pinned to 1.0 until release acceptance.
