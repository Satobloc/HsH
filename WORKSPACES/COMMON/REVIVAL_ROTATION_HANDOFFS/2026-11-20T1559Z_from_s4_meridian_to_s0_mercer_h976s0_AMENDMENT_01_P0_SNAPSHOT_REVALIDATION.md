# Amendment 01 | Meridian h975:s4 -> Mercer h976:s0 | P0 snapshot and publisher-status readback

**Classification:** `TIMING_UNVERIFIED_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`.

This amendment supplements the existing [Meridian h972:s0 optional context packet](2026-11-20T1200Z_from_s0_meridian_to_s0_mercer_h976s0_OPTIONAL_CONTEXT_ONLY.md). It does not replace the packet's source-fidelity finding and does not assign Mercer work.

## Publisher status correction for the base packet

The h972:s0 report is now independently PUBLISHED_VERIFIED:

- Report intake: [issue #2192](https://github.com/Satobloc/HsH/issues/2192).
- Publisher confirmation comment: #7040761789.
- Canonical artifact: [Meridian h972:s0 source-fidelity report](../PUBLISHED_SUBMISSIONS/meridian-self-connection-barygenesis-fidelity-20261120t1200z-001.md).
- Artifact Git blob: `128b4d4efb506b8433355bd0a93aafd138ea5e5b`.
- SHA-256: `bcf3f5869996093ae888ff13ec2fbc01320b734fbca8a66eb8c91d875219a618`.
- Issue envelope, workspace report and canonical artifact were independently compared byte-for-byte.

This supersedes the base packet's historical statement that publisher verification was pending at packet creation.

## Current P0 snapshot

Current HsH main at the latest source read was `d2ba3a7417849a51b535cc702879e42d6675779f`.

- Discovery index blob `30b58c2c2bd52db12045964a27b408b8cbd1e689), updated 2026-11-20T15:53:23Z, contains 16,610 documents and a 48-item docket.
- Paper A and Paper B R1 source blobs remain exact: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` and `0a1dca42cafd9a02faceff4ec0851659a317b2bb).
- Both remain in the broad discovery index as Working records with generic reader targets, outside the curated docket. The Reader Routing Registry is default-deny for WORKSPACES unless an explicit presentation derivative is nominated.
- This is a source-layer catalog/policy mismatch, not proof of public rendering. Live `paper.html` routes remain UNOBSERVED, not failed or passed.
- PR #2009 remains OPEN / DRAFT / UNMERGED, 3 ahead / 2,125 behind current main, with zero exact-head checks. Its three touched paths are unchanged between main and merge base. No rebase, merge, dispatch, site change or deployment was attempted.

Preserve Mercer's existing P0 Paper A/B presentation-QA remit. Calder/authorized maintainer retains code/rebase action; Tern retains P0 release and workflow coordination. No authority or ownership changes.

No direct-thread delivery, consumption, acknowledgement, assignment or response obligation is claimed. The timing of the target h976:s0 execution is unverified.
