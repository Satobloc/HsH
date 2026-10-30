# Calder | GW170817 joint readout contract and exact-head proof gate

**Status:** INTERNAL ARCHITECTURE / PARKED UNDER ACTIVE CODE GRURPLE / NO NEW PHYSICAL CALCULATION / NO NEW LEAN PROOF  
**Observed execution start:** 2026-10-30T18:02:13Z  
**Nominal rotation:** `REVROT3-19-20261011:472:s3`  
**Selection:** h=472, s=3, seq=2363, ring index 7 = Calder; immediate successor Hale (index 8).  
**Participation:** current-assistant, source-grounded Calder reconstruction. No authenticated historical Calder thread or participation is claimed.

## 1. Why this is a new lens

The same nominal :36 slot already has a completed Calder method note on UCI gait measurement dependence, published and readback-verified as issue #1106. That work is not repeated here. Its 181,800-row gait audit is a method-QC stress test, not a SAT/H(s)H measurement, and its subject-cluster independence assumption remains explicit.

This delayed execution instead checks the current GW170817 physical-readout branch and tightens the architecture required before it can produce a distinguishing H(s)H prediction.

## 2. Current exact-head Lean status: correction to the earlier P2 receipt

The earlier P2 receipt/addendum described PR #1061 at head `f6af32da569cb53188978c4a70227c6935d996a2` with run #41008871063 still in progress. That is no longer the current state.

Current readback:

- PR #1061 remains **OPEN / DRAFT / UNMERGED**, stacked on `research/aldus-o9-audit-identity-20261029t0612z`.
- Current head: `8b428c5151228dc7e08e94c18e0621fe789f90e0`, commit message “Import Calder oblique tube slice formalization”, 2026-10-30T09:14:52Z.
- Exact-head workflow run #41032035940: **COMPLETED / FAILURE**, Lean 4.34.0, build attempted 8,958 jobs.
- Failed target: `HsHVerification.CalderObliqueTubeSlice`.
- Compiler diagnostics:
  - line 38: definition depends on `Real.sqrt`, which is noncomputable;
  - line 42: definition depends on noncomputable `stretchFactor`;
  - line 84: unsolved goal in `embedSlice_image_ball_eq_intersection`;
  - line 128: unsolved goal in `readoutCoords_image_ball_eq_ellipsoid`.
- The failed target's `#print axioms` output contains `sorryAx` for affected declarations as a consequence of the failed compilation. The source file contains no literal `sorry`; this is not evidence that a source-level `sorry` was added. It is evidence that the failed declarations are not verified.
- `test` and `lint` were skipped after the build failure.

The imported module, blob `8ed7e7e85916215369f1b74dd8c38ac02faccd88`, defines a conditional Euclidean solid tube `B^3_a × ℝ`, a plane timesheet `w = m x`, and an ellipsoidal intrinsic readout. It assumes a 3-ball cross-section and a slope parameter (m). It is a **conditional geometry toy**, not a source-derived Kerr-core model, not a constitutive law, and not a physical H(s)H prediction.

I did not patch it. The construction is a data-free geometric fixture without a recovered Nathan permission token, and its ball/hyperplane assumptions are not forced by the direct source. Mechanically marking definitions noncomputable would not repair the unsolved goals or establish physical relevance. Any further proof work on this fixture is **BLOCKED_PENDING_NATHAN_PERMISSION**. Do not promote it or call the PR's current head compiled.

Separate existing result:

- PR #655, head `e9379839cf788ff7166539d82ffa8f0469c082fd`, run #40431377704: **SUCCESS**, Lean 4.34.0, 8,941 build jobs.
- The three lag-identifiability declarations printed only standard dependencies `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in those outputs.
- The workflow's separate automated `axiom-audit` step was skipped. This is a successful build and theorem-specific axiom print, not an independent audit or an observational result.

Lean scope: the PR #655 result checks its formal algebraic statement under its assumptions. It does not establish the source-emission prior, a physical propagation anomaly, or SAT/H(s)H.

## 3. Nathan Direct source anchors and equation genealogy

Primary raw conversation export:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`  
Git blob: `c49367b0faa424491e7b3520a034b9e44fe6897f`.

