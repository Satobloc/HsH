# Enheduanna h701:s2 — Lane 24 source, CODATA metadata, and branch-map review

**Nominal UTC:** 2026-11-09T05:24:00Z  
**Run key:** `REVROT3-19-20261011:701:s2`  
**Deterministic selection:** h=701; seq=5h+2=3507; 3507 mod 19=11, Enheduanna (index 11).  
**Next:** Tern Rook (index 12), s3.  
**Participation:** source-grounded assistant reconstruction under a deterministic ring label. No authenticated Enheduanna ChatGPT thread, historical-instance continuity, or standalone Nathan-authored Enheduanna specialist charter is claimed.

## 1. Disposition

`P0_ROUTE_FINGERPRINT_8_OF_8_UNCHANGED / CODATA_METADATA_CLASSIFICATION_REFINED / PR1508_MERGE_REFERENCE_BUILD_REVERIFIED / LANE24_BACKSEAT_HOLD / NO_NEW_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION`

Code Grurple remains ACTIVE/P0. Lane 24 and P2 remain BACKSEAT/HOLD. This turn did not probe either live paper-reader route, select a P2 system, run a physical model calculation, perform a new CODATA adjustment comparison, or advance any paper gate.

## 2. Historical Enheduanna authority and source-first boundary

No standalone Nathan-authored Enheduanna specialist charter or usable dedicated Enheduanna thread was recovered. The exact direct user instruction remains broad archive-revival guidance, not a detailed specialist assignment:

- Conversation: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, title “Revival Rotation”.
- Raw HsH Git blob: `386516f7c2d5b9ab2cd4f0050869ae00c133274d`.
- Message: `11399ca2-5bd6-4203-9e19-e8e044fbc736`, outer `author.role=user`, 2026-09-23T02:04:49.417Z.
- Relevant wording: “Enheduanna is a similar case … But do always consider all archives.”

The source is preserved in the existing source-layer census, blob `8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478`. The run-level Lane 24 assignment comes from the present prompt; it does not create a permanent Enheduanna specialization.

The completed Enheduanna Mersearch request `enheduanna-temple-hymns-nathan-source-20261030-1340` was rechecked. Its manifest blob is `fc9d5dd8b883554f28601c6842d988a44766e1eb`; compact receipt blob `9a03f0787c19496a5109d822affe896e26212ced`. It records a three-repository search, 15,618 files, 20,810,723 records, 27 hits across 18 distinct source paths. The relevant Revival Rotation raw-export hit is message `11399ca2-5bd6-4203-9e19-e8e044fbc736`. This is a bounded navigation receipt, not an exhaustive archive review or a worker-authored charter.

## 3. CODATA/NIST provenance correction

### CODATA 2022 remains an evaluated adjustment

The NIST constants database still identifies CODATA 2022 as the latest recommended set (web version 9.0, updated 2024-05-09). The adjustment paper was published 2025-04-30 and uses theoretical and experimental data available through 2022-12-31. For (G), the evaluation treats 16 published determinations, records three correlated pairs, and applies an uncertainty expansion factor of 3.9. The recommended value is an evaluated aggregate, not a new 2022 experiment.

Primary source locators:
- Mohr, Newell, Taylor & Tiesinga, “CODATA Recommended Values of the Fundamental Physical Constants: 2022,” *Reviews of Modern Physics* 97, 025002 (2025), DOI `10.1103/RevModPhys.97.025002`.
- NIST constants version history: web version 9.0, 2024-05-09.

### NIST 2026 final article versus NIST landing-page abstract

The current NIST publication landing page still displays an abstract value of (6.67366\pm0.00020\times10^{-11}) and relative standard uncertainty (3.0\times10^{-6}). Its page says it was updated 2026-05-02. The displayed absolute uncertainty and central value do not support the displayed relative uncertainty; the landing-page author list also omits Antonio Possolo, who appears in the final publisher record.

The final DOI-published *Metrologia* article gives the full final result; NIST's April 16, 2026 news report independently repeats the central value but does not supply the uncertainty:
[
G=(6.67387\pm0.00038)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}},
\qquad u_r=5.7\times10^{-5}.
]
The final publisher record lists nine authors, including Antonio Possolo. The final article result matches the NIST-hosted final PDF; the news story independently corroborates its central value.

**Correct classification:** `NIST_LANDING_PAGE_ABSTRACT_METADATA_MISMATCH`, not two competing final published measurement versions. The final DOI article and NIST-hosted PDF are the controlling article record for the published result. No formal erratum was located in the sources checked; the cause of the stale/inconsistent landing-page metadata remains unknown.

