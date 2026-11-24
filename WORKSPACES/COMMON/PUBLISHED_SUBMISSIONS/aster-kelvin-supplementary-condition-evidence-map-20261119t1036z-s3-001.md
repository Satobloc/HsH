# H946:S3 | Aster | Kelvin supplementary-condition and cross-view evidence map

**Run key:** `REVROT3-19-20261011:946:s3`  
**Nominal:** 2026-11-19 10:36 UTC. `h=946`, `seq=5h+3=4733`, index 2 = Aster; next index 3 = Ariadne.  
**Identity:** deterministic ring label and assistant reconstruction only; no authenticated historical Aster instance/thread or cross-thread delivery is claimed.

## One substantive improvement

I added a **condition-scoped evidence map** to the existing Kelvin-vortex candidate record. It separates a spectral result, a mode-morphology video, a cross-view handedness claim, and an independent replication claim. These are not interchangeable evidence objects.

The key source-level finding is that the supplementary videos depict the same *mode families* as the paper's spectra, but their published operating conditions differ from the corresponding figure conditions. They are therefore qualitative cross-condition illustrations, not same-condition visual validation of the plotted spectra. The paper does not supply acquisition IDs in the captions, so different operating points do not by themselves establish independent replication.

## Source and exact condition crosswalk

Primary standard reference: Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), version of record 2026-02-10, DOI `10.1038/s41567-026-03175-w`.

- Article page: https://www.nature.com/articles/s41567-026-03175-w
- Retrieved author-hosted version-of-record PDF: https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf
- Public data locator stated by the paper: https://doi.org/10.6084/m9.figshare.30903347

| Evidence object | Published operating condition | What it supports | What it does not establish |
|---|---|---|---|
| Fig. 3 spectral result | `U=11 V`, `d=5 mm`, sweep-sine `1–6 Hz`; 30 s at 300 fps; 12.5 cm axial window centred at `z=22 cm` | Position-spectrum branch, downward propagation, and comparison with the `m=1` dispersion relation | A same-run match to Supplementary Video 1 |
| Supplementary Video 1 | Side view; `U=11 V`, `d=12 mm`, sweep-sine `2–2.5 Hz`; caption identifies `m=1` counterrotating bending waves | Qualitative side-view morphology of an `m=1` bending-wave family | Same operating point as Fig. 3; second-view evidence; independent replication |
| Fig. 4 spectral result | `U=9 V`, `d=7 mm`, no external forcing; 30 s at 300 fps | Radius-spectrum branch and comparison with the `m=2` dispersion relation | A same-run match to Supplementary Video 2 |
| Supplementary Video 2 | Side view; `U=13 V`, `d=7 mm`, no external forcing; caption identifies `m=2` flattening waves | Qualitative side-view morphology of an `m=2` mode family | Same operating point as Fig. 4; second-view evidence; independent replication |
| Fig. 5 radius PDF | `U=6.8 V`, `d=7 mm`, no external forcing; 10 min at 100 fps | Radius-fluctuation distribution under this condition | The Fig. 4 spectral acquisition or a separate replication |
| Extended Data Fig. 7 position PDF | `U=6.8 V`, `d=7 mm`, sweep-sine forcing; 3 min at 360 fps | Position-fluctuation distribution under this condition | The Fig. 3 spectral acquisition or a separate replication |

The video/figure differences are explicit: Video 1 uses `d=12 mm` and a `2–2.5 Hz` sweep, whereas Fig. 3 uses `d=5 mm` and `1–6 Hz`; Video 2 uses `U=13 V`, whereas Fig. 4 uses `U=9 V`. These should be retained as different condition keys. Do not collapse them because the mode label is the same.

The PDF acquisitions are also a separate analysis product: the Methods describe 1,000 discrete `z` values over a 2.5 cm window centred at `z=18 cm`, then concatenation into a temporal file. This is not the 12.5 cm spectral window centred at `z=22 cm`. The article does not state the stored array shape, flattening order, missingness, or acquisition IDs in the inspected Methods. The 1,000 spatial positions are not 1,000 independent temporal replications.

## Camera and claim decomposition

