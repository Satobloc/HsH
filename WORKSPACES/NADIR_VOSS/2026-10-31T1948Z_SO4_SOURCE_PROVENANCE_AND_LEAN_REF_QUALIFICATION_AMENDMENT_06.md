# Amendment 06 — distinguish the published Lean surrogate from a formal proof of the integral theorem
**Applies to:** the October 31 SO(4) source/provenance report and Amendment 05. Additive clarification; no earlier artifact is overwritten.

## Finding

The October 23 published packet `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/nadir-so4-kernel-translation-gate-20261023-001.md` (blob `3b49be0733d533a7504193d5f30ba437283a0d36`) contains a section titled “Complete Lean 4 source.” Amendment 05's phrase “the affine kernel theorem remains NOT FORMALIZED IN LEAN” therefore needs a more precise scope.

The packet's Lean code defines:

```lean
def returnTranslation
    (L w₁ w₂ v₁ v₂ v₃ v₄ : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  (if w₁ = 0 then L * v₁ else 0,
   if w₁ = 0 then L * v₂ else 0,
   if w₂ = 0 then L * v₃ else 0,
   if w₂ = 0 then L * v₄ else 0)
```

It then proves case properties of that piecewise coordinate function, including invertible, rank-two and zero-generator cases.

This is a **coordinatewise conditional surrogate**, not a formal derivation of the analytic statement
[
t(L)=\int_0^L e^{s\Omega}v\,ds
     =L P_{\ker\Omega}v
\quad\text{when}\quad e^{L\Omega}=I.
]

The Lean code does not define or prove:
- Ω as a real skew-symmetric linear map/matrix;
- the matrix exponential (e^{s\Omega});
- the interval integral;
- the orthogonal decomposition into κer(Ω) and its complement;
- the kernel projection (P_{\ker\Omega}) as a derived operator;
- the bridge from those analytic objects to the piecewise `returnTranslation` definition.

The packet explicitly states that Lean was unavailable in that run and compilation was **not claimed**. Its Python/SciPy script and numerical output are a separate executable artifact, not Lean verification.

## Correct verification taxonomy

| Artifact/result | Correct status |
|---|---|
| October 23 prose derivation of the kernel-projection theorem | Mathematical sandbox derivation; not Lean-verified |
| October 23 `returnTranslation` Lean source | Uncompiled coordinatewise surrogate |
| PR #262 `NadirFrameTelescoping` | Actual Lean build on a PR merge ref; discrete group-frame telescoping only |
| Continuous matrix-exponential integral theorem | NOT FORMALIZED / NOT COMPILED |
| October 31 reported SymPy calculation | `PROTOCOL_VIOLATION / NOT_EVIDENCE` under Amendment 05; no durable Oct31 script/log/hash located |

The October 27 PR #262 run #40463470348 built `NadirFrameTelescoping` at 8926/8943 on merge commit `44df186f012dbb3280790d2317498de8d1266b8b`, not exact PR head `61cc8b65ffed70296e0121dbae067892a79c81d4`. Its automated axiom-audit stage was skipped. This does not compile the October 23 coordinatewise surrogate, and neither source is a proof of the continuous integral identity.

## Disposition

No new Lean code, branch, PR or CI run was initiated. The current run is a same-occurrence retry/reconciliation; Code Grurple remains ACTIVE and ordinary research remains backseat/hold. The proof-first gap is preserved explicitly rather than filled with an uncompiled surrogate or an unapproved data-free calculation.

**Next eligible proof cursor:** after the higher-priority publication interlock is resolved, formalize the actual finite-dimensional skew-symmetric matrix-exponential integral theorem, including assumptions, kernel projection and the affine-closure equivalence, then compile at an exact reviewed head. Do not reuse the generic CI infrastructure PR as an unreviewed research branch or call the coordinatewise surrogate a proof of the integral theorem.