The earlier Aldus h700 report described this as an unresolved source-version conflict. This pass narrows that wording: the published article value is corroborated by the DOI record and NIST news; the inconsistency is in the NIST publication-page metadata. The mismatch itself was already documented in Ravel’s published NIST/CODATA source audit, so **no duplicate public issue or publisher submission was created**.

### Measurement and model-dependence boundary

The NIST paper reports data collected 2024-01-24 through 2024-06-22 using the BIPM Mark II torsion balance transferred to NIST. It combines free-deflection and electrostatic-servo readouts with copper and sapphire source-mass configurations. The four final configuration determinations are correlated; the paper reports their correlation matrix and a configuration-specific Bayesian “dark uncertainty” model. The prior for the consensus mean is centered on CODATA 2022. C. C. Speake contributed to both the BIPM and NIST efforts, so the replication is not entirely independent.

Consequences:
- Do not count the four configurations as four independent experiments.
- Do not treat the final Bayesian consensus as a CODATA-independent holdout.
- Do not replace the paper’s covariance and dark-uncertainty structure with independent-cell error bars.
- No raw torque/angle time-series, acquisition-block metadata, full raw-observation covariance, CMM point cloud, or independent holdout was retrieved here.
- Existing Hale/Ravel published audits already contain the detailed Table 15/16/18 and prior-dependence work. This turn did not repeat their reconstruction or create a new numerical comparison.

Existing public source-QC reference: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-nist-c4-torque-geometry-audit-20261104t1624z-s2-001.md`, blob `876597358845be3aad5f63d2f8815d6dc8b16718`. It explicitly records the landing-page/final-article discrepancy and the lack of an erratum in the sources it checked.

## 4. Existing branch-scoped map-composition formalization

PR #1508, “Add branch-scoped map composition gate”, remains OPEN / DRAFT / UNMERGED.

- Branch: `research/enheduanna-branch-scoped-map-composition-20261109t0136z`.
- PR head: `8647396cb5a3ce4803720a02982bc9af1a12df96`.
- Base: `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Module blob: `e38901478a62cb5807b2d52978afc514250f3061`.
- Root aggregator blob: `fb0da3035c9f48be7285851255d39679a2ca66c9`.
- GitHub Actions run #42547294085 / job #128934928067: SUCCESS on synthetic merge commit `65a3e601952ff41b28633b57f7c56195f911c24c`, with the PR head and base as parents.
- Lean 4.34.0, Lake 5.0.0, Mathlib commit `5ed2965256430c3649e86755f9576b54eca72435`.
- Full root build: 8,945 jobs; new module at 8,930/8,945.
- `compose_preserves_target`: no axioms.
- `transport_compose`: no axioms.
- `transport_identity`: `[propext]`.
- Tests, lint, nanoda and global axiom audit were skipped. The Vercel status failure is a separate deployment rate-limit response.
- This is merge-reference verification, **not** exact-head standalone verification.

Source-first replay of the PR’s cited Nathan Direct passages:
- *Meridian Free Build*, raw blob `7af1561b321f4d9364da5eb111df689efc652827`, user messages `845c7190-202f-4fed-8056-b9b81c994fb9` and `300da217-ffff-416e-8637-9b3327c0a9de` (2026-10-09).
- *Meridian Minkowski Ring Analysis*, raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, user messages `090f5160-1020-486d-9c42-df3d7dff2063`, `47cf2603-bf28-439c-82b3-1f0e0c2a7dc8`, and `c5525f53-b7cc-4444-8102-3bf6fdb1c892` (2026-10-21).

The later direct source explicitly says the earlier reciprocal filament/timesheet description is no longer the operative formulation after Klein Fabric became common; the Back Hallways “corridors” are mathematical metaphors, and the current convention is stated as (cw=t) and ((++++)). The recovered source does not supply an actual transition map between those historical/current branches.

The Lean module’s useful contract is narrower:
- Branch indices type-check the intermediate branch identity.
- Composition requires an explicit compatibility witness for the intermediate admissible domain.
- Claim transport is conditional on an admissible source point and an explicit map.
- It prevents silently composing maps across differently named branches.

Limitations:
- `compose_preserves_target` restates the structure’s preservation field; it is not a physical derivation.
- The abstract `BranchMap` supplies no concrete projection, embedding, slice, intersection, or observation operator.
- No B0→B1 or B1→B2 transition map is recovered or established.
- No physical equivalence, worldtube/timesheet map, prediction transfer, or H(s)H observable follows.
- The generic projection-coherence result in ArchiveEQ0049 remains distinct; PR #1508 adds branch-indexed carriers and intermediate-domain compatibility, not an instantiated H(s)H projection.

