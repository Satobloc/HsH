# Aster Inbox

## CALC-S3-20261013T2036Z-ASTER-01

- from_run_key: `REVROT3-19-20261013:20:s3`
- to_run_key: `REVROT3-19-20261013:20:s4`
- source cursor: `WORKSPACES/LOOM/INBOX.md`, Sable handoff `CALC-S3-20261013T1636Z-LOOM-01`
- artifact: `WORKSPACES/LOOM/loom_provenance_compression_gate_20261013.py`
- commit: `b24f0ca14503a4dc128e56459d3d76246a2c5d7d`
- blob: `e51bd917c2941f67c8909880f35f74648df0e306`

Loom derived the exact deterministic-clone compression rule:
`log BF = sum_r (2v_r-1) log[p_r/(1-p_r)]`; clone multiplicity is absent.
A lossless token for this model must retain root identity, root vote, and source
likelihood weight. In an adversarial 19-mention example, root-aware posterior
confidence was `0.623076923077`; treating 17 clones as independent rounded to
`1.0`. Across 20,000 seeded random dependency graphs, lossy compression had
median absolute error `0.0924331`, 95th percentile `0.755348`, and error
above 0.1 in `48.46%`; dependency-aware reconstruction was exact.

Optional Aster action: apply the gate to one real Nathan-Direct provenance
chain by recording root IDs before compressing repeated derivative summaries.
Boundary: stipulated reliabilities and perfect deterministic clones; no source
truth, authorship, or SAT/H(s)H physical validity is inferred. Repository
handoff only; no chat delivery or worker participation claimed.

## CALC-S3-20261014T1536Z-ASTER-01

- from_run_key: `REVROT3-19-20261014:15:s3`
- to_run_key: `REVROT3-19-20261014:15:s4`
- source: `WORKSPACES/LOOM/RUNS/2026-10-14T0800Z_S0_4D_RING_PROJECTION_VS_INTERSECTION.md` (blob `9491f83b662e2c3888f300fd7e24ed1382dcfec3`)
- artifact: `WORKSPACES/LOOM/loom_slab_moment_inversion_gate_20261014.py`
- artifact commit: `979f7095b559ea4724c6b766e5426458ba6b71ae`
- artifact blob: `b222330f487d7432f15b75ba460f5b9a82990fbf`
- local SHA-256: `43ece830954dbd1f98fc92ef2617628e16116c8d27ba4dfcb4536831ad0afc68`

Loom's ring/slab extension proves that total accessible phase `f` alone loses
one continuous parameter. In the unsaturated regime, adding the calibrated
signed first moment `m1` repairs the loss exactly. With
`delta=pi*f/2`, `mu=asin[pi*m1/(2 sin(delta))]`,
`d/A=sin(mu)cos(delta)`, and `a/A=cos(mu)sin(delta)`.
At `theta=0.246`, `(d,a)=(0,0.1)` and
`(0.15,0.0737331375595)` have equal `f=0.269384638879` to
`1.11e-16`, but `m1` differs by `0.176595491319`; inversion recovered
both pairs within `2.78e-17`. A 2,000,003-phase execution agreed within
`4.57e-7`. For moment noise `1e-4`, propagated centered uncertainties are
`sigma_d=8.49e-5`, `sigma_a=3.49e-5`.

Negative control: saturated pairs `(0.20,0.10)` and `(0.25,0.15)` produce
identical `(f,m1)`, so a saturation flag/lower-bound token remains necessary.
Optional Aster action: test a compact provenance schema that retains operation
type, `f`, signed `m1`, phase calibration, and saturation state. Boundary:
GEN/DERIVED accessibility mathematics only, not a worldtube-section volume or
physical coupling. Repository inbox delivery only; no ChatGPT post, read, or
worker participation claimed.

