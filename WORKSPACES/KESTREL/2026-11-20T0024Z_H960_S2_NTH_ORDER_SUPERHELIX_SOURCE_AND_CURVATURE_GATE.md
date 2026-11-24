# Kestrel h960:s2 | Nth-order superhelix source recovery and curvature gate

**Disposition:** SOURCE_RECOVERED / SOURCE_AUTHORSHIP_MIXED / EXISTING_PROJECTION_PROOF_REUSED / NEW_CURVATURE_PR_FAILED_PARSE / NO_PHYSICAL_RESULT

## Executive result

The old 4DHH/Nth-order-superhelix formulation Nathan referred to on June 23 is now located in the archive, rather than reconstructed from memory.

The strongest source distinction is:

1. Nathan Direct on June 23 describes one nested 4D helical worldline/worldtube structure and explicitly leaves the scale placement unresolved.
2. The archive-root SAT.4DHH.UC PDF contains the Nth-order generator and a much larger action, but its first-page prompt is explicitly marked LLM DROP. The PDF extraction was requested by Ravel/ChatGPT, not authored by that extraction process.
3. A November 8 four-message export repeats the same full action in a USER-role message. The export does not include the context preceding that message. The user-role transmission is established; original authorship of the embedded equations is not.
4. The June 2025 SAT4D Canonical Summary is the cleaner earlier baseline attributed to Nathan. It has a simpler three-axis hyperhelix, not the later arbitrary-order harmonic sum.

The useful conclusion is not that the later action is wrong or right. It is that the source lineage is now clearer, and the missing object-to-field maps are easier to state precisely.

## 1. Nathan Direct source: one nested structure

Source conversation: SAT Overview, conversation ID 6a3a279a-10cc-83ea-9abf-4fc1dab9fb55.

Raw archive blob: 023ff77688672546aeff02deb3745289f6709c90.

Relevant direct user messages:

- 28895d46-780e-46d9-a4cd-646f92fad193: describes one helical worldline/worldtube, hyper in four dimensions and super through nested layers. The scale factor is explicitly unresolved.
- e6310e36-45bc-4803-a90f-890f637bf70f: says the formulation has already been developed and is in the archive root.
- 3ace6464-be29-4aac-9256-02db06861ef1: directs the assistant to use the tools and reread onboarding if needed.

This is a conceptual source statement, not a complete action or a definition of the nesting maps. The phrase “one structure” should be preserved: worldline, worldtube, timesheet and scale descriptions must not silently become separate ontological objects. If they are different representations of one object, the maps connecting them must be explicit.

## 2. Archive-root Nth-order formulation located

The relevant root artifact is SAT.4DHH.UC.pdf, not the separate 4DHH LAGRANGIAN (nolat).pdf.

- PDF SHA-256: 9b28c5776516af59dd661485ac519983c9b77b56c435a4ec15436d24f8bf028f
- Extracted text: _AUTO_EXTRACTED_TEXT/SAT.4DHH.UC.txt
- Extracted-text blob: c3c63e983663a1648aa78ce9f591c28e7997f055
- Extraction: 150 pages, 5,560 lines, 194,649 characters
- Request ID: 2026-09-10_root_pdf_extraction_pass_002
- Requested by: Ravel / ChatGPT
- Extraction time: 2026-09-10T16:03:00.196293Z

The first page begins with an explicit LLM DROP marker and the prompt for a “fully explicit 4D superhelical action.” This is mixed-origin material, not a clean Nathan-authored derivation.

### Generator as archived

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\;
l_f\sum_{i=1}^{n}
\sin\left(\frac{2\pi n_i\lambda}{l_f}+\phi_i\right)\hat e_i
\right)
\]

The accompanying definitions say:

- \(n\) is the order, described as the number of harmonics.
- \(n_i\in\mathbb Z^+\).
- \(\phi_i\in[0,2\pi)\).
- \(\hat e_i\) are orthonormal directions in the three-dimensional transverse space.
- \(v=d\gamma/d\lambda\), \(a=d^2\gamma/d\lambda^2\), and \(b=d^3\gamma/d\lambda^3\).

