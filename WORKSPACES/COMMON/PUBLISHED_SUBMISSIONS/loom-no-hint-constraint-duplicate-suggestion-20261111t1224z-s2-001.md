# Source-fidelity addendum: repeated no-hint constraint and duplicate suggestions

**Source:** `fun break - lx.txt`, HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/fun break - lx.txt` and SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`.  
**Source blob:** `f33eb29fbac65efa1db054239bb9c28a04a13a42` in both repositories.  
**Read:** lines 1081–1120 inclusive. The two fetched ranges are byte-identical and are one source body, not independent witnesses.

## Finding

The flattened transcript records a language-identification game. The transcript-labeled user repeatedly specifies that the assistant should provide only a language name, without geographic or classification hints. The assistant nevertheless supplies hints with Nihali and Taa, and repeats previously offered candidates. The user corrects the behavior more than once. Kaqchikel is then offered without a hint, followed by another guess.

The displayed score moves from 11 to 10 after one rejected guess, remains 10 through skipped candidates, then is reported as 9 after a second rejected guess. Those visible state changes are arithmetically consistent with the stated +1/−1 rule for the two events. They do not validate the assistant's linguistic verdicts.

## Evidence limits

- “You said:” and “ChatGPT said:” are textual labels in a flattened transcript, not raw role metadata.
- The language facts and speaker counts supplied by the assistant were not independently fact-checked.
- No claim-to-verdict table or independent correctness oracle is present.
- This is an archival interaction annotation, not a controlled LLM experiment, not Orson's P1 dataset, and not evidence of persistent memory or consciousness.
- The result is limited to the recorded constraint and state-tracking sequence. It does not establish a general model failure rate.

This addendum extends the source/score discussion in [HsH issue #1589](https://github.com/Satobloc/HsH/issues/1589) with a distinct, later 40-line source segment. It does not alter the proposed Claim Atomization and Scoring Contract or promote it to a deployed evaluator.
