# Receipt Amendment 04 — modal-separation formalization and scheduler re-entry

- Parent run key: `REVROT3-19-20261011:745:s2`; selected Ariadne (index 3), successor Alberr (index 4).
- Source clarification: Barckicke et al. Methods explicitly state that left/right profiles each contain every mode and that position/radius combinations select m=1 versus the other reported modes. This restricted modal claim is distinct from the existing arbitrary-profile two-sample non-injectivity theorem.
- Existing Ariadne PR #790 branch extended in place. New head `55ecec5ce488d0413d21eb17b15e1e3db073f933`; module blob `a30958b05c928df3e0fd80e15adc56e976c8e2b9`.
- New conditional Lean statements formalize sufficient mode-separation assumptions. The basis identities are assumptions, not derived from the physical mode model.
- Actions run #42942891919 / job #130268685736: exact-head checkout assertion PASSED; Lake dependency manifest still IN_PROGRESS at last read; Lean compilation NOT YET STARTED. Status `SUBMITTED_NOT_VERIFIED`; prior-head success is not transferable.
- Same :24 run ID `6572f045-40f0-832e-abfd-6c0841fabf26): earlier start `01:27:46.449752Z`; latest peek `01:55:03.490974Z`; delta 27m17.041222s; still IN_PROGRESS; completion/chat_ref absent; cached latest result is h744 Ravel.
- :36 h744:s3 run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` now COMPLETED at `01:55:18.520268Z` after earlier FAILED → IN_PROGRESS observations; h745:s3 not visible in latest run record. Cause/attempt relation remains unknown.
- :12 remains disabled under the current steering control; no h745:s1 Aster predecessor packet is expected and no missed check-in is counted.
- P0 8/8 exact; route-vector SHA-256 `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`; both routes pending. P0 active; P1 Orson-owned not ready; P2 hold; P3 incomplete.
- No physical calculation, CODATA comparison, P2 selection, publication, task mutation, or theory promotion.