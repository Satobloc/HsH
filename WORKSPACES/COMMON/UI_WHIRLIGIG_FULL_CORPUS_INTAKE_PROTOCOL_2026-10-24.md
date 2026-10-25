# UI / WHIRLIGIG FULL-CORPUS INTAKE PROTOCOL v0.1
Date: 2026-10-24. Status: actionable retrieval design; NOT comprehensive extraction completed.

## Naming and search scope
Search all three repositories SAT_THEORY_ARCHIVE_2023-25, HsH, HSH_RESOURCES, preserving private-resource boundary. Query title AND full text, including conversations, filenames, extracted PDF text, image metadata/captions, NLM transcripts, scripts, notebooks, revisions and archived copies. Never treat GitHub search as exhaustive.
Canonical family facets with all spellings:
- UI: "Universal Indicatrix", "UI", "optical indicatrix", "double hypersphere", "two spheres", "double sphere", "topological indicatrix", "TX", "UI/TX".
- Whirligig: "Whirligig", "Whirlygig", "Wirligig", "Wirlygig", "Donut", "doughnut", "Topological Derivation Manifold", "TDM", "Curvy Lisa", "Lissajous", "R/Q".
- Related but *separate* families: "Hagalaz", "three spheres", "SO(4)", "geometric equation translation", "bending energy", "manifold generator".
Use acronym-only queries with proximity and known source lists to control false positives. Conduct multiple separate math search expressions, NOT a single long broad OR query.

## Four extraction lanes
A. EARLIEST: sort original message timestamps; distinguish archived file creation, reposts, retroactive quoted passages and original conversation timestamps; independently verify earliest origins by primary records.
B. NATHAN-DISCOURSE: highest volume of original user-role text; group contiguous multi-message dialogue turns and speech transcriptions; rank by word volume and distinct design/operational claims, not keyword density.
C. ASSISTANT/NLM-CONSTRUCTION: highest volume of mathematical output/code/simulations/claims; distinguish actual executed scripts, assistant invented postulates, NLM summaries, and tested current implementations.
D. ALL MATH: every occurrence of formula or mathematical relation *used in UI or Whirligig context* (including code); preserve literal expression, definitions, role, date, speaker/source, parameter choices, dependent terms, corrections, test/result, and exact locator; normalize duplicate equivalences in separate layer without losing occurrences.

## Selection metrics
Per source/message: count tokens by provenance speaker; explicit operational rules; equations/notation snippets; diagrams; source date; version stage; independent originality; code/test evidence. Rank separately by earliest date, Nathan-authored word count, construction count, and math occurrence count; each rank is a *view*, not a score of truth.
Coverage ledger includes: repository, git commit, path, MIME, conversion route, page count when known, message ID, author role, timestamps, raw source hash, parser warnings, whether full text or images were actually inspected; completeness label full / partial / name-only / inaccessible.

## Source-first checks already done for pilot
1. SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/Universal Indicatrix in my words CHARACTERIZATION (Nolat).txt (blob a1707dffe3502d507bc405d4087a3476fc1d6cce) is a two-page extracted PDF transcription, including Nathan's conversational words and transcribed handwritten notes on two four-spatial-dimensional hyperspheres, rotations, scale and measurement. Source PDF SHA256 ad920fa43badd060d10cc05ee7de2c47d933d0fab094fbac14f49d91eacae21a. MUST check original PDF page images/handwriting before labeling extracted text verbatim.
2. SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt (blob be985c292bfcae7352983d596c38e7f172f6029d) records equation-to-sphere-curve coupled torus trajectory construction. Authorship initially unverified; do not attribute text to Nathan.
3. SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/PHYS D UNIVERSAL INDICATRIX.txt (blob 3e372b3939ede06474d5df095043025dcf487f7f) claims extra SU(2) field, discrete lattice, and unification. Treat as historically situated *draft claims*, not operative 2026 BEDROCK or proof of UI functions.
4. HsH/WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/README.md and Whirligig functional audit spec provide current tests, limited UI generator/measurement ability and information-preserving translation hypothesis.

## Crucial tool status
Mersearch bridge has **four lanes** as of October 24. Inspected lane1 and lanes2-4; all request JSONs have named requests (Orson, Tern, Morrow, Meridian) and none was overwritten. This document does NOT claim a new Mersearch run. Use idle lane after confirming request outputs and final state, or a local pinned worker checkout. Public query outputs must not accidentally expose HSH_RESOURCES or private message bodies.

## Proposed JSON record
{
  "id": "UI-SRC-...:msg-...:span-...",
  "topic": "UI",
  "source": {"repository": "...", "commit": "...", "path": "...", "message_id": null, "page": null, "sha256": null},
  "authorship": {"role": "user|assistant|tool|NLM|unknown", "verified": false},
  "dates": {"original": null, "export": null, "publication": null},
  "original_text": "...",
  "passage_kind": "concept|instruction|question|math|construction|test|correction",
  "capability": ["measurement", "simulation"],
  "math_occurrences": [{"literal": "...", "latex": null, "variables": [], "type": "definition|equation|conjecture|algorithm|code"}],
  "relationships": [{"relation": "corrects|uses|analogous_to|derived_from|duplicates|contradicts", "target": "..."}],
  "verification": {"source": "unverified", "math": "untested", "physics": "untested"}
}
Separate records for every occurrence, normalized mathematics, and subject-specific anthology. PDF 'Nathan On' uses ONLY role-verified Nathan words; 'The Math of' states who actually authored equations.

## Two initial consequential divergences to track
- Nathan's source conception: flexible four-dimensional point/scale/rotation ruler and generator. An old UI DRAFT paper imports a 3x3x3 lattice and underlying SU(2) field. These are different assumptions, not equivalently established UI prerequisites. Need dated corrections.
- Donut can supply a geometrical composite path, but full equation-information preservation and representation-independent derivation ranking are still separate proof obligations.

## Publication goal
Collection pairs: Nathan On: Universal Indicatrix / Whirligig-Donut / Hagalaz; The Math of: Universal Indicatrix / Whirligig-Donut / Hagalaz. PDF reading-room human front and JSON theorist-ready source. Publish through audited site feed and publication approval, not raw/private source links. Build index manifest with version, source anchors, corrections, updates and explicit corpus coverage.

## Immediate next operations
1. Verify lane status/receipts; dispatch separate facet-oriented queries (earliest, Nathan-discourse, NLM construction, math occurrences), scoped to all three roots.
2. Parse complete search output, recover original speakers/timestamps/pages/images, deduplicate exported copies without merging distinct revisions.
3. Compute completeness matrix; manually review top extremes plus randomized off-topic conversations.
4. Extract all syntax-bearing math in matched context and code, check false negatives with independent symbol/filename crawls, attach original context, apply corrections-first gate.
5. Generate full-length source-linked human PDFs and research JSONs, stage in HsH public site pipeline with privacy check.
