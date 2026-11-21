# H995 S3 | RQM Frequency Sign-Domain and Constraint-Residual Audit

**Nominal slot:** 2026-11-21T11:36:00Z  
**Rotation:** h=995; seq=5h+3=4978; 4978 mod 19=0  
**Selected ring label:** Sable (index 0)  
**Next ring label:** Loom (index 1)  
**Attribution:** assistant reconstruction under deterministic rotation. No authenticated current Sable thread or historical-instance participation is claimed.

## 1. Scope and historical remit

The Sable workspace describes a bounded systems-analysis / capability-architecture / automation and reconstruction-strategy remit, with a local P1 source/proof-quality audit of the GR-QM isomorphism claim. Routine Nathan Direct, broad tagging, archive indexing and solver ownership remain with their existing lanes. This run stayed within source recovery, mathematical consistency, proof obligations and verification architecture.

The following live HsH materials were read from `main`:

| Document | Git blob |
|---|---|
| `BEDROCK.md` | `bdfc6f401736aa4dd9de2bf23a7293b7f8919b07` |
| `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md` | `be44c424674764c602b5f618dfce528c0f97b0ef` |
| `WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md` | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` | `43b577d42b8cced83f8836934598081685ea3ff3` |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md` | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| `WORKSPACES/COMMON/REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md` | `d9ea7c3a04e03822c65ee231d0b9545bf37907bd` |
| `WORKSPACES/COMMON/SCHEDULER_AUTHORITY_MUST_READ.md` | `9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45` |
| `WORKSPACES/COMMON/ISSUE_PUBLICATION_INTAKE_V1_2026-10-15.md` | `e4ff21da748065f9b5853c752319f21904d5388e` |
| `WORKSPACES/SABLE/README.md` | `8b5fde2e5b61c8f2214c2f821c9a8b9ea126a7d5` |
| `WORKSPACES/SABLE/BOOT.md` | `585c976c9095a5e8245553d2eaf10d803474afe4` |
| `WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md` | `da2e603f82f69520de3af5ae25ee979a80af1879` |
| `WORKSPACES/SABLE/INBOX.md` | `27f6bb388c09e44fe3b8f8aa9ce17e014af74bd9` |
| Prior Sable receipt h991:s4 | `3cb8c743eb89d2be545a70e1a5cff557915121ab` |
| Prior Sable report h991:s4 | `07483b1782375e3855525a4b8841ba803c8c09b5` |

The HsH `main` head observed before this report was `da118e39dc4c0325d0070cc058c656f10a1ec655` (2026-11-21T11:48:11Z). SAT archive and HSH_RESOURCES root documentation were checked; no HSH_RESOURCES private payload was opened.

Mersearch was not callable in this runtime. Bounded GitHub repository retrieval and Library search were used as fallbacks, not represented as a Mersearch execution. Existing Lean PRs, Math Hopper, Whirligig, the existing Lean infrastructure branch and the installed tool surface were checked before adding formalization. No new dependency, toolchain, subscription or paid endpoint was introduced. The local runtime has no `lean`, `lake` or `elan`; the existing HsH Lean/Mathlib project and its CI were reused.

## 2. Source register and attribution

The source set contains several differently authored or unattributed artifacts. They must not be collapsed into one canonical equation source.

| Artifact | Exact source identity | Source/author status |
|---|---|---|
| `Relativistic–Quantum Isomorphism (nolat).pdf` | SHA-256 `55111ee70ad1ba8e8629f41562f40ca7faf6681c92259ef677206885920d9193`; four pages; PyMuPDF extraction request `2026-09-10_root_pdf_extraction_pass_002`, 2026-09-10T16:03:31.825Z; OCR not attempted | Unbylined. Original creation date and author not established. Its prose is assistant-style synthesis; not authenticated Nathan Direct. |
| `DEVELOPMENT_FULL_CONVOS/QUANTUM GRAVITY.txt` | HsH blob `ad108b3e9e40f1948dd25b337eec191bdc5bf180` | Mixed transcript/compilation. The initial equation discussion is not authenticated as Nathan Direct. |
| `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/WHIRLY.txt` | HsH blob `a1314c6f349d8d7ed99189797276de28a3fb3536` | Archive equation summary; author and original creation date unresolved. |
| `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt` | HsH blob `99a137e4891cd4a3ecaee86cf76a2d06c5af300b` | Archive equation summary; author and original creation date unresolved. |
| `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt` | HsH blob `02312fbb23167e8ce1c996451199ee0e498437b1` | Archive derivation summary; author and original creation date unresolved. |
| `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt` | HsH blob `33785afb8d46804122d79056b952169f99b325e2` | Assistant-style mathematical audit. Its proposed background-radius insertion is not a Nathan Direct correction. |

