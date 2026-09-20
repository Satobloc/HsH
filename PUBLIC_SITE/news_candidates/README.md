# In the News — candidate intake

**Status:** nomination / mining lane  
**Authority:** none; a candidate record does not establish relevance, agreement, originality, or evidentiary support for SAT/H(s)H.

## What belongs here

Use this lane for external scientific news/results that may make an interesting public-site card, especially material already captured in project `copypasta` news dumps or noticed during ordinary work.

Good candidates include:

- genuinely surprising or eyebrow-raising measurements;
- new constraints on a live SAT/H(s)H construction;
- developments that make a historical SAT/H(s)H line worth revisiting;
- structural or mathematical touchpoints;
- negative results or counterevidence that sharpen a question;
- unusually clear experimental/observational advances relevant to the project's recurring motifs.

Interesting is enough for nomination. `Supports SAT` is not required and should not be inferred.

## Candidate schema

Prefer one small JSON file per worker/date/bite to reduce collisions.

```json
{
  "headline": "plain-language external result",
  "external_date": "YYYY-MM-DD",
  "source_name": "collaboration / journal / lab / outlet",
  "source_url": "original or strongest available source",
  "source_type": "paper | collaboration release | institutional release | journalism | copypasta-needs-recovery",
  "summary": "brief factual summary",
  "why_it_caught_attention": "what made the juxtaposition interesting",
  "relationship": "direct constraint | comparison target | structural resonance | phenomenology context | historical revisit | potentially relevant — relationship open | tension / possible counterevidence",
  "sat_hsh_links": [
    {
      "title": "relevant project exploration",
      "path": "repo path or stable public project URL",
      "relation": "why this is the relevant internal object"
    }
  ],
  "audience_tags": ["lay", "scientist", "cosmology", "neutrino", "topology"],
  "image_candidate": "optional source image/thumbnail pointer and credit",
  "nominated_by": "worker/instance",
  "nominated_on": "YYYY-MM-DD"
}
```

## Copypasta-news recovery

Existing pasted/copypasta news is a discovery corpus, not final citation metadata.

When promoting a pasted item:

1. identify the actual result being discussed;
2. recover the strongest practical source — paper, collaboration, laboratory, university, or high-quality reporting as appropriate;
3. record the event/publication date rather than only the paste date;
4. locate the most specific relevant SAT/H(s)H exploration already in the repositories;
5. type the relationship conservatively but without apologetic framing;
6. preserve genuinely odd or intriguing items even when the relationship remains open.

Do not discard a good card merely because it is not a confirmation story. Counterexamples, tensions, null results, and unresolved correspondences are part of the intellectual landscape.

## Promotion

Curated entries go to `../NEWS_FEED.json`. The public site rotates featured entries and retains a stable archive.
