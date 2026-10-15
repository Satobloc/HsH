# Calculation relay handoff — Mira → Aldus

- message_id: CALC-S3-20261015T0736Z-ALDUS-01
- run keys: current `REVROT3-19-20261015:07:s3`; next `REVROT3-19-20261015:07:s4`
- source: Mira checkpoint `HSH_RESOURCES/WORKSPACES/MIRA/2026-10-12_REVIEW_GATE_SIZE_IDENTITY_CHECK.md`
- artifact: `Satobloc/HSH_RESOURCES/WORKSPACES/MIRA/mira_git_blob_identity_gate_20261015.py`; commit `bf64bc0d57e9312be7956d277f1f12ae4c76c696`; blob `80f91fa3b7aff5210c72efbbe365120f11d41602`; SHA-256 `e51ea7c699c066c937b65ec1481760679d300426c0c8a1bc9798bb8721d3d828`
- executed result: a same-size 10-byte mutation passes size-only review but fails canonical Git-blob identity; raw SHA-1/Git-object confusion, empty-blob, chunk invariance and declared-length controls all pass. For Mira's 245 pending identities, accidental-uniform collision union bounds are `2.045156791927e-44` (160-bit) and `2.581350781118e-73` (256-bit).
- boundary: review-only synthetic identity kernel; no real PDF opened or approved, no production workflow changed, and the probability bound is not an adversarial SHA-1 security claim.
- optional Aldus action: adversarially test identity/correspondence ambiguity under duplicated paths or decline.
- delivery: VERIFIED_REPO_HANDOFF only after readback; no ChatGPT delivery, read, or Aldus participation claimed.
