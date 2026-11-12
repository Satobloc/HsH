# Loom source-tag addendum: constraint timing in a language-game transcript

**Source span:** `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt`, lines 1161–1200.  
**Duplicate custody path:** `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, same lines.  
**Git blob:** `f33eb29fbac65efa1db054239bb9c28a04a13a42`.

The two repository paths resolve to the same blob. They are duplicate custody locations for one transcript, not independent corroboration. The excerpt is flattened text with labels such as “You said” and “ChatGPT said”; raw message UUIDs and role metadata for this span are not present. No authorship attribution is inferred from those labels.

## Event sequence

1. The transcript begins with a repetition complaint and an explicit reminder that no information should be supplied before the user's attempt. The assistant acknowledges the complaint, then offers Etruscan with several descriptive facts before any new user attempt appears. This is a **pre-attempt disclosure** inconsistent with the stated game constraint. The previously repeated candidate is not identified in this span, so Etruscan itself is not classified as the repeated item.
2. The user restates the protocol: provide a language name only, wait for an attempt, award one point per correct fact, subtract one per incorrect statement, and avoid previously used names. The stated score of 11 and target of 20 are transcript self-reports, not independently verified records.
3. The assistant offers “Araki” by name only and restates the no-hints rule. This is compliant at the selection stage.
4. The user then makes a tentative association/guess. Only after that attempt does the assistant provide descriptive information about Araki. Under the stated protocol, this is a **post-attempt reveal**, not a pre-attempt hint violation.
5. The user reports a score of 10 and asks for the rules again. No claim is made that the score, guess, or linguistic facts were independently adjudicated.

## Workflow improvement: timing-aware constraint ledger

A binary `hint_given` tag is too coarse. Preserve ordered events and the attempt boundary:

- `RULE_REASSERTED`
- `ASSISTANT_ACKNOWLEDGED`
- `PRE_ATTEMPT_DISCLOSURE`
- `POST_ATTEMPT_REVEAL`
- `REPETITION_REPORTED_IDENTITY_UNRESOLVED`
- `SCORE_SELF_REPORT`
- `FACT_VERDICT_UNAVAILABLE`

Classify a disclosure relative to the latest explicit rule and whether the user has attempted. An assistant acknowledgement is not proof of later compliance; inspect the next response. Conversely, a reveal after an attempt should not be mislabeled as a violation merely because it contains information. A repetition report does not identify the repeated candidate unless the earlier item is recoverable from source context.

This is a source-local transcript annotation and a workflow refinement, not a controlled model experiment, general behavioral rate, or cognitive-capacity result.

## Formalization boundary

The generic score-change identity is already present in Orson PR #850 as `HsHVerification.OrsonRevisionBalance.net_gain_identity`. Its existing Actions run #42795140460 completed successfully with Lean 4.34.0 / Lake 5.0.0 and 8,984 build jobs. The captured theorem-specific axiom output is `[propext, Quot.sound]`; the build is merge-reference evidence, not a standalone exact-head build. It verifies only the encoded conditional arithmetic. It does not authenticate this transcript's score, adjudicate language facts, or establish that any individual claim is correct. No source-specific Lean instance or new build was needed because this span supplies no frozen fact-level verdict table or independent adjudication oracle.

No physical system, measured dataset, physical calculation, fit, prediction, or H(s)H theory claim is involved. The result does not advance any paper gate or alter BEDROCK status.

**Relation to prior coverage:** this is the next distinct 40-line span after Loom Section S (1121–1160) and the already published no-hint/duplicate-suggestion report #1599 (1081–1120). It is an additive continuation, not a resubmission of either artifact.