This is the explicit Nth-order harmonic form sought in the June 23 exchange. A definition issue remains: if all \(\hat e_i\) are pairwise orthonormal in a three-dimensional space, there can be at most three of them. For arbitrary \(n\), the source must clarify whether directions may repeat, whether \(n\leq3\), or whether the harmonic index and direction index are different. No choice is made here.

### Curvature candidate and action

The source gives the schematic candidate

\[
R_{\mu\nu\rho\sigma}\sim
\left\langle a_\mu a_\nu v_\rho v_\sigma\right\rangle_{\mathcal F},
\qquad
R=g^{\mu\rho}g^{\nu\sigma}R_{\mu\nu\rho\sigma}.
\]

It then writes a four-dimensional action

\[
S[\gamma]=\int d^4x\,\sqrt{-g(\gamma)}
\left(
\mathcal L_{\rm Gravity}
+\mathcal L_\theta
+\mathcal L_u
+\mathcal L_J
+\mathcal L_{\rm Int}
\right).
\]

The source spells out the sectors as follows:

\[
\mathcal L_{\rm Gravity}=
\frac{1}{16\pi l_f^2}R+
\frac{1}{16\pi l_f^2}\frac{2}{6\pi}R^2
\]

\[
\theta(\lambda)=\arctan\frac{v^y(\lambda)}{v^x(\lambda)},\qquad
\nabla_\mu\theta=
\frac{d\theta}{d\lambda}\frac{\partial\lambda}{\partial x^\mu},
\qquad
\mathcal L_\theta=
\frac12(\nabla\theta)^2-\frac{1}{l_f^4}(1-\cos\theta)
\]

\[
u^\mu=\frac{v^\mu}{|v|},\qquad
P_{\mu\nu}=g_{\mu\nu}+u_\mu u_\nu
\]

\[
\mathcal L_u=
\frac12P^{\alpha\beta}P^{\mu\nu}
(\nabla_\alpha u_\mu)(\nabla_\beta u_\nu)
+\frac12(\nabla_\mu u^\mu)^2
+\frac{1}{l_f^2}(u^\mu u_\mu+1)
\]

\[
J_{\mu\nu\rho}(\lambda)\sim
\epsilon_{\alpha\beta\gamma\delta}
v^\alpha a^\beta b^\gamma\ldots,\qquad
\mathcal L_J=\frac14J^2+\frac{l_f^2}{4}(\nabla J)^2
\]

\[
\mathcal L_{\rm Int}=\frac12 JMJ+\frac12 FJ.
\]

The stated mass mapping is \(m_\psi=Q/l_f^2\) for point particles and
\(m_{\rm composite}=1/(Q l_f^2)\). The source says the only dimensionful scale is \(l_f\) and all couplings are dimensionless.

This report does not repeat the dimensional audit already present in Mercer/Meridian work. It also does not treat the action as a validated physical model. The displayed \(\partial\lambda/\partial x^\mu\), the ensemble, the three-form ellipsis, and the M/F tensors are not fully defined.

## 3. User-role repeat, authorship still unresolved

DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_24/Superhelix Field Theory.md:

- Conversation URL/ID: 69a53406-eec0-8331-a16c-74f0a671a327
- Exported: 2026-11-08T13:04:53.368Z
- Messages: 4
- File blob: b13a45b68ffc9a7c22011f5d8586e0c4c08fc2fb
- The first message is marked USER and repeats the same Nth-order generator and action.

The same prompt-like text appears in the PDF's LLM DROP. The four-message export does not recover the context before the first user message. Therefore this is a user-role transmission and later working reuse, not proof that Nathan originally authored every embedded equation. The assistant reply in the export praises the action but does not independently validate it.

The separate root file 4DHH LAGRANGIAN (nolat).pdf is a different 21-page topological-inversion document. It should not be substituted for the Nth-order superhelix action.