The HsH blob identities above are Git blob SHA-1 values at the observed `main` snapshot, not original document SHA-256 values or original creation dates. The PDF extraction manifest supplies its source SHA-256 and extraction timestamp, not the PDF's authorship or original creation date.

## 3. Verbatim equation crosswalk

The following forms are preserved as found.

1. PDF extraction and `QUANTUM GRAVITY.txt`:

\[
\omega^4=-\frac{2\lambda_s r_h^2}{\kappa}.
\]

2. `SAT-GIGAPACK.txt`:

\[
\omega^4=-\frac{2\lambda_s r_h^2}{\kappa},
\qquad \lambda_s<0
\]

with the accompanying prose identifying negative manifold tension as the real-frequency condition. Its nearby equation-of-motion notation uses `(r^2-R^2)`, which is not yet reconciled with the two-radius ansatz.

3. `WHIRLY.txt`:

\[
\omega^4=\frac{2|\lambda_s|r_h^2}{\kappa}.
\]

4. `Interconn.txt` gives the uncoupled equation and two-frequency ansatz, then states:

\[
\kappa\omega^4+2\lambda_s r_h^2=0
\quad\Longrightarrow\quad
\omega^4=\frac{2|\lambda_s|r_h^2}{\kappa}.
\]

5. Assistant-style `GRQM.txt` inserts a different residual:

\[
\omega^4=-\frac{2\lambda_s(r_h^2-R^2)}{\kappa},
\]

then proposes the positive-\(\lambda_s\) form

\[
\omega^4=\frac{2\lambda_s(R^2-r_h^2)}{\kappa}.
\]

These are not silently substituted for one another.

## 4. Algebraic reconciliation from the stated ansatz

`WHIRLY.txt` and `Interconn.txt` state the two-radius ansatz

\[
H(\lambda)=
\left(
R\cos(\omega_s\lambda+\phi_0),
R\sin(\omega_s\lambda+\phi_0),
r_h\cos(\omega_h\lambda+\psi_0),
r_h\sin(\omega_h\lambda+\psi_0)
\right).
\]

The squared norm is therefore

\[
|H|^2=R^2+r_h^2,
\]

so the residual in the stated hypersphere constraint is

\[
|H|^2-R^2=r_h^2,
\]

not \(r_h^2-R^2\).

Taking the archived uncoupled equation of motion as a premise,

\[
\kappa H^{(4)}
+2\lambda_s(|H|^2-R^2)H=0
\qquad (k=0),
\]

the separate frequency components give

\[
\kappa\omega_s^4+2\lambda_s r_h^2=0,
\qquad
\kappa\omega_h^4+2\lambda_s r_h^2=0.
\]

Consequently,

\[
\omega_s^4=\omega_h^4
=-\frac{2\lambda_s r_h^2}{\kappa}.
\]

For real, nonzero frequencies with \(\kappa>0\) and \(r_h>0\), the necessary sign condition is

\[
\lambda_s<0.
\]

On that branch only,

\[
-\frac{2\lambda_s r_h^2}{\kappa}
=
\frac{2|\lambda_s|r_h^2}{\kappa}.
\]

Thus the signed form in `SAT-GIGAPACK.txt` and the absolute-value form in `WHIRLY.txt` / `Interconn.txt` are conditionally equivalent. The positive-\(\lambda_s\), \(R^2-r_h^2\) branch in `GRQM.txt` is not obtained from the stated two-radius ansatz. It would require a different ansatz, a different constraint potential, or a redefinition of the radial variable. None is supplied in that audit.

The two-frequency ansatz also does not initially justify replacing both frequencies with one signed \(\omega\). The component equations force equality of fourth powers. For real frequencies this fixes equal magnitudes, not the relative orientation signs.

The source's claim that the superhelix is a *stable* stationary state is stronger than this calculation. Stability requires a second-variation or perturbation-spectrum analysis, which is not present in the cited derivation.

## 5. Lean formalization

A bounded module was added to the existing Lean/Mathlib project:

- PR #2275: https://github.com/Satobloc/HsH/pull/2275
- Branch: `research/sable-rqm-sign-domain-20261121t1136z`
- Base: `infra/lean4-verification-20261023`
- Base commit: `368f9af8d95d061b4581688759ed3eda309e9886`
- PR head: `98ef752b96df0ba1aad27b12c9f403e4e87c2aec`
- New module: `FORMAL_VERIFICATION/HsHVerification/SableRQMFrequencyDomain.lean`
- Root import added to `FORMAL_VERIFICATION/HsHVerification.lean`.

The module contains eight conditional theorems:

