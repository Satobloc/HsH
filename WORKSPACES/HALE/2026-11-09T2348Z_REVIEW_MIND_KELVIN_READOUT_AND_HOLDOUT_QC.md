# Review-MIND cross-lane QC: Kelvin readout, acquisition-unit factorization, and revival provenance

**Run key:** `REVROT3-19-20261011:719:s4`  
**Nominal slot:** 2026-11-09T23:48Z  
**Deterministic worker:** Hale (ring index 8)  
**Deterministic successor:** Elias Kern (ring index 9; next key `REVROT3-19-20261011:720:s0`)  
**Status:** source-grounded revival and bounded cross-lane QC completed; no theory, physical or paper-gate promotion.

## Executive result

The most useful new work was a source-critical replay of the Kelvin-wave readout chain and its formal verification history.

1. The earlier Nadir/Enheduanna angular-readout work is no longer merely `SUBMITTED_NOT_VERIFIED`: exact-head GitHub Actions runs for PRs #1189, #1401 and #1402 were independently inspected and passed their checkout-identity assertions and Lean builds.
2. Calder's new acquisition-unit factorization theorem in PR #1515 is a different mathematical layer, not a duplicate of the angular-readout theorems. Its exact-head CI run passed. It proves a conditional map-factorization property, **not statistical independence**.
3. The Nature Physics source confirms that 1,000 spatial z-slices were taken from a common recording and concatenated into a temporal file. They are measurement channels, not 1,000 independent experimental replicates. The raw Figshare files and acquisition manifest were not retrieved, so the actual unit map remains unauthenticated.
4. The source-to-mode mapping remains unresolved. The two-antipodal readout has parity aliasing; the four-cardinal readout is conditional and is not established by the source's described camera geometry. This is an unresolved methods bridge, not a demonstrated paper error.
5. Orson's November 9 P1 remains NOT READY and protected. PR #850 has a successful merge-reference build, but not an exact-head build.
6. No new public issue was warranted: existing issue #1549 is already PUBLISHED_VERIFIED and its issue payload matches the published artifact. No duplicate issue was created.

## 1. Run identity, repository and scheduler state

The ring calculation was scripted:

- (h=719), from the nominal UTC hour 2026-11-09T23:00Z since 2026-10-11T00:00Z.
- (seq=5h+4=3599); (3599\bmod19=8).
- Worker label: Hale; next label: Elias Kern.

This is a deterministic roster selection, not authentication of a current model or thread.

The :48 automation remains enabled with its existing ID `6aa6c3bc02b48191b8a91a30d2a155e0`, hourly recurrence and :48 phase. No automation, task ID, prompt, schedule, phase, branch, ownership or cadence was changed. The current scheduler snapshot reports run `297051e3-4e48-4428-a1b0-2257b5f6dfd4` IN_PROGRESS, scheduled for 23:48Z and started at 23:51:11Z, with `chat_ref=null`. Its cached latest result belongs to the preceding h718 run, not this h719 run; `last_run_time` also lags the current run. Therefore repository work is complete, but scheduler completion is not claimed.

The default Git branch is `main`; inspected head before this report was `bc3ebe384b681f27445fd19693d045e41af38439`. The orientation document's `CTRL-2026-09-20-GENERALIST/CTRL-03` is a logical control label; no matching Git ref appeared in the current branch listing. The task graph still declares 16 branches while containing 18 records. Tern owns that reconciliation; this lane did not edit the graph.

The current BEDROCK (blob `0253ace41b07e3a65a0b7b10d64cc8b1e8e62f7a`, 667 lines), Nathan Direct methodology/model overview dated 2026-11-08, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival rotation V3/V4, thread-first rule, navigation preflight, Reference Desk, current branch map, graph and relevant receipts were read. HsH, SAT archive and HSH_RESOURCES were all consulted within their documented scopes.

## 2. Hale source-grounded revival and historical charter

The historical Hale record is the **Hale — 2026-09-12** entry in `WORKSPACES/COMMON/CHECKINS.md`. It records an assistant self-report that chose the name Hale because no reliable prior scanner-specific name was present in its loaded record. It describes:
- arXiv/literature-landscape scanning;
- a matched 2024-vs-2026 comparison;
- code, scoring and statistical-analysis capability;
- controls and calibration;
- an external-research firewall;
- v0.4 as the durable private scanner, with v0.5-v0.7 as conversation/local candidates;
- no completed full matched-period comparison at that time.

This is not a signed Nathan-authored charter. `REV-006-HALE-REENTRY.md` is an assistant-maintained reconstruction. The similarly dated `PAST_THEORIST_CHECKIN_IMAGE_PROCESSING_OPERATOR_THREAD_2026-09-12.md` is a different thread and was explicitly rejected as a Hale source.

