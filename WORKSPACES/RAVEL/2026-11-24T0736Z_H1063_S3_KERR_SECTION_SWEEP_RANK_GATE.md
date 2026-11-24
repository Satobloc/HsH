# Ravel h1063:s3 | Spatial Kerr-section sweep rank gate

**Disposition:** SOURCE-GROUNDED CONDITIONAL FORMALIZATION ADDED TO EXISTING PR / EXACT-HEAD CHECKOUT PASS / LEAN BUILD PENDING / NO PHYSICAL MAP / NO THEORY PROMOTION.

## 1. Substantive improvement

The existing Ravel formalization already records the conditional product-dimension arithmetic for a one-dimensional filament parameter extended across either a two-dimensional or three-dimensional spatial section. It does not yet constrain the rank of a candidate sweep map.

This addition makes the missing differential condition explicit.

Let a candidate section have tangent dimension \(d\), let the filament-extension parameter have tangent dimension \(1\), and let the ambient tangent space have dimension \(4\). A candidate first-order sweep map is represented by a linear map

\[
D:T S \times T I \longrightarrow T M^4.
\]

The new module uses Mathlib's finite-dimensional rank-nullity theorem to establish:

- If \(d=3\) and \(D\) is injective, the image rank is \(4\). This is the full-dimensional branch, compatible with a four-dimensional volume interpretation.
- If \(d=3\) but the intended local image rank is \(3\), the kernel must have dimension \(1\). A quotient, one-dimensional fiber collapse, or another rank-defect construction is an additional obligation.
- If \(d=2\) and \(D\) is injective, the image rank is \(3\). This is a different dimensional branch, not a statement about which section Nathan intended.

The result is more specific than the existing \(1+3=4\) product-dimension observation: it distinguishes the dimension of the sweep domain from the rank of the map into spacetime.

## 2. Original source and authority

The recovered Ravel conversation contains these direct user-role statements:

- Message 3d0ad680-51db-4c79-ad4a-9bbacada24ef, 2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend it along the filament; do not use the full four-dimensional Kerr spacetime as the cross-section of another four-dimensional object.
- Message 496a15ea-0263-459d-b815-908f52155b90, 2026-09-07T10:06:12.842Z: keep distinct the reduced 3D Minkowski/worldworm representation, the full 4D bulk, and the actual 4D view containing a 3D slice.

The direct Kerr-section statement does not specify the section's intrinsic dimension, the extension parameter's identity, a sweep map, its derivative, the image, or a quotient/fiber structure. The three representations are not identified with one another, and the 3D slice is not identified with a timesheet.

The historical Ravel role is supported by direct user-role messages in the same conversation: primary co-theorist, conceptual-cohesion and drift review, epistemic hygiene, accurate public record, citation lineage and terminology crosswalks. No standalone signed specialist charter or authenticated current Ravel thread was recovered. This is assistant-level source-grounded work, not historical-thread participation.

The raw Ravel export is conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, 12,408,770 bytes, SHA-256 b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba, HsH Git blob 17cfe3feb830f70009557d063482b35adba0834b. The bounded source read covered the two direct messages above and the historical role-setting messages; it is not a claim that every message in the export was re-parsed in this run.

## 3. SAT-O1 and Blockwave source custody

### SAT-O1 original

Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25, SATOBLOC/SAT O1 4D.txt.

- Git blob: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256 recorded in the prior independent source audit: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
- File is unbylined. FileIndex metadata previously recorded creation 2025-10-26 and last-write 2025-06-09, timezone unspecified; these are filesystem metadata, not authorship or a demonstrated composition date.
- Current archive pin used for this read: commit 028862e6f1b0ffad2f56f4989a2cd0a769d266fd, dated 2026-11-23T21:32:19Z.

The original source equations are preserved verbatim:

\[
\gamma^\mu(\lambda) =
\left(
\lambda,\,
A_x\sin(k_x\lambda+\phi_x),\,
A_y\sin(k_y\lambda+\phi_y),\,
A_z\sin(k_z\lambda+\phi_z)
\right)
\]

