# Evidence-gated candidate admission: downstream wiring

Status: **CURRENT-HEAD MERGE-REFERENCE BUILD VERIFIED; PUBLISHER INTAKE PENDING**

## Problem found

The existing [PR #2327](https://github.com/Satobloc/HsH/pull/2327) adds `EvidenceGatedFrozenCommonReadout` and an evidence-gated detector-separation theorem. Its own amendment correctly states that downstream admission code must choose this wrapper; the module does not globally enforce that choice.

The parent [PR #1487](https://github.com/Satobloc/HsH/pull/1487) still exposes a `Candidate`/`hardGate` surface that is structurally separate from the new readout wrapper. Merely importing the child module does not make the readout evidence gate a requirement of candidate admission.

## Substantive improvement

Created [PR #2330](https://github.com/Satobloc/HsH/pull/2330), stacked on PR #2327 and PR #1487.

The new `EvidenceGatedModelComparison` admission object requires, together:

- the existing candidate `hardGate`;
- an `EvidenceGatedFrozenCommonReadout`;
- declared source-system, dataset, and shared-readout identities;
- an explicit source/model/readout binding witness;
- H(s)H and standard model maps and their state sets;
- two-sided detector-level separation computed through the same readout carried by the admission object.

The `admittedCandidate` accessor exposes a `Candidate` only through that complete object. The added `evidenceGatedIntelligibilityTieBreak` accepts two complete admission objects and requires the same declared system, dataset, readout identity, and measurement mode. Its theorem projects both candidates' hard gates, both readout gates, both binding witnesses, and both detector-separation witnesses.

This is an opt-in safe admission API. It does **not** remove or globally replace the legacy raw-`Candidate` tie-break in PR #1487. Downstream production selection must still be routed through this new object in a later reviewed integration.

## Lean verification

The initial version at head `120c8b8e3aadaf2535619c42404e9c278d4cdcfc` passed merge-reference build [#44999734271](https://github.com/Satobloc/HsH/actions/runs/44999734271): **8,949 jobs successful**. The new module and root aggregator blobs were identical at that PR head and the synthetic merge ref. Five initial declarations reported no axioms. The separate axiom-audit action was skipped.

The current PR head is `44b132df6b6bef4382032fc462b8e598fd521153`; the module blob is `d29b10e7075af8449c72ac96ed473807a4736b81`. It passed merge-reference build [#45000183363](https://github.com/Satobloc/HsH/actions/runs/45000183363): **8,949 jobs successful**. The checked-out synthetic merge commit was `03f1dfbda21058ece946faae378d1d4ddfc1a9e8`. The current module blob and root aggregator blob `8c5c7ba60fb59f21ec32ddfa128d020abe46acf8` are identical at PR head and merge ref. All six theorem-specific axiom reports for this module say the declarations do not depend on any axioms. The separate global axiom-audit action was skipped; tests, lint, leanchecker, nanoda and global axiom audit were not run. This is a successful merge-reference build with exact changed-file blob identity, not a standalone head-only checkout. The current head remains OPEN / DRAFT / UNMERGED.

The binding witness is an external proposition. Lean checks that a proof term is supplied; it does not authenticate source records, instrument identity, calibration, acquisition independence, or physical truth.

## Non-duplication and physical boundary

The existing M87 acquisition-lineage, Fourier-visibility, worldtube-observable, and multifrequency-holdout artifacts already cover the relevant 2017 product structure and visibility-domain comparison requirements. No duplicate M87 note or new system selection was made.

No raw physical data were downloaded or analyzed. No physical calculation, fit, H(s)H prediction, calibration/holdout result, falsification threshold, SAT-O/Blockwave equation change, or BEDROCK theory promotion is claimed. P2 remains HOLD.

## Lateral source reading

A separate reading of Leslie Lamport's 1978 paper, *Time, Clocks, and the Ordering of Events in a Distributed System*, covered PDF pages 1–5 of 8; return cursor: page 6. Its happened-before relation is a partial order. Logical clocks preserve causal precedence, but a chosen total order is not itself causal truth. This reinforces the workflow rule that timestamps are attributes, not event identities or causal proof; receipts should bind events through explicit run, job, commit, artifact, and readback identifiers.

Source: https://lamport.azurewebsites.net/pubs/time-clocks.pdf
DOI: https://doi.org/10.1145/359545.359563