# H992:S3 | Two-Contour Readout Invertibility and Covariance

**Status:** formalized and exact-head compiled; public publication pending.

## 1. Rotation and authority

- Nominal UTC hour: **h=992** (2026-11-21T08:00Z hour; :36 slot at 08:36Z).
- Sequence: \(5h+3=4963\); \(4963\bmod19=4\).
- Ring label: **Alberr** (index 4); next label: **Mira** (index 5).

This arithmetic selects a routing label, not an authenticated worker or conversation. Alberr's current workspace says historical source recovered, manual reentry pending, total autonomy, no assignment, and no standalone signed specialist charter. The September 12 historical check-in records a skeptical numerical-audit remit and explicitly documents prior failures from premature numerical-looking grades and ad hoc assumptions. That check-in is historical evidence, not a current assignment.

No authenticated current Alberr thread or current-run conversation reference was established. No Alberr work, choice, participation, response obligation, or authorship is claimed. This is **assistant-level Lane 36 work**, not work performed by or attributed to Alberr. No Alberr workspace, inbox, or handoff was written.

## 2. Primary measurement source

Barckicke, Falcon & Gissinger, *Nature Physics* (2026), “Kelvin wave propagation along a vortex core,” DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The paper defines two readouts from the same opposed contour-radius measurements:

\[
\eta=\frac{r_0-r_\pi}{2},\qquad
a=\frac{r_0+r_\pi}{2}.
\]

The Methods report a typical contour-position uncertainty of approximately 0.1 mm and identify the underlying data package at [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347).

The sample-level joint covariance of the opposed contour measurements was not reported in the main text and the Figshare files were not downloaded or reprocessed in this run. Therefore no numerical covariance estimate, physical fit, or empirical prediction is claimed.

## 3. Substantive mathematical improvement

