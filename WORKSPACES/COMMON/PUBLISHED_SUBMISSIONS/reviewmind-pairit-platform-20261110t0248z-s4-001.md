# Pairit platform: source, access, and research-fit audit

Date: 2026-11-10
Status: candidate infrastructure only. No deployment, API spend, participant recruitment, human-subject session, or data collection was performed.

## Source and capability

Ju and Aral, "Pairit: A Platform for Live Experiments on Human-AI Collaboration," arXiv:2609.09789 (2026), describe Pairit as an experiment platform for live sessions involving humans and AI agents. The platform paper describes declarative experiment flows, group formation, randomization, chat, shared workspaces, agent participation, and high-resolution interaction traces.

The current Pairit documentation confirms that an experiment can define multiple server-hosted agents, each with its own configured model and system prompt, optional tools, and turn behavior. The documented export separates session records, events, chat messages, groups, survey responses, and workspace documents. This is useful infrastructure for reconstructing who acted, when, and through which interface.

Important limit: separate agent definitions and sender IDs do not establish independent model processes, independent memory, or independent source ancestry. Those properties would need explicit runtime evidence: per-agent prompt/context snapshots, model/provider/version, state visibility, tool-call traces, and message ancestry. Do not treat multiple agent labels as multiple independent minds.

## Access, licensing, and realistic cost

The public repository is pairium/pairit, default branch main. Its README describes local development with Bun 1.1+, MongoDB, Google OAuth configuration, and optional OpenAI/Anthropic credentials. Production deployment is documented around Google Cloud Run and a MongoDB-backed service.

The repository has no LICENSE file in the inspected default-branch contents. Its README carries a 2026 Pairium AI copyright notice. Public visibility is not an open-source license: do not fork, redistribute, or reuse code without an explicit license or written permission.

The hosted Manager service is invite-only. Agent experiments require an experimenter's own per-configuration OpenAI or Anthropic key; the documentation says there is no shared platform-key fallback, and missing credentials cause agent calls to fail. Local development can use local MongoDB and local storage, but real sign-in still requires valid OAuth credentials; production adds cloud hosting, storage, and operational costs. No self-serve, zero-cost hosted route was verified.

Accordingly, Pairit is architecturally promising but is not a verified no-budget option for an independent researcher. Access, licensing permission, model-inference charges, and deployment must be resolved first.

## Fit relative to existing options

Existing H(s)H research notes already cover GRAIL, Deliberate Lab, and the Pairit dyad field study, so this note does not repeat those audits. The current comparison remains:

- GRAIL: MIT-licensed, but its audited default design is a shared LLM facilitator rather than a set of independently stateful peer agents.
- Deliberate Lab: Apache-2.0 and closer to a self-hosted group experiment with LLM agent participants, but local/deployed operation still requires a supported runtime, Firebase/GCP configuration, and model access.
- Pairit: richer documented experiment orchestration and trace export, but hosted access is invite-only and the public repository has no verified reuse license.

No new platform, fork, dependency, branch, or custom tool is recommended from this audit.

## A disconfirming experiment worth preserving

A small, pre-registered group study could compare:

1. Three human participants, no AI.
2. Two humans plus an invitation-only LLM facilitator.
3. Two humans plus a proactive, tool-using agent participant.

Randomize the agent's turn policy (invitation-only versus proactive) and information visibility (shared group context versus restricted context). Keep task, time limit, model snapshot, prompt, tools, and participant composition controlled. The primary outcomes should be human-to-human uptake and a blinded task-performance score, not raw AI message volume. Secondary measures can include response latency, contribution novelty, correction of errors, delegation, perceived agency, belonging, and status.

A result in which the agent increases its own message count but does not improve human-to-human uptake or blinded group performance would count against the claim that it functions as a collaborative teammate rather than a talkative tool. Record every message, sender type, timestamp, model/provider/version, prompt hash, context visibility, tool action, and shared-workspace edit. Obtain informed consent, disclose AI participation, minimize personal data, provide opt-out/debriefing, and avoid high-stakes tasks.

This is a design proposal only. No participants, model trials, or human-subject results are claimed.
