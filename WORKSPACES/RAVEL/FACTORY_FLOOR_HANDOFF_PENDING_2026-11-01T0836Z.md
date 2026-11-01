# Factory Floor handoff pending — Ravel helion data gate

**Status:** READY_FOR_OWNER_ROUTING / NOT_DELIVERED  
**Target:** Satobloc/FACTORY_FLOOR, stage 1 GLASS+HSH → stage 2 WORKSHOP  
**Floor ID:** none assigned  
**Machine-readable intake endpoint:** not found in current README/TODO; the repository currently exposes a Markdown issue register and describes the machine-readable companion as future work.

## Source-linked packet

- HsH PR #993, branch `research/ravel-helion-charge-radius-inverse-gate-20261029t0824z`.
- PR head: `6be0a2096306e154b2b0a8ad0359a36c60d60018`.
- Module: `FORMAL_VERIFICATION/HsHVerification/RavelHelionJLabE04018DataGate.lean`.
- Module blob: `415b1654e0f95b35172fa98a490589d0d91abfe3`.
- Root aggregator blob: `004eb0f9e6dd334c511aa1e70977fffd9ae2b5aa`.
- Actions run #41290025410, job #124799444666.
- Actual checkout: merge ref `ce0bfd4f6d6ecc50cc46ac5c6b1b1fb490f3991f`; module and aggregator blobs match the PR head.
- Lean 4.34.0 / Lake 5.0.0; 8,949 build jobs; zero `sorryAx`, zero `admit`; theorem-specific reports use only standard Lean axioms.
- Correct verification classification: MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_VERIFIED.
- Separate tests, lint, nanoda, and automated axiom-audit were skipped.

## Scope

The module formalizes exact finite arithmetic over Table II of Camsonne et al., PRL 119, 162501 (2017), arXiv:1610.07456v1, DOI 10.1103/PhysRevLett.119.162501. It proves the eight-row table ordering and data-quality exclusions around the missing magnetic extraction at Q²_eff=49.0 fm⁻² and the 210% relative uncertainty of F_C at Q²_eff=60.8 fm⁻².

It does **not** prove the source transcription, recover the raw covariance, validate the experiment, derive a worldtube-to-current map, establish H(s)H physics, or promote theory.

## Routing boundary

No issue was opened and no direct write was made to FACTORY_FLOOR. The packet remains in Ravel's workspace pending an authorized owner/endpoint or stable Floor ID. No delivery, receipt, acceptance, or workshop consumption is claimed.
