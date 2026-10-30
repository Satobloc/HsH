# Hale external-source and GW170817 calibration audit

**Nominal slot:** 2026-10-30T09:12Z  
**Run key:** `REVROT3-19-20261011:465:s1`  
**Selection:** h=465; seq=5h+1=2326; 2326 mod 19 = 8; Hale selected.  
**Next:** ring index 9, Elias Kern.  
**Actual run start:** 2026-10-30T09:15:27Z (late start; no schedule change).  
**Identity:** deterministic routing label only. The historical Hale thread remains unauthenticated; this is a source-grounded current-assistant execution, not a historical Hale first-blush or acknowledgment.

## 1. Intake and remit

Read current BEDROCK in full (blob `38a5b8f4...`, 88,070 characters / 568 lines), Steering Charter 2026-10-26 (blob `5f426338...`), Three Paper Campaign (blob `9eb28e89...`), NEW_INSTANCE_START_HERE, Revival Rotation V4 not-found-revival contract, thread-routing and thread-first rules, scheduler authority, workflow orientation, task branch graph, Code Grurple roster/presentation gate, Hale reentry packet and inbox, prior Hale receipts, and Elias's README/CURRENT_WORK before preparing the handoff.

Hale's reentry packet (blob `2840500bec1873fc634e564f83d7eda7d1da74f0`) preserves an externally exposed literature-scanning/statistical-calibration vantage. It explicitly does not establish a blind-review status or a current historical thread. This run is therefore non-blind external source QA, not a blind theory review.

The immediate 2026-10-30 09:00Z Calder predecessor was still `in_progress` at initial inspection; no matching 09:00 receipt/handoff was available. The latest verified Calder→Hale packet available at start was the 05:12Z handoff (with 05:34Z CI addendum), which was read. Missing immediate handoff is a continuity gap, not evidence of nonparticipation.

## 2. Nathan-direct geometry versus later equations

The 2024 DIMENSIONAL GRAVITY raw export was fetched by exact path and SHA:
- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
- blob SHA `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- role-verified user messages `aaa28a9a-dcfc-4835-8359-e7da7b36911c` and `aaa24791-27b2-4b58-8f1a-19ee7e30d650).

The source describes a 4D string/filament history and a moving 3D time surface / present intersection. It does not derive a neutron-star Love-number relation or the GW tidal-deformability equations.

The September Ravel source genealogy, as recovered in Calder's source-fidelity addendum and the role-tagged verified batches, contains Nathan-direct geometric descriptions of a Kerr-cross-section worldtube, filament/timesheet mutual accommodation, and a possible induction-current connection within the timesheet thickness. The latter is explicitly a possible readout, not a defined electromagnetic current. No normalization, conservation law, Love-number coupling, or map to λ/Σ is present in the recovered Nathan-direct statements.

Consequently, the external GW170817 radius relations below are GR/neutron-star literature comparators. They are not SAT-derived equations, and no H(s)H worldtube-to-Love-number mapping is claimed.

## 3. Primary-source correction: De et al. versus Raithel et al.

The legacy relation
`Rhat ≈ R1.4 ≈ (11.2 ± 0.2) (Mc/Msun) (Lambdatilde/800)^(1/6) km`
is **De et al. (2018), Phys. Rev. Lett. 121, 091102, Eq. (6)**, not Raithel et al. (2018).

De et al. derive Eq. (5), `Lambdatilde = a' (Rhat c^2/(G Mc))^6`, with `a' = 0.0042 ± 0.0004`, from `Lambda ≈ a beta^-6` and a common-radius/common-EOS assumption. Their text states the approximation applies for `q ≥ 0.6`, valid for component masses `1 Msun ≤ m ≤ 1.6 Msun` for both stars. Under the common-EOS construction, `Lambda1/Lambda2 = q^6`. Eq. (6) is the inversion giving the 11.2 ± 0.2 km coefficient. The paper says the quoted errors arise from uncertainties in `a` and `q`, totaling 2%.

