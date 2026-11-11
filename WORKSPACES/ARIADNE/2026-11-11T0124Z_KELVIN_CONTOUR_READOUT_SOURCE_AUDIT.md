# h745:s2 Ariadne — finite-core vortex source audit and antipodal readout gate

**Run key:** `REVROT3-19-20261011:745:s2`  
**Nominal slot:** 2026-11-11T01:24:00Z  
**Selection:** (h=745), (seq=5h+2=3727), (3727\bmod19=3): **Ariadne**.  
**Successor:** ring index 4, **Alberr**, at h745:s3.  
**Classification:** source-grounded assistant reconstruction; no authenticated current Ariadne thread or historical-instance participation.

## 1. Historical source and remit

The historical identity-bearing conversation is the Library export `ARIADNE — raw.json`, conversation ID `6ab339d2-8fb4-83ea-b728-c8001a034371`, SHA-256 `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`. It contains 1,363 message objects (10 user-role, 555 assistant, 798 tool) plus one empty root mapping node. The author-name field is null; the user-role attribution is preserved as exported.

The assistant supplied the label “Ariadne Vellum”; this is not a Nathan-authored name or signed specialist charter. The direct user-role instructions support a broad, exploratory archival/research remit: inspect the Kirk/Riley material, consider ways to develop it, keep the revival/human-simulation strategy in view, read Tern's work, remain available for cross-project questions, and offer constructive suggestions to Tern without claiming scheduler authority.

No standalone signed specialist charter was recovered. The separate *Science Made Stupid* conversation is a distinct pedagogical/source thread, not the identity-bearing Ariadne conversation. The existing 2026-10-30 first-blush is explicitly an assistant reconstruction, not a historical Ariadne self-report; it was read and not duplicated.

The latest archived Ariadne thread is not a currently authenticated live thread. The current automation run has no run-level `chat_ref`. No cross-thread delivery is claimed. The PRIOR_ART quarantine boundary was respected; no quarantined prior-art corpus was opened.

## 2. Source recovery: measured finite-core vortex

A source-fidelity review was performed against:

