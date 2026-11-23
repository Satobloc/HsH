# Amendment 02 - h1029 CRTC composition-claim timing correction

**Date:** 2026-11-23  
**Applies to:** h1029:s3 Orson receipt and report  
**Status:** SOURCE-TIMELINE CLARIFICATION

The h1029 report used the phrase "only when" for the subgroup-to-member projection composition condition. At the h1029 source snapshot, the formalization had established the sufficient closure condition and a cross-boundary witness, but did not yet contain a universal necessary-and-sufficient theorem. The phrase therefore read more strongly than the then-available proof.

At h1033, PR #2375 added the theorem subgroup_member_projection_composes_iff. The current PR head a2fbc3d9fb84cd55f8fcaa158d4a435c23d57b8a built successfully in Actions run #45095515657, with exact module and root-aggregator identity against the tested merge reference. The theorem now establishes the iff for the declared event-view semantics.

This amendment does not backdate the proof to h1029. The h1029 report remains a snapshot of the earlier state. The new theorem does not authenticate source logs or validate an empirical interpretation.

PR #2375 remains OPEN / DRAFT / UNMERGED and has no formal review. No P1 protocol or theory status changed.
