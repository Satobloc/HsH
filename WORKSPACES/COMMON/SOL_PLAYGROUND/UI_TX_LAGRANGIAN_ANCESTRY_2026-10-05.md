# UI/TX + SAT/H(s)H Lagrangian ancestry — recovered 2026-10-05

**Status:** source crosswalk. Historical equations are not automatically current theory.

## Current working H(s)H kernel

[Current Mathematical Kernel](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SOL_PLAYGROUND/CURRENT_MATHEMATICAL_KERNEL_2026-10-01.md)

Current sandbox density:

```text
L_HsH =
  μ/2 |X_τ|²
+ I/2 ||Ω_τ||²
- T/2 |X_s|²
- B/2 |X_ss|²
- C/2 ||Ω_s - Ω_*(K,χ,n)||²
- D/2 ||∂_s Ω_s||²
- V_core(K)
- V_med
- V_int
+ Λ(|X_s|²-1)
```

with framed finite-core state, `Q_s=QΩ_s`, holonomy `U_γ=P exp∮Ω_s ds`, and current ᚼ direction `Ω_{n+1}=ᚼ_n[Ω_n]`.

Related current experiments:
- [EXP002 — trial H(s)H action](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SOL_PLAYGROUND/EXP002_TRIAL_HSH_ACTION.md)
- [EXP003 — kernel delta + next tests](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SOL_PLAYGROUND/EXP003_KERNEL_DELTA_AND_NEXT_TESTS.md)
- [EXP006 — toolbox integration map](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/SOL_PLAYGROUND/EXP006_TOOLBOX_INTEGRATION_MAP.md)

## Recovered UI/TX construction

The strongest current solver description is [SAT GEOMETRIC SOLVERS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20GEOMETRIC%20SOLVERS.txt). It explicitly makes UI/TX a dimension-general relative-frame/metrology solver independent of SAT survival.

Historical UI source:
- [2026/SAT CORE — UI CONFIG.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI%20CONFIG.txt)
- [2026/SAT CORE — UI BUILDOUT.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI%20BUILDOUT.txt)
- [2026/SAT CORE — UNIT CELL LAGRANGIANS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UNIT%20CELL%20LAGRANGIANS.txt)
- [SAT CORE — UI procedure PDF](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/2026/SAT%20CORE%20%E2%80%94%20UI_Procedure_SAT_4DHH_UC.pdf)

Historical UI trajectory generator:

[
y^mu(lambda)=r(lambda)R^mu{}_
u(lambda)x_0^
u,qquad Rin SO(4)
]

with scale and six-plane rotation controls. The historical file wrote

[
L_{UI}=rac12dot r^2+rac12r^2Omega_{mu
u}Omega^{mu
u}.
]

The current kernel corrects the motion-sensitive identity to

[
|X'|^2=(r')^2+r^2|Omega n|^2
]

and interprets the historical (0.5) under arclength as unit-speed normalization rather than a physical constant.

## Historical 4DHH / particle-action line

- [4DHH LAGRANGIAN extracted text](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/4DHH%20LAGRANGIAN%20%28nolat%29.txt)
- [VARIOUS LAGRANGIANS — speculative](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/VARIOUS%20LAGRANGIANS%20%28speculative%29.txt) — starts with a March 7, 2026 tentative UI configuration/Lagrangian.
- [SAT PARTICLE LAGRANGIAN](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/HsH%20SAT%202026%20ROUNDUP/SAT%20PARTICLE%20LAGRANGIAN.txt) — Bigbook timestamp 2026-03-30, explicitly tentative.
- [SAT26 Bigbook index](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/.[%E2%9A%99%EF%B8%8F_AI_FILES]/INDEXES/SAT26_BIGBOOK_INDEX_2026-10-05.md) — also points to early March 2026 Hyperfoam/4DHH material and the later math backbone.

## Ancestry boundary

Use historical equations as candidate reservoirs and provenance, not automatic authority. Reconstruct what they were trying to encode, then test against the current framed-tube kernel and SAT rigor backstop. UI/TX, Whirligig/Donut and Spheres are tools/solvers; physical assignments made with them are separate.
