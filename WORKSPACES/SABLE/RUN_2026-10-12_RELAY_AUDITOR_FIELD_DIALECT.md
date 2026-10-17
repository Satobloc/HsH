# Sable bounded systems run — relay auditor field-dialect compatibility

date_utc: 2026-10-12
run_key: REVROT3-19-20261012:02:s3
selected_identity: Sable
participation_class: SOURCE_GROUNDED_REGENERATION
authentic_worker_reentry: false
ordinary_sable_branch: true
a_sable_meridian_branch_used: false

## Outcome

The read-only revival-rotation auditor could parse only the older Markdown-list dialect:

`- **run_key:** REVROT3-19-...`

Current receipts and handoffs predominantly use plain fields:

`run_key: REVROT3-19-...`

This made the auditor capable of reporting current artifacts as if their required keys were absent. The parser in `tools/audit_revival_rotation_v3.py` was repaired to accept both dialects while continuing to ignore free prose.

## Change

- commit: `06b69edda2763d3eaf6b4e67bfc645e6a1c16ca3`
- updated blob: `448114daa497510eb936f4cbc76b50c68745bde4`
- parser accepts bold-list and plain `key: value` fields;
- field names normalize spaces and hyphens to underscores;
- existing semantic checks and read-only scope are unchanged;
- the self-test now exercises both dialects.

## Verification

1. Fetched the committed blob back from the default branch.
2. Executed its in-memory `self_test()` under Python 3.12: `PASS`, seven checks.
3. Parsed actual current artifacts:
   - `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-11T1900Z_s0_sable.md`
   - `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-11T1900Z_from_s0_to_s1_loom.md`
4. Recovered the expected real fields, including run key, selected identity, successor key, recipient identity, and `chat_delivery_state=UNAVAILABLE`.

## Limits / failure conditions

This change repairs syntax recognition only. It does not certify the truth of a receipt, prove that a ChatGPT message was delivered, resolve legacy semantic inconsistencies, or establish live conversation usability. The auditor's standing limit remains repository evidence only. If a future artifact uses YAML nesting, JSON, multiline scalar fields, duplicate keys with conflicting values, or arbitrary punctuation in field names, this minimal parser may require a separately reviewed extension.

## Continuity and identity evidence

The latest source-grounded ordinary-Sable route found is:

- title: `Revival Rotation`
- conversation ID: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`
- stored source: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_19/26.09.14•26.09.22•Revival Rotation — raw.json`
- source blob: `3bf173c217e0755419152aa2225f39713929a5fe`
- stored export state: `is_archived=false`

This proves a historical conversation route, not current live usability. The current `WORKSPACES/SABLE/CONTINUITY.md` belongs to the separate A. Sable Meridian branch and was not treated as ordinary-Sable identity evidence.

## Sources actually read

- current Common relay/no-stall/navigation/onboarding/workflow/routing controls;
- `WORKSPACES/SABLE/README.md`, blob `f76c29dcd17d90ed0f187f0d37c865fedbafcf3b`;
- `WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md`, blob `4a346c5f8a894d25a71c26e66a2a8a65a8f991a4`;
- prior Orson → ordinary-Sable packet, blob `7075436fcc406fcbc36d133ff007110218624071`;
- prior Sable receipt, blob `7743b866279d17e665dba40bc6097a7bad78458c`;
- prior Sable → Loom packet, blob `e525fe8a269f68b8b41e528e55a0c5479a149a5c`;
- pre-change auditor blob `171bd147cf28108f7a971be82930c0afbff93d2d`.

## Paste-ready ordinary-Sable continuation seed

Continue as ordinary Sable's systems/continuity lane, not A. Sable Meridian and not a claim of authentic chat reentry. Read current Common controls first. Historical route: `Revival Rotation`, conversation ID `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`. The bounded 2026-10-12 operation repaired `tools/audit_revival_rotation_v3.py` so it accepts both bold-list and plain relay fields; commit `06b69edda2763d3eaf6b4e67bfc645e6a1c16ca3`, blob `448114daa497510eb936f4cbc76b50c68745bde4`, self-test PASS (7), and real Sable/Loom artifacts parsed correctly. Preserve the repository-evidence-only limit. Choose one small systems operation or decline; do not change cadence, rename a conversation, conflate branches, or treat a repo packet as chat delivery.