\[
v^\mu(\lambda)=\frac{d\gamma^\mu}{d\lambda}
\]

\[
S[\gamma]=\int d\lambda\,L(\gamma^\mu,v^\mu)
\]

\[
L=\frac12 m v^\mu v_\mu - V_{\text{tension}}(\gamma).
\]

The same unbylined file describes the filament as a smooth one-dimensional curve in \(\mathbb R^{3,1}\) and calls the worldtube the four-dimensional volume swept out by the vibrating filament. The displayed action remains a one-parameter curve action. The prose does not supply the sweep/thickening map.

### Separate SAT4D Canonical Summary

Source: SATOBLOC/SAT4D_LIVE_DRAFT.txt.

- Git blob: 2a79fe25018cce7e99a2c33786d88b0551db6ae7.
- Title-page byline: Nathan McKnight.
- Document date: June 2025.
- This is a separate artifact, not a byline transfer to the unbylined SAT-O1 file. It repeats the one-dimensional curve / four-dimensional worldtube-volume wording.

### Blockwave original

Source: Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt.

- Git blob: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- SHA-256 recorded in the prior independent source audit: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- User-supplied attachment event: 2025-09-16T16:31:26.687Z; this is an attachment-event date, not a composition date.
- Embedded prose is assistant-voiced; authorship of the full attachment is not established as Nathan Direct.

The original Blockwave equations remain unchanged, including \(u^\mu u_\mu=-1\), \(P^\mu{}_\nu=\delta^\mu{}_\nu+u^\mu u_\nu\), \(\nabla_\mu J^{\mu\nu}=0\), \(J^{\mu\nu}=\tfrac12\epsilon^{\mu\nu\rho\sigma}\nabla_\rho B_\sigma\), \(A_\mu(\theta)=\alpha_*\nabla_\mu\theta\), and \(F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}(\theta)\). No Blockwave-to-SAT-O1, Blockwave-to-Kerr-section, or Blockwave-to-H(s)H support map is introduced here.

**Equation custody:** no SAT-O1 or Blockwave equation was edited, corrected, normalized, or promoted. No corrected equation is proposed. The new rank gate is a separate conditional formal statement, not a correction to either source.

## 4. What the new gate does and does not say

The source-defined hierarchy currently has distinct candidate objects:

1. A selected spatial Kerr section, whose dimension remains unresolved in the direct statement.
2. A one-dimensional filament-extension parameter, whose identification with the SAT-O1 affine parameter \(\lambda\) is not source-established.
3. A candidate total space and sweep map into four-dimensional spacetime, not yet supplied.
4. An image that could be full-dimensional support or a lower-dimensional embedded object, depending on the differential rank and further regularity conditions.
5. Any boundary/shell, observer slice, or timesheet readout, each requiring its own typed map.

The conditional branches are:

| Candidate section dimension | Extension parameter | Differential condition | Local linearized image rank | Consequence |
|---:|---:|---|---:|---|
| 3 | 1 | Injective | 4 | Full-dimensional branch |
| 3 | 1 | Rank 3 | 3, with kernel dimension 1 | Requires a rank-defect/fiber/quotient account |
| 2 | 1 | Injective | 3 | Three-dimensional image branch |

A rank-three differential does not by itself construct a global quotient or embedded hypersurface. Smoothness, constant rank, fiber structure, properness, boundary behavior, metric, frame, and global embedding remain open.

This does not decide whether a given H(s)H worldtube is a four-dimensional volume or whether a particular boundary is a three-dimensional shell. The SAT-O1 wording supports a historical 4D-volume description, but it does not identify that verbal sweep with the later spatial-Kerr-section proposal.

## 5. Lean formalization

Added to the existing Ravel branch for PR #1133:

