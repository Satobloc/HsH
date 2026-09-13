# Podcast episode guide / public-exposure index

**Project:** *Debating A.I. On the Future of Physics* / related SAT podcast corpus  
**Status:** planning + source inventory

## Purpose

Build a reader-facing episode guide that also functions as a provenance index for public SAT/H(s)H exposition.

The guide should let a reader answer:

- What was each episode about?
- Where can I listen to it?
- Is there a transcript?
- What SAT/H(s)H concepts were discussed, in the terminology used at that time?
- Is this a candidate earliest public explanation/mention of a concept?
- What later/current terminology does the historical term map to?
- Which archive documents/conversations were contemporary with the episode?
- Which claims are historical, superseded, exploratory, or still current according to the separate internal authority record?

The guide records public exposure; it does not infer influence on later external work.

## Existing source base already located

`HSH_RESOURCES/EXPOSURE_STATS/PODCAST_EPs/` already contains substantial guide inputs, including:

- `DAI_Transcripts_TEXT.txt` — multi-megabyte transcript corpus;
- `DebatingA.I.OnScience_EpisodeRankings_all-time.csv` — episode-level ranking/metadata material;
- `FIRST PUBLIC MENTION SAT DAI -- WHAT IS THOUGHT MADE OF.txt` — an explicit first-public-mention candidate source;
- multiple `FULL_Scalar-Angular Theory_ Field Notes - ...` transcript/field-note files;
- additional compiled field-note/transcript material.

These should be inventoried before seeking replacement data.

## Episode record schema

Each episode gets a stable internal record:

```text
episode_id
series/show
episode_number_if_known
title
published_date
published_date_basis
published_date_confidence
duration
spotify_episode_url
rss_guid_or_url
other_platform_urls
thumbnail_path
thumbnail_sha256
audio_source_if_owned/transcribed
transcript_paths
transcript_status
summary_neutral
historical_terms
standard_terms
current_term_relations
concept_ids
first_public_mention_candidates
first_public_explanation_candidates
public_claims_or_predictions
related_theory_state_ids
related_equation_ids
related_archive_sources
notes
review_status
```

## Public first-appearance discipline

Never collapse these into a single absolute `FIRST` field. Use scoped statuses:

- `EARLIEST-LOCATED-PODCAST-MENTION`
- `EARLIEST-LOCATED-PUBLIC-EXPLANATION`
- `EARLIEST-LOCATED-PUBLIC-EQUATION`
- `EARLIER-PUBLIC-SOURCE-KNOWN`
- `SEARCH-INCOMPLETE`
- `DATE-UNCERTAIN`

A candidate should be checked against all earlier available episode transcripts/titles/show notes and other known public sources before promotion.

## Reader-facing guide layout

### Chronological view

Episode cards ordered by publication date with:

- thumbnail;
- title/date/duration;
- 1–3 sentence neutral synopsis;
- Spotify/listen link;
- transcript link;
- concept tags;
- historical/current terminology note where needed;
- provenance badges such as `candidate earliest public explanation`.

### Concept view

A concept page can show:

- current Nathan-approved definition (from the separate authority layer);
- historical names/translation relations;
- first located internal source;
- first located public podcast mention/explanation;
- subsequent episodes where the concept materially changes;
- links to relevant equations/theory states.

### Theory-state view

Show which episodes correspond to major SAT/SAT-O/4DHH/H(s)H stages without pretending each episode cleanly represents a complete theory state.

## Spotify / web linking

Spotify currently supports HTTPS links in episode descriptions/show notes. Once stable transcript pages exist, episode descriptions can link directly to the corresponding transcript/guide page.

Conversely, the guide can link or embed each Spotify episode. Avoid autoplay/preload so Spotify listening analytics remain meaningful.

Suggested show-note footer after the guide is stable:

`Transcript, historical notes, equations, and source context: <HTTPS episode-guide URL>`

Do not bulk-edit Spotify descriptions until URLs are durable.

## Build phases

1. Inventory all podcast-related source files and thumbnails already present across HSH_RESOURCES, old archive, and HsH.
2. Parse the consolidated transcript corpus into episode boundaries where possible.
3. Join episodes to rankings/metadata, dates, titles, duration, and existing public URLs.
4. Build an `EPISODES.csv/json` canonical metadata table.
5. Hash and match thumbnail files to episodes.
6. Add transcript completeness/status fields.
7. Run terminology bucket against transcripts for retrieval only.
8. Manually/authority-review concept mappings and first-public-appearance candidates.
9. Generate static Markdown/HTML episode pages and chronological/concept indexes.
10. Add Spotify backlinks only after public guide URLs are stable.

## Automation

New transcript, thumbnail, RSS metadata, or episode-stat uploads should trigger only affected episode records to rebuild. Generated guide pages are derived artifacts; transcripts/raw exports remain the source layer.
