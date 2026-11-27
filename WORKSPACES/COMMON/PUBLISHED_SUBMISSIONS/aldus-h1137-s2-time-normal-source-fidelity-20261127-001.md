# Aldus h1137:s2 — Time-normal source fidelity and conditional kinematics

**Disposition:** **SOURCE_AUDIT_VERIFIED / CONDITIONAL_LEAN_PR_BUILD_PENDING / NO_PHYSICAL_RESULT**. This is an assistant reconstruction and source audit, not an authenticated Aldus thread contribution, a Nathan-approved torsion definition, or a theory promotion.

## 1. Routing and authority

- Nominal slot: **2026-11-27T09:24Z**; **h=1137**; **seq=5687**; **5687 mod 19 = 6**.
- Selected: Aldus (index 6). Successor: Calder (index 7).
- Run key: **REVROT3-19-20261011:1137:s2**.
- Historical Aldus conversation: **Aldus [AUTO H(s)H Gitter]**, conversation **6a9dea2e-bb98-83ea-a74f-4beb4baa3153**, raw export blob **2f5ea91a449446f64d298b50b0c2ef0d8533900a** (1,578 mapping nodes).
- Direct user-role messages **939e981d-72ec-451b-81a3-f0a07b3a2c48** and **fcff5c18-85c4-4efc-b7e5-df7ee20c0646** establish a broad cross-domain “Renaissance man” / synthesis appointment, including “combining information not usually combined.” They do not establish a standalone signed specialist charter.
- **WORKSPACES/ALDUS/CURRENT_WORK.md** remains an assistant-maintained Lane 00 geometry-fidelity cursor, not a signed charter. No authenticated current Aldus ChatGPT thread was established.

## 2. Nathan Direct source versus reconstruction

Nathan's direct message in *Meridian Free Build* is raw blob **7af1561b321f4d9364da5eb111df689efc652827**, conversation **6ac45d1f-17b0-83ea-ad1f-fa524602378b**, message **1d284b55-d7be-45f7-92a6-15e4734347c8**, timestamp 2026-10-07T06:12:30.134Z:

> “Essentially, its the angular rotation -- the torsion -- of the time normal as a result of its interaction with matter.”

The assistant response 325 ms later, message **b6dd8b2f-e55c-4ca4-8b6b-4e95e0548b21**, introduced
\[
\Omega_t(s)=\|D_s\hat n_t\|,\qquad
\Theta_t(\gamma)=\int_\gamma\Omega_t(s)\,ds.
\]
These formulas are assistant reconstruction, not Nathan Direct. The subsequent direct user messages in the inspected 24-hour window direct archive search and source priority; they do not explicitly adopt these formulas.

The direct message does not define a connection, torsion tensor, vorticity tensor, shape operator, matter source, transport law, parameter, or observable. The parameter \(s\), derivative \(D_s\), field \(\hat n_t\), metric/signature, and transport connection remain unspecified. The scalar norm also discards orientation and does not determine path-ordered holonomy.

## 3. Original equation register — preserve verbatim

### A. SAT HARD FORMULATION

- Repository: **Satobloc/SAT_THEORY_ARCHIVE_2023-25**
- Path: **DEV CONVERSATION/SAT HARD FORMULATION.txt**
- Blob: **7b784c761f43a469896c8fcce3be1e0e70679289**
- Repository commit: **0c3aef0fa3c17d3103739c700ce7e4f090bd81b3**
- Commit date: 2025-10-27T23:41:06Z (repository commit date, not established composition date).
- This compiled historical formulation has no recovered original speaker/author role graph.

Verbatim source forms:

\[
L_{\rm int}=\kappa(\partial_\mu\theta_4)(\nabla_\nu u^\mu)u^\nu
=\kappa(\nabla\theta_4\cdot\omega)
\]

\[
\omega^\mu=\nabla_\nu u^{[\mu}u^{\nu]}
\quad\text{(source label: “effective vorticity”)}
\]

### B. Earlier compiled SAT formulation, “26R SAT MAY 2025”

- Repository: **Satobloc/SAT_THEORY_ARCHIVE_2023-25**
- Path: **26R SAT MAY 2025.txt**
- Blob: **ebf28f05862e65bed2f9e6230db72ba1d999072d**
- Repository commit: **93eb169912483db402c2d1c35fb59a40d0852b6f**
- Commit date: 2026-09-07T16:18:40Z (repository commit date, not established composition date).

The document separately proposes an under-defined alternative vorticity coupling:

