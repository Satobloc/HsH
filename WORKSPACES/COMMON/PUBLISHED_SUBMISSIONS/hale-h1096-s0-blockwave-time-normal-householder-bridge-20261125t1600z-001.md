# Lane 00 | Blockwave time-normal and Householder bridge

**Run key:** REVROT3-19-20261011:1096:s0  
**Deterministic selection:** Hale, ring index 8; next label Elias Kern, index 9  
**Scope:** source-fidelity addendum to the existing Lane 00 transcript review, issue #2522. This report does not replace that review.

## Executive finding

A conditional geometric bridge can reconcile the older Blockwave Lorentzian time-flow vector with the later H(s)H native positive-definite four-space, without pretending the two metrics are isometric.

The bridge is a Householder sign flip along a normalized normal to a regular level-set timesheet:

\[
\Sigma_\tau=T^{-1}(\tau),\qquad
n=\frac{\nabla_h T}{\sqrt{h^{-1}(dT,dT)}},\qquad
g_H=h-2n^\flat_h\otimes n^\flat_h.
\]

If the old Blockwave vector is conditionally identified with \(u=n\), then \(g_H(u,u)=-1\), and the old Lorentzian plus-projector becomes exactly the native Riemannian tangent projector:

\[
P_L=I+u\otimes u^\flat_{g_H}
   =I-n\otimes n^\flat_h
   =P_E.
\]

This is a useful typed representation map, not a physical equivalence or a source-native equation. The scalar field \(T\), the identification \(u=n\), and the Householder metric must remain proposals until the source and current theory explicitly adopt them.

A second source correction is equally important: the September 2025 assistant-generated time-field rebuild introduced direct \(T\)-to-\(\psi,\theta\) current couplings. The October 22 user-supplied Blockwave sector specification explicitly says the \(u^\mu\) sector has no explicit \(\theta\) terms and permits only indirect coupling through \(\mathcal M(\theta,u)\) or higher-order corrections. The earlier direct-coupling proposal must not be carried forward as the later user-specified action.

## 1. Source custody and chronology

| Source | Date and provenance | SHA / identity | Attribution |
|---|---|---|---|
| SAT4D_LIVE_DRAFT.txt | Byline Nathan McKnight; document date June 2025; first extant Git commit 2025-10-27 00:40:28Z | Git blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7; first commit b543eb3fbf16e50500ceadad83dc9a7dc0759e5b | Bylined source artifact, not a raw role-authenticated message |
| Blockwave Theory Redubbed raw conversation | Created 2025-09-13 01:24:39.339Z; first extant HsH commit 2026-11-04 12:37:43Z | Git blob 65b226c9464db9ef91d31c538d7436847173eea9; conversation 68c4c7d6-c38c-832e-b185-655e4332f1bd | Contains direct user messages and separate assistant/tool-generated formalism |
| Full action definitions raw conversation | Created 2025-10-19 12:29:43.994Z; first extant HsH commit 2026-10-10 01:26:41Z | Git blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77; conversation 68f4d9b5-b908-832e-940e-6782db174a4a | The unified action in message 121d607d-53e7-4b5a-8a7a-75d7e09deb3d is assistant-generated |
| Blockwave Lagrangian formula raw conversation | Created 2025-10-19 17:14:04.969Z; first extant HsH commit 2026-11-06 08:03:21Z | Git blob 7e5dc51d2ec7f93e2277a37b491707b7acb3df83; conversation 68f51c5a-49d4-832c-beb0-105d204e2f58 | Contains the later user-role \(\theta\)-sector specification |
| Meridian Minkowski Ring Analysis raw conversation | 2026-10-20 to 2026-10-21 | Git blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703; conversation 6ad7e9c0-e8a0-83e9-984e-94d020de3abf | Role-authenticated direct user corrections |
| Live BEDROCK.md | Current HsH main at pre-run head d6e4a0fa7fb069be4de82aec1150499b854cddb6 | Git blob ed791df242d6f3beddeaeeabd0d1ced3d1341e9d | Current controlling record |
| STATE_OF_THE_THEORY.md | Current HsH main | Git blob 2614c8a0d4c5f1f3a8a5d6a0d5e7f0b2f1e3a6c9 | Current theory-status summary |

The SAT4D draft's document date and Git appearance date are different. The first extant repository commit says it is re-folding the SAT-O high-water build into the SAT/Blockwave build and calls the integrated result Satobloc. That is archive chronology, not proof that every equation in the drafts was adopted.

### Naming transition versus mathematical adoption

The September 13 raw conversation contains the direct user message e68ccb68-79a2-49df-986c-36fe88f0ed8f:

    We’ve now redubbed SAT as Blockwave Theory

The later direct user message a9b079dc-f2e9-4773-b520-382f8abf1fd2 says the paper may mark the point at which the theory is officially transitional in name.

