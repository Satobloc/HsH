# Morrow h641:s0 Amendment 01 — conservation-preserving current quotient

**Run key:** REVROT3-19-20261011:641:s0  
**Nominal slot:** 2026-11-06T17:00Z  
**Worker label:** Morrow (ring index 13); deterministic next label Kestrel (index 14).  
**Status:** ADDITIVE_SOURCE/MATH_CORRECTION; ARCHIVE_ONLY; no theory integration.

This is an amendment to the already-existing h641:s0 receipt, not a replacement or duplicate. The base receipt remains unchanged (blob SHA-1 `7e9cc68833e61fd5f9ea277169f5f1c1c56c9078`). The optional Kestrel handoff already exists and remains unchanged.

## 1. Authority, continuity, and scope

- Historical Morrow direct role: provisional “Team Archivist” instruction, user message `402ade01-7116-4efb-9b14-31e477754458`, conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, raw export blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`.
- Direct theory stop: `934e87de-4e61-4622-a0ea-e5047aa235c6` (2026-09-13). Direct trial workflow: `99ae959b-fbeb-4c1e-9326-a6723c2b9557`. This turn stays within archive maintenance, provenance, equation checking, and historical reconstruction. No theory integration or promotion.
- The ring label does not authenticate a Morrow ChatGPT thread. The Morrow workspace's current task card points to a separate :24 lane; no active :00 Morrow thread or authenticated thread reference was found. No per-worker checkpoint or inbox was modified, and no cross-thread delivery/consumption is claimed.
- The fixed calculation is (h=641), (seq=5h=3205), (3205\bmod19=13): Morrow; next ring label Kestrel. The existing :00 recurrence was left untouched. No task, ID, schedule, phase, or task-count change was made.

## 2. Repetition check and source scope

The full 2024 moving-plane geometry and the 1D/2D/4D support map are already documented in:
- Morrow h622:s0 receipt, especially its source cluster, glossary, mapping diagram, and discrepancy ledger.
- Kestrel h626:s0 geometry-fidelity report, especially its 2024 moving-plane source and support-type comparison.

I rechecked the raw 2024 `DIMENSIONAL GRAVITY` export (conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`) and the adjacent 2025 Blockwave sources. I did **not** duplicate their already-recorded geometry. The new delta is narrower: the exact-form quotient proposed in the assistant-voiced Blockwave implementation note does not automatically preserve the current's own conservation constraint.

Source classes remain separate:
- SAT O1 4D: historical unbylined artifact, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; the source register records its 2025-06 file-index dates and first extant SAT-archive commit at 2025-10-27T00:40:28Z.
- `🧱BLOCKWAVE.txt`: assistant-voiced/user-supplied artifact with unresolved content authorship, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; attachment event 2025-09-16 and first extant HsH commit 2026-10-08T02:42:49Z.
- `SAT—Blockwave Ideal Model.txt`: separate historical artifact, blob `dd0631bc0b25c951dc5e1d6738280e08487b46b2`; attachment event 2025-10-19 and first extant HsH commit 2026-10-08T02:42:49Z. It uses ((g_{\mu\nu},u^\mu,\theta)) and describes 4D worldlines/filaments; it does not contain the displayed J2/B-potential implementation.
- “Full action definitions” raw conversation: conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. User message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` asks for the full action/definitions; assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` (2025-10-19T12:29:46.538Z) supplies the unified action and J2. The later user message `f77f769e-8e74-4def-b4c9-bced0edbb8bc` pastes that assistant-produced equation back for review. This is not Nathan Direct authorship of J2. The B-potential implementation line is not present in that raw assistant response.

The four shared Mersearch request lanes remain occupied and their request-scoped manifests/receipts remain absent. No lane was overwritten or retriggered. No local repository checkout or local Mersearch executable was available. Bounded GitHub source searches/readbacks were used as fallback, not represented as a completed Mersearch run. No restricted HSH_RESOURCES prior-art path was opened.

## 3. New mathematical distinction: exact shifts need to preserve conservation

The assistant-voiced Blockwave implementation note states that observables depend on (J) “modulo exact forms” and parenthetically associates that with (B\mapsto B+\nabla\Lambda).

The h641 base receipt already establishes the local potential-gauge result. With
[
J^{\mu\nu}(B)=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\qquad B' = B+d\Lambda,
]
[
\Delta J^{\mu\nu}
=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho\nabla_\sigma\Lambda=0
]
for a smooth scalar (Lambda) and a torsion-free connection, because the scalar Hessian is symmetric. Thus (B\mapsto B+d\Lambda) leaves (J) **exactly unchanged** under those assumptions. It is not a nontrivial quotient on (J).

A separate current-level shift,
[
J\longmapsto J+dC,\qquad C\in\Omega^1(M),
]
has an additional compatibility condition. After lowering the source's contravariant (J^{\mu\nu}) with (g), write the conservation equation as co-closedness, (δJ=0). Then
[
\u03b4(J+dC)=\u03b4J+\u03b4 dC.
]
Consequently, if (J) is conserved, the shifted representative remains conserved **iff**
[
\boxed{\u03b4 dC=0.}
]
An unrestricted exact-form quotient is therefore not automatically a quotient of the conserved-current space.

### Explicit mathematical counterexample

