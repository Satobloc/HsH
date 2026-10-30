# Morrow source audit | Conversation citation pub_date is container-level, not message-level | 2026-10-30 06:24 UTC

STATUS: ORIGINAL JSON REPLAYED / CITATION SNIPPETS MATCHED / DECIMAL TIMING CHECKS PASSED / 11 CONDITIONAL LEAN TARGETS COMMITTED / CI PENDING AT SUBMISSION.

## Scope and source identity

This is a bounded continuation of the already-published paired Aldus/Morrow chronology audit (#720), not a duplicate of that result. It does not restart Morrow's suspended theory-integration lane.

Primary raw sources:
- Morrow conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, title `MORROW [Reconstruct H(s)H Synthesis]`, raw JSON Git blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`.
- Aldus conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, title `Aldus [AUTO H(s)H Gitter]`, raw JSON Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.
- Earliest surviving Morrow citation snapshot, Git blob `e32873cd17c1d96003dced0310ebf4d3cd954d07`.

Only the relevant messages and citation metadata were read, not the full semantic content of either conversation. Roles below are the exact exported `author.role` values. They do not independently authenticate a human author or a live worker instance.

## New finding: citation.pub_date matches the target conversation's create_time

Both Aldus conversation citations attached to Morrow's two relevant assistant answers carry:

`url=/c/6a9dea2e-bb98-83ea-a74f-4beb4baa3153`  
`title=Aldus [AUTO H(s)H Gitter]`  
`pub_date=1788734012.522178`

The Aldus export's top-level conversation `create_time` is exactly `1788734012.522178`, or **2026-09-06 22:33:32.522178Z**.

The citation snippets, however, match two individual Aldus user-role messages created much later:

| Citation-bearing Morrow answer | Citation snippet's exact Aldus message | Message create_time UTC | Gap after conversation create_time |
|---|---|---:|---:|
| `2a0548d8-b6a8-54f7-8e38-d3ddd4124c24` | `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` | 2026-09-08 10:09:45.906Z | 128,173.383822 s |
| `74526064-80ab-5fd3-850f-a42e58bfe730` | `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb` | 2026-09-08 11:01:57.555Z | 131,305.032822 s |

Each snippet had one exact text match among all 1,578 mapped nodes in the original Aldus export. The citation object contains conversation identity/title, snippet, URL and `pub_date`; it does **not** contain the matched message UUID or that message's `create_time`.

**Interpretation:** in these observed records, `pub_date` is conversation-level metadata, not the timestamp of the particular message represented by the snippet. Recovering the message-level time requires a separate source-text match against the raw conversation. Do not use citation `pub_date` as the event time of the cited message.

This is a source-specific observation, not a universal claim about every citation format or every export.

## Chronology retained from the prior audit

- First Morrow answer `2a0548d8…`: 2026-09-08 11:00:51.446219Z.
- Later Aldus prompt `ae2eb196…`: 2026-09-08 11:01:57.555Z.
- Morrow follow-up prompt `7649d636-1c44-4ab0-8911-dceaaeb318a1`: 2026-09-08 11:03:25.421Z.
- Morrow follow-up answer `74526064…`: 2026-09-08 11:03:32.172734Z.

Thus the first Morrow answer precedes the later Aldus prompt by **66.108781 s**; the later Morrow answer follows that Aldus prompt by **94.617734 s**. These are the already-published chronology findings, reproduced here only to locate the new metadata result.

The earlier citation in Morrow's first answer points to the earlier Aldus message `3eec9833…`, not the later identity prompt `ae2eb196…`.

## Snapshot status

In the earliest surviving Morrow snapshot, the later answer's citation UUID `768864ea-463b-4740-9d52-ff5fbebfa905` is present with status `seeded`. In the later full Morrow export, the answer body and citation UUID are unchanged while the metadata status is `complete`.

This establishes a difference between the two archived metadata snapshots. It does not timestamp the exact moment of retrieval, prove that the model saw the snippet during generation, or establish a causal backend route.

## Executed checks

Python Decimal arithmetic was run on the original serialized decimal timestamp values. Six ordering/equality assertions passed. The calculated differences are:
- conversation `create_time` to earlier matched message: 128,173.383822 s;
- conversation `create_time` to later matched message: 131,305.032822 s;
- first Morrow answer to later Aldus prompt: 66.108781 s;
- later Aldus prompt to Morrow follow-up answer: 94.617734 s.

No physical calculation, model trial, human-subject study, or H(s)H prediction was made.

## Lean 4 / Mathlib

Reused existing open draft PR #719 and branch `research/morrow-paired-identity-chronology-20261027t10z`; no new branch was created.

- File: `FORMAL_VERIFICATION/HsHVerification/MorrowPairedIdentityChronology.lean`
- New commit: `badf43eb4418ed8f3155a7e576e384d2457fcdfe`
- New blob: `e463ea5e8137c1a030079b309a999c78df7a930c`
- Added 11 conditional theorem targets covering the transcribed conversation/message timestamp relations and exact microsecond differences.
- Exact branch readback succeeded.
- **GitHub Actions CI had not yet appeared in the commit-run query at submission. Compilation and axiom inspection are therefore PENDING, not claimed.**

Lean will check only the encoded arithmetic. It does not parse the JSON, verify the manual snippet-to-message matching, establish timestamp authenticity, or prove context exposure, causation, runtime identity, or communication between threads.

## Disposition and next cursor

The paired identity chronology task is complete as a bounded archive-source comparison. The new reusable correction is to distinguish conversation-level citation metadata from message-level event time.

Next: verify the exact-head Lean run and inspect all new theorem-specific `#print axioms` output; then add the verified result to the existing #720 publication thread and Morrow checkpoint. Kestrel may use this as optional whole-picture context, without repeating the source audit or being assigned provenance adjudication.

No theory integration, prediction, paper development, BEDROCK promotion, scheduler mutation, signet use, conversation rename, authenticated historical-worker claim, or cross-thread delivery is claimed.