Role-tagged user messages actually extracted from that raw JSON:

- `09c6d26f-934f-4be6-b2ae-21a6fc281147`, 2026-09-06T08:09:54.609Z: nested helices/superhelices, braids, perturbations, winding, a fluid/medium and Kelvin vortices; the message rejects introducing new primitives casually.
- `2a34f106-0dd0-488f-a0e6-97748320c955`, 2026-09-07T05:58:50.090Z: “Kerr should be the core,” followed by an ergosphere/layer and coiling. This corrected timestamp supersedes the earlier 05:32:10.090Z transcription.
- `8471543a-6ed1-4743-9073-74735f019da4`, 2026-09-07T07:39:00.690Z: a four-dimensional worldtube with Kerr cross-section and deformable shells.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`, 2026-09-07T07:53:42.877Z: choose a spatial Kerr section and extend it along the filament; do not confuse that with a second 4D Kerr spacetime.
- `496a15ea-0263-459d-b815-908f52155b90`, 2026-09-07T10:06:12.842Z: multiple simultaneous representations.
- `62b85640-6a36-47b7-b064-94c97106f9b6`, 2026-09-10T14:43:07.491Z: asks what measurements should constrain shell deformability, permeability and stability.

These are Nathan-attributed raw user-role messages, not externally authenticated identity records. They are geometric requirements/questions, not equations for a neutron-star Love number or tidal response.

### SAT-O / Blockwave provenance, kept separate from corrections

The existing source crosswalk is `WORKSPACES/CALDER/2026-10-30T0221Z_BLOCKWAVE_SIGN_SOURCE_CROSSWALK.md`, blob `20a5f8f4d1fae3d8559eda9e16cb290e3d2e7742`. Its verbatim excerpts and source limitations were read.

- `SAT—Blockwave Ideal Model.txt`, blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, has the scalar term
  `+ f²/2 ∂μθ ∂^μθ − μ⁴(1−cos θ)`
  with background signature ((-+++)), plus `πθ = a³ f² θ̇` and a positive Hamiltonian. The source attachment's original creation/publication date is not established by the raw conversation timestamps.
- `🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, has the distinct scalar term
  `+ fθ/2 ∇μθ ∇^μθ − Λθ⁴(1−cos θ)`.
- The unified action containing (J^{\mu\nu}) was first located as an **assistant synthesis**, message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, in raw export blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, timestamp 2025-10-19T12:29:46.539Z. The user prompt `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` at 12:29:41.119Z asks for the full action; the later user-role re-paste `f77f769e-8e74-4def-b4c9-bced0edbb8bc` at 14:49:49.632Z does not authenticate original equation authorship.
- `BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, is a separate 1+1D constrained branch with different couplings and an incomplete displayed Hamiltonian.
- The historical SAT-O1 artifact blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` was retrieved, but its source path and file-level date were not resolved in this bounded pass. It contains a 1D filament action, not a finite-core neutron-star tidal readout.

The conditional sign repair in the source crosswalk,
[
\mathcal L_{\theta}^{\mathrm{candidate}}
=-\frac{f^2}{2}g^{\mu\nu}\partial_\mu\theta\partial_\nu\theta
-\mu^4(1-\cos\theta),
]
is a standard-sign candidate **only if** the Lorentzian ((-+++)) convention is intended. It is not a Nathan Direct equation, not a verified full-action correction, and must not be transferred to the current all-plus H(s)H representation without an explicit signature map.

No verbatim SAT-O/Blockwave tidal Love-number equation was found in the bounded source record. No source-faithful map from the Kerr/worldtube/shell/medium objects to (R), (k_2), (Lambda), or a GW waveform was recovered.

## 4. The missing model-to-observable contract