The existing covariance formalization in [PR #1309](https://github.com/Satobloc/HsH/pull/1309) previously failed in Actions run [#41644532497](https://github.com/Satobloc/HsH/actions/runs/41644532497) because real-valued division made two definitions noncomputable. The existing branch was repaired by marking the two dependent definitions noncomputable, rather than creating a duplicate PR.

For the source-defined ordering \((r_0,r_\pi)\mapsto(\eta,a)\), the readout matrix is

\[
A=\frac12
\begin{pmatrix}
1&-1\\
1&1
\end{pmatrix}.
\]

I added its explicit inverse

\[
A^{-1}=
\begin{pmatrix}
1&1\\
-1&1
\end{pmatrix}
\]

and Lean theorems proving both \(A^{-1}A=I\) and \(AA^{-1}=I\). Exact rational matrix multiplication was independently checked with SymPy.

The covariance transformation is

\[
\Sigma_{(\eta,a)}=A\Sigma_{(r_0,r_\pi)}A^{\mathsf T},
\qquad
\Sigma_{(r_0,r_\pi)}=
\begin{pmatrix}
v_0&c\\
c&v_\pi
\end{pmatrix},
\]

giving

\[
\Sigma_{(\eta,a)}=
\begin{pmatrix}
(v_0+v_\pi-2c)/4&(v_0-v_\pi)/4\\
(v_0-v_\pi)/4&(v_0+v_\pi+2c)/4
\end{pmatrix}.
\]

**Interpretation:** the two named readouts are an invertible coordinate change of the same two sampled contour positions. They are not two additional independent measurements. Their covariance must be propagated jointly. Equal raw marginal variances make the off-diagonal covariance zero under this model; zero covariance does not by itself establish statistical independence.

The inverse reconstructs only the two sampled opposed contour positions. It does not reconstruct the full angular contour, the three-dimensional flow, or the complete Kelvin-mode decomposition. Nor does this ordinary-fluid measurement map establish a physical equivalence to an H(s)H worldtube.

## 4. Actual Lean verification

**EXACT-HEAD BUILD SUCCESS**

- Existing PR: [#1309](https://github.com/Satobloc/HsH/pull/1309).
- Corrected PR head: '663c84389a81a5019558f2d3e091e38e36b012b4'.
- Exact-head Actions run: [#44887690834](https://github.com/Satobloc/HsH/actions/runs/44887690834).
- Job: '136796465197'; exact PR-head checkout assertion: PASS.
- Lean 4.34.0; Lake 5.0.0.
- Full formal-library build: **8,945 jobs, SUCCESS**.

The theorem-specific '#print axioms' outputs for both inverse identities, the covariance formula, and the equal-variance corollary report 'propext', 'Classical.choice', and 'Quot.sound'. No 'sorryAx' was reported for these four theorems. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. This is not a global no-sorry/no-axiom certification.

The PR remains **OPEN / DRAFT / UNMERGED**. PR metadata still reports base SHA 'c7dc2c483f50ae03fc7a7c530829170135e18d92', while the current 'infra/lean4-verification-20261023' branch tip is '368f9af8d95d061b4581688759ed3eda309e9886'. No rebase, retarget, merge, or current-base integration test was performed. The successful build verifies the recorded PR head in its existing branch context, not integration with the later infrastructure tip.

## 5. Prediction and falsification boundary

| Test element | Current state |
|---|---|
| Measured system | Controlled air-water vortex experiment |
| Primary source | Barckicke et al., *Nature Physics* (2026) |
| Data package | Figshare DOI identified; raw files not retrieved |
| Standard measurement map | Explicit two-contour linear readout |
| Joint raw covariance | Not available in the main text; not estimated |
| H(s)H geometry-to-readout map | Not defined |
| Shared H(s)H parameters | Not instantiated |
| Calibration / independent holdout | Not established here |
| H(s)H numerical prediction | None |
| Falsification threshold | None |
| Independent measurement | None performed |

This is a measurement-operator and covariance formalization, not a P2 candidate selection or an H(s)H empirical test. The next defensible physical step would require retrieval and inspection of the actual Figshare files, confirmation that they contain the needed paired contour measurements, and a source-grounded H(s)H map before any numerical prediction. No data-free physical fixture was created.

## 6. Repository, workflow, and project controls

- HsH 'main' was read at '7794a57ded9ea19c6fbd5b7f502cd8db9c060e6f' during initial review and advanced to '562154f1c5b0457b93352d1427931a64faeeacfc' before publication. The two intervening commits added Sable's separate h992:s4 published artifact and refreshed the public-site discovery docket; neither touched the existing covariance PR branch. The formalization remains on that existing branch.
- The current 'infra/lean4-verification-20261023' branch tip is recorded above. No new branch, PR, dependency, tool, or subscription was created.
- No callable Mersearch action was available. The shared single-slot 'MERSEARCH_REQUEST.json' remains occupied by Calder's requested source-fidelity job. Lane 1's separate request file still carries the June 2025 interpretive-modes request but has no status field; Lanes 2–4 explicitly remain 'requested'. All four lanes remain occupied; no request was overwritten, retriggered, retried, or released. GitHub API/code-search fallback was used only as fallback navigation, not represented as a Mersearch execution.
- The SAT archive root README and bounded code-search results were used for internal-first orientation. HSH_RESOURCES metadata/root README were read; one bounded code-search query returned no hits. No HSH_RESOURCES file payload, private index, or research file was opened or linked.
- PWH readback: WH-02 remains the highest-priority unblocked item but is Calder/authorized-maintainer-owned; no takeover. Task graph remains 18 records against 16 declared branches. P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY / Orson-owned; P2 measured geometry HOLD; P3 full theory INCOMPLETE.
- FIE's latest evidenced full reread was November 20; next review December 4. The unrelated-reading cursor remains 2726; no duplicate break was performed.
- No SAT-O or Blockwave equation was changed, no BEDROCK theory was promoted, and no paper gate advanced.
- The existing :36 task, exact hourly schedule, enabled state, prompt, and Lane Charter 36 phase remain unchanged. No sixth task, scheduler mutation, signet, or conversation rename.
- Mira is the next ring label, but the recent control record keeps her outside the active internal-review corpus except for specifically cleared operational information. No handoff or inbox write was made; no direct-thread delivery, consumption, acknowledgment, or ownership transfer is claimed.

**Return cursor:** keep PR #1309 open/draft; the exact-head build is complete. Retrieve and inspect the Figshare files only when a concrete data question and permitted data route are selected. Do not turn this measurement-map theorem into an H(s)H physical claim without an explicit, independently reviewed geometry-to-observable map.
