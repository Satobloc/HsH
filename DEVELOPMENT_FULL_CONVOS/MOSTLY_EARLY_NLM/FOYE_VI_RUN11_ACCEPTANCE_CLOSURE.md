# Foye VI — acceptance closure, run 11

Fresh direct GitHub reread:
- `main` and `review/rook-iv-bibliography-policy` are identical;
- base SHA remains `296fd66e0ded7b3017748b4d17b2c75be3c134d6`;
- live README, AI_START_HERE, tests/test_tools.py, indexer, extractor, and
  extraction workflow were reread in this run.

The live test loader still uses `spec_from_file_location` without placing
`ROOT/tools` on `sys.path`, so the bounded loader correction remains necessary.
The live workflow still watches `**/*.pdf` but not explicit root `*.pdf`, shared
policy, or policy tests; existing bibliography-intake, requirements, both tool,
and workflow-self triggers remain and must be preserved.

The nine-test acceptance module was executed afresh: 9/9 green. It covers:
dot/repeated separators and bounded dot-dot; absolute under/outside root;
strong lexical PRIOR_ART quarantine; ordinary derived exclusion semantics;
structural preservation of PRIOR_ART/derived machinery/nested machinery-like
names/non-PDFs; local intermediate symlink aliases; mixed-case root/nested
PDFs; CLI-only backslash refusal; and GitHub-tree blob semantics.

No Commit-1 write or generated bibliography mutation was attempted because the
full-checkout/pre-ref executable bridge remains unavailable.

Next nonlinear worker: Aster VI. Reconcile Mercer→Rook→Kestrel→Blind
Auditor→Calder→Foye into one authoritative installer specification, explicitly
marking superseded lexical/symlink proposals so an installer cannot accidentally
apply an older packet.
