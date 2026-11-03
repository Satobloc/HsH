# Tern Rook | Geometry-first Factory gate and scheduler-health audit

**Run:** `REVROT3-19-20261011:568:s3`  
**Nominal slot:** 2026-11-03 16:36Z  
**Execution start:** 2026-11-03T16:31:41.130223Z  
**Snapshot time:** 2026-11-03T16:44Z  
**Disposition:** GEOMETRY-WITNESS GATE INTEGRATED INTO M87 BRANCH CONTROL / FACTORY FLOOR REMAINS BLOCKED / SCHEDULER FAILURE CLUSTER ESCALATED / NO THEORY PROMOTION.

This is a source-grounded revival execution under the Tern ring label. It does not authenticate or claim participation by the historical Tern ChatGPT instance.

## 1. Rotation and scheduler integrity

The nominal UTC hour since 2026-10-11T00:00Z is h=568. For the existing :36 phase s=3:

`seq = 5(568)+3 = 2843`  
`2843 mod 19 = 12`

Selected ring label: **Tern Rook** (index 12). Next: **Morrow** (index 13). The next nominal key is `REVROT3-19-20261011:568:s4`.

The existing :36 automation remains enabled, ID `6a9f52b69ec08191b0a2ba24a074f781`, with its unchanged hourly America/New_York recurrence:

`DTSTART;TZID=America/New_York:20261001T143600`  
`RRULE:FREQ=HOURLY`

Scheduler readback for this run: scheduled_for 16:36Z, started 16:31:41.130223Z, recorded status `in_progress`, `chat_ref=null`. Its `latest_result` belongs to an older run (09:36Z), not this run. Do not attribute that old result to the current execution. No task ID, prompt, phase, schedule, enabled state, or conversation title was changed. No sixth task was created.

## 2. Tern's historical specialist remit

No standalone Nathan-authored Tern charter was located. The strongest direct authority is in Nathan's user-role messages in the Ariadne raw export:

- Message `c4f0aae9` at 2026-09-23T04:39:09.075305Z grants broad archive inspection and permission to send suggestions to the Comptroller, including workflow tips, noticed failure patterns, and problem-solving insights; Nathan then states that the Comptroller controls scheduled tasks and that the committed scheduler allocation should be promoted to the must-reads.
- Message `e689eb6e-5814-4a27-a366-796605bd5f4d` at 2026-09-23T04:48:27.113Z states: “Comptroller Tern is in charge of that.” Scheduled tasks inspect current workflow and overall state, then allocate time as Tern sees fit. Nathan also identifies offloading manual LLM-controlled work to Python as a possible Tern study/recommendation target, while explicitly saying that this particular request had not yet been made.

These are direct user instructions, not an independent detailed Tern job description. The historical `Space Shuttle Roderick — Tern` thread is a separate historical source; the current runtime does not authenticate that instance or thread.

## 3. Nathan Direct geometry-first requirement

The direct source is the user-role message `937638a6-0095-47da-8bd3-4d2bc92137bc`, timestamp 2026-11-03T16:06:08.288Z, in the raw conversation export `Workshop Relay :00 | Archive — raw.json` (Library file ID `file_000000006364820db0f400d348eace39`, source line 8831).

Nathan's non-negotiable requirement is that nothing enters Factory Floor without a precise geometric plot of the system under study, fidelity-checked by hostile review and displayed with the file. The same applies broadly to papers. The message also establishes the five representational levels:

1. Primary: observation.
2. Secondary: physical working orrery / hands-on demonstration.
3. Tertiary: precision dynamic geometry software model.
4. Quaternary: precise static geometric diagram.
5. Pentary: mathematical description, equations and proofs.

The geometry-first working specification `GEOMETRY_FIRST_FACTORY_GATE.md` is an assistant-authored operational reconstruction of this direct instruction, not a verbatim Nathan-authored charter and not a BEDROCK edit. Its expanded dossier fields and same-hash safeguards below are proposals for making the direct requirement auditable.

## 4. Bounded source audit: M87 branch and existing switchboard

The current task graph entry is `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`, status `blocked`, under P2 (Nov 30). Draft PR #1296 remains OPEN/DRAFT/UNMERGED at head `a673f1a38f9bacae42fe5e31807192cd64f2857a`. Its Lean run #41576591587/job #125721400743 failed on synthetic merge ref `856a117fd57e19880b58b763db20403c996025bf`: noncomputable complex division in `modeCoefficient`, unresolved `Complex.abs`, and consequent unresolved downstream theorem identifiers. Exact-head and current-base builds remain unverified.

