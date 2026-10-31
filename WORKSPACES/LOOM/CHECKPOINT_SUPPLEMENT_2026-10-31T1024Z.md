# Loom :24 source-genealogy and exact-phase proof supplement

**Run:** `REVROT3-19-20261011:490:s2`  
**UTC hour:** 490; `seq=5*490+2=2452`; `2452 mod 19 = 1`  
**Selected:** Loom (index 1). **Next:** Aster (index 2, s3 / :36).  
**Identity:** deterministic role selection only; no historical Loom instance/thread authenticated.

## 1. New source checks

### 1.1 The 0.246-rad Page One paste

The raw conversation is **“0.239 Radians in Science”**, conversation UUID `699e4a02-26e4-832a-86ea-ad1dcaf3c4e3`.

- Full 812-node HsH export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.02.24•26.09.08•0.239 Radians in Science - raw (1).json`, Git blob `8c87b92285f87ed3865fc1577a7a81b0661452b2`. The Contents connector returns an empty body for this oversized object; this is not an empty source.
- Equivalent SAT_CONVOS_13 export: blob `8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3`; existing source audit reports the same 812 message IDs, roles, content and timestamps.
- Earlier 100-node SAT_CONVOS_7 prefix: blob `67702fc58b0efce1d0f89d950b86a8819a189afb`.
- Inspected message: `15338421-a5e7-4538-879a-d25d840d2bdd`, outer role `user`, timestamp `2026-02-25T01:12:37.975Z`, 12,777 characters; message SHA-256 `a755b0ed1d19e761cf950280951cc0cad256581bdd8ac3220de1d95812773a41`.

That user-role message contains a document headed “Page One: SAT - Ontology and Unified Action” with an optical `Delta-phi ~= 0.246 rad` passage. Classification remains **NATHAN-SUPPLIED / EMBEDDED-DOCUMENT-AUTHORSHIP-UNRESOLVED**. The outer user turn is Nathan's communicative act; it does not establish authorship of the embedded equations.

The same pasted document contains two current ranks in separate action blocks: a 3-form `J_{μνρ}` and a 2-form `J^{μν}`. No source-defined projection, contraction, integration, or composition map between them is supplied.

The exact first-person objection “This keeps coming up, and it has to be wrong” was **not** found in the inspected 100-node prefix. Do not generalize that negative result to the inaccessible remainder of the 812-node export.

### 1.2 Compiled objection witnesses

The objection occurs in:

- `SAT_THEORY_ARCHIVE_2023-25/HsH SAT 2026 ROUNDUP/SAT RADIAN LEAP.txt`, blob `166a63dab3d435686282ea1c426a0c618944ba3f`, 17,518 characters.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/4DHHUC—DISCUSSION.txt`, blob `22b3dcc3194d89a4a90badbee7c22dc9588613b7`, 194,105 characters.

The HsH dump and SAT archive copy of the 4DHHUC discussion have the same Git blob SHA and are byte-identical: one witness, not independent corroboration. SAT RADIAN LEAP is a separate compiled text artifact, but neither compiled file provides a raw message UUID, role tag, or authenticated speaker boundary for the objection. Status remains **COMPILED-TEXT / SPEAKER-UNVERIFIED**.

### 1.3 Mersearch-first request

The Mersearch guide and all four request lanes were inspected before reuse. Lane 3's prior Enheduanna request had a completed workflow (#41153329931, success) and request-scoped manifest/receipt; its prior output remains preserved. Lane 2 still lacks a verified output. Lanes 1, 3 and 4 had completed outputs and workflow readbacks.

A new, narrowly scoped request was submitted in the verified-complete lane 3:

- Request ID: `loom-optical-kink-objection-origin-20261031-1024`
- Request commit: `9f59266de8e09c31f32e3cc0ee348c5de1379c9e`
- Workflow: [#41192852584](https://github.com/Satobloc/HsH/actions/runs/41192852584)
- Status at checkpoint: **IN_PROGRESS / SUBMITTED_NOT_VERIFIED**.
- Search scope: SAT_THEORY_ARCHIVE_2023-25, HsH, HSH_RESOURCES.
- Target: original raw conversation/message UUIDs, role, timestamp and context for the objection and adjacent optical claims; distinguish raw turns from compiled documents and pasted content.

No new request should be submitted for this target while #41192852584 is pending. No raw Mersearch results are claimed.

## 2. SAT-O / Blockwave source stratigraphy

### 2.1 Historical SAT-O O1

The O1 module is preserved in three archive files:

- `SATOBLOC/SAT4D_LIVE_DRAFT.txt`, blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`; header says June 2025 and gives a document-level Nathan McKnight byline; archive commit 2025-10-27.
- `SATOBLOC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; standalone heading differs, but its O1 body is identical to the live-draft O1 section.
- `SATOBLOC/SAT O MODULES -- ALL MODULES LaTeX MARKUP.txt`, blob `f351fdb9518c9f98aa8b0f5f3485ec3e9c39d6fb`; its O1 body is also identical after its wrapper heading.

These are one O1 text lineage, not three independent sources. The standalone and bundle files have no independent date/byline. The historical O1 equations are:

\[
\gamma^\mu(\lambda)=
(\lambda,A_x\sin(k_x\lambda+\phi_x),
A_y\sin(k_y\lambda+\phi_y),
A_z\sin(k_z\lambda+\phi_z)),
\qquad
v^\mu=\frac{d\gamma^\mu}{d\lambda},
\]
\[
S[\gamma]=\int d\lambda\,L,
\qquad
L=\frac12 m v^\mu v_\mu - V_{\rm tension}(\gamma).
\]

This is the historical ℝ^{3,1} / Minkowski formulation, not the current ++++ BEDROCK baseline. The July 2025 `SAT4D_6.txt` directives (blob `167136...`) describe a 4D manifold, 1D filaments and 3D wavefront; they label further behavior tentative.

The live draft's early EM passage defines a one-index flux average `J_μ = <filament flux and linking density>`, but displays an inhomogeneous Maxwell equation with a scalar RHS:
\[
\partial^\mu F_{\mu\nu}
=\mu_0\langle\text{Filament Flux Density}\rangle.
\]
As written, the right side lacks the free `ν` index. A type-consistent proposed repair is
\[
\partial^\mu F_{\mu\nu}=\mu_0 J_\nu,
\]
with `J_ν` explicitly defined as a covector current. This is a correction, not the verbatim source equation. A later QED section gives `J_μ=e\bar\psi\gamma_μ\psi` and the index-consistent RHS `\mu_0 e\bar\psi\gamma_ν\psi`, but does not derive that spinor current from the earlier filament-flux average.

### 2.2 Blockwave J2 source

The 2025-09-16 conversation `68c990dd-df28-832e-b766-c267190aaffa` contains a user-supplied `🧱BLOCKWAVE.txt` upload message `0f3707aa-c0ae-4bb1-bc59-6333c025cf1c`, timestamp `2025-09-16T16:31:34.670358Z`, legacy file ID `file-LwaFTKkMemPPrLU4qCLpYB`. The extraction ledger records SHA-256 `3d393...` and HsH archive-copy blob `ffdb8...`. The upload establishes user supply, not embedded content authorship.

A separate 2025-10-19 assistant-role action is in conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, raw blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`:

- User request `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a`: 2025-10-19T12:29:41.119Z, asks for the full action/definitions.
- Assistant action `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`: 2025-10-19T12:29:46.538Z.

The assistant action uses the rank-two current:
\[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}
\nabla_\rho B_\sigma,
\qquad
\nabla_\mu J^{\mu\nu}=0,
\]
and defines
\[
A_\mu=\alpha_*\nabla_\mu\theta,
\qquad
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]}.
\]
It couples `F_{μν}J^{μν}`. This is an assistant-generated action, not Nathan Direct. The separate `SAT—Blockwave Ideal Model.txt` archive extraction is empty; Library tether snippets expose an overview, but full standalone bytes and author/date metadata were not recovered.

### 2.3 Exact-phase consequence and its limits

For a smooth real-valued 0-form and constant `α`, exterior calculus gives:
\[
d(\alpha\,d\theta)=0.
\]
On a torsion-free connection, the source's antisymmetrized covariant derivative maps to this exterior derivative. The source's compact/circle-valued phase can nevertheless have nontrivial global periods on a non-simply-connected domain while local curvature remains zero. The proof does not rule out global winding, flat holonomy, defects, or bundle structure.

A possible repair for nonzero local curvature is an independent 1-form connection `A` with `F=dA`, or an explicit singular/defect construction. These are proposals, not source equations or Nathan Direct corrections.

The separate 2026 Page One paste's `J_{μνρ}` is rank three. In four dimensions Hodge star maps 3-forms to 1-forms and 2-forms to 2-forms; it does not directly identify J3 with J2. Any contraction/projection (for example with a specified vector) needs an explicit map and conditions. No such source map has been recovered.

## 3. Lean result

Existing draft PR [#759](https://github.com/Satobloc/HsH/pull/759), branch `research/loom-embedded-notebooklm-span-20261027t1512z`, was extended in place; no new branch or PR.

- New theorem: `constant_smul_exact_phase_has_zero_field_strength` in `LoomSAT4DCurrentTypeGate.lean`.
- Exact PR head: `2c371f7269a728a647dd04a52b868c3d99aa7f13`.
- Exact-head CI: [#41193158202](https://github.com/Satobloc/HsH/actions/runs/41193158202), job `124513894880`, **SUCCESS**.
- Lean 4.34.0 / Mathlib v4.34.0; 8,951 build jobs.
- Theorem-specific axioms: `propext`, `Classical.choice`, `Quot.sound`.
- Complete compiler log: zero `sorryAx`.
- Tests, lint, nanoda and automated axiom audit skipped.
- PR remains open, draft, unmerged; independent review not established.

Lean verifies the formalized exterior-calculus statement only. It does not establish the soundness of the transcription, torsion-free source assumptions, physical premises, a measured effect, or H(s)H truth.

## 4. Publication and Factory boundary

The earlier source-genealogy issue #1093 remains **PUBLISHER_REJECTED / DESTINATION_NOT_PUBLISHED** after its SHA mismatch. It was not retried or duplicated.

A distinct public-safe formal-proof summary was submitted through the existing HsH issue publisher:

- Issue #1146.
- Submission ID `loom-blockwave-exact-phase-20261031t1024z-s2-001`.
- Content SHA-256 `b4698c7f638fce9c5671b79788422e74dde611d9a40b109ac9e102847f33722f`.
- Expected destination: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-blockwave-exact-phase-20261031t1024z-s2-001.md`.
- Status at checkpoint: **SUBMITTED_NOT_VERIFIED**; issue creation is not publication. Verify the Action comment, workflow conclusion and exact file readback before changing status.

Factory Floor README and TODO were read. No independently verified machine-readable intake endpoint or allocated Floor ID was found. No direct Factory Floor write or delivery is claimed. A Loom `FACTORY_HANDOFF_PENDING` packet will preserve the proof identity and limits.

## 5. Controls and next cursor

- Existing :24 automation remains enabled, original task ID and hourly :24 America/New_York phase unchanged; no sixth task.
- Main branch was used only for the new Mersearch request and append-only Loom/Common records. PR #759 remains isolated on its existing branch.
- `TASK_BRANCH_GRAPH.json` remains an older 2026-10-30 seed without a Loom node; it was not rewritten.
- Code Grurple remains ACTIVE; no renderer/site changes.
- No physical calculation, observed dataset comparison, CODATA comparison, theory promotion, BEDROCK edit, or paper-gate advancement.
- The current h=490 s1 Sable run was still in progress at the last check; no predecessor handoff was assumed.
- Next: verify Mersearch #41192852584 and publisher issue #1146 before any new request or duplicate submission; then pass optional context to Aster (h=490 s3). No Aster-thread delivery or acknowledgment is claimed.
- FIE rereview not due. Unrelated reading break was completed in the prior Loom run; not repeated.


## 6. Source-file identity correction (same run)

The complete Git tree was checked rather than relying on filename search snippets.

- Exact SAT-O directives blob: `SAT 4D Theory Work/SAT4D_6.txt` = `167136310cdf33ca8f986f33634692314c1a0946` (2,881 bytes; document date July 2025).
- Exact user-supplied Blockwave artifact: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` = `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` (25,255 bytes). The earlier extraction ledger records SHA-256 `3d393...`; content author remains unresolved.
- Exact separate overview attachment: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT—Blockwave Ideal Model.txt` = `dd0631bc0b25c951dc5e1d6738280e08487b46b2` (57,801 bytes). The Git tree confirms the file is not empty. The Contents API returned an empty body, while a Library tether in “The Tourist Tailor” exposes an opening excerpt; the full standalone bytes were not recovered. The earlier phrase “empty extraction” means only that the connector body was empty, not that the archived file is empty.
- A separate 1,253,957-byte `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE.txt` exists (blob `f7cd89d9b9d40efd91d31c538d7436847173eea9`); it is not the `🧱BLOCKWAVE.txt` attachment cited by the 2025-10-19 assistant response.

The 2025-10-19 assistant message cites `🧱BLOCKWAVE.txt` and `SAT—Blockwave Ideal Model.txt`. Its displayed action is a cleaned-up assistant re-output of the J2 action present in the user-supplied `🧱BLOCKWAVE.txt` artifact, not an independent equation witness. The source artifact's embedded author remains unresolved; the assistant response is not Nathan Direct. The two file IDs in the 2025-10-19 retrieval are separate attachment references, but no evidence here establishes a new independent authoring event.

This correction supersedes only the incomplete/truncated file-hash and “empty extraction” wording above; it does not change the mathematical or attribution conclusions.


## 7. Exact-hash and CI-ref completion

The 2025-09-16 `🧱BLOCKWAVE.txt` upload's full content SHA-256 is `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`; its exact HsH archive Git blob is `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`. The two bytesets are verified identical by the existing Loom extraction ledger.

The exact PR #759 merge ref tested by CI #41193158202 is `21f7edf61e8e1c3adc8ebb5455414849e67fab1b` (merge of PR head `2c371f7269a728a647dd04a52b868c3d99aa7f13` into base `a650534ce484ff56f0cdfe831cba6bfada3e0dc7`). The Factory handoff packet was corrected to this exact merge-ref SHA; the earlier placeholder value in its first version is superseded.


## 8. Newly consumed Sable handoff: Nathan Direct 3-form editorial decision

The completed h=490 s1 Sable receipt and optional handoff were read. The handoff identifies a stronger primary source for the J3/J2 history than the 2026 Page One paste.

Canonical raw conversation:
- Title: “The Tourist Tailor [e-]”.
- Conversation UUID: `68cad3d4-0ccc-8325-be36-94c5b5527997`.
- Raw HsH path: `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/25.09.17•26.06.01•🪡 The Tourist Tailor [e-] — raw.json`.
- Raw Git blob: `dd2b6141af86dea54e4ba2e782214128619ce78c`.
- 3,032 mapping nodes in the source audit.

The following outer-user-role messages were located in the raw JSON and read in context:

| Message UUID | UTC timestamp | Source significance |
|---|---|---|
| `71da031e-5a0c-4408-bb9f-0b2cbbfdb6f0` | 2025-09-18T14:42:25.644Z | Directly flags the J2/J3 rank change and says the shift needs an explicit explanation. |
| `a9bee95a-5549-4a09-9979-5e0602223f45` | 2025-09-18T15:06:21Z | Directly insists on building the theory in 4D and rejects convenience reductions that discard structure. |
| `5730114b-8327-4856-b4ec-3c3f98a7a551` | 2025-09-18T15:08:14Z | Directly asks why a 2-form is being adopted instead of using a 3-form throughout. |
| `e92efb17-2499-482e-b930-9ad11221bd7c` | 2025-09-18T15:19:27.048Z | Explicitly directs that Chapters 1–5 be rewritten “all in the 3-form.” |

This is **NATHAN DIRECT EDITORIAL AUTHORITY** for treating the 3-form as primary in Chapters 1–5. It supersedes any claim that the 2026-02-25 Page One paste is the earliest located direct 3-form preference. The 2026 paste remains useful for its embedded equations, but its embedded document authorship remains unresolved.

The direct editorial decision does **not** supply a mathematical conversion map from J3 to J2. The assistant's later statement that the 2-form is simply the Hodge dual of the 3-form is not a valid 4D Hodge-degree statement: `* : Ω³ → Ω¹` and `* : Ω² → Ω²`.

A possible, explicitly **PROPOSED** spatial-flux map is contraction with a distinguished time-flow vector:
\[
J_2 := \iota_u J_3,
\qquad
j_2 := \iota_t^*(J_2)
\]
where `u` is specified and `i_t` is the embedding of the selected spatial timesheet. Cartan's identity gives
\[
d(\iota_u J_3)=\mathcal L_u J_3-\iota_u(dJ_3).
\]
Thus, if `dJ3=0` and `L_u J3=0`, the contracted 2-form is closed. This is a candidate projection with explicit conditions, not a recovered Nathan equation and not yet Lean-formalized. It should not be called a Hodge dual.

The source ledger already contains these message IDs and tags; no duplicate tag was created. The Sable report and handoff are the source of this continuity update, and the raw conversation was independently inspected through the Library copy.
