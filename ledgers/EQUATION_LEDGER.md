# H(s)H Equation Ledger

This ledger records mathematical statements separately from claims about their
H(s)H interpretation. Provenance and maturity are independent fields.

## EQ-0001 — Common carrier of three equal 3-spheres

- **Statement:** For three equal 3-spheres of radius `R` in Euclidean `R4`, whose
  centers form an equilateral triangle of side `d`, the regular common
  intersection is a circle with

  ```text
  rho^2 = R^2 - d^2/3,
  C = 2 pi rho.
  ```

- **Domain:** `R > 0`, `d >= 0`; real regular circle for `0 <= d < sqrt(3) R`.
- **Boundary cases:** `d = sqrt(3) R` gives `rho = 0`; `d > sqrt(3) R` gives no
  real common carrier in this symmetric configuration.
- **Units:** `[R] = [d] = [rho] = L`; `[C] = L`.
- **Inputs:** Euclidean metric, equal radii, equilateral center placement, exact
  sphere constraints.
- **Output:** Radius and circumference of the common intersection carrier.
- **Imported mathematics:** Euclidean distance geometry and regular constraint
  intersection.
- **Provenance:** `SRC` — currently recovered through
  `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/INGESTION_LEDGER.md`,
  lines 162–186, which points to root archive files `SPHERECHECKQC.txt`,
  `SPHERES2QC.txt`, and `SPHERE4QC.txt`.
- **Maturity:** `CANDIDATE` pending a complete sequential read of the three
  pointed-to source files. The ledger reports the benchmark as executable and
  exact for its declared Euclidean geometry; this entry does not yet independently
  certify that report.
- **H(s)H relevance:** Candidate example of the dependency
  `configuration geometry -> intersection carrier`.
- **Not established:** The sphere configuration is not thereby fundamental,
  physically realized, or selected by the current H(s)H framework. The critical
  separation is not a universal event threshold.
- **Earliest unsupported edge:** Selection of this symmetric three-sphere
  constraint system as a model of a finite-core H(s)H history.
- **Downstream dependents held open:** finite-tube lift, framing, transport,
  deformation law, Interbraid/Electrogravity coupling, and observable readout.

