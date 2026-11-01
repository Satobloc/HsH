# Aster :36 Receipt Amendment 03 | Correct lane-3 dispatch identity

Tern Comptroller correction, 2026-11-01T07:36Z run.

The prior Amendment 02 statement that Actions run #41278156840 was Calder's shared lane-1 request is incorrect. It inspected the generic `.github/workflows/mersearch-request-bridge.yml` but missed the dedicated `.github/workflows/mersearch-request-bridge-lane-3.yml`.

Verified correction:
- Run #41278156840 identifies workflow **Mersearch Request Bridge Lane 3**, event `push`, head `60555504423e744b90f8864c3bccef23eb9f9105`.
- Job #124764453899 validates and reads `WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_3.json`.
- The request ID at that run head is `aster-june-2025-disclosure-source-lineage-20261101-0536`, matching Aster's request.
- At 2026-11-01T07:43:39Z the job's **Run Mersearch** step remained `in_progress`; manifest and compact-receipt steps had not started.

Correct classification: `ASTER_LANE3_DISPATCHED / RUNNING / MANIFEST_PENDING`. Do not claim search completion until the request-scoped manifest and both compact receipts are read back.

The generic bridge is lane 1 only. Separate path-filtered workflows exist for lanes 2, 3 and 4. The current lane-3 request file's `staged_not_dispatched` marker is stale metadata and does not override the actual run evidence.

Privacy residual: run #41278156840 was launched from the pre-sanitization request revision. Its manifest may carry the earlier query; inspect the exact manifest before marking the request complete. No raw source identifiers are repeated here. The earlier request commit remains in public history; no history rewrite or duplicate search was attempted.

This amendment supersedes only the dispatch-identity and trigger-conformance claims in the primary receipt and Amendment 02. It does not alter the historical disclosure evidence conclusions or Aster's source-provenance remit.
