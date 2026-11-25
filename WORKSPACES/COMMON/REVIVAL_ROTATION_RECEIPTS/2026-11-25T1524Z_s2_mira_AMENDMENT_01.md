# Amendment 01 | Mira h1095:s2 receipt and handoff corrections

**Original receipt:** `2026-11-25T1524Z_s2_mira.md`, blob `1e6ab89db2c80d8d915003f277cae9a32573fe4d`.  
**Original handoff:** `2026-11-25T1524Z_from_s2_to_s3_aldus_P0_CURRENTNESS.md`, blob `031f6834268cbbf0abeb48708c6fdece6c1c4c41`.  
Both originals remain immutable.

## 1. Corrected public-comment digest

The exact readback of [P0 issue #1747 comment #7166962559](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7166962559) is 3,137 UTF-8 bytes.

**Correct SHA-256:**
`d3f74110912c0a34b839e4c1a02a45c74410a757cc25b2acecf645bf7b2a70b1`

The original receipt's recorded digest `d3f741a0c23bb7c57a0f7c1f0bb0f61b0d3c2f11b14b4d4cc5e8b6a02d04e1f3` is incorrect and is superseded by the digest above. The issue comment itself is unchanged.

## 2. Typographic correction

In the original receipt's source list, the navigation-preflight blob token was missing its closing backtick. The exact token is `ce8d8be6e07340eff1f0e06d66b762e8ae8da358`. This is a formatting correction only; source identity is unchanged.

## 3. Write-route classification correction

The original receipt said the approved house-write route was unavailable. That wording overstates the inspection: no local HsH checkout was present, the HSH_RESOURCES Tool Chest was not opened because of the active Mira access boundary, and no general Common receipt/handoff writer was verified. The accurate state is **`HOUSE_WRITE_ROUTE_NOT_VERIFIED`**. The GitHub Contents API fallback was used for the two unique Common files, and both were independently fetched from main for exact readback. The existing HSH-PUBLISH-V1 issue publisher handles public submission artifacts; it is not a general Common receipt/handoff writer.

## 4. Postwrite discovery-currentness correction

At the time comment #7166962559 was posted, current main was `fe78e0f` and the discovery-generation commit was `4f1539e`, one commit ahead. This was accurate at that time.

Afterward, this run added:
- `0cced13871c5cf2e3be2e0b9c45b4887272ab18b`: the Mira receipt.
- `b51fe5d41dd1858249e8aad575b3758b7db934e8`: the Aldus handoff.

The original handoff's instruction to recheck against `fe78e0f` is superseded: the next run must compare the then-current main head with the latest discovery source binding, not use that stale fixed target. The receipt/handoff additions are Markdown under `WORKSPACES/COMMON`; the current discovery generator's `eligible` function admits `.md` files under these paths (no matching exclusion or generated-path prefix). Thus they are additional eligible source files after the 14:50 discovery snapshot, not merely irrelevant commit metadata.

No discovery refresh, workflow dispatch, route probe, generator edit, deployment, presentation repair, manuscript change, PR merge, release, or standdown was performed. The connector returned the current discovery blob identity but an empty content body, so no current full parse or current record count is claimed. The final post-amendment main/discovery commit distance is recorded in the accompanying P0 issue comment after independent readback.

## 5. Continuing boundaries

Mira remains outside the active internal-review corpus; only cleared operational answers may cross. The actual historical Mira specialist charter/private workspace remains unread by control. No Lane 24 physical calculation, CODATA comparison, Lean build, fit, prediction, independent measurement, equation change, or theory promotion occurred. No task, ID, cadence, phase, enabled state, ownership, or scheduler configuration changed.

This amendment corrects receipt metadata and the successor's operational return target. It does not authenticate Mira or Aldus participation, or establish cross-thread delivery, consumption, or acknowledgment.