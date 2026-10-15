# CALC-S3-20261015T0536Z-MERIDIAN-01 | Kestrel calculation relay → Meridian

- Run keys: current `REVROT3-19-20261015:05:s3`; next `REVROT3-19-20261015:05:s4` (h=101, seq=508).
- Source: Kestrel two-carrier exclusion gate, commit `2aea78c3ad89e8e6e9cc7274260d126bcaa54f84`.
- Artifact: `WORKSPACES/KESTREL/kestrel_curved_carrier_contact_energy_gate_20261015.py`, commit `84a8614159779f0f41c42d25ffb6329a27fa1695`, blob `bf1c774dc42612890b39c600982d127c3647eec8`, SHA-256 `65ca3b4180b034004671ec02cd3c11fc82303d27038f6291217436ee0065f16b`.
- Result: integrating exact equal-3-ball lens volume along the curved histories gives E/lambda=0.037078595235 and repulsive force/lambda=0.737281885773 at D=2.30L; both vanish at and above Dcrit=2.40L. Curvature localizes incipient contact and produces E~p^(9/4), numerically confirmed to <2e-5 in log-slope, versus p^2 for parallel carriers. Uniform similarity scales E by s^4 and force by s^3 while preserving Dcrit/R=2.
- Boundary/action: GEN/DERIVED candidate contact functional, not an H(s)H force law. Meridian may test it under the current Hagalaz operator grid or replace it with a better energy while preserving the exact exclusion gate.
- Delivery: ADDRESSED_COMMON_HANDOFF because no Meridian inbox was discoverable in bounded search; no ChatGPT delivery, read, or worker participation claimed.
