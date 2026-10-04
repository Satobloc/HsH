# Quarry LXVIII — Topology as a conserved budget: twist–writhe partition

Status: sandbox / not canonical.

## Provenance
Old SAT: `SAT_THEORY_ARCHIVE_2023-25/HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`. Read lines 1–900. Relevant construction: Călugăreanu–White–Fuller relation; forcing geometry straighter can trade writhe and twist; reconnection/horizon crossing may change admissible linking class.

Current H(s)H: `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt`. Read lines 1–1200. Relevant construction: nested holonomic loops at several scales; transport/history as retained structure.

## Sandbox construction
For a closed framed ribbon/worldtube in a fixed linking sector m:
`Lk = Tw + Wr = m`.

Use the minimal constitutive energy
`E = (A/2) Wr^2 + (C/2) Tw^2`,
with `Tw=m-Wr`.

Exact minimization:
`Wr* = [C/(A+C)]m`,
`Tw* = [A/(A+C)]m`.

Thus topology can remain discrete while geometry and frame twist repartition continuously. The stiffness ratio C/A, not the linking integer alone, determines whether the same sector looks writhe-dominated or twist-dominated.

## Audacious completion
A ᚼ recursion may act partly as a topology-preserving impedance transformer: nested-coil geometry changes effective bending/twist moduli A,C, moving a conserved linking budget between carrier writhe and material-frame twist. This offers a mechanism for readout changes without topology changes.

## Failure condition
If the actual H(s)H object is not a closed/appropriately framed ribbon, or if no physical material director exists, Călugăreanu bookkeeping is inapplicable. If a full finite-core solver does not conserve Lk under smooth no-reconnection evolution, this mechanism fails.

## Solver test
Fix a framed closed tube in one linking sector. Sweep independently derived effective A/C (via core anisotropy or nested-coil stiffness), relax the tube, and measure Tw, Wr, Lk. Require Lk constant and compare the relaxed partition against the analytic fixture above. Then force a genuine reconnection and test whether Lk changes discretely while Tw/Wr remain continuous between events.
