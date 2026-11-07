# Aster h657:s4 receipt amendment 07 | exact source identifiers and duplicate-lineage correction

**Base:** `2026-11-07T0948Z_s4_aster.md`  
**Amends:** receipt amendments 05-06.  
**Purpose:** correct exact timestamps/IDs in amendment 06 and complete source hashes. No change to its source-attribution conclusion or scheduler state.

## 1. Meridian raw-export identifier correction

Raw export: `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`  
Blob SHA-1: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`  
Conversation ID: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`  
Mapping nodes: 3,678; user-role messages: 112.

The three near-duplicate user-role nodes in the October 20 dimensional-normalization cluster are:

- `b12a50de-4c2b-4660-b949-e539208f4b78` at 2026-10-20T23:12:13.711Z.
- `3db23001-1946-4ca7-95fb-b1587bec4953` at 2026-10-20T23:12:22.645Z.
- `bc09cf32-9952-462a-a02b-2c67a3cf4c91` at 2026-10-20T23:12:49.986Z.

The explicit phrase “or rather the dimensionally appropriate version of that” occurs in the third node, `bc09...`. Amendment 06 incorrectly assigned `b12a...` the 23:12:49 timestamp and `bc09...` a 23:17:16 timestamp. There is no 23:17:16 timestamp for these cited nodes. These near-duplicate nodes are one conversational source cluster, not three independent confirmations.

The 2026-10-21 direct-source times in amendment 06 remain unchanged: `92856...` 14:00:32Z; `0514...` 14:03:21Z; `f853...` 14:05:51Z; `c8ce...` 14:06:39Z. Assistant response `ca16...` at 14:05:58Z introduces `v_H(L)=H0L`; assistant response `caae...` at 14:06:48Z introduces the ensemble reconstruction.

## 2. Exact duplicate-source hashes

- HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/WORKING_GROUP_1.txt`: `dcadbd209733356a6b76c78d99df967e43842814`.
- SAT archive `WORKING_GROUP_1.txt`: same blob SHA-1 `dcadbd209733356a6b76c78d99df967e43842814`.
- Both copies are 29,984 characters / 384 lines. They are one duplicated source artifact, not independent corroboration.
- The 4:38 AM post at line 252 is account-labeled Nathan but signed Janus and marked “Sent using @ChatGPT.” It remains assistant-authored Janus text, not Nathan Direct. Calendar date is not preserved in the excerpt.
- SAT archive `DIMENSIONAL_NORMALIZATION.tex`: `52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1`, 29,224 characters / 1,455 lines; byline Nathan McKnight & Janus C. Sol; date September 9, 2026. It documents `w=ct`; no H0/Hubble or H0L formula was found in the file. It is a coauthored document, not an independent measurement.

## 3. Current control references

- `BEDROCK.md` blob: `527924246cc25caf7fac02dce4b20f024013cd19`; ND-2026-10-21-03 is lines 575-577 and retains the composite “Nathan Direct” attribution pending review.
- `AsterClockMapGate.lean` at PR #1444 head: blob `a0095443c58cea96a373aba49c311805bae8c95d`; its `vH` placeholder remains abstract.
- Existing public issue #1445 artifact: blob `886a69512bbd5a9c239cf99a52e704f21a8e9c51`; exact artifact content equals the issue envelope's content; publisher-declared SHA-256 `56b8a5191ac9d431fbd44acfe6056daacfec067e09de211fdea87af950b5f01d`.
- Existing Cruller/Rubin Addendum 04 remains `sandbox_review_pending`; it is the existing statistical-midpoint/S³ comparison, not a direct source distribution or measured prediction.

## 4. Disposition

This correction changes no theory, proof, physical calculation, paper, PR, BEDROCK text, task, schedule or public publication. It does not create a new issue because the existing source-fidelity report and Addendum 04 already cover the public-facing work. No source is promoted to Nathan Direct beyond its actual raw role/author evidence.
