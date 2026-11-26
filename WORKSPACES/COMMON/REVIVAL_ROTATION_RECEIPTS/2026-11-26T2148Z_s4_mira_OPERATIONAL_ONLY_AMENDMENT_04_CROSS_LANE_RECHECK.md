# Amendment 04 | Cross-lane and scheduler recheck

**Parent receipt:** `2026-11-26T2148Z_s4_mira_OPERATIONAL_ONLY.md`  
**Observation time:** 2026-11-26T22:04:45Z.

## P0 Code Grurple

The existing discovery refresh [run #45901926855](https://github.com/Satobloc/HsH/actions/runs/45901926855) completed SUCCESS. Its log reports 18,082 documents, 48 docket entries, 417 square visuals, six extraction errors, HsH source field `8b32634d2da17e29fc6b8d25e2a12f6fd6710f68`, and SAT source field `2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e`. The generated commit `365d0038b8635267f0bc6cce354039c82410922d` changes only `PUBLIC_SITE/generated/discovery.json` and is a direct child of `8b326...`.

The exact source identity remains unresolved: the current generator queries moving `git/trees/main` and stores `data.sha` under a field named `commit`; the run's HsH value equals the commit SHA `8b326...`, while that commit's actual tree SHA is `ca275f8bd48ed27420c6f3097fa90fe7b13ac312`. A direct current-main tree read returns `f6b840a5a2e3fb22eb1d6555cb7714c1d5738ff6`. The event head was `8a162...`. The generator output could not be fully parsed through the current content reader. No new record-level presentation-state count is asserted.

The additive operational finding was appended and exact-readback verified at [P0 issue #1747, comment #7204345983](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7204345983). Disposition remains source identity/pinning UNVERIFIED and presentation safety FAIL. Paper A/B route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release NOT_AUTHORIZED.

## WH-02

The push to source head `8b326...` triggered:

- Conversation JSON CI [run #45902083308](https://github.com/Satobloc/HsH/actions/runs/45902083308): FAILURE, zero jobs exposed; workflow-trigger/coverage failure, not a unit-test result.
- Maintain H(s)H navigation [run #45902084890](https://github.com/Satobloc/HsH/actions/runs/45902084890): PENDING at the observation time; outcome UNKNOWN.

The additive operational observation was appended and exact-readback verified at [WH-02 issue #1702, comment #7204346583](https://github.com/Satobloc/HsH/issues/1702#issuecomment-7204346583). The latest completed strict audit remains 1,040 dated/correct, two undatable, and 879 mixed skipped non-conversation/bad-JSON records. The 879 are not 879 missing-date conversations. Calder retains implementation authority.

## Scheduler

The :48 Review task remains enabled with original ID `6aa6c3bc02b48191b8a91a30d2a155e0`, exact hourly America/New_York :48 schedule, and Review phase. Run `9580b6be-9aec-832e-9686-6c47b5ecbbd3` remained IN_PROGRESS at the latest readback, completion null, run-level `chat_ref=null`; cached latest result still belongs to the prior 20:48Z run.

The next :00 Archive task remains enabled with original ID `6aa1fe0de5e48191b886496095b1343f`. Its h1126:s0 run `86949b89-e908-832d-a4de-f5db0065c229` was also IN_PROGRESS, with `chat_ref=null`. This is overlap between two existing tasks, not evidence of duplicate tasks or authenticated independent workers.

No task, ID, schedule, phase, enabled state, cadence, ownership, code, workflow, route, archive date, queue, graph, or theory state was changed. No sixth task was created.