The standard comparator already has an explicit stellar/binary readout:
[
\Lambda_i=\frac{2}{3}k_{2,i}\left(\frac{c^2R_i}{Gm_i}\right)^5,
\qquad
\widetilde\Lambda=
\frac{16}{13}
\frac{(m_1+12m_2)m_1^4\Lambda_1+(m_2+12m_1)m_2^4\Lambda_2}
{(m_1+m_2)^5}.
]

That is the standard GR/stellar-structure map, not an H(s)H equation. The unresolved H(s)H links are:

1. (F_{\rm tidal}: (W^4,\mathcal M,\theta_{\rm shared},m_i,\chi_i,\mathrm{EOS})\to(R_i,k_{2,i})\to\Lambda_i\to\widetilde\Lambda\to d_{\rm GW}).
2. (F_{\rm prop}: (W^4,\mathcal M,\theta_{\rm shared},D)\to v_g\to\Delta t_{\rm prop}).
3. The independent source-emission model (F_{\rm src}\to\Delta t_{\rm src}), needed because
[
\Delta t_{\rm obs}=\Delta t_{\rm src}+\Delta t_{\rm prop}.
]

The same shared geometry/medium parameter vector must feed both channels. No channel-specific refit is allowed. If (Delta t_{\rm src}) is unconstrained, the propagation channel is non-identifiable even when the observed lag is precise. If (F_{\rm tidal}) is absent, the tidal posterior constrains standard GR/EOS parameters but does not test an H(s)H core.

## 5. Real-system test matrix (design only, no new calculation)

| Hypothesis | Real measured inputs and uncertainty | Shared parameters / calibration | Holdout and predicted observable | Standard comparator | Falsification / current status |
|---|---|---|---|---|---|
| H(s)H core/medium predicts neutron-star tidal response | GW170817, 2017-08-17 strain event. 2019 published low-spin PhenomPNRT λ-tilde posterior: 300 with 90% HPD [70,720]; high-spin one-sided 90% [0,630]. Low-spin q=[0.73,1.00], high-spin q=[0.53,1.00]. | One frozen θ_shared plus independently constrained mass/EOS inputs. No independent per-event k2 or radius fit. Calibration dataset not yet selected or retrieved. | Full waveform/tidal posterior, not just a radius point. Raw posterior NPZ samples were not retrieved; no sample-level score is available. | GR + EOS tidal Love map above, using the same measured data and waveform families. | Pre-register a full posterior-predictive discrepancy/score and threshold before holdout. The published 90% intervals are descriptive constraints, not a complete test statistic. **BLOCKED_MISSING_F_tidal.** |
| H(s)H geometry predicts GW/EM propagation | GW170817/GRB170817A observed arrival delay (+1.74\pm0.05\,\mathrm{s}); initial distance (40\pm8\,\mathrm{Mpc}). | Same θ_shared. Source-emission delay Δt_src must be independently constrained; it cannot be silently absorbed into propagation. | Predict Δt_prop and then the observed delay after source-emission uncertainty is propagated. | GR propagation at (v_g=c), combined with an explicit astrophysical emission-delay model. | If Δt_src remains free, this datum cannot identify (v_g). **BLOCKED_MISSING_F_prop and BLOCKED_MISSING_SOURCE_DELAY.** |
| Cross-channel closure | Same single event and its GW/EM measurements; preserve their shared source and distance dependencies. | Freeze one shared geometry/medium parameter vector before the holdout. Keep source-emission nuisance explicit. | Joint (p(d_{\rm GW},d_\gamma\mid\theta_{\rm shared},\eta_{\rm src})), with dependence/covariance handled rather than multiplying marginal summaries. | Joint GR+EOS + (v_g=c) baseline with the same nuisance structure. | Fail if either channel fails its preregistered predictive criterion or if separate channel-specific geometry parameters are needed. No joint likelihood has been constructed. **DESIGN_ONLY.** |
| Waveform/prior robustness | Four waveform families and low-/high-spin prior analyses in the same 2019 study. | Same frozen model; no re-fit for each waveform family. | Sensitivity envelope of the same event's posterior. | The source paper's alternative waveform/prior analyses. | These are alternate analyses of one event, not independent replications. Reversal across them is model sensitivity, not extra evidence. |

