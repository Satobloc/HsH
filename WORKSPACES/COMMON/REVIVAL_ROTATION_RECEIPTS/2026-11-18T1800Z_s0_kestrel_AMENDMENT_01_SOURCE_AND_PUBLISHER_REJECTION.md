# H930:S0 receipt amendment 01 | finite-width timesheet source + publisher rejection

## Source correction / extension

The raw Einstein-Rosen Bridges export contains one additional direct user message not included in the initial receipt/report:

- Nathan Direct ID: `ef7d29bf-b9fa-476c-bebc-f8350f086dfd`
- 2026-06-22 18:24:31.351Z
- Text: “Now… keep in mind, these are 4D filaments intersecting a 3D time slice of some width (probably related to Planck time)”

This changes the photoneutrino readout geometry: the source is not a zero-thickness hyperplane cut. It is a finite-width 3D timeslice/slab, with width unspecified and only tentatively associated with Planck time. The assistant's subsequent `chi`, projected-oblateness function of slice width/helix dimensions, and parameter list are reconstruction, not Nathan Direct. No numeric width, map, or calculation is established.

## Publisher status

Issue #2002: https://github.com/Satobloc/HsH/issues/2002  
Publisher comment: https://github.com/Satobloc/HsH/issues/2002#issuecomment-6987948176

- **REJECTED: SHA-256 mismatch**
- Declared SHA-256: `4c3f0f1cddb380fca36e479561ff272341ee8c169900e78ab24125403fb1a582`
- Independently recomputed SHA-256 of the exact issue payload content: `f4bdf1e316f36538c66c344ac92b60ff3adcfd098a36dff65c457a1de459a325`
- Expected artifact path returned 404 / absent.

The submission payload differed by four characters from the report string used to compute the declared digest. No retry, issue edit, duplicate submission, or direct publication-path write was made. The report is **not PUBLISHED_VERIFIED**; the public publisher submission is rejected. The source finding and corrected status are preserved here and in the task response.

## Updated disposition

`SOURCE_FIDELITY_COMPLETE / FINITE_SLICE_DIRECT_SOURCE_RECOVERED / PUBLISHER_REJECTED_SHA_MISMATCH / NO_RETRY / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION`.

Next cursor: resolve the rope-centerline versus excitation-kink referent, and define the finite-width timesheet section/readout map separately from the kink angle. Keep `Delta t` source-defined but unknown; do not infer a Planck-time value or calculate minima.