- Jason Barckicke, Eric Falcon & Christophe Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), published 2026-02-10, DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).
- Source-data record identified by the article: [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

This is a classical air–water bathtub-vortex experiment with a finite air core, not a superfluid-vortex experiment and not a physical equivalence to the WWRD climbing-rope heuristic.

### 2.1 Identified system and acquisition chain

The article describes a 50 cm × 50 cm × 50 cm tank containing a cylindrical insert of 21 cm diameter and 45 cm height. Four inlets generate the vortex; a bottom drain has diameter (d=4)–10 mm. The annular forcing can be oscillated over approximately 1–6 Hz. The imaged vortex is approximately 40 cm high.

**Contour imaging:** Basler acA2040-120um camera, 2064 × 1564 pixels, 8 mm wide-angle or 12 mm small-angle lens, 300 fps, 30 s recordings, approximately 12.5 cm vertical field around (z\simeq22) cm, approximately 60 µm/pixel, and approximately 0.5 mm contour width. The Methods give a typical core-radius/position measurement uncertainty of about 0.1 mm.

**PIV:** 10 µm hollow-glass particles (reported Stokes number about 0.1), Phantom V1840 at 6000 fps, 37 × 23 interrogation grid, approximately 2.7 mm spatial resolution. The article reports a circulation uncertainty scale (delta\Gamma\simeq0.005\,\mathrm{m^2/s}), including measurement uncertainty and axial variability.

**PTV:** 1.5 mm expanded-polystyrene particles, tracked at the local core radius, with reported vertical-velocity uncertainty (delta v_z\simeq0.05\,\mathrm{m/s}).

The article says the Figshare record includes data supporting the findings, including data used to compute the spatiotemporal power spectra. The record DOI is verified from the article, but the Figshare file inventory, version, raw-file bytes, per-file checksums, license, raw camera video, raw PIV/PTV fields, and joint covariance were **not** recovered in this run. The dataset is therefore identified but not yet measurement-level custody-complete.

### 2.2 Source-defined two-channel readout

For fixed ((z,t)), the Methods sample the radial contour at two antipodal angles:

[
r_0=r(z,t,\theta=0),\qquad r_\pi=r(z,t,\theta=\pi).
]

They define:

[
a(z,t)=\frac{r_0+r_\pi}{2},\qquad
\eta(z,t)=\frac{r_0-r_\pi}{2}.
]

The inverse of this two-value coordinate transformation is:

[
r_0=a+\eta,\qquad r_\pi=a-\eta.
]

The distinction is important:

- The map ((r_0,r_\pi)\mapsto(a,\eta)) is bijective. It loses no information about the **two sampled values**.
- The sampling map (r(\theta)\mapsto(r(0),r(\pi))) is non-injective on arbitrary angular profiles whenever a third angle exists outside the sampled pair.
- Therefore ((a,\eta)) does not, by itself, reconstruct the full angular contour. The information loss is in two-point sampling, not in the invertible mean/half-difference transform.

The paper describes η as selecting the (m=1) contribution and (a) as selecting (m=0,2,3,\ldots) under its specific antipodal-readout and mode assumptions. That source-defined decomposition must not be generalized into unique recovery of an arbitrary Fourier series from two angular samples.

### 2.3 Source equations preserved as printed

The long-wavelength Kelvin-wave relation is printed as:

[
\omega(k)=-\frac{\Gamma}{4\pi}k^2
\left[\log\left(\frac{2}{ka_0}\right)-\gamma\right],
\tag{1}
]

with (\Gamma=2\pi a_0^2\Omega_0) and (\gamma\) the Euler–Mascheroni constant.

The finite-core Rankine-model dispersion relation is printed as:

[
\frac{(\omega+m\Omega_0)^2}{4\Omega_0^2-\omega^2}
\left[
\frac{\beta a_0 J'_{|m|}(\beta a_0)}{J_{|m|}(\beta a_0)}
+\frac{2\Omega_0m}{\omega}
\right]
=-a_0|k|\frac{K'_{|m|}(|k|a_0)}{K_{|m|}(|k|a_0)}.
\tag{2}
]

The accompanying Methods definition is:

[
\widetilde\omega=\omega+m\Omega_0+kv_z,\qquad
\beta=k\sqrt{\frac{4\Omega_0^2}{\widetilde\omega^2}-1}.
]

These are transcriptions of the cited paper, not corrected SAT-O/Blockwave equations. The source notation is retained as printed; no silent substitution of (\widetilde\omega) into other positions in Eq. (2) is made. No SAT-O or Blockwave original was edited or replaced.

### 2.4 Fit versus independent prediction

The paper measures (a_0) from the contour profile, then fits ((\Gamma,v_z)) to the dispersion data and checks a posteriori that the fitted values are consistent with PIV/PTV measurements. This is a fit-plus-consistency check, not an independent held-out prediction.

The article also describes typical instantaneous core-radius/position uncertainty of about 0.1 mm while figure captions describe the uncertainty of the averaged (a_0) as negligible. These statements may refer to different averaging levels, but the uncertainty propagation from contour samples to the mean and its covariance is not supplied in the retrieved text. Do not treat (a_0) as exact without resolving that distinction.

A defensible future holdout would use independent acquisition runs/operating blocks, freeze (a_0,\Gamma,v_z) from independently calibrated measurements, and predict the held-out spectral branches before inspecting their spectra. Adjacent frames from one record are not an independent holdout. No such calculation was performed.

## 3. Conditional Lean formalization submitted to existing Ariadne PR

The existing Ariadne draft PR #790 was reused; no new PR or branch was created.

- PR: [#790](https://github.com/Satobloc/HsH/pull/790)
- Branch: `research/ariadne-primary-role-transclusion-20261027t1924z`
- Base: `infra/lean4-verification-20261023`
- Corrected current head: `2287e284cddd2c01b1bfcab7e6ee3302b9c02a30`
- Module: `FORMAL_VERIFICATION/HsHVerification/AriadneAntipodalContourReadout.lean`
- Corrected module blob: `98f48fe08dce85aa1d6b7883246ce112ab574fee`
- Root aggregator imports the new module.

The module states and attempts to prove:
1. The two-sample ((r_0,r_\pi)\leftrightarrow(a,\eta)) transform is bijective.
2. Equality of ((a,\eta)) outputs is equivalent to equality of the underlying two sampled values.
3. Two-point sampling is non-injective on arbitrary angular profiles if a third angle exists outside the sampled pair.
4. The composed readout is therefore non-injective on arbitrary profiles.

**CI history must remain honest.** The first exact-head Actions run #42940216121 tested earlier head `880cfd64c7efafb0fae8a1822d50d3413b01f718` and FAILED. It exposed three real issues: noncomputable real division, an incorrect tactic sequence for the inverse identities, and a malformed injectivity-transfer proof. The first failed module's `#print axioms` output included `sorryAx` because the declarations did not compile; those outputs are not accepted proof evidence.

A corrected commit `2287e284...` marks the real-division definitions noncomputable, uses explicit product extensionality with `field_simp`/ `ring`, and transfers injectivity through the readout composition explicitly. At the time of this report, no Lean workflow run for the corrected head had been returned. The combined status exposed only a Vercel build-rate-limit failure, which is unrelated to Lean. Corrected-head status is therefore **SUBMITTED_NOT_VERIFIED**. No successful Lean proof is claimed.

Local `lean`, `lake`, `elan`, and `gh` are not installed. The existing PR CI is the available execution route. A next pass must verify the exact corrected head, inspect the complete job log, check all theorem-specific `#print axioms`, and distinguish skipped tests/lint/nanoda/global axiom audit from actual checks.

Even if the module compiles, it proves only the encoded measurement-map mathematics. It does not validate the source data, the physical Rankine model, the dispersion relation, any H(s)H worldtube/timesheet mapping, or an observable prediction.

## 4. Lane 24 disposition

**Candidate:** high-priority source-recovered finite-core/rotation system.  
**Selection:** NOT SELECTED as the P2 test system.  
**Raw-data gate:** PARTIAL; public data DOI identified, file inventory/checksums and raw acquisition/covariance still missing.  
**Prediction gate:** NOT READY; the paper's displayed fit is not an independent holdout.  
**H(s)H map:** NOT ESTABLISHED.

Potential measured fields are (\eta(z,t)), (a(z,t)), azimuthal flow (v_\theta(r,z,t)), and vertical flow (v_z(z,t)). A worldtube candidate might be the spatiotemporal centerline history; a timesheet candidate might involve the finite-core interface; the responsive-medium candidate is the measured surrounding water flow. These are only typed candidates. No embedding, projection/composition map or physical equivalence to H(s)H has been established.

A separate September 2026 PRL paper, “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core” (DOI 10.1103/t3bt-m431), is a related but distinct publication. Its raw data were not recovered here; the Nature Physics Figshare record must not be assumed to cover that separate study.

## 5. Controls, repositories and campaign

- Live HsH main snapshot at the time of final P0 recheck: `41439cc0ad17d60954eb9ffca580d5f494e4f4a0`.
- Protected P0 files: **8/8 exact blob matches** against the established fingerprint.
- Canonical route-vector SHA-256: `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.
- Both reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No live route probe or P0 standdown.
- Task graph remains 16 declared branches against 18 records; not edited.
- Three-repository front doors were read: HsH, SAT_THEORY_ARCHIVE_2023-25, HSH_RESOURCES. Private-reference boundaries were preserved.
- Mersearch connector is not exposed in this runtime. All four existing request files remain `requested`; all twelve expected request-scoped manifest/receipt paths were absent. No request was submitted, overwritten or retriggered. GitHub retrieval was a bounded fallback, not a Mersearch search.
- Existing Math Hopper issue #578 / PR #991, Lean PRs, Whirligig Kernel 0 and SciSpace were checked before new tooling. No new tool, dependency, subscription, fork or cost was created. A complete fork census was not performed.
- FIE rereview remains current through 2026-11-10; next review 2026-11-24. Unrelated-reading cursor remains SAT archive MIX TAPES.txt lines 141–180; next cursor 181. No new unrelated reading or physical break is claimed.

Campaign status:
- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY / Orson-owned.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.

No CODATA comparison, physical calculation, fit, independent prediction, P2 selection, paper advancement, SAT-O/Blockwave equation change, BEDROCK promotion or theory promotion was performed.

## 6. Publication and scheduler

No new public issue was created. Existing issue #1569 remains the published source-to-observable evidence-chain artifact; this note is a source-custody and formalization workbench update, not a new physical claim. No duplicate issue was submitted.

The current :24 task remains enabled under its existing ID `6abda4c8eda88191bf23a6f2849e9a17`, original hourly America/New_York :24 VEVENT and exact phase. The current run ID is `6572f045-40f0-832e-abfd-6c0841fabf26`, scheduled 01:24Z and started 01:27:46Z; it remained IN_PROGRESS with no `chat_ref` at the last exact-ID read. Cached `latest_result` belongs to the preceding h744 Ravel run, not this h745 run.

The :36 task's latest observed run is h744:s3, run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0`: scheduled 00:36Z, started 01:12:21.845546Z, completed 01:37:23.196062Z, recorded FAILED, no `chat_ref`. Its cached result still belongs to h743 Morrow. The h745:s3 occurrence was not visible in the task run record at the time of the last read. This was routed to Tern as an observation only; no retry, restart, skip or duplicate is inferred.

No task ID, prompt, schedule, phase, cadence or enabled state was changed. No sixth task was created.

## 7. Successor context

Next deterministic identity: **Alberr**, h745:s3, run key `REVROT3-19-20261011:745:s3`. Alberr's workspace explicitly preserves autonomous self-reconstruction and permits ignoring optional handoffs. The packet is context only: no assignment, response obligation, ownership transfer or direct-thread delivery is claimed.
