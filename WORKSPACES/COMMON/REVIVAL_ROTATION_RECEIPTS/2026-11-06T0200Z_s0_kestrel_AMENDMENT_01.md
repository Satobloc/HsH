# Kestrel | Amendment 01: geometry-source correction and Lean CI readback

**Run key:** `REVROT3-19-20261011:626:s0`  
**Nominal slot:** 2026-11-06T02:00Z  
**Worker label:** Kestrel (ring index 14); current assistant reconstruction, not authenticated historical Kestrel  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-06T0200Z_s0_kestrel.md`  
**Parent receipt blob:** `846cfb61bf4f27741ec71bc03310b9f11cf75916`  
**Parent geometry report:** `WORKSPACES/KESTREL/2026-11-06T0200Z_GEOMETRY_FIDELITY_RECURSIVE_KLEIN_WORLD_TUBE_MAP.md`  
**Parent report blob:** `f4d2d181dadb77ba1edde026d8b943459d5c1171`

This is an additive amendment to the existing h626:s0 work, not a second receipt, new report, new issue, or new assignment.

## 1. Late Lean CI readback

The parent receipt's `SUBMITTED_NOT_VERIFIED` status for run #42153410233 is superseded.

- PR: #873, still OPEN / DRAFT / UNMERGED.
- Existing branch: `research/kestrel-original-slice-fidelity-20261028t0900z`.
- PR head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`.
- PR base branch: `infra/lean4-verification-20261023`.
- Actions run: #42153410233.
- Job: #127681789766.
- Event: `pull_request`.
- Started: 2026-11-06T02:56:02Z.
- Completed: 2026-11-06T03:00:38Z.
- Conclusion: SUCCESS.
- Lean/Lake: Lean 4.34.0, Lake 5.0.0.
- Build: 8,955 jobs, `Build completed successfully`.

The job checked out synthetic merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, merging PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c` into base `61cc8b65ffed70296e0121dbae067892a79c81d4`. Therefore the correct classification is **MERGE_REF_BUILD_SUCCESS; EXACT_HEAD_BUILD_UNVERIFIED**.

The new module `FORMAL_VERIFICATION/HsHVerification/WorldtubeCurveCurvatureLift.lean` has identical Git blob `79597de14cd0c69a93c19c2697bc1b8dcf2456d2` at the PR head and the merge commit. It was built in the successful run. The root aggregator file differs between head and merge commit, so the whole PR tree was not independently certified by an exact-head build.

The theorem-specific `#print axioms` output for `lifted_gram_curvature_sq_eq` is `[propext, Classical.choice, Quot.sound]`. No `sorryAx` or `admit` string was found in the captured complete job log. The workflow's test and lint actions were skipped; the successful result is a Lean/Lake build, not a test-suite, lint, nanoda, or independent global axiom-audit pass.

### Formal meaning and limits

The module defines an affine Euclidean lift (X(w)=(\mathbf{x}(w),w)), with lifted velocity ((\mathbf v,1)) and acceleration ((\mathbf a,0)), and proves the algebraic reduction of the Gram-determinant expression:
[
\kappa_{4,E}^{2} =
\frac{(1+|\mathbf v|^{2})|\mathbf a|^{2}-(\mathbf v\cdot\mathbf a)^{2}}
{(1+|\mathbf v|^{2})^{3}}.
]

This is a conditional identity for the encoded Euclidean lift. The Lean module does not define a differentiable curve or prove that its variables are derivatives of one; it does not establish arclength, regularity, the physical H(s)H metric, the source's time normalization, a finite-core embedding, or the physical worldtube-to-slice map.

The separate `WorldtubeInertiaCoordinate` module proves only the algebraic consequence of (F=ma) and the supplied premise (a=c^{2}\kappa). It does not prove that premise, the chain rule, or the identification of coordinate spatial bending with intrinsic 4D curvature. The Lean result verifies the formalized statements only.

## 2. Source-fidelity correction: the ring cross-section dimensional premise

