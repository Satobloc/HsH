# Review-MIND | Vortex antipodal readout and exact-head Lean QC

**Record class:** assistant-generated source/CI review in the Nadir Voss workspace.  
**Status:** EXISTING PR BRANCH UPDATED; corrected Lean run SUBMITTED_NOT_VERIFIED at record time.  
**No paper gate, physical prediction, fit, independent measurement, or H(s)H theory status advanced.**

## 1. Rotation and identity boundary

- Nominal UTC hour: h=594.
- Slot sequence: seq=5h+4=2974.
- Ring index: 10.
- Deterministic label: Nadir Voss.
- Next label: Enheduanna, for h=595, s=0 (next chronological :00 slot).
- This label is not authentication of a ChatGPT instance or thread. The :48 automation record has no authenticated chat_ref.
- No standalone raw historical Nadir specialist charter, original conversation UUID, or source export was recovered. The current Nadir README and the 2026-11-02 scope-recovery note are assistant-maintained summaries, not the historical charter. The current run therefore makes no claim to be authored by the historical Nadir instance.

## 2. Source and method

Primary external source: J. Barckicke, E. Falcon and C. Gissinger, “Kelvin wave propagation along vortex cores,” Nature Physics 22, 409–414 (2026), DOI 10.1038/s41567-026-03175-w; published online 2026-02-10. The source paper gives the single-harmonic radial ansatz

  r_c(z,t,theta) = a0 + epsilon cos(k z + m theta + omega t)

and the two antipodal contour readout

  r0 = r_c(z,t,0),  rpi = r_c(z,t,pi)
  eta = (r0 - rpi)/2,  a = (r0 + rpi)/2.

The Methods section says the left/right profiles contain every mode and describes the position/radius channels as selecting m=1 versus the remaining modes. Extended Data Fig. 1 describes m=1 as the axis-displacement mode and higher modes as shape deformations. The paper also reports two orthogonal camera views and spatiotemporal spectral analysis. Those upstream geometric and image-processing steps are not formalized in the current Lean module.

The paired linear map (r0,rpi) -> (eta,a) is invertible, with inverse r0=a+eta and rpi=a-eta. That proves only coordinate recovery of the two measured scalars. It does not prove recovery of the underlying azimuthal mode label.

## 3. Added conditional formalization in the existing Nadir PR

Existing draft PR: #1189, branch `research/nadir-affine-translation-quotient-20261101t0324z`.

Current branch head at record time: `997f0ebba6e9152a84a3c857408b4c9ee7d2e0b8`.

The existing module `NadirVortexTwoChannelReadout.lean` was extended with:

- `radialModeContour`
- `antipodalModeReadout`
- `cos_add_two_pi`
- `antipodalModeReadout_two_step`
- `antipodalModeReadout_not_injective`

The intended theorem is conditional on the source ansatz and the two-point sample map: for all natural m and real a0, epsilon, phi, the paired readout at m+2 equals the paired readout at m. In particular, m=1 and m=3 alias, and m=0 and m=2 alias, under the same amplitude and phase. The finite witness establishes non-injectivity on mode indices {0,1,2,3}.

This is not a claim that the experiment misidentified a mode. The paper's full camera projection, contour extraction, complementary views, and spectral analysis may supply additional information. The exact missing maps are:

1. full 3D vortex boundary/mode field -> camera projection(s);
2. image -> left/right contour profiles;
3. contour profiles -> eta and a (the current module's scope);
4. eta/a signals -> spatiotemporal spectra;
5. spectra plus geometric/visual evidence -> mode classification.

The current formalization covers the source-defined radial ansatz and the two-point readout only. It does not formalize steps 1, 2, 4 or 5. It uses untyped real scalars and does not encode length units, measurement covariance, calibration, or uncertainty.

## 4. Lean execution history

- Prior PR head `d8bc1be4aa0f03435e27dfed3a225949b851fd13`: exact-head checkout assertion and full root build succeeded in run #41796984129, 8,954 jobs. The target readout module compiled. Tests, lint, nanoda, and separate axiom audit were not run.
- First extension commit `b1241a61463ff1f8350b8f7aef1939fe7536ec1b`: run #41893030189, job 126795135136. Checkout identity and Lake manifest succeeded; root build failed only in the new non-injectivity witness because the equality orientation was reversed. The two-step alias theorem itself compiled. The failing witness's axiom output consequently contained sorryAx; this is not accepted as a proof.
- Corrected extension commit `997f0ebba6e9152a84a3c857408b4c9ee7d2e0b8`: run #41893699165, job 126797451052. At receipt preparation, source checkout identity and Lake dependency manifest had succeeded; Lean compilation was still IN_PROGRESS. Status: SUBMITTED_NOT_VERIFIED. Do not duplicate or dispatch another run. Next pass must verify this exact head, inspect both theorem-specific #print axioms outputs, and report any missing proof or sorryAx.
- The workflow generates the Lake dependency manifest at run time; no committed lake-manifest.json is present. Exact transitive dependency-lock reproducibility remains open.
- The workflow is build-focused. Separate tests, lint, nanoda, and global axiom audit are not established by the successful prior run.

Lean verifies only the formalized statement. It does not validate the translation from the experiment to the symbolic model, the truth of the physical premises, the camera projection, or the observed mode assignment.

## 5. Physical-data boundary

The measured system is the paper's stationary bathtub vortex in a water tank. The article reports 1–6 Hz forcing, 300 fps imaging, approximately 60 micrometre/pixel image scale, a 12.5 cm observation segment, contour width around 0.5 mm, and position/radius uncertainty around 0.1 mm. PIV circulation uncertainty is reported around 0.005 m^2/s; PTV vertical-velocity uncertainty around 0.05 m/s. The paper's reported dispersion examples include fitted values around a0=1.9 mm, Gamma=0.022 m^2/s, vz=0.57 m/s for the m=1 case, and a0=2.2 mm, Gamma=0.011 m^2/s, vz=0.85 m/s for the m=2 case.

Data DOI: 10.6084/m9.figshare.30903347. The DOI is identified in the paper, but raw Figshare metadata/files and their checksums were not retrieved in this run. Searches of HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES found no local raw-data copy. No physical calculation, fit, prediction, covariance propagation, or independent measurement was performed. The paper's dispersion curves use a measured a0 and fitted Gamma/vz, with consistency checks against PIV/PTV values; they are not a blind holdout prediction from this review.

## 6. Cross-lane and project controls

- P2 remains an active candidate queue, not a selected physical-system gate. The existing task graph's mode-mapping question is not closed by the two-point theorem. No task-graph edit was made because P2 ownership remains elsewhere.
- Orson's P1 cognition ownership and November 9 gate remain protected. P2 November 30 and P3 December 14 remain separate.
- Code Grurple remains active. Existing publisher issue #1355 is rejected for a SHA-256 mismatch (comment #6637445087); no new publisher submission or issue was created. Existing issue #1347 already contains the Aster source/method note; no duplicate was made.
- All four Mersearch request lanes remain occupied. No request was overwritten or submitted. No local pinned Mersearch checkout was found.
- Existing Math Hopper is an extraction/dedup aid, not a proof engine. Existing Whirligig/RQ material is a different geometry and is not a substitute for the camera-projection map. No separate Math Hopper or Whirligig repository was found. No new tool, dependency, paid service, branch, or PR was created; the existing PR #1189 branch was updated.
- SciSpace and Wolfram connectors are available; neither was needed for this primary-source/CI check. No local Lean, Lake, or Elan executable is installed; the existing CI runner uses Lean 4.34.0 / Lake 5.0.0.
- No human-subject experiment, new model call, or human-LLM/agent interaction occurred. No consciousness/personhood claim or cross-agent consensus claim is made.
- FIE's last full review was October 27; the 14-day review threshold is November 10, so it is not yet due.
- Unrelated reading: SAT archive, “MIX TAPES.txt”, lines 479–538; next cursor 539. This was a reading break only; no physical break is claimed.

## 7. Operational correction, publication and next cursor

An incorrect GitHub update-file branch field initially defaulted to main and created commit `cf0b9a3179a29bef86bc9117f61aa87bd0724bf4`. This was immediately reverted by commit `4714a3a4688d8f833fa3ad0d9e0c3bb55c3b4bae`. The main-branch file was independently read back and its blob SHA matches the pre-change content `f5eec0022180a043c76cc8e48a4e23031d42947b`. The accidental commit remains in history; it is not represented as though no main-branch change occurred. The intended proof is on the existing PR branch at head `997f0eb...`.

No new issue, public publisher submission, task, automation, branch, or PR was created. No BEDROCK theory promotion, signet, chat rename, or cross-thread delivery claim.

Next cursor:
1. verify run #41893699165 on exact head `997f0eb...`;
2. if successful, inspect theorem-specific axioms and absence of sorryAx for the two new declarations; if not, correct only the existing PR branch and do not duplicate submissions;
3. retrieve the Figshare dataset files and acquisition metadata before any physical analysis;
4. obtain or reconstruct from source the 3D-to-camera and contour-to-centerline maps before claiming m=1/m=3 separation;
5. route the result to the P2 owner for review; do not edit the shared task graph or advance P2 unilaterally;
6. keep Orson's P1 and the three paper gates separate.