The low-spin λ-tilde interval and high-spin upper limit are posterior summaries from the same event, not independent experiments. Do not multiply them or treat their interval intersection as a combined posterior. The four waveform-family endpoints are robustness analyses of the same strain data.

No numerical falsification threshold is invented here. It must be preregistered with the full likelihood/posterior and uncertainty model. The existing corrected Raithel Eq. (10) reconstruction in the P2 addendum is a conditional standard-GR radius translation, not an H(s)H prediction; the earlier unsupported 11.2 sixth-root attribution remains withdrawn.

## 6. Proof and execution boundary

- Existing PR #655 build success supports only its encoded lag algebra under the free-emission assumptions; the automated axiom-audit action was skipped.
- Current PR #1061 exact-head CI is failed. The failed oblique-slice module is a conditional geometry toy and is not a source-faithful physical map.
- The composed non-identifiability question (free Love-response map plus free source-emission delay) is a candidate formal proposition, but a new proof would be data-free. It is **BLOCKED_PENDING_NATHAN_PERMISSION**. No new Lean code, local compilation, synthetic fixture, or physical calculation was run.
- Raw posterior NPZ retrieval remains unavailable in the current evidence set. No sample-level posterior replay is claimed.
- Mersearch lanes 1–4 remain occupied; no request was overwritten and no new run was claimed. The raw conversation blob above was directly read; that is bounded GitHub source retrieval, not a new Mersearch run.
- Existing Math Hopper, Whirligig, Lean infrastructure, PRs, SciSpace and fork checks were already examined in the prior P2 pass; no new tool/plugin/service was built or acquired.

## 7. Governance and next safe step

Code Grurple remains **ACTIVE** because the two public paper-reader routes have not passed the presentation gate. Ordinary P2 branch/paper changes remain on hold. This note is an internal architecture/verification addendum only: no issue, PR, manuscript, public reader route, or BEDROCK change was made.

The prior same-slot UCI method audit is already published as issue #1106, publisher comment #6528337034, commit `52184dc219a4ff27f55b0e7dca0ef96d7e09e690`, destination blob `de51afe3f12a8bd1ccdd39dea6cedfb3fe8c7d0e`, exact 6,142-character readback, SHA-256 `86981bf7b286e92d69f51bac0d9dd09c9d58ec7f6194d2b46dc5c9c16ba60b72`. It was not resubmitted.

The immediate successor Hale's 16:48Z run had already completed before the delayed Calder retry; its receipt reports that the incoming :36 packet was not available at intake. The existing 16:36Z handoff is retained, not overwritten. This addendum is routed to Hale's next ring occurrence, h=476/s=3, 2026-10-30T20:36Z. A separate older handoff to Hale's next :12 occurrence on 2026-10-31T04:12Z is left untouched.

Hale's historical wake packet preserves external-literature/statistical-calibration work and explicitly warns that Hale is not a blind reviewer. Personal-context search did not authenticate a current Hale ChatGPT thread. Repository handoff only; no cross-thread delivery or acknowledgment is claimed.

FIE was last reviewed 2026-10-27; the 14-day re-review threshold is not due. Unrelated reading was already completed in the same nominal slot at `SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/TheTANGLE.txt`, lines 1121–1160; no redundant break was added.

**Next:** after Code Grurple standdown and explicit permission for any data-free proof, either (a) source-derive the two H(s)H forward maps from actual Nathan Direct equations and an explicit constitutive law, or (b) stop the physical test as non-identifiable. Do not fix the Euclidean ball fixture merely to make CI green.

My next Grurple task is: WAITING for both public reader routes to pass the presentation gate or Nathan's explicit standdown.
