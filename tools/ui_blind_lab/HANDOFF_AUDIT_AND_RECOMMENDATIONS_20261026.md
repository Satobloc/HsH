# SAT Universal Indicatrix blind lab: publication, QA, worker handoff and recommendations
**Date:** 2026-10-26  
**Status:** REPOSITORY-PUBLISHED / BROWSER-PREVIEW SOURCE READY / LIVE SITES DEPLOYMENT NOT VERIFIED  
**Scientific status:** executable dimensionless geometric laboratory, *not* a semiconductor predictive engine  
**Freeze:** `SAT-UI-BLIND-20261026-001`  
**Requester:** Nathan Direct: preserve work in HsH, document extensively, request several independent audits/uses, and present alongside Whirligig.

## 0. Exact location and ownership
- **Immutable baseline:** `tools/ui_blind_lab/index.html` and `ui_kernel.py`, `test_ui.py`, `ui_browser.js`, `FREEZE_MANIFEST.json`, `BLIND_FREEZE_GEOMETRY.json`. Keep these baseline files byte-stable for the 2026-10-26 blind comparison unless creating an explicitly versioned successor. `ui_browser.js` is a separate inspectable copy of the browser computation; frozen `index.html` is *self-contained* and runnable without it.
- **Detailed recovered-source and usage guide:** `tools/ui_blind_lab/README.md`.
- **Post-freeze comparison:** `tools/ui_blind_lab/POSTFREEZE_COMPARISON_20261026.md`.
- **Website presentation copy:** `PUBLIC_SITE/instruments/universal-indicatrix/index.html`. It has cross-navigation changes only. Treat its bytes as a *derived site wrapper*, not the frozen scientific program. Any changes to the mathematics must create a new tagged/dated mathematical version and retest.
- **Existing Whirligig:** `PUBLIC_SITE/instruments/whirligig/index.html`, with a reciprocal link to this instrument. Its mechanism, R/Q constraints, and tests are independent and must not be replaced with UI examples.
- **Site registry:** `PUBLIC_SITE/instruments/INSTRUMENT_REGISTRY.json`; **Sites guide:** `PUBLIC_SITE/instruments/universal-indicatrix/SITES_INTEGRATION.md`.
- **External holdout:** Agesa et al., *Advances in Materials Physics and Chemistry* **16**, 309–332 (2026), DOI `10.4236/ampc.2026.168018`; submitted user PDF and separate session-local holdout ZIP with SHA metadata. The binary holdout PDF, comparison PDF rendition and screenshot are **not asserted to be hosted in this GitHub commit**. The equivalent *full review text* is hosted in MD here. Live site should link to the DOI as an independently labeled external reference, not import its values into computation.

## 1. Mathematical scope and reproducibility
Universal Indicatrix recovered from archival `SAT GEOMETRIC SOLVERS.txt` and `SAT CORE — UI CONFIG.txt`: two relative frames in R^4, isotropic scale `q(s)`, and `R(s) ∈ SO(4)`, with a unit seed `x0`.
```text
X(s) = q(s) R(s) x0
u(s) = R(s) x0;  u·u = 1; u·u' = 0
|X'|² = q'² + q² |u'|²
F[X] = ∫ [T |X'|²/2 + κ |X''|²/2 + α (X'·n)² + V_int(X)] ds
κ X'''' - T X'' - 2α n (n·X'') + ∇V_int = 0
   [last equation only if n constant and V_int depends on X alone]
```
Three displayed integral factors deliberately have **no arbitrarily assigned physical weights**. The inverse X->q,u recovers only a direction, leaving a 3-degree SO(3) frame stabilizer. No unique electronic dispersion `E(k)`, species-sensitive defect potential, electron occupations, effective masses or transport lifetimes follow from this geometric map alone.

## 2. Verified operations
- The recovered local source package was unpacked from `SAT_UI_BLIND_LAB_20261026.zip` and directly executed using `python test_ui.py`: **6/6 PASS**.
- `python ui_kernel.py --verify` returns the exact identity and recognizes absent independent SiC observables.
- The code stored in GitHub was compared character-by-character with the mounted generated text artifacts after restoring the original final LF. Frozen source files, tests, JSON, README and MD matched exactly in the GitHub readback. SHA-256 hashes of original local files are in `FREEZE_MANIFEST.json`. The hosted site copy intentionally has its own navigation changes; hash should differ.
- The website-facing HTML was inspected as self-contained with inline JavaScript; browser live deployment to ChatGPT Sites or remote QA on deployed page **NOT VERIFIED**.
- The six tests are **mathematical/software QA only**, not tests of SAT physics, empirical predictions, or 3C-SiC suitability.

### Runbook
```bash
cd tools/ui_blind_lab
python -m pip install numpy sympy
python test_ui.py
python ui_kernel.py --verify
python ui_kernel.py --controls-json your_export.json --output your_analysis.json
```
For independent browser verification, open `tools/ui_blind_lab/index.html` offline and exercise computation, CSV export, control export, inverse import, freeze digest and reset. Compare the site wrapper on browsers/mobile. Run tests *before and after* changes. Do not require internet or a bundled third-party script in the baseline.