## 4. Earlier authored baseline

The extracted June 2025 SAT4D Canonical Summary begins with the title page:

- “SAT4D Canonical Summary — For Internal Use”
- Nathan McKnight
- June 2025
- Source PDF SHA-256: 40e571ba1ca8d25b3bc2e0d4c182321a3d24351816381bb5bc59b8320a6457a5
- Extracted-text blob: 75fa60ebd9273995332437ff10dbf7c069620b40

Its hyperhelix is the simpler three-axis form

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right).
\]

The draft describes a filament as a smooth one-dimensional curve in four-dimensional spacetime and a worldtube as the four-dimensional volume swept by a vibrating filament. It is the cleaner earlier baseline.

The later n=3 coordinate-axis formula reduces to this earlier three-axis form only under the parameter identifications \(A_x=A_y=A_z=l_f\) and \(k_i=2\pi n_i/l_f\), with phases matched. These conditions restrict the earlier independent amplitudes and wavenumbers. The relation is a special-case parameter map, not evidence that the later expression is a generalization in every degree of freedom.

The Nth-order expression is a sum of harmonics. It does not by itself define recursive self-nesting, a scale ratio, or a composition map. The June 23 nested-structure interpretation therefore remains a separate condition to be formalized, not an automatic consequence of the harmonic sum.

## 5. Explicit map contract

The June 23 “one structure” statement and the later Nth-order generator should be treated as a candidate nested object, not as an analogy between separate objects.

A minimal map contract, still a proposal, is:

- \(X_n\): the admissible state/object at nesting level \(n\), with its type and domain specified.
- \(\pi_n:X_{n+1}\to X_n\): the projection from one level to the next coarser level, including exactly what information it discards.
- \(P_{n\leftarrow m}=\pi_n\circ\pi_{n+1}\circ\cdots\circ\pi_{m-1}\): the composed projection for \(m>n\).
- Any reverse embedding or section must be separately defined and must not be assumed to exist or be unique.
- Worldline, worldtube, timesheet and observable readout must each be defined as a map or construction from the same underlying object if they are intended as compatible representations.
- A readout on a finer state descends to a coarser state only if it is constant on the fibers of the relevant projection.

This last condition is the subject of the existing Kestrel projection formalization. It is not a physical map from the Nth-order curve to a worldtube or instrument.

The still-missing source definitions include the finite-core/thickening map, the ensemble \(\mathcal F\) and its measure, the extension of \(\lambda\) away from the curve, the metric/connection, the three-form construction, the interaction tensors, and the map to an actual observable.

## 6. Lean status

### Existing projection result reused

Kestrel PR #873, head 94b6d96c91806a95505260a3c52220f4af294185, has exact-head CI success:

- Run #44090154878
- Job #134062868110
- Lean 4.34.0 / Lake 5.0.0
- 8,956 build jobs completed

KestrelProjectedIncidence.lean proves a generic factorization criterion: a readout factors through a projection precisely when it is constant on the projection's fibers, with associated uniqueness/existence results under the stated conditions.

This is a branch-local formal result. PR #873 remains draft/unmerged and is not integrated into main. It does not establish the Nth-order physical map.

### New conditional curvature-symmetry draft

PR #2143: https://github.com/Satobloc/HsH/pull/2143.

The new module formalizes the literal product \(a_i a_j v_k v_l\) and its finite weighted-ensemble version. Both are symmetric in the first index pair. If the displayed product itself, up to a scalar coefficient and with no omitted antisymmetrization, is required to satisfy Riemann first-pair antisymmetry, it must vanish.

This is conditional algebra, not a proof that the complete action is inconsistent. The source uses a schematic \(\sim\), so an omitted antisymmetrizing projection or different index structure remains possible and must be stated rather than assumed.

Status at initial report write: FIRST_HEAD_COMPILED / CURRENT_HEAD_IN_PROGRESS. PR #2143 is draft and unmerged, based on the existing infra/lean4-verification-20261023 branch; Amendment 01 supersedes the in-progress status with the completed current-head PARSE_FAIL result.

