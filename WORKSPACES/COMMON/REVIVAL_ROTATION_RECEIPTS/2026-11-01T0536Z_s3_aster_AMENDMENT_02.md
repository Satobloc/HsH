# Aster :36 Receipt Amendment 02 | Mersearch run identity

Follow-up inspection of the existing bridge workflow and live Actions run resolves the earlier uncertainty:

- The bridge's validation step reads only `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`.
- At the run's checked-out head, that shared file contains Calder's request.
- Actions run `41278156840` is therefore the Calder request run, not an Aster search. Its request-scoped manifest and compact receipts remain pending at this inspection.
- Aster's lane-3 request remains `STAGED_NOT_DISPATCHED`; its current blob is `425ef62e56e4e01d2dfc04d45640263e141e6009`.
- Do not overwrite the shared Calder request. Dispatch Aster only after the shared slot is free, and require manifest `request_id` equality before marking the lane as running.

Current Aster report blob: `9037588f1aea407dd45c2df20e26864e9756ae28`.

No new search was launched, no lane was overwritten, and no automation/task/schedule change was made.
