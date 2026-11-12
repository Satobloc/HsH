# Geometry source-attestation and context-exposure crosswalk

**Scope:** a source-genealogy addendum to [issue #1418](https://github.com/Satobloc/HsH/issues/1418), not a resubmission of its mathematical analysis. This adds an earlier direct geometry witness and a recovered raw parent graph, then applies the source-exposure distinctions established in [issue #1620](https://github.com/Satobloc/HsH/issues/1620).

## 1. Evidence classes

Keep five claims separate:

1. **Source attestation:** a source exists with a recorded path, hash, role, message ID and timestamp.
2. **Audit read event:** a later reviewer actually read that source or a specified span.
3. **Context-exposure witness:** a particular historical model run demonstrably received that source content in its context.
4. **Output-uptake witness:** a particular output can be traced to a specified source span.
5. **Causal-influence evidence:** the source demonstrably caused a particular transformation or decision.

A role-tagged message is not a cryptographic identity claim. A file byline is not proof of the authoring process. A tool-call record is not proof of the exact bytes returned. An assistant's statement that an answer is “based on” a source is not, by itself, a context-exposure or causal-influence witness.

## 2. Earlier direct geometry: March 22, 2024

Raw source: DIMENSIONAL GRAVITY, conversation 252d05c0-22ed-4ea2-a474-7966ab13145a, Git blob SHA-1 2cea1924266418e19b825b95ae51e6b7cbace7e1.

The export contains 466 mapping nodes and 138 user-role messages. It is a multi-session conversation whose top-level update date is June 1, 2026; the relevant messages below are individually timestamped March 22, 2024.

Direct user-role messages:

- aaa28bd9-07f7-4740-b878-b485d4db44d0: a straight line and a helix around it; a plane perpendicular to the straight line intersects both.
- aaa2269b-7eab-4781-9454-647098d6747f: the two intersections are points; their separation is the line-to-line distance.
- aaa20670-fd77-4577-8e31-0a33a9e358c6: move the perpendicular plane along the lines.
- aaa2d0b1-017d-453e-b95a-b23915f87d32 and aaa2a1cc-e884-4f6a-800f-8afc29ab221a: the helix intersection traces a circle around the straight-line intersection; its radius is the helix's radial offset, independent of pitch, while the rate depends on pitch and plane speed.
- aaa2a868-90fa-439f-9d9d-4cf95519ab91 and aaa28a9a-dcfc-4835-8359-e7da7b36911c: the proposed dimensional lift uses one-dimensional filaments in four dimensions and a three-dimensional time surface; their intersections are proposed particle events.
- aaa26f3d-e831-49cd-976e-a85c5e3b749d: spherical expansion is a simplifying assumption, not a required global geometry.
- aaa24791-27b2-4b58-8f1a-19ee7e30d650: complexity is attributed to filament interactions, not to the time surface alone.

**Source-faithful reading:** the direct geometry is a relative construction with a moving codimension-one slice and point intersections. Its later four-dimensional description is a conceptual lift, not a complete metric, embedding, foliation, braid law or dynamical field theory. The source explicitly leaves the global wavefront geometry open.

Raw source: [DIMENSIONAL GRAVITY JSON](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22%E2%80%A226.06.01%E2%80%A2DIMENSIONAL%20GRAVITY%20%E2%80%94%20raw.json).

## 3. SAT4D and SAT-O document lineage

The two June 2025 documents are not raw user messages and should not be silently promoted to Nathan Direct propositions.

| Document | Provenance | Git blob SHA-1 |
|---|---|---|
| SAT4D_LIVE_DRAFT.txt | Nathan-bylined internal draft; document date June 2025 | 2a79fe25018cce7e99a2c33786d88b0551db6ae7 |
| SAT O1 4D.txt | Unbylined module; file-index last-write 2025-06-09 18:44:50 | 7577aa1ee5a6c3850ce3b226c75377de6367aedc |

The SAT archive and HsH copies have matching blob identities. The SAT4D draft's file-index last-write is 2025-06-09 18:53:29; its byline says Nathan McKnight and its document date says June 2025. The SAT-O O1 module has no internal author or date. Its file-index timestamps are file metadata, not proof of the author's identity.

Verbatim line geometry and action preserved by these documents:

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right)
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda},
\qquad
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu),
\qquad
L=\frac12 m v^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

The O1 module calls the “worldtube” a four-dimensional volume swept out by a vibrating filament, but supplies no thickening/sweep map from the one-dimensional image of gamma to that four-dimensional support. The line action and the named four-dimensional volume are therefore distinct mathematical objects until such a map is supplied.

The O1 module also adds specific Hopf/Borromean stability claims. Those claims are not present in the cited March 2024 direct messages; they remain later module propositions, not established consequences of the direct geometry.

