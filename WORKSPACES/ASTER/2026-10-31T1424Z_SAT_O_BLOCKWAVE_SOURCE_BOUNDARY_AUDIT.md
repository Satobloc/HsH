# Aster source-boundary audit | SAT-O / Blockwave / O8–O9 collisions

**Scope:** source genealogy, equation identity, authorship, chronology, and missing-map inventory.  
**Nominal rotation:** h = 494; seq = 2472; ring index 2 = Aster; successor index 3 = Ariadne. The nominal scheduled slot, not delayed execution start, controls selection.  
**Read snapshot:** HsH main observed at `f999c1ecb46a6c62667848f9961f8bb1ec66f89d`; SAT_THEORY_ARCHIVE_2023-25 at `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`.

This is a source-grounded reconstruction under Aster's historical provenance remit, not authentication of a historical Aster ChatGPT instance. The archived Aster source conversation and the current scheduled automation thread are distinct.

## 1. Authority and scope

Aster's historical specialist remit is Nathan-word fidelity, exact speaker attribution, chronology, source ancestry, and separation of original user statements from assistant reconstructions and pasted/quoted material. The source-grounded reentry and speaker-attribution records were read. The large raw Aster export could not be fully re-parsed in this runtime because the GitHub content/blob reader returned empty or truncated content; its prior blob identity and message-level findings remain prior verified evidence, not a fresh raw read.

The incoming Loom source packet and its later inbox addendum were read. The current Mersearch lane-3 request has a manifest and compact receipt; raw search results remain withheld. No new Mersearch request was submitted. Lanes 1 and 2 have request files but no manifest/receipt; lanes 3 and 4 have completed manifest/receipt pairs. Lane 3's top-source list includes its own request file, so ranking is not an independent relevance measure.

Code Grurple remains ACTIVE. This turn is source genealogy only. No manuscript review, reader repair, feed edit, paper-gate change, BEDROCK edit, or theory promotion was performed.

## 2. O9 is a reused label, not one unique construction

### 2.1 Mass-spectrum O9

**Source A:** `SAT O Core Modules/O9.txt`  
- Git blob SHA-1: `676ce08c09226e4bde5a4d8efa3d7f4da228a1d8`  
- First extant Git path commit recorded by the Aldus file-history audit: 2025-10-27T01:13:03Z.  
- File-index local last-write metadata: 2025-06-18; not an authenticated authoring timestamp.  
- No named author/byline in the file.

Verbatim equation:

\[
m^2 = k\,(N+\beta Q^2-a).
\]

The `.txt` module's function entries are documentation/docstring stubs, not executable implementations.

**Source B:** `SAT O Core Modules/O9-10_intro.txt`  
- Git blob SHA-1: `7ca41068bc3f753a86d486817856a5c0dbbd041d`  
- First extant Git path commit: 2025-10-27T01:13:03Z.  
- Describes Q as winding around a compact cycle and says k = 4/alpha-prime is topological, with beta and a fixed by inversion of ground-state masses.

**Source C:** `SAT 4D Theory Work/O9.tex`  
- Git blob SHA-1: `14240f3dd9d11eefa7e9154514a6737debcd5bfa`  
- Byline: “SAT.4D Coherence Project”; date field is `\\today`, not a fixed date. First-path date was not established in this turn.  
- Its implementation snippet uses N = [0,0,0], Q = [1,2,3], a_fixed = 1, and mass anchors 0.000511, 0.10566, and 0.13957. It uses `np.linalg.lstsq` to fit both k and beta.

This is a source-level fit/prediction conflict: the introduction presents k as fixed by topology, while the implementation estimates k from the same ground-state mass anchors used to determine beta. No independent holdout, data release/version, uncertainty model, covariance, or calibration provenance is supplied. This turn did not rerun the fit or treat it as a physical prediction.

### 2.2 A later O9 worldsheet candidate

**Source:** `EARLY LOGGED/2025-10-24_00 SAT O.txt`  
- Git blob SHA-1: `c7831e8c248113a1405954f4c85c8fe151aa2107`  
- The filename supplies an internal 2025-10-24 date; first extant Git path date was not established in this turn.

This candidate assigns:

\[
\ell_f = \ell_P
\]

as a wavefront thickness and gives a different mass-shell relation:

