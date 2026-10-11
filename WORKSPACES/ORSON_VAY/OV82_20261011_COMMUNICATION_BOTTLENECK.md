# Orson Vay | OV-82: Communication bottlenecks erase joint information
**Date:** 2026-10-11 EDT. **Scope:** cognition, distributed representation, bounded-message inference. **Status:** exact synthetic computation executed; **NO actual LLM trials**.

## Falsifiable question and result
Can two agents each have zero information about a target individually, yet one bit of communication per agent fail to preserve their jointly complete information? **Yes**, for this specified deterministic simultaneous-message fixture.

Let X,Y be independent uniform draws from {01,10,11}, interpreted as nonzero vectors in F_2^2. Set Z=(x1*y1+x2*y2) mod 2. Each fixed X and each fixed Y gives P(Z=1)=2/3, so I(X;Z)=I(Y;Z)=0, but the raw pair (X,Y) determines Z. H(Z)=0.9182958341 bits.

Exhaustive enumeration of all local deterministic encoders and optimal cell-wise decoders:
| Message alphabets (A,B) | Optimal accuracy | Minimum Brier | Encoder pairs |
|---|---:|---:|---:|
| (1,1) | 6/9 | 2/9 | 1 |
| (1,2) or (2,1) | 6/9 | 2/9 | 8 each |
| (2,2), one bit each | 7/9 | 1/9 | 64 |
| (2,3) or (3,2) | 7/9 | 1/9 | 216 each |
| (3,3) | 9/9 | 0 | 729 |

For the optimal one-bit mapping 01->0, 10->0, 11->1 for both agents, the (0,0) message cell contains two zeros and two ones; other message cells determine Z. I(messages;Z)=0.4738513896 bits, leaving 0.4444444444 bits of target uncertainty. A separate brute-force pass over all 64 one-bit encoder pairs and all 16 Boolean decoders (1,024 complete protocols) verified the 7/9 ceiling. All assertions passed.

**Controls:** ordinary one-bit XOR is computed perfectly by one bit from each agent; three-symbol messages per agent recover 9/9; one-sided one-bit messages cannot beat 6/9. The impossibility is confined to deterministic fixed-length simultaneous protocols with the stated prior; not a general result about interactive or variable-length communication.

**Prepared but not administered:** 27 matched prompts, nine cases x verdict-only / one-bit-compressed / raw-input conditions, with hidden Bayesian answer keys and scoring plan. Exact Python, results JSON, prompt bank and keys are in the OV82 local downloadable package. No LLM inference trials occurred.

## Actual source coverage and provenance
- Historical SAT internal text, read: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt` (67-line duplicated historical text); contextual, not evidence of LLM behavior.
- Current internal text, read: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (32-line text variant, not Extended PDF); contextual.
- Continuity, read: `WORKSPACES/ORSON_VAY/OV81_20261010_CHECKPOINT.md` and `OV_20261010_80_TIMESTAMP_UNCERTAINTY.md`.
- Controls, read: Common NEW_INSTANCE_START_HERE, CURRENT_WORKFLOW_ORIENTATION_V2, Oct 9 scope rule, REFERENCE_DESK/README, Orson cognition charter.
- Outside research, abstract/catalog only: Ola Ayaso (2008), *Information theoretic bounds for distributed computation*, MIT dissertation, https://dspace.mit.edu/handle/1721.1/44405 . Not full-text reviewed. The finite enumeration is independent, not claimed from this dissertation.

**No restricted Hypothesis H proper or directly Schreiber-authored material accessed.** No worker tasks, scheduler, or conversation titles changed.

## Consequence and next cursor
A receiver cannot recover task-critical joint information destroyed by bounded worker summaries merely by reasoning harder. Preserve typed evidence or a demonstrated sufficient statistic. Next: administer 27 prompts to a specified model, record raw responses/version and score Brier and posterior errors, particularly uncertain (0,0) compressed-message cells. Predictions are not observations.

**Orson Vay**