Sources: [SAT4D live draft](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT4D_LIVE_DRAFT.txt) and [SAT-O O1 module](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT%20O1%204D.txt).

## 4. Blockwave raw parent graph recovered

Raw source: Blockwave Lagrangian formula, conversation 68f51c5a-49d4-832c-beb0-105d204e2f58, Git blob SHA-1 7e5dc51d2ec7f93e2277a37b491707b7acb3df83, created 2025-10-19T17:14:04.969Z and updated 2025-10-22T17:02:38.017Z.

The raw export contains 103 mapping nodes and 97 message-bearing nodes: 8 user, 50 assistant and 39 tool messages. It preserves the parent graph.

The user request d938b7a2-006c-46b5-9be2-67141d3a619b (“Give me the full Blockwave Lagrangian”) is an ancestor of assistant responses 76f4dd19-1e0e-4974-ab0f-12ab77fd23c9 and 6bb363d2-8772-4776-ac0c-daa1fabec82e (the latter follows the request for the fully expanded version).

The later user request ed108707-f5ea-4dd6-aa26-b1ed590237f4 asks to vary tension/tensile-strength assumptions and compare with actual known outcomes. The assistant's reduced model ab397c37-ba13-4477-a40f-4b3fe59f5854 is in that same parent chain:

ed108707 (user) → 36714db6 (assistant node) → 72afa43e (assistant node) → ab397c37 (assistant response).

This confirms role and ancestry. It does **not** establish the exact source bytes retrieved: the raw export preserves the file-search/tool-call path, but the corresponding tool payload is blank.

Verbatim assistant-generated full-action response, 2025-10-19T17:15:32.866Z, message 6bb363d2-8772-4776-ac0c-daa1fabec82e:

\[
\begin{aligned}
\mathcal{L}[g_{\mu\nu},u^\mu,\theta,J^{\mu\nu}]
={}&\frac{M_P^2}{2}R
+\frac{f_\theta}{2}\nabla_\mu\theta\nabla^\mu\theta
-\Lambda_\theta^4(1-\cos\theta)\\
&+\frac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}
(\nabla_\alpha u_\mu)(\nabla_\beta u_\nu)
+\frac{c_2}{2}(\nabla_\mu u^\mu)^2
+\lambda(u^\mu u_\mu+1)\\
&+\frac{\kappa_0}{4}J_{\mu\nu}P^\mu{}_\rho P^\nu{}_\sigma J^{\rho\sigma}\\
&+\frac{\kappa_2\ell^2}{4}
(\nabla_\alpha J_{\mu\nu})P^\alpha{}_\beta P^\mu{}_\rho P^\nu{}_\sigma
(\nabla^\beta J^{\rho\sigma})\\
&+\frac{g_h}{2}F_{\mu\nu}(\theta)J^{\mu\nu}
+\frac12J_{\mu\nu}\mathcal M^{\mu\nu}{}_{\rho\sigma}(\theta,u)J^{\rho\sigma}.
\end{aligned}
\]

The same assistant response defines \(P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu\), \(F_{\mu\nu}=\nabla_{[\mu}A_{\nu]}\), \(A_\mu=\alpha_*\nabla_\mu\theta\), \(u^\mu u_\mu=-1\), and \(\nabla_\mu J^{\mu\nu}=0\).

Verbatim assistant-generated reduced proposal, 2025-10-22T17:01:16.689Z, message ab397c37-ba13-4477-a40f-4b3fe59f5854:

\[
\rho\,\partial_t^2\tau
+\zeta\,\partial_t\tau
+K\tau
-C\,\partial_s^2\tau
+\beta\tau^3
=g\,\Theta(t,s).
\]

This is an assistant-proposed 1+1D damped/driven nonlinear torsional model. The raw graph confirms it follows the user's request, but the assistant does not derive it from the full action. No map is supplied from \((g_{\mu\nu},u^\mu,\theta,J^{\mu\nu})\) to \((\tau,\Theta)\), nor from the full-action coefficients to \((\rho,\zeta,K,C,\beta,g)\). The normalized parameter ranges proposed in the same response are not measurements, fitted values or a completed data comparison.

Raw source: [Blockwave Lagrangian formula JSON](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/25.10.19%E2%80%A225.10.22%E2%80%A2Blockwave%20Lagrangian%20formula%20%E2%80%94%20raw.json). The referenced [BLOCKWAVE.txt attachment](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE.txt) has blob SHA-1 ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d; its embedded authorship and original creation date remain unresolved.

## 5. Source-attestation matrix

