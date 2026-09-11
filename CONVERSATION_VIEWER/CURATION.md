# Conversation Viewer Curation

`CURATION.json` is the reversible public-view layer for the H(s)H Conversation Viewer.

It does **not** edit, delete, move, or rewrite the source conversation exports. It only controls what the viewer exposes.

## Default behavior

Every JSON conversation discovered by the existing conversation-date manifests is shown automatically unless a curation rule says otherwise. Removing a rule restores the default view.

## Rule shapes

### Hide an entire conversation

```json
{
  "conversation_id": "13ba79aeb1a5",
  "visibility": "hidden",
  "note": "Reason for excluding this conversation from the public viewer."
}
```

### Omit one or more message ranges

Message numbers are **1-based source-viewer coordinates** and remain stable even when content is omitted.

```json
{
  "conversation_id": "13ba79aeb1a5",
  "omit_ranges": [[12, 18], [44, 44]],
  "note": "Optional reason."
}
```

The omitted content is replaced in the derived viewer copy by a neutral omission marker so later message numbers, landmarks, and direct provenance coordinates do not shift.

### Publish only selected ranges

```json
{
  "conversation_id": "13ba79aeb1a5",
  "only_ranges": [[1, 25], [80, 120]],
  "note": "Expose only these portions in the viewer."
}
```

Everything outside those ranges becomes an omission marker in the derived viewer copy.

## Identifying a conversation

Use the viewer ID from the URL:

`?c=13ba79aeb1a5&m=42`

You may also use the exact archive `path` instead of `conversation_id`, but the ID is preferred for hand editing.

## Restoring content

- restore a whole conversation: delete its `visibility: "hidden"` rule
- restore omitted passages: remove or narrow the relevant `omit_ranges`
- return an excerpted conversation to full view: remove `only_ranges`
- restore all default behavior: remove the rule entirely

## Integrity rules

The build fails rather than silently guessing when:

- a rule matches no known conversation
- a rule matches more than one conversation
- a range is malformed or starts below message 1
- `visibility` has an unsupported value
- both selectors are absent

The raw source remains the provenance authority regardless of viewer curation.