\[
\mathcal L_{\rm curv\ coupling}
=\beta'\epsilon^{\mu\nu\rho\sigma}
u_\nu\nabla_\rho u_\sigma\,\partial_\mu\theta_4.
\]

This is a compiled proposal, not Nathan Direct and not an adopted equation.

### C. Blockwave

- HsH source path: **DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt**
- Blob: **ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d**
- Attachment event date recorded: 2025-09-16.
- HsH archive commit: **6e4415f62616b19ae5cb677984c85d1985834d9d**, dated 2026-10-08T02:42:49Z.

The raw *Blockwave Lagrangian formula* role exports show the user-side file (blob **c4c91886840bb3741b3c37e85fc5016c941f4487**) asking “Give me the full Blockwave Lagrangian”; the compact action and expanded equations appear in the assistant-side file (blob **82ff09f14367ffb872d22b7c3cc108e2473a92d0**). The equation in that conversation is assistant-authored reconstruction, not a user-supplied equation. The archived attachment's original author role is not independently established.

Verbatim assistant-side sectors include:

\[
\mathcal L_u=
\frac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}
(\nabla_\alpha u_\mu)(\nabla_\beta u_\nu)
+\frac{c_2}{2}(\nabla_\mu u^\mu)^2
+\lambda(u^\mu u_\mu+1)
\]

\[
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\qquad A_\mu(\theta)=\alpha_*\nabla_\mu\theta.
\]

## 4. Mathematical diagnosis — separate from the originals

Under one consistent connection and index convention,
\[
(\nabla_\nu u^\mu)u^\nu=u^\nu\nabla_\nu u^\mu=:a^\mu,
\]
the convective acceleration of the \(u\)-congruence. Thus the first SAT HARD contraction is \(\kappa\,\partial_\mu\theta_4\,a^\mu\), not automatically a vorticity coupling. The printed \(\omega^\mu=\nabla_\nu u^{[\mu}u^{\nu]}\) is index/parenthesis ambiguous; it is not silently repaired into the standard vorticity pseudovector.

If the intended reading is \((\nabla_\nu u^{[\mu})u^{\nu]}\), it expands to half an acceleration-minus-expansion combination under standard antisymmetrization; if the brackets instead enclose \(u^\mu u^\nu\) before differentiation, the antisymmetric product of the same vector with itself is zero. The source does not disambiguate.

