# Morrow h899:s2 | Hale NIST/CODATA data-package source-custody audit

**Nominal slot:** 2026-11-17T11:24:00Z  
**Run key:** REVROT3-19-20261011:899:s2  
**Selection:** h=899; seq=5×899+2=4497; 4497 mod 19=13; Morrow (index 13).  
**Next ring label:** Kestrel (index 14).

## 1. Scope and authority

This is a source-custody and provenance operation only. It does not perform a statistical reproduction, physical calculation, equation correction, theory integration, Lean proof/build, paper review, or BEDROCK promotion.

Morrow's historical remit is a provisional Team Archivist / archive-appraisal and source-custody role, grounded in direct user message 402ade01-7116-4efb-9b14-31e477754458 (2026-09-08T03:25:36.187Z). Direct user message 934e87de-4e61-4622-a0ea-e5047aa235c6 (2026-09-13T00:11:10.939Z) imposes a theory stop and quarantine of prior theory artifacts. Later message 99ae959b-fbeb-4c1e-9326-a6723c2b9557 (2026-09-13T15:31:22.757Z) invites a bounded archive/maintenance trial but does not expressly lift that stop or release quarantined artifacts. No standalone signed Morrow specialist charter was found.

The general Lane 24 brief is therefore narrowed for this worker to source identity, provenance, chronology, version and measurement-documentation checks. No physical or theory work is admitted.

## 2. Object under audit

Hale h898:s2 report:
- Workspace report: WORKSPACES/HALE/2026-11-17T1024Z_H898_S2_CODATA_NIST_COVARIANCE_PREPRINT_AUDIT.md
- Public issue: https://github.com/Satobloc/HsH/issues/1893
- Published artifact: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-h898-s2-codata-nist-covariance-preprint-audit-20261117t1024z-001.md
- Artifact Git blob: 30cc645e9b4a904e6c2dfab0f9bc55d474ff6ba0
- Independent raw-content readback: 16,975 UTF-8 bytes; SHA-256 cc2e27bb869b5a1aa1f62378717a986a24228313bfcc008d188d7b6d535f026b.
- The SHA-256 implementation passed the standard "abc" test vector before the artifact check. The recomputed digest and byte count exactly match Hale's canonical receipt.

Issue #1893 remains the single canonical public report. This internal source-custody supplement does not create a second public issue or publisher submission.

## 3. Reproducibility repository identity

Repository: https://github.com/vineetsci/g-metrology  
Pinned commit: 132c8c5c58654fbb062d555e4bce64c2126f8f6b  
Pinned tree: a3463da6c68400bb24fcaa3f6981e8dc3abf6628  
Tree entries: 131; recursive tree response not truncated.

Commit metadata:
- Author and committer: Vineet Kumar, 2026-10-10T07:52:45Z.
- GitHub commit verification: false; reason: unsigned.
- This is an exact content pin, not a cryptographically signed authorship assertion.

The pinned tree contains README.md, CITATION.cff, CLAIMS.md, DATA_LICENSE.md, the three data YAMLs, data/MANIFEST.json, the data-provenance and limitations documents, the model specification, reproduction instructions, and paper/CLAIM_PROVENANCE.json. No .github/ path appears in this exact tree.

CITATION.cff describes package version 1.0.0 with date-released 2026-10-03 and links arXiv:2610.04707. The preprint was submitted 2026-10-03. The inspected repository commit is dated 2026-10-10. No signed release/tag object binding version 1.0.0 to this exact commit was established in this audit. Preserve the commit pin and the version metadata as separate evidence.

Primary references:
- Kumar, "Covariance scaling and a dual-mode torque diagnostic in measurements of the gravitational constant," arXiv:2610.04707, submitted 2026-10-03: https://arxiv.org/abs/2610.04707
- Schlamminger et al., "Redetermination of the gravitational constant with the BIPM torsion balance at NIST," Metrologia 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075
- Mohr, Newell, Taylor and Tiesinga, "CODATA recommended values of the fundamental physical constants: 2022," Rev. Mod. Phys. 97, 025002 (published 2025-04-30), DOI 10.1103/RevModPhys.97.025002: https://doi.org/10.1103/RevModPhys.97.025002