1. the squared norm of the two-radius ansatz;
2. the resulting constraint residual;
3. equality of the two component fourth-power frequencies;
4. nonpositive \(\lambda_s\) under positive \(\kappa,r_h\);
5. strictly negative \(\lambda_s\) for nonzero real frequency;
6. equality of signed and absolute-value expressions on the negative-\(\lambda_s\) branch;
7. mismatch of \(r_h^2-R^2\) with the stated ansatz residual for \(R>0\);
8. exclusion of real frequency on the positive-\(\lambda_s\) branch.

Existing toolchain: Lean 4.34.0 / Lake 5.0.0 / Mathlib v4.34.0. No dependency or workflow was added.

Actions run #44901155150, job #136837137702, was IN_PROGRESS at the last inspection. The existing workflow exposes an explicit PR-head checkout assertion, followed by manifest generation and full library compilation. No theorem compilation or axiom result is claimed until the run completes and its log is inspected. PR #2275 remains OPEN / DRAFT / UNMERGED. Tests, lint, leanchecker, nanoda and a global axiom audit are separate checks.

The formalization treats the archived Euler-Lagrange equation as a premise. It does not derive that equation from the displayed action, establish the physical sign convention or units, establish the soundness of the archive-to-model translation, prove stability, define a detector readout, or establish a GR-QM isomorphism.

## 6. GR-QM isomorphism proof ceiling

The source material still lacks the elements required for a mathematical isomorphism claim:

- defined GR and QM object spaces with explicit domains and codomains;
- forward and inverse maps;
- a statement of which structures the maps preserve;
- a derivation connecting the constrained \(S^3\) curve equation to Lorentzian GR dynamics;
- a defined operator/dynamics map connecting the \(S^3\) Laplace spectrum to the claimed energy spectrum;
- a derivation of the \(n=l+1\) identification and \(E_n\propto-1/n^2\);
- a dimensional and parameter map for the hinge identity and the emergent constants;
- a detector-level observable, calibration, independent holdout and falsification threshold.

The scalar Laplace-Beltrami eigenvalue formula on \(S^3\) is standard mathematics. Its presence does not by itself derive the hydrogen spectrum or an isomorphism with GR. A Euclidean \(S^3\) constraint is not, without an additional metric/signature and dynamics map, a Lorentzian spacetime solution.

**Claim ceiling:** the archived ansatz plus the asserted uncoupled equation imply a conditional frequency-sign relation. They do not establish a physical frequency, a stable solution, a measured prediction, or a GR-QM isomorphism.

## 7. Project and operational boundaries

- Sable local P1: source/proof-quality audit continues; no theory promotion.
- P0 Code Grurple: ACTIVE.
- Campaign P1 Orson cognition: OVERDUE / NOT READY / Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor gate: MISSED.
- November 30 major gate: HOLD.
- December 14 full-theory gate: INCOMPLETE.
- FIE next review: December 4. The November 20 unrelated-reading break remains recent; no duplicate break was manufactured.
- No Mersearch lane was changed, overwritten, retriggered or released.
- No physical calculation, fit, H(s)H prediction, independent measurement, SAT-O or Blockwave equation change, BEDROCK promotion or paper-gate advancement.
- The existing :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled state, hourly schedule and Lane Charter 36 phase were left unchanged. No sixth task, scheduler mutation, signet or conversation rename.
- Next deterministic ring label: Loom. No direct-thread delivery, assignment, acknowledgment or ownership transfer is claimed.

## 8. Next cursor

1. Inspect Actions run #44901155150 for actual PR-head SHA assertion, Lean 4.34.0 / Mathlib environment, module compilation and all eight theorem-specific `#print axioms` outputs.
2. If the run fails, distinguish a theorem/module failure from unrelated library or environment failure. Do not claim proof success.
3. Independently review the source equation lineage, especially the ambiguous `(r^2-R^2)` notation in `SAT-GIGAPACK.txt`.
4. Keep the \(r_h^2-R^2\) assistant correction quarantined from the stated two-radius ansatz until a different source-defined constraint or variable definition is found.
5. Do not promote the GR-QM isomorphism or advance P2 from this algebraic result.

**Final pin:** `H995:S3 / SABLE-ASSISTANT-RECONSTRUCTION / SOURCE-ATTRIBUTION-BOUNDED / TWO-RADIUS-RESIDUAL-RH2 / LAMBDA-S-NEGATIVE-CONDITIONAL / ABS-FORM-EQUIVALENT-ON-NEGATIVE-BRANCH / GRQM-RH2-MINUS-R2-UNSUPPORTED-BY-STATED-ANSATZ / PR2275-LEAN-CI-IN-PROGRESS / NO-PHYSICAL-PREDICTION / P2-HOLD / TASK-UNCHANGED / NO-SIXTH-TASK`.
