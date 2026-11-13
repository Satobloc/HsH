# Hale h799:s3 | Hu et al. (2023) sensor-to-elongation map and zero-offset gate

**Run key:** `REVROT3-19-20261011:799:s3`  
**Nominal slot:** 2026-11-13 07:36Z  
**Deterministic selection:** Hale, ring index 8  
**Next label:** Elias Kern, ring index 9  
**Disposition:** SOURCE-BASED MEASUREMENT-MAP GAP IDENTIFIED / CONDITIONAL LEAN THEOREM VERIFIED ON DEPENDENT PR MERGE REF / PUBLICATION SUBMITTED NOT YET VERIFIED / NO PHYSICAL VALIDATION.

## 1. Selection, historical authority, and identity limits

`h=799`; `seq=5(799)+3=3998`; `3998 mod 19=8`. The next ring index is 9, Elias Kern.

Hale's historical specialist evidence is incomplete. The 2026-09-12 entry in `WORKSPACES/COMMON/CHECKINS.md` is a self-report describing external literature scanning, Python keyword scoring, matched-period comparisons and null/control design. `WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md` is an assistant-curated re-entry packet, not a signed Nathan-authored charter. The candidate raw conversation has not been recovered as an inspectable source in this run. Do not upgrade the self-report or wake packet into a formal charter.

The current :36 scheduler record has `chat_ref=null`. The selected label is not an authenticated Hale instance or historical thread. No cross-thread delivery or historical-instance participation is claimed.

## 2. Live preflight and repository state

The following current-main control surfaces were fetched and inspected before substantive work:

| Surface | Blob SHA |
|---|---|
| BEDROCK | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Steering Charter 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Primary Operational Guideline / Nathan Direct 2026-11-08 | `a8e333b1d5b5aa1d9772366945dd88769d24153c` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Current Workflow Orientation V2 | `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Revival Rotation V4 / not-found revival | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Universal Shape-to-Lean directive | `2b49291aa0836b70e283950eabd9f74ff6707be3` |
| Thread-first / house-write rule | `e79707587914edb76afca1c32f9f4dad4d0324b7` |
| Workflow Branching Map | `756c506780072591b2f48e22044f3368a57bfa7d` |
| Task Branch Graph | `05283edaa44e2163406c8b005a7fbbca95d76c7f` |
| Scheduler Authority | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| Shared-State Write Safety | `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5` |
| Automation Workflow Control | `244368fc0af7e5fad19a300d99396609f67bdc51` |
| Worker Autonomy / Handoff | `7a21c87311d2c812209fa08fe50a4246c8b53761` |
| No Conversation Renaming | `286366b1072f9a186d6b4235103e5d71293fb60a` |
| Worker Upkeep Protocol | `e43002b54ca211e563a02b37f6e07fdfb9b45ed0` |
| Mersearch Worker Start Here | `086778737a004c467b0b52142d71aa5b961fc166` |
| Mersearch Releases | `e44316bd01a5d8618433e866a209fe63e04e25a6` |

The HsH, SAT archive and HSH_RESOURCES front doors were inspected. HSH_RESOURCES remains private/internal reference infrastructure; no private payload or private locator was copied into public output. The HSH Tool Chest and Toolkit Digestion Plan were checked. Existing Math Hopper #578, Whirligig Kernel 0, SciSpace, and current Lean PR/CI routes were considered; no new tooling, dependency, fork, subscription or expense was introduced.

All four canonical Mersearch request lanes remain occupied with status `requested`; all eight expected request-scoped `RUN_MANIFEST.json` / `SEARCH_RECEIPT.json` paths were absent at readback. No callable Mersearch action was exposed in this runtime. The bounded GitHub searches used here are a fallback, **not a verified Mersearch run**. No lane was overwritten or retriggered.

Current HsH main before this run's writes: `0420bedfa8eee7af859969893d7470be6cdc8a79`. Task graph remained ACTIVE_SEED with 16 declared branches and 18 records. No graph mutation was made.

## 3. Primary-source finding: instrument output is not automatically the model coordinate

**Primary source:** Hu, Z. et al. (2023), “Impact behavior of nylon kernmantle ropes for high-altitude fall protection,” *Journal of Engineered Fibers and Fabrics* 18, DOI [10.1177/15589250231167401](https://doi.org/10.1177/15589250231167401), [publisher PDF](https://journals.sagepub.com/doi/pdf/10.1177/15589250231167401), especially Figure 3 and PDF pp. 4–6.

The source distinguishes three objects:

1. **Physical specimen:** a three-dimensional nylon kernmantle rope with a 12-rope twisted core and 48-strand sheath.
2. **Instrument readouts:** a laser displacement/range sensor reporting drop-load fall height and a strain transducer between the drop mass and test rope.
3. **Model coordinate:** scalar (x), described as rope elongation, with the falling-impact balance position as origin and downward positive.

The article separately describes a free-fall stage before the rope straightens and the loaded elastic response begins. Therefore the full release-to-impact fall height is not automatically identical to rope elongation.

The sensor prose says the LRT-TB5000 is mounted on top of the drop mass; Figure 3 appears to place the laser head at the upper test frame, aimed toward the moving mass. This is a source-level mounting-description ambiguity, not evidence that the experiment is wrong. More importantly, the paper does not fully specify the raw sensor range-to-(x) transform, balance-position zero procedure, tautening reference, or calibration covariance.

A conditional map is:

[
x(t)=a,[d(t)-d_0],
]

where (d(t)) is the calibrated sensor range/position, (d_0) is its reading at the model's balance-position zero, and (a) is a declared calibrated scale/sign factor. This map is valid only under fixed, collinear, vertical, taut, one-degree-of-freedom geometry. If free fall precedes rope loading, the tautening event and model zero must be identified. If the anchor/frame moves or the rope path changes, those measured geometric variables must enter the map and uncertainty budget.

This is a reproducibility boundary, not a finding of measurement failure.

## 4. Conditional algebraic result and actual Lean run

Issue #1674 separately records the source-derived correction to the printed equation (3):

[
R(x)=ddot{x}+2ndot{x}+p^2x=0.
]

For a constant affine readout (y=ax+b), with first and second jet components scaled by the same constant (a),

[
R(y)=aR(x)+p^2b.
]

If the source coordinate satisfies the homogeneous oscillator equation and the raw readout is also asserted to satisfy that same homogeneous equation, then (p^2
e0) forces (b=0). Otherwise the offset must be calibrated out or explicitly retained in the fitted model. This is conditional algebra, not evidence that the experiment's sensor actually has a constant affine transfer function.

**Formalization:** [dependent draft PR #1675](https://github.com/Satobloc/HsH/pull/1675), branch `research/hale-rope-readout-offset-20261113t0736z`, based on PR #1671's existing integration branch. The PR does not modify #1671 or main.

- Module: `FORMAL_VERIFICATION/HsHVerification/HaleRopeReadoutOffset.lean`.
- Theorem names: `affineReadout_residual`; `homogeneousReadout_forces_zero_offset`.
- Actual Actions run: [#43388066483](https://github.com/Satobloc/HsH/actions/runs/43388066483), job #131761133118.
- Lean 4.34.0; Lake 5.0.0.
- PR merge-ref library build: **8,948 jobs completed successfully**; target module built at 8931/8948.
- Both theorem-specific `#print axioms` reports: `[propext]`.
- No `sorryAx`, bare `admit`, or compiler error occurred in the captured job log.
- The separate global axiom audit, leanchecker and nanoda were skipped; `nanoda-allow-sorry=true`. This is not a repository-wide no-sorry or axiom-free certification.
- This was a PR merge-ref build containing the PR head, not a standalone main build. PR #1675 remains OPEN / DRAFT / dependent on #1671's unmerged branch.

The Lean structure is an algebraic second-order jet. It does not prove calculus, the sensor transfer function, the balance-zero premise, rope tautness, or the physical oscillator model. Lean checks only the formalized conditional statement.

## 5. Independent test contract

| Hypothesis | Shared parameters | Calibration / holdout | Observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| Instrument-to-coordinate map | Sensor scale, zero, sign, target/anchor geometry, timing | Calibrate scale and zero before model fitting; verify on independent calibration runs | Raw range (d(t)), derived elongation (x(t)) | Direct geometric range-to-position reconstruction | Calibration or geometry changes exceed the declared uncertainty, or the proposed map fails independent calibration |
| One-DOF oscillator | (m,c,k), equivalently (n,p^2), plus shared instrument calibration | Freeze calibration and fit on training drops; hold out entire independent drops/specimens | (x(t)) and force (F(t)) | The paper's damped one-degree-of-freedom oscillator | Held-out residuals exceed a pre-registered predictive region based on full measurement/model covariance |
| H(s)H extension | Must be derived from existing geometry, not added by analogy | Requires a source-defined state map and an independently measured observable not already absorbed by the standard model | Not yet specified | Same standard oscillator and rig measurements | Not test-ready until a distinct prediction and measurement map exist |

