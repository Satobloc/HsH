# Meridian Sandbox — Run 37 — Flat-slice Schwarzschild escape hatch

**Status:** SANDBOX / LOCAL:MERIDIAN / not canonical theory
**Date:** 2026-10-07

## Provenance actually read
- `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`
- current Common Reference Desk / workflow / symbol controls and 🔑 overview
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt` (substantial continuation read; connection/holonomy/UI/metric material)
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt` (substantial continuation read; ᚼ/SO(4)/frame-history machinery)
- HSH_RESOURCES reviewed as routing/reference support; no PRIOR_ART import.

## Result
Run 36 showed that the standard static Schwarzschild t=const slicing has nonzero intrinsic 3-curvature even though its extrinsic curvature vanishes. That killed the universal claim that spatial curvature must always be generated from time-normal turning.

The proposed escape hatch is real: Schwarzschild also admits Painleve-Gullstrand coordinates

```
ds² = -dT² + (dr + sqrt(2M/r) dT)² + r² dΩ².
```

The T=const spatial metric is exactly Euclidean:

```
gamma_ij dx^i dx^j = dr² + r² dΩ²,
^(3)R_ijkl = 0.
```

With lapse alpha=1 and radial shift beta^r=sqrt(2M/r), the stationary ADM extrinsic curvature is nonzero. In an orthonormal spatial frame its principal rates are

```
k_r = -(1/2) sqrt(2M/r^3)
k_theta = k_phi = sqrt(2M/r^3)
k_r/k_perp = -1/2.
```

The scripted invariants are

```
K = (3/2) sqrt(2M/r^3)
K_ij K^ij = 9M/(2r^3)
K² - K_ij K^ij = 0.
```

Thus the vacuum Hamiltonian constraint is satisfied with ^(3)R=0.

## Sandbox inference
The Run-36 counterexample was foliation-dependent. Standard GR permits a Schwarzschild representation in which intrinsic spatial curvature is zero and the gravitational geometry is carried by lapse/shift-normal embedding data. This is unusually compatible with the H(s)H timesheet/time-normal picture, but it does **not** prove that Painleve-Gullstrand is the H(s)H-preferred foliation.

A sharper candidate grammar is therefore foliation-aware:

```
H-state = {spatial metric gamma_ij, normal/shift field, extrinsic curvature K_ij, transport history}
```

with a possible H(s)H gauge/preferred representation minimizing intrinsic spatial curvature where such a foliation exists.

## Failure condition / next gate
Test whether the same flattening strategy survives beyond Schwarzschild. Kerr is the decisive next control. If no physically suitable H(s)H-aligned foliation can reduce Kerr's intrinsic 3-geometry while retaining the standard spacetime, intrinsic spatial geometry has earned an independent slot. If a flat or otherwise minimal-curvature slicing exists and the remaining geometry is carried by shift/extrinsic curvature, the time-normal/flow grammar gains substantial standard-GR support.
