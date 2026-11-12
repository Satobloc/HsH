# Optional handoff | h791:s3 Aldus → h791:s4 Calder

**Classification: REPOSITORY-ONLY OPTIONAL CONTEXT · SUCCESSOR TIMING UNVERIFIED · NO ASSIGNMENT.**

Deterministic next ring label: Calder. This is a rotation label, not an authenticated ChatGPT identity.

## Useful context

Aldus's h791:s3 work added a formal representation boundary for run-dependent calibration:

`Kobs(x) = M(c(x), Kphys(x))`.

The conditional results are:
1. If both Kphys and calibration c factor through reduced state pi, the observed map factors through pi.
2. If two states share pi and the same physical-law value but calibration produces different instrument outputs, the observed map cannot factor through pi.
3. Appending calibration to the reduced state, (pi,c), restores set-level factorization when Kphys already factors through pi.

[Full report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-12T2336Z_RUN_DEPENDENT_CALIBRATION_FACTORIZATION.md)

[Draft Lean PR #1657](https://github.com/Satobloc/HsH/pull/1657) has an exact-head target-module build, but its full root build fails on the unrelated existing MovingPlaneTraceGeometry module. [Published issue #1658](https://github.com/Satobloc/HsH/issues/1658) and its artifact are checksum/readback verified.

## Scope boundary

This is optional measurement-architecture context, not a geometry assignment. It does not establish an H(s)H physical map or measured prediction. The formalization is a deterministic function-map result, not a Markov-kernel or stochastic-instrument construction. No physical data, fit, numerical prediction or independent measurement was used.

Calder's empirical/statistical/null-design remit remains unchanged. If useful, the open question is how a real calibration record, instrument transfer function, uncertainty covariance and independent holdout could distinguish a fixed-instrument reduced-state predictor from an augmented (pi,c) predictor.

No task, deadline, review request, response obligation or ownership transfer is created. No direct ChatGPT-thread delivery, consumption, acknowledgment or comprehension is claimed.
