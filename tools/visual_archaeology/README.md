# Visual Archaeology / Thematic Semiotics

**Status:** experimental, transparent tagging aid  
**Purpose:** recover, classify and describe SAT/H(s)H/project imagery without pretending uncertain machine guesses are facts.

This continues the image-method work documented in [the 2026-09-12 image-processing/operator thread](../../WORKSPACES/COMMON/PAST_THEORIST_CHECKIN_IMAGE_PROCESSING_OPERATOR_THREAD_2026-09-12.md) and [visual contact-sheet thread](../../WORKSPACES/COMMON/PAST_THEORIST_CHECKIN_VISUAL_CONTACT_SHEET_GPT55_THINKING_2026-09-12.md), but it is a separate instrument. The earlier operator playground was for transformations; this package is for **measurement, motif recognition, archive context and human-calibrated tagging**.

## Current seed material

- [Seed visual catalog — 2026-09-30](SEED_VISUAL_CATALOG_2026-09-30.md) — page-by-page/grouped inspection of Nathan-supplied `VISUAL_INSP` and `SAT_VISUAL_HIST`, standalone-figure page matches, duplicate/variant findings, provenance anchors, and podcast semiotics seeds.
- [Seed calibration records](seed_calibration.jsonl) — machine-readable descriptive examples with source, decision, family and epistemic scope kept explicit.
- [Known visual families](known_families.json) — duplicate, near-duplicate, minimal-pair and family relationships.
- [Controlled tag vocabulary](tag_vocabulary.json) — geometry, composition, palette, role, status and provenance tags.
- [Analyzer](visual_analyzer.py) — deterministic first-pass feature extraction and candidate scoring.

## Funnel

`archive/path priors -> measurable image features -> motif hypotheses -> semiotic/theme hypotheses -> source-text cross-check -> human decision -> calibration record`

Every stage remains inspectable. A candidate tag is never silently promoted to ground truth.

## First-pass measurements

`visual_analyzer.py` currently measures:

- dimensions, aspect ratio and square-thumbnail heuristic;
- grayscale fraction;
- coarse red/magenta, cyan/blue, green and warm-color occupancy;
- the same color measurements independently for left/right/top/bottom;
- left/right and top/bottom distribution distance for split-field candidates;
- simple edge density;
- filename/path priors such as `thumbnail`;
- explicit evidence contributions for every candidate tag.

This deliberately starts cheap. It can answer questions such as “is this approximately half cyan/blue and half magenta?”, “which side carries which field?”, “is it mostly monochrome?”, and “does the path itself make thumbnail status likely?”

## Next detectors

Add as independently testable modules:

1. **face/profile geometry** — face boxes, profile orientation, one-vs-two faces, left/right occupancy; use OpenCV or a small documented model if available.
2. **layout/segmentation** — contours, dominant connected regions, Hough lines, frames/borders, central circle/orbit, bilateral symmetry.
3. **palette prototypes** — learn robust Lab/HSV distributions from Nathan-approved minimal pairs/groups rather than fixed color names alone.
4. **motif prototypes** — face profile, facing pair, split field, observer/profile, helix/coil, braid, torus/rosette, grid/technical plate, notebook/provenance scan.
5. **archive priors** — folder, filename, adjacency, duplicate/near-duplicate hashes, conversation attachment neighborhood, existing captions/descriptions.
6. **text recovery** — search archive records for the filename/hash/adjacent attachment and attach descriptions as evidence, not inferred truth.
7. **guess testing** — a hypothesis proposes its own falsifiable cheap checks (e.g. split-field -> bimodal palette + spatial segregation).
8. **calibration** — log prediction, evidence, Nathan decision, and revised rule/weight. Preserve old predictions for audit.

## Training/calibration records

Use JSONL. One human-reviewed record can contain:

```json
{"image":".../foo.png","labels":["face_profile","profile_left","red_magenta"],"source":"Nathan","decision":"approved","notes":"B&W face profile at left; magenta field"}
```

Minimal pairs are especially useful because they isolate a feature:

- profile-left vs profile-right;
- B&W profile vs magenta profile;
- one face vs two facing faces;
- cyan-left/magenta-right vs reversed;
- split field vs mixed/bimodal-but-not-spatially-split.

The tool should learn **feature discriminators**, not a single opaque “style score.”

## Recovered visual-language anchors

The archive now supplies at least one strong source-backed podcast-style fact: Nathan describes the podcast imagery as beginning with **black-and-white-and-red thumbnails** in the [public-record transcript](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/__SAT_Public_Record_Transcripts/FULL_Scalar-Angular%20Theory_%20Field%20Notes%20-%20Full%20Unification%20GR-QM-ST.txt). This can seed `red_bw` as an early podcast palette lineage.

By contrast, the exact thematic meanings of **profile-left/profile-right, magenta/cyan, two facing profiles, split fields, and special-series overlays** remain uncalibrated until Nathan supplies exemplars or archive text makes the mapping explicit.

The supplied `VISUAL_INSP` set is useful for **shape vocabulary**—helix, paired helix, coiled coil, recursive coil, linked rings, toroidal coil, braid—but remains external inspiration, not SAT/H(s)H evidence.

## Family/variant model

Do not force every visual into a flat independent class. Prefer:

`family_id -> variant_id -> duplicate/near-duplicate relationship -> visible features -> semantic labels`

This lets the system identify that two images belong to the same four-panel pitch-comparison family, for example, even when the changed member labels are the scientifically interesting difference.

## Public-site and archive boundaries

This analyzer may propose gallery tags/captions, but it does not override [gallery policy](../../PUBLIC_SITE/GALLERY_FEED.json), quarantine, explicit NO/GO decisions, or provenance requirements.

- `PRIOR_ART/**` remains quarantined and cannot be promoted by this tool.
- WEIRD/WACKY/4D-organism material remains excluded under the standing visual policy.
- `thumbnail` in a filename/path remains a default GO only when no stronger exclusion/quarantine applies.
- exact-square + clearly project-related may be a thumbnail heuristic, never an override.
- external inspiration may train descriptive shape recognition but must not be recast as project evidence.
- random/mock/synthetic figures retain those roles; attractive structure is not evidence of a physical result.

## Run

```bash
python tools/visual_archaeology/visual_analyzer.py image1.png image2.jpg -o measurements.json
```

Requires Pillow only for the first pass. OpenCV/scikit-image can be optional later rather than making the basic archive sweep fragile.