- Initial head 8ee0d01ee27274ef94b2fffe704d73b60957bc62 passed exact-head CI run #44648094755, job #135995753257, using Lean 4.34.0 and Mathlib commit 5ed2965256430c3649e86755f9576b54eca72435. The module compiled and its theorem-specific axiom reports showed propext, Classical.choice, and Quot.sound.
- The first executable witness used Real. Lean executed it, but the output was an opaque Real.ofCauchy representation rather than a readable numeral. The theorem statements were unchanged; the witness was changed to Rational.
- Intermediate head 41cde6e8fc4b17c88e6e739ab2043a16021f59e2 was cancelled when a newer commit arrived before checkout. It has no compile result.
- At initial report write, head 9ac2074d9e60c85cd7fcbd8eafbf19c2159ce8d2 had an exact-head run #44649028244 in progress. Amendment 01 records that run's completed failure.
- The local runtime has no lean, lake, or elan. No Factory Floor handoff is eligible until the current exact head succeeds and receives independent review.

## 7. Non-duplication and responsibility boundaries

Already-covered issues were not re-audited:

- Positive-semidefinite ensemble co-metric limitation: Morrow/Enheduanna source and mathematical work.
- Dimensional consistency: Mercer/Meridian work.
- Curve-to-worldtube and field-extension gap: Mira/Morrow source-fidelity work.
- Generic projection/fiber criterion: existing Kestrel PR #873.

Kestrel remains a cross-boundary synthesis companion, not the primary dimensional auditor, experimental verifier, or archive custodian. The exact source discovery should be added to Morrow's source genealogy when that lane next handles it; this report does not claim delivery or assignment.

## 8. Consequential case and next discriminator

The most likely six-month regret is not failure to invent another analogy or candidate system. It is failure to freeze one outsider-reconstructible chain:

\[
\text{measured system}
\to
\text{source-defined geometry}
\to
\text{explicit projection/composition maps}
\to
\text{calibrated readout}
\to
\text{uncertainty-aware prediction}
\to
\text{independent holdout/falsifier}.
\]

Kelvin vortex remains the cleaner finite-core/contour-readout candidate; GW150914 remains the more complex inspiral/calibration candidate. They are different systems and must not be treated as equivalent. P2 remains HOLD and no system is selected here.

Nathan's irreplaceable contribution is clarification of intended geometry, source meaning, and which competing scale-placement hypothesis is actually intended. Retrieval, parsing, code, covariance propagation, Lean execution, source indexing, and reader QA should remain delegated and reproducible wherever possible.

## 9. Lateral reading

A deliberate unrelated-source break was taken with E. M. Forster, The Machine Stops, Chapter I, Wikisource, lines 105–308. The next reading cursor is Chapter II, “The Mending Apparatus.”

The useful design observation is literary, not scientific: a representation becomes dangerous when it becomes the only route to what it represents. Every summary, reader, formal proof, and report should retain a direct route back to the original source or observation.

## 10. Execution limits

- Mersearch was not callable. Existing source-recovery records and bounded GitHub code/file retrieval were used as a fallback; no Mersearch search is claimed.
- HsH BEDROCK, Steering Charter, Three Paper Campaign, onboarding entry, revival rotation, current branch, recent receipts, and Kestrel source/continuity documents were read.
- HSH_RESOURCES was limited to its front-door/index documents. No private research payload was opened.
- No raw physical data, CODATA comparison, physical calculation, fit, prediction, independent measurement, or theory promotion occurred.
- No public research report was issued because the new formalization is untested and the embedded equation's authorship remains unresolved.
- No direct-thread delivery, consumption, or acknowledgment is claimed.
- The existing :24 task ID, schedule, prompt, phase, and enabled state remain unchanged. No sixth task.


## Amendment 01 | exact-head Lean result | 2026-11-20T00:56Z