\[
m^2 = \frac{4}{\alpha'}(N-a), \qquad N\leftrightarrow Q,
\]

with Q described as a Hopf-linking class.

This is not the same printed relation as the earlier mass-spectrum O9 equation. It also gives Q a different stated meaning. No explicit supersession, derivation, or map between the two O9 formulations was found. Preserve both source versions; do not silently replace one with the other.

### 2.3 O9 graviton/topological-strain proposal

**Source:** `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_O9_Graviton_Topological_Strain.txt`  
- Git blob SHA-1: `c7095697a70f39b3bd05af414e1124ae45a17926`  
- Byline: `[SAT_O Collaboration]`; date field `\\today`.  
- First HsH path appearance recorded by the prior file-history audit: 2026-10-01T20:35:00Z. A separate file-index creation timestamp is not an authorship date.

The document proposes:

\[
\widetilde g^{\mu\nu}=\langle v^\mu v^\nu\rangle,
\qquad
g_{\mu\nu}=(\widetilde g^{\mu\nu})^{-1},
\]

\[
S_{\mu\nu}
=
\sum_i\int d\lambda\,
\delta x_i^\alpha(\lambda)
\nabla_\alpha v_{i(\mu}v_{i\nu)},
\qquad
g_{\mu\nu}=\eta_{\mu\nu}+h_{\mu\nu}.
\]

It asserts masslessness from topological rigidity, but does not supply the map from S_{mu nu} to h_{mu nu}, the required gauge constraints, or a derivation of the massless degrees of freedom. It is a separate collaboration-attributed proposal, not a recovered Nathan Direct graviton equation.

### 2.4 O9 optical-retardance audit

**Source:** `SAT O Derivations/SAT_000_Audit_Package.txt`  
- Git blob SHA-1: `7d43c1029fe588b9056a0f864ecfb5e72ca06313`  
- First extant Git path commit: 2025-10-27T01:15:21Z.  
- Byline: “Audit Deployment: Master Thread”; date field `\\today`.

The package specifies:

\[
\Delta n(x)=\eta\sin^2\theta_4(x)
\]

and targets approximately \(\Delta\phi\approx1.48\) rad. It explicitly omits the full module.

The associated `SAT DEVELOPMENT/hostile_pass_c_plus.txt` has Git blob SHA-1 `4562c67103dce361b5e67b9f49a1f56f0d5983b7`, with first extant Git path commit 2025-10-27T22:17:10Z. Its abstract/conclusion says 3/20 passed, while the printed table contains five Pass labels. The audit criteria/rubric were not recovered here, so the discrepancy remains unresolved. The raw “SAT O REWRITE SUPERVISOR” export was not freshly re-parsed in this turn; the assistant-authored O9 integration attribution is inherited from the prior source cross-read, not claimed as a new raw read.

**Result:** mass-spectrum, worldsheet, graviton/strain, and optical-retardance O9 are distinct source objects. The current bounded O9 Lean ledger does not include the October 24 worldsheet candidate, so its theorem is not an exhaustive taxonomy of every O9-labelled artifact.

## 3. O8/O9 symbol collisions relevant to worldtube characterization

The O8 sources use \(\ell_f\) for a filament transverse/correlation/segment scale:

- `SAT-O Theory Work/SAT_PHASE_VIII_GAUGE_BUILDOUT.txt`, blob `beda29495fa4949906a6a6b0f408c3a0dd117e58`, internally dated 2025-06-18; first extant Git path commit 2025-10-27T01:15:21Z.
- `SAT 4D Theory Work/SAT4D_4.txt`, blob `efc88f4523b2fd616e64898737c2aa45e5f39b9a`, byline “SATO.4D Coherence Project”, dated July 2025; it states a one-symbol/one-meaning rule and gives \(\ell_f=(2A/T)^{1/3}\) as a transverse scale.
- `SAT_O8.txt`, blob `b5147fe08da0a65cb40e73365c71717aaad149ff`, has placeholder byline `[Author Name]` and no fixed date. The file index reports local creation 2025-06-06 13:40:48; first extant Git path commit 2025-10-27T01:24:42Z. It gives \(\ell_f\sim(2A/T)^{1/3}\), \(m_\psi^{(0)}\sim T\ell_f/c^2\), and \(m_\psi^{\rm eff}=m_\psi^{(0)}/Q\).

The October 24 O9 candidate instead uses the same \(\ell_f\) for Planck-scale wavefront thickness. These are different physical roles. The source corpus supplies no map from the O8 carrier/correlation scale to the O9 wavefront thickness.

Q is also overloaded:
- O9 mass-spectrum introduction: compact-cycle winding.
- O9 worldsheet candidate: Hopf-linking class.
- O8 topological-mass source: suppression factor.
- 2025-10-29 SATO-BLOC pasted draft: \(Q=L_{\rm wind}+L_{\rm link}+W_{\rm writhe}\).

No map between these Q objects was recovered.

**Source-preserving notation proposal (not a historical equation or physical correction):**

\[
\ell_{\rm carrier}\quad\text{and}\quad h_{\Sigma}
\]

for carrier transverse/correlation scale and timesheet/wavefront thickness, respectively; and

\[
Q_{\rm cyc},\quad Q_{\rm Hopf},\quad Q_{\rm topo}
\]

for compact-cycle winding, Hopf-linking class, and the later composite topological quantity. Any relation requires explicit projection/composition maps and conditions. None is supplied by these sources. Do not equate these quantities or transfer a fluid-vortex scale to a SAT/Kerr-associated worldtube.

## 4. Blockwave: exact authorship boundary

**Attachment:** `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`  
- Git blob SHA-1: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`  
- First extant HsH path commit recorded by the prior file-history audit: 2026-10-08T02:42:49Z.  
- Its embedded “Nathan McKnight” label does not authenticate the attachment's content author or original creation/publication date.

**Raw action conversation:** blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. The user request message `fa1e045d-a7ff-4dcf-8110-ae9fa555a54a` at 2025-10-19T12:29:41.119Z asks for the full action/definitions. The subsequent action text is in assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d` at 12:29:46.539Z. The action equations are therefore assistant-authored, not Nathan Direct equations. This role/time attribution is inherited from the verified Loom/Calder crosswalk; the large raw export could not be freshly re-parsed here.

Verbatim source-level definitions include:

\[
\theta\sim\theta+2\pi,
\qquad
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,
\qquad
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]},
\]

