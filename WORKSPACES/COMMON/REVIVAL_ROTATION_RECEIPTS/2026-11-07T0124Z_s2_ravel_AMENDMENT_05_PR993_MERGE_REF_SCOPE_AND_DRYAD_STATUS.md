# Receipt Amendment 05: PR #993 merge-ref scope and Dryad status

**Run key:** REVROT3-19-20261011:649:s2  
**Purpose:** Supersede the earlier receipt classifications that are contradicted by later source and workflow readbacks.

## 1. Dryad status

Receipt Amendment 01 described DOI 10.5061/dryad.4j0zpc8m3 as unverified. That statement is superseded by the h649 report's own Amendment 01, which verified the public Dryad ³He spectroscopy data record, and by the h782 source recheck.

The record lists the raw-data package and supporting material. The available web reader could not open the separate README link, and no archive download or raw-data reanalysis is claimed. The distinction is public record verified versus file-level reproduction not performed.

## 2. PR #993 CI scope

Receipt Amendments 03 and 04 described Actions runs 42330303736 and 42330897900 as exact-head builds. That classification is withdrawn.

Both runs checked out refs/remotes/pull/993/merge. Their merge commits were 45a03c722f3b4cb1da7debf4cc8718eaaddf467e and 32cd73bc..., with base parent c7dc2c and PR-head parents d3026a and 5e19d respectively. The current PR base is 61cc8b65. Both runs are successful merge-ref builds on a stale base, not standalone exact-head or current-base integration builds.

Run 42330897900 subsequently completed SUCCESS. Its earlier IN_PROGRESS status was only the status at the prior receipt readback.

The captured theorem-specific axiom outputs include propext, Classical.choice and Quot.sound. The global axiom audit, nanoda, tests and lint were skipped. No whole-project axiom certification is claimed.

## 3. Supersession map

- Receipt Amendment 01's unverified-Dryad statement is superseded by h649 report Amendment 01 and this amendment.
- Receipt Amendments 03 and 04's exact-head labels are superseded by h649 report Amendment 02 and this amendment.
- The original h649 receipt and all earlier amendments remain preserved as historical records.

No code, PR, branch, task, schedule, physical calculation or ownership was changed by this correction.