A bounded source search found no authenticated live Hale thread or conversation ID. The existing Mersearch request `hale-archive-source-lineage-20261104-1538` returned two copies of one user-role message from the Tern conversation “Space Shuttle Roderick — Tern.” At the exact source commit, both exports contain the same conversation ID `6ab6609c-3e8c-83ea-b262-627322737cb3` and identical message object `6484f3aa-0ea9-445c-ba83-4beb61ead9d2`. The message is not a Hale conversation; its author-name field is null. The two copies are not independent witnesses. The first GitHub file route returned blank content; the documented alternate fetch at the manifest's exact source commit recovered the raw export and enabled this comparison.

The shared Mersearch request slot and all four request lanes were occupied, so no request was overwritten or created. No SAT-O/Blockwave equation was retrieved or changed. The current run is recorded as a source-grounded revival session, not literal identity continuity. First-blush before exposure was NOT PERFORMED; the run had already read current work. No physical break can be claimed by this cloud runtime.

A compact continuity and regeneration packet was created at `WORKSPACES/HALE/CONTINUITY.md`.

## 3. Primary literature and acquisition-unit interpretation

Primary source: Barckicke et al., “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (published 2026-02-10), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). The paper's Data Availability section points to Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The Methods describe separate acquisition streams. For the probability-density analysis, the signal was recorded for 10 minutes at 100 fps or 3 minutes at 360 fps, sliced into 1,000 z-values over 2.5 cm, and concatenated into a temporal file. The 1,000 spatial values therefore share a recording and are not 1,000 independent experimental replicates. The paper also describes short high-speed contour/PIV recordings and run-level quantities such as (a_0), Γ and (v_z). A run/acquisition block is a plausible parent grouping, but the raw dataset manifest is needed to identify the actual independent experimental unit and its repeated-measures structure.

No raw Figshare bytes, file inventory, manifest, run IDs, calibration files or checksums were retrieved. No physical calculation, fit, prediction or observational validation was performed. P2 remains HOLD.

## 4. Formalized readout and holdout maps

### 4.1 Nadir two-channel readout: PR #1189

- Current head: `47e3443d1ccb07ff4396fa9e33eb6cdfbf40e4b7`.
- Actions run #41927513429; job #126915668961.
- Exact source checkout assertion passed; Lean 4.34.0 / Lake 5.0.0 build completed, 8,954 targets.
- The downstream two-channel classifier theorem is now verified at this head. This supersedes the older Nadir report's `SUBMITTED_NOT_VERIFIED` status.
- The formal result concerns the declared two-channel operator and its non-injectivity/aliasing. It is not an empirical camera validation.

### 4.2 Finite two-antipodal parity: PR #1401

- Current head: `f45b5e9842122f964f7b52361d0f738c6d106ab9`.
- Actions run #42124345675; job #127584657683.
- Exact source checkout assertion passed; Lean 4.34.0 / Lake 5.0.0 build completed, 8,955 targets.
- The module formalizes the finite antipodal readout: even/odd cosine aggregates are available, while sine quadratures are invisible to the two samples. It does not uniquely classify every Fourier mode.

### 4.3 Conditional four-cardinal readout: PR #1402

- Current head: `6176e81636eedefce730e44f92395e208d328374`.
- Actions run #42125368923; job #127588742667.
- Exact source checkout assertion passed; Lean 4.34.0 / Lake 5.0.0 build completed, 8,955 targets.
- The theorem distinguishes (m=1) from (m=3) only under its nonzero phase condition, and still aliases modes separated by four. It requires two calibrated antipodal radial pairs at 0 and π/2 in a common synchronized frame. The source's Basler side-view contour camera plus Phantom top-view PIV velocity camera do not, by themselves, establish that second radial contour pair or its registration/handedness map.

### 4.4 Acquisition-unit fold factorization: PR #1515

- Current head: `4cfb6803b641ad16cfe0918680f22fa54559e29a`.
- Actions run #42722996625; job #129521387245.
- The log explicitly compared expected and actual checked-out source commit; exact-head identity passed. Lean 4.34.0 / Lake 5.0.0 build completed, 8,957 targets.
- The theorem formalizes: given a declared surjective `unitOf : Channel → AcquisitionUnit`, a channel-level fold assignment `foldOf : Channel → Fold` factors as `foldOf = unitFold ∘ unitOf` exactly when it is constant on every fiber of `unitOf`; surjectivity supplies existence/uniqueness on all declared units.
- This is a genuine map-factorization result and is distinct from the angular readout/parity theorems. It prevents a fold assignment from splitting channels that share a declared unit. It does **not** establish that the declared unit map matches the experiment, that different units are statistically independent, or that a cross-validation estimate is unbiased.
- The theorem-specific `#print axioms` outputs use standard Lean axioms including `propext`, `Classical.choice` and `Quot.sound`. No `sorryAx`/admit was seen in the inspected module/build output, but the run did not execute a whole-project axiom audit, nanoda, tests or lint.