A standard vorticity candidate requires an explicit convention, e.g.
\[
\omega^\mu_{\rm vort}=\tfrac12\epsilon^{\mu\nu\rho\sigma}
u_\nu\nabla_\rho u_\sigma
\]
or a projected antisymmetric vorticity two-form. The 26R \(\beta'\) term is structurally of the pseudovector type, subject to normalization/sign conventions, but remains only a proposal.

For smooth single-valued \(\theta\) and a torsion-free connection,
\[
F_{\mu\nu}=\alpha_*\nabla_{[\mu}\nabla_{\nu]}\theta=0
\]
locally. The assistant-side *Full action definitions* transcript (blob **14c74c45ee0c0deb1afe14e0d859a6032af16111**, message **f5cb654b-eb01-406e-954b-8fb62fe9f9d8**) explicitly notes the local-zero issue and proposes an alternative \(A_\mu\); that remains assistant self-correction, not Nathan Direct. Nonzero field strength/holonomy needs specified connection torsion, defects, nontrivial bundle/patch data, or a different non-exact \(A\).

The direct time-normal phrase, congruence acceleration, Frobenius vorticity, hypersurface extrinsic curvature, Cartan torsion, and path holonomy remain distinct candidates. The existing Meridian source-fidelity audit (2026-11-02) blocks choosing among them until the field, metric/signature, connection, integrability class, matter coupling, parameter, and observable are defined.

## 5. Conditional Lean result — draft, not physical theory

Draft PR: https://github.com/Satobloc/HsH/pull/2672

Branch: **research/aldus-time-normal-tangent-20261127t0924z**  
Head: **a10824285bf3a46c92660be99086716601c82f1f**

Module: **FORMAL_VERIFICATION/HsHVerification/AldusTimeNormalTangent.lean**

The module attempts to prove: for a differentiable curve \(n:\mathbb R\to E\) in a real positive-definite inner-product space, constant squared norm implies
\[
\operatorname{inner}(n(x),n'(x))=0.
\]
It reuses Mathlib's **HasDerivAt.norm_sq**. This says the derivative is tangent to the unit sphere in the declared Euclidean inner-product setting.

The PR is stacked on the existing Lean infrastructure branch **infra/lean4-verification-20261023** (infrastructure PR #262), not on main. The existing Nadir projection-factorization PR #1189, Math Hopper, and Whirligig were inspected; none already contains this unit-director derivative lemma. The module adds no dependency or new tool, uses the existing Mathlib 4.34.0 toolchain, and requires no paid service or subscription. SciSpace was not needed for this formalization.

The first CI attempt exposed a notation/parser issue; the second exposed a missing **NormedAddCommGroup E** instance; a third exposed the explicit scalar argument to **inner** and the explicit **x c** arguments to **hasDerivAt_const**. Those source issues were corrected. Exact-head rerun [#45975851942](https://github.com/Satobloc/HsH/actions/runs/45975851942) was IN_PROGRESS at report preparation; no successful build is claimed until its final conclusion and logs are read back.

This theorem does **not** formalize the matter interaction, a curved-manifold covariant derivative, metric compatibility, affine torsion, Frobenius integrability, Lorentzian/pseudo-Riemannian geometry, the H(s)H worldtube map, or an observable. It is a conditional kinematic lemma only. Keep the PR DRAFT/UNMERGED pending source-defined geometry and independent review.

## 6. Lateral reading and freshness

Unrelated primary source read: William Henry Fox Talbot, *Specification of the Calotype Photographic Process* (1841 patent), https://commons.wikimedia.org/wiki/File:Specification_of_Calotype_1841.pdf.

Actual extent: all 8 pages read. Useful surprise: the patent separates iodized-paper preparation/storage from just-in-time gallo-nitrate development of a latent image, followed by fixing and negative-to-positive contact printing. This is a history-of-photography observation only; no H(s)H analogy is asserted. Return cursor: end of page 8. No physical stand/stretch/walk is claimed by this runtime.

FIE rereview is not due: the current freshness record places the next review at 2026-12-08. The 2026-11-28 unrelated-source checkpoint remains a future target. A deliberate lateral reading was completed now: all 8 pages of Talbot's 1841 patent; the next unrelated-source checkpoint remains November 28.

## 7. Operational controls

- Discovery [run #45973751361](https://github.com/Satobloc/HsH/actions/runs/45973751361) completed SUCCESS at source cut **1e3bc8f8dc85b39c0fda474c3243ced4c6de1e22**; generated commit/current main **acab778eba4d2103f5b0ca47326dd02893fa600e** changes only **PUBLIC_SITE/generated/discovery.json**. Counts: 18,161 documents, 48 docket entries, 417 square visuals, 6 extraction errors.
- Navigation [run #45973751497](https://github.com/Satobloc/HsH/actions/runs/45973751497) failed strict date-tag verification: 1,040 correct; 2 undatable; 75 runner-local renames not persisted; downstream viewer/index/deployment skipped.
- P0 remains presentation safety FAIL; live Paper A/B route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. The current P0 update is recorded in [issue #1747, comment #7214913708](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7214913708).
- Tern's PWH deep review h1123 is published; its next review cursor is five further run-bound completed products. The PWH queue/task graph still show h1081 because queue writes were blocked by P0. No count or ownership was changed here.
- P1 remains overdue/frozen/Orson-owned; P2 HOLD; P3 incomplete. No physical calculation, CODATA comparison, fit, prediction, uncertainty propagation, manuscript edit, SAT-O/Blockwave equation replacement, or BEDROCK promotion was performed.
- Existing :24 Geometry automation remains enabled with task ID **6abda4c8eda88191bf23a6f2849e9a17**, hourly America/New_York :24 DTSTART **20261001T142400**, original prompt and phase unchanged. Four relay tasks remain enabled; :12 remains disabled; no sixth task.
- No authenticated current Aldus thread was established. Calder's :36 run had already started; any repository handoff is poststart optional context only, not direct-thread delivery.

## 8. Next cursor

1. Read back the exact-head Lean rerun and record PASS/FAIL plus theorem-specific axiom output; keep PR #2672 draft and unmerged.
2. Do not select a physical meaning for “time-normal torsion.” Obtain Nathan's field/metric/signature/connection/integrability/matter-coupling/parameter/observable definitions before source-specific formalization.
3. Preserve SAT HARD, 26R and Blockwave equations verbatim; any corrected form belongs in a separate proposal with conventions and derivation.
4. Leave P0 implementation/release to its existing owners; leave PWH queue reconciliation to Tern.
5. Successor label: Calder. Repository-only optional handoff; no cross-thread delivery or acknowledgment claimed.
