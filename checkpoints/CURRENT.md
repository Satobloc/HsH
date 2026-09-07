# Current Reconstruction Checkpoint

- **Completed sources:**
  `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/INGESTION_LEDGER.md`, lines 1–229, and
  `SAT_THEORY_ARCHIVE_2023-25/SPHERECHECKQC.txt`, lines 1–1217, read
  sequentially and fully.
- **Source in progress:**
  `SAT_THEORY_ARCHIVE_2023-25/SPHERES2QC.txt`, lines 1–1000 of blob
  `9e110e2c13d95a061d9521c84ae9e1755fffa3f4`, read sequentially. The covered
  range contains the v0.2 overview, demonstrations, tests, static round-trip,
  deformation implementation, and part of the runtime/CLI code. Later equation
  packets, interface material, and recorded outputs remain unread.
- **Current dependency:** `configuration geometry -> intersection carrier`.
- **Ledger change:** Promoted the mathematical part of `EQ-0001` and `EDGE-0001`
  from provisional to `STD/DERIVED`; framework adoption remains `OPEN`.
- **Result:** `rho^2=R^2-d^2/3`; regular Jacobian singular values are
  `sqrt(2)d`, `sqrt(2)d`, and `2sqrt(3)rho`; rank falls from three to two at
  `d=sqrt(3)R`. This certifies the benchmark only.
- **Continuation cursor:** Resume
  `SAT_THEORY_ARCHIVE_2023-25/SPHERES2QC.txt` at line 1001.
- **Next test:** Determine exactly what v0.2 changes, which v0.1 identities it
  preserves, and whether `coordinate_rewrite` is an accurate status. No verdict
  is assigned before the remaining source is read.
- **Known gap:** No upstream H(s)H argument selects the symmetric three-sphere
  configuration. Finite-tube/Bishop framing is explicitly unimplemented in v0.1.
- **Archive-support update:** `Satobloc/HSH_RESOURCES` was structurally indexed and
  given dry-run-first PDF extraction/indexing tools. A new 2,407,268-byte live
  conversation was detected and structurally indexed at
  `LIVE CONVOS/Succinctness And Math Check — raw.json`; it has not yet been read.
