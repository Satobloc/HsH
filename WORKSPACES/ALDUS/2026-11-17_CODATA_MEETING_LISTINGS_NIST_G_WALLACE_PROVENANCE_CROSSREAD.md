# Aldus | CODATA meeting listings, NIST G metrology, and Wallace field-to-synthesis cross-read

**Date:** 2026-11-17  
**Selected worker:** Aldus  
**Next ring label:** Calder

This is a source-grounded Aldus revival within the scheduled execution, not an authenticated continuation or response from the historical Aldus instance.

## 1. Historical remit and thread status

The original HsH raw export is titled `Aldus [AUTO H(s)H Gitter]`, raw Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`. It contains 47 user-role messages; the last user activity is 2026-09-09T02:26:53.510Z.

Two direct user messages on 2026-09-08 establish the original remit. The first asks for broad cross-reading across folders, philosophy, art, non-SAT sources, and perspectives not normally encountered in the main theory lane, while respecting rigor boundaries. The second directly accepts the Aldus identity and explicitly endorses combining information not usually combined.

The more detailed method of reading a collection without forcing a premature theme is assistant-authored proposal, broadly endorsed but not a verbatim Nathan charter. `ALDUS_CHECKIN_2026-09-12.md` is a worker-authored self-report, not a signed Nathan-direct specialist charter. Its later public-provenance and convergence-audit workflow is a useful specialization, not the original whole remit.

A bounded existing-thread lookup and continuity review did not identify a newer usable Aldus conversation. The historical export is an archive snapshot, not a live thread. Current outcome: `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; no separate ChatGPT conversation was created and no historical-agent participation is claimed.

## 2. CODATA 2026 source-state update

The current NIST constants database remains **2022 CODATA, Web Version 9.0**, dated 9 May 2024. NIST's version history explicitly calls these the latest CODATA values available. The 2022 adjustment uses data through 31 December 2022; the review article was published online 16 September 2025. These are three different dates and should not be collapsed. Its G section lists 16 measured values and states that no new relevant G input datum was available for the 2022 adjustment. The NIST 2026 paper is therefore a later candidate input, not part of the 2022 set.

The official CODATA TGFC page says the 2026 adjustment closes on **31 December 2026**, with results expected in **early 2027**.

A source-version discrepancy has become more concrete:

- The CODATA TGFC public page still says the 2026 meeting *will be held* at BIPM in September 2026.
- The BIPM hosting portal lists a 2026 CODATA-TGFC meeting for **5-6 November 2026**, but still labels it **Upcoming Meeting** when inspected on 17 November.
- The BIPM event page carries the same 5-6 November date and exposes a working-documents area that requires login.
- Neither page supplies public minutes or an outcome, and the BIPM portal's stale `Upcoming` label does not establish that the meeting actually occurred.

The relationship between the September CODATA program entry and the November BIPM scheduled listing is unresolved. The evidence does not establish whether November was a rescheduled meeting, an additional meeting, or a stale/unreconciled listing. As of 17 November, meeting occurrence and outcome remain unverified.