**This amendment supersedes the earlier “current head in progress” status and changes the disposition to `NEW_CURVATURE_PR_FAILED_PARSE`.** It does not alter the source equations or the historical report.

### PR #2143 current-head result

- PR: https://github.com/Satobloc/HsH/pull/2143
- State: OPEN / DRAFT / UNMERGED; mergeable at last read.
- Exact PR head: `9ac2074d9e60c85cd7fcbd8eafbf19c2159ce8d2`.
- Base: `infra/lean4-verification-20261023`, SHA `368f9af8d95d061b4581688759ed3eda309e9886`.
- Exact-head Actions run: [#44649028244](https://github.com/Satobloc/HsH/actions/runs/44649028244), completed FAILURE at 2026-11-20T00:54:14Z.
- Job: `135998965182`; Lean 4.34.0; Lake 5.0.0.
- Run metadata records the exact PR head above. The job log's `GITHUB_SHA` is synthetic merge commit `73a48db8c96e74139bfa41eab987d15929c1f987`; the explicit exact-PR-head assertion passed.

The build reached 8,946/8,948 targets, then failed in `KestrelSuperhelixCurvatureSymmetry.lean`:

- Lines 32, 41 and 54: `unexpected token 'λ'; expected '_' or identifier`.
- Line 154: `nthSuperhelixThreeMode_is_special_case` is unknown as a downstream consequence of the preceding parse failures.
- The Rational `#eval` witness printed `1`.
- Several `#print axioms` commands emitted theorem-specific lists containing `propext`, `Classical.choice`, and `Quot.sound`; these partial diagnostics do not turn the failed module into a successful build.
- Tests, lint, global axiom audit, leanchecker and nanoda were skipped.

The likely minimal syntax repair is to rename the binder `λ` to an ordinary identifier such as `lam` throughout the three-axis definition, nth-superhelix definition and specialization theorem, or use an explicitly escaped identifier. **No repair or retry was made here.** Kestrel's role is cross-boundary synthesis, not primary proof ownership.

### Historical build distinction

The earlier head `8ee0d01ee27274ef94b2fffe704d73b60957bc62` did compile in run #44648094755 / job #135995753257. That head predates the Rational witness and the n=3 parameter-map theorem. Its success does not validate current head `9ac2074`.

The PR also received a separate Vercel preview failure because the free deployment allowance exceeded 100 builds in 24 hours. That is a deployment-rate limit, not the Lean failure.

### Interpretation and limits

The n=3 parameter map remains conditional on (A_i=l_f), (k_i=2\pi n_i/l_f), and matched phases. It is not a recursive nesting proof. The June 23 “one nested structure” statement still needs explicit scale projections, composition maps, worldtube/field construction and observable readout.

The literal curvature candidate remains source-qualified: if (a_\mu a_\nu v_\rho v_\sigma), or a finite weighted sum of it, is itself the curvature tensor up to a scalar with no omitted operation, its first-pair symmetry conflicts with Riemann first-pair antisymmetry and forces the tensor to vanish. The source's schematic (\sim) is undefined, so this does not establish that the full action is inconsistent. A different index construction or explicitly defined operation would need its own source and proof.

The existing PR #873 exact-head success (#44090154878, head `94b6d96c91806a95505260a3c52220f4af294185`) still proves only the generic readout/fiber-factorization criterion under its formalized assumptions. It does not instantiate the physical nested-superhelix maps.

The PR contains a constructed algebraic witness and a Rational `#eval`. This run did not create or rerun them. Their prior-permission status for a data-free numerical witness is not established; they are not physical data or physical evidence and should not be extended into physical fixtures without Nathan's specific permission.

**No LEAN_PROVED claim for PR #2143; no Factory Floor handoff; no public research publication; no physical calculation, CODATA comparison, fit, prediction, independent measurement, or BEDROCK promotion. P2 remains HOLD.**


Canonical receipt: [Kestrel h960:s2](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T0024Z_s2_kestrel.md).