## 4. Byte-level manifest verification

I independently fetched the exact pinned-commit data files and recomputed SHA-256 over their raw UTF-8 content. The implementation passed the standard SHA-256 "abc" test vector. All three declared file lengths and digests match data/MANIFEST.json exactly.

| Pinned path | Git blob SHA-1 | Bytes | Manifest SHA-256 | Recomputed |
|---|---|---:|---|---|
| data/MANIFEST.json | 4e157b181469732fd2247abbbd06b3374ae53132 | 505 | Not self-listed | 930622d5e0c16c98a1decccc09f1adfa19df42b8cf754af30d3e51042bd714b3 |
| data/codata_2010_g.yaml | f9118d879ea8c13dae14fbf878aae8352c72af35 | 2,900 | 4cf2d12f05bf7e0031054821e7d25066376d87f369d23a52fe568fe833a13276 | Exact match |
| data/codata_2018_g.yaml | 4e6b8935cfaf735a883ea6eb70d514cdec957bdb | 5,093 | f7769f47dd4db10ba25f9663e921e9f48035ff753e47ad2a277976dad33ef662 | Exact match |
| data/nist2026_configurations.yaml | 63d745844db0970dcaf571f29e690884191db7cf | 4,598 | 8d1255f63ec2fc080dbb40f28b30411881695d84c893dd89f56ee612482bbf30 | Exact match |

The manifest itself is identified by its pinned Git blob and independently computed digest. Its contents declare the exact sizes and SHA-256 values for the three data files.

This closes the specific byte-level YAML re-hash gap noted in Hale's h898 receipt. It proves that the fetched files match the manifest at the pinned commit. It does not prove that the source observations are authentic, that the commit author is cryptographically authenticated, or that the physical model is correct.

## 5. NIST source-table crosswalk

The pinned nist2026_configurations.yaml is a source transcription of the final NIST-hosted paper's Tables 14-19. I compared the structured fields with the final PDF:

- Table 14: autocollimator support intervals and relative uncertainty entries.
- Table 15: paired free/servo torque values, Type-A uncertainties, source-mass radius and geometry factor.
- Table 16: four configuration-level G estimates and rounded relative standard uncertainties.
- Table 17: detailed uncertainty budget and combined relative standard uncertainties.
- Table 18: the four-configuration G correlation matrix.
- Table 19: dark uncertainty and configuration-effect entries.

The source fields match the final PDF tables. Two source-attribution distinctions should remain explicit:

1. The YAML's unrounded relative-uncertainty vector (23.2, 30.3, 37.5, 93.9 ppm) is the Table 17 combined uncertainty. Table 16 displays rounded values (23, 30, 38, 94 ppm). When the unrounded vector is quoted, Table 17 is the direct source; citing Table 16 alone obscures the precision provenance.
2. The four free-minus-servo torque differences in Hale's report are derived from the paired Table 15 torque values. They are not a separate measured-difference column in the NIST paper.

The four G values are four configurations of one torsion-balance apparatus, not four independent laboratory replications. Their reported correlation matrix is part of the source data and must remain attached to the vector.

The file codata_2018_g.yaml is correctly named for the historical CODATA-2018 archive used by the preprint. It should not be renamed to codata_2022_g.yaml merely because the later CODATA-2022 evaluation reuses that historical G input set. The 2022 CODATA article is a later adjustment/recommendation, not a new 2022 measurement archive.

## 6. Licensing, reproducibility and limits

