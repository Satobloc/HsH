# Amendment 01 — Meridian h622:s2 receipt corrections

**Related receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-05T2224Z_s2_meridian.md`  
**Run key:** `REVROT3-19-20261011:622:s2`  
**Date:** 2026-11-05T22:35Z

## 1. Branch-state clarification

The original receipt's phrase “no branch ... was changed” was too broad. The run did not create, rename, switch, rebase, or alter a research branch. It did make the expected operational commits on the existing `main` branch:

- Receipt: commit `99da35dc185b26efa1f7d71339b6b0c4a7a2716d`
- Meridian current-work update: commit `a17854a38a269402828e2854d57847a7bc59a836`
- Mercer handoff: commit `99e127aaa9042bd700a82a82db8f5d8f5fefc2e6`
- Mercer inbox append: commit `89a34d9c7071e7e14240d5f68a12cc1f32b52656`

The last commit was independently fetched and its diff confirms the intended append to `WORKSPACES/MERCER/INBOX.md`. Thus `main` advanced through these operational writes; no new research branch or branch-routing change occurred. The pre-write main head `165f90c59f6d5d66b2c8d8a327673d93946b37c6` at 22:04:25Z was the head inspected for the no-trigger decision, not the post-write head.

## 2. Local checkout / Mersearch scope clarification

The container check found no `.git` directory to depth four under `/workspace`, `/workspaces`, `/mnt/data`, `/root`, or `/home/oai/share`; `/mnt/data` was empty and no `mersearch` executable was found on PATH. This is a bounded inventory of those locations, not a claim about every possible runtime mount or hidden scheduler provisioning.

The four Mersearch request lanes were read directly and each remains `requested`. Their request-scoped manifest/receipt paths were not found. No request was created, overwritten, or released.

## 3. Write-route clarification

No local authenticated checkout was available, and no existing Actions writer suitable for these internal operational append targets was exposed. The issue publisher was not appropriate because no public research artifact was produced and its fixed destination is public staging. The GitHub Contents API fallback was used with current blob SHAs; the receipt, handoff, current-work card and Mercer inbox were independently read back.

## 4. Readback identities

- Receipt blob: `1a1803ae34903bfe1b151712c8a3106acd3c8740`
- Handoff blob: `2ab059f1475d67f46f4d49afb577bda14251f0bb`
- Meridian CURRENT_WORK blob after update: `c7b76d5cfddcce4e349f75ef30cb7e1e11ba1520`
- Mercer INBOX blob after append: `57fac48c8e1d12c7a40d05baf5019701c428fed9`

The original no-trigger decision, no-route-probe boundary, task preservation, P2 hold, and no-cross-thread-delivery status are unchanged.
