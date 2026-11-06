# Additive Amendment 01: timewave equation provenance and formalization status

**Nominal key:** 2026-11-06T1000Z_s0  
**Parent receipt:** \`2026-11-06T1000Z_s0_mercer.md\`, blob \`60552120cccb852d61dd0f8c43e17dc6dd7dd84f\`  
**Selection:** h=634, seq=3170, ring index 16 = Mercer; next index 17 = Ravel.  
**Amendment type:** additive source-fidelity delta. The same-key parent receipt and parked handoff were already present on main. They were not overwritten and no second receipt or handoff was created by this amendment.

## 1. Why this amendment exists

The parent receipt records a separate bounded audit of the three-sphere construction. This amendment preserves an additional equation-level source audit of the 4 November timewave and symmetric-attribution material. It does not claim authorship of the parent receipt, authenticate a Mercer ChatGPT thread, or supersede the parent findings.

A user-supplied transcript capture was recovered from Library:

- \`Pasted text(20261105-010439).txt\`
- Created 2026-11-05T01:04:38Z
- 30,685 bytes, 476 text lines
- SHA-256 \`df918e7eb109a100d834bb7163caf2bfd6e8d49a43c95ac1ea084e167b149b38\`

It contains speaker labels for Nathan and the assistant, but is not the native conversation JSON. The original conversation ID, message UUIDs, parent graph, and active-node ancestry remain unavailable. The capture is a labeled transcript witness, not raw-export authentication. The earlier 00:07:42 capture referenced by a prior report was not recovered in the Library search. No transcript text or protected signet was copied into this repository amendment.

## 2. Nathan Direct geometry recovered from the transcript witness

The direct passage describes time as individual worldtube perturbations with a lightlike or photoneutrinolike disposition relative to a straight-vacuum reference. At larger scale, coordinated perturbations form an excitation wavefront whose shape is affected by differential path lengths and accumulated twist in the surrounding topology.

It separately identifies:

- the time surface / wavefront;
- its primary propagation direction along w;
- a double-shell approximation associated with the current universal-gravity-well picture;
- a proposed relation between that double shell, the timesheet, and the metric;
- possible connectivity or a stretched structure across the front, explicitly left open.

The direct text also says the time surface need not be a material spacetime-fabric-like structure. It may be, but that is not required by the current description.

The mutual worldtube-timesheet curvature description is a working hypothesis. Intrinsic curvature, extrinsic curvature, ambient Riemann curvature, and any constitutive back-reaction operator have not been distinguished. The direct source does not define an embedding, metric, curvature tensor, field equation, or observable map for this construction.

### Candidate type diagram, with unresolved maps left explicit

\`\`\`
individual worldtubes W_i
       | local lightlike / photoneutrinolike perturbation
       v
coordinated excitation front F  <--- shape depends on differential paths / twist
       |
       +---- propagation direction w  (distinct from the front itself)
       |
       +---- possible cross-front connectivity C (OPEN)
       |
       v
double-shell approximation D ----?----> metric g / timesheet representation

worldtube-only  <----?---->  mutual/equidistributed  <----?---->  timesheet-only
\`\`\`

No embedding, projection, sweep, or composition map is supplied. In particular, no map establishes equivalence among the three interaction-allocation descriptions.

## 3. Three different classification axes

### A. Direct interaction-allocation descriptions

The transcript describes three alternatives:

1. true-block: static worldtube geometry is assigned the driver role and the timesheet response is dynamic;
2. worldline-only: a flat or static timesheet is assigned the driver role and worldlines carry the dynamics;
3. mutual/equidistributed: the interaction is represented on both sides.

The same passage says a dynamic-block formulation is expected to be the likely default because of equidistribution. It does not unambiguously establish whether "dynamic block" is a synonym for the mutual model or a fourth category. Preserve that ambiguity rather than silently converting three alternatives into four.

### B. Historical SAT.4D calculation modes

The separate \`Module_0A_interpretive_modes.tex\` gives a development ladder:

- Mode 1, True Block: filament kinematics frozen; the time wavefront accounts for apparent change.
- Mode 2, Triggered Dynamics: the wavefront still leads but nudges local filament parameters.
- Mode 3, Crystallisation: filament dynamics are determined during the sweep; afterwards they are fixed history and the wavefront becomes an ordering label.

The July 2025 \`SAT.4D Deployment Guidelines.txt\` uses different names: Mode 2 Semi-Dynamic Block and Mode 3 Solidification Front. Its Mode 2 still permits local filament adjustments; it is not a filament-only equivalent.

### C. Assistant synthesis

The assistant-authored \`PARADIGM RUBRIC.txt\` calls three modes equivalent and labels Mode 2 "filament-only equivalent representation" and Mode 3 "fully dynamic block/wavefront dynamics." Those labels do not match the actual O0-A mode definitions or the July guidelines.

**Discrepancy:** interaction-allocation models, calculation/approximation modes, and the current excitation-front mechanism are three different axes. They must not be collapsed into one three-mode taxonomy.

## 4. Equation genealogy and exact source register

The following are separate historical artifacts, not equations derived from the 4 November timewave description.

| Artifact | Blob SHA-1 | First extant repository commit |
|---|---|---|
| SAT O1 4D.txt | \`7577aa1ee5a6c3850ce3b226c75377de6367aedc\` | 2025-10-27T00:40:28Z |
| BLOCKWAVE.txt | \`ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d\` | 2026-10-08T02:42:49Z |
| SAT-Blockwave Ideal Model.txt | \`dd0631bc0b25c951dc5e1d6738280e08487b46b2\` | 2026-10-08T02:42:49Z |
| BOSONIC TIME AND TWO GRAVITIES.txt | \`bbc868efd38c38ba4710f82da1246f60d053aaa2\` | 2026-09-04T21:03:02Z |
| Module_0A_interpretive_modes.tex | \`2238dbe4447276b60e53f202153527585e16e5c5\` | 2026-09-04T21:48:30Z |
| SAT.4D Deployment Guidelines.txt | \`6a1ef773c40f805aace5fd61e3584ba50c21241d\` | 2026-09-04T21:48:30Z |
| PARADIGM RUBRIC.txt | \`0d9511bc8a38d7d7431c702dc02159ef0a470bdf\` | 2026-10-23T15:33:37Z |

The BOSONIC TIME file is byte-identical in the SAT archive and HsH paths. Its first extant repository commit is not its authoring date. The file has no raw role graph; its \(u^\mu\)-phonon and strain narrative is not authenticated as Nathan-authored. The O0-A TeX file has blank author/date fields. The Guidelines file states July 2025 and names the SATO.4D Coherence Project. The Paradigm Rubric is an assistant synthesis, not a primary user transcript.

### SAT-O1 original equations, unchanged

\`\`\`tex
\gamma^\mu(\lambda) =
\left(
  \lambda,
  A_x \sin(k_x \lambda + \phi_x),
  A_y \sin(k_y \lambda + \phi_y),
  A_z \sin(k_z \lambda + \phi_z)
\right)

v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}

S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)

L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
\`\`\`

This is a one-dimensional curve in the stated four-dimensional ambient space. It does not itself specify finite-core thickening or the timewave map.

### BLOCKWAVE J2 original equations, unchanged

\`\`\`tex
J^{\mu\nu} =
\frac{1}{2}\epsilon^{\mu\nu\rho\sigma}
\nabla_\rho B_\sigma

\nabla_\mu J^{\mu\nu} = 0
\`\`\`

This is a conserved rank-two worldsheet-current construction. It is not a 3-form current and is not a timewave equation.

The separate Ideal Model uses fields \((g_{\mu\nu},u^\mu,\theta)\), with \(u^\mu u_\mu=-1\) and compact phase \(\theta\sim\theta+2\pi\). Its minimal action begins with:

\`\`\`tex
\mathcal{L}_{\min} =
\frac{M_P^2}{2}R
+ \lambda(u^\mu u_\mu+1)
+ \frac{\rho}{2}(\nabla_\mu u_\nu)(\nabla^\mu u^\nu)
+ \frac{f^2}{2}\partial_\mu\theta\,\partial^\mu\theta
- \mu^4(1-\cos\theta)
+ \frac{\alpha_1}{M_*^2}[(\nabla u)^2][(\partial\theta)^2]
+ \frac{\alpha_2}{M_*^2}(\nabla_\mu u_\nu)\partial^\mu\theta\,\partial^\nu\theta
+ \frac{\beta}{M_*^2}[(\partial\theta)^2]^2
\`\`\`

This Ideal Model does not contain the explicit J2 current above. The two Blockwave files must remain separate.

### Historical strain-expression discrepancy

- BOSONIC TIME transcript, line 293: \(S_{\mu\nu}=\nabla_\mu u_\nu\).
- July Guidelines, line 50: \(S_{\mu\nu}=\nabla_\mu u_\nu+\nabla_\nu u_\mu\).

These are not the same tensor: the first retains the antisymmetric part, while the second is twice the symmetric part. A standard symmetric derivative can be written \(2\nabla_{(\mu}u_{\nu)}\), with further projection needed if a spatial strain/shear tensor is intended. This is standard-reference bookkeeping only. Neither expression is promoted as a corrected SAT equation because the direct timewave source does not define \(u^\mu\), a metric, a hypersurface normal, or a strain tensor.

## 5. Symmetric attribution and formalization boundary

The direct transcript describes a general default: when an interaction-dependent property, action, shape, or force has no known preferential carrier, assign it evenly as a representation convention, while allowing evidence or computational convenience to justify asymmetry. It also mentions choosing a view along a maximally symmetric axis.

The assistant's \(Q_A=Q_B=Q/2\) expression is assistant-origin. It is a scalar additive two-participant special case, not a general equation for arbitrary shapes, actions, or forces. It does not formalize the maximally-symmetric-axis selection rule.

The direct text calls the equal-and-opposite force idea a generalization of Newton's first law. The assistant correctly distinguishes Newton I (inertia) from Newton III (reciprocal forces), while noting that field-carried momentum and system boundaries require care. The proposed universal structural reciprocity principle remains distinct from standard Newton III.

### Existing Lean PR #1378: current-head correction

- PR #1378 remains open, draft, unmerged.
- Current head: \`c82250555676cb4c6d46bcd938b1c6704e986dff\`.
- Current file blob: \`39c1ea75566e5a0a216bbbe362f7222ce1743339\`.
- Current-head run #41960650505 failed.
- Earlier run #41956842305 succeeded on older head \`510b41bb15313eb3a29673d49ac4f415d0bb427a\`, not the current head.

The current failed log shows a documentation comment immediately before a \`section\` command, producing a parser error at line 180, followed by namespace/type errors and unsolved goals. The failed counterexample's \`#print axioms\` includes \`sorryAx\` because the build left goals unresolved. The earlier theorem declarations printed \`[propext, Classical.choice, Quot.sound]\`, but the current whole module does not compile. No fix or PR edit was attempted.

The theorem is GEN/DERIVED and conditional on a finite participant type, group action, transitivity, invariant measure weights, invariant allocation density, and fixed total. It proves equal allocation only under those assumptions. Its orbitwise statement correctly leaves distinct orbits unconstrained; a chiral model may have separate handedness orbits. It does not establish physical symmetry, a worldtube-timesheet type isomorphism, a force law, Forest Normalization, or observational truth.

## 6. Glossary and unresolved map contract

| Symbol/term | Current source-faithful meaning | Missing definition |
|---|---|---|
| \(W_i\) | individual worldtube/history | support dimension, embedding, metric |
| \(F\) | coordinated timewave/excitation front | intrinsic object type and regularity |
| \(w\) | primary propagation direction | vector/coordinate/tangent/normal status |
| \(D\) | double-shell approximation | construction and projection to metric |
| \(g\) | metric-equivalent target of the double-shell description | explicit map and domain |
| \(C\) | possible cross-front connectivity | topology, field type, adjacency rule |
| \(K_W,K_F\) | shorthand for proposed worldtube/front curvature | intrinsic/extrinsic/ambient curvature choice |
| true-block / worldline-only / mutual | alternative interaction allocations | equivalence maps and conditions |
| WWRD rope heuristic | first-blush geometric intuition only | no physical equivalence established |

Any future map must specify domain, codomain, support dimension, orientation, regularity, boundary/closure conditions, causal structure, metric compatibility, and composition behavior. No hierarchy or nesting is established by analogy alone.

## 7. Tools and operational state

- Mersearch is not callable in this runtime and all four existing request lanes are occupied. No lane was overwritten or retriggered. Direct GitHub search and Library retrieval were bounded fallbacks, not a completed Mersearch run.
- HsH, SAT archive, and HSH_RESOURCES default branches are main; each repo reports zero forks. HSH_RESOURCES was limited to its README/front door; no content search was performed.
- No local HsH clone, Lean, Lake, or Elan was installed.
- Math Hopper PR #991 remains open/draft and Issue #578 remains open; the available smoke/extraction path is not a completed three-repository Lean pilot.
- Whirligig remains a separate specialized solver; it was not used.
- SciSpace is available but unnecessary for this internal source audit.
- No new tool, package, fork, paid service, branch, PR, or public issue was created.

## 8. Freshness, paper, and task controls

- The optional Meridian-to-Mercer handoff for h634:s0 was read. It remains unmarked consumed because no authenticated Mercer thread was established.
- The side reading advanced from the parent receipt cursor: TheTANGLE lines 1241-1280 were read; next cursor is 1281. No physical break is claimed.
- Last full FIE review: 2026-10-27. Next review due 2026-11-10, not yet due.
- P1 2026-11-09, P2 2026-11-30, and P3 2026-12-14 remain separate gates. No gate advanced.
- No CODATA scoring, physical calculation, dataset fit, prediction, or observational validation was performed.
- No BEDROCK edit, theory promotion, paper edit, task change, task-ID change, cadence change, or schedule/phase change was made.
- Existing :00 task ID \`6aa1fe0de5e48191b886496095b1343f\` and hourly phase are unchanged. The :12 lease remains disabled. No sixth task was created.
- No authenticated Mercer or Ravel ChatGPT thread was established. No new ChatGPT thread was created and no cross-thread delivery or acknowledgment is claimed.

## 9. Next cursor

1. Recover the raw 4 November conversation export and message UUIDs for the timewave/symmetric-attribution passage.
2. Define the typed worldtube, front, propagation-direction, double-shell, metric, and connectivity maps before formalizing curvature or equivalence.
3. Reconcile the two historical strain expressions only after a direct source defines the intended \(u^\mu\), metric, projection, and constitutive role.
4. Have the owner of PR #1378 correct the documentation-comment/section boundary and rerun the current head. Do not treat the older successful run as current verification.
5. Keep the WWRD rope construction heuristic-only unless an explicit physical map and independent validation are supplied.
