# Ouroboros / Soxieu: safe hybrid desktop + repository deployment gate
**October 26, 2026 | planning/architecture preflight, not an installation or authorized unattended launch.**
**Project phase parent:** [Phase Steering](PHASE_STEERING_2026-10-26.md), S05. **Subject software:** [Satobloc/Soxieu](https://github.com/Satobloc/Soxieu), a fork of [razzant/ouroboros](https://github.com/razzant/ouroboros). **Existing complementary tool:** [Satobloc/mission-control-satb](https://github.com/Satobloc/mission-control-satb). This document records current source-backed investigation. No workstation file access or installer execution occurred.

## Verified source facts
- Soxieu fork `VERSION` currently reads `6.114.0`. Its `README.md` describes Windows portable ZIP / `Ouroboros.exe`, desktop + headless CLI, Git-managed source, durable local memory/task state, model providers and agent delegation. Its `LICENSE` is MIT with original author copyright, so keep notices intact.
- Upstream public README inspected Oct 26 advertises a different version scheme (7.8.0, dated Oct 23 2026). **Do not infer newer/older feature parity from these numbers**; record fork-specific commit and compare actual manifests/changes before any rebase/upgrade.
- Soxieu's `CONTRIBUTING.md` requires full relevant pre-reading, tests, a separate reviewing agent and source review evidence for changes. `docs/DEPLOYMENT.md` says non-local HTTP/WS bind should be protected by `OUROBOROS_NETWORK_PASSWORD` or truly private, separately authenticated ingress; the bypass for trusted networks is not suitable on a public LAN.
- Current managed source runtime is local Python-backed server + UI, task queue, worker pool, file-backed state, managed Git operations and evolution machinery. It can change its implementation and files, so *repositories are inputs and tools*, not a substitute for a protected running host.
- GitHub Actions jobs are ephemeral. A GitHub repository can store agent code, instructions, tasks, review artifacts, commits and issue/PR ingress, but it cannot by itself provide always-on memory/process continuity. Persistent hosting needs a local PC, self-hosted runner or rented machine with durable volumes and constrained credentials. Repository Actions may handle bounded trigger-based stateless jobs.

## Recommended topology
1. **Desktop home base (first controlled test)**: Install the reviewed Windows release ZIP (fork or upstream only after identifying exact code/commit and integrity), run `Ouroboros.exe`, configure main provider locally, credentials from secure OS/service secret store, API/budget ceilings, local-only server. Optional bundled `install-ouroboros-cli.cmd` gives terminal controls. Protect original archive and personal files; avoid a root-of-drive or home-directory work grant.
2. **GitHub repository workspaces (second)**: Each repo cloned into an *isolated agent worktree* with per-repo least-privilege tokens/branch scopes. Read-only corpus mounts are the default; code changes, cross-repo promotion, publication, protected/provenance edits and workflow changes require explicitly reviewed PRs. Preserve reproducible commit/result receipts.
3. **Shared hybrid control (third)**: HsH Common/Tern scheduling controls remain upstream authority for SAT work; Ouroboros executes specific approved bounded tasks and emits the exact status/provenance protocol already used by the project. Mission Control might offer task/cost telemetry once assessed. This should be federated with existing Mersearch/Viewer, not another source of science truth.
4. **Optional always-on repository-adjacent host (later)**: Containerized Ouroboros on a private self-hosted runner/VPS with persistent encrypted volumes, network authentication, outbound policies, quotas, backup/restore, logging and owner kill-switch. GitHub Actions/Issues supply intake, not permanent compute. No unsecured public port.

## Rollout gates

| Gate | Evidence needed | Unsafe shortcut to refuse |
|---|---|---|
| G0 Identity / version | Fork branch/tag/commit, release SHA256, manifest dependency diff, source policy and current supported OS recorded | Running unknown downloaded binary or merging mismatched version schemes |
| G1 Local smoke | User verifies first-run UI and `ouroboros status`; repo access initially **none**, local sample text and private test folder only, budget known | Granting desktop drive or GitHub full owner token during first launch |
| G2 Read-only archive map | Add one repository at a time as a read-only reference workspace; successful Mersearch/native index retrieval and no attempted writes; keep original Nathan private materials protected | Pointing writable agent to all archives and trusting its judgment without boundaries |
| G3 Restricted edit | One harmless approved branch-level commit in a dedicated test repo/worktree, test+review receipts, no raw archive alteration, source/secret scrubbing | Autonomous main-branch rewrite, unrestricted GitHub Actions/credential use |
| G4 Multi-repo trial | One named scientific-source recovery task with correct source locators and a separate evaluator; one bounded code/CI lane; compare to hand-run cost/success | A multi-agent run that can't distinguish execution from proposed work |
| G5 Persistent runner | Durable encrypted state, backup restore proved, crash/restart continuity tested, least privilege, egress authentication, kill switch, operator billing alert | Open server bound to `0.0.0.0`, permissive token, unlimited self-modification or unbudgeted delegates |
| G6 Shared control | Existing Tern/scheduler lease and Common/issue receipts updated, parent lane cursor retained, no clobber of another active worker | Agent inventing new scheduler policy or writing BEDROCK or publication state |

## Local Windows route (instructions, not executed)
- Identify downloaded installer source; review signature/SHA and selected fork/upstream branch. Windows x64 release procedure documented by README: download ZIP, extract, run `Ouroboros.exe`. Bundled CLI installer is optional; it adds a user-local `ouroboros` command. On the installed runtime, `ouroboros status` checks live state.
- If building from source is truly required, Soxieu's `CONTRIBUTING.md`, `docs/CHECKLISTS.md`, architecture and current `pyproject.toml`/`uv.lock` are the sources of truth. Do not casually substitute the upstream README commands, which may refer to a different branch/runtime version.
- Desktop filesystem permissions, local current installation state, available provider models/accounts, and a tolerable cost budget have **not been inspected**. Therefore no existing install is claimed complete, no live service has been started, and the right next operation is a local controlled preflight.

## Measured comparisons for a smart ecology
- Source-recovery completion rate on **actual** SAT documents, correct original message/commit locators, duplicate detection and correction provenance.
- Actual execution vs planned actions, QA fail/repair rate, task cancellations, branch/file clobber incidents, reviewer independence, cost per audited deliverable and wall-clock/operator attention.
- Degree of reuse of Mersearch, historical archive indexes, toolkit, cross-formalism router, Calculation Relay, Factory Floor, War Room and dashboard. **Infrastructure value is measured by its demonstrated integration, not its size.**

## Security / institutional separation
- No public publication of personal working data, source credentials or private records.
- Do not assume HSH_RESOURCES is private merely because legacy documentation says so: October 26 GitHub repository metadata returned `visibility=public`. Confirm with owner and GitHub settings before mounting or publishing content. Public discoverability and desired sharing restrictions are distinct.
- Named scientific workers retain provenance of their contributions; external agent-delegated outputs record agent/model/version, full job inputs (privacy safe), actual code and verification, and human/owner approval for publication.
- No change to Ouroboros's own MIT rights or SAT/HsH research-commons licenses is authorized by this integration plan.

**Return cursor:** compare fork source/version and reproducible local installer; test restricted local read-only single-repo task; determine if mission-control-satb should be observer-only; route a bounded test through existing task graph after operator approval of local credentials/budgets. Audit resource visibility and license collision first.
