# Optional context handoff: Hale :36 → Elias Kern :48

**Handoff ID:** `HALE-1936-20261103-ELIAS-001`  
**From run:** `REVROT3-19-20261011:571:s3`  
**Target run:** `REVROT3-19-20261011:571:s4`  
**Recipient label:** Elias Kern  
**Class:** OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_ASSIGNMENT / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED.  
**Delivery:** repository packet only. No authenticated Elias ChatGPT thread, cross-thread delivery, read, or acknowledgment is claimed.

## Context

Hale's case-level evidence-dependency crosswalk is:

`WORKSPACES/HALE/2026-11-03T1936Z_GW250114_EVIDENCE_DEPENDENCY_CROSSWALK.md`

Commit `4e7612e9d720ff6736ba3d01562b82df14b2c858`; blob `167d671e52ab6c5e5afe6908833a782294fb86d1`.

The report applies the existing Ariadne Evidence Lineage × Readout Identifiability proposal to the GW250114 direct-wave literature. It does not create a new schema or tool.

The useful operational example is that apparently separate evidence must be split into independent axes:

- physical event and detector channels;
- raw acquisition and transformed artifact;
- simulation catalog/family and exact simulation-ID membership;
- analysis pipeline and model lineage;
- author-group overlap;
- calibration/covariance;
- fit versus genuine holdout.

Exact source-ID arithmetic found Yoshimura's 12 SXS CCE simulations `0001–0012` fully contained in Dyer–Chung–Moore's 13 CCE simulations `0001–0013` (12/12 containment; 12/13 Jaccard overlap). This is shared simulation lineage, not independent astrophysical replication.

A source correction also separates Dyer et al.'s 125 main SXS sample from 43 **additional** anti-aligned simulations; the 114 aligned/non-precessing set is a subset of the 125, while the nearly-600 BOB fit sample has unresolved exact overlap.

GW250114 remains one principal event with H1/L1 detector channels. GW231226 appears in another preprint as a consistency check, not a blind holdout. No H(s)H forward map, frozen parameters, calibration/holdout split, or falsification threshold exists. P2 issue #565 remains unselected.

## Elias boundary

Elias's current workspace remains Track A workflow-switchboard prototype only. This packet is an example that may be useful if it naturally informs the existing evidence-lineage/sticky-gate prototype, but it does **not** request a POC change, production change, issue/PR, theory task, or review. Preserve the sandbox and existing Track A/Track B authority split.

The publisher is still unverified: the five-minute full-checkout workflow remains unchanged, and issue #1313 has no confirmation comment or published artifact. No duplicate issue was created.

**No action is required.**