Sources:
- [NIST constants version history](https://physics.nist.gov/cuu/Reference/versioncon.shtml)
- [CODATA Task Group on Fundamental Physical Constants](https://codata.org/initiatives/data-science-and-stewardship/fundamental-physical-constants/)
- [BIPM CODATA-TGFC meeting portal](https://www.bipm.org/en/hosting/codata-tgfc)
- [BIPM 2026 CODATA-TGFC event listing, 5-6 November](https://www.bipm.org/en/committees/ot/n/a/wg/codata-tgfc/2026-11-05)

## 3. NIST 2026 gravitational-constant paper: final-PDF authority

Primary article: Stephan Schlamminger et al., *Redetermination of the gravitational constant with the BIPM torsion balance at NIST*, **Metrologia 63 (2026) 025012**, published 16 April 2026, DOI `10.1088/1681-7575/ae570f`.

The final 31-page PDF lists nine authors, including Antonio Possolo, and reports:

\[
G=(6.67387\pm0.00038)\times10^{-11}\ {\rm m^3\,kg^{-1}\,s^{-2}},
\]

with relative standard uncertainty \(5.7\times10^{-5}\).

The NIST publication landing page is inconsistent: it lists eight authors, omitting Possolo, and displays an earlier abstract value,

\[
G=(6.67366\pm0.00020)\times10^{-11},
\]

with relative standard uncertainty \(3.0\times10^{-6}\). The final PDF and NIST news release support the final-PDF value, not the landing-page abstract. Numerical extraction must use the final PDF and DOI record, not the inconsistent landing-page abstract.

The NIST news chronology frames the work as an attempt at independent reproduction and says the team used a blinded offset applied to some measured weights; the hidden number was unsealed at 3 p.m. on 11 July 2024. The paper was published on 16 April 2026. The paper itself qualifies the determination as not entirely independent. The blind-offset reveal is a distinct analysis-unblinding event, not automatically the same event type as a holdout-unblinding protocol.

The article calls the work a replication, but its body explicitly qualifies independence: the BIPM torsion balance and geometry were reused with modifications, and C. C. Speake contributed to both the BIPM and NIST efforts, visiting NIST and remaining involved through regular remote meetings over nearly a decade. The article says the determination is not entirely independent. It is therefore not a clean independent holdout from the earlier BIPM measurement.

### Measurement map and evaluation layers

The paper gives a source-defined forward measurement equation:

\[
N(\Delta\phi)=G\,\frac{8m_s m_t}{R_s}\,\Gamma(\Delta\phi,\eta),
\]

where \(\Gamma\) is a dimensionless mass-integration factor determined by the apparatus geometry. For the source-mass extrema, with \(\Gamma_{\min}\approx-\Gamma_{\max}\), the paper obtains

\[
G\approx\frac{\Delta N_{\max}R_s}{16m_s m_t\Gamma_{\max}}.
\]

This is a concrete geometry-to-observable-to-parameter map. The paper does not replace the finite cylinders with point masses: its point-mass approximation for the mass-integration factor differs by 5.9% from numerical integration over the cylinders. The numerical \(\Gamma_{\max}(\eta,a_t,b_t,h_t,b_s,h_s,\Delta z,\Delta r)\) depends on eight geometric parameters, and the paper supplies a sensitivity/uncertainty budget for them. Reverse reconstruction from a reported value of \(G\) alone is underdetermined: the mass distribution, radii, angular configuration, calibration, and torque readout are needed. This is a useful measured-geometry control, not a worldtube or finite-core analogue.

The experiment distinguishes free-deflection and electrostatic-servo readouts and four configurations: copper/free, copper/servo, sapphire/free, sapphire/servo. Its final consensus model uses configuration effects, configuration-specific dark uncertainties, and a covariance matrix. The prior for the consensus mean is Gaussian, centered on the 2022 CODATA recommended value, with standard deviation \(9\times10^{-15}\) m³ kg⁻¹ s⁻². The four configuration-specific dark-uncertainty scales are assigned half-Cauchy priors whose medians reflect an expert reliability ranking. Consequently, the final posterior consensus is not independent of CODATA 2022, even though the underlying configuration measurements are experimental inputs.

Keep these categories separate:

1. **Measured:** configuration-specific torque/readout observations.
2. **Calibrated/modelled:** apparatus geometry, mass integration, angular calibration, and uncertainty budgets.
3. **Evaluated:** Bayesian consensus with configuration effects, covariance, dark uncertainty, and a CODATA-centered prior.
4. **Standard reference:** CODATA 2022, Version 9.0.
5. **Possible future input:** the paper's 16 April 2026 publication date precedes the 2026 adjustment cutoff, so it is date-eligible for consideration. Actual inclusion in the 2026 adjustment is not established.

No raw run-level data or complete covariance package was retrieved in this run. No new numerical comparison, fit, uncertainty propagation, or physical calculation was performed.

Sources:
- [Final NIST/BIPM paper PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075)
- [DOI record](https://doi.org/10.1088/1681-7575/ae570f)
- [NIST publication landing page](https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist)
- [NIST news release](https://www.nist.gov/news-events/news/2026/04/nist-weighs-mystery-gravitational-constant)

## 4. CODATA 2022 adjustment: the recommended value is an evaluated product

The primary 2022 review reports 133 input data and 79 adjusted constants, giving 54 degrees of freedom. The initial least-squares adjustment, before uncertainty expansion, had \(\chi^2=109.6\); eight inputs accounted for about 70% of that value. Expansion factors of 1.7 and 2.5 were applied to specified input groups, producing a final \(\chi^2=44.2\) for 54 degrees of freedom.

This is not a defect to hide or a reason to dismiss the adjustment. It is part of the evaluation's provenance. A recommended constant is the output of a model-dependent, correlation-aware synthesis of measurements and theory, with explicit treatment of inconsistencies and uncertainty expansion. It is not a direct measurement and should not be used as though it were statistically independent of every later result that adopts it as a prior.

Source: [Mohr, Newell, Taylor and Tiesinga, CODATA recommended values of the fundamental physical constants: 2022](https://physics.nist.gov/cuu/pdf/JPCRD2022CODATA.pdf), especially the adjustment overview and final least-squares discussion.

## 5. Lateral source read: Wallace's field-to-publication chain

A bounded non-SAT reading was completed from Alfred Russel Wallace, *The Malay Archipelago*, Volume I (1869), Project Gutenberg eBook 2530:

- Preface, lines 67-112.
- Chapter I, lines 113-178.
- The preface and Chapter I were inspected directly in the public text; no later chapters were read.
- Next reading cursor: line 179.

The preface distinguishes several stages that are easy to collapse:

- field journeys and observations during the 1854-1862 expedition;
- collection and transport of specimens;
- later taxonomic work by other naturalists;
- Wallace's later synthesis and editorial arrangement;
- publication in 1869.

Wallace says that strict chronological arrangement would confuse readers, so he organized the book geographically, zoologically, and ethnologically. He reports returning to England in spring 1862, delaying the writing for six years while sorting collections and working out variation and geographical distribution, and records 14,000 miles, 60-70 journeys, and 125,660 specimens. He says most narrative/descriptive passages were written on the spot, while much of the taxonomy and synthesis followed later, including work by other naturalists. He credits George Windsor Earl with first indicating the Indo-Australian division and distinguishes that earlier suggestion from his own more detailed observations. In Chapter I, Wallace also uses sea depth as a proxy for separation time and proposes volcanic subsidence as a causal explanation; those are historical 19th-century inferences, not current geological findings.

This is a methodological comparator, not evidence about physics. It demonstrates why event chronology, collection, classification, editorial order, and publication order need separate provenance fields. The order in which a reader encounters a claim is not necessarily the order in which its observations occurred or its supporting material was processed.

Source: [Project Gutenberg, The Malay Archipelago, Volume I](https://www.gutenberg.org/files/2530/2530-h/2530-h.htm).

## 6. RMS cross-read and temporal-provenance implication

The SAT archive's `RMS (Radical Meta-Skepticism).txt` overview (blob `5f1ff79903f524242c0e2ed150f89e317780b6e9`, 126 lines) and separate `RMS_CRITIQUE_AND_RESPONSE.txt` (blob `4a87c7f47f7b024598ba64d68f1ec248407947d1`, 86 lines) were read in full as archival conceptual material. The overview emphasizes evidential indistinguishability; the separate critique warns that observational equivalence does not automatically entail epistemic equivalence. Their sentence-level authorship was not independently established in this run, so neither is promoted as Nathan Direct.

The useful methodological restraint is to preserve distinct evidence paths rather than collapse them because they appear similar. Here, the BIPM and CODATA meeting pages are not interchangeable records; the NIST landing-page abstract and final PDF are not interchangeable versions; and Wallace's field observations are not identical to his later classification or editorial synthesis.

### Existing Lean work reused, not overstated

[Aldus PR #1860](https://github.com/Satobloc/HsH/pull/1860), exact head `1dc0f79901e18ff7df609db6ecf723c7c80afa70`, already has an exact-head Lean 4.34.0 build: Actions run #43973867276, 8,951 jobs, success. The `AldusTemporalProvenance.lean` module built; its recorded output showed no `sorryAx` or custom axioms. Three non-fatal warnings were reported. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. PR #1860 remains OPEN / DRAFT / UNMERGED. Its existing [report issue #1861](https://github.com/Satobloc/HsH/issues/1861) is PUBLISHED_VERIFIED.

The current module distinguishes source-message/file creation, repository ingestion, public release/mention, analyst access, context inclusion, prediction sealing, holdout unblinding, and scheduler/audit events. The NIST example exposes a semantic distinction: its July 2024 blind-offset reveal is an analysis-unblinding event, not necessarily a P2 holdout-unblinding event. The CODATA pages expose another: a scheduled meeting listing is not evidence that the meeting occurred. The cross-read suggests a possible future metrology-lifecycle extension with explicit events for measurement acquisition, calibration, analysis unblinding, analysis completion, uncertainty evaluation, adjustment inclusion, adjustment publication, meeting scheduled, and meeting held/verified. Wallace's narrative adds a possible distinction between field event chronology, specimen classification, editorial arrangement, and source publication.

These are extension candidates only. The NIST equation provides a definite algebraic inversion, but no new Lean theorem or build was dispatched because the Lane 24 Cycle 08/08 interlock remains in force and the current task is a bounded source-provenance cross-read. The existing temporal-provenance build does not prove the NIST measurement equation, and neither formal compilation nor the article's fit/evaluation establishes an H(s)H physical correspondence. No schema change or PR amendment was made.

## 7. Project interlocks and tooling

- [P0 Code Grurple issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN / ACTIVE. The latest retrieved discovery snapshot is timestamped 2026-11-17T00:12:41Z; it still gives both protected Paper A/B manuscripts generic reader targets. That snapshot predates the current main head and is not treated as a current branch inventory. No authenticated live reader-route observation or positive P0 standdown was found.
- Lane 24 Cycle 08/08 remains complete and BACKSEAT / HOLD. No Cycle 09 was opened.
- No physical calculation, CODATA numerical comparison, P2 selection, new Lean build, manuscript advancement, or theory promotion occurred.
- The Mersearch-first preflight found no Mersearch action exposed in this runtime. All four canonical Mersearch request files remain `requested`; none was overwritten, released, or retriggered. GitHub source search and direct source reading were used only as a bounded fallback, not represented as Mersearch.
- Existing Math Hopper #578, PR #991, Whirligig, and Lean PR #1860 were checked before proposing tooling. No new tool, fork, dependency, subscription, or expense was introduced.
- HsH main was `c0e66ba9a6d7dfd5eced23e3d0135ef048d88fa8` at preflight; the SAT archive main snapshot was `4b616b6113ecd33d216600e4fa5fd1e783d48653`. HsH and SAT archive root READMEs were read. HSH_RESOURCES root README blob `1433b65480a04b1bd4ed64e4b234c3ecf1b576f0` was read; its private research payload was not opened.
- FIE rereview remains due 2026-11-24; no full rereview was due in this run.
- Lateral-reading record: *The Malay Archipelago*, Volume I, preface 67-112 and Chapter I 113-178; next cursor 179.

## 8. Continuity and successor

The latest Aldus workspace return point before this run was the 16 November source and continuity update. No newer Aldus-addressed predecessor handoff was found. The current Aldus raw export remains historical, and no authenticated current Aldus ChatGPT thread was identified.

The successor ring label is Calder. A bounded lookup found no authenticated current Calder ChatGPT thread for the PWH/WH-02 owner, distinct from the separate Calder Foundational Covariance / Global Architecture history. The existing `WORKSPACES/CALDER/INBOX.md` is the repository delivery route. Any packet is optional context only, with no task, deadline, review request, or response obligation; repository inbox delivery is not ChatGPT-thread delivery or proof of consumption.

## 9. Automation integrity

The existing Workshop Relay automation remained enabled and unchanged. No task identity, recurrence, prompt, phase, or cadence was modified. No additional task was created. The scheduler's final observation did not independently establish a completed worker thread or cross-thread delivery.

---

**Disposition:** `ALDUS_SOURCE_GROUNDED_REVIVAL / ORIGINAL_CROSS_READING_REMIT_RECOVERED / CODATA_2026_MEETING_LISTING_CONFLICT_OCCURRENCE_UNVERIFIED / NIST_G_LANDING_PAGE_INCONSISTENT_WITH_FINAL_PDF / CODATA_2022_V9_CURRENT / NIST_2026_G_DATE_ELIGIBLE_NOT_CONFIRMED_INCLUDED / WALLACE_LATERAL_READ_COMPLETE / EXISTING_TEMPORAL_PROVENANCE_LEAN_BUILD_REUSED / NO_NEW_LEAN_OR_PHYSICAL_CALCULATION / P0_ACTIVE / LANE24_CYCLE08_HOLD / FOUR_MERSEARCH_LANES_OCCUPIED / CALDER_REPO_HANDOFF_ONLY / AUTOMATION_UNCHANGED`.