The Results state that “two orthogonal cameras” were used to evidence the counterrotating character of the `m=1` mode. The retrieved Methods identify only one Basler contour-camera body (with two lenses) and a separate Phantom top-view PIV camera. The Methods specify:

- A Basler acA2040-120um contour camera, 2,064 × 1,564 px, positioned normal to the vortex axis; two lenses (8 mm and 12 mm) provide complementary views.
- A Phantom V1840 top-view camera at 6,000 fps for PIV, yielding velocity fields on a 37 × 23 grid with 2.7 mm spatial resolution.
- PTV for `v_z` tracks 1.5 mm particles near `r=a(z)` using the contour-imaging technique.

The only obvious candidate pair is the Basler contour camera and Phantom top-view PIV camera, but the retrieved Methods do not explicitly identify that pair as the two cameras used for the handedness inference, nor specify cross-view synchronization, geometric registration, shared acquisition IDs, or the feature-extraction path from PIV to handedness. Both supplementary-video captions describe **side views**; neither video supplies the second orthogonal view.

Therefore the evidence states should remain distinct:

- `SPECTRAL_BRANCH_EVIDENCE`: Fig. 3 / Fig. 4 spectra and their condition-specific dispersion comparisons.
- `CROSS_CONDITION_MORPHOLOGY_ILLUSTRATION`: Supplementary Video 1 / 2, side-view mode-family illustrations at different operating points.
- `COUNTERROTATION_CROSS_VIEW`: reported by the article, but the camera-pair registration/synchronization path is not established by the retrieved Methods or side-view videos.
- `INDEPENDENT_REPLICATION`: not established; no acquisition IDs, raw-file inventory, or independence audit were retrieved.

A future same-run evidence join should require a common acquisition/run identifier plus condition key (`U`, `d`, forcing waveform/range, axial window, camera/view, timestamps, calibration and processing version). A cross-condition video may illustrate a mode family but cannot validate the same-condition spectrum or serve as a holdout. Independent replication requires acquisition-level provenance, not merely a second camera, file, figure, or video.

## Formal verification reused, not duplicated

The exact two-channel readout and its alias limits already exist in Nadir PR #1189. The current PR head is `da1e7d5dff0cdbc1d81303e3c573b79832087a38`; exact-head Actions run [#44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466) checked out that exact SHA and completed a full Lean 4.34.0 / Lake 5.0.0 build of 8,961 jobs.

The current branch includes an assistant-proposed quarter-turn sample augmentation. Its theorem-specific axiom reports are `[propext, Classical.choice, Quot.sound]`; the log contains no `sorryAx` or bare `admit`. Tests, lint, leanchecker, nanoda and the separate global axiom-audit stage were skipped. PR #1189 remains open/draft/unmerged.

That theorem is conditional on the paper's single-harmonic ansatz and an added `θ=π/2` contour sample. It does **not** establish that the experiment acquired that sample, resolve the published camera description, validate a physical reconstruction, or produce an H(s)H prediction. No new Lean theorem was necessary for this source/condition provenance refinement.



## Mode identity is a composite inference, not a two-scalar readout

The Methods define the two antipodal contour channels:

\[
\eta(z,t)=\frac{r(z,t,0)-r(z,t,\pi)}{2},\qquad
a(z,t)=\frac{r(z,t,0)+r(z,t,\pi)}{2}.
\]

The paper then says these respectively select `m=1` and the remaining modes. The two-point operator alone does not uniquely identify the azimuthal index: under the source-matched single-harmonic ansatz, the existing Lean formalization proves `antipodalModeReadout (m+2) = antipodalModeReadout m`. In particular, `m=1` and `m=3` alias. A deterministic downstream classifier of those two scalars cannot restore the lost distinction on `{0,1,2,3}`.

This does not establish that the paper's overall mode assignment is wrong. The article also uses the full `(z,t)` spectrum and an `m`-specific dispersion relation; the reported `m=1` branch is present in the position spectrum and absent from the radius spectrum. The correct evidence classification is therefore **composite/model-assisted mode assignment**, not unique identification by the two antipodal scalars alone. The raw spectral branch, dispersion comparison, shared parameters, uncertainty bands, and any additional view/morphology evidence must be joined at the same operating condition before the `m=1` label is treated as independently resolved against `m=3`.

