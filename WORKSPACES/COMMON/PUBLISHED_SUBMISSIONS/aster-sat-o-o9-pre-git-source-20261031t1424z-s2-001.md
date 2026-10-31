# Aster source-genealogy addendum: SAT-O O1/O2 and mass-O9 pre-Git witness

**Status:** source-provenance correction and conditional geometry proposal only. This addendum extends the existing O9 chronology record (#1141); it does not replace it, promote theory, or alter a paper gate.

## 1. Mersearch-first source set

The completed request loom-sato-blockwave-source-set-20261030-2017 has a readable RUN_MANIFEST.json, SEARCH_RECEIPT.json, and SEARCH_RECEIPT.md. The current four Mersearch lanes remain occupied; no new request was submitted and no lane was overwritten.

The April 2025 SAT Framework Analysis export is present byte-identically in HsH and SAT_THEORY_ARCHIVE. These are two repository copies of one conversation, not independent witnesses:
- Raw export blob: c9dbeab330a434cf86d35879528760970e837943.
- Conversation: 67f098c8-7a5c-8005-9d25-3479c2ccbe08.
- Direct user messages include 2025-04-05 03:22:26.658Z (filamental trail as additive particle/time-surface path), 03:31:27.763Z (“fermions are our filaments and bosons are our ripples”), 04:16:31.487Z (structural logic versus dynamic interactions), and 04:28:05.567Z (tentative energy-transfer interpretation).
- HsH path: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/25.04.04•26.06.01•SAT Framework Analysis — raw.json
- Archive duplicate: SAT_THEORY_ARCHIVE_2023-25 / SAT Framework Analysis — raw.json

The June 2026 Geometry in Physics export likewise has duplicate repository copies. The direct user message at 2026-06-09 01:37:16.817Z says the electron is a single-coil particle worldline/tube, quarks form two- and three-braids, and photons/true bosons are vibrations on filaments. This is a direct conceptual statement, not a defining equation for finite-core thickness or a tube-construction map. HsH raw export blob: 2e0c8477873583b92f20a0a3f2af6528643b4a8a.

## 2. June 2025 SAT document equations: document-level, not direct-message equations

A file-search text view of SAT_FULL_BUILDOUT.pdf appears in the SAT Theory Synthesis raw export:
- Raw conversation blob: 0d745e65bf052e099f1db00b6fa81e763cb232d2
- Tool message: 5b780abd-de88-43b4-8873-2ea98b73d6ed
- Conversation: 681b9765-ad68-8003-bf8a-2f97d3fdbb4e
- Document title/byline/date in extracted text: SAT / Nathan McKnight / June 2025.
- The document itself acknowledges that portions of the mathematics were assisted by tools such as ChatGPT.
- The original PDF binary was not recovered. The raw JSON blob SHA above is not the PDF's binary SHA.
- The extracted view is timestamped 2025-06-18 16:43:04Z; the later archive history/index records a June 20 finalization/creation entry. Treat these as exposure and archive-index dates, respectively; the discrepancy is unresolved.

The same core equations appear in a later SAT 22Jun25.pdf file-search view in the SAT O Rewrite Supervisor raw export (blob d6faa4aef4c7549e233c7eb169b6362040a2911f, message edd53d7b-210f-4cae-922f-bc64d1de39bb, 2025-06-23 04:04:33.611Z). This is another document snapshot, not an independent author witness.

### SAT.O1 — verbatim extracted equation

\[
\gamma^\mu(\lambda)=
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right),
\qquad
v^\mu=\frac{d\gamma^\mu}{d\lambda}.
\]

The document describes this as a one-dimensional filament curve in \(\mathbb{R}^{3,1}\), with a three-dimensional resolving surface \(\Sigma_t\). It does not itself define a finite-core four-dimensional region.

### SAT.O2 — verbatim extracted equation

\[
\widetilde g^{\mu\nu}(x)
=
\left\langle v^\mu v^\nu\right\rangle_{\mathcal F(x)},
\qquad
g_{\mu\nu}(x)=\left(\widetilde g^{\mu\nu}(x)\right)^{-1}.
\]

The document then constructs a Levi-Civita connection and curvature from \(g_{\mu\nu}\). The average is not accompanied by a fully specified measure/weight, support kernel, nondegeneracy condition, or signature condition. The inverse is therefore an asserted construction, not a completed existence proof. No reverse map from a metric/readout to the generating filament ensemble is supplied.

### SAT.O9 mass-spectrum equation — verbatim extracted equation

\[
m^2=k\left(N+\beta Q^2-a\right).
\]

The same document defines \(Q\) as winding around a compact cycle and describes \(k,\beta,a\) as calibrated using ground-state masses. The later standalone implementation makes the fit dependence explicit: O9.txt contains non-executable function stubs, while O9.tex uses least-squares fitting of \(k\) and \(\beta\) against ground-state masses with a_fixed=1.0. This is a calibrated ansatz, not an independently established first-principles mass prediction.

Standalone file chronology:
- SAT O Core Modules/O9.txt: blob 676ce08c09226e4bde5a4d8efa3d7f4da228a1d8; first extant Git path commit 2025-10-27 01:13:03Z (commit c2d7dfe845cb0255385c8c690bbc9d36bae46f31).
- SAT 4D Theory Work/O9.tex: blob 14240f3dd9d11eefa7e9154514a6737debcd5bfa; first extant Git path commit 2026-09-04 21:48:30Z (commit 9651a18ab461eb60e059e925cb4f7e1b882ec350).
- The mass formula is already present in the June 2025 document-level witness, so the standalone O9 files are not the formula's earliest located occurrence.

