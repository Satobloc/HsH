# H817:s3 — NIST Source-Version and Measurement-Independence Audit

**Run key:** REVROT3-19-20261011:817:s3  
**Nominal slot:** 2026-11-14T01:36:00Z  
**Selected ring label:** Ariadne (index 3)  
**Next ring label:** Alberr (index 4)  
**Lane:** :36 architecture, workflow, prediction; executed through Ariadne's source-archaeology and provenance specialty  
**Participation status:** source-grounded revival in the current scheduled execution; no authenticated historical Ariadne instance/thread is claimed.

## Executive result

Aster's h817:s2 packet identified a material mismatch between the NIST landing page and the final published PDF for the BIPM torsion-balance redetermination of G. This run independently re-opened the NIST HTML landing page, final NIST-hosted PDF, CODATA 2022 reference, Ravel's existing report, and already-published issue #1716.

The final PDF is the appropriate source for the article's final authorship and numerical result. The NIST landing page currently exposes a different author list, a different G estimate, a different uncertainty, and an internally inconsistent relative-uncertainty statement. The cause of the divergence is unknown; it must not be labelled a preprint or stale draft without evidence.

The more consequential architecture improvement is an explicit **measurement-independence vector**. A new measurement campaign, a separate site, a different analysis, a statistically untouched holdout, an independent calibration chain, and independent personnel are different properties. They must not be collapsed into a single binary word, “independent.”

This affects how the NIST result may be used in a future H(s)H comparison: the published NIST consensus is a useful standard-physics measured-system control, but it is not an untouched holdout against CODATA, and the NIST/BIPM replication is not wholly independent of the earlier BIPM effort.

**Publication decision:** an additive source-version note would be useful on existing issue #1716, but Ravel's existing owner-review boundary controls. No public comment, new issue, replacement artifact, or duplicate submission was made. The exact proposed addendum is included below for Ravel/owner review.

## 1. Source and identity preflight

### Live project state

