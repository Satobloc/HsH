# Tagging ledger — Meridian role and Whirligig design directives

**Run:** `REVROT3-19-20261011:576:s4`  
**Date reviewed:** 2026-11-04  
**Lane:** Review-MIND / source provenance  
**Operation:** bounded manual tag-on-read; additive metadata only  
**Authority:** authorship/provenance and retrieval metadata only; no theory promotion.

## Method and source custody

Only the two message bodies listed below were manually read in this pass. Their raw JSON nodes both have `message.author.role = "user"`, and both were verified on the respective export's current parent ancestry. This is not a claim that either full conversation was read.

1. **Meridian [HsH] Michelstein-on-Meinorly**
   - Conversation ID: `6a9aa91b-11f4-83ea-80a1-4d502522e441`
   - Raw source: `LIVE CONVOS/26.09.04•26.09.08•🌐Meridian [HsH] Michelstein-on-Meinorly — raw.json`
   - Git blob SHA-1: `d21e251df093013903cc19789ded562f83b6e6ea`
   - Snapshot: 343 mapping nodes; 56 user-role nodes; 333 nodes on current ancestry; 52 user-role nodes on current ancestry.
   - Selected message: `3e540785-e8df-421c-aded-63bd85add0f8`, 2026-09-07T22:33:30.414Z, `role=user`, current ancestry = true.

2. **Meridian Free Build**
   - Conversation ID: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`
   - Raw source: `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`
   - Git blob SHA-1: `7af1561b321f4d9364da5eb111df689efc652827`
   - Snapshot: 2,500 mapping nodes; 80 user-role nodes.
   - Selected message: `97d301cb-5174-4861-a273-ac4cc0b60d8b`, 2026-10-09T10:38:10.722Z, `role=user`, current ancestry = true.

## Newly added manual tags

| Message ID | Source-grounded description | Manual tags |
|---|---|---|
| `3e540785-e8df-421c-aded-63bd85add0f8` | Role-clarification request: asks the thread to state its chosen name, primary responsibility, operating affordances, and a team-facing contribution; also discusses coordination and possible automation capacity as questions at that historical date. | `NATHAN-DIRECT`; `MSG:ROLE-SCOPE`; `MSG:OPERATING-AFFORDANCES`; `MSG:TEAM-COORDINATION`; `MSG:AUTOMATION-QUESTION`; `MSG:STYLE-PREFERENCE`; `DISCOURSE:CLARIFICATION`; `WINNOW:B-MESSAGE` |
| `97d301cb-5174-4861-a273-ac4cc0b60d8b` | Whirligig design directive: preserve multiple admissible answers, scan the solution landscape, and prefer/rank routes under an explicit “least-wild” criterion rather than collapsing immediately to one answer. | `NATHAN-DIRECT`; `MSG:WHIRLIGIG-DONUT`; `MSG:METHODOLOGY`; `MSG:IDEATION`; `MSG:NONUNIQUENESS-DESIGN`; `MSG:LEAST-WILD-ROUTE`; `DISCOURSE:CORRECTIVE`; `DISCOURSE:INSISTENCE`; `WINNOW:B-MESSAGE` |

## Duplicate-avoidance and epistemic boundary

The following directly read messages were **not retagged** because existing manual ledgers already cover them:

- `054d1aea-cf67-4154-93c8-e302dc3ce1ea`, `39299849-e2a4-4b63-88a0-5612c700cc1a`, and `f6a2377c-8873-41ee-9107-41aeeb0d2589`: `WORKSPACES/COMMON/tagging_ledgers/2026-11-03-LOOM-GENDARME-EXPORT-ANCESTRY-01.md`.
- `28b2378a-846d-4c3f-a242-91f9007ce261` and `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`: existing Meridian Free Build coverage in `WORKSPACES/COMMON/tagging_ledgers/2026-10-30-LOOM-WORLDTUBE-COMPOSITE-HIERARCHY-01.md`.

The “multiple valid answers” wording is tagged as a **direct solver-design requirement**, not as a proved universal theorem about every equation. “Least-wild route” is a source-defined ranking preference; its metric, admissibility relation, and tie-breaking rules remain unspecified here. No assistant-authored equation or interpretation is promoted into Nathan's voice. No entry is added to `NATHAN_VERIFIED_WORDS_COMPENDIUM.md`.

No redaction, suppression, or downgrade directive was present in the two messages reviewed. Prior tags and status history remain untouched.
