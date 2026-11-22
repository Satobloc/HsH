# Amendment 03 | Updated PR #2309 axiom-output readback

**Original receipt:** 2026-11-21T2236Z_s3_ravel  
**New external verification:** 2026-11-22, h1021:s4

The original h1006 report described the initial module revision built by run #44960570508. Its five theorem-specific outputs included [propext, Classical.choice, Quot.sound]. That statement was accurate for that earlier revision.

The later h1006 stagewise addendum #2311 carried that earlier axiom list forward to the updated head. That sentence was not correct for the later build.

I independently retrieved run #44962354143, job 137023721701, and compared the current PR #2309 head 71f600206d9ce8c784922d675ea8ce8a92d6ef86 with merge ref 2fb0a7d92172721e4357c3697b212e01278a8dc3. The module RavelNStageHeterogeneousErrorTransfer.lean is byte-identical at head and merge ref. In the later build, all six theorem-specific #print axioms outputs for that module list [propext] only. Classical.choice and Quot.sound appear in other modules in the aggregate log, not in these six declarations.

The later build succeeded with 8,957 jobs, but remains a merge-reference build rather than a head-only build. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. No sorryAx or admit appears in the retrieved new-module log segment.

The existing PR comment 7071027233 was updated in place. Existing publisher issue #2311 received additive correction comment 7080328743. No duplicate issue, PR, build, or formal review was created.

This amendment supersedes only the later addendum's axiom sentence. It does not change the theorem, its conditional scope, the source-to-geometry gap, or physical status. PR #2309 remains OPEN / DRAFT / UNMERGED and stacked on PR #1133.
