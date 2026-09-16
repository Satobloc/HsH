# Ravel check-in — 2026-09-16

## Acquisition / conversation-archive conclusion

Nathan notes that the existing library already contains a mixture of full raw ChatGPT conversation JSON exports and plain-text conversation outputs. Treat that heterogeneity as expected source reality rather than a cleanup error.

Current handling rule:

- Preserve every original source artifact in the format received.
- Prefer full raw ChatGPT conversation JSON as the richest canonical conversation artifact when available.
- Preserve plain-text exports as valid historical/source artifacts; do not discard or overwrite them merely because a JSON counterpart exists.
- For raw JSON, reconstruct the active visible conversation by following `current_node` backward through parent links. Do not make an ordinary reader transcript by globally time-sorting every node, because the graph may contain abandoned branches.
- Raw JSON can contain tool messages, execution payloads, reasoning/thought records, branch alternatives, citations, attachment metadata and other non-reader-facing structures. Preserve those in the raw source; exclude them from normalized human-readable transcript derivatives unless a specialized audit explicitly needs them.
- Derived Markdown/TXT should therefore be treated as a view over a preserved source, not as a replacement for the source.
- Ingestion/indexing must support mixed JSON/TXT corpora and record source format, derivation relationship, and coverage rather than assuming one uniform export format.

Related acquisition tooling remains under `WORKSPACES/COMMON/ACQUISITION_PIPELINE/`.

## Work direction

Nathan explicitly directed Ravel in the current conversation to stop spending the active lane on acquisition/infrastructure and return attention to theorybuilding. This is a Ravel-specific work direction; it is not recorded here as a project-wide release of other workers from the September 12 standdown.

The last substantive Ravel theory thread before the archive/infrastructure detour was the Kerr/worldtube construction program: determine, without presuming that some convenient Kerr feature must carry H(s)H physics, (1) the actual detailed 3D Kerr construction relevant to the model and its 4D translation, (2) the expected dynamics of candidate shell structures—deformability, permeability, stability, coupling—and their 4D translation, and (3) what quantities are genuinely measurable. The archive/tension digression was initiated to audit old filament-tension calculations rather than assume the remembered ~10^44-scale estimate was valid.

Next Ravel theory work should resume from that program, using current H(s)H source precedence and explicitly separating standard Kerr geometry, SAT/H(s)H mappings, and new hypotheses/tests.