- HsH main snapshot at start of work: `8d9a31adba7b0114c9f8786e53170e999f40efed`.
- Live BEDROCK was read in three sequential ranges, lines 1–667, blob `0253ace674` (the complete current blob SHA was retained in the fetched repository response).
- Nathan Direct methodology/model overview was read in three sequential ranges, lines 1–511, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`.
- Steering Charter 2026-10-26, Three-Manuscript Campaign, NEW_INSTANCE_START_HERE, current workflow orientation, three-repository front doors, Revival Rotation V3, V4 not-found revival, thread-first rule, navigation preflight, scheduler authority, worker autonomy/handoff, shared-state write safety, cross-repo script safety, Reference Desk, Tool Chest router, Mersearch worker start, task graph, active automation roster, and Primary Workflow Health queue were inspected.
- Task graph remains ACTIVE_SEED with 16 declared branches and 18 records. No graph mutation was made.
- Campaign status remains P0 ACTIVE; P1 Orson-owned OVERDUE / NOT READY; P2 HOLD; P3 INCOMPLETE. FIE last rereview: 2026-11-10; next due: 2026-11-24.
- The current Aster h817:s2 handoff was written before this run's recorded start and was consumed as PRESTART_OPTIONAL_REPOSITORY_CONTEXT. It was not a task assignment or direct ChatGPT delivery.

### Ariadne historical source

The Library raw export “ARIADNE — raw.json” was re-materialized and parsed from its actual current ancestry.

- Conversation ID: `6ab339f6-0a4a-85d8-92a0-49f3b2a813de`.
- Raw export SHA-256: `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`.
- 1,364 mapping nodes; 1,363 message objects; 10 user-role messages.
- All ten user-role nodes have `author.name=null`; their role and message IDs are preserved rather than treating the export as a signed specialist charter.
- Relevant direct user-role source IDs include `c4f0aae9-3290-42c6-a5d0-b42c19a88255` (broad archive/source inspection bounded by onboarding and current workflow) and `e689eb6e-5814-4a27-a366-796605bd5f4d` (Python offload as a possible study lane, not scheduler authority).
- No standalone signed Ariadne role charter was located. The historical specialty is source archaeology, chronology, provenance, recovery, and constructive cross-worker suggestions. The role label in later workspace prose is an assistant-organized synthesis, not a Nathan-authored charter.
- The latest usable historical ChatGPT thread was not authenticated. The scheduled execution therefore performed source-grounded work in the current run; no historical-instance participation, new-chat creation, or cross-thread delivery is claimed.

Ariadne's existing primary cursor remains the January 22 Kirk/Riley source-identity and behavioral-operator recovery. This NIST audit is a bounded cross-worker source/provenance operation from Aster's incoming packet, not a replacement of Ariadne's own parked work.

## 2. Source-version graph

### Nodes

| Node | Source identity | Evidential role |
|---|---|---|
| NIST-HTML | NIST publication landing page, created 2026-04-16, updated 2026-05-02 | Discovery and page-metadata record; currently mismatches the final PDF |
| NIST-PDF-VOR | NIST-hosted 31-page PDF, Metrologia 63 (2026) 025012, published 2026-04-16 | Primary source for final article text, author list, measurement model, result, and limitations |
| DOI | 10.1088/1681-7575/ae570f | Article identifier printed in the PDF and linked by the landing page; DOI/IOP metadata endpoints did not return a usable independent record in this runtime |
| CODATA-2022 | NIST SP 961 (May 2024) / 2022 recommended values | External standard reference for the CODATA value and stated uncertainty |
| RAVEL-1716 | Existing PUBLISHED_VERIFIED artifact and issue #1716 | Already-published standard-comparator and projection-fiber analysis; not an independent measurement source |
| RAW-NIST-DATA | Raw torque time series, complete CMM point cloud, calibration records | NOT RETRIEVED in this run |

### Relations

- NIST-HTML links to DOI and the NIST-hosted PDF.
- NIST-PDF-VOR prints the DOI, journal citation, received/revised/accepted/published dates, nine-author byline, final abstract result, methods, uncertainty analysis, and independence caveat.
- NIST-HTML and NIST-PDF-VOR describe the same article. They are two representations/version surfaces, **not two independent physical witnesses**.
- NIST-PDF-VOR reports a new NIST measurement campaign using the BIPM torsion balance, with several modifications.
- NIST-PDF-VOR explicitly records shared personnel lineage with the BIPM effort.
- NIST-PDF-VOR uses a Bayesian prior centered on CODATA 2022 and combines four configuration-level determinations with configuration-specific dark uncertainty.
- RAW-NIST-DATA remains absent from the retrieved evidence set.

### Claim-use rule

- Final authorship, final G, final relative uncertainty, measurement dates, methods, covariance, prior, and independence caveat: cite NIST-PDF-VOR.
- The mismatch itself, page creation/update date, and landing-page author/abstract fields: cite NIST-HTML.
- CODATA 2022 value and standard uncertainty: cite NIST SP 961, not the NIST landing-page abstract.
- Raw-data or independent-holdout claims: do not make them without the underlying data and acquisition/calibration records.
- DOI metadata: identifier verified from the PDF and NIST link; an independent DOI-resolver metadata response was not obtained.

## 3. Exact landing-page versus final-PDF reconciliation

### Authors

- NIST-HTML lists eight authors: Stephan Schlamminger, Leon Chao, Vincent Lee, Craig Shakarji, David Newell, Julian Stirling, Robert Cochrane, and Clive Speake.
- NIST-PDF-VOR lists nine authors and includes Antonio Possolo between Craig Shakarji and David Newell.
- The landing-page citation also lists eight authors. The PDF's byline is the final article byline.
- The reason Antonio Possolo is absent from the HTML page is unknown.

### Reported value and uncertainty

All G values below are in m³ kg⁻¹ s⁻².

| Source | G | Absolute standard uncertainty | Relative standard uncertainty |
|---|---:|---:|---:|
| NIST-HTML | 6.67366 × 10⁻¹¹ | 0.00020 × 10⁻¹¹ = 2.0 × 10⁻¹⁵ | page states 3.0 × 10⁻⁶ |
| NIST-PDF-VOR | 6.67387 × 10⁻¹¹ | 0.00038 × 10⁻¹¹ = 3.8 × 10⁻¹⁵ | 5.7 × 10⁻⁵ |
| CODATA 2022 | 6.67430 × 10⁻¹¹ | 1.5 × 10⁻¹⁵ | 2.247 × 10⁻⁵ (derived) |

### Reproducible arithmetic on published summaries

1. NIST-HTML absolute uncertainty converted to relative ppm:

   `(0.00020 / 6.67366) × 10⁶ = 29.9686 ppm`.

   The page's stated 3.0 × 10⁻⁶ is 3 ppm. Its own absolute uncertainty implies approximately 29.97 ppm, a factor of 9.9895 larger. This is an internal page-level inconsistency, not an independently established error in the underlying measurement.

2. NIST-PDF-VOR absolute uncertainty converted to relative ppm:

   `(0.00038 / 6.67387) × 10⁶ = 56.9385 ppm`.

   This agrees with the PDF's rounded 5.7 × 10⁻⁵, or 57 ppm.

3. Landing-page value relative to final-PDF value:

   `(6.67366 / 6.67387 − 1) × 10⁶ = −31.466 ppm`.

4. Final-PDF value relative to CODATA 2022:

   `(6.67387 / 6.67430 − 1) × 10⁶ = −64.426 ppm`.

5. The paper's Bayesian prior standard deviation is 9 × 10⁻¹⁵. CODATA 2022's stated standard uncertainty is 1.5 × 10⁻¹⁵. Their width ratio is 6. The paper says its 9 × 10⁻¹⁵ prior width is the robust Qn estimate of the spread of the data points in its Figure 1; it is not the CODATA standard uncertainty.

These are arithmetic checks of published summary numbers. They are not a new fit, posterior reconstruction, raw-data reanalysis, or independent measurement.

### Version disposition

The landing page was created April 16 and updated May 2, while the PDF says published April 16. Because the landing page was updated after publication yet still contains different authorship and abstract values, the mismatch must be preserved as an unresolved source-version inconsistency. Do not label it “preprint,” “stale draft,” or “superseded abstract” without evidence of the actual page-generation history.

## 4. Measurement-independence vector

The article reports experimental data collected from 24 January through 22 June 2024. Torque differences were measured using electrostatic-servo and free-deflection methods. Four campaigns were conducted: one sapphire source-mass campaign and three copper campaigns at different rotational orientations. The paper lists eight torque differences and combines the results into four configuration-level determinations. The final model reports correlated configuration effects.

Independence is therefore represented as a vector, not a Boolean.

| Dimension | Evidence-grounded status | Consequence |
|---|---|---|
| New measurement campaign | YES: a NIST campaign was conducted | It is a replication campaign |
| Measurement site | NIST, distinct from the original BIPM site | Site separation is present |
| Apparatus lineage | SAME BIPM torsion balance and geometry, with modifications | Not an independent instrument |
| Personnel lineage | PARTIAL OVERLAP: C. C. Speake contributed to both efforts, helped set up/discuss the apparatus at NIST, and remained involved through regular remote meetings over nearly a decade | Not wholly independent personnel |
| Calibration independence | NOT ESTABLISHED by the retrieved public article alone | Do not assume separate calibration lineage |
| Analysis independence | NOT QUANTIFIED as a separate independent reanalysis in the retrieved evidence | Preserve as unresolved |
| Statistical holdout | NO for the final consensus versus CODATA: the prior is centered on CODATA and the four configuration determinations enter the posterior consensus | The final posterior is not an untouched CODATA holdout |
| Blinding | YES for an unknown source-mass scaling factor r in [−10⁻³,+10⁻³], opened at CPEM 2024 after internal consistency | This is an experimenter-bias control, not an independent holdout |
| Source independence | NO: landing page and PDF are representations of the same article | Do not count them as independent corroboration |
| Raw-data accessibility in this run | NOT RETRIEVED | No independent reanalysis possible |

The paper reports p = 0.29 for the difference between its final G and CODATA when their respective uncertainties are considered. Because the paper's Bayesian prior for the consensus value is centered on CODATA 2022, this comparison must not be advertised as a fully independent holdout test. The prior is broader than CODATA's stated uncertainty, but that does not remove the dependence.

The blind mass-scaling factor was a bias-control procedure. The envelope was opened at CPEM 2024 after internal consistency; the CPEM value differed from the final paper value by −4.4 × 10⁻⁵, with small subsequent changes attributed to bookend measurements of the test-mass mounting-circle radius. This does not create an independent dataset.

## 5. Consequences for the H(s)H test architecture

Ravel's issue #1716 already correctly uses the final NIST PDF result and a full measured finite-support Newtonian comparator. It does not use the landing-page value. Its projection-fiber theorem is conditional mathematics, not a physical H(s)H mapping.

The source audit adds an independence contract to that test architecture:

1. Freeze the exact article version, data-source identity, author list, measurement dates, and claim-use map before any comparison.
2. Treat the full finite-support Newtonian model as the standard baseline. The point-mass reduction remains only a negative control; it is not an adequate high-precision comparator.
3. Freeze shared geometry, calibration, nuisance parameters, and their covariance before comparing standard and H(s)H models.
4. Declare the fit/calibration acquisition subset. A holdout must be an acquisition block or condition not used in parameter fitting, calibration tuning, model selection, or the prior that is being tested.
5. Preserve the covariance among the four NIST configuration determinations. Do not count correlated configurations as independent replications.
6. If a test uses a CODATA-centered prior, do not use agreement with CODATA as an independent validation. Either model that dependence explicitly or use an independently justified prior and a separate holdout.
7. Report measurement, apparatus, personnel, calibration, analysis, statistical, and source independence separately. A new campaign with shared apparatus/personnel is a replication with partial lineage, not a wholly independent replication.
8. Pre-register the held-out observable and rejection region. No numerical H(s)H falsification threshold is assigned here because raw torque time series, full CMM point cloud, calibration records, and joint covariance were not retrieved.

### Conditional geometry implication

The NIST result does not identify a torsion-balance mass as an H(s)H worldtube, and it does not test H(s)H. It does show that finite mass support is already required by ordinary Newtonian modeling for this instrument. Therefore:

- Finite support or thickness alone is not a distinctive H(s)H prediction.
- A minimal H(s)H representation must produce an additional source-defined observable beyond the full finite-support standard model to become empirically distinguishable.
- Twist, contact surfaces, responsive medium, or additional worldtube structure remain optional extensions unless the source-defined maps and constitutive relations force them and a distinct within-projection-fiber readout survives an independent holdout.
- If the readout is constant on the relevant projection fibers, the extra representation is not identifiable by that channel.
- No physical projection, timesheet response, contact law, or instrument map is supplied by this NIST source audit.

This is an architecture constraint and conditional test design, not a new H(s)H prediction or theory promotion.

## 6. Formalization status

Existing Ravel PR #1133 already contains the projection-fiber criterion, including the conditional result that a readout descends to a reduced representation exactly when it is constant on the relevant fibers. Its latest cited successful build is a PR merge-reference build, not a standalone exact-head/current-main integration. Tests, lint, nanoda, and the separate global axiom audit were skipped in the cited run. The PR remains OPEN / DRAFT / UNMERGED.

No new Lean module or theorem was created. No Lean/Lake/Elan executable is installed in this runtime, so no local Lean compilation or actual Lean execution is claimed. The new independence vector is a typed evidence schema, not a Lean-proven theorem. Python Decimal arithmetic was used only to reproduce the published-summary ratios above.

Lean's conditional proof does not establish the soundness of the source-to-model translation, the existence of a physical H(s)H projection, or the truth of any physical premise.

## 7. Publication and owner-review decision

Existing issue #1716 remains OPEN and PUBLISHED_VERIFIED. Its published artifact already uses the final PDF value, DOI, finite-support model comparison, and projection-fiber limitations. No numerical correction to Ravel's published result is required.

A source-version note is recommended because the NIST landing page currently displays eight authors and a different G/uncertainty pair, and because the final article qualifies the independence claim with a shared-personnel history not visible in the landing-page abstract.

**Owner boundary:** Aster's incoming handoff expressly prohibits editing Ravel's report or published artifact without Ravel/owner review. Therefore:
- no comment was added to #1716;
- no new issue or PR was created;
- no publisher submission was created;
- no duplicate publication was attempted.

Suggested addendum for Ravel/owner review:

> **Source-version and replication-independence note:** The NIST landing page currently lists eight authors and gives G = (6.67366 ± 0.00020) × 10⁻¹¹ with a stated relative standard uncertainty of 3.0 × 10⁻⁶. The final NIST-hosted Metrologia PDF (63 (2026) 025012, DOI 10.1088/1681-7575/ae570f) lists nine authors, including Antonio Possolo, and reports G = (6.67387 ± 0.00038) × 10⁻¹¹ with relative standard uncertainty 5.7 × 10⁻⁵. The landing-page absolute uncertainty implies about 29.97 ppm, not 3 ppm. The cause of the landing-page/PDF mismatch is unknown; the final PDF is used for the published result. The final paper also says the NIST/BIPM determination is not entirely independent because C. C. Speake contributed to both efforts. Its final Bayesian consensus uses a prior centered on CODATA 2022, so the reported comparison with CODATA is not an untouched independent holdout. No new measurement or H(s)H validation is implied.

If Ravel/owner approves, publish this as an additive comment on existing #1716 through the existing publisher, then verify publisher receipt, exact artifact checksum, and independent readback. Do not create a new issue.

## 8. Sources and exact coverage

### Internal sources read

- Live BEDROCK, complete 667-line file.
- Nathan Direct methodology/model overview, complete 511-line file.
- Steering Charter 2026-10-26, complete 158-line file.
- Three-Manuscript Campaign, complete 61-line file.
- New-instance onboarding and current workflow orientation.
- Revival Rotation V3, V4, thread-first rule, navigation preflight, scheduler authority, autonomy/handoff protocol.
- Reference Desk, Tool Chest router, Mersearch worker guidance, shared-state write safety, cross-repo script safety.
- Current task graph, Primary Workflow Health queue, active automation roster.
- Ariadne README/BOOT/CURRENT_WORK/INBOX and historical raw conversation export.
- Aster h817:s2 report and pre-start handoff.
- Ravel h816:s3 report, public artifact, issue #1716, and PR #1133.

### External sources read

1. NIST HTML landing page: https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
2. Final NIST-hosted PDF, pub_id 961075: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075
3. NIST CODATA 2022 SP 961: https://www.physics.nist.gov/cuu/pdf/wall_2022.pdf
4. Existing Ravel issue #1716: https://github.com/Satobloc/HsH/issues/1716
5. Existing Ravel PR #1133: https://github.com/Satobloc/HsH/pull/1133

The DOI resolver and IOP metadata endpoints were attempted but did not return a usable independent metadata record. The PDF itself prints the DOI and final citation.

### Tool and access limits

- No local HsH Git checkout was present. No existing Actions writer was suited to worker-local source-audit and inbox files. The house write route was therefore unavailable for this operation; the GitHub Contents API fallback was used with fresh blob-SHA compare-and-swap updates and independent readbacks.
- Mersearch was not callable in this runtime. All four canonical Mersearch requests remain occupied/HELD; no request was changed, overwritten, or retriggered.
- No HSH_RESOURCES private payload was opened.
- No raw NIST torque series, full CMM point cloud, or calibration logs were retrieved.
- No new tool, dependency, subscription, or expenditure was introduced.

### Unrelated reading

Continued Oscar Wilde, *The Picture of Dorian Gray*, Project Gutenberg eBook #174, HTML lines 119–158. Next cursor: line 159. This was an unrelated reading break, not evidence for the physical analysis.

## 9. Current status and next cursors

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next rereview: 2026-11-24.
- Ariadne's primary source-recovery cursor remains the January 22 Kirk/Riley source-identity and behavioral-operator work; no new Mersearch search was submitted.
- Ravel owner review of the proposed #1716 source-version note is the only gate before any public addendum.
- Next scheduled ring label: Alberr. The handoff is optional repository context only; Alberr's autonomy is preserved.

## 10. Scheduler preservation

Existing :36 task ID: 6a9f52b69ec08191b0a2ba24a074f781. It remains enabled with its original hourly America/New_York :36 schedule, prompt, and phase unchanged. No sixth task, task mutation, scheduler mutation, signet, or conversation rename occurred.

Current run ID observed by exact-ID peek: 7bcb4a90-6e73-4d72-9a3a-b2bfe8e7d3a4. Status IN_PROGRESS; completion and run-level chat_ref are null. The cached latest result belongs to the preceding Ravel h816:s3 run, not this Ariadne execution. Repository work and readbacks are separate from scheduler-wrapper completion; no terminal completion is claimed.
