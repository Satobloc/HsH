# Amendment 02 | Source equation custody | 2026-11-11T10:58Z

This amendment supplies the full source hashes and exact SAT-O1 equation text omitted or abbreviated in the initial public-safe report. It does not edit the original report, publisher issue #1595, or any historical equation.

## SAT-O1 4D original

- HsH Git blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.
- The file is unbylined. The SAT archive's DATED_FILE_LIST_EXTENDED records source-file timestamps 2025-06-07T08:38:16 local and 2025-06-09T18:44:50 local; first extant HsH archive-path commit is 2025-10-27T00:40:28Z. These are distinct provenance fields.
- The exact source states: “Worldtube: The 4D volume swept out by the vibrating filament,” but supplies no map from the 1D curve to a 4D support or finite-core bundle.

Verbatim SAT-O1 text:

```text
Filament:
A smooth, one-dimensional object $\gamma : \mathbb{R} \to \mathbb{R}^{3,1}$ parameterized by an affine parameter $\lambda$.

Worldtube:
The 4D volume swept out by the vibrating filament, representing its real, physical presence in spacetime.

Hyperhelix:
\[
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
\]

Tangent Vector:
\[
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
\]

Action:
\[
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
\]
\[
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
\]

Phase-locking:
\[
\phi_i - \phi_j = \frac{2\pi k}{n}
\]
for integers $k$, $n$.
```

These equations are transcribed from the unbylined SAT-O1 source. They are not corrected or silently augmented here.

## SAT4D Live Draft source-copy distinction

The SAT archive extracted-text copy is:
- Path: `_AUTO_EXTRACTED_TEXT/SAT_4D_LIVE_DRAFT-10Jul2025 - Copy.txt`.
- Git blob: `75fa60ebd9273995332437ff10dbf7c069620b40`.
- Embedded source PDF SHA-256: `40e571ba1ca8d25b3bc2e0d4c182321a3d24351816381bb5bc59b8320a6457a5`.
- The extracted document carries a document-level Nathan McKnight byline and June 2025 date; this does not authenticate every equation individually.
- The separate HsH copy previously listed in the main report has blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7`. These are distinct repository artifacts, not assumed byte-identical.

SAT4D_6.txt remains the July 2025 official-directive document, Git blob `167136310cdf33ca8f986f33634692314c1a0946`. It states that SAT.O uses a 4D differentiable manifold populated by 1D filaments and requires derived behaviors to emerge from filament geometry and intersection with a propagating 3D wavefront. It is a directive source, not the missing sweep map.

## Blockwave full SHA-256

For the 2025-09-16 user-supplied attachment `BLOCKWAVE.txt`:
- Git blob: `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`.
- Full SHA-256: `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`.
- Upload context: conversation `68c990dd-df28-832e-b766-c267190aaffa`, message `0f3707aa-c0ae-4bb1-bc59-6333c025cf1c`, 2025-09-16T16:31:34.670358Z.
- First extant HsH archive-path commit: `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z.
- User-supplied attachment status is not internal equation authorship; embedded prose remains assistant-voiced.

## Separate proposed equation

The proposed sweep-boundary identity in PR #1594 is not a correction to SAT-O or Blockwave:

```text
∂W = C_end - C_start - S(∂C)
```

It is a conditional chain-level contract. Its product-boundary law is a premise in the Lean record, not an established physical construction. No historical equation was overwritten, normalized or promoted.
