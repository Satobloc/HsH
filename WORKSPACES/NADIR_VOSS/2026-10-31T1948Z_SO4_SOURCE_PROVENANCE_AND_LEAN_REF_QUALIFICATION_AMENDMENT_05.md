# Amendment 05 — permission gate, duplication, Run 141 source correction, and retry reconciliation
**Applies to:** `2026-10-31T1948Z_SO4_SOURCE_PROVENANCE_AND_LEAN_REF_QUALIFICATION.md` and Amendments 01–04.  
**Status:** additive correction; prior files preserved.

## 1. October 1 permission does not authorize the October 31 data-free calculation

A prior-conversation retrieval returned these user-role entries, but did not return the original conversation ID or message UUIDs:

- 2026-10-01T21:09:42Z: “Don’t be cautious — import and try. We’re experimenting”; “make playground for yourself”; explore old/new ideas and internal/external resources.
- 2026-10-01T21:20:42Z: permission to compile mathematics into a challenge and work toward an H(s)H trial Lagrangian.
- 2026-10-01T21:43:35Z: “Calculate boldly! Focus on the math” toward the H(s)H reformation.

The same retrieval identifies an assistant response at 21:16:20Z as the first available introduction of the particular SO(4) double-rotation affine-translation expression. The retrieved user-role entries do **not** specifically name either:
- (t(L)=\int_0^L e^{s\Omega}v\,ds), or
- the singular ω₁=0, ω₂≠0 return control.

No raw conversation ID/message UUID was recovered for the October 1 permission. This is prior-conversation retrieval, not a raw-export authentication.

The live BEDROCK/Steering rule requires **specific prior permission for the particular data-free calculation**; general permission to explore mathematics is insufficient. Therefore the October 31 receipt's statement that its SymPy calculation was permitted by the October 1 sandbox authorization is withdrawn.

**Correct classification of the October 31 reported SymPy operation: `PROTOCOL_VIOLATION / NOT_EVIDENCE`.** This is an authorization/evidence classification, not a claim that the algebra is false. The operation remains in the historical record and must not be promoted or cited as a new project result. No further data-free calculation was performed in this reconciliation.

The October 23 artifact below predates the October 25 specific-permission gate; this correction does not retroactively reclassify that earlier artifact.

## 2. The October 31 result duplicates an existing published sandbox result

The exact kernel-translation theorem and singular-generator boundary already appear in:

- `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-so4-kernel-translation-gate-20261023-001.md`
- Git blob: `3b49be0733d533a7504193d5f30ba437283a0d36`

That October 23 packet states:

\[
Q(L)=I\quad\Longrightarrow\quad t(L)=L P_{\ker\Omega}v,
\]

and the full-affine-closure condition, with rank-4, rank-2 and rank-0 controls. It includes a derivation, numerical output, and a complete Python/SciPy executable listing.

The October 31 report's invertible-generator identity and ω₁=0 singular control therefore **repeat an already-published result**. They are not a new theorem, new counterexample, or new independent confirmation. The October 31 receipt should be read as a provenance/CI audit with a duplicated, unauthorized calculation, not as a new mathematical result.

The October 31 report contains no Nadir-specific executable script, code hash, environment/version record, or stdout artifact for its claimed SymPy run. Its execution is not independently replayable from the durable record. The older October 23 Python/SciPy program does not substantiate a separate October 31 SymPy execution.

## 3. Run 141 antecedent: document recovered; author/role genealogy still open

The exact known-path source is now directly verified:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md`
- Git blob: `8b5b8768527dfff5b198e324b2f823257889f385`
- Document date: 2026-09-26.
- Status in source: `SANDBOXED / local formalization candidate`.

It contains the candidate oriented-similarity representation, the linear residual
\[
D_{\rm lin}(R)=(\log\sigma)^2+\|Q-I\|_F^2,
\]
and the quotient translation obstruction
\[
[t]\in\mathbb R^4/\operatorname{im}(I-L),
\]
with a projected representative on the stated candidate locus.

It does **not** contain the constant-generator integral (t(L)=\int e^{s\Omega}v\,ds) or the later kernel-projector return theorem. It has no raw conversation ID, message UUID, or outer role metadata. Thus the prior report's phrase “Run 141 antecedent unverified” was too broad: the **document-level D_lin/quotient antecedent is recovered**, while its original author/role/conversation genealogy and any deeper derivation remain unverified. Mersearch lane 4 remains the appropriate pending search for that genealogy.

The October 2 recovery pointer is also verified:
- `WORKSPACES/COMMON/NADIR_VOSS_30SEP_RECOVERY_POINTER_2026-10-02.md`
- Git blob: `ba933734058d48251eda04e24bb34f01af605655`.

## 4. Lean status: the existing theorem is narrower than the affine claim

PR #262 remains open, base `main`, head `infra/lean4-verification-20261023`, head SHA `61cc8b65ffed70296e0121dbae067892a79c81d4`.

The only PR-triggered run returned for that head was #40463470348. Its job #122053714715 checked out merge commit `44df186f012dbb3280790d2317498de8d1266b8b`, not the PR head. The log shows:
- Lean 4.34.0 / Lake 5.0.0;
- 8,943 build targets;
- `HsHVerification.NadirFrameTelescoping` built at 8926/8943;
- the separate nanoda and automated axiom-audit stages skipped;
- no theorem-specific `#print axioms` output for that module in the retrieved log.