The De et al. erratum retracts the claim that GW data strongly favor the common-EOS model and corrects the Bayes factors. It does **not** retract the conditional `q^6` relation or Eq. (5)/(6) radius construction. Those remain model-conditional assumptions/approximations, not an empirically selected EOS law.

Raithel, Özel & Psaltis (2018), arXiv:1803.07687, is a different construction:
- Eq. (5) is the Yagi–Yunes compactness relation, stated accurate to within 6.5% over a wide range of EOS.
- Eq. (6) is the Newtonian single-star tidal-deformability expression for an n=1 polytrope.
- Eqs. (9)–(12) give a quasi-Newtonian binary common-radius expansion around `q=1`, with `O((1-q)^3)` omitted. The paper displays the expansion for `q ∈ (0.7,1.0)`; its Table 1 tabulates the second-order correction at `q=0.7`.

Thus the earlier PR #1061 attribution conflated two papers: the **11.2 ± 0.2**, **q ≥ 0.6**, and **2%** statements belong to De et al.; Raithel's **6.5%** belongs to the Yagi–Yunes compactness relation, not to a 2% radius error. The low-spin GW170817 q interval reaches only to 0.73 and is within both stated domains; the high-spin interval reaches 0.53 and extends below both the De `q ≥ 0.6` and Raithel `q ≈ 0.7–1` domains.

## 4. Real-system inputs and independent Planck-native calculation

System: GW170817, binary-neutron-star inspiral observed 2017-08-17.

Published inputs:
- Source-frame chirp mass `Mc = 1.186 Msun`, sensitivity endpoints `1.185–1.187 Msun` (LIGO/Virgo PRX 9, 011001, Table II).
- Low-spin PhenomPNRT `Lambdatilde = 70–720` as a 90% HPD interval; 720 is an HPD upper endpoint, not a Gaussian measurement.
- Low-spin q lower endpoint 0.73; high-spin q lower endpoint 0.53.
- Waveform-family low-spin upper endpoints: TaylorF2 830, SEOBNRT 690, PhenomDNRT 730, PhenomPNRT 720. High-spin upper limits: TaylorF2 730, SEOBNRT 630, PhenomDNRT 640, PhenomPNRT 630.

I independently reproduced the Raithel Eq. (10) inversion in Planck units (c=G=ħ=1), using CODATA-2022 G and ħ, exact c, and IAU nominal GM_sun for the external solar-mass conversion. The root solver used the published Mc and Σ upper endpoint; km appears only as the final external readout.

Results:
- Raithel Eq. (10), q=1: **12.848376851 km**.
- Raithel Eq. (9) second-order boundary sensitivity at q=0.73: **12.823293533 km**, a −0.025083318 km shift. This omits the stated O((1-q)^3) term and is not a posterior calculation.
- De et al. Eq. (6), same Mc and Σ endpoint: **13.051981913 km**.
- Central-value difference De minus Raithel Eq. (10): **0.203605062 km (1.5847%)**. Propagating the De Eq. (6) ±0.2 coefficient gives **0.233071106 km** at these inputs; the central difference is **0.874** of that quoted coefficient-derived uncertainty. This is not a significant tension and is not an independent measurement; the two formulae are distinct conditional approximations to the same event.
- Raithel Table 1 reproduction at Mc=1.188 Msun: maximum relative error **0.154372%**. At R=13 km, q=0.7, the reproduced second-order correction is **1.404927%**, matching the table's rounded 1.4%.
- Low-spin waveform-family radius endpoint spread: **0.390609 km** at q=1, **0.393326 km** at q=0.73 second order. The chirp-mass endpoint sensitivity at q=1 is **0.021667 km**. The waveform-family spread is about **18.0 times** the chirp-mass endpoint width. This is a model-family sensitivity envelope, not a combined credible interval or independent replicate.
- Planck-native and geometric-unit cross-checks agree to displayed precision in the independently executed calculation.

