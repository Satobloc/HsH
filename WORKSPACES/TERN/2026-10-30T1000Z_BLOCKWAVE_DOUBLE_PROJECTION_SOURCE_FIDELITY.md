# Tern Rook | Blockwave projector source-fidelity audit
**Date:** 2026-10-30  
**Disposition:** `SOURCE-FIDELITY FINDING | EXISTING PR LEFT UNCHANGED | LEAN NOT RUN | INTERNAL REPORT | HANDOFF RECORDED`

This is a Tern-role execution label, not proof that the historical Tern ChatGPT instance authored or received this work. No authenticated Tern thread was established.

## Executive result

A concrete mismatch exists between the later Blockwave prose and its displayed projected action:

[
\mathcal L_{u,\mathrm{proj}}
=\alpha P_{\mu\rho}P_{\nu\sigma}
(\nabla^\mu u^\nu)(\nabla^\rho u^\sigma).
]

With (u^\mu) unit timelike and (P) the orthogonal spatial projector, the factor (P_{\mu\rho}) projects the **derivative indices** as well as the field indices. In the local rest frame of (u), (P_{0\rho}=0). The displayed term therefore contains only spatial derivatives of spatial components. It has no derivative along the preferred flow direction (u).

The 2026 Blockwave file calls this term the “kinetic energy term” and says it propagates “only the two transverse polarizations.” Neither claim follows from the displayed expression:

- the term itself is a spatial-gradient/strain term, not a time-kinetic term along (u);
- the mixed projector has a three-dimensional image in four dimensions, not a two-dimensional image;
- the file does not provide the full constraint algebra or an independent reduction from three spatial components to two propagating polarizations.

This is an unsupported claim, not a proof that no completion can produce two modes. Other terms in a larger action could supply dynamics; their role and the full constraint analysis must be shown.

## Preflight and worker remit

The live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, onboarding, revival rotation, task-branch graph, Code Grurple roster, Tern inbox, incoming Enheduanna handoff, Morrow README/inbox, current PR #679, and the relevant Mersearch receipt/manifest were read.

Tern has no standalone `CHARTER.md` in the current workspace. The historical remit was reconstructed from the Tern Comptroller inbox, the 2026-10-30 branch/publisher reconciliation, and prior Tern work: control-plane reconciliation, source/receipt integrity, and mechanical/observable derivation review. This pass keeps that remit while obeying Lane 00's source-fidelity restriction.

The successor is Morrow. Morrow's documented remit is archive synthesis and dependency integration under a theory freeze; this handoff does **not** assign general physics or reopen theory integration. No authenticated historical Tern or Morrow ChatGPT thread was established. The repository inbox is a continuity surface only, not cross-thread delivery.

## Nathan Direct geometry: what is actually supported

The exact user-authored statement available in the recent conversation history says that time-distance is spatial distance, that the difference is the inherent motion along the (w) direction, that spacetime is spacelike, and that all four dimensions otherwise behave alike while the evolving intersection geometry changes the observational texture. This is the strongest direct geometry statement used here. Its raw archive message UUID was not recovered in this pass.

That statement specifies a preferred (w)-direction and a common length-like geometry. It does **not** itself specify a metric tensor, a sign-flip rule, a scalar potential (T), or a map from the SAT wavefront (\Sigma_t) to the Blockwave (T=\mathrm{const}) slices.

The file `DEVELOPMENT_FULL_CONVOS/SAT SIZE OF TIME.txt` contains a first-person opening about space/time being identical apart from expansion rate and the time direction's large proper motion. It is a Nathan-authored file, but the flattened transcript has no message-level role markers; it is corroborating context, not a raw role-authenticated message.

The 2026-10-29 `NATHAN_DIRECT_2026-10-29_TOPLESS_GEOMETRIC_INTAKE.md` records a later (w=ct) correction as an **indexing paraphrase**, not a verbatim message. The raw original message/UUID was not recovered. Current BEDROCK entry `ND-2026-10-21-02` still records the literal `cw=t`, positive-definite `++++`, and “Forest normalization,” with a warning to preserve the notation until the symbol/type map is checked. No BEDROCK edit is justified.

