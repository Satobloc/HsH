# Nathan Words — Early-sketch visual reconciliation 02

**Date:** 2026-09-16  
**Lane:** Nathan Direct corpus/provenance  
**Status:** bounded provenance/duplicate QA; no theory authority

## Object + operation

Primary target: the non-byte-identical `_4` pair previously isolated for visual reconciliation.

Operation: re-inspect the Library-side image directly and test whether the public-archive counterpart can now be retrieved as pixels through the available repository interface.

## Library-side source

Library object:

- `00. Earliest_Surviving_Sketches_2003_4.png`
- file id: `file_00000000c1e481f69b5f62c10c1c2773`
- size: `1,009,132` bytes

Direct image inspection confirms the photographed open graph-paper notebook page contains two main geometric constructions. Visible handwritten labels include approximately:

- `regular 1-brane`
- `curved 2-brane`
- `multiply folded 2 brane`

The photographed page itself does not visibly supply a calendar date. This remains a visual fingerprint, not a claim about the mathematical meaning/current theory status of the sketches.

## Public-archive counterpart

Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

Path:

`2003 SKETCHES/Earliest_Surviving_Sketches_2003_4.png`

Git blob SHA:

`f922e2ce54b9aa96b871342838b7f59b32459a6d`

A fresh repository fetch confirms the path/blob identity. The connector still does not expose the binary payload for this image: `fetch_file(..., encoding=base64)` returns the SHA/path identity but an empty content field, and the generic fetch route rejects the non-UTF-8 binary response. Therefore no pixel-level comparison can be made honestly from this interface in this run.

## Duplicate disposition

No change to the prior eight-way byte reconciliation:

- 4/8 Library↔public-archive pairs are exact byte-identical duplicates;
- 4/8 are distinct byte identities pending content-level classification;
- `_4` remains one of the unresolved distinct-byte pairs.

Do **not** infer from the matching basename that `_4` is pixel-identical, a recompression, a crop, or a different photograph. Those remain alternatives until the public blob can be materialized/decoded through a binary-capable route.

## Provenance/status boundaries

- This run concerns storage/artifact identity and visual provenance only.
- The modern Library filename and repository folder name do not independently date every mark on the page.
- The separate photographed notebook label and Nathan-authored chronology remain distinct provenance layers.
- No assistant prose is converted into Nathan-authored material.
- No quarantine/prior-art material was read.
- No direct theory construction occurred.

## Current frontier

The `_4` pair is **retrieval-blocked at the public-pixel side**, not interpretation-blocked.

## Exact next cursor

Do not repeat the same GitHub binary fetch next run unless tool capability changes. Instead take one bounded operation on another unresolved pair whose two visual surfaces are actually available (prefer Library `_5` plus any independently materializable counterpart), or shift to image-to-notebook physical-continuity QA across the six Library page photographs. Preserve the 4/8 exact + 4/8 unresolved byte-level disposition until content-level evidence changes it.
