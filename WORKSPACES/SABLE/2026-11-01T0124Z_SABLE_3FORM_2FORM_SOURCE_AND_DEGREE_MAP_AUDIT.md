# Sable | 3-form / 2-form source genealogy and degree-map audit

**Nominal occurrence:** 2026-11-01T01:24:00Z  
**Run key:** `REVROT3-19-20261011:505:s2`  
**Automation:** `6abda4c8eda88191bf23a6f2849e9a17`  
**Execution run ID:** `a72c6eed-416c-832d-bea9-66033715eca5`  
**Started:** 2026-11-01T01:28:10.473700Z  
**Final scheduler observation:** IN_PROGRESS; completed_at null; chat_ref null.  
**Participation:** `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; not the authenticated historical Sable instance.

## Executive finding

The original 2025 *The Tourist Tailor* conversation establishes Nathan's direct editorial direction toward a 3-form treatment of the current/filament material. It does **not** establish that a 2-form is the Hodge dual of that 3-form, nor does it provide a 3-form-to-2-form projection/sweep map.

The phrase that the 2-form description is “its dual” appears in assistant-authored text. In four dimensions that statement is mathematically wrong if “dual” means Hodge dual: a 3-form Hodge-duals to a 1-form; a 2-form Hodge-duals to a 2-form.

The existing Sable Lean module correctly separates Hodge-dual degree from Poincaré-dual degree after a support sweep. It proves conditional degree arithmetic, not the physical sweep, its rank/regularity, or a physical SAT/H(s)H current map.

A new Mersearch lane-3 source crosswalk was submitted and is still running. No physical calculation, CODATA comparison, new Lean module, theory promotion, branch change, or automation change was performed.

## 1. Rotation, scheduler, and control preflight

`h=505`, `seq=5h+2=2527`, and `2527 mod 19=0`. The selected identity is Sable (ring index 0); next is Loom (index 1).

The :24 automation remains enabled with its exact original hourly America/New_York VEVENT and ID above. No prompt, ID, schedule, phase, or cadence change; no sixth task.

**Live scheduler discrepancy:** the current `ACTIVE_AUTOMATION_ROSTER.md` and Revival Rotation V3 describe five enabled leases, but direct scheduler readback shows the :12 task `6aa61b3b2e4081918927a35b61007acc` is disabled. The :00, :24, :36, and :48 tasks are enabled. This was not changed or “repaired”; no authority to re-enable a lease was exercised.

Current main at final branch inspection: `220d88584f2742e370d2c98d371e6cf929a78696`.

Current Sable work surfaces:
- PR #1098, `research/sable-current-support-degree-gate-20261030t0736z`, head `7666f2cb5b408be77e0c87f3b8ec18cc1950f55a`, base `infra/lean4-verification-20261023`, OPEN/DRAFT/UNMERGED; branch is 45 commits ahead and 5,655 behind current main. No rebase or merge.
- PR #1173, `research/sable-rotation-auditor-current-main-20261031t2136z`, head `1cc73c7497d995cc13d8cbe9ce499cdf5d5808f4`, OPEN/DRAFT/UNMERGED; branch is 3 ahead and 200 behind current main. Existing CI #41245634740 failed: 65 archive-source smoke checks and 24 self-tests passed, but full audit reported 661 errors and 1,026 warnings across 490 receipts, 324 handoffs and 39 out-of-band records. Loom's review shows these counts mix parser dialect gaps, context-only handoffs, amendments, retries/attempts and possible real integrity defects. PR #1173 was not edited or rebased.
- Older parser branch `research/sable-rotation-auditor-dialects-20261031t0236z` is 11 ahead / 1,228 behind current main; left untouched.

Controls read: live BEDROCK (blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`, all 568 lines); Steering Charter (blob `5f4263381afcb065e9062d5b5885593d0baa58db`); Three Paper Campaign (blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`); New Instance Start Here (blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`); onboarding review state (blob `fbecfbdd3e31797f5216ff5b13eee57337285c25`); Revival Rotation V3 (blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`); thread-routing and reentry controls; scheduler authority (blob `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45`); active automation roster; current workflow orientation; task/branch graph; Sable README/run dialect, checkpoint and inbox; prior Sable receipt/report; PR #1098 and PR #1173; Loom's current PR #1173 CI review and receipt.

## 2. Historical Sable source and charter qualification

Raw Sable source:
- Conversation: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, title “Revival Rotation”.
- Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/26.09.14•26.09.22•Revival Rotation — raw.json`.
- Git blob: `3bf173c217e0755419152aa2225f39713929a5fe`.
- Direct user-role message: `d3976dcf-c5dc-49c7-a523-e6469f4910db`, 2026-09-22T04:03:52.997Z. It asks for “big bites” using the sieve and Mersearch/Mercer_Searcher to bulk-triage and characterize.

That is the recovered direct process instruction. The broader systems-analysis/capability-architecture remit in the current Sable README and “Relay Auditor Field Dialect” run document is an assistant-authored continuity synthesis, not a verbatim Nathan-authored specialist charter. The current live Sable ChatGPT thread was not authenticated. Do not conflate ordinary Sable with A. Sable Meridian.

## 3. Original 3-form / 2-form conversation recovered

Raw source:
- Conversation: `68cad3d4-0ccc-8325-be36-94c5b5527997`, *The Tourist Tailor*.
- Raw path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/25.09.17•26.06.01•🪡 The Tourist Tailor [e-] — raw.json`.
- Git blob: `dd2b6141af86dea54e4ba2e782214128619ce78c`.

Direct Nathan user-role messages:
- `71da031e-5a0c-4408-bb9f-0b2cbbfdb6f0`, 2025-09-18T14:42:25.644Z: flags the shift between the earlier 2-form (J^{\mu\nu}) and introduced 3-form (J_{\nu\rho\sigma}), and asks that the change be made explicit.
- `5730114b-8327-4856-b4ec-3c3f98a7a551`, 15:08:14.620Z: asks why the 2-form was adopted and whether the whole book should be in 3-form.
- `f5f025e1-3b48-479f-8a94-b59db3b88312`, 15:10:27.444Z: asks whether dropping out of the 3-form obscures insights of the fundamental 3-form.
- `e92efb17-2499-482e-b930-9ad11221bd7c`, 15:19:27.048Z: directs rewriting chapters 1–5 in 3-form.
- `b85bff55-f8dc-465f-ad82-796a87181620`, 15:35:04.906Z: describes the Chapter 5 “wobble” and duplicate-frontispiece transition.
- `9dc27aac-b34d-46db-8bb1-be603ba3fb73`, 15:42:49.979Z: directs choosing the track that leads to 3-form.

These establish a direct editorial preference and a request to expose/fix the representational wobble. They do not themselves define a physical projection or composition map between a 3-form current and a 2-form current.

### Assistant-authored equations and wording — kept separate

- Assistant message `c3715...` at 14:35:58.320Z introduced (mathcal L_{top}=\frac{i}{2\pi}\theta\nabla_\mu\widetilde J^\mu) and a 3-form dual expression with a (1/2) coefficient. This is assistant-authored; the coefficient is not the standard 3-form Hodge coefficient.
- Assistant message `066ea8...` at 15:08:22.895Z explains the 3-form's dual as a vector and presents a 2-form as a familiar surface-flux representation. That explanation is assistant-authored.
- Assistant message `ff0ef513-0f75-4e87-a719-378447788b32` at 15:43:01.515Z uses the standard (1/3!) component factor for the dual vector, but then calls the 2-form description “its dual”. Those two statements are inconsistent in four dimensions.

The direct user message `71da...` quotes the earlier (1/2) expression while correcting the index/representation shift. The quoted formula must not be recast as an independently originated Nathan equation. The user-suggested 2-form expression (	heta\epsilon^{\mu\nu\rho\sigma}\partial_\mu J_{\nu\rho}) still has a free (sigma) index as written, so it is not a scalar Lagrangian density without an additional specified object/contraction.

The previous PR comment's wording that Nathan “explicitly declined to assert exact equivalence without a map” was an assistant-authored methodological gloss, not a verbatim 2025 user statement. The current 2026-10-26 direct instruction does require explicit projection/composition maps with conditions for proposed hierarchies; that is current method, not retroactive quotation.

## 4. Related SAT4D / SAT-O1 / Blockwave source crosswalk

### SAT4D Live Draft

- Path: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_LIVE_DRAFT.txt`.
- Git blob: `2a79fe25018cce7e99a2c33786d88b0551db6ae7`.
- Document byline: Nathan McKnight; internal draft dated June 2025. Byline/document authorship is not the same evidence class as a raw Nathan user-role message.

It defines:
[
J_\mu(x)=\left\langle\text{Filament Flux and Linking Density}\right\rangle_{\mathcal F(x)}.
]
The inhomogeneous Maxwell line is written:
[
\partial^\mu F_{\mu\nu}(x)=\mu_0\left\langle\text{Filament Flux Density}\right\rangle_{\mathcal F(x)}.
]
The right side has no displayed free (
u) index. Later the same symbol is reused as:
[
J_\mu(x)=e\bar\psi(x)\gamma_\mu(x)\psi(x),
]
without an explicit derivation identifying the filament-flux average with the Dirac current. These are source-level index/namespace and derivation gaps, not repaired equations.

The SAT-O1 section within the same draft describes 1D physical filaments embedded in 4D and a worldtube as a 4D volume swept by a vibrating filament. It does not itself supply the missing (J_3\to J_2) map. A separate small SAT-O1 4D extraction blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc` lacks a verified canonical path/date/author in this pass; Mersearch is tasked to resolve its lineage.

### Blockwave full-action reconstruction

- Raw conversation: `68f4d9b5-b908-832e-940e-6782db174a4a`, title “Full action definitions”.
- Raw blob: `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`.
- Assistant message: `3039b226-02d4-41a3-a2d3-c338e25204a9`, 2025-10-19T12:31:03.318Z, role assistant.

The message uses a conserved antisymmetric 2-form (J^{\mu\nu}), with (
abla_\mu J^{\mu\nu}=0), and a coupling (\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}). This is an assistant-authored later reconstruction. It is not Nathan Direct and does not supersede the September 18 direct 3-form editorial instruction.

## 5. Mathematical status and explicit map gap

Under the standard Hodge-star degree rule in four dimensions:
[
*:\Omega^3(M^4)\to\Omega^1(M^4),\qquad
*:\Omega^2(M^4)\to\Omega^2(M^4).
]
For a 3-form with the standard antisymmetric-component convention:
[
(*J_3)^\mu=\frac{1}{3!}\epsilon^{\mu\nu\rho\sigma}J_{\nu\rho\sigma}.
]
This is a standard mathematical identity, not a recovered SAT-specific equation.

Separately, under an oriented 4-manifold/current convention, the Poincaré dual of a (k)-dimensional support has form degree (4-k). Thus a 1D support has a 3-form Poincaré dual; a genuinely defined 2D swept worldsheet has a 2-form Poincaré dual. This is **not Hodge duality**.

The existing `SableCurrentSupportDegreeGate.lean` in PR #1098 encodes:
- Hodge degree (3\mapsto1) and (2\mapsto2);
- Poincaré-dual degree for supports;
- a conditional dimension increment for a sweep;
- the distinction between the Hodge dual of a 3-form and the Poincaré dual of a swept 2D support.

Its `sweptSupportDimension(k)=k+1` is arithmetic bookkeeping. It does not construct a sweep map, prove that the second tangent direction is independent, establish immersion/regularity, or identify the source/target currents. A future physical map must specify its domain/codomain, orientation, regularity/rank conditions, pushforward/pullback or contraction, composition law, and observable action. No such source-defined map was recovered in this run.

### Actual Lean verification

Existing PR #1098 exact head `7666f2cb5b408be77e0c87f3b8ec18cc1950f55a`; Actions run #41176686005 succeeded with 8,944 build jobs and 19 theorem-specific outputs. The retrieved complete log contains zero `sorryAx`. Standard dependencies occur in some outputs (`propext`, `Classical.choice`, `Quot.sound`). Tests, lint, nanoda and the separate automated axiom audit were not run. This is proof of the formalized degree/arithmetic statements only, not of a physical current map or empirical H(s)H validity.

## 6. Mersearch-first retrieval

The prior lane-3 Aldus WWRD request had a request-scoped manifest and both compact receipts, so lane 3 was reused without overwriting pending work. Lane 1 (Loom) and lane 2 (optics) remain requested without verified output manifests; lane 4 (Nadir) has its prior completed output.

New request:
- ID: `sable-j3-j2-original-source-crosswalk-20261101-0128`
- Lane: 3
- Request file: `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_3.json`
- Request commit: `f71146230ee96f73adb3069eb48c48fb251bd1cd`
- Workflow: discover #41261433163 SUCCESS; search #41261433182 was IN_PROGRESS at final inspection.
- No raw result payload is published. Do not duplicate or overwrite this request. Read its request-scoped manifest/receipts when the search run completes.

The query targets the original *The Tourist Tailor* conversation/message UUIDs, user-vs-assistant role-separated 3-form/2-form statements, SAT4D/SAT-O1, and Blockwave. It requests exact paths, repository commits, blob hashes, role/timestamp/parent context, verbatim equations, derivative relationships and explicit exclusions.

## 7. Public correction and durable work

An additive source-attribution correction was posted to existing PR #1098, comment #6551841849, and independently read back exactly. It corrects the assistant-vs-user attribution and Hodge-degree statement without editing prior history or creating a new issue.

No new branch/PR, no new Lean module, no upstream equation rewrite, no physical calculation, no CODATA comparison, no paper advancement, and no BEDROCK promotion.

## 8. Next cursor

1. Check Mersearch request `sable-j3-j2-original-source-crosswalk-20261101-0128` / run #41261433182 to terminal status; verify its request-scoped manifest and receipts before using any result.
2. Reconcile any newly recovered SAT-O1/Blockwave originals against the raw *The Tourist Tailor* messages, keeping direct user statements, assistant reconstructions, document bylines and standard mathematics separate.
3. If the source supports a concrete sweep/projection map, define its domain/codomain and geometric hypotheses before any further Lean formalization. Do not infer a 3-form-to-2-form Hodge map.
4. Keep PR #1098 and #1173 open/draft; no rebase/merge until their separate review gates are satisfied.
5. No physical calculation until a real measured system/dataset with provenance, units, uncertainties and prediction-vs-fit separation is identified. No data-free calculation without specific prior permission.

**No theory promotion. No scheduler mutation. No task or ownership transfer.**