A previous Calder report treated `ALL_HELL.txt` as Nathan-attributed evidence for a spacelike fourth direction. That file is a flattened, untagged transcript. Its speaker attribution is not authenticated; it must not be used as Nathan Direct without the raw role graph.

## Source genealogy: SAT.O and Blockwave

### 1. SAT.O clean-core directive

**Source:** `SAT O Core Modules/SAT.O Official Directives.txt`  
**Document date recorded in archive:** July 2025  
**Blob SHA-1:** `167136310cdf33ca8f986f33634692314c1a0946`  
**Current file commit:** `c2d7dfe845cb0255385c8c690bbc9d36bae46f31`  
**Commit date:** 2025-10-27T01:13:03Z

The clean core specifies a four-dimensional differentiable manifold (M), one-dimensional filaments, and a propagating three-dimensional wavefront (\Sigma_t\subset M). Derived behavior must emerge from filament geometry and intersection with that wavefront. It prohibits unstated assumptions and says models outside the clean core are tentative.

It does **not** prescribe a Euclidean or Lorentzian metric signature, a preferred unit vector (u), a Blockwave projector, or a kinetic action. The later Blockwave construction is therefore an extension, not a verbatim SAT.O derivation.

### 2. 2025-10-19 raw action conversation

**Raw conversation blob SHA-1:** `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`  
**Assistant synthesis message:** `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19T12:29:46.538Z  
**Later user review-request message:** `f77f769e-8e74-4def-b4c9-bced0edbb8bc`, 2025-10-19T14:49:49.631Z

The first user request asks for the full action and definitions. The assistant then assembles a unified action from retrieved materials. Later, the user pastes an action and asks the assistant to review it. That later user message is a review request, **not proof that the pasted equations were authored or endorsed by Nathan**.

The assistant-generated action includes:

[
\frac{c_1}{2}P^{\alpha\beta}P^{\mu\nu}
(\nabla_\alpha u_\mu)(\nabla_\beta u_\nu)
+\frac{c_2}{2}(\nabla_\mu u^\mu)^2
+\lambda(u^\mu u_\mu+1).
]

The two (P) factors project both the derivative-index pair and the field-index pair. The separate (c_2) divergence term and other unprojected terms mean one must not infer that the **entire action** has no time dynamics. The narrower result is that the doubly projected (c_1) term itself contains no derivative along (u).

The same assistant action defines (A_\mu=\alpha_*\nabla_\mu\theta) and (F_{\mu\nu}=\nabla_{[\mu}A_{\nu]}). For a smooth scalar (\theta) and torsion-free connection, this gives (F_{\mu\nu}=0). The assistant's subsequent review message `68759291-9b8b-473f-81e4-08f563a15d0b` itself flags this. A nonzero field strength would require an independent connection or specified singular/multivalued structure; the exact-gradient ansatz alone does not provide it.

### 3. Assistant-generated Blockwave Ideal Model

**File:** `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT—Blockwave Ideal Model.txt`  
**Blob SHA-1:** `dd0631bc0b25c951dc5e1d6738280e08487b46b2`  
**Original creation date:** not recovered; repository ingest is later.

This version permits either a Lagrange-multiplier unit-vector formulation or a normalized gradient:

[
u_\mu=-\frac{\partial_\mu T}
{\sqrt{-\partial_\alpha T\,\partial^\alpha T}}.
]

Its minimal Lagrangian also contains an **unprojected** derivative term (\frac{\rho}{2}(\nabla_\mu u_\nu)(\nabla^\mu u^\nu)). This is materially different from calling the later doubly projected term the kinetic term.

### 4. Later Blockwave Hamiltonian file

**Source:** `SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt`  
**Blob SHA-1:** `13b6da983ea8dcad5509b1c6941b8855a2653677`  
**Current file commit:** `aaac961cfc519873eff650c12f39d005eda30e6a`  
**Commit date:** 2026-05-31T23:05:38Z  
**Internal source date:** not stated.

This later file changes the definition to:

[
u^\mu=\partial^\mu T,\qquad
C_1:\;u^\mu u_\mu+1=0,
]

and gives:

[
P_{\mu\nu}=g_{\mu\nu}+u_\mu u_\nu,
]

[
\mathcal L_{u,\mathrm{proj}}
=\alpha P_{\mu\rho}P_{\nu\sigma}
(\nabla^\mu u^\nu)(\nabla^\rho u^\sigma).
]

It then claims two transverse polarizations, a secondary condition (C_2\equiv u^\mu\partial_0u_\mu\approx0), second-class closure, ghost freedom, and classical stability. The file does not show the full constraint matrix or the required mode-count derivation.

The raw-gradient definition plus unit norm imposes the eikonal condition (g^{\mu\nu}\partial_\mu T\partial_\nu T=-1). For a smooth torsion-free, metric-compatible connection, an exact unit gradient is hypersurface-orthogonal and geodesic. The earlier normalized-gradient version is hypersurface-orthogonal but need not be geodesic when its normalization factor varies. This is a substantive narrowing of the field model, not just notation.

## Core mathematical audit

### A. Tensor type and projector rank

The covariant tensor (P_{\mu\nu}=g_{\mu\nu}+u_\mu u_\nu) is the induced spatial bilinear form. The vector-projecting endomorphism is its mixed-index form:

[
P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu.
]

For (u^\mu u_\mu=-1):

[
P^\mu{}_\nu u^\nu=0,
\qquad
P^\mu{}_\rho P^\rho{}_\nu=P^\mu{}_\nu.
]

Its kernel is the one-dimensional span of (u), and its image is (u^\perp), which has dimension three in four dimensions. Projection alone removes one longitudinal component; it does not leave a two-dimensional image.

### B. The displayed “kinetic” term is spatial-gradient only

In a local rest frame of (u):

[
g_{\mu\nu}=\operatorname{diag}(-1,1,1,1),
\qquad
u^\mu=(1,0,0,0),
\qquad
P_{\mu\nu}=\operatorname{diag}(0,1,1,1).
]

Consequently the displayed double-projected contraction has support only when all four contracted indices are spatial. Schematically:

[
\mathcal L_{u,\mathrm{proj}}
=\alpha\sum_{i,j=1}^{3}
(\nabla^i u^j)(\nabla^i u^j),
]

up to the stated index/metric convention. There is no (\nabla^0u^j) contribution and no (u^\mu\nabla_\mu u^\nu) derivative. This is a spatial-gradient/strain term on the (u\)-orthogonal slices.

The exact source expression can be retained if that is its intended role, but it should then be called a spatial-gradient term rather than the time-kinetic term. If the intended object is a kinetic term for spatial field components while retaining evolution along (u), a **candidate correction** is:

[
\widetilde{\mathcal L}_{\mathrm{kin}}
=\alpha\,g^{\mu\rho}P_{\nu\sigma}
(\nabla_\mu u^\nu)(\nabla_\rho u^\sigma).
]

This changes the historical equation. It only avoids projecting out the derivative direction; it does not establish two modes, ghost freedom, or stability. If (u=\nabla T), the action should be varied and constrained in the scalar variable (T), with the integrability restrictions carried through.

### C. The two-polarization claim is unsupported

The rank-three image of (P) is not two-dimensional. If (C_1) and (C_2) were the **complete** pair of second-class constraints for an otherwise independent four-component vector field, they would remove one phase-space pair and leave three configuration degrees of freedom, not two. But the file also defines (u=\nabla T), which changes the independent field content, and the displayed projected term is degenerate in the (u)-direction. A complete Dirac–Bergmann analysis must include all primary, secondary, and any tertiary constraints, their Poisson-bracket matrix, and the scalar-gradient integrability conditions. The source does not provide that analysis.

Therefore the correct status is `TWO_MODES_NOT_DERIVED`, not “two modes disproven.”

## Candidate Euclidean-to-Lorentzian composition map

The direct (w)-geometry and the Blockwave Lorentzian construction can be related by a precise **test hypothesis**. It is not a Nathan Direct equation.

Assume a positive-definite native metric with a unit, exact preferred normal (n=dw), and identify the SAT wavefront with the level sets of (w):

[
\delta=dw\otimes dw+h,
\qquad
\Sigma_w=\{w=\mathrm{constant}\}.
]

Define a separate Lorentzian readout:

[
g=\delta-2,dw\otimes dw
=-dw^2+h.
]

Choose (T=-w). Then:

[
u^\mu=g^{\mu\nu}\partial_\nu T=\partial_w,
\qquad
u_\mu=-dw.
]

The Blockwave spatial tensor becomes:

[
P_{\mu\nu}=g_{\mu\nu}+u_\mu u_\nu
=\delta_{\mu\nu}-(dw)_\mu(dw)_\nu
=h_{\mu\nu}.
]

The mixed form (P^\mu{}_\nu) is the projection onto the tangent space of (w=\mathrm{constant}). Thus, under these conditions, the Blockwave spatial metric equals the Euclidean metric induced on the native timesheet.

This is an explicit composition:

[
(\delta,dw)
\xrightarrow{\;g=\delta-2dw^2\;}
(g,u)
\xrightarrow{\;P=g+u^\flat\otimes u^\flat\;}
h=\delta|_{\ker dw}.
]

Conditions and limits:
1. (dw\) must be unit with respect to (\delta).
2. The timesheet must be identified with a (w=\mathrm{constant}) level set; (w=ct) alone does not establish that identification.
3. (T=-w) fixes the orientation convention.
4. A global foliation requires the appropriate integrability/global-coordinate conditions.
5. The sign-flip is an additional metric rule. It does not follow from coordinate rescaling (w=ct) alone.

The associated operator (H=I-2\partial_w\otimes dw) is a Euclidean Householder reflection: (H^2=I) and it preserves (\delta). The Lorentzian form (g(v,z)=\delta(Hv,z)) is **not** the pullback of (\delta) by (H), because that pullback is just (\delta). The sign-flip therefore introduces a new bilinear form; it is not merely a coordinate change.

## Glossary

| Term | Stable meaning in this audit |
|---|---|
| (w) | Nathan's preferred length-like direction; exact raw Oct-29 normalization message remains unrecovered. |
| (T) | Blockwave scalar used to define a time-flow gradient. |
| (u^\mu) | Blockwave unit timelike flow vector; not automatically identical to the SAT preferred (w)-direction or a filament tangent. |
| (\Sigma_t) | SAT.O propagating 3D wavefront. Its identification with (w=\mathrm{constant}) is still a proposed map. |
| (P_{\mu\nu}) | Covariant spatial bilinear form; the mixed (P^\mu{}_\nu) is the vector projector. |
| (\delta) | BEDROCK's positive-definite native ambient form. |
| (g) | Separate Lorentzian readout candidate; not supplied by (w=ct) alone. |
| (\mathcal L_{u,\mathrm{proj}}) | Doubly projected spatial-gradient term in the later Blockwave file. |
| (C_1,C_2) | Norm constraint and claimed time-preservation/secondary condition; full constraint algebra not supplied. |

## Original propositions versus later translations

| Proposition | Provenance | Fidelity status |
|---|---|---|
| Four length-like dimensions, preferred (w)-motion, distinct experiential/readout texture | Nathan Direct, Oct-21 conversation history; raw UUID unavailable | Direct conceptual statement; no metric/action supplied |
| (w=ct) correction | Oct-29 intake paraphrase | Raw direct message unavailable; do not silently replace BEDROCK literal |
| (M), 1D filaments, 3D propagating (\Sigma_t) | SAT.O July-2025 clean-core directive | Historical core; signature unspecified |
| (P^{\alpha\beta}P^{\mu\nu}\nabla_\alpha u_\mu\nabla_\beta u_\nu) | 2025-10-19 assistant synthesis | Assistant reconstruction, user later asked for review |
| Normalized gradient (u_\mu=-\partial_\mu T/\sqrt{-\partial T\cdot\partial T}) | Blockwave Ideal Model assistant-generated text | Hypersurface-orthogonal option; not direct |
| (u^\mu=\partial^\mu T), (C_1), double-projected term, two modes | May-2026 Blockwave file | Later historical synthesis; role/authorship not authenticated |
| (g=\delta-2dw^2) and (P=h) | Current assistant reconstruction | Explicit candidate map; not a direct source or physical derivation |

## Discrepancy ledger

1. SAT.O clean core leaves metric signature unspecified; later Lorentzian Blockwave is an extension.
2. The 2025 action was synthesized by an assistant after a user request; the later user paste was a review request, not authorship.
3. The 2025 and 2026 projected actions place a spatial projector on derivative indices as well as field indices.
4. The 2026 file calls that double-projected term kinetic, although it removes derivatives along (u) in the (u)-rest frame.
5. The projector image has dimension three; “two transverse polarizations” requires further constraints or gauge structure.
6. (C_1/C_2) are asserted to be second-class without the full constraint matrix or completeness proof.
7. (u=\nabla T) with unit norm is a more restrictive field model than the earlier normalized-gradient option.
8. The 2025 assistant action's (A_\mu=\alpha_*\nabla_\mu\theta) makes (F=dA=0) for a smooth scalar and torsion-free connection; the assistant review itself flags this.
9. The (w=ct) correction is only present in an indexing paraphrase; BEDROCK still records (cw=t). No notation edit made.
10. The direct (w)-direction is not source-mapped to Blockwave (u=\nabla T).
11. (\Sigma_t=\{w=\mathrm{constant}\}) is a proposed identification, not a recovered equation.
12. The (g=\delta-2dw^2) sign-flip is a coherent candidate readout but an extra bilinear-form choice, not a coordinate transformation or direct derivation.

## Formalization targets and status

The existing draft PR #679 remains open, draft, and unmodified. The current head has no exact-head Actions run. No local Lean/Lake/Elan executable is installed, and the available GitHub connector exposes no permitted workflow-dispatch action. The Code Grurple interlock blocks branch/PR mutation. Therefore **no new theorem is claimed compiled**.

Formal targets for the existing formalization lane:
- mixed-projector idempotence, kernel (\mathrm{span}(u)), and rank three;
- support of the double-projected quadratic term only on slice derivatives;
- exact unit-gradient implies hypersurface orthogonality and geodesic flow;
- normalized-gradient versus raw-gradient/eikonal distinction;
- the conditional (\delta\to g\to P=h) composition;
- (F=d(d\theta)=0) for smooth scalar (\theta).

Lean would verify only these formalized conditional statements, not the soundness of the translation or physical truth of the premises.

## Comptroller controls and next cursor

- All four Mersearch lanes were occupied at preflight; no request was overwritten or submitted. The completed `calder-worldtube-inspiral-nathan-source-20261030-0124` receipt/manifest was used as navigation only. Its raw search payload is withheld.
- The 2025-10-19 role-tagged raw conversation was inspected directly. The separate Morrow–Aldus raw file surfaced by Mersearch was too large/truncated for complete message-level reparse; no text from its target UUID is attributed here.
- Code Grurple remains active. No public issue, paper, PR, branch, website, or BEDROCK write was made.
- HAGALAZ remains active in the task graph but backseat/hold while Code Grurple is active. The three paper gates remain separate and unchanged.
- No physical dataset/system was identified; no physical calculation or CODATA scoring was performed.
- No new tooling, paid service, automation, task ID, cadence, signet, or conversation-name change.
- Unrelated reading break: Jacoby historical navigation talk, lines 292–352; return cursor 353. FIE review is not due (last recorded 2026-10-27).

**Next Morrow cursor:** preserve Morrow's existing archive/provenance and theory-freeze queue. First recover the raw Oct-29 (w=ct) user message and its UUID if possible; then independently inspect the exact source chain for the May-2026 Blockwave file. Do not turn this handoff into general physics work. If the source chain is confirmed, record the double-projection/time-derivative issue as a bounded source-fidelity finding and route any formal proof request back through the existing Lean gate after Code Grurple standdown.
