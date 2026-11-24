# Aldus h947:s2 | Source stratigraphy and workflow failure-stage audit

**Run key:** REVROT3-19-20261011:947:s2  
**Nominal slot:** 2026-11-19T11:24:00Z  
**Selection:** h=947; seq=5h+2=4737; 4737 mod 19=6, Aldus. Next ring label: Calder, index 7. Selection is a scheduler label, not authentication of a historical instance or thread.  
**Attribution:** source-grounded assistant reconstruction. No authenticated current Aldus thread or historical-instance participation is claimed.

## 1. Historical remit and source boundary

The September 12 Aldus check-in records the original September 8 user instruction as broad cross-reading, comparison across contexts, and combining information not usually combined. The check-in identifies direct user message `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` at 2026-09-08T04:17:24.363Z in conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, raw-export blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`. The detailed first-extant/first-public chronology and Bayesian convergence workflow are later worker specializations, not the original direct charter.

A fresh GitHub Contents retrieval of the stored raw-export path returned an empty body in this run, so no new raw JSON parse is claimed. The historical role is grounded in the source-genealogy record in `WORKSPACES/COMMON/ALDUS_CHECKIN_2026-09-12.md`. The Aldus BOOT pointer is h943:s3; CURRENT_WORK was stale at h909 and is refreshed separately.

The current Mersearch connector is not exposed as a callable action. The four existing request lanes were inspected before GitHub fallback. HSH_RESOURCES root README was read, but no private payload or quarantined PRIOR_ART material was opened.

## 2. Mersearch bridge: exact first-failure diagnosis

All four canonical request files still say `requested`. For each request, the three expected request-scoped outputs returned 404: `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json`, and `SEARCH_RECEIPT.md`. This is missing public readback, not proof that no search process ever ran.

| Lane | Request / request-file blob | Search run / job | Observed first failure |
|---|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` / `1774cfefe2dd0be5c1c5f4696cdc456d75ac4f6b` | [Run 41454976148](https://github.com/Satobloc/HsH/actions/runs/41454976148), job 125309252946 | Search ran, then runner shutdown signal at 15:21:48Z on Nov 2. The separate discover job succeeded; search did not. |
| 2 | `archive-harvest-20261025-optics-01` / `b7e0d432491962fcb5b8fd9cd5a6d08b7bf1bbe4` | [Run 40261929577](https://github.com/Satobloc/HsH/actions/runs/40261929577), job 121375960469 | Publication failed at `git push`: GH001 rejected `SEARCH_RESULTS.json` (352.48 MB) and `SEARCH_RESULTS.md` (59.64 MB). The workflow misclassified this deterministic size rejection as a concurrent-main update and repeated the push/rebase loop five times. The first retry's fetch found main already up to date. |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` / `bc585da224e66c11da4e71e1e8a17812142aa2bf` | [Run 41926373944](https://github.com/Satobloc/HsH/actions/runs/41926373944), job 126911731401 | Search ran until runner shutdown signal at 02:02:04Z on Nov 5. The separate discover job succeeded; search did not. |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` / `9249b3f3969a425c8e94554b8039a3b868200433` | [Run 41533820436](https://github.com/Satobloc/HsH/actions/runs/41533820436), attempt 2 job 126321885823 | Attempt 2 ended with runner shutdown signal at 04:59:48Z on Nov 4. Attempt 1 job 125580508897 also failed after a 5h17m interval; its log was not retrievable in this pass, so its precise failure stage is unclassified. The separate discover job succeeded; search did not. |

The current four bridge workflows contain the compact-only containment: raw result files are kept out of the repository publication step; only the run manifest and compact JSON/Markdown receipts are staged. The old Lane 2 GH001 run predates that patch. The Lane 1, 3, and 4 search runs postdate the patch but terminated before successful publication. There is therefore **no successful post-patch end-to-end search-to-receipt run**.

The current repair PR #2050 is open, draft, and GitHub reports it mergeable, at head `bab97632288e39d064ad8a7c200f2f7c16051252`, 11 commits ahead and 408 behind current main, with merge base `9743a5de5a830284ef76d96962cf061961315725`. It changes the four bridge workflows and adds the standard-library retry classifier plus regression tests. Its body reports a prior 9-assertion regression pass and bare-Git race simulation; those tests were not rerun in this pass. No merge, rebase, or controlled Mersearch test was performed.

The `discover` success checks are not search successes. No request was edited, overwritten, retriggered, released, or replaced; no fifth lane was created. WH-05 remains P1/HIGH and blocked pending Tern-controlled release of one lane and one small public-only controlled test. No new Mersearch execution was attempted.

## 3. P0 Code Grurple: path-level rebase preflight

Current HsH main observed at `6908af8ad96bc230c3ec9702125f71bde7b8ebbd`. PR #2009 remains open, draft, and unmerged at head `ee582b8de93f88f49445c211892529c40b47fded`, three commits ahead and 765 behind main, with merge base `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`.

The PR's three changed paths are byte-identical on current main and at the merge base:

| Path | Main blob | Merge-base blob |
|---|---|---|
| `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` | `36b2669c328466f0f579e188fbec5796d6ca44dc` | same |
| `tests/test_site_discovery.py` | `4d646dba614f50b912391c13cd516616700d2ac3` | same |
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` | same |

This is a bounded same-path content comparison, not a rebase test and not proof that all history/path operations are conflict-free. It is a useful clean-rebase indicator for the three touched files. No rebase, merge, deployment, route probe, or source repair was performed. Tern retains P0 reconciliation and release authority.

## 4. SAT-O / Blockwave source stratigraphy

The files are distinct source strata, not one canonical equation family.

### 4.1 SAT-O historical sources

**Nathan-byline draft:** `SATOBLOC/SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, title `SAT4D Canonical Summary`, author Nathan McKnight, date June 2025, explicitly marked DRAFT. It defines a 1D filament curve in 4D and gives the historical Lagrangian:

```tex
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

It calls the 4D volume swept by a vibrating filament a worldtube and later maps string-theory worldsheet dynamics to 4D worldtube structure, but supplies no sweep/thickening or composition map. The same historical draft says no external fields or forces are postulated. It contains no Kelvin-medium constitutive or signed-force law.

**Unbylined rewritten module:** `SATOBLOC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, first extant Git commit `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b` at 2025-10-27T00:40:28Z. It repeats the hyperhelical curve and the same Lagrangian. First extant commit date is not composition date.

**Separate SAT_O1 PDF:** the extracted-text record `_AUTO_EXTRACTED_TEXT/SAT_O1.txt` has blob `bd244e49c6b668a72131b4f195e32820d4540746`; it identifies source PDF SHA-256 `fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d`, extraction request `2026-09-10_root_pdf_extraction_pass_002`, and extraction time 2026-09-10T16:03:13.296783Z. The three-page document is titled `SAT20: Emergent 4D Filament-Surface Theory`. Its distinct filament action is:

```tex
S_{\text{filament}} = -T \int d\lambda \sqrt{g_{\mu\nu}v^\mu v^\nu}
```

It also defines a rank-one filament current and an emergent one-form/foliation. This is not the same document or equation set as the later hyperhelical SAT-O1 rewrite. The PDF's original composition date and author are not established by the extracted text.

### 4.2 September 16 Blockwave attachment and September 18 direct preference

The canonical raw conversation `🧶🧱SAT` is `68c990dd-df28-832e-b766-c267190aaffa`, raw export blob `fa2586add42b4d87afe89a5b00e1e48a01aaee54`, native raw JSON SHA-256 `c7eda5eb66a0daabd7e780d9695a610860ff60038f23d661fceefc7cabcd73f9`.

The uploaded `🧱BLOCKWAVE.txt` attachment is byte-identical to the HsH archived file:
- Attachment ID `file-LwaFTKkMemPPrLU4qCLpYB`.
- Tool-message timestamp 2025-09-16T16:31:34.670358Z.
- 25,255 UTF-8 bytes.
- File SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- HsH Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.

Its content author remains unknown; classification is USER-SUPPLIED-ARTIFACT / CONTENT-AUTHORSHIP-UNRESOLVED / NOT-NATHAN-DIRECT.

Verbatim rank-two current:

```tex
J^{\mu\nu}=\tfrac12\,\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma
```

Exact equation-string SHA-256: `1f4edaaeda6691caf331b0b760db642ec0314a69bad6e02095600820b9dd6cf5`.

The attachment also uses `\nabla_\mu J^{\mu\nu}=0`, a pure-gradient phase potential, and a winding statement. The source does not supply a typed map from the current 4D finite-core worldtube to this 2D worldsheet support, nor a Kelvin-medium constitutive law or signed-force response.

The Calder h947:s3 source report records direct user-role messages in the 2026-09-01 `NEWTO-SAT ChatGPT Voice Glitch` conversation as the source for Kelvin-vortex mechanics, or a timesheet-bound soliton approximating it, in the responsive medium. The raw export retrieval returned an empty body in this pass, so this is inherited source-ledger evidence, not a fresh raw parse. It is a physical requirement, not a force equation.

The September 18 `The Tourist Tailor` source genealogy records direct user correction of the rank mismatch and a direct preference for a 3-form treatment at 15:08:14Z and 15:19:27Z. The corrected assistant formula is:

```tex
\widetilde J^\mu = \tfrac{1}{3!}\epsilon^{\mu\nu\rho\sigma}J_{\nu\rho\sigma}
```

Exact corrected-equation SHA-256: `84479022ad5d98e154606803b3683f91718ab407f50e23393b3c154a16d76bfb`. The earlier assistant formula with `1/2` has SHA-256 `80f1d1b602dccd9d256b2758960f8515372918c8f430ed28a4418fef2e04abd7`. Keep the original J2 artifact and the later J3 preference/correction as distinct records; do not silently overwrite one with the other. In four dimensions these are distinct support strata, not Hodge duals of one another.

### 4.3 October 19 assistant composite action and separate scalar-sign correction

The separate `SAT—Blockwave Ideal Model.txt` attachment is file ID `file-V6J5EAkdfhUUJ56atLSpPN`, tool-message timestamp 2025-10-19T12:29:44.848Z, HsH blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`, first extant HsH commit 2026-10-08T02:42:49Z. Its content author and original creation date are unresolved.

Conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`, contains assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` at 2025-10-19T12:29:46.539Z. That assistant message generated a composite J2 action with an optional local symmetric kernel `M(theta,u)`. The later user-role re-paste at 14:49:49.632Z does not establish original authorship. The `M` term is a placeholder, not a constitutive law or signed-force equation.

For the separate `SAT—Blockwave Ideal Model.txt` scalar action, the historical source term is:

```tex
+ \frac{f^2}{2}\partial_\mu\theta\,\partial^\mu\theta
- \mu^4(1-\cos\theta)
```

The same file uses signature (-,+,+,+) and prints a positive canonical momentum/Hamiltonian. Aldus PR #1059 formalizes the source-level sign mismatch. A separate standard-sign repair candidate under that signature is:

```tex
- \frac{f^2}{2}g^{\mu\nu}\partial_\mu\theta\,\partial_\nu\theta
- \mu^4(1-\cos\theta)
```

This is a conditional convention repair, not source text, not a correction to the September 16 J2 attachment, and not a full-theory stability result. The potential identity `2 sin^2(theta/2) = 1 - cos(theta)` is a valid rewrite but does not change the kinetic sign.

A separate 3+1 NotebookLM/confidential-draft artifact and the `SAT Mark IV.2` assistant-generated psi-mode table are not source-authorized replacements for the original SAT-O or Blockwave equations. They are not used to fill the missing force map.

## 5. Formalization and physical limits

Existing exact-head Lean CI was reused, not duplicated:

- **Aldus PR #1059**, head `b2be6f474d2b554318c1ce0f155361d19905002c`, run [#40985335092](https://github.com/Satobloc/HsH/actions/runs/40985335092), job 123834914915, Lean 4.34.0 / Lake 5.0.0, 8,955 jobs. `AldusBlockwaveIdealSign` compiled four conditional sign-consistency propositions for the separate 3+1 scalar action. The theorem-specific reports list standard Lean dependencies. Global axiom audit, tests, lint, leanchecker, and nanoda were not run. PR #1059 remains open, draft, and unmerged.
- **Sable PR #1098**, current head `c990552e51d6c08547e69119823ac069b40d3802`, exact-head integration run [#43595807207](https://github.com/Satobloc/HsH/actions/runs/43595807207), job 132449915121, Lean 4.34.0 / Mathlib v4.34.0. The new `SableCurrentSupportDegreeGate` module built successfully at 8931/8948 and `SablePIVPlaneProjectionGate` at 8928/8948. The full repository build failed at `MovingPlaneTraceGeometry.lean` lines 72, 76, 80, 84, 96, 100, and 197 because definitions depend on noncomputable real division / slice functions but are not marked `noncomputable`. The failing file is not among PR #1098's three changed files; this is a repo-wide integration blocker, not evidence that the new degree module failed. The earlier successful run #41176686005 was on old head `7666f2cb5b408be77e0c87f3b8ec18cc1950f55a`, not the current head. The new module formalizes conditional support/Poincare-dual degree arithmetic, worldline 3-form, worldsheet 2-form, sweep and boundary degree relations, the distinction between Hodge duality and sweep, and a same-rank/different-support counterexample. The theorem-specific output lists standard dependencies; nanoda and automated axiom audit were skipped. PR remains draft/unmerged.
- **Sable PR #1135**, head `af66f06c6fcd842db7b72ff2c3aa66d3794d297d`, exact-head run [#41164589389](https://github.com/Satobloc/HsH/actions/runs/41164589389), job 124429317733, Lean 4.34.0 / Mathlib v4.34.0, 8,944 jobs. It compiles the conditional coordinate-covariant Hessian antisymmetrization used for the pure-gradient local-curvature audit. No `sorryAx` appeared in theorem-specific output; tests, lint, and automated axiom audit were skipped. PR remains draft/unmerged.

These are genuine compiled conditional mathematical results. They validate the formalized statements only. They do not construct the physical sweep, prove a global Poincare-dual current, establish a defect model, validate the Euclidean/Lorentzian map, derive a Kelvin-medium constitutive law, or establish SAT physics.

No new Lean module or theorem was created. No source-authorized map from worldtube to J2/J3 support, no medium constitutive relation, and no signed-force equation was recovered. The source-to-medium-to-force-to-observable chain therefore remains incomplete. No physical dataset was acquired, no physical calculation or fit was performed, and no CODATA numerical comparison was made. P2 remains HOLD.

The source audit's mathematical status is conditional. Lean checks only the formalized statements and does not establish the physical premises or the soundness of any proposed translation.

## 6. Project and upkeep controls

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY; Orson ownership protected.
- P2 measured-system geometry: HOLD.
- P3 full-theory paper: INCOMPLETE.
- November 9 minor gate: MISSED.
- November 30 major and December 14 full-theory gates: separate and not advanced.
- FIE last reviewed November 10; next review November 24, so the 14-day trigger is not yet due.
- Task graph remains ACTIVE_SEED, 16 declared branches versus 18 records; discrepancy unresolved.
- The last Aldus unrelated-reading cursor is TheTANGLE EOF at line 2262; no new reading quantum is claimed this run.
- Existing Math Hopper, Lean PR, and Whirligig documentation/PRs were checked; SciSpace is available but was not needed for this source/provenance audit. No new tool, fork, dependency, subscription, or cost was introduced.
- The four Mersearch requests remain requested. No lane was released.
- No HSH_RESOURCES private payload or quarantined PRIOR_ART was accessed.
- No task, task ID, schedule, phase, cadence, signet, or conversation name was changed.

## 7. Next action and handoff

Tern retains authority to reconcile PR #2009 and to release a Mersearch lane. The exact-path comparison suggests the three PR #2009 touched files have not drifted on main, but this is not a rebase or merge authorization. WH-05's next safe step is a Tern-authorized small public-only request after one existing lane is formally released, followed by full manifest/receipt/readback verification.

Next ring label is Calder. Calder's h947:s3 report and handoff already exist, so any packet from this delayed h947:s2 run is POSTSTART_OPTIONAL_CONTEXT_ONLY. No task, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.

No BEDROCK theory promotion, paper-gate advancement, physical prediction, or empirical claim was made.