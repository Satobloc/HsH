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