The assistant response bef20f6c-84db-426d-8d34-3acecfbd9e85 goes further, asserting that all prior formal structures remain valid and reinterpreting the time surface as a Blockwavefront and \(\theta_4\) as the angle between a block filament and wavefront. Those are assistant-authored semantic claims. The direct naming transition does not itself establish their mathematical correctness or adoption.

### The assistant-generated T-field rebuild

The tool message 53c907c4-3673-4ed0-b507-cd61005a74ef in the same September 13 conversation introduces:

\[
T(x^\mu)\in\mathbb R,\qquad
\Sigma_\tau=T^{-1}(\tau),\qquad
n^\mu=\partial^\mu T,
\]

\[
\partial_\mu T\,\partial^\mu T=-1,
\qquad
\mathcal L_T=\lambda(x)
  \left(\partial_\mu T\,\partial^\mu T+1\right),
\]

and direct couplings

\[
\mathcal L_{\mathrm{coupling}}
=\eta\,\partial_\mu T\,j^\mu_\psi
+\xi\,\partial_\mu T\,j^\mu_\theta.
\]

This is a proposed EFT translation generated by the assistant/tool, not a verbatim Nathan Direct equation. The user requested a paper and a naming transition, but did not directly adopt this particular \(T\)-field constraint or the two direct current couplings.

## 2. Original geometry and later direct constraints

The SAT4D draft describes a one-dimensional filament/worldline in a four-dimensional block and a moving three-dimensional time surface. Its displayed curve ansatz is:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right).
\]

Its displayed action scaffold is:

\[
S[\gamma]=\int d\lambda\,\mathcal L(\gamma,v),
\qquad
\mathcal L=\frac12 m\,v^\mu v_\mu
          -V_{\mathrm{tension}}(\gamma).
\]

The associated conceptual description treats the particle as the intersection of a filament and a moving time surface. The Fundamental Intuitions text in the September 13 conversation also describes interaction and energy exchange between the wavefront and filaments. Those are geometric intentions, not a completed variational law.

The October 21 direct user message c5525f53-b7cc-4444-8102-3bf6fdb1c892 states:

    So, we're always in cw=t, we're always in +/-(c+H_0)/2 [or whatever the proper expression of that is], we're always in Forest Normalizatin, and we're always in (++++)
    
The bracketed expression is explicitly uncertain and remains unresolved. The positive-definite \((++++)\) convention is direct; it must not be silently replaced by the older Lorentzian convention.

The direct user message 090f5160-1020-486d-9c42-df3d7dff2063 says the earlier reciprocal descriptions of filament deformation of the timesheet and timesheet deformation of the filament are no longer being used since the Klein Fabric model became common. The September 2025 backreaction picture is therefore historical context, not the current operative construction.

## 3. Verbatim Blockwave action and later user specification

The assistant-generated unified action in the October 19 Full action definitions conversation uses a Lorentzian metric and the following definitions:

\[
u^\mu u_\mu=-1,
\qquad
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu,
\]

\[
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta),
\qquad
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,
\]

\[
\mathcal L_{\mathrm{mix}}
=\frac12 J_{\mu\nu}
\mathcal M^{\mu\nu}{}_{\rho\sigma}(\theta,u)
J^{\rho\sigma}.
\]

The same assistant-generated action also contains the \(J^{\mu\nu}\) filament/worldsheet current, the \(u\)-elasticity terms, the \(F\cdot J\) term, and the \(\mathcal M(\theta,u)\) response term. It is not a Nathan-authored derivation merely because the user requested the full action.

The later user-role message 4f5dac5d-0f94-4f27-940f-f6004147c0a7, dated 2025-10-22 10:35:08.275Z, explicitly supplies the \(\theta\)-sector specification and asks that it be retained. Its controlling statement for the present comparison is:

    TIME-FLOW SECTOR (u^mu)
    Explicit theta terms: none.
    Possible indirect coupling:
      Through M(theta,u) or higher-order corrections.
      Backreaction from theta field via the medium response.

That later user-supplied specification is inconsistent with carrying forward the September assistant-generated direct \(T\)-to-\(\theta\) current coupling as canonical. The later specification allows indirect response through \(\mathcal M(\theta,u)\), not an explicit \(\theta\) term in the time-flow sector.

A separate previously identified issue remains: if \(A=\alpha_*d\theta\) with smooth scalar \(\theta\) and constant \(\alpha_*\), then \(F=dA=\alpha_*d^2\theta=0\) locally. A compact phase can still have nontrivial periods and flat holonomy, but the local \(F\cdot J\) term needs a defect-supported or non-exact connection construction to be nonzero. That issue is already tracked in the existing Blockwave provenance work and is not re-opened here.

## 4. Conditional native-to-Lorentzian map