\[
\oint_\gamma A\cdot d\ell\in2\pi\mathbb Z,
\qquad
J^{\mu\nu}=\frac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma,
\]

\[
S_{\rm int}\supset\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}.
\]

The attachment contains transcription/index defects. The source action uses a positive covariant phase kinetic term with the stated Lorentzian convention. A later assistant review says the conventional real-scalar sign for signature (-+++) is negative, but does not emit a complete corrected action. The review also identifies a canonical-sign inconsistency between the positive covariant kinetic term and the printed momentum/Hamiltonian signs. This is a source-level defect, not a source-authenticated patch or proof of a ghost in the full coupled theory. Preserve the original verbatim; no corrected full Blockwave action is established.

The separate `SAT—Blockwave Ideal Model.txt` (blob `dd0631bc...`) is a schematic 1+1D Hamiltonian for fields \((\theta_4,\psi)\); it does not supply the covariant \(\theta\) Lagrangian, metric signature, or an explicit \(\theta\leftrightarrow\theta_4\) map. It cannot be substituted as a correction. `BLOCKWAVE EXTENSION .txt` (blob `d870...`) is another distinct artifact.

The assistant-generated rank-two current \(J^{\mu\nu}\) is not the same object as a vector current \(J^\mu\), nor is it a recovered derivation of the separately recorded Nathan preference for a 3-form track. No J3-to-J2 map is present. In four dimensions the Hodge star maps 3-forms to 1-forms, not to 2-forms; a rank-two current needs its own source-defined construction.

## 5. Later pasted draft: submission is not embedded authorship

The raw `SATO-BLOC FULL LEANCHECK` conversation contains user message `3bf39270-2cf8-47f2-9123-6bce0e607c03` at 2025-10-29T17:48:07.981Z. The message begins, “Ok, here's what we've got. It may be under a slightly different version of SAT though,” and then supplies a long draft containing the mass-spectrum equation and the composite Q expression above.

The conversational speaker is the user; the embedded document's author is not identified. The preface explicitly presents it as material being supplied for examination, not as an authenticated Nathan-authored equation. The message is therefore a Nathan-submitted/pasted artifact with unresolved embedded authorship, not Nathan Direct equation provenance.

