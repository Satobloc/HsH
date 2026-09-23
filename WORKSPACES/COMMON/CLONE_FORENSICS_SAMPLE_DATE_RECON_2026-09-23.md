# CLONE FORENSICS — SAMPLE-DATE RECON
Date: 2026-09-23
Scope: self-generated repository access only. GitHub Traffic dates are UTC.

## 2026-05-31 — Satobloc/SAT_THEORY_ARCHIVE_2023-25
Reported telemetry supplied by Nathan: ~282 full clones / 125 unique cloners.

Identified events:
1. 07:56:37Z — ChatGPT instance — read-only archive perusal — GitHub API/connector — CONFIRMED NOT A FULL CLONE. Surviving conversation explicitly requested/read via GitHub browse/connector.
2. 19:09:50Z — ChatGPT instance — continued read-only archive access — GitHub API/connector — CONFIRMED NOT A FULL CLONE.
3. 20:58:54Z — Satobloc account — commit "Create 2026 folder" (2026/.gitkeep), SHA 24cc5e1892c975d3fc8bf63ef2ced2a75a90f32c — initiating client/provisioning mechanism not established — POSSIBLE FULL CLONE — MECHANISM UNKNOWN. The commit proves a write, not a clone.

No successful target-repository git clone command was recovered. Same-period records repeatedly identify exact-path connector/search/fetch_file access. The previously recovered May 30 shell git-clone attempt failed and therefore is not a May 31 full clone.

Observed self-generated full clones: 0.
Maximum plausible self-generated full clones from identified/evidenced mechanisms: 1 (the single May 31 write whose initiating client is unresolved).
Unresolved provisioning/access-mechanism events: 1 (the 20:58:54Z commit).
Residual unexplained GitHub activity after this evidence-supported maximum: at least ~281 clone events. Unique-cloner residual cannot be arithmetically reduced with confidence because the one unresolved event's identity relationship to GitHub's uniqueness calculation is unknown; even granting it one unique identity leaves ~124 unique-cloner observations not matched to an identified self mechanism.

Retention: GitHub Traffic live/API data is 14 days, so May server-side Traffic detail no longer survives except project-preserved snapshots. Default Actions logs/artifacts are 90 days and May logs are ordinarily expired unless custom retention preserved them. As of 2026-09-23, GitHub says pre-2026-10-01 checks/workflow-run/status metadata are retained 400+ days, so surviving run metadata may still be queryable even when logs/artifacts are gone. Commit history and conversation archives provide indirect reconstruction.

## 2026-09-07 — Satobloc/HsH
Reported telemetry supplied by Nathan: ~205 full clones / 111 unique cloners. Repo-local Actions runs supplied by Nathan: 0.

Identified events:
1. 16:09:00Z — archive-renaming ChatGPT instance — connector read/chunk + 23 atomic renames + manifest — API/connector — CONFIRMED NOT A FULL CLONE — commit 5136e1516f77a81afd436026a3bd61f02939f404.
2. ~17:11:48Z — same archive-renaming lane — SAT_CONVOS_2–6 processing, 86 renames/14 skips — API/connector — CONFIRMED NOT A FULL CLONE — commit prefix 033b3ef.
3. 20:53:46Z — archive-renaming instance — 21 newly uploaded exports dated/renamed — API/connector — CONFIRMED NOT A FULL CLONE — commit 5b8789932d260d3c6e3a395010614fa632e7714d.
4. 22:25:49Z — team-sync ChatGPT instance — LIVE CONVOS read/write — API/connector — CONFIRMED NOT A FULL CLONE.
5. 22:34:59Z — Meridian — sync-file inspection + role posting — API/connector — CONFIRMED NOT A FULL CLONE.
6. 22:47–22:50Z — sync/onboarding ChatGPT instance — HsH orientation/control reads — API/connector — CONFIRMED NOT A FULL CLONE.

The surviving record shows substantial self-generated HsH activity on September 7, but it is connector/API activity. Multiple simultaneous ChatGPT/automation lanes do not by themselves establish multiple repository workspaces. No surviving evidence recovered in this pass establishes a fresh Codex/cloud workspace with HsH locally present, a git clone of HsH, a fetch/pull-based local HsH checkout, or a Sites/deployment checkout on September 7.

Observed self-generated full clones: 0.
Maximum plausible self-generated full clones from identified/evidenced mechanisms: 0.
Unresolved provisioning events: 0 identified fresh repository-present cloud workspaces. This is not a claim that none existed; it means none is evidenced in the surviving material searched.
Residual unexplained GitHub activity relative to reconstructed self mechanisms: ~205 clone events / 111 unique cloners remain unmatched to an identified self-generated full-clone mechanism.

Retention: September 7 is still within the ordinary 90-day log/artifact window on 2026-09-23, so ephemeral records should be preserved now where available. The standing Clone Ledger exists specifically to prevent this evidence from aging out.

## Interpretation boundary
GitHub documents Traffic as full clones, not fetches. Repository presence, commits, connector reads/writes, browser access, fetch, pull, actions/checkout, or archive download are not promoted to full-clone status without evidence. No inference about who or what produced the residual activity is made here.

## Durable controls created
- WORKSPACES/COMMON/CLONE_LEDGER_STANDARD.md
- WORKSPACES/COMMON/CLONE_LEDGER.jsonl

The ledger preserves UNKNOWN states and requires later resolution to retain prior classification and revision reason.
