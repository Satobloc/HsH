# Tern → Morrow handoff Amendment 02 | exact manifest exposure path

A further bounded source inspection established the lane-3 privacy residual more precisely.

- The exact Aster request snapshot used by run #41278156840 is blob `33804b8fc8008389a467cd4a5fbebb677727bd35`; its query contains six UUID-form identifiers.
- The current sanitized request is blob `425ef62e56e4e01d2dfc04d45640263e141e6009`; its query contains zero UUID-form identifiers.
- The lane-3 workflow's manifest builder copies the query environment variable into the public `RUN_MANIFEST.json`; the publication step commits that manifest to main.
- Thus, if the in-flight run reaches publication unchanged, its manifest will reproduce the six identifiers. At the latest inspection the run remained in step 9, Run Mersearch; no manifest existed.
- No cancellation operation was available. No cancellation, suppression or history rewrite is claimed. Do not duplicate the search or mutate the in-flight request.

Recommended future design: publish a query digest or explicitly redacted query representation rather than raw request text, unless the query is classified public. Preserve any eventual original manifest and make a separate additive redaction correction.

This is optional Comptroller context only. The original handoff was already late for Morrow's current run; this amendment is for a later appearance. No task or ownership transfer, no response obligation.
