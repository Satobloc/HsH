# Meridian h869:s2 — Amendment 02: report digest correction and independent recalculation

> **Digest supersession:** The SHA-256 value `e5777c655ad7ffa7262c605c8532bf12d99e171175672dbaf710753eae9131e7` in Section 1 was itself an incorrect recomputation. The correct report SHA-256 is `4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca`. See [Amendment 03](2026-11-16T0524Z_s2_meridian_AMENDMENT_03_SHA256_IMPLEMENTATION_CORRECTION.md). The independent geometric/source findings below remain unchanged.

This amendment supersedes the report-digest and publication-validation statements in Amendment 01. It does not alter the original research report or the rejected intake issue.

## 1. Exact report and publisher payload identity

- Canonical intake: [issue #1826](https://github.com/Satobloc/HsH/issues/1826)
- Submission ID: `meridian-h869-s2-lane24-empirical-readout-20261116t0524z-001`
- Internal report: `WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md`
- Report Git blob: `85ca50583a80c88d8faed9767ba0534f3893283f`
- Issue `content` and workspace report are exact UTF-8 string matches (18,925 characters).
- **Correct SHA-256 of both exact contents:** `e5777c655ad7ffa7262c605c8532bf12d99e171175672dbaf710753eae9131e7`
- The issue payload declared `1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f`, which does **not** match the content. Amendment 01 and the canonical receipt initially repeated that incorrect digest. This amendment supersedes those digest claims.

## 2. Publisher rejection: two independently identified defects

The publisher comment on #1826 is `REJECTED: invalid schema`. The submitted schema was uppercase `HSH-PUBLISH-V1`; the live validator requires the exact lowercase string `hsh-publish-v1`.

The validator source is `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`:
- line 37 checks the exact four-key payload;
- line 39 checks `p["schema"] != "hsh-publish-v1"`;
- line 40 raises `invalid schema`;
- line 47 computes SHA-256 over UTF-8 content;
- line 48 compares the declared digest.

Because schema validation precedes digest validation, the bot reported the schema defect first. The independently verified checksum mismatch is a second defect that would also have prevented publication after a schema correction.

Successful controls #1812 and #1815 use lowercase `hsh-publish-v1` and the same four keys. Both issue-event Actions runs for #1826 (#43812792961 and #43812797774) completed at the workflow level, but the publisher validator rejected the intake. Neither run created a canonical publication artifact. The rejection is not a successful publication.

**Final publication status: PUBLISHER_REJECTED / NOT_PUBLISHED.** No issue-body edit, reopen, retry, duplicate issue, direct write to `PUBLISHED_SUBMISSIONS`, or publisher bypass was performed. Issue #1826 remains the sole audit record. Amendment 01's claim that the digest was valid and that schema case was the sole defect is superseded.

## 3. Independent reconstruction from the published He-II vortex-ring coordinates

Primary source: Tang, Y. et al., “Imaging quantized vortex rings in superfluid helium to evaluate quantum dissipation,” *Nature Communications* 14, 2941 (2023), DOI [10.1038/s41467-023-38787-w](https://doi.org/10.1038/s41467-023-38787-w).

The source paper and its six-page Supplementary Information were inspected. Supplementary Table 1 (PDF page 6) supplies nine already-derived 3D particle coordinates in mm and per-coordinate uncertainties in mm. The paper's Methods explain that the x-z ellipse is fitted first and the y coordinates are reconstructed using the fitted projection angle. These are not independently measured 3D camera coordinates or raw tomography.

A separate script was added and read back exactly:
- `WORKSPACES/MERIDIAN/reproduce_h869_tang2023_nine_particle_circle_fit.py`
- Git blob: `8ef3f7bc1b4d5155baef841d07127e6a88040753`
- Commit: `efb08cdbf9bc92a9847b1c6b58b978006ce853d6`
- Python 3.13.5; NumPy 2.3.5; SciPy 1.17.0.
- Algorithm: PCA/SVD best-fit plane, orthogonal projection, nonlinear least-squares circle fit, then 20,000 Monte Carlo draws using the published per-axis standard uncertainties as independent Gaussian errors (seed 20261116).

Independent run results:
- Circle radius: **310.0851 μm**.
- RMS radial residual: **0.9391 μm**.
- RMS out-of-plane residual: **0.2342 μm**.
- Monte Carlo mean: **310.1117 μm**; sample SD: **1.3089 μm**.
- 2.5%, median, 97.5% quantiles: **307.5558, 310.1188, 312.6891 μm**.

The reconstructed radius is close to the paper's approximately 312 μm description and the sensitivity interval contains that rounded value. The Monte Carlo is not a full uncertainty budget because no full coordinate covariance is supplied. The source-data XLSX was identified on the article page but the binary download returned an unsupported-content-type response; no workbook bytes, raw movie or author code were retrieved.

For the separate two-particle event, the paper reports a fitted initial ring radius (R(0)=140.8\,\mu\mathrm{m}) and measured half-separation (d_p(0)/2=140.6\,\mu\mathrm{m}), giving (c_1\approx0.99858). It bounds (\tan\theta\leq0.18) from brightness variation and the measured laser-sheet profile. The fitted radius and projected separation remain distinct quantities. The paper's S2W-versus-2W comparison uses these same events, not a blind holdout.

## 4. Cross-source tracer-density unit discrepancy

Tang et al. (2023), Results, prints the solid D2 tracer density as **202.8 g/cm³** and cites Xu & Van Sciver (2008), “Density effect of solidified hydrogen isotope particles on particle image velocimetry measurements of He II flow,” *AIP Conference Proceedings* 985, 191–198.

Stasiak et al. (2025), Materials and Methods, prints **202.8 kg/m³** for D2 tracer particles and cites the same Xu–Van Sciver 2008 paper (reference 37). The values differ by a factor of 1,000: 202.8 kg/m³ equals 0.2028 g/cm³, whereas 202.8 g/cm³ equals 202,800 kg/m³.

This is a strong source-level indication of a unit transcription error in Tang et al.; it is not permission to silently correct the paper. The original 2008 source and Tang's force-calculation code were not retrieved. Accordingly, the report's particle drag/gravity ratios are not independently reproduced and must not be reused numerically until the source discrepancy is resolved.

## 5. Independent reconnection comparator and limits

Stasiak, P. Z. et al., “Experimental and theoretical evidence of universality in superfluid vortex reconnections,” *PNAS* 122(21), e2426064122 (2025), DOI [10.1073/pnas.2426064122](https://doi.org/10.1073/pnas.2426064122).

The paper reports two experimental reconnections with both approach and separation data (1.65 K and 2.0 K), plus six post-reconnection-only observations. It reports approach prefactors (A^-\approx0.4\text{–}0.6) and post-reconnection-only (A^+\) values about 1.2–4.2. The approximately 5% normal-fluid energy jump is a **simulation result**, not a direct measurement. The associated dataset is identified as [10.25405/data.ncl.28727000.v1](https://doi.org/10.25405/data.ncl.28727000.v1); its data files were not retrieved.

Both papers cite Xu & Van Sciver (2008) for the D2 density. The cross-source comparison strengthens the unit-discrepancy finding but does not replace retrieval of that original source.

## 6. Elastic-contact comparator: descriptive only

Kozyreff and Seron, “Dynamical elastic contact of a rope with the ground,” *Physical Review Research* 3, L022026 (2021), DOI [10.1103/PhysRevResearch.3.L022026](https://doi.org/10.1103/PhysRevResearch.3.L022026), studies a driven rope in contact with a ground plane analytically, numerically and experimentally. The paper describes resonances, grazing bifurcations, a weak-bending limit in which the fundamental frequency is tension-independent, and bistability at larger bending stiffness/geometric nonlinearity.

The report's seven-frequency descriptive check gives mean 1.1957 Hz, sample SD 0.0190 Hz, range 1.17–1.23 Hz. With (g=9.81\,\mathrm{m/s^2}) and (Z_0=0.81\,\mathrm{m}), the quoted comparison formula (f_1=\sqrt{g/(8Z_0)}) gives 1.2304 Hz; the observed mean is 2.82% lower. No uncertainty for (Z_0) or full frequency covariance is supplied in this check. It is not a fitted physical prediction or H(s)H validation. This elastic-contact study is only a first-blush mechanical comparator; no rope universality or physical equivalence is asserted.

## 7. Formalization, mapping and project disposition

Existing Lean work was checked rather than duplicated:
- Nadir PR #1189 exact head `8a6a0c288b0091a19b604ab96f94fec05adcc40e`, Lean 4.34.0 verification run #43783028748, job #133024336601, completed SUCCESS. Its imported modules include projection/coarse-graining factorization and witness-carrying composition. The separate conversation-JSON workflow on the same head failed; this is not an all-checks green result.
- Kestrel PR #873 exact-head Lean run #43202552666 remains a successful historical conditional build.
- Calder PR #1515 exact-head Lean run #42722996625 remains a successful historical conditional build; its later conversation-JSON workflow failed.

No new theorem, local Lean run, PR, physical H(s)H map, fit, prediction or CODATA comparison was produced. These existing Lean results prove only their formalized conditional statements; they do not validate the source-to-model translation or physical premises.

The He-II vortex line sweeps a spacetime trace, but a finite-core worldtube, normal-fluid response map, H(s)H forward map, reverse reconstruction and observable composition have not been defined from the source data. The vortex core is not spatially resolved by the approximately 1.1 μm tracer particles; the source describes the core scale as approximately 1 Å. The reconnection study supplies a separate measured comparator, not an H(s)H equivalence.

P2 remains **HOLD**. No candidate is selected, no uncertainty matrix is changed, and no theory is promoted. The one-run Lane 24 overlay does not replace Meridian's standing Code Grurple P0 / Paper A-B presentation QA assignment.

## 8. P0 noninterference check

At HsH main `f5a0bb22e4b5794b7a5b22ebc768a290ad803502`, all eight protected P0 source/control blobs were re-fetched and matched their established fingerprints exactly: Paper A, Paper B, Papers feed, Presentation Gate, Reader Routing Registry, Presentation Contract, generated PDF-series index, and Conversation Viewer/Whirligig Pages workflow. Issue #1747 remains open. This is repository source-binding evidence only; no live reader route or Sites rendering was observed.

No manuscript, site, PDF, presentation policy, scheduler, task graph or other worker assignment was changed.


## 8. Historical source-identity correction

A fresh Git Data blob retrieval and parse of the two Meridian raw exports found a source-ID error in Section 1 of the original report.

**Meridian Free Build**
- Correct conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`
- Correct raw blob: `7af1561b321f4d9364da5eb111df689efc652827`
- Title: `Meridian Free Build`
- Mapping nodes: 2,500; direct user-role nodes on current ancestry: 75.
- Verified selected direct message: `97d301cb-5174-4861-a273-ac4cc0b60d8b`, 2026-10-09T10:38:10.722Z. It specifies multiple admissible answers and a “least-wild” route preference for Whirligig. Other verified current-ancestry user messages include `44e9df22-a6ac-49ca-92ac-c74c8f137310` (2026-10-09T01:32:23.763Z), `3c657387-b80b-4982-a61a-8e6d8568b8d1` (01:50:55.112Z), and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` (07:40:38.859Z).
- The original report paired this blob with conversation ID `6ab339d2-8fb4-83ea-b728-c8001a034371` and cited 2026-10-09T18:44:26Z. That ID and timestamp are **not** the identity/time of this raw Meridian Free Build export. The cited timestamp was not found in its current-ancestry user-role messages. Use the correct CID and the verified 10:38:10Z message; do not attribute the old ID/time to Meridian Free Build.

**Meridian [HsH] Michelstein-on-Meinorly**
- Conversation ID: `6a9aa91b-11f4-83ea-80a1-4d502522e441`
- Raw blob: `d21e251df093013903cc19789ded562f83b6e6ea`
- Mapping nodes: 343; direct user-role nodes on current ancestry: 52.
- Verified selected user messages include `054d1aea-cf67-4154-93c8-e302dc3ce1ea` (2026-09-08T02:45:59.163Z), `39299849-e2a4-4b63-88a0-5612c700cc1a` (03:11:46.436Z), and `f6a2377c-8873-41ee-9107-41aeeb0d2589` (09:51:01.238Z). These support the graticule/solver remit. The report's separate 2026-09-09 timestamps are not supported by this 343-node raw export; they are not retained as source-attributed evidence here.

The historical remit is reconstructed from direct user-role ancestry in these two raw conversations. No standalone signed Nathan-authored Meridian specialist charter was recovered. The assistant-authored role label remains a navigation aid, not Nathan Direct. The one-run Lane 24 overlay comes from the current instruction and does not replace Meridian's standing Code Grurple P0 / Paper A-B presentation QA assignment.