The source-faithful starting point is a positive-definite native four-manifold \((M^4,h)\). The scalar \(T\) remains an optional assistant-proposed foliation representation, not a direct-source requirement.

On a region \(U\subset M\), assume:

1. \(h\) is smooth and positive definite.
2. \(T:U\to\mathbb R\) is smooth.
3. \(dT\ne0\) throughout \(U\), so each \(\Sigma_\tau=T^{-1}(\tau)\) is a regular three-dimensional level set.

Define

\[
s=\sqrt{h^{-1}(dT,dT)},\qquad
n=\frac{\nabla_hT}{s},\qquad
n^\flat_h=\frac{dT}{s}.
\]

Then \(h(n,n)=+1\). Define a new, pointwise metric:

\[
g_H=h-2n^\flat_h\otimes n^\flat_h.
\]

This is not an isometry from \(h\) to a Lorentzian metric. It changes the metric by a rank-one sign flip. Under the stated conditions:

\[
g_H(n,n)=-1,
\]

\[
g_H(n,v)=0
\quad\text{for }v\in T\Sigma_\tau,
\]

\[
g_H(v,w)=h(v,w)
\quad\text{for }v,w\in T\Sigma_\tau.
\]

Thus the normal direction is negative and the three-dimensional tangent space remains positive. The resulting pointwise signature is \((-+++)\).

The inverse metric satisfies:

\[
g_H^{-1}(dT,dT)=-s^2.
\]

If \(u=n\), then

\[
u^\flat_{g_H}=g_H(n,\cdot)=-n^\flat_h=-\frac{dT}{s}.
\]

The old Lorentzian projector therefore becomes:

\[
P_L{}^a{}_b
=\delta^a{}_b+u^a u^{\flat_{g_H}}{}_b
=\delta^a{}_b-n^a n^\flat_{h,b}
=P_E{}^a{}_b.
\]

The final operator is exactly the native Riemannian orthogonal projector onto \(\ker dT=T\Sigma_\tau\).

This resolves the apparent sign conflict in a precise way:

- With the native metric \(h\), the normalized normal has norm \(+1\), and the tangent projector uses a minus sign.
- With the induced metric \(g_H\), the same vector has norm \(-1\), and the Lorentzian projector uses a plus sign.
- The index-lowered \(u_b\) must be lowered with \(g_H\), not with \(h\).

The assistant-generated unit constraint \(g_H^{-1}(dT,dT)=-1\) additionally assumes \(s=1\), an eikonal normalization. Without that condition, the normalized vector definition above is the correct statement.

This map is a candidate kinematic/metric bridge only. It does not establish that \(T\) is a physical scalar field, that \(u\) is actually derived from \(T\), that the induced metric is the current H(s)H metric, or that the map supplies the required filament/worldtube dynamics. A global real-valued submersion also requires suitable topology; on a compact boundaryless manifold a smooth real-valued function has extrema, so a global \(dT\ne0\) assumption cannot simply be imposed.

### Mapping diagram

    Native M^4 with positive metric h
              |
              | optional scalar T, with dT != 0
              v
    Sigma_tau = T^-1(tau), a regular 3D timesheet
              |
              | n = grad_h(T) / ||dT||_h
              v
    Unit h-normal n, with h(n,n)=+1
              |
              | g_H = h - 2 n_flat(h) tensor n_flat(h)
              v
    Induced Lorentzian metric g_H
              |
              | u=n; u_flat(g_H)=-n_flat(h)
              v
    P_L = I + u tensor u_flat(g_H)
        = I - n tensor n_flat(h)
        = P_E
              |
              v
    Tangent space T Sigma_tau

    MISSING:
    A source-defined map from this foliation/readout
    to the finite-core worldtube W^4, J^{mu nu},
    its support, and the current Klein Fabric dynamics.

## 5. Formalization status

The relevant existing work was reused rather than duplicated.

**PR #873, Kestrel gauge/level-set gates**

- Current head: 94b6d96c91806a95505260a3c52220f4af294185.
- Exact-head Actions run: [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878).
- Lean 4.34.0 / Mathlib; 8,956 build jobs completed.
- The imported KestrelGaugeNormalizationGate includes the conditional theorem that a positive-definite metric excludes a unit timelike vector.
- The KestrelLevelSetSliceTangent module provides local level-set/intersection tangent algebra.
- PR remains open, draft and unmerged. The build establishes the formalized conditional statements, not the physical interpretation.

**PR #679, CalderProjectorSignature**

- Current head: 3e531735d3bdd5162b14818aa112060cad076f69.
- Module: CalderProjectorSignature.lean, blob 114fe873d0a1cba8...
- Contains the Householder preferred-direction metric, negative normal direction, positive orthogonal slice, and Lorentzian-plus/native-transverse projector correspondence.
- No workflow run exists for the current PR head. It remains open, draft and unmerged. Its Householder statements are therefore not Lean-verified at this head.