## 6. Direct geometry source versus later assistant reconstruction

The prior Aster source timeline records direct user messages in “Geometry in Physics” (June 2026) describing the electron as a single-coil particle worldline/tube, quarks as two-/three-braids, and bosons as vibrations on filaments; another direct user message dates the vocabulary “timesheet” and “worldline” to February 2, 2025, with roots in the 1990s. The high-ranking “SAT Development Timeline” message in that same export is assistant-authored and duplicated across export paths; it is not a Nathan Direct source.

The May 2025 “Fundamental Physics Explanations” material is explicitly an aSAT branch in the direct follow-up. It must not be silently promoted to current SAT. The current BEDROCK and user instruction keep physical worldtubes distinct from responsive-medium vortex cores; an explicit derived mapping is required before any identification.

## 7. Formalization status and proof boundary

Existing exact-head Lean evidence was checked read-only:

| Existing PR | Exact-head run | Result | Scope limit |
|---|---|---|---|
| #982, bounded O9 label identity | #41182177659 | Lean 4.34.0 build success; 8,955 jobs; six target theorem outputs have no axiom dependencies; zero `sorryAx` in retrieved log | Theorem covers its bounded ledger, not the newly identified October 24 worldsheet O9 candidate or all O9-labelled artifacts. Separate tests/lint/nanoda/axiom-audit stages were skipped. |
| #759, Blockwave phase algebra | #41194990361 | Lean 4.34.0 build success; 8,951 jobs; zero `sorryAx`; target theorem uses standard dependencies `propext`, `Classical.choice`, `Quot.sound` | Conditional algebraic phase identity only; not a derivation from the Blockwave action or an experimental validation. Separate tests/lint/nanoda/axiom-audit stages were skipped. |
| #905, source-projection non-injectivity | #40980922900 | Lean 4.34.0 build success; 8,948 jobs; zero `sorryAx` in retrieved log | Establishes a source-projection limitation, not a physical worldtube-to-medium map. Separate axiom audit skipped. |

No new Lean module was created. The required carrier-scale-to-wavefront map, Q-map, worldtube-to-timesheet-to-medium-current map, and action-level coupling are not source-defined. Formalizing one now would encode an assistant-invented map. The existing proofs remain conditional mathematical results; they do not establish source attribution, translation soundness, or physical truth.

## 8. Physical/CODATA disposition

No identifiable measured system, dataset release, units, covariance, calibration uncertainty, or independent holdout is attached to the O9 mass fit, optical target, or graviton-strain proposal. The mass code is a fit to three selected anchors, not an independent prediction. The optical audit omits the full module and has an unresolved pass-count discrepancy. No physical calculation, prediction, observational validation, or CODATA comparison was performed.

This is a source-level constraint on Lane 24, not a negative experimental result. A future calculation must begin with a real measured system and its provenance/uncertainties before any numerical comparison.

## 9. Operational disposition and next cursor

- Code Grurple remains ACTIVE; no manuscript, reader, feed, paper gate, BEDROCK, or theory branch was changed.
- No physical calculation, CODATA comparison, new Lean module, branch, PR, tool, or automation was created.
- No Mersearch request was added or overwritten.
- Existing issue #1141 already covers O9 source chronology; publisher v1 only initiates a new issue, so no duplicate publication issue was created. This report is an internal workspace record, not a PUBLISHED_VERIFIED submission.
- The successor Ariadne's nominal :36 run was already active when this delayed :24 run executed. No inbox append or cross-thread delivery was attempted. An optional handoff is prepared for Ariadne's next appearance only; no assignment or acknowledgment is implied.
- The next Aster source cursor is: recover the original O9 optical candidate/underlying attachment and its raw role/time metadata; verify the raw SAT O REWRITE SUPERVISOR O9 integration message; add the October 24 worldsheet O9 artifact to the bounded source ledger only after independent source review; preserve the O8/O9 scale and Q distinctions; do not attempt physical calculation until a real measured system and uncertainty model are identified.
- The previous unrelated-reading cursor remains Babbage, line 641; no repeat break was performed. Last full FIE review remains 2026-10-27; the 14-day threshold is not due.

**Status:** source crosswalk completed within available evidence; raw-export limitations explicit; no equation silently corrected; no theory promotion.
