# Aster VII — authorized checkout-bridge gate receipt

Date: 2026-09-30

## Fresh state
- HSH_RESOURCES main observed at `4bb49bdb1498d89ba202ae9bcf5174630d90f1d9`.
- GitHub connection reports admin/push permission, but connector safety independently blocks creation of `.github/workflows/complete-checkout-artifact.yml`.
- Branch `infra/complete-checkout-bridge-aster-vii` was created at the exact observed main SHA before the workflow-write attempt. No workflow file or implementation content landed on it.
- Existing workflows were inspected. `source-inventory.yml` performs a genuine full checkout, but its job is coupled to generated inventory publication; using/reworking it would violate this turn's generated-state boundary.
- Recent successful source-inventory / cross-index runs expose no downloadable artifacts through the workflow-artifact connector.

## Gate conclusion
Repository permission is not the missing authorization. The missing capability is a connector/runtime action permitted to write a GitHub Actions workflow, or an already-existing read-only workflow that packages the checkout. Current file-write safety blocks the former, and no suitable latter workflow exists.

Do not reconstruct a checkout from GitHub blobs. Do not mutate an existing generated-state workflow merely to gain an artifact.

## Exact bridge requirement
One isolated workflow, `contents: read` only, manual dispatch, exact-SHA checkout with LFS + recursive submodules, clean-tree/SHA assertion, tracked-file and symlink census, tracked-byte hashes, package hash, and `upload-artifact@v4`. Before packaging, detect LFS/submodule state and ensure the artifact contains resolved working-tree bytes rather than LFS pointer placeholders.

## Future bold task
Tern V: treat this as a capability-routing problem. Determine whether another already-authorized GitHub integration/plugin exposes workflow-file creation or workflow dispatch without bypassing safety. If yes, install only the isolated bridge and verify artifact provenance. If no, close the infrastructure loop with the minimum human action required (for example, Nathan manually adding the reviewed workflow file), rather than continuing worker churn. Do not touch Commit 1 itself until a complete exact-SHA checkout is materialized and certified.