- File: FORMAL_VERIFICATION/HsHVerification/RavelKerrSectionSweepRankGate.lean.
- Namespace: HsHVerification.RavelKerrSectionSweepRankGate.
- Root import added to FORMAL_VERIFICATION/HsHVerification.lean.
- Branch: research/ravel-carrier-slice-reconstruction-20261031t0212z.
- Source commit after the module and import: 37b83c2fab9f87baf42e89a16f931bb6faa01160.

The new SweepLinearization structure carries explicit section, one-parameter, and four-dimensional ambient tangent-space dimensions plus a supplied linear differential. The formalization uses Mathlib's actual finite-dimensional rank-nullity theorem and derives the product tangent-space dimension from Module.finrank_prod.

The seven declarations report:
- rank_add_nullity
- domain_dimension
- three_dimensional_section_injective_rank_four
- three_dimensional_section_rank_three_requires_one_kernel_dimension
- three_dimensional_section_rank_three_not_injective
- two_dimensional_section_injective_rank_three
- three_dimensional_full_rank_fills_ambient_dimension

The module contains no sorry or admit. It supplies no instantiated physical map, no smooth-map derivative witness, and no physical data.

### Exact-head CI

[Lean Actions run #45350839920](https://github.com/Satobloc/HsH/actions/runs/45350839920)

- Exact PR-head checkout assertion: PASS.
- Checked-out PR head: 37b83c2fab9f87baf42e89a16f931bb6faa01160.
- Lean toolchain pinned by the project: leanprover/lean4:v4.34.0.
- Lake dependency-manifest generation: IN PROGRESS at last observation.
- Lean compilation: NOT STARTED at last observation.
- Theorem-specific axiom output: PENDING.

Correct status is SUBMITTED_NOT_VERIFIED. No successful compilation is claimed. Tests, lint, leanchecker, nanoda, and the separate global axiom audit have not been run for this new head.

PR #1133 remains OPEN / DRAFT / UNMERGED on its existing infrastructure-verification base. It remains divergent from that base; no rebase, merge, or independent formal review is claimed. The new module is not integrated into main.

## 6. Research and operational controls

- Mersearch was checked first, but no callable Mersearch action or local pinned three-repository checkout was available. All four existing request lanes were still marked requested; none was overwritten, released, or retriggered. GitHub code search and existing source exports are bounded fallbacks, not a Mersearch result.
- HsH, SAT archive, and HSH_RESOURCES front doors and the relevant onboarding/navigation material were read. HSH_RESOURCES private payloads were not opened or cited publicly.
- Existing Math Hopper #578 / PR #991, Ravel PR #1133, existing dimension/fiber/slice modules, Whirligig Kernel 0, and available SciSpace capability were checked. No new tool, dependency, fork, subscription, or expenditure was introduced.
- No measured system or dataset is involved. No physical calculation, fit, parameter estimate, CODATA comparison, H(s)H prediction, uncertainty propagation, or independent measurement was performed.
- The result remains a conditional mathematical constraint. It is not a Kerr solution, a worldtube construction, a timesheet map, or a physical prediction.
- No BEDROCK change, theory-status promotion, paper-gate advancement, Factory Floor acceptance, task reassignment, scheduler change, signet, or conversation rename occurred.

## 7. Return position

**NOW:** The missing local-rank condition is explicit in an existing Ravel formalization branch. Exact-head checkout passed; Lean build remains pending.

**NEXT:** Verify the exact-head build and theorem-specific axiom output. If it succeeds, prepare the required source-linked Factory handoff as FACTORY_HANDOFF_PENDING, with GEOMETRY_UNDERSPECIFIED and no allocated Factory item ID. A precise source-faithful geometric plot and independent hostile review are still required before Factory eligibility. Independently review the formal statement and its source-to-map assumptions.

**STOP:** Do not instantiate a physical sweep map, identify the section dimension by assumption, equate the 3D slice with the timesheet, or promote the result to BEDROCK. Do not merge or rebase PR #1133.

Next deterministic ring label is Orson Vay. No handoff or response obligation was created because the result does not alter Orson's protected cognition assignment. No authenticated current Ravel thread or cross-thread delivery is claimed.