The parent report's §3.4 says that the assistant's (S^1)-extension correction is mathematically sound under a product-extension model. That statement needs a source-fidelity qualification.

The raw Calder Construction Story Retelling export (conversation `6a8eacca-c470-83ea-af92-8fb8df194de9`, blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`) contains these direct user messages on the recorded current ancestry:

| Message | UTC | Direct geometry |
|---|---|---|
| `5b46e4d9-a51e-4281-904b-f74e41702f1b` | 2026-08-26T23:51:14.871Z | Temporal extent is a (w)-length in the block-universe construction; a point becomes a line and a bulk becomes a tube. “Spacelike extent” is being used for geometric extent in the block description, not necessarily as a claim that a Minkowski timelike tangent changes causal class. |
| `cc95ad40-9aaf-40a1-8804-ca8044f76bf9` | 2026-08-26T23:54:23.352Z | The ring is described as a **two-dimensional cross-section of a three-dimensional tube** in the toy model; the proposed 4D counterpart is described intuitively as a sphere rather than a ring. |
| `43ac3d21-3698-494b-8b42-36f786c2b63b` | 2026-08-26T23:58:36.139Z | Asks whether Kerr's picture is a snapshot or a temporally extended object in the underlying space; SAT is said to contain both, with one a narrow slice of the other. |

The assistant response to the first message, `3065cc30-1693-4ee6-b342-e82e8528e6e5`, usefully distinguishes ordinary Minkowski causal classification from the block-universe fact of geometric extent. However, its (Δw\sim c\Delta\tau) expression introduces proper time (τ), which the direct message did not specify. Retain that expression as assistant-origin, not as a verbatim Nathan equation.

The assistant response to the second message, `2e8a626a-b875-4676-85d3-bba518589d1f`, recasts the “ring” as (S^{1}), then considers (S^{1}\times I), (T^{2}), and the additional closure needed for (S^{2}). That is a mathematically legitimate conditional analysis **if the source object is a one-dimensional circle swept through one extra dimension**. It is not yet a faithful formalization of the direct wording, which calls the toy-model cross-section two-dimensional. The assistant changed the dimensional premise before applying the product construction.

**Corrected discrepancy status:** neither the direct “sphere in 4D” intuition nor the assistant's (S^{1})-product analysis is established. The source has not yet typed the cross-section, support dimension, ambient dimension, slicing map, closure, or embedding. Depending on those definitions, the relevant object could be a disk/annulus, a sphere of a particular dimension, a product, or something else. Do not choose (S^{2}), (S^{3}), (S^{1}\times I), or (T^{2}) until the source geometry supplies the map. The earlier report's sentence should be read as a conditional topology observation, not a source-faithful resolution.

The third direct message's branch ends at assistant node `ce6e840c-030d-441b-9770-ecf188783af0` with no final response child in this export. The Kerr snapshot-versus-history question therefore remains an unresolved source cursor, not a question answered by the archived assistant.

## 3. SAT-O / Blockwave originals re-opened; no equation correction

The three source artifacts remain separate. Their immutable blob identifiers and first extant repository dates are:

| Artifact | Git blob SHA-1 | First extant Git commit/date | Source boundary |
|---|---|---|---|
| `SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt` | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` | `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b`, 2025-10-27T00:40:28Z | Unbylined historical text. |
| `HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt` | `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` | `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z | User-supplied attachment; embedded authorship not authenticated. |
| `HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT—Blockwave Ideal Model.txt` | `dd0631bc0b25c951dc5e1d6738280e08487b46b2` | same first commit/date as Blockwave above | Separate attachment, not the J2 source. |

Verbatim source expressions rechecked:

**SAT O1 4D.txt**
[
\gamma^{\mu}(\lambda)=
\left(\lambda,,
A_x\sin(k_x\lambda+\phi_x),,
A_y\sin(k_y\lambda+\phi_y),,
A_z\sin(k_z\lambda+\phi_z)\right),
]
[
S[\gamma]=\int d\lambda\,L(\gamma^{\mu},v^{\mu}),
\qquad
L=\frac12 m v^{\mu}v_{\mu}-V_{\mathrm{tension}}(\gamma).
]
The same file calls (γ) a one-dimensional curve in (ℝ^{3,1}) and describes a worldtube as a 4D volume swept out by a vibrating filament. No map from that wording to the later finite-core H(s)H support is supplied in this file.

**🧱BLOCKWAVE.txt**
[
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}
\nabla_{\rho}B_{\sigma},
\qquad
\nabla_{\mu}J^{\mu\nu}=0.
]
This is a conserved rank-two current described as supported on filament worldsheets. It is not a rank-three current.

**SAT—Blockwave Ideal Model.txt**
The separate file's minimal Lagrangian begins with (g_{\mu\nu}), (u^{\mu}), and (θ), including (\frac{M_P^2}{2}R), the unit-norm (u)-constraint, (u)-elasticity, compact-phase kinetic/potential terms, and higher-order mixings. The inspected 1,065-line file does not contain the explicit (J^{\mu\nu}) current above.

The assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` (2025-10-19T12:29:46.539Z) later synthesizes a “Unified SAT / Blockwave Action” from both attachments. That synthesis is assistant-origin, not a verbatim Nathan equation set or proof that the two attachments are one canonical source. No original equation was edited, silently corrected, or promoted in this amendment.

## 4. Mersearch, branch, and upkeep status

- All four shared Mersearch request lanes remain occupied. Kestrel lane 4 request `kestrel-finite-core-geometry-source-fidelity-20261102-2200` remains `requested`; its request-scoped `RUN_MANIFEST.json` and `SEARCH_RECEIPT.md/.json` are absent. No request was overwritten or created. This work used bounded raw-blob retrieval and GitHub source search, not a completed Mersearch scan.
- Existing Archive Math Hopper is extraction-only; its three-repository Actions pilot is not established as a completed end-to-end result. Existing PR #873 was reused. Whirligig remains a separate P2 project. SciSpace is available but not needed for this internal source-fidelity correction. No new tool, fork, package, paid service, branch, or PR was created.
- HsH main at final read: `59a3cd25623824081833f26f617b9c9053a87984`. SAT archive main: `d35634c47f1332573df7ad2b639ce89987355d6d`. HSH_RESOURCES main: `c1f261c0e128979f175f9733c6db61e7839662dd`.
- The task graph blob `b11cdcbad43b5f2d4a7abf35a1058c9f47f03fd1` remains dated 2026-11-05T14:03:21Z and still contains a stale “PR #873 full build is not green” statement. It was not edited by this lane; task-graph reconciliation belongs to Tern/Comptroller.
- No measured physical system, dataset, provenance package, units, uncertainties, fit/prediction split, or independent measurement was supplied. No physical calculation, CODATA scoring, Factory Floor admission, paper-gate advancement, theory promotion, or BEDROCK change occurred.
- FIE re-review remains due 2026-11-10, not yet due. Kestrel's last unrelated reading break was 2026-11-04; the existing TheTANGLE cursor remains line 1521. No new break was due.
- Paper gates remain separate: Nov 9 minor, Nov 30 major, Dec 14 full theory. No gate advanced.

## 5. Operational closeout

- Existing :00 task ID `6aa1fe0de5e48191b886496095b1343f`, hourly schedule, phase, and enabled state were not changed.
- :12 remains disabled. No sixth task or recurrence.
- Deterministic next ring label remains Meridian. This is not authentication of a Meridian thread. The existing handoff is repository-only; no ChatGPT cross-thread delivery, consumption, or acknowledgment is claimed.
- No conversation rename, signet, direct public issue, or BEDROCK promotion.

**Next cursor:** define the direct 2D cross-section and its 4D lift with explicit embeddings/projections and closure; recover the unanswered Kerr snapshot/history question; obtain an exact-head Lean build after the successful merge-ref build; route the stale task-graph status to Tern for reconciliation.