## 3. O9 is a reused label, not one continuous module

Three distinct uses must remain separate:

1. **Mass-spectrum O9:** present in the June 2025 SAT document and later standalone O9 files described above.
2. **Optical-retardance O9:** a separate user-uploaded document was given the temporary “Module O9” designation by the assistant on 2025-06-23 03:47:53Z; the user confirmed that designation at 03:48:29Z. The label is assistant-proposed and user-approved, not evidence that it was the original document's own module number. Its private attachment content is not reproduced in this public addendum.
3. **Graviton/topological-strain O9:** separate file DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_O9_Graviton_Topological_Strain.txt, blob c7095697a70f39b3bd05af414e1124ae45a17926, first extant Git path commit 2026-10-01 20:35Z (commit dffebc7923fcb88f4be48eccba3f2d1f8704c365), document byline “SAT_O Collaboration.” It is not a recovered Nathan Direct equation.

## 4. Blockwave provenance boundary

The 2025-10-19 “The Tourist Tailor” raw conversation (blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77, conversation 68f4d9b5-b908-832e-940e-6782db174a4a) records:
- User request fa1e045d-a7ff-4dcf-8110-ae9fa555a54a, 12:29:41.119Z: “Can you give me the full action and definitions.”
- Assistant action synthesis 121d607d-53e7-4b5a-8a7a-75d7e09deb3d, 12:29:46.538Z.
- Further assistant synthesis 3039b226-02d4-41a3-a2d3-c338e25204a9, 12:31:03.318Z.

The compact phase/current equations in that assistant output are:

\[
\theta\sim\theta+2\pi,\qquad
A_\mu=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]},
\qquad
\oint_\gamma A_\mu\,d\ell^\mu\in2\pi\mathbb Z,
\]

\[
\nabla_\mu J^{\mu\nu}=0,
\qquad
S_{\rm int}\supset\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}.
\]

The user asked for the action; the equations were supplied by the assistant. The response is not a Nathan Direct equation source. The earlier Sable/Calder provenance and sign crosswalk is already recorded in the existing Blockwave issue/report set; this addendum does not reproduce the full action or create a duplicate Blockwave publication.

## 5. Separate mathematical qualifications and candidate map

These are qualifications/proposals, not replacements for the source equations.

- If \(\theta\) is a smooth, single-valued scalar and \(\alpha_*\) is constant, then \(F=dA=\alpha_*d^2\theta=0\). Nontrivial loop periods require a circle-valued/patchwise phase or defect/excluded-core construction; \(\oint A=2\pi\alpha_*n\), so the stated \(2\pi\mathbb Z\) normalization requires an explicit normalization of \(\alpha_*\).
- A one-dimensional curve in four dimensions and a two-dimensional worldsheet are different supports. A two-form current \(J^{\mu\nu}\) needs an explicit worldsheet/sweep construction or another specified current map; it is not automatically the current of the O1 curve.
- A candidate geometric thickening, **not a recovered Nathan equation**, is:
  \[
  \gamma:I\hookrightarrow M^4,\quad \operatorname{rank}\nu\gamma=3,\quad
  W_\epsilon^4=\exp^\perp_\gamma(D_\epsilon(\nu\gamma)).
  \]
  With a specified ambient metric, a smooth embedded curve, an injective normal exponential map up to radius \(\epsilon\), and a transverse timesheet \(\Sigma_t^3\):
  \[
  M_t^3=W_\epsilon^4\cap\Sigma_t^3,\qquad
  R_t^2=\partial W_\epsilon^4\cap\Sigma_t^3,
  \]
  and the normal-bundle projection maps the mouth \(M_t^3\) to the centerline intersection \(\gamma\cap\Sigma_t^3\), with a \(D^3\) fiber and \(S^2\) boundary fiber. This is a standard tubular-neighborhood construction, not a physical mechanism or proof that the current H(s)H worldtube is generated this way.
- The 2025 O1 document uses \(\mathbb R^{3,1}\); the current H(s)H geometric branch uses a different four-dimensional ambient convention. No signature-change map was recovered in this source pass.
- The O2 metric-generation route \(\mathcal F\to\widetilde g\to g\to\Gamma\to R\) is geometry-first. The Blockwave action starts with \(g,u,\theta,J\) as fields. The composition between those two routes is missing.

## 6. Lean and empirical status

Existing exact-head builds were inspected, not extended:
- Aster PR #905, run #40980922900, succeeded on head f168f618...; this is source-origin/phrase-role formalization, not a physical geometry proof.
- Sable PR #1098, run #41176686005, succeeded on head 7666f2cb...; it proves conditional current-support/degree statements, not the tubular-neighborhood construction above.
- No new Lean module was added because the source does not yet define the ambient metric, normal-bundle data, injectivity-radius bound, or current map needed to state the proposed construction faithfully.

No measured dataset, CODATA adjustment, physical prediction, or observational validation was performed. The optical note remains a proposed model/experiment, not measured evidence. No BEDROCK, manuscript, or paper-gate promotion follows.

## 7. Disposition

This is a source-genealogy correction and a typed map proposal. It does not merge the mass, optical, and graviton O9 objects; it does not promote the Blockwave action to Nathan Direct; and it does not claim that the proposed tube construction is already part of the physical theory.

Related records: existing O9 chronology issue #1141; existing Blockwave source crosswalk/publication #1146; Aster surface-map contract #1148.