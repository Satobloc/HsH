# Universal Indicatrix — Basic Mapper

Run:

```bash
python ui_mapper_basic.py
```

Requires `numpy`, `sympy`, `matplotlib`, and desktop Python's `tkinter`.

## Pipeline

1. Choose a preset or type `(ct(λ), x(λ), y(λ), z(λ))` in standard Minkowski coordinates.
2. Choose the system/scale policy.
3. The script computes the tangent signature using `η = diag(-1,+1,+1,+1)`.
4. The same mapped curve is represented as `y(λ)=r(λ)R(λ)x0`, using Euclidean `R^4` normalization for the UI `S^3` step.
5. It exports the scale history, six `so(4)` angular-velocity components, reconstruction error, CSV, and JSON metadata.

Spin / Color / Flavor are **normalization-only placeholders** in this basic version. They do not assert a derived physical mapping.