The exact composition \(T\to\Sigma_\tau\to n\to g_H\to P\) is not yet a single verified Lean theorem. No new module or PR was created because the Householder algebra already exists in PR #679 and the level-set tangent gate already exists in PR #873. The correct next step is an owner-reviewed extension and exact-head build, not a duplicate submission.

A separate symbolic algebra check confirmed the conditional sign identities under \(h(n,n)=1\) and orthogonality assumptions. This is a symbolic check, not a Lean proof and not physical validation.

## 6. Glossary and discrepancy ledger

| Status | Term / proposition | Working meaning |
|---|---|---|
| Direct | Filament | One-dimensional particle-worldline representation in the historical SAT source |
| Direct | Time surface | Three-dimensional wavefront/timesheet intersecting filaments |
| Direct, later | Native metric | Positive-definite \((++++)\) frame with the stated \(cw=t\) convention |
| Assistant proposal | \(T(x)\) | Scalar function whose regular level sets could represent the time surface |
| Assistant reconstruction | \(u^\mu\) | Lorentzian unit time-flow vector in the older Blockwave action |
| Candidate map | \(n\) | Normalized native Riemannian normal to a \(T\)-level set |
| Candidate map | \(g_H\) | Householder-induced Lorentzian readout metric |
| Candidate map | \(P_L=P_E\) | Lorentzian plus-projector equals native tangent projector when index lowering uses \(g_H\) |
| Open | \(u=n\) | Not directly adopted; requires a source-defined identification |
| Superseded | Direct \(T\)-to-\(\theta\) current coupling | Conflicts with the later user-supplied no-explicit-\(\theta\) time-flow specification |
| Superseded | Reciprocal filament/timesheet deformation alternatives | Directly retired after Klein Fabric became common |
| Open | \(J^{\mu\nu}\to W^4\) | No source-defined finite-core support map |
| Open | \(T\), \(cw=t\), \(w\), proper time | No explicit identification or composition map |

The assistant's old Lorentzian projector is not intrinsically wrong. Its type is incomplete when imported into the later native \((++++)\) frame. The Householder map supplies one mathematically coherent interpretation, but it remains a candidate representation.

## 7. Operational integrity

- HsH main before publication: d6e4a0fa7fb069be4de82aec1150499b854cddb6.
- SAT archive main: 028862e6f1b0ffad2f56f4989a2cd0a769d266fd.
- HSH_RESOURCES main: 075b90cc621ce6910a4ea56a84640e5afb852383.
- HSH_RESOURCES root README and AI start guide were read; no private PRIOR_ART payload was accessed.
- Mersearch stable 1.0 remains the preferred archive search release, but all four request lanes are still in requested state. Lane 2 has a compact receipt; lanes 1, 3 and 4 have no request-scoped output receipts. No lane was overwritten or retriggered.
- Mysearch remains a scaffold with no validated full-archive run. No Mysearch result is claimed.
- Bounded GitHub repository retrieval was used as a disclosed fallback; it is not represented as a Mersearch search.
- Hale's historical remit is external-literature scanning and statistical calibration, reconstructed from the worker continuity/check-in records. No standalone signed specialist charter was found. Hale's current P0 assignment was not changed.
- P0 Code Grurple remains active. P1 remains overdue and NOT READY; P2 HOLD; P3 incomplete. No paper gate advanced.
- FIE review remains due December 8; the unrelated-source break remains due November 28.
- No task graph, PWH queue, worker assignment, automation, task ID, schedule, phase or cadence was modified.
- No sixth task, signet, conversation rename, direct-thread handoff or cross-thread delivery claim was made.
- No physical calculation, dataset fit, CODATA scoring, independent measurement or theory promotion occurred.

## 8. Next deeper cursor

1. Decide whether the Blockwave \(u^\mu\) remains an independent field or is conditionally identified with the normalized normal of a \(T\)-level foliation. Do not assume the identification.
2. If the \(T\)-representation is retained, define its domain, codomain, regularity region, normalization and global/local topology.
3. Have the owner review PR #679 and run its exact current head. Then formalize the \(T\)-normal composition without duplicating the existing Householder algebra.
4. Preserve the later user-supplied rule that the time-flow sector has no explicit \(\theta\) terms; test only the permitted indirect \(\mathcal M(\theta,u)\) route.
5. Define the map from the timesheet tangent/readout to the finite-core worldtube support and the \(J^{\mu\nu}\) current.
6. Keep the Klein Fabric construction distinct from the retired reciprocal-deformation alternatives.
7. Keep \(T\), \(cw=t\), the fourth spatial coordinate \(w\), and proper time distinct until explicit maps are supplied.

The key result is a conditional, explicit metric/projector bridge. It improves geometric fidelity while leaving the physical and dynamical identifications open.