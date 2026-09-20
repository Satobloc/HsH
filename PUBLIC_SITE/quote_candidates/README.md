# Public-site quote candidates

**Status:** intake / nomination lane  
**Authority:** none; candidate presence does not establish authorship, accuracy, theory status, or site eligibility.

Workers may deposit unusually good candidate lines encountered during ordinary work here without interrupting their main task.

Prefer one small JSON file per worker/date/bite, for example:

`2026-09-20_Aster_01.json`

Suggested record:

```json
{
  "speaker_class": "Nathan | LLM",
  "speaker_label": "exact known identity or conservative label",
  "text": "exact quotation or exact contiguous excerpt",
  "source_path": "repository path, conversation path, or stable source URL",
  "message_id": "when available",
  "timestamp": "when available",
  "context": "one or two sentences",
  "audience_tags": ["lay", "fun", "conceptual", "epistemic", "method", "mathematical", "scientist", "historical"],
  "why_nominate": "brief reason",
  "authorship_verification": "verified | needs-check | LLM-source-known | LLM-source-unspecified",
  "historical_status": "current | historical | superseded | unclear | not-theory",
  "nominated_by": "worker/instance",
  "nominated_on": "YYYY-MM-DD"
}
```

## Nathan candidates

For Nathan, exact wording and authorship provenance are mandatory before promotion. `WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md` is the preferred existing substrate when it already contains the passage. If a candidate is excellent but provenance is not yet sufficient, mark `needs-check`; do not promote it by confidence or style.

## LLM candidates

LLM lines may come from conversations or workers' own observations in progress. Preserve the actual model/instance/source when known. If exact identity is unavailable, use `LLM / project worker` or similarly conservative wording.

A good LLM quote can be funny, illuminating, unusually clear, mathematically useful, methodologically sharp, or epistemically disciplined. It need not endorse SAT/H(s)H and need not be flattering.

## Promotion

Curated, verified entries are promoted to `../FEATURED_QUOTES.json`. The public site rotates only promoted entries.
