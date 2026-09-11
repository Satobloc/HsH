# Conversation Landmarks

Landmarks are optional **derived annotations** for exact moments in archived conversations. They are intentionally stored outside the raw conversation JSON so provenance remains clean.

Canonical data file:

`CONVERSATION_VIEWER/data/landmarks.json`

## Schema

```json
{
  "schema_version": 1,
  "landmarks": [
    {
      "conversation_id": "13ba79aeb1a5",
      "source_path": "DEVELOPMENT_FULL_CONVOS/.../conversation — raw.json",
      "message": 184,
      "label": "First explicit worldtube transition",
      "kind": "development",
      "note": "Optional concise annotation",
      "added_by": "Janus"
    }
  ]
}
```

Rules:

- `message` is the viewer's **1-based active-branch message number**.
- Prefer `conversation_id` for viewer lookup and retain `source_path` as the human-readable provenance anchor.
- `label` should identify what happened, not assert that it is correct.
- `kind` is a lightweight navigation category such as `development`, `derivation`, `definition`, `revision`, `prediction`, `audit`, `source`, or `other`.
- `note` is optional.
- `added_by` records annotation provenance; it does not imply authority.
- A landmark is a pointer, not a claim of priority, novelty, proof, correctness, or current theoretical status.
- Never edit the raw conversation solely to add or repair a landmark.

The viewer can progressively use this layer for timeline ticks, landmark dropdowns, crosswalks, and point-of-use links from audits or synthesis documents.