The module's four theorems concern **discrete exact full-frame comparisons in one global group**: endpoint telescoping, closed-chain identity, and common-left-frame invariance. Its header expressly excludes claims about physical connections, measured transport, worldtube dynamics, or projected-bundle holonomy.

It does not formalize the continuous affine integral or the kernel-projection theorem. No exact-head build was found. The affine kernel theorem remains **NOT FORMALIZED IN LEAN**. No new Lean code or CI run was initiated in this reconciliation; Code Grurple remains an active higher-priority publication interlock, and the existing generic CI PR was not repurposed.

## 5. Mersearch lane accounting

Reuse of lanes 1 and 4 was valid because the preceding requests had request-scoped manifests and compact receipts:

- Prior lane 1: `morrow-br005-time-normal-source-20261031-1253`; manifest blob `f1b451d7bccd5dd8674f0fa6655dd603e4ca5253`; receipt blob `df77a9c8b6ae18c7c19b84f8fcb20617533ebdd6`.
- Prior lane 4: `ariadne-kirk-riley-source-lineage-20261031-1119`; manifest blob `570289e33370c94a46894ba43dc73589f68486b0`; receipt blob `b5ac3683e86310f00a8cb60cfeacb82296fa52a0`.

The new requests remain:
- Lane 1: `nadir-so4-original-source-geometry-genealogy-20261031-1944`, request commit `1a9032b4fc3fb30171e66135e988a7ad0461b848`.
- Lane 4: `nadir-sim4-closure-original-source-genealogy-20261031-1950`, request commit `68764b33b231a1032abbc669f23bddc9faeb2ae1`.

At this reconciliation, neither new request had a request-scoped manifest or compact receipt. Both remain `REQUEST_COMMITTED / SEARCH_EXECUTION_UNVERIFIED`. No hit count, result, or three-root search coverage is claimed. Do not overwrite or retry either request.

## 6. Same-occurrence retry and execution identity

Nominal slot: 2026-10-31T19:48Z; (h=499); (seq=2499); ring index 10 = Nadir Voss; next index 11 = Enheduanna.

The existing receipt records run ID `ced66a9c-a284-8320-876a-870671ab83b5` and first observed start `19:44:24.159756Z`. A fresh automation peek for the same run ID reported `started_at=20:11:45.341109Z`, with the same scheduled slot and the occurrence still in progress. The report, receipt, and handoff were already committed by 20:08:18Z, before this later start.

This is consistent with a retry/restart of the same nominal occurrence. The runtime exposes no separate attempt ID, so preserve both timestamps and do not invent one. This reconciliation is not a second Nadir research result.

## 7. Source and control boundaries

The raw 2024 `DIMENSIONAL GRAVITY` conversation was re-fetched:
- conversation ID `252d05c0-22ed-4ea2-a474-7966ab13145a`;
- blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`;
- user-role messages `aaa28bd9-07f7-4740-b878-b485d4db44d0`, `aaa2269b-7eab-4781-9454-647098d6747f`, and `aaa24791-27b2-4b58-8f1a-19ee7e30d650).

They support the static line/helix/plane intersection distinction and the statement that 4D filament interactions manifest as familiar 3D structures at a time surface. They do not mention SO(4), a Cartan connection, or stacked holonomy. This remains the correct Nathan-Direct boundary.

No authenticated active Nadir ChatGPT thread or raw Nadir conversation ID was found. The Nadir README is an assistant-authored workspace synthesis, not a verbatim historical specialist charter. The October 1 permission evidence is prior-conversation retrieval without raw ID/UUID.

Code Grurple remains ACTIVE. Paper A and B presentation gates remain pending; ordinary Nadir research stays backseat/hold. No theory promotion, manuscript change, new issue, new PR, branch change, physical calculation, new model inference, human-subject experiment, task/ID/schedule/phase change, or sixth automation.

**Supersession:** This amendment supersedes the primary report/Amendment 03 statements that the October 31 SymPy calculation was permitted by the October 1 sandbox authorization and that the Run 141 document-level antecedent was wholly unverified. All earlier artifacts remain preserved as historical records.
