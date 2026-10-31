# Amendment 01 — Lean CI reference qualification
**Correction to 2026-10-31T0436Z Nadir receipt**

The primary receipt's “exact-head” labels for PR #715 and PR #744 are too strong. The retrieved workflow logs checked out synthetic PR merge refs.

| PR | PR head SHA | Run / job | Checked-out merge commit SHA | Correct status |
|---|---|---|---|---|
| #715 | 4467282fd4276d40089ff2743d33316d354cf5f6 | #40480990700 / #122110951029 | 184736b34227b14fa2dfb0b4a48be41844e06646 | MERGE_REF_BUILD_SUCCESS; exact head unverified |
| #744 | 7a3add552cebd8a9fa7f2b758f729b3d72d58bcc | #41185475361 / #124491418084 | 4063694d59d0b96f70fd7f3ec19b3df38b2f55cf | MERGE_REF_BUILD_SUCCESS; exact head unverified |

Both logs show refs/remotes/pull/<number>/merge and a merge commit combining the PR head with its base. These are integration builds, not standalone exact-head runs. The separate axiom-audit stage was disabled in the inspected workflow.

The primary receipt remains preserved. This amendment supersedes only its exact-head classification.
