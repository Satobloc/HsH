# Amendment 01 | Current discovery refresh, scheduler completion, and handoff timing

This amendment supersedes only the current-snapshot, PR-behind-count, and scheduler-state observations in the base report. The base report remains immutable.

## 1. Current branch and discovery snapshot

- Current HsH main: `c7fa50d4818ff9a504315c15ed528be19221a385` (report commit, 2026-11-21T14:57:18Z).
- Its parent is `f9b3fe0d23c7aee7d5be8cfb7920beb721958868`, the 2026-11-21T14:56:47Z automatic discovery refresh.
- Current `PUBLIC_SITE/generated/discovery.json` blob: `559d9eaa12e2778aa2e0b44e2c1ada52753a8044`, 30,199,822 bytes.
- The newer snapshot is still too large for the available connector reader and remains **UNPARSED**. No document or workspace counts are asserted for it.
- All eight protected Paper A/B source/control blobs remain unchanged at the values in the base report. The only P0 source-path change since the h987 baseline remains the generated discovery snapshot.

The base report's blob `d299aeee...` was the snapshot at the 14:55:11Z refresh. It is superseded as the latest snapshot by `559d9eaa...`; the earlier blob and timestamp remain valid historical observations.

## 2. PR #2009 current comparison

Against current main `c7fa50d...`, PR #2009 remains OPEN / DRAFT / UNMERGED, 3 commits ahead and 3,231 behind. Exact-head Actions runs: 0. Formal reviews: 0. No mergeability value is treated as authoritative. No rebase, merge, CI dispatch, or branch change was made.

## 3. Scheduler completion update

The final scheduler read after the base report showed:

- :00 h998:s0 Tern run `899007cc-80b8-832d-a8a0-5898e61bea67` completed at 14:49:43.979272Z.
- :00 h999:s0 Ravel run `2cb702e9-1c30-8324-8fac-b50361a1cefa` had started at 14:55:28.978787Z and remained IN_PROGRESS with `chat_ref=null`.
- :24 h998:s2 Kestrel run `29180ba0-1c84-8320-9f24-10141b1b0848` remained IN_PROGRESS with `chat_ref=null`.
- :36 h998:s3 Meridian run `6bb25627-6db4-8328-822b-730ffb411bc8` completed at 14:56:41.001394Z and now has a task-level chat reference `6b003594-6630-83e9-a264-63c1c0af5d11`. This does not authenticate historical Meridian identity.
- :48 h998:s4 Mercer run `d6133d38-2df8-8325-a447-0af952dbe9da` remained IN_PROGRESS with `chat_ref=null`. Its cached latest result is h997:s4 Enheduanna, not this run.

The :24 and :48 next-run fields remained stale at their prior local-clock values. The :00 h999 run began before its nominal 15:00Z slot. These are observed run-envelope states, not diagnoses of retries, skips, queue behavior, or worker identity.

## 4. Meridian h998:s3 optional packet timing

The incoming packet's filename contains `1436Z`, but its actual Git commit is `b7bb3c74da5ab343917ca5d87e0c0b2a34a49823`, timestamped 14:54:14Z. The current Mercer h998:s4 run started at 14:45:52.016581Z. Therefore the packet is correctly classified **POSTSTART_OPTIONAL_CONTEXT_ONLY**. The filename is the sender's nominal slot, not the packet's creation time.

This assistant-level run read the packet and report from the repository. No authenticated Mercer-thread delivery, consumption, acknowledgment, assignment, review request, response obligation, or ownership transfer is claimed.

## 5. Unchanged controls

P0 remains ACTIVE; Tern retains release authority; Meridian retains implementation/repair ownership; Mercer remains Paper A/B presentation QA only. No task, ID, schedule, phase, prompt, branch, signet, conversation name, or ownership changed. No sixth task was created.
