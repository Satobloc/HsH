# Mysearch activation and implementation record

This file documents the first repository-backed implementation scaffold. It does not claim operational availability.

- Current architecture and requirements: [Mysearch implementation plan](MYSEARCH_IMPLEMENTATION_PLAN.md).
- Current executable ingress: [dedicated workflow](../../.github/workflows/mysearch-nathan-direct.yml).
- Engine: pinned stable Mersearch 1.0, not 1.1-dev.
- Scope: three existing archives; existing exclusions and compact-receipt privacy gate retained.
- Priority behavior: isolated single-flight lane. Initial workflow deliberately sets `cancel-in-progress: false`; disruptive preemption is not activated until a durable checkpoint/recovery implementation passes tests. The policy and acceptance criteria are specified separately.
- Clone observability: workflow captures checkout heads and writes a run manifest that distinguishes checkout evidence from Traffic and unique-cloner observations. Traffic and unique-cloner values remain UNKNOWN unless separately retrieved from the authorized Traffic source. A later step is required to append the evidence to the existing CLONE_LEDGER; this scaffold does not claim that append has occurred.
- Current request-lane-2 search remains untouched and in progress as of the observed run readback.

**Disposition:** SCAFFOLD ONLY / NOT VALIDATED / NOT YET A PRODUCTION SEARCH SERVICE.