Required evidence: raw synchronized range and force traces; sensor mounting/target diagram; calibration scale and balance-position zero; tautening-event definition; anchor/frame and guide alignment; sampling/time synchronization; calibration uncertainty/covariance; and independent drop/specimen manifest. Frames, peaks and repeated impacts within one drop are not independent acquisitions.

The rope's scalar oscillator equation does not encode its internal braid geometry. No H(s)H worldtube map is specified. WWRD climbing-rope mechanics remains a first-blush geometric heuristic only.

## 6. Publication and predecessor reconciliation

- Existing issue #1234 covers the general rope measurement/protocol review.
- Existing issue #1674 covers the printed equation (3) correction.
- New distinct source-map submission: issue #1676, submission ID `hale-hu2023-sensor-to-elongation-map-20261113t0736z-s3-001`.
- Submitted payload SHA-256: `35c85ad29e25e01675a89938a19ed0296c46df3d18f81dd235c425af1b4c2723`; content 4,512 UTF-8 bytes.
- At this receipt's creation, no publisher comment or artifact readback had yet appeared. Status: **SUBMITTED_NOT_VERIFIED**. Do not resubmit or create a duplicate. Next run must check the exact publisher comment, artifact path, SHA-256 and issue-payload equality.

The incoming Calder h799:s2 report and handoff were read. Issue #1674's source-equation correction was treated as already completed predecessor work; it was not repeated as a new finding.

## 7. Continuity, handoff and campaign

- Current selected :36 run ID: `26f2c3f4-4258-8320-82c2-5c656c520c97`, scheduled 07:36Z, started 07:37:50.851452Z, IN_PROGRESS at last peek, completion null, `chat_ref=null`.
- Cached latest result belongs to prior run `fb714390-a880-8329-b0fb-344b5865a7b6`, not this Hale run.
- Next deterministic label: Elias Kern, h799:s4.
- The :48 task's last observed run was Orson h797:s4 and completed; the task-level next-run field was stale at 07:48 local, and no h799:s4 run record was observed at the last peek. Handoff timing is therefore UNVERIFIED. The Elias packet is optional repository context only, with no task, response obligation, deadline, review request or ownership transfer. No direct thread delivery, consumption or acknowledgment is claimed.

Campaign status unchanged: P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY, Orson-owned; P2 Geometry HOLD; P3 full theory INCOMPLETE. FIE was last reviewed November 10; next review November 24. No paper gate advanced. No SAT-O or Blockwave equation changed. No BEDROCK theory promotion.

Unrelated reading: Babbage, *Reflections on the Decline of Science in England*, lines 2181–2220. Next cursor: 2221. No physical break is claimed.

## 8. Automation and write route

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with exact saved VEVENT `DTSTART;TZID=America/New_York:20261001T143600\nRRULE:FREQ=HOURLY`. The existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its original :48 hourly VEVENT. No task ID, prompt, phase, cadence or enabled state changed; no sixth task was created.

House-write preflight found no local HsH checkout, GitHub CLI, or suitable approved internal Actions writer. The fixed issue publisher was used for public-safe output; internal report/receipt/inbox records use the documented GitHub Contents API fallback with fresh reads, current blob SHA compare-and-swap, and exact post-write readback. No retry loop or direct public artifact write was used.

**Final status:** `SOURCE_MAP_GAP_DOCUMENTED / CONDITIONAL_LEAN_THEOREM_VERIFIED_ON_PR_MERGE_REF / ISSUE1676_SUBMITTED_NOT_VERIFIED / NO_PHYSICAL_VALIDATION / NO_P2_SELECTION / NO_THEORY_PROMOTION / ELIAS_OPTIONAL_HANDOFF_TIMING_UNVERIFIED / AUTOMATION_UNCHANGED / NO_SIXTH_TASK / S36_IN_PROGRESS`.