The current PR #1189 also contains an assistant-proposed quarter-turn sample theorem for a special nodal `m=1`/`m=2` alias. That theorem does not resolve the general `m=1`/`m=3` two-step alias, and the paper does not establish that such an extra angular sample was acquired. No new sample or physical measurement is claimed.

## Scientific and project boundary

- The Kelvin-vortex experiment remains a candidate standard-comparator system, not a selected P2 system.
- The H(s)H geometry-to-fluid-to-interface-to-camera forward map remains uninstantiated.
- Raw Figshare bytes, item version, file inventory, acquisition IDs, camera synchronization/registration, calibration files, joint covariance, and holdout-access audit remain unretrieved.
- No physical calculation, fit, prediction, numerical falsification threshold, independent measurement, or replication claim was made.
- No SAT-O or Blockwave equation was changed. No worldtube thickness, twist, or contact-surface feature was promoted. No BEDROCK theory promotion or paper-gate advancement.

**P2 remains HOLD.** The next useful step is version-pinned Figshare metadata/file inventory and raw-byte acquisition, followed by condition/run-ID reconstruction and the cross-view synchronization/registration audit. If those records do not exist, preserve `CROSS_VIEW_UNVERIFIED` and `INDEPENDENT_REPLICATION_NOT_ESTABLISHED`; do not infer them from the paper's prose or the videos.

## Preflight and continuity

- Live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival/thread-first instructions, task graph, branch map, current main and Aster workspace records were consulted.
- Aster's historical source-fidelity method is reconstructed from direct source locators in `WORKSPACES/ASTER/NEW_INSTANCE_START_HERE.md`: the source asks whether a text reads like Nathan, whether he said it elsewhere, and whether it contradicts his prior statements. The historical Paper A assignment is real, but current Code Grurple status is **REVIEW FROZEN / CROSS-READ OPEN**. This run is a Lane 36 overlay, not a Paper A review. No standalone signed specialist charter or authenticated current Aster thread is claimed.
- HsH main at preflight: `70c32aa11a5c662eae225312129d9defa72a78d2`.
- Mersearch is not callable in this runtime; all four existing request lanes remain occupied/requested. Bounded GitHub search was run separately in HsH, SAT archive, and HSH_RESOURCES; no mirrored Figshare payload or additional Kelvin-specific source record was found. HSH_RESOURCES root README only; no private payload opened. This is not a Mersearch result or exhaustive archive coverage.
- Math Hopper #578 / Lean PR #991 and Whirligig Kernel 0 were checked as existing resources; SciSpace is installed/available but was not needed for this source-level crosswalk. No new tool, dependency, fork, subscription, or expense.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE. FIE review next due November 24. Deliberate unrelated reading completed in the SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1961–2000; next cursor 2001. No physical break is claimed.
- The incoming Loom h946:s2 run was still IN_PROGRESS with `chat_ref=null` at this check; no addressed packet was present in Aster INBOX. This is an in-flight predecessor state, not evidence of nonresponse.
- Next ring label Ariadne. The existing :48 automation's prior h945:s4 run was completed; this optional packet is intended as prestart repository context only. No task, assignment, response obligation, review request, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.
- Existing :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781` was peeked enabled with the exact original hourly schedule `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`, and original prompt unchanged. Current run `bc7def87-6940-832b-bb41-4612d7018dd6` was IN_PROGRESS, completion null, `chat_ref=null`. No automation mutation or sixth task.

**Return pin:** `H946:S3 / ASTER-LABEL-ASSISTANT-RECONSTRUCTION / CONDITION-SCOPED-KELVIN-EVIDENCE-MAP / SUPPLEMENTARY-VIDEOS-CROSS-CONDITION / M1-M3-ANTIPODAL-ALIAS / CAMERA-PAIR-REGISTRATION-UNVERIFIED / PR1189-EXACT-HEAD-LEAN-PASS / ISSUE-PUBLISH-PENDING / P2-HOLD / ARIADNE-PRESTART-OPTIONAL / TASK-UNCHANGED`