The Calder source script was independently read at PR #1061 head `f6af32da569cb53188978c4a70227c6935d996a2`:
- script blob `ad4effe13b328dce009bfc41fbe1733d9e7a6513`
- JSON blob `81a43e7acf1c88a201b10a1114892b933acb497e`
- runlog blob `3aa8f8a8e2f6184c418acd6c5c68c529625439ae`.
The independent outputs above reproduce the reported Raithel values. The De-source correction supersedes the script's former label `legacy_unverified_sixth_root_fit_comparison`; the numerical comparison remains valid, but the provenance/status label is obsolete.

## 5. Posterior-sample availability and hard retrieval boundary

The official DCC page is `LIGO-P1800061-v11` (PRX 9, 011001). It lists:
- `low_spin_PhenomPNRT_posterior_samples.dat.gz` (423.1 kB)
- `high_spin_PhenomPNRT_posterior_samples.dat.gz` (971.3 kB)
- `README.md` (1.4 kB)
- `Data Release Tutorial.ipynb` (2.7 MB).

The web page confirms filenames/version/sizes, but the binary downloads and README could not be retrieved into the execution container: both the download tool and Python URL retrieval failed. No file bytes or checksums were obtained. Therefore **no posterior-sample parsing, sample-level statistics, or checksum claim is made**. The next valid sample-level step requires retrieval of the exact v11 files plus their metadata/checksums before analysis.

## 6. PR, publication, and Lean status

PR #1061 remains draft/open/stacked/unmerged; no PR body, branch, code, or merge edit was made in this pass.

The current PR body still contains the old attribution of the 11.2 formula/q threshold to Raithel. The published issue #1065 artifact also remains unchanged. Existing issue comment #6515742392 corrected the Raithel Eq. (6)/q-domain distinction but still said the legacy 11.2 source was not recovered and withdrew the 2% statement globally. Existing PR comment #6515834557 says the correction is already in the PR body; direct current-body readback contradicts that statement. Additive comments on #1065 and #1061 are used to correct the public record without rewriting the historical artifact or editing Calder's PR.

PR #1061 exact head `f6af32da569cb53188978c4a70227c6935d996a2` is included in successful merge-ref workflow #41008871063, job #123909959652, merge ref `96b75a31abfbb83da295e41bc8027f5cc51eeedf`. Actual logs show Lean 4.34.0 / Lake 5.0.0 and 8,957 build jobs. Four incidence, nine tidal-map, and ten posterior-check theorem targets compiled. The theorem-specific outputs show no `sorryAx`; the separate `test`, `lint`, and `axiom-audit` steps were skipped. Earlier pre-repair run #41008458593 failed on unknown `and_or_left_comm` and `and_or_right_comm`; that failure remains preserved. Lean verifies the encoded conditional statements, not the physical model or source correctness.

No new Lean module was needed for this literature/provenance correction. No H(s)H prediction or theory promotion follows.

## 7. Mersearch, tools, and control boundaries

All four shared Mersearch request lanes were already occupied/requested in the latest verified intake. No lane was overwritten or retriggered. The existing Math Hopper, Lean, GitHub retrieval, and current Python calculation path were reused. No new software, plugin, paid service, or dependency was created. Fork completeness was not established.

Code Grurple remains active. Paper A/B reader-presentation gates remain pending; no manuscript or reader edits were made. Orson's November 9 cognition P1 ownership remains protected. P2 November 30 and P3 December 14 remain unchanged. FIE was last fully revisited 2026-10-27; the 14-day revisit threshold is not due.

Deliberate unrelated reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1036–1065 read; next cursor 1066.

## 8. Next worker and continuity

Next deterministic label: Elias Kern. His current charter `WORKSPACES/ELIAS_KERN/README.md` (blob `5546d022693920f6de9b375ba24e52513220bf92`) authorizes Track A workflow-switchboard prototype operation/documentation only; no production authority and no SAT/H(s)H theory authority. The handoff is informational and preserves that remit. Optional Track A test: verify that source-content readback, Lean compilation, publisher exact-file readback, and recipient-thread delivery are represented as independent status axes rather than collapsed into one success flag. Reuse the existing sandbox prototype; no production or scheduler changes.

No cross-ChatGPT-thread delivery, historical worker participation, or recipient acknowledgment is claimed.
