# Aster h832:s3 | Claim-origin bridge for boundary provenance

**Status:** Source-custody clarification and workflow proposal only. No physical boundary, H(s)H mechanism, or independent measurement is established.

## 1. The missing join

The published h830 boundary-provenance proposal (#1741) distinguishes physical support, sweep endpoint, sweep side, finite timesheet-patch boundary, acquisition-window/aperture, instrument-response threshold, and overlap/corner strata. Its proposed `BoundaryProvenanceWitness` binds the boundary components, source-map identity/blob, coordinate frame, acquisition mask, instrument response, calibration, covariance, and run identities to a comparison freeze.

Three existing structures cover adjacent parts:

- **H826 `SourceExposureManifest` proposal:** original source artifacts and digests, derived summaries and upstream edges, prompt/context identities, retrieved files, tool outputs, peer outputs, exposure event, recipient, timestamp, and source locator. It is not implemented or compiled.
- **PR #1098 `RepresentationRecord`:** object kind, component rank, form degree, support dimension, source role, claim kind, source-map status, and source locator. Its source-role classes include user-role message, assistant-role message, document byline, standard mathematics, and unattributed embedded document.
- **PR #1594 `SweepBoundaryContract`:** conditional algebraic product-boundary consequences. The product-boundary law is a premise; the module does not construct a physical sweep or identify an H(s)H worldtube.

The missing composition is claim-level: a boundary component does not yet carry a typed link to the exact source segment and exposure-graph node that authorizes the way the component is being described. A source blob alone is not enough to establish who authored a particular embedded equation, whether a document-level byline covers it, or whether a date is a message time or merely file metadata.

## 2. Proposed minimal bridge

Reuse the existing `SourceExposureManifest` and `RepresentationRecord`. Add a claim-level `BoundaryClaimOriginWitness` referenced by each component of `BoundaryProvenanceWitness`:

- `boundary_component_id` and exact `claim_digest`;
- `source_exposure_node_id` and source repository/path/blob digest;
- exact source locator: message UUID, attachment node, line range, or byte range;
- `container_event_role` (user upload, assistant output, retrieval, external source, or instrument acquisition);
- `embedded_author_status` (user-role text, assistant-role text, document byline, unbylined, or unknown);
- `byline_scope` (document-level, section-level, equation-level, or unresolved);
- `source_date_kind` (message timestamp, file creation, file last-write, archive import, Git commit, or publication);
- `authority_class` (Nathan Direct, assistant reconstruction, historical source, standard reference, proposal, independent measurement, or unknown);
- `evidence_use` (source premise, standard lemma, proposed model choice, or observed measurement);
- `map_status` (source-defined, derived, assistant-proposed, not recovered, or unknown);
- transformation/summary ancestry and the same `comparison_freeze_id`.

These are orthogonal fields, not one overloaded source-role enum. A user-supplied attachment event does not identify the author of its embedded content. A document-level byline does not automatically attest every equation in a separately stored module. A proposal is not a source-defined primitive. A standard mathematical lemma is not a SAT equation. An independent measurement is an evidence class, not an author identity.

## 3. Source-custody clarification

### SAT-O1

The unbylined standalone `SAT O1 4D.txt` is 3,521 characters and 75 lines, Git blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, with previously verified SHA-256 `8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937`. Two SAT archive paths resolve to the same bytes and same blob, so they are duplicate custody locations, not independent sources.

The `DATED_FILE_LIST_EXTENDED.txt` row for the rewrite path records file creation at 2025-06-07 08:38:16, last write at 2025-06-09 18:44:50, and archive import at 2025-10-27 23:18:35 (index blob `9064b7bea3dbb5f82be93bc38792eb63d7227256`). `SAT_FULL_FILE_INDEX.txt` records archive-copy creation times on 2025-10-26 and 2025-10-27, with June 9 last-write times (index blob `4accca1e0473577d6556715c5bfb9fce78e8ca4d`). These are path-specific file-index metadata, not authenticated authorship dates or conversation timestamps. The h830 wording "source timestamps" should be read with that limitation.

The O1 text defines a one-dimensional curve `gamma : R -> R^{3,1}`, gives its tangent and a curve action, and verbally calls the worldtube the "4D volume swept out by the vibrating filament." It does not supply a separate thickening/sweep map `F`, a boundary map, or regularity conditions that construct that four-dimensional support from the displayed curve. The phrase is a source statement; the missing map is not.

The separate `SAT4D_LIVE_DRAFT.txt` is a different 114,901-character blob, `2a79fe25018cce7e99a2c33786d88b0551db6ae7`, with a document-level byline to Nathan McKnight and date June 2025. It is not byte-identical to O1 and the O1 file is not a literal substring of that draft. Its byline must not be transferred to the separately stored unbylined O1 module without a source-ancestry witness.

### Blockwave

The 24,627-character `BLOCKWAVE.txt` attachment has Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d` and previously recorded SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664`. Raw conversation `68c990dd-df28-832e-b766-c267190aaffa`, attachment node `9ae20939-a3b7-4e7f-ba7c-313f537fd525`, records a user-supplied attachment event at 2025-09-16T16:31:26.687Z. The event establishes upload provenance, not internal authorship. The embedded prose is assistant-voiced; its creator and composition date remain unresolved. It is not Nathan Direct.

The separate 2025-10-19 assistant response in conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, message `3039b226-02d4-41a3-a2d3-c338e25204a9`, postdates the attachment and is not its origin. Existing correction issue #1730 already records this distinction; no duplicate correction is proposed.

## 4. Geometry and proof boundary

The relative-boundary inclusion used in #1741 is a standard set/topology relation under the selected definitions, not an original SAT-O1 or Blockwave equation. It does not itself construct a smooth sweep, finite core, contact surface, or instrument map.

PR #1594 is a different conditional contract: its six sweep-boundary theorems assume the product-boundary law. Run #43006069897 built `EnheduannaSweepBoundaryGate` in a PR-associated Lean 4.34.0/Lake 5.0.0 run with 8,945 targets; theorem-specific reports listed only `propext`, with no `sorryAx` or `admit` observed. This does not prove the mask-intersection inclusion or a physical H(s)H map.

PR #1098 run #43595807207 built `SableCurrentSupportDegreeGate`; four theorem-specific reports for `SableCurrentIdentityGate` listed no axioms. The root build nevertheless failed at seven existing `MovingPlaneTraceGeometry.lean` declarations (lines 72, 76, 80, 84, 96, 100, 197). Tests, lint, nanoda, and the separate axiom audit were skipped. Neither PR is merged or integrated into current main.

### Lean formalization target

A future typed gate should require every accepted boundary component to reference exactly one origin witness whose claim digest, source node, locator, and comparison-freeze identity match. A second invariant should prevent a claim marked as a source-defined premise from carrying only assistant-proposed or unknown map status. Keep attachment-event role, embedded author, authority class, evidence use, and date kind separate.

This is a formalization target only. No new Lean theorem was written or compiled. Lean could check the encoded equalities and classification rules; it cannot authenticate the raw conversation, prove the exposure log complete, or establish physical truth.

## 5. Disposition

- No SAT-O or Blockwave equation was edited.
- No new physical calculation, fit, prediction, or independent measurement was performed.
- No P2 system was selected.
- No new theory primitive or BEDROCK promotion is proposed.
- The proposed bridge is a source-provenance/workflow improvement, not a physical claim.

**Result:** each boundary component should carry not just a source blob, but a claim-specific, source-role-aware, date-typed path back through the exposure graph. This closes an attribution gap without inventing a new theory object.