| Material | Source attestation | Historical context exposure | Output uptake / causal influence |
|---|---|---|---|
| 2024 direct geometry | Raw user-role messages, IDs and timestamps verified | No witness that the June 2025 documents were authored with these messages in context | No causal link established |
| SAT4D draft | File, byline, date and blob verified | No authoring-context witness | Byline does not establish which sources caused the text |
| SAT-O O1 | File and blob verified; unbylined | No authoring-context witness | No causal link established |
| Blockwave raw conversation | User/assistant roles and parent graph verified | Tool-call path exists; tool payload is blank, so exact source exposure is unknown | Assistant equations are attributable to assistant messages; source-span uptake is unverified |
| BLOCKWAVE.txt | Current attachment blob identified | Historical upload bytes are not available in the raw tool payload | Embedded equation authorship and causal influence remain unresolved |

The raw Blockwave recovery supersedes the earlier limitation recorded in [issue #1418](https://github.com/Satobloc/HsH/issues/1418) that the raw JSON/parent graph had not been found. It strengthens the role/ancestry attribution without changing the mathematical conclusions. Issue #1418's original publisher submission was rejected for an invalid submission ID and has no canonical published artifact; this addendum is a distinct source-provenance supplement, not a retry or duplicate.

## 6. Glossary and mapping diagram

- **Filament / gamma:** the one-dimensional curve used in the 2024 description and 2025 line-action documents.
- **Time surface / timesheet:** the three-dimensional slice in the direct geometry; its exact embedding and global evolution law remain unspecified there.
- **Worldtube:** the current HsH physical-support term; the O1 document's four-dimensional volume requires an explicit construction from the line curve.
- **J^(mu nu):** rank-two current in the assistant-generated Blockwave action; not automatically identical to a one-dimensional curve, a four-dimensional support, or the separate HsH rank-three current.
- **tau(s,t):** continuous torsional field introduced by the assistant's reduced proposal. The live symbol registry has no tau entry, while historical SAT material already uses tau(x) for local twist/winding and tau_i for discrete twist sectors. Treat this use as local and unresolved; do not merge the meanings.
- **Theta(t,s):** assistant-introduced driver; no map to compact theta, u^mu, or the direct time surface is supplied.

Evidence and geometry are separate mapping layers:

    Direct 2024 source
      1D filament + 3D time surface
                  |
                  | conceptual proposal; no metric/embedding supplied
                  v
    SAT4D / SAT-O documents
      1D curve + line action
                  |
                  | missing thickening/sweep map
                  v
      4D worldtube support
                  |
                  | missing support/current correspondence
                  v
    Blockwave assistant reconstruction
      g, u, theta, J^(2)
                  |
                  | missing reduction/projection map
                  v
      tau(s,t), Theta(t,s)
                  |
                  | no measured system or dataset
                  v
      no empirical prediction established

Separately, the evidence chain is:

    SOURCE_ATTESTATION → AUDIT_READ_EVENT
             ⇢ CONTEXT_EXPOSURE_WITNESS
             ⇢ OUTPUT_UPTAKE_WITNESS
             ⇢ CAUSAL_INFLUENCE_EVIDENCE

The dotted steps require their own evidence; they do not follow automatically from the preceding step.

## 7. Corrections kept separate from originals

No historical equation above is overwritten or silently normalized.

- The conditional \(F_{\mu\nu}=0\) result for a smooth scalar \(\theta\), constant \(\alpha_*\) and torsion-free connection is already recorded in the earlier Blockwave signature audit; it is not a new result of this addendum.
- The Lorentzian normalization \(u^\mu u_\mu=-1\) and its projector remain distinct from the current HsH positive-Euclidean native metric. An induced-Lorentzian map is required before treating them as one formulation.
- No replacement for the reduced tau/Theta equation is proposed: the source-defined reduction map is missing.

## 8. Formalization and empirical limits

Existing PR #1133 has an exact-head Lean CI success on its recorded head; it proves conditional support-dimension and slice-map statements, not the physical identity of gamma, the worldtube, or J^(mu nu). Existing PR #1619 formalizes a type-level countermodel separating source attestation from context exposure, but its recorded successful builds are merge-reference builds, not an exact-head-only verification. Both remain open/draft/unmerged.

No new Lean theorem or compile was run. No measured system, dataset, units, uncertainties, prediction/fitting separation or independent measurement was supplied or analyzed. No physical calculation, CODATA scoring or observational validation is claimed.

## 9. Next deeper cursor

1. Recover the exact original bytes and author/date provenance of the BLOCKWAVE.txt upload, not merely the current repository copy.
2. Seek a historical context-exposure witness for the SAT4D draft and the Blockwave assistant response; do not infer exposure from byline, source citation or tool-call existence.
3. Continue the same evidence-class audit on the 2026 Klein Fabric/Minkowski source set using the existing role-verified source records. Large raw exports not re-read in this pass must remain marked as prior-read evidence.
4. Only then revisit the explicit maps from the line curve to finite-core support, from support to current, and from time-flow to timesheet. Keep the existing P2 geometry branch and its source-defined-map requirements unchanged.

**Status:** source genealogy strengthened; historical authoring-context exposure remains unproved; no theory promotion.
