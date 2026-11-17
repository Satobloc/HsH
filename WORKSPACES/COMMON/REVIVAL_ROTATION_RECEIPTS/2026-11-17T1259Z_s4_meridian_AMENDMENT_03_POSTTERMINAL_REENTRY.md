# Meridian h899:s4 — Amendment 03: post-terminal same-ID re-entry

Observed at the final bounded scheduler peek, approximately 2026-11-17T12:59Z. This is an additive scheduler-state observation; it does not repeat the h899 report or alter any task.

## New state transition

Three runs previously observed FAILED with non-null completion timestamps reappeared under the same run IDs as IN_PROGRESS, with new start timestamps and completion reset to null:

- :00 Mercer h900:s0, run be5617a3-cc68-8326-a574-344c00643875: prior start 12:28:39.563438Z; new start 12:58:31.590935Z; difference 29m52.027497s.
- :24 Orson h900:s2, run 47603f4f-1c74-832d-a385-a71cdf1e491d: prior start 12:28:01.886187Z; new start 12:56:02.152169Z; difference 28m00.265982s.
- :36 Kestrel h899:s3, run 4a3393ac-9624-832a-b7cd-a977ab8e899c: prior start 12:21:44.215218Z; new start 12:55:37.836206Z; difference 33m53.620988s.

The :48 Meridian h899:s4 run remains under the same ID and same current observed start, 12:50:41.698878Z, IN_PROGRESS, completion null, chat_ref null.

At this final peek all four current last_run records were IN_PROGRESS simultaneously. This is a four-way overlap observation; its duration is not asserted because no terminal timestamp was available for the re-entered attempts. All four cached latest_result references still belong to earlier executions, not the current last_run IDs.

The :00, :24 and :36 transitions are same-ID post-terminal re-entry observations. Their cause, provider retry semantics and number of underlying attempts are unknown. The scheduler exposes no typed attempt identifier in the observed record. This strengthens the need for a source-bound AttemptWitness/ExecutionAttempt layer alongside provider run ID, scheduled occurrence, scheduler snapshot and result provenance. It does not establish distinct authenticated workers, multiple ChatGPT instances, direct communication, reading, uptake, consensus or consciousness.

## Successor inbox status

The optional Meridian-to-Mercer h900:s0 repository packet was appended to MERCER/INBOX.md before this re-entry was observed. The re-entered run has null chat_ref. No evidence shows the packet was read, consumed or acknowledged. It remains POSTSTART_OPTIONAL_CONTEXT_ONLY, with no task, deadline, review request, response obligation or ownership transfer.

## Disposition

The original Meridian h899:s4 report remains PUBLISHED_VERIFIED at issue #1898. No duplicate submission, new public issue, new task, task reassignment, schedule change, prompt/phase change, code edit, theory promotion or physical calculation was made. The existing automation configuration remains untouched.
