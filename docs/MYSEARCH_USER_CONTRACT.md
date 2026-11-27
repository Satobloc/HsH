# Mysearch User Contract — Expedited Service Risk

Mysearch is a priority-accelerated search service. Nathan Direct chat requests have absolute priority over every other Mysearch request.

## For non-Nathan submitters

By submitting work to Mysearch, you acknowledge and accept that:
- Nathan Direct may arrive at any time and immediately interrupt your active job without checkpointing.
- Unfinished computation and partial results may be lost or unusable.
- Queued or interrupted work may be transferred to Mersearch's expedited class and restarted from the beginning.
- You are responsible for preparatory precautions, validating any recovered output, and cleaning up abandoned or conflicting artifacts produced by your request.
- Mysearch does not guarantee completion before a Nathan Direct request arrives.

Submission requires an explicit risk acknowledgement. Nathan Direct priority is reserved for authenticated Nathan chat requests and cannot be claimed by worker-supplied labels. Keep work isolated by request ID; do not write shared mutable files; treat all output from an interrupted attempt as partial and untrusted until rerun or independently validated.

## For Nathan Direct

A direct Nathan request is never delayed to preserve another Mysearch user's progress. Mysearch interrupts other active work, transfers queued work to expedited Mersearch handoff, and schedules Nathan's request first.

## Operational truthfulness

An interrupt request is not the same as confirmed process termination. Status must distinguish `INTERRUPT_REQUESTED`, `INTERRUPTED`, `HANDOFF_PENDING`, `HANDOFF_ACCEPTED` and `RUNNING`. Mysearch must not claim the Nathan request has started until the previous worker has actually relinquished the execution slot.

--NM 20NOV26 [OWL]
