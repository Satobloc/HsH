# Kestrel h1013:s3 continuation — observed-fiber uncertainty extension

**Nominal slot:** 2026-11-22T05:36:00Z  
**Continuation observation:** 2026-11-22T06:04Z  
**Run key:** `REVROT3-19-20261011:1013:s3`  
**Classification:** assistant-level, source-grounded Kestrel-label continuation. The existing h1013 publisher issue predates this invocation and was not duplicated. No authenticated current Kestrel thread or historical-instance participation is claimed.

## 1. Deterministic selection and historical role

- h=1013, measured from 2026-10-11T00:00Z to the nominal 2026-11-22T05:00Z hour.
- seq=5h+3=5068; 5068 mod 19=14.
- Selected label: **Kestrel**, index 14.
- Next label: **Meridian**, index 15.

Kestrel's historical source is the raw “Science Made Stupid” conversation, conversation ID `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. Four role-defining direct user messages were recovered: `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, and `f15aac1c-0a31-4e98-b461-6ca872035315`.

The historical remit is a trust-first cross-boundary synthesis companion, not a duplicate provenance tribunal or hostile-audit team. The direct instructions also say Nathan's stated knowledge is to be treated as hypothesis rather than settled fact, and that the companion should not interrogate every alternative by default. This is not permission to convert hypotheses into facts or suppress a material contradiction. No standalone signed Kestrel specialist charter or authenticated current Kestrel thread was found.

## 2. Existing h1013 artifact and source fidelity

The existing [h1013 issue #2324](https://github.com/Satobloc/HsH/issues/2324) was already present before this continuation. It records the original chain-aware fiber result and is PUBLISHED_VERIFIED. No duplicate issue was created.

The original SAT-O1 file was independently fetched from the SAT archive. Its Git blob SHA-1 matches the existing report:

- Path: `SATOBLOC/SAT O1 4D.txt`
- Git blob SHA-1: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- SHA-256 recorded in the published source audit: `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`
- FileIndex creation: 2025-06-07 08:38:16; last write: 2025-06-09 18:44:50
- First extant Git commit: 2025-10-27T00:40:28Z
- Unbylined historical module; an earlier conflicting creation date remains unresolved.

Verbatim SAT-O1 core equations:

```text
γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ - V_tension(γ)
φ_i - φ_j = 2πk/n
```

The displayed `γ^μ(λ)` is a one-parameter centerline. The file describes a worldtube as the four-dimensional volume swept by vibration, but supplies no finite-core thickening map in these equations.

The original Blockwave attachment was independently fetched from HsH; its Git blob SHA-1 also matches the published source audit:

- Path: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`
- SHA-256 recorded in the published source audit: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`
- Exact UTF-8 length recorded in the source audit: 25,255 bytes
- Attachment event: 2025-09-16T16:31:26.687Z
- First extant repository commit: 2026-10-08
- Assistant-voiced attachment; embedded authorship unresolved, not Nathan Direct.

Verbatim Blockwave equations:

```text
u^μ u_μ = -1
P^μ{}_ν = δ^μ{}_ν + u^μ u_ν
J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ
∇_μ J^{μν} = 0
A_μ(θ) = α_* ∇_μ θ
F_{μν}(θ) = ∇_[μ A_{ν]}(θ)
```

Here `θ` is the compact phase in the attachment, not the geometric angle `θ₄`. No corrected SAT-O1 or Blockwave equation is proposed in this continuation. Original equations remain separate from later corrections.

## 3. New architecture improvement: observation radii compose with the chain budget

The existing Kestrel PR #2323 composes Ravel's finite-chain approximation budget with a lossy upstream projection. It proves a deterministic decoder through (p) cannot satisfy both endpoint chain-error bounds when two exact outputs in one projection fiber are separated by more than (2E_n).

This continuation adds a distinct final-observation layer. Let:

- (F_n(x)) be the exact final output of the heterogeneous chain;
- (g(p(x))) be the deterministic approximate chain, with (p(x)=p(y)) on the relevant fiber;
- (E_n) be the existing recursively propagated chain-error budget;
- (o_x,o_y) be observed final outputs;
- (eta_x,eta_y) be deterministic metric radii satisfying (d(o_x,F_n(x))\leq\eta_x) and (d(o_y,F_n(y))\leq\eta_y).

The resulting observed-fiber bound is:

[
\boxed{d(o_x,o_y)\leq\eta_x+\eta_y+2E_n}
]

Therefore, an observed separation greater than (eta_x+eta_y+2E_n) excludes every deterministic decoder through that projection that is claimed to satisfy the chain contract for both inputs.

For a common endpoint radius (eta), the threshold is (2(E_n+eta)).

The new source-level Lean additions on the existing Kestrel branch are:

- `observedFiberSeparationBound`
- `noProjectionDecoderWithinObservedChainBudget`
- `noProjectionDecoderWithinObservedStagewiseBudget`

This is an asymmetric endpoint-radius refinement, not a duplicate of Nadir's existing `NadirRobustReadoutSeparation` result. Nadir already formalizes the baseline-Lipschitz tolerance threshold (K\varepsilon+2\delta) and its exact-fiber (2\delta) special case. Kestrel's extension composes endpoint observation radii with Ravel's heterogeneous finite-chain budget.

**Uncertainty boundary:** (eta_x,eta_y) are deterministic metric radii, not standard deviations, confidence intervals or independent Gaussian errors. Worst-case radii add linearly. A statistical application requires a separately calibrated covariance/coverage model; correlated common-mode uncertainty may make the radius bound conservative. No physical detector or instrument map is supplied.

## 4. Existing branch and verification status

Existing branch: `research/kestrel-chain-aware-fiber-bound-20261122t0536z`  
Existing PR: [#2323](https://github.com/Satobloc/HsH/pull/2323), OPEN / DRAFT / UNMERGED, no reviews.

The new source update was committed to that branch:

- Commit: `35974e297afc5657bd7bb28ab73e118e3e9078e2`
- Module blob: `23d52dfee3c7b62686e147d550fdf21c23c2ef04`
- File: `FORMAL_VERIFICATION/HsHVerification/KestrelChainAwareFiberBound.lean`
- Exact branch readback: matched the new blob and all three new declaration names.

A successful earlier Actions run, [#44991487462](https://github.com/Satobloc/HsH/actions/runs/44991487462), job `137113297269`, compiled the prior chain-only module:

- Lean 4.34.0 / Lake 5.0.0.
- 8,958 build jobs successful.
- `KestrelChainAwareFiberBound` built at 8,953/8,958.
- The checkout was `refs/remotes/pull/2323/merge`, with source commit `c40dc8dc9c81ad8de16d65eaeaa3b80b1742e125`; this was a merge-reference integration build, not an exact-head checkout of PR head `9786113f868d8291d4567948cfced96d2bc50ea3`.
- The new observation-radius declarations were not yet present in that build.
- Tests, lint, nanoda and the separate automated axiom audit were skipped.

**New observation-radius declarations: NOT COMPILED / NO AXIOM REPORT.** The connected Actions interface exposed no run for commit `35974e297afc5657bd7bb28ab73e118e3e9078e2`; the local container has no Lean, Lake or Elan. The head's visible status check is an unrelated Vercel free-deployment-rate-limit failure, not a Lean result. Do not report the new theorem as verified. No rebase, merge or review was attempted.

## 5. Mersearch and source-access limits

The current Mersearch start guide requires a three-repository search and forbids overwriting occupied request lanes. All four request files remain `status=requested`. Lane 2 has a compact manifest/receipt for an unrelated perceptual-nexus query; Lanes 1, 3 and 4 have no request-scoped manifest at the expected path. No lane was changed, released, retriggered or repurposed. No local pinned three-repository checkout or callable Mersearch action was available. GitHub source retrieval was a bounded fallback, **not a Mersearch run**. No HSH_RESOURCES private payload was accessed.

Existing Ravel PR #2309, Nadir PR #1189, Kestrel PR #2323, Math Hopper #578 / PR #991, and Whirligig Kernel 0 were checked as existing infrastructure. No new tool, dependency, fork, subscription or expense was introduced.

## 6. Empirical and campaign boundary

No physical system was selected. No measured dataset, units/covariance, calibrated geometry-to-instrument map, fit, independent prediction, holdout or falsification threshold was produced. No H(s)H physical equivalence or independent measurement is claimed. P2 remains HOLD.

Campaign status remains: P1 Nov 9 MISSED / Orson-owned; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE. FIE's next-review date is recorded inconsistently as November 24 and December 4 in current Kestrel surfaces; neither date is due on November 22. Shared unrelated-reading cursor remains 3086; no duplicate break was performed.

## 7. Succession and scheduler preservation

Next deterministic ring label: **Meridian**, index 15. Meridian's protected P0 Paper A presentation remit remains in force. No assignment, packet, response obligation, direct-thread delivery, consumption, acknowledgment or ownership transfer is claimed.

The existing :36 task remains enabled with its exact task ID `6a9f52b69ec08191b0a2ba24a074f781`, original hourly DTSTART/RRULE, prompt and Lane Charter 36 phase unchanged. No sixth task, task/ID/cadence mutation, signet or conversation rename.

The scheduler's current run record at the last observation was IN_PROGRESS with `chat_ref=null`; its cached latest result belonged to the preceding h1012 Elias Kern run, not this Kestrel-labelled slot.

**Next exact cursor:** obtain a Lean 4.34.0 build of commit `35974e297afc5657bd7bb28ab73e118e3e9078e2`; inspect theorem-specific axiom output; independently review the asymmetric-radius composition; then decide whether to integrate with Nadir's existing robust-readout theorem. Do not select a physical system or claim an H(s)H prediction until source-grounded maps, compatible units/metrics, measured data, covariance, calibration and untouched holdout are available.


## Scheduler observation (final peek)

- Existing task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled = true.
- Exact saved schedule: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`. Prompt and Lane Charter 36 phase unchanged.
- Current run ID: `d92a64e2-7fdc-832d-b617-7d3e0958a1f2`; scheduled_for `2026-11-22T05:36:00Z`; started_at `2026-11-22T06:04:09.698256Z`; observed status IN_PROGRESS; completion null; `chat_ref=null`.
- Cached latest result run ID: `35d58a00-d208-8322-8ab2-8f9ec7d0756e`, created 2026-11-22T04:49:27Z, for the prior 04:36Z slot. Its h1012 Elias Kern content is not attributed to this Kestrel-labelled run.
- No task, ID, cadence, prompt, phase, or enablement change was made. No sixth task.


## Amendment 01 — Lean namespace-placement failure and correction

The first observation-radius source commit `35974e297afc5657bd7bb28ab73e118e3e9078e2` triggered [Actions run #44992445891](https://github.com/Satobloc/HsH/actions/runs/44992445891), which failed while building `KestrelChainAwareFiberBound`. The log shows the new declarations had been appended after the module's `end HsHVerification.KestrelChainAwareFiberBound`; consequently `exactIter`, `finiteChainProjectionErrorBound`, `errorBudget` and related namespace declarations were unavailable. This was a source-placement error, not a counterexample to the inequality.

Corrected the existing branch by moving the three new declarations inside the namespace, before the final `end`:

- Corrected commit: `e2e82c500b558d006abcf85271dde4a6aadeb7c0`
- Corrected module blob: `153c71e06c41636219d50e39bd40f2dad0b834fb`
- Exact branch readback: matched the new blob; the final namespace terminator now follows all three declarations.

No Lean run is yet exposed for corrected commit `e2e82c500b558d006abcf85271dde4a6aadeb7c0`; its visible combined status still shows only the unrelated Vercel free-deployment-rate-limit failure. Therefore the corrected declarations remain **NOT COMPILED / NO AXIOM REPORT**. The failed first attempt remains part of the record; it is not relabeled as a successful build.


## Amendment 02 — exact raw equation transcription correction

A source-string comparison found that the earlier displays labeled “verbatim” in this report and the parent issue #2324 were **normalized mathematical transcriptions, not verbatim source text**. Their mathematical rendering was broadly recognizable, but LaTeX commands, delimiters, spacing, and in the Blockwave projector even an index position were silently normalized. Withdraw the “verbatim” label for those earlier displays. The following raw source lines are the exact retrieved text.

### SAT-O1 raw LaTeX (source lines 21, 28, 38, 42, 56)

```latex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
\phi_i - \phi_j = \frac{2\pi k}{n}
```

### Blockwave raw source (source lines 9, 13–28, 31, 64)

The opening definition line is preserved exactly:

```text
Let g_{\mu\nu} be the emergent metric, u^\mu the unit time–flow (u^\mu u_\mu=-1), \theta a compact phase (\theta\sim\theta+2\pi). Define the spatial projector P^\mu{}^\nu\!\equiv \delta^\mu{}^\nu+u^\mu u_\nu. Let J^{\mu\nu} be the conserved two-form “filament worldsheet” current (distributional on physical filaments), \nabla_\mu J^{\mu\nu}=0.
```

The complete compact-action block is preserved without repairing its original tokens:

```latex
\boxed{
\begin{aligned}
S \;=\; \int d^4x\,\sqrt{-g}\;\Big[
&\; \frac{M_{\rm P}^2}{2}\,R
\;+\; \underbrace{\frac{f_\theta}{2}\,\nabla_\mu\theta\,\nabla^\mu\theta \;-\; \Lambda_\theta^4\big(1-\cos\theta\big)}{\text{compact phase (elastic + compactness)}}
\\[2pt]
&\;+\; \underbrace{\tfrac{c_1}{2}\,P^{\alpha\beta}P^{\mu\nu}(\nabla\alpha u_\mu)(\nabla_\beta u_\nu)
\;+\; \tfrac{c_2}{2}\,(\nabla_\mu u^\mu)^2}{\text{time–flow elasticity (Lorentz-safe sector)}}
\;+\; \lambda\,(u^\mu u\mu+1)
\\[2pt]
&\;+\; \underbrace{\tfrac{\kappa_0}{4}\,J_{\mu\nu}\,P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,J^{\rho\sigma}
\;+\; \tfrac{\kappa_2\,\ell^2}{4}\,(\nabla_\alpha J_{\mu\nu})\,P^{\alpha}{}{\beta}P^{\mu}{}{\rho}P^{\nu}{}{\sigma}\,(\nabla^\beta J^{\rho\sigma})}{\text{filament spectrum: flex/twist/coil}}
\\[2pt]
&\;+\; \underbrace{\frac{g_h}{2}\,F_{\mu\nu}(\theta)\,J^{\mu\nu}}{\text{holonomy–trace coupling}}
\;+\; \underbrace{\frac{1}{2}\,J{\mu\nu}\,\mathcal{M}^{\mu\nu}{}{\rho\sigma}(\theta,u)\,J^{\rho\sigma}}{\text{mixing / medium response}}
\Big].
\end{aligned}
}
```

The exact source definition and implementation-note lines are:

```text
F_{\mu\nu}(\theta)\equiv \nabla_{[\mu}A_{\nu]}(\theta), with A_\mu(\theta)\equiv \alpha_*\,\nabla_\mu\theta. Because \theta is compact, \oint A\cdot d\ell\in 2\pi\mathbb{Z}; this drives quantization by holonomy.
Conservation of J: enforce with J^{\mu\nu}=\tfrac12\,\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma (compact 1-form B) or via a lattice integer current; both keep \nabla_\mu J^{\mu\nu}=0 automatic.
```

The original Blockwave source therefore contains apparent notation/transcription irregularities, including `P^\mu{}^\nu` (upper second index), `\nabla\alpha`, `u^\mu u\mu`, `P^{\mu}{}{\rho}`, and `J{\mu\nu}`. These are preserved as source text, **not silently repaired**. No corrected equation is proposed here. Any later correction must be separately labeled, justified and dated.

The current Git blob SHA-1 values were independently re-fetched and match the prior source audit: SAT-O1 `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; Blockwave `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. SHA-256 values and historical FileIndex/attachment dates remain those recorded in issue #2324; this continuation did not recompute those SHA-256 values or independently recover the FileIndex/attachment timestamp source.


## Amendment 03 — explicit triangle-chain correction

The corrected-namespace commit `e2e82c500b558d006abcf85271dde4a6aadeb7c0` triggered [Actions run #44992923239](https://github.com/Satobloc/HsH/actions/runs/44992923239). The module reached Lean 4.34.0 compilation, but failed at line 191 because the nested `add_le_add_left` proof did not match the intended parenthesized inequality. The failed elaboration's `#print axioms` output included `sorryAx` for the new declarations; those are failure artifacts, not a valid axiom audit, and must not be presented as a successful proof.

Replaced the ambiguous nested placeholder proof with an explicit intermediate triangle inequality:
`dist (decoder (p x)) observedY ≤ dist (decoder (p x)) (exactIter A S n y) + dist (exactIter A S n y) observedY`,
then explicitly lifted it through the two additive contexts.

Current corrected source commit: `c0ebc000c9fa63d32d825f9fd5347c0e9872f1db`  
Current module blob: `aef1437bb94fca24827f8527b11acc66b81efb8f`  
Exact branch readback: confirmed.

No Actions run is yet exposed for `c0ebc000c9fa63d32d825f9fd5347c0e9872f1db`. The new declarations remain **NOT COMPILED / NO VALID AXIOM REPORT**. Both failed runs remain recorded; no successful proof is claimed.


## Amendment 04 — three-repository onboarding and Mersearch boundary

The current HsH onboarding/preflight, three-repository onboarding, revival reentry protocol, Mersearch worker start guide, Steering Charter and campaign were read. The SAT archive root README and generated `..findex.txt` (generated 2026-11-20T17:54:09Z) were also read. The SAT README directs AI visitors to welcome documents in an `AI` folder, but the current generated index does not expose a top-level `AI/` directory and the candidate `AI/README.md`, `AI/START_HERE.md`, and `AI/Welcome.md` paths return 404. Treat this as an unresolved navigation pointer, not proof that no welcome material exists.

HSH_RESOURCES root README and `indexes/AI_START_HERE.md` were read. They explicitly mark HSH_RESOURCES as private reference infrastructure and prohibit public HsH/archive dependencies on private URLs. No private payload was opened or used.

Mersearch's start guide and all four request files were checked. All four remain `status=requested`; Lane 2 has a compact manifest/receipt for an unrelated perceptual-nexus request. No callable Mersearch action or local pinned three-repository checkout was available. No request lane was changed or retriggered. GitHub retrieval remains a bounded fallback, not a Mersearch search.


## Amendment 05 — corrected-commit Lean run in progress

A new existing-PR workflow run is now exposed for corrected commit `c0ebc000c9fa63d32d825f9fd5347c0e9872f1db`: [Actions #44993217910](https://github.com/Satobloc/HsH/actions/runs/44993217910), job `137118634438`. The job has completed checkout and Lake dependency-manifest generation; Lean 4 compilation is IN_PROGRESS. No success, theorem-specific axiom output or exact-head status is yet available. The run is an existing PR workflow; its checkout mode must be read from the completed job log before describing it as head-only or merge-reference.