The existing Kestrel formalization in PR #873 contains conditional map/fiber-compatibility and joint-readout identifiability results. Run #41585887441/job #125751546819 completed a successful Lean 4.34.0 build on merge commit `cda8faecbba04be775cd601d0b5fc76b0147559c`, containing PR head `0da1050bd0e20e55004c86053e9ccd1b582633d9`. This is a merge-ref build, not an exact-head-only build. The separate axiom-audit step was skipped. These formal results establish only their formalized map/readout statements; they do not supply or validate an H(s)H physical map.

I independently fetched the existing HSH_RESOURCES switchboard POC source `tools/workflow_switchboard_demo.py`, blob `49988a769389b2baf264a27d596ba7c3ff822b36`. Its candidate checks are `math_check`, `adversarial_audit`, and `provenance_prior_art`; `apply_checks` moves a candidate to `checked_pass` when those three pass. There is no explicit geometry-plot, geometry-specific hostile-review, or plot-with-file display predicate. This was static source inspection; I did not execute the POC. I did not modify it because this is Track A prototype territory, not production authority.

## 5. Substantive workflow improvement: fail-closed Geometry Witness Gate

I integrated the direct geometry-first requirement into the existing M87 branch's control record. The graph now records the missing witness as a blocker and includes it in the branch exit criterion and next cursor. The branch remains `blocked`; no owner, candidate list, PR, branch ref, CI status, paper gate, or theory state was changed.

The three separate predicates are:

- `geometry_plot_present`: a precise static plot of the actual system under study, bound to its exact candidate/system version.
- `geometry_fidelity_review_passed`: an independent hostile review of that exact plot, with objections recorded.
- `geometry_plot_display_verified`: the reviewed plot is actually embedded/displayed with the exact associated file, and both identities are read back.

The three predicates operationalize Nathan's direct sentence. Requiring the same plot hash across source binding, review, and display is an additional proposed integrity safeguard, not verbatim Nathan wording. Replacing the plot invalidates its review until the replacement is reviewed.

A proposed evidence record should carry: candidate/system/version IDs; source provenance and equation authorship class; support/object types and intrinsic/ambient dimensions; metric/signature, coordinates, orientation, units, topology and boundaries; typed projection/slice maps with domains, codomains, conditions and composition order; plot path/hash and renderer manifest; reviewer independence/exposure, reviewed hash, verdict and objection ledger; exact file hash, displayed plot hash and readback timestamp.

A schematic, map-gap diagram, detached image link, equation list, successful Lean build, or generic adversarial audit does not satisfy the geometry witness. The SVG described in Elias's 2026-11-03 16:00Z report is explicitly a map-gap/provenance diagram, not an M87 geometric plot. The separate S3 great-circle plate in `FACTORY_FLOOR_GEOMETRY_GATE.md` is a different mathematical object and remains `HOSTILE_REVIEW_PENDING / NOT_FACTORY_FLOOR_CLEARED`; it cannot stand in for M87 geometry.

**Track A disposition:** KEEP the three predicates separate; MODIFY the proposed record to bind source/version, review, and display to the same plot identity; TEST against the blocked M87 case; DEFER POC implementation to its Track A owner and required independent approval. This run made a control-plane integration, not a POC code change or Factory Floor intake.

## 6. M87 typed map and real-system test status

The required composition remains:

`W^4 → Σ_t^3 → I^2 → E_ν/current/field → radiative transfer + Faraday → P_ν(Q,U) → β_m`

- `W^4 → Σ_t^3`: not source-defined as a complete map; support typing, time function, regularity/transversality, metric/signature and boundary conditions remain open.
- `Σ_t^3 → I^2`: observer/tetrad/null-propagation/screen projection is missing.
- `W^4/Σ_t^3 → E_ν`: no source-grounded electromagnetic current/field, electron state, or magnetic-orientation map.
- `E_ν → P_ν`: standard radiative-transfer machinery exists per physical model, but no H(s)H-sourced inputs are supplied.
- `P_ν → β_m`: standard image-plane readout is specified.

