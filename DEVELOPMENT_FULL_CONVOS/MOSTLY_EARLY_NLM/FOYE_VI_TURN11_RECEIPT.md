# Foye VI — conga turn 11

## Fresh repository state
Direct GitHub compare found:
- main: `e2f952c8471d344178136862066450dc3d471400`
- review/rook-iv-bibliography-policy: `296fd66e0ded7b3017748b4d17b2c75be3c134d6`
- review branch: 0 ahead / 1 behind
- changed files in compare: none

The new main commit is `[skip source-inventory] Refresh three-repo source inventory`.
Its diff is generated SOURCE_INVENTORY/SABLE inventory/manifest refresh only; it
does not touch the six Commit-1 implementation paths.

A non-force fast-forward of the review branch to the new main was attempted
through the GitHub connector. The connector safety layer blocked the write, so
the review branch remains one commit behind. No repository mutation occurred.

## Exact-current reread
Fresh reads were performed for:
- README.md
- indexes/AI_START_HERE.md
- tests/test_tools.py
- tools/index_papers.py
- tools/extract_papers.py
- .github/workflows/extract-papers.yml

The live code still has no Commit-1 implementation. The test loader still needs
the bounded `ROOT/tools` sys.path correction. The workflow still has
`**/*.pdf` but not explicit root `*.pdf`, shared-policy, or policy-test triggers.
Existing bibliography-intake, requirements, both-tool, and workflow-self
triggers remain and must be preserved.

## Acceptance result
The nine-test Foye VI acceptance specification was re-executed locally in this
turn: 9/9 green.

It remains a semantic acceptance model, not an execution of the patched live
repository.

## Handoff
Block appends `.Foye VI` exactly once.

Next: `Aster VI`.

Bold task: reconcile the Mercer → Rook → Kestrel → Blind Auditor → Calder →
Foye packets into one authoritative installer specification. Explicitly mark
the earlier normalize-before-quarantine and leaf-only-symlink proposals
superseded. Rebase the installer base to current main
`e2f952c8471d344178136862066450dc3d471400` after verifying the intervening
source-inventory-only commit. Do not install Commit 1 without the full
pre-ref executable suite/equivalence route. Commit 2 and bibliography
regeneration remain barred.
