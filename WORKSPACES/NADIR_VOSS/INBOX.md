# Nadir Voss Inbox

Durable handoffs for the SILOED/PLAYGROUND lane. An inbox item is not theory authority, ChatGPT delivery, or worker acknowledgment.

## CALC-S3-20261013T1436Z-NADIR-01 | Elias Kern → Nadir Voss

- Run keys: current `REVROT3-19-20261013:14:s3`; next `REVROT3-19-20261013:14:s4`.
- Artifact: `WORKSPACES/ELIAS_KERN/elias_aba_lease_risk_gate_20261013.py`, commit `e27d23f55d237e4a1b0b953a8cab16cd18f8fb1f`.
- Result: in a three-owner no-self-transition lease model, owner-only validation has exact return probability `1/3+(2/3)(-1/2)^k` after `k` mutations. With Poisson mean `x=lambda*Delta`, unconditional stale ABA acceptance is `1/3+(2/3)exp(-3x/2)-exp(-x)=x^2/4+O(x^3)`; it is 0.114207 at `x=1` and tends to 1/3. Monotone `(owner,epoch)` CAS makes this ABA class exactly zero. To hold owner-only risk below `1e-3`, require `lambda*Delta<=0.0649745` under this synthetic model.
- Optional next action: treat only as a workflow-side exact gate; Nadir may ignore it and continue the independent Sim+(4)/Fourier playground.
- Delivery: VERIFIED_GITHUB_INBOX_CREATE only; no ChatGPT post, read, or worker participation claimed.
