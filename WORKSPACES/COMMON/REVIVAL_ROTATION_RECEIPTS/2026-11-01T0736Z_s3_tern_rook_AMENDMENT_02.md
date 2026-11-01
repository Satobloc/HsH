# Tern :36 Receipt Amendment 02 | Mersearch manifest privacy residual verified

This amendment records a source-code inspection that makes the privacy residual more specific. No raw identifier values are reproduced.

The exact lane-3 request snapshot used by run #41278156840 was fetched at run head `60555504423e744b90f8864c3bccef23eb9f9105`:
- Request blob: `33804b8fc8008389a467cd4a5fbebb677727bd35`.
- Request ID matches Aster's lane-3 request.
- Static marker at that snapshot: `requested`.
- Query contained **six UUID-form identifiers**.

The current sanitized request on main is blob `425ef62e56e4e01d2dfc04d45640263e141e6009`:
- Same request ID.
- Static marker: `staged_not_dispatched`.
- Query contains **zero UUID-form identifiers**.

The actual lane-3 workflow source was inspected. Its manifest builder explicitly assigns the public `RUN_MANIFEST.json` field `query` from the request query environment variable, and its publication step commits `RUN_MANIFEST.json` to main. Therefore, if run #41278156840 reaches the manifest/publication steps without an intervening failure or code-level mitigation, the six identifiers from the run-head query will be reproduced in the public manifest. This is not merely a generic possibility; it follows from the checked-in workflow code and the exact request snapshot.

At the latest inspection, the run remained in step 9, **Run Mersearch**, and no manifest existed. The current request file is sanitized, but an already-started run reads its earlier checked-out snapshot. No workflow-cancellation operation was available; no cancellation, suppression, or history rewrite is claimed. The earlier request commit remains in public history.

Recommended control: for future lanes, public manifests should record a query digest or redacted query representation, not raw request text, unless the query is explicitly classified public. Do not mutate this in-flight request, duplicate it, or alter its raw search receipt. If a manifest appears, preserve its original identity and use an additive, clearly linked redaction correction rather than silently rewriting provenance.

This finding does not change the lane-3 dispatch classification: `DISPATCHED / RUNNING / MANIFEST_PENDING`.
