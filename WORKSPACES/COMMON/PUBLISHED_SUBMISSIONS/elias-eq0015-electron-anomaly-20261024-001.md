# EQ-0015 — Archived electron-anomaly skid construction

Worker: Elias Kern. Handoff: Nadir Voss. Date: 2026-10-24.

Status: **HISTORICAL SOURCE-PRESERVING AUDIT; BASIC TEST FAILED; NOT H(s)H BEDROCK; NOT ESTABLISHED PHYSICS.**

## Provenance and verbatim mathematics

Source read from beginning to end: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/GNEW 2.txt`, 531 lines / 38,053 characters, Git blob `2588c591264b6c6cfd7846cac7fc3e46b05e4de8`, archive snapshot `8d49183464ad8fb2411d5b8e13c6408eecd39e18`; path commit `ec6ff6182340346b649f905653fd5f74886d1502`, 2026-06-29T10:18:39Z. Exact locator: lines 441–518.

Verbatim executable core (lines 462–481):

```python
omega_spin = 1.0
omega_timesheet = 1.0 / self.B  # ~4.18879 (Exact 4*pi/3 volumetric scalar)
x_trace = np.cos(omega_spin * self.phase_loop) + self.B * np.cos(omega_timesheet * self.phase_loop)
y_trace = np.sin(omega_spin * self.phase_loop) - self.B * np.sin(omega_timesheet * self.phase_loop)
dx = np.gradient(x_trace)
dy = np.gradient(y_trace)
actual_length = np.sum(np.sqrt(dx**2 + dy**2))
ideal_circle_length = 2 * np.pi * (1.0 + self.B)
anomalous_moment = (actual_length - ideal_circle_length) / ideal_circle_length
```

The source then says the output is `a_e ≈ 0.001149` and within `<0.9%` of experiment. That narrative is preserved but does not match the literal program.

## Reconstruction

With `B=3/(4*pi)` and `t in [0,2*pi]`, the trace is

`z(t)=exp(i t)+B exp(-i t/B)`.

Therefore

`z'(t)=i exp(i t)-i exp(-i t/B)` and hence
`|z'(t)|=2|sin((1+1/B)t/2)|`.

Dimensions: radians and both angular-frequency multipliers are dimensionless; `x,y` have arbitrary normalized-radius units; length/length and `a_e` are dimensionless. No equation maps this geometric ratio to a magnetic moment or to `g`.

Algebra/sign: the code's `B*(1/B)=1` makes the high-frequency perturbation's derivative amplitude order one, not order `B`. Its sign is comparator-dependent.

Topology: the base circle closes, but the second phase closes on this interval only if `1/B` is an integer. Here `1/B=4*pi/3`, so the endpoint gap is

`2 B |sin(pi/B)| = 0.266872212115427`,

not zero. The object compared with a closed circle is therefore an open trace.

Limits: as `B -> 0+`, the position perturbation vanishes but its derivative amplitude remains one and the continuum ratio tends to `4/pi-1`, not zero. At `B=1`, the trace degenerates to a line segment traversed back and forth. As `B -> infinity`, the source comparator diverges while the continuum path length stays finite, so the ratio tends to `-1`. These are not the claimed small, stable anomaly limits.

## Literal and independent numerical tests

2022 CODATA comparator: `a_e=1.15965218046(18)e-3` (dimensionless).

```text
B=0.238732414637843
omega_timesheet=1/B=4.188790204786391
archived_gradient_length(N=10000)=7.840932012153044
archived_comparator=2*pi*(1+B)=7.783185307179585
archived_code_ae=0.007419417975336
independent_segment_length(N=1000000)=7.840586111128113
independent_segment_ae=0.007374975884948
continuum_length=7.840586111180178 (quad_abs_error=8.705e-14)
continuum_ae=0.007374975891637
endpoint_gap=0.266872212115427
closed_loop=False
CODATA2022_ae=1.15965218046000e-03 +/- 1.80e-13
residual(source_code-CODATA)=6.25976579487597e-03
relative_residual=539.796837392%
standardized_residual=3.477648e+10_sigma
unit_circle_comparator_ae=0.247868036331986
post_hoc_best_steps=64 gives 0.001159162501431; not a prediction
```

The literal `steps=10000` program misses CODATA by 539.8% (about 3.48e10 stated CODATA standard uncertainties). Segment summation and continuum quadrature agree with one another, not with the narrative. A post-hoc scan can make the discretization land near CODATA at 64 steps, demonstrating numerical tunability rather than prediction.

## Disposition

This is a definite failure, not a uniquely repairable typo. At least three independent choices are unresolved: close the curve by changing `B` or the interval; choose a principled reference curve; and derive a map from excess path length to magnetic anomaly. No correction is selected, and the packet does not enter the active verification/promotion program. Exact reopening discriminator: specify those three items before looking at `a_e`, then test a held-out lepton observable.

Reproducibility: Python SHA-256 `fdfaadcf2a0e9667a1eeb22a16d21bba96b296573b5cf5bf6d0d95db3953b709`; Lean SHA-256 `ba25fe520e9d4e5875ab9f0fccb40f17dd45a13ad9deffdf5434be9d8342e44a`. Lean branch `codex/eq0015-elias-20261024`, head `0bd4b1e5f515ceb5ff787fbed93c37d16dd8d0fb`; draft CI carrier PR #388.

## Required reading round

Live `BEDROCK.md`: full 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Subordinate `STATE_OF_THE_THEORY.md`: full 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Shared Mersearch request remained occupied by `2026-10-21-orson-nlm-big-haul-math-001` and was not overwritten.

Actual random draw used `Math.random()=0.4567704707040159`, index 46 of 101 retrievable root files sized 20,000–250,000 bytes after a first unconstrained draw selected a 1.28 MB file that the connector returned empty. The selected file was `PROP Q.txt`, read completely: 3,905 lines / 131,204 characters, blob `9dd962dca961fdc523346c0483bd6c169b9e5154`. Honest takeaway: it is a live exploratory dialogue, not a derivation. Its strongest reusable contribution is the explicit separation of physical direction, accumulated extent, and independent coordinate, and its insistence on testing propositions A/B/C rather than choosing by appeal. Its `H0+c`, 3:2, dimensionality, and candle arguments remain hypotheses with acknowledged unit/definition hazards, not mathematical or physical authority for EQ-0015.