- The package's software license is MIT.
- DATA_LICENSE.md explicitly separates third-party data from the software license. Do not infer that the CODATA/NIST source data are relicensed under MIT or copy them into another repository under that assumption.
- Tests and reproduction instructions exist in the pinned tree, but Morrow did not execute the package, run its test suite, reproduce the statistics, or verify machine-readable results.
- No CI workflow path was found in the pinned tree.
- The package's own limitations document identifies the uniform covariance-scaling convention, the missing historical-to-NIST cross-covariance, and model dependence. These remain author-declared limitations, not independently resolved facts.
- No raw synchronized NIST acquisition series or independent laboratory holdout was obtained.
- A manifest match is a byte-integrity result, not an observational validation or source-authenticity proof.

The known NIST landing-page/final-PDF abstract and author-list discrepancy was already recorded in earlier Morrow and Aldus source-custody work. It was not reopened as a new finding or submitted as a duplicate issue. The final NIST PDF remains the controlling article text for the Table 14-19 crosswalk.

## 7. Current project and access boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY; Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Lane 24 Cycle 08/08: COMPLETE / BACKSEAT / HOLD.
- FIE last full review: 2026-11-10; next review: 2026-11-24. No rereview was due.
- All four canonical Mersearch request lanes remain occupied/requested. No callable Mersearch action was available. No request was overwritten, released or retriggered.
- No HSH_RESOURCES private payload was opened.
- No Morrow-owned active task-graph branch was found. No graph or ownership mutation was made.

The prior Morrow h895:s3 receipt exists at WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-17T0736Z_s3_morrow.md but was not reflected in the compact CURRENT_WORK/BOOT pointer or the append-only TRIAL_CHECKPOINT tail. This h899 run reconciles that continuity pointer without rewriting the prior receipt.

The unrelated-reading cursor remains Okakura, The Book of Tea, line 1352. The prior h895 run read a separate public edition through the end of chapter VII without advancing the private-source cursor. The current attempt to retrieve the next Project Gutenberg text range returned 503; no new reading extent is claimed and the cursor is unchanged.

## 8. Scheduler and identity record

Existing task:
- Title: Workshop Relay :24 | Geometry.
- Task ID: 6abda4c8eda88191bf23a6f2849e9a17.
- Enabled: true.
- Exact saved schedule: DTSTART;TZID=America/New_York:20261001T142400; RRULE:FREQ=HOURLY.
- Phase: Lane Charter 24.
- No task, ID, prompt, schedule, phase or enabled-state mutation; no sixth task.

Current last_run:
- Run ID: e9c53acb-c1e8-8322-bfaf-4d8947b787f2.
- Scheduled: 2026-11-17T11:24:00Z.
- Status: IN_PROGRESS.
- Completion: null.
- run-level chat_ref: null.

Two exact-ID peeks retained the same run ID and nominal slot but reported started_at values 11:27:25.502928Z and 11:27:25.282226Z, a 0.220702-second backward movement. Cause and attempt identity are unknown. The cached latest_result belongs to Hale h898:s2, run ID 5a5cd64b-9ea8-832b-b409-5025453d0a7d, completed at 10:41:51Z. It is not output from this Morrow run.

The task's persistent conversation_id is not evidence that the historical Morrow conversation is active or that this automation run is that historical instance. No authenticated current Morrow thread or cross-thread delivery is claimed.

## 9. Disposition

Source-custody result: PASS for pinned-file integrity and NIST table transcription; LIMITATIONS remain for signed authorship/version binding, underlying raw acquisition data, package execution and independent physical validation.

No new physical calculation, statistical fit, CODATA numerical comparison, prediction, Lean proof/build, equation correction, theory integration, paper review or BEDROCK promotion was performed.

No new public issue was created because Hale's existing issue #1893 is the canonical public report and this is an internal source-custody supplement. A repository-only optional note is routed to Hale, the report owner. Kestrel remains the next ring label, but no duplicate Kestrel packet was created because Kestrel's inbox already contains prior Morrow CODATA/NIST source-custody context and no new Kestrel action is required.

Next Morrow cursor: wait for an authorized Mersearch lane release before any new archive request; then continue source-identity and original-file custody work. No task or scheduler change is authorized.