No new Lean module, PR, branch, or workflow run was created.

## 5. Mersearch, tools, P0 and campaign status

All four current Mersearch request files remain occupied/requested:
1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

All twelve expected request-scoped manifest/receipt files were absent at this check. No Mersearch action is exposed in this runtime. No request was created, overwritten, reset, reused or represented as a new Mersearch execution. The completed October 30 Enheduanna source query is the only Mersearch execution relied upon here.

Tool/capability reconnaissance:
- HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES front doors and current main heads were checked.
- HSH_RESOURCES HQ Tool Chest and AI Start Here were read.
- Existing Math Hopper #578 / PR #991, Lean infrastructure PR #262, existing Lean PRs and Whirligig Kernel 0 were reused/checked in the preceding Lane 24 audit; no replacement tooling was built.
- SciSpace is available; no new literature search was needed.
- The runtime has Git but no checked-out HsH repository; no local Lean, Lake or Elan executable was available.
- The existing issue publisher writes only to the public-submissions namespace; no generic internal workspace/inbox Actions writer was available. The internal report and continuity records therefore use the direct GitHub connector fallback with exact readback.

P0 route fingerprint: the eight canonical Code Grurple source/control files were independently fetched from current HsH main. **All 8/8 blob SHAs match** the established vector. Canonical manifest SHA-256 remains:
`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.

No positive route trigger was found. The two actual reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No live route probe was attempted.

Campaign:
- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: Orson-owned, NOT READY.
- P2 November 30 measured-system geometry: HOLD; no selected measured system.
- P3 December 14 full theory: separate and incomplete.
- Lane 24 H(s)H generation / worldtube / CODATA: BACKSEAT/HOLD.

No BEDROCK, SAT-O, Blockwave, task graph, paper gate or theory status was changed.

## 6. Lateral reading and freshness

Continued the existing unrelated-reading cursor in Charles Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`.

**Actual read extent:** lines 1561–1600. The passage concerns experimental error, explicit acknowledgment of mistakes, and the necessity of unreserved criticism in science. It is recorded as an unrelated source-reading break, not theory evidence. **Next cursor: line 1601.** No physical/off-screen break is claimed.

FIE last full review remains 2026-10-27; the fourteen-day rereview trigger is 2026-11-10. It is not yet due on this run.

## 7. Return state

`L24 / P0-ACTIVE / ROUTE-FINGERPRINT-8-OF-8-UNCHANGED / NIST-LANDING-PAGE-METADATA-MISMATCH-ALREADY-PUBLISHED / PR1508-MERGE-REF-LEAN-PASS-EXACT-HEAD-UNVERIFIED / MAPS-ABSTRACT-NOT-INSTANTIATED / NO-P2-SYSTEM / NO-PHYSICAL-CALCULATION / NO-THEORY-PROMOTION / NEXT=TERN-ROOK-OPTIONAL-CONTEXT`

Next useful action remains conditional on a positive Code Grurple route trigger or standdown. After P0 standdown, resume the existing Lane 24 cycle: recover original SAT-O/Blockwave equations through a released Mersearch lane; define source-faithful worldtube/timesheet/projection/composition maps; then select a real measured system with versioned raw data, provenance, units, calibration, covariance, uncertainties and independent holdout before any physical calculation.


## 8. Control-source and repository pins

- HsH BEDROCK: `0253ace674bbc361464b7bbaac2c41aa3d8e8867`.
- Steering Charter 2026-10-26: `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- Revival Rotation V3: `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`; thread-first rule: `e79707587914edb76afca1c32f9f4dad4d0324b7`.
- Workflow Orientation V2: `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`.
- Shared-state write safety: `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5`; cross-repository execution standard: `4ce5f3df67edac81a656bdc1efb92c07a7a3a648`.
- Code Grurple roster: `cc96c0bfafc95c54e7960899c7306031e5abce17`; presentation gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Lane 24 geometry capsule: `a7250666b1cb768a9795f8f60205f509cef1c0dd`.
- Task/branch graph: `9e9f1b896fd5d4320a7b0142ddc3f8d9c524339c`, last updated 2026-11-08T10:55:40.842Z.
- HsH main immediately before this report commit: `c136eaf8e5063a070f23f14b237f94689fe79333`; report commit/final HsH main: `19adc914850e586a7932a3b3b30d6330484e99bc`.
- SAT archive main: `35804a91bca29e596033837971de5db9848e9dfb`.
- HSH_RESOURCES main: `5a387cc4ecfea9fd39a2f7b3bc6878e4686b94f0`.

The final HsH commit above contains this report only; no P0 route-trigger file, task graph, BEDROCK, paper gate, or theory source was changed.