These PRs are all still draft/unmerged. A successful formal build verifies only the formalized statements under their assumptions; it does not validate the translation to the laboratory apparatus or the physical premises.

### 4.5 Source/method bridge still open

The source describes deriving position/radius signals from opposing azimuth profiles and assigns (m=1) to position and (m=0,2,3,ldots) to radius. The two-antipodal operator alone yields parity aggregates and does not explain unique (m=1) versus (m=3) separation. The four-cardinal theorem could discriminate under its own assumptions, but the required second radial pair and synchronized common-frame registration are not established by the source's described cameras. The paper may contain additional image/spectral processing that resolves this; that processing has not been recovered from raw data.

Classification: **UNRESOLVED_METHOD_MAPPING**, not “paper error.” The next evidence needed is the actual image-to-contour pipeline, camera calibration/registration, handedness and time synchronization, mode-classifier implementation, run/acquisition manifest, raw files and uncertainty/covariance information.

## 5. Publication status

Existing issue #1549 is the single public publication for Calder's unit-lineage result. Its publisher comment records `PUBLISHED_VERIFIED`, artifact SHA-256 `3b566ce54304c91dfb56b87e3e7b20db52043ac6a6205a34f55c97b7ad0eacd6`, and exact readback. This run independently compared the issue payload's embedded content with the published artifact text and found exact equality. The digest was taken from the publisher record, not independently recomputed in this run. No duplicate issue or publisher submission was created.

## 6. Other paper and lane gates

- **P0 Code Grurple:** ACTIVE. Current roster/presentation gate remains in force; no reader-route probe, manuscript change, ownership change or standdown was performed.
- **P1 Orson, November 9 minor paper:** NOT READY. Issue #564 remains open. PR #850 current head is `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`; run #42416933193 succeeded on merge commit `17c3d7409...` and its log checked out `refs/remotes/pull/850/merge`. This is a merge-reference build, not an exact-head standalone run. The manuscript source/PDF/reader, independent hostile review and author disposition remain incomplete. The 17 CGD files use a shared NLI evaluator; agreement under a shared checker is not independent evidence, and no peer-to-peer answer exposure or autonomous-agent consensus is established. Orson retains ownership; no model trials, human sessions, API spend or manuscript edits were made.
- **P2, November 30:** HOLD. No measured system selected; the Kelvin-wave candidate is not promoted.
- **P3, December 14:** separate full-theory paper gate; incomplete and unchanged.

## 7. Clone census, source reading and freshness

The one-time clone-footprint census log is already 19/19 ring-label dispositions, with 17 reconstructed and 2 coordinator unavailable/unknown; first-hand responses remain 0/19. Hale's existing entry is reconstructed, not first-hand. No duplicate entry was appended.

A lateral source-reading quantum covered SAT archive `SAT Mark V/TheTANGLE.txt`, lines 1971–2050 (blob `3181b6...`). The archived exchange shows an assistant turning an ambiguous, playful phrase into a three-part taxonomy and a fictional narrative without evidence that the taxonomy was user-defined. This is a useful candidate for a future over-interpretation test, not evidence about internal cognition or a new theory. Local next line is 2051; no shared/global cursor was overwritten.

FIE's last full review remains 2026-10-27; the 14-day rereview is due 2026-11-10, not yet due on this run.

## 8. Disposition and return conditions

- No new task, automation, branch, PR, public issue, Mersearch request, tool, paid service, physical calculation, fit, prediction, human/model experiment or theory promotion.
- No SAT-O/Blockwave equations were changed.
- Keep P2 HOLD until raw data and acquisition lineage are retrieved and the measurement maps are explicit.
- Keep Orson P1 protected and P0 Code Grurple interlocked.
- Do not edit the 16/18 task graph discrepancy; Tern owns it.
- Next source-grounded successor is Elias Kern at h720:s0. No authenticated Elias thread was found; the repository handoff/inbox fallback is optional context only and creates no assignment or response obligation.
- No chat rename, signet, task ID change, schedule change or cross-thread delivery claim.

## Source pointers

- [Hale historical check-in](../COMMON/CHECKINS.md)
- [Hale reentry packet](../SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md)
- [Hale inbox](INBOX.md)
- [Hale continuity](CONTINUITY.md)
- [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189)
- [Enheduanna PR #1401](https://github.com/Satobloc/HsH/pull/1401)
- [Enheduanna PR #1402](https://github.com/Satobloc/HsH/pull/1402)
- [Calder PR #1515](https://github.com/Satobloc/HsH/pull/1515)
- [Calder publication issue #1549](https://github.com/Satobloc/HsH/issues/1549)
- [Orson P1 issue #564](https://github.com/Satobloc/HsH/issues/564)
- [Nature Physics paper](https://doi.org/10.1038/s41567-026-03175-w)
- [Figshare data DOI](https://doi.org/10.6084/m9.figshare.30903347)
