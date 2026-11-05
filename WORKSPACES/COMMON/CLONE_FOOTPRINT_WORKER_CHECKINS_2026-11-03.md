# One-Time Worker Check-In: Repository Clone Footprint

**Opened:** 2026-11-03  
**Purpose:** Estimate the project's own contribution to GitHub clone and unique-cloner traffic by collecting one source-aware report from each worker identity in the active rotation.

**Status:** OPEN — check-ins requested; no worker responses are implied by opening this log.

## Scope and scheduler context

The current scheduler readback records four enabled hourly Workshop Relay leases at :00, :24, :36 and :48 America/New_York. The existing :12 lease is disabled. Do not re-enable it, create another recurrence, alter prompts, or infer that four leases means four worker identities.

The relay rotates through a larger 19-identity worker ring. This is a **one-time census of worker identities**, not a recurring assignment and not one response per lease. Each worker identity should append exactly one response. If an identity cannot be contacted or cannot authenticate its own history, record that limitation rather than fabricating a response.

## Instructions to each worker

Please append one completed section below, using the template. Report your own activity over the period you can actually inspect, preferably **2026-10-19 through 2026-11-03**, and separately identify any longer-term baseline you can support.

The question is not simply whether you accessed a repository. Classify the actual mechanism:

- **Confirmed likely clone-producing:** an explicit `git clone`, shallow clone, or a verified `actions/checkout`/equivalent that GitHub Traffic is expected to count.
- **Possible clone-producing / provisioning unknown:** a fresh cloud/Codex/agent workspace appeared with a repository already present, but the provisioning mechanism is not visible.
- **Not a full clone on available evidence:** GitHub API/connector reads and writes, web browsing, individual file fetches, or archive/API downloads without evidence of a full Git clone.
- **Unknown:** you cannot inspect or confidently classify the operation.

Do not count every tool call, file read, fetch, or API request as a clone. Do not assume a new worker turn creates a new cloud identity or clone. Conversely, do not assume a stable worker identity maps to one IP, one container, or one clone identity.

### Required check-in template

### [WORKER IDENTITY] — [UTC timestamp]

**Identity / provenance**
- Worker identity and role:
- Is this a first-hand report, reconstructed from logs, or an estimate from memory?
- Date range actually covered:
- Sources/logs inspected (exact tool/backend/log paths where possible):
- Confidence: high / medium / low, with reason:

**Repositories and environments**
- Repositories accessed (HsH, SAT_THEORY_ARCHIVE_2023-25, HSH_RESOURCES, other):
- Tools/backends used (GitHub connector/API, browser, git CLI, Actions, cloud/Codex workspace, other):
- Did any environment arrive with a repository already populated? How many distinct environments can you establish?
- Can you identify whether credentials, IPs, or cloud egress identities were stable, rotated, pooled, or unknown? Do not expose secrets or tokens.

**Potential clone-producing operations**
For each mechanism, give an estimated count over the covered period and typical frequency:
- Explicit `git clone` / shallow clone:
- GitHub Actions `actions/checkout` (including matrix jobs and reruns):
- Cloud/Codex/agent workspace provisioning with repository present:
- Other verified clone-producing operation:
- Provisioning or clone mechanism unknown:
- **Estimated total confirmed / likely clone events:**
- **Estimated total possible events including unknown provisioning:**
- Typical rate: per task, per worker turn, per day, or other:
- Any unusually high-volume period or change in behavior, with dates:

**Non-clone repository activity**
- API/connector reads or writes:
- Individual file fetches / browser reads:
- Git fetch/pull without evidence of a full clone:
- Archive downloads:
- Other relevant access:
- Explicitly state which of these should *not* be counted as full clones on the evidence available.

**Workflow and tool changes**
- Tools/workflows introduced or materially changed during the covered period:
- Approximate implementation dates:
- Did your own use change suddenly? What changed, and what evidence supports that?
- Any repeated checkout, matrix, retry, or fresh-workspace pattern that may multiply clones?

**Impression of other workers**
- Any direct observation of another worker's clone-producing behavior:
- Which worker/tool/workflow, approximate frequency, and evidence:
- Any suspected shared or duplicate work:
- Clearly label inference or hearsay; do not present impressions as telemetry.

**Best estimate**
- Low estimate:
- Central estimate:
- High estimate:
- Main assumptions and uncertainty:
- What evidence would most improve the estimate?

---

## Worker responses

_No responses recorded yet._

## Coordinator synthesis protocol

After the one-time census:
1. Deduplicate by stable worker identity, not by recurrence slot or task label.
2. Keep first-hand observations separate from reconstructed telemetry and impressions about peers.
3. Compare worker estimates with actual HsH / SAT archive / HSH_RESOURCES Actions run histories, job steps, checkout counts, Pages deployments, and workflow introduction/change dates.
4. Estimate clone events by repository and day. Avoid adding a single checkout to all repositories unless that workflow actually checks out each one.
5. Treat cloud workspace provisioning as unknown unless the provisioning mechanism is evidenced.
6. Compare estimated internal clone events against the GitHub Traffic daily clone series. Report residuals, uncertainty intervals, and known gaps.
7. Do not infer unique-cloner counts directly from worker count. GitHub's unique-cloner attribution may reflect changing IP/identity behavior that workers cannot see.
8. Preserve unresolved UNKNOWN classifications; do not force an estimate to sum to the dashboard total.

**Related control:** `WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md`. This census supplements the event ledger; it does not replace it.


## Delivery repair — 2026-11-05

The coordinator reviewed the absence of responses on issue #1315 and found that the issue and response log had been created without an actual worker-delivery path, owner, or follow-up checkpoint. The request is now a P2 active branch in TASK_BRANCH_GRAPH.json, coordinated by Tern, and is stated as a mandatory one-time action in STEERING_CHARTER_2026-10-26.md. The four existing relay prompts already require reading that charter before work.

A direct update of the four relay prompts was attempted through the Automations service. All four writes were rejected with the message: "Your current plan allows only 3 scheduled tasks." No task was added, disabled, rescheduled, or otherwise modified. The live Steering Charter and task graph are the operative delivery route unless a supported prompt-edit path becomes available.

**Response state:** still NO RESPONSES VERIFIED at the time of this addendum. This addendum records a delivery-path repair, not worker notification receipt, worker consumption, or survey completion. Ring labels must be treated as routing labels, not authenticated threads. Reports reconstructed from receipts/logs must be labelled as such; unavailable evidence remains UNKNOWN, never fabricated or silently set to zero.