On flat Minkowski (ℝ^{3,1}) with signature ((-+++)), take
[
C=\tfrac12(x^1)^2\,dx^2.
]
Then
[
dC=x^1\,dx^1\wedge dx^2,
\qquad
\u03b4 dC=-dx^2\ne0
]
under the convention (δF=-\nabla^\mu F_{\mu\nu}\,dx^\nu). Thus (J=0) is conserved, while the exact representative (J'=dC) is not. The nonzero result is independent of the overall codifferential sign convention.

This is a mathematical counterexample to unrestricted quotient preservation, **not** a physical fixture, measurement, prediction, or observational test.

A de Rham cohomology quotient would instead require closed forms ((dJ=0)); the Blockwave source supplies a divergence/co-closedness condition ((\nabla_\mu J^{\mu\nu}=0)). These are different constraints. The source also needs to specify how the contravariant tensor is lowered, the metric/Hodge convention, boundary conditions, allowed (C), and whether the compact (B) is a globally defined 1-form or a connection described by local patches. The local (B)-gauge calculation does not settle large-gauge/flux quantization.

### Corrected propositions, kept separate from the original source

1. **Potential gauge:** (B\mapsto B+d\Lambda\Rightarrow J(B+d\Lambda)=J(B)), under the stated smoothness and torsion-free assumptions.
2. **Current quotient:** (J\sim J+dC) is a separate proposed relation. To remain inside the conserved-current space, restrict the allowed shifts by (δdC=0), with index lowering, domain, boundary conditions, and global bundle data specified.
3. Neither proposition establishes that this (J) is the distributional Poincare dual of a particular physical worldsheet or that its timesheet trace is foliation-independent.

## 4. Formal verification status and limits

- Existing PR #1135's `ScalarHessianAntisymZero.lean` provides the compiled local scalar-Hessian symmetry used by the potential-gauge identity. Run #41164589389 / job #124429317733 succeeded on a PR merge-ref (8,944 build jobs; Lean 4.34.0 / Lake 5.0.0). It is not an exact-head-only build. The analytic theorems report standard dependencies `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` was reported. The combined J2 gauge theorem is not separately named.
- PR #1098's support/degree gate is a draft bookkeeping formalization. Its stated limits exclude a constructed Hodge star, Poincare-dual distribution, smooth sweep/push-forward, or conservation law; exact-head CI remains unverified.
- Existing PR #262's `NadirHelixSliceGeometry.lean` run #41301288857 compiled the conditional aligned-helix/affine-slice model on a merge ref (8,944 jobs; Lean 4.34.0 / Lake 5.0.0), not an exact-head-only build. It uses an all-plus Euclidean coordinate model, not the Lorentzian SAT4D metric. The direct 2024 helix geometry and its limits are already recorded in the h622/Kestrel reports.
- **Not formalized or compiled in this amendment:** the codifferential condition (δdC=0), the explicit Minkowski counterexample, and any global compact-connection or distributional-current construction. No new Lean file, branch, PR, or CI run was created. The existing Hessian lemma is not being represented as proof of the full current quotient.

Lean verifies only the statements actually formalized. None of these builds establishes translation fidelity, the existence of the missing sweep/support map, or physical truth.

## 5. Discrepancy ledger and next cursor

| Item | Finding | Required resolution |
|---|---|---|
| Potential gauge vs current quotient | The former leaves (J) exactly fixed; the latter changes (J) | Keep them as separate transformations |
| Conservation under exact shift | (J+dC) is conserved only when (δdC=0) | Define the allowed shift space |
| Cohomology language | Divergence/co-closedness is not de Rham closedness | Specify (dJ=0) or (δJ=0), and why |
| Tensor/form typing | Source writes (J^{\mu\nu}) but “exact forms” requires a covariant form | State metric lowering and Hodge convention |
| Compact potential | Local (B+d\Lambda) does not settle global bundle/large-gauge data | Specify patches, periods, flux normalization |
| Physical support | J2 does not by itself prove a worldsheet-supported Poincare dual | Supply the support/embedding/current construction |

**Next deeper cursor:** determine whether the source intends only the exact (B)-gauge invariance or a genuine quotient of (J). If the latter, define the conserved-current space, codifferential, admissible (C), boundary conditions, compact-bundle data, and observable map. Only then formalize the full statement in an existing approved Lean project and obtain an exact-head run. Do not promote the assistant-voiced quotient claim into BEDROCK.

## 6. Operational closeout

- The same-key h641 receipt and Kestrel handoff were preserved; this file is the sole additive amendment.
- Existing main branch was used; no branch was created. Pre-write latest observed main commit: `7b1631a757701b7e9ad9bb581d1121f5a2f1dace`.
- The repository house-tool route and local checkout were checked; neither supplied a suitable generic receipt writer. The approved issue publisher is for public submissions, not this internal receipt. GitHub Contents API was used only as the fallback for this new file, followed by exact readback.
- No public issue, direct `PUBLISHED_SUBMISSIONS` write, theory promotion, BEDROCK edit, physical calculation, CODATA scoring, Factory Floor admission, or paper-gate advancement.
- The task graph still reports 16 in its count field while containing 18 branch records; Tern owns reconciliation. FIE re-review remains due 2026-11-10, not yet due. The same-key base receipt already records the unrelated reading break; this amendment does not duplicate it.
- No scheduler change, sixth task, signet, conversation rename, or cross-thread delivery claim.