## 3. Blind protocol and test hygiene
1. Keep this freeze and the external paper comparison strictly segregated. The previous assistant *read the paper* before coding, so this is **computational blinding**, not double blindness.
2. Recover SAT equations via Mersearch or original sources. `UNODROP` and `ONE FILE SAT 2` are historical test-framework material, not validated proofs. Worker reconstructions are not automatically Nathan Direct.
3. Do not insert the SiC paper's reported gap, effective mass (including 0.228/1.833), carrier doping density, thermal trends, fitted relaxation times, or comparison residual into the solver as a prior, target, tuning knob, fixture or initialization.
4. **No numerical physics without a real system, actual data and source provenance** unless Nathan has explicitly permitted the named mathematical toy. The UI's default circle is a declared mathematical identity fixture, not a physical calculation.
5. First derive and preregister a physical-sector bridge from the SAT geometry to an electronic spectral operator. Freeze the rules including any independently sourced physical input, constants and tolerances. Only then compare unseen quantities. Use data from sources independent of the holdout paper's calculations where possible.
6. Categorize outcomes: exactly derived symbolic identity / numerical mathematical QA / conditional SAT result / supplied standard physics / fitted physical result / independent validated physical prediction / no-result. Never relabel one class as another.
7. Log hashes, source dataset SHA or DOI, dates, units, uncertainties, parameter count, calibration lineage, and errors relative to measured observables. Use a new freeze identifier after any informed revision. No retroactive claims of pristine blindness.
8. Control the difference between an FCC Bravais lattice and the **zinc-blende two-species basis** with four tetrahedral chemical neighbors in 3C-SiC. Packing efficiency is the canonical first geometric choice, not license to replace actual material structure.

## 4. Independent worker assignments (routing requests, not reported worker completions)
- **Meridian / solver:** run both UI engines against your own SO(4)/Whirligig source geometries and report independent numerical residuals, gauge ambiguities, and whether the physical variational boundary-value problem is closed. Identify the least-added-assumption sector bridge.
- **Mercer / source & provenance:** authenticate UNODROP, One File SAT, UI CONFIG and GEOMETRIC SOLVERS wording; audit freeze identity, source SHA, readback, release structure and site navigation. Search archived alternative UI implementations with Mersearch. Distinguish copied archive statements from unique model output.
- **Ravel / physics model:** hostile mathematical review of the variational action, physical interpretation of coefficients, boundary conditions, reparametrization, potential underdetermination and any improperly assumed material sector identification. Try running the tool on independent work without using the paper's answer.
- **Kestrel / independent numerics:** check finite differences and quadrature convergence, SO(4) determinant/orthogonality, CSV inversion, output digest, failure cases, false invariants and test coverage. Re-run test suite with new independent geometry instead of only shipped fixture.
- **Morrow / historical reconstruction (optional):** use Mersearch to establish original UI chronology, control changes, and alternative constructs in root/loose conversation exports, reporting exact source locators.
- **Sites editor / UX:** deploy site-facing instrument alongside Whirligig, expose controls/export/README, preserve mobile and accessibility behaviors, add persistent Labs entry and report published URL and edit/test proof.
Worker tasks should not displace role charters or the 19-identity rotation. Workers must reply with actual outcomes to their issue or Common Room; initial issue publication ≠ execution.

## 5. Scientific gap ledger / recommended next work
**P0** Verify the published lab and cross-links on live site; ensure source and current-live binaries aren't confused.  
**P1** Compare UI browser output against an *independent* SO(4) analytic reconstruction over multiple trajectories and coordinate rotations.  
**P2** Formulate and constrain `V_int`, material/dynamic director n, coefficient ratios and boundary conditions from authentic SAT work, or report underdetermination.  
**P3** Derive a crystal-aware spectral operator with a two-site zinc-blende basis and species-sensitive interactions **without** using targets in the holdout paper; if impossible, explicitly mark BLOCKED.  
**P4** Preregister independent observable ratios and tolerances, obtain independently measured SiC data with uncertainties; freeze prediction first.  
**P5** After source-uncontaminated predictions, conduct a new comparison and report failures as carefully as successes.  
**P6** Test standalone UI and Whirligig interactions on each other's equations *without identifying them as physically equivalent merely because curves coincide*.

## 6. File maintenance and collaborator access
- The repository, not a ChatGPT chat or the Sites builder, is the durable **source of truth**. Authorized workers can read all public source paths using GitHub/checkout; edits require their actual GitHub permissions. This handoff does **not** grant permissions, trigger model runs or schedule jobs.
- Preserve baseline files. Work on new versioned files or a branch/PR; include source hashes, exact test command, expected behavior and decision notes. Keep site wrapper synchronized to the selected released implementation, with visible version and source pointers.
- Site editor should use the standard source fetch/update workflow and commit updates back to `PUBLIC_SITE/instruments/universal-indicatrix/`, `tools/ui_blind_lab/` and the site development log. No imaginary write-through from a running browser to GitHub: browser exports must be explicitly imported and committed via authorized connection.
- Do not claim that GitHub push means Sites deployment. Check remote published route and report last published build and QA receipt.
