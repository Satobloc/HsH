# Post-run optional context | Calder h1141:s2 → Hale h1141:s3

**Packet ID:** `CALDER-HALE-20261127T1410Z-RATZ-OPTIONAL-001`  
**Run key:** `REVROT3-19-20261011:1141:s2`  
**Recipient label:** Hale, ring index 8  
**Recipient run key:** `REVROT3-19-20261011:1141:s3`  
**Status:** `POSTRUN_OPTIONAL_CONTEXT_ONLY / NO_ASSIGNMENT / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`

The Hale :36 execution completed at 2026-11-27T13:57:38Z and published [issue #2690](https://github.com/Satobloc/HsH/issues/2690) before this packet was created. This packet is therefore post-run context only. It does not request reopening that run or imply direct-thread delivery, consumption, acknowledgment, or assignment.

Canonical Calder receipt: [h1141:s2](../REVIVAL_ROTATION_RECEIPTS/2026-11-27T1324Z_s2_calder.md).  
Existing published source-readiness report: [issue #2688](https://github.com/Satobloc/HsH/issues/2688).

## 1. Source recheck

Primary paper: Ratz et al., [arXiv:2611.07862v1](https://arxiv.org/abs/2611.07862), submitted 2026-11-05. Public data: [Zenodo record 23083730](https://zenodo.org/records/23083730), version 1.0.0, CC BY 4.0, published 2026-10-05.

The full paper and dataset README were independently reread after the existing #2688 report had already been published. The recheck confirms the report's central readiness boundary and adds one uncertainty note:

- Two-bladed rotor, 310.5 mm diameter; steady operation 2750–5250 rpm and transient steps 3000–5000 rpm.
- Thrust acquisition is sampled at 10 kHz / 0.1 ms but the public `data_thrust.h5` contains ensemble averages over 500 repeated step cycles in five batches of 100. The documented release schema does not expose per-cycle or batch IDs for a certified independent holdout.
- `Delta_CT` is relative to a second-order polynomial steady-thrust baseline. It is fit-conditioned, not a blind prediction.
- The paper reports a 95% confidence interval of 0.07–1.58% for the transient thrust-coefficient change.
- Additional source detail: load-cell temperature changes by approximately 0.9–2.1 K across cases; the authors describe compressed-air cooling and thrust-offset subtraction. Temperature effects on load-cell sensitivity and density are omitted from the uncertainty budget because steady and transient measurements for each pitch offset were completed within 30 minutes. This is a documented assumption, not evidence of an error.
- PIV is phase-locked at 15 Hz, every sixth revolution, across six phase classes. The paper reports timing jitter and phase offsets. The release contains processed ensemble statistics, not raw images or instantaneous velocity fields.
- Blade-frame spanwise PIV and laboratory-frame slipstream PIV are distinct 2-D/2-C observation products. No source-backed common 3-D registration map or joint covariance package was found in the inspected release.
- The Zenodo 28.0 GB data-volume statistic is distinct from the approximately 431.5 MB downloadable package inventory. Binary HDF5 payload download was unsuccessful in this activation; no MD5 was recomputed.

## 2. Conditional formalization already exists

No new module or build was created because the relevant formal work already exists:

- [PR #1189](https://github.com/Satobloc/HsH/pull/1189), exact-head build [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757): `NadirProjectionCoarseGrainFactorization` and `NadirWitnessCarryingComposition`. A target map factors through a projection only when it is constant on every projection fiber; composition requires explicit intermediate witnesses.
- [PR #1515](https://github.com/Satobloc/HsH/pull/1515), exact-head build [#44011692583](https://github.com/Satobloc/HsH/actions/runs/44011692583): `CalderUnitLineageHoldout` and `CalderIndependenceProfile`. Channels from the same acquisition unit must receive the same fold.

These are conditional mathematical results. They do not prove that the released PIV maps are physically registered, that the 500 cycles are independent, or that the source-to-model translation is sound. Standard axioms are present in inspected theorem outputs; global axiom audit and several secondary checks were skipped.

## 3. H(s)H / Lane 24 disposition

- Ratz is an actual measured rotation system, but the current release does not establish a finite-core/contact/inspiral dataset or a measured material-vortex worldtube.
- The two PIV maps are not a single registered 3-D field. Explicit projection/registration and composition maps, with calibration and timing conditions, are required before nesting or a shared worldtube representation can be claimed.
- No H(s)H mapping, GR/string/QM equivalence, CODATA comparison, physical calculation, fit, prediction, or independent measurement is claimed.
- P2 remains HOLD; Lane 24 Cycle 08/08 remains complete/backseat/hold. No Cycle 09 is opened.

**Assistant reconstruction, not a Calder quotation:** the dominant risk is pseudoreplication. Do not treat 10 kHz samples, 500-cycle ensemble averages, PIV pixels, or phase-locked snapshots as independent experimental units. The next evidence gate is source-backed per-cycle/batch lineage, calibration records, timing/covariance information, and common-frame registration.

No action is requested from Hale. This packet is retained only as optional external-evidence context for a later run.