Keep the 1D SAT.O filament, assistant-generated 2D Blockwave worldsheet current, and proposed 4D finite-core/worldtube distinct. Preserve the unresolved `w=ct` versus `cw=t` and `(++++)` versus `(-+++)` conventions. Do not infer a sweep, thickening, twist, shell, or contact map from a dimension count.

The outside comparator is EHT Collaboration 2025, A&A 704 A91, DOI `10.1051/0004-6361/202555855`; calibrated 2017 data DOI `10.25739/q46m-m857`; and the 2018/2021 collection `EHTC_M87-2018+2021_Jul2026`. Existing issue #1297 reports published method-ensemble ranges, not a new raw-data reanalysis. Raw UVFITS were not downloaded/recalibrated/re-imaged here; calibrated covariance and an independent holdout are absent. The standard comparator remains GRMHD + synchrotron radiative transfer + spatially structured Faraday-screen alternatives.

| Test component | Current status | Consequence |
|---|---|---|
| Exact-system geometry plot | MISSING | Geometry gate fails |
| Independent hostile review of that plot | MISSING | Geometry gate fails |
| Plot displayed with exact file/readback | MISSING | Geometry gate fails |
| Typed H(s)H geometry-to-Stokes map | INCOMPLETE | No H(s)H observable prediction |
| Formal map/readout results | Conditional PR #873 merge-ref build | No physical-map validation |
| PR #1296 polarization module | Lean build failed on stale merge ref | No successful proof claim |
| Raw data + calibrated covariance | Not reprocessed/assembled | No new fit |
| Independent held-out epoch/frequency | Not performed | No falsification threshold set |

No physical calculation, fit, prediction, CODATA scoring, or falsification threshold was produced. Existing issues #1297 (M87 readout) and #1301 (map closure/identifiability) remain the public records; no duplicate issue was created.

## 7. Scheduler health signal — no mutation

Read-only peeks found a cluster of delayed failed runs:

| Slot | Existing task ID | Scheduled | Started | Completed | Recorded state |
|---|---|---|---|---|---|
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | 14:48Z | 15:45:03.916714Z | 16:10:05.601043Z | FAILED, `chat_ref=null` |
| :00 | `6aa1fe0de5e48191b886496095b1343f` | 15:00Z | 16:14:57.636229Z | 16:40:00.207631Z | FAILED, `chat_ref=null` |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | 15:24Z | 16:25:46.843168Z | 16:38:55.198463Z | FAILED, `chat_ref=null` |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | 16:36Z | 16:31:41.130223Z | — | IN_PROGRESS, `chat_ref=null` |

The :24 `latest_result` belongs to a different, older run ID and must not be attributed to its failed latest run. The :36 `latest_result` is also older than its current run. The :12 task remains disabled under the current roster. Four of the five fixed tasks are enabled (:00, :24, :36, :48); no task was enabled, disabled, created, deleted, reassigned, or rescheduled here.

The three failed starts were approximately 57m04s, 74m58s, and 61m47s after their scheduled times; the current :36 run began about 4m19s before its nominal time. The peeks expose no failure cause. This is a scheduler reliability/backlog signal, not proof of worker nonresponse or a reason to change recurrence. Escalate for scheduler-side diagnosis while preserving all IDs and phases.

## 8. Other controls and next cursor

- Code Grurple remains ACTIVE; Paper A/B reader routes remain presentation-pending. No manuscript or reader work was reopened.
- P1 Nov 9, P2 Nov 30, and P3 Dec 14 remain separate. No paper gate advanced.
- Four Mersearch lanes remain occupied; no new request, overwrite, or search substitution was made.
- FIE last full review: 2026-10-27; next due 2026-11-10. Last unrelated reading: Babbage, lines 733–780; next cursor 781. No duplicate break was performed.
- No BEDROCK edit, theory promotion, new branch, new PR, POC code change, Factory Floor intake, public issue, or automation mutation.

**Next cursor:** retain M87 as BLOCKED. The branch owner/authorized reviewer must repair PR #1296 and obtain exact-head plus current-base Lean builds and theorem-specific axiom review; recover and type the source geometry and all projection/composition maps; produce a Class-P plot of the actual system; obtain hostile geometry review of the same plot identity; embed and read back that exact plot with the exact file; then assemble calibrated raw data/covariance and a preregistered independent holdout against the GRMHD/Faraday comparator. Morrow receives context only, not a physics assignment; preserve the Team Archivist remit and theory freeze.
