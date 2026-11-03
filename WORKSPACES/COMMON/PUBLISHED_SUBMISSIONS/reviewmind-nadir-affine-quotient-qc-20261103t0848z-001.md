# Review-MIND QC: Nadir PR #1189

Audit date: 2026-11-03  
Disposition: EXACT-HEAD LEAN BUILD CONFIRMED / FINITE-DIMENSIONAL QUOTIENT MAP CONDITION CONFIRMED / PHYSICAL MAP NOT ESTABLISHED.  
Scope: Read-only audit of the public PR, formal modules, root import closure, and exact-head GitHub Actions record. No PR or branch was modified.

## 1. Exact-head Lean verification

GitHub Actions run #41580322998, job 125733379421, was independently read back. The event was pull_request; the workflow's source-checkout identity assertion passed; expected and checked-out source commit were both 581ecb223fbd92f9d95292272ecd1e98b5740f6a. Lean 4.34.0 / Lake 5.0.0 completed the root library build successfully (8,953 jobs).

The retrieved job log contains 81 theorem-specific #print axioms outputs, zero sorryAx occurrences, and zero admit occurrences. Displayed theorem dependencies are standard Lean dependencies (propext, Classical.choice, Quot.sound), not a claim of axiom-free mathematics. Tests, lint, nanoda, and the separate automated axiom-audit stage were not run. Non-fatal unused-simp/unused-tactic warnings occur in the projected-curvature and affine-obstruction modules.

This is an exact-head compile/readback, not a new local Lean execution. The local runtime inspected for this audit has no lean, lake, or elan.

The root aggregator imports the existing CognitionSourceOverlap.lean and GeometryProvenanceSeparation.lean; both were built in this same run. Neither emits theorem-specific #print axioms output, so no module-specific axiom audit is claimed for those files.

## 2. Affine quotient: the projection is correctly conditioned

The quotient construction maps [t] in V / range(I-L) to the orthogonal projection of t onto range(I-L) perpendicular.

NadirAffineObstructionDimension.lean explicitly assumes a real normed additive group, a real inner-product space, and finite dimensionality of V. Under those conditions, affineShiftRangeIsCompl proves that range(I-L) and its orthogonal complement form a direct-sum decomposition. The induced map Pbar([t]) = P(t) is well-defined and bijective; its inverse is y -> [y]. The source proves Pbar composed with the quotient map equals the orthogonal projection. Mathlib's orthogonal_range theorem identifies range(I-L) perpendicular with ker((I-L)*).

QC result: the quotient-to-orthogonal-complement-to-adjoint-kernel map is correct under the formalized finite-dimensional real inner-product assumptions. Finite dimensionality is essential to this direct-complement proof. In a general infinite-dimensional space, range(I-L) need not be closed; the quotient by an unclosed range cannot simply be identified with its orthogonal complement without an appropriate closed-range/completeness condition.

The finite-dimensional dim coker(I-L) = dim ker(I-L) result is rank-nullity. The positive-scale, non-unit-scale result additionally assumes Q is a real linear isometry: for sigma > 0 and sigma != 1, I - sigma Q is injective; finite dimensionality then makes it surjective. At unit scale, quotient dimension equals fixed-vector subspace dimension. The origin-shift rule t -> t + (I-L)g matches the file's convention of shifting both centers by +g.

## 3. Framed-sphere composition and projected curvature

The formalized identity T_jk composed with T_ij equals T_ik is algebraically correct for nonzero scalar radii and arbitrary invertible linear frames. Positive radii are handled in a separate specialization. The composition identity does not require orthogonality. The PR notes that SO(d) membership is not formalized; the separate residual-conjugacy result assumes orthogonality but not determinant +1. This bounds stronger group-specific interpretation without invalidating the algebraic composition theorem.

NadirProjectedFrameCurvature.lean supplies explicit 4x4 coefficient matrices and 2x2 tangent/off-diagonal blocks. Lean proves that the supplied full-frame curvature coefficient is zero, the supplied projected tangent-block curvature equals a skew 2x2 generator, and the supplied quadratic Gauss block equals that same generator.

The file does not formalize the differentiable frame E(theta,phi) and derive its connection coefficients from E inverse dE. It does not define a general projection operator from the full 4x4 connection to the tangent 2x2 block; the selected blocks are supplied directly. It does not prove Gauss-Codazzi-Ricci for arbitrary surfaces, derive the coefficients from an immersion, or establish an H(s)H physical connection.

QC result: a valid finite-dimensional matrix identity is compiled. The general frame-to-connection derivation, projection map, and geometric generalization remain unproved. The file itself correctly labels these limits.

## 4. Existing cognition/provenance controls

CognitionSourceOverlap.lean proves that bijective source-ID relabeling preserves source overlap and that a non-injective ID collision can create false apparent overlap. GeometryProvenanceSeparation.lean proves that source annotations do not affect readout under an explicitly source-blind contract, and that a non-injective projection can conceal distinct geometries.

These are useful logical negative controls. They do not prove statistical independence, causal influence, model identity, completeness of provenance, or physical correctness. Existing modules provide a foundation; this audit does not justify a new generic source-overlap tool. A future formal target, only when authorized, is a typed provenance DAG separating source, derivative, prompt/context, model call, tool/retrieval, evaluator, CI run, and report nodes. Claim-specific ancestor closure can screen for shared dependencies, but is not itself a theorem of statistical independence.

## 5. Source, physical, and paper boundaries

The public PR attributes the framed-sphere map to a 2026-09-11 manuscript, but this audit did not inspect that private source document; the attribution remains PR-declared provenance. The affine quotient is explicitly attributed in the Lean source to an assistant-authored Run 141 sandbox. The projected-curvature coefficient example is explicitly described as assistant-generated, not a Nathan-authored equation or physical claim.

No identifiable measured physical system, observational dataset, units, uncertainty budget, prediction-versus-fit separation, or physical observable map is supplied by this PR. No physical calculation, independent measurement, H(s)H prediction, or theory promotion is claimed.

Orson's primary LLM-cognition remit remains protected. P1 issue #564 remains OPEN / SOURCE-EXPERIMENT READINESS under the 2026-11-02 methods/archival freeze; no new LLM trial is authorized or claimed here. P1 (Nov 9), P2 (Nov 30), and P3 (Dec 14) remain separate gates. This audit does not edit or assume ownership of Orson's P1.

Code Grurple remains ACTIVE. No manuscript, paper gate, branch, PR, or BEDROCK content was changed. All four Mersearch request lanes were occupied; no request was created or overwritten. Existing Lean CI/modules were reused; no new tool, fork, package, or paid service was introduced.

## 6. Next review cursor

Keep the finite-dimensional condition attached to the quotient projection. For the projected-curvature example, the next proof target is to define the actual block-projection map and derive the supplied tangent/off-diagonal matrices from the full frame, rather than treating manually supplied blocks as a general projection theorem. No new module or branch was created in this audit.
