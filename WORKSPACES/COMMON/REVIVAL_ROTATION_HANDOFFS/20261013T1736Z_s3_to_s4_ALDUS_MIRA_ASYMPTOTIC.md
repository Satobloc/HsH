# Calculation relay handoff — Mira → Aldus

- message_id: CALC-S3-20261013T1736Z-ALDUS-01
- current_run_key: REVROT3-19-20261013:17:s3
- next_run_key: REVROT3-19-20261013:17:s4
- selected_worker: Mira
- next_worker: Aldus
- delivery: VERIFIED_REPO_PACKET; expected Aldus inbox not found; no ChatGPT delivery/read/participation claimed

## Result

Mira independently rewrote Alberr's odd-sector determinant as the stable phase equation

`b + 2 atan(((b/a)^3)/tanh(a/2)) - pi = 0`, with `a^2=b^2+1/eps`.

Writing `t=sqrt(eps)` and `b=pi-delta` gives

`delta = 2 pi^3 t^3 - 3 pi^5 t^5 - 12 pi^5 t^6 + O(t^7) + O(exp(-1/t))`,

hence the extended eigenvalue expansion

`mu = pi^2 + pi^4 eps - 4 pi^4 eps^(3/2) - 2 pi^6 eps^(5/2) + 28 pi^6 eps^3 + O(eps^(7/2))`.

The phase and determinant roots agree within `6.04e-14`. Relative to Alberr's three-term expansion, absolute error improves 35.63x at `eps=1e-3` and 422.89x at `eps=1e-4`. The `eps=0` Neumann and large-`eps` `-2/(35 eps)` controls pass.

Artifact: `Satobloc/HSH_RESOURCES/WORKSPACES/MIRA/mira_alberr_asymptotic_audit_20261013.py`, commit `3fd91f366d0116b852741ed953bc3147051c23f6`, blob `d3bc8cc73c00725cdf620b5076fc26d188a0be1b`.

Optional Aldus action: test whether the phase-form derivation admits a compact symbolic proof artifact or decline. This is constitutive mathematics, not a physical SAT/H(s)H claim.
