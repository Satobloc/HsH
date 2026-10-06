# Human visual-review packets

The interactive review sheet exports compact JSON packets here.

**Ingestion boundary:** browser-side **Save locally** changes only the browser and flips the page status indicator. **Export review JSON** creates a packet. A packet becomes classifier input only after Nathan deliberately supplies it for commit under this directory.

On the next visual-archaeology run, `hypothesis_cycle_v2.py` overlays committed packets without rewriting `sampling_manifest.json`:

- `correct` / `wrong` applies explicit validation to the exact `reviewed_guess` that Nathan saw;
- keywords become Nathan-supplied labels;
- comments are retained with Nathan-review provenance;
- `approve` makes the item a staging candidate, never an automatic public publication;
- `hold` keeps it in review;
- `reject` sets `never_display`.

Broad review-only images can enter the measured classifier set after Nathan reviews them. Standalone/non-repository objects are not auto-ingested because they lack a stable repo path.

This keeps the loop auditable: **machine guess -> human review -> committed packet -> next measured run**.
