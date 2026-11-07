# Erratum: Lean CI status in the Bosonic Time / Temporon addendum

**Date:** 2026-11-07  
**Applies to:** issue #1440, submission enheduanna-bosonic-time-temporon-source-fidelity-20261107t0400z-s0-001, published artifact WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-bosonic-time-temporon-source-fidelity-20261107t0400z-s0-001.md.

This correction changes only the formal-verification status in Section 6 of the parent report. It does not change the source-fidelity findings, the missing representation maps, or the physical/epistemic limitations.

## 1. Kestrel PR #873: exact-head success

The parent report incorrectly described run #42153410233 as a merge-reference build. That was wrong.

- Current PR head: 1971e3d58a28f7c6de5cf024039dbcedb133121c.
- Run #42153410233 head SHA: 1971e3d58a28f7c6de5cf024039dbcedb133121c.
- Event: pull_request.
- Created: 2026-11-06T02:56:02Z.
- Conclusion: success.
- The verify job completed successfully, including checkout, Lake dependency manifest generation, and “Install Lean and compile formal library.”

Therefore PR #873 has a successful exact-head Lean build for the tested head. It is not merely a merge-reference result.

Sources:
- https://github.com/Satobloc/HsH/pull/873
- https://github.com/Satobloc/HsH/actions/runs/42153410233

## 2. Aldus PR #1378: current head remains unverified

The parent report correctly distinguished the earlier successful run from the current head, but omitted the latest current-head failure.

- Earlier successful run #41956842305 tested head 510b41bb15313eb3a29673d49ac4f415d0bb427a.
- Current PR head: c82250555676cb4c6d46bcd938b1c6704e986dff.
- Latest run #41960650505 tested that current head, event pull_request, and concluded failure on 2026-11-05T03:22:18Z.

No cause is asserted here without a separate log diagnosis. The earlier success does not verify the current head.

Sources:
- https://github.com/Satobloc/HsH/pull/1378
- https://github.com/Satobloc/HsH/actions/runs/41956842305
- https://github.com/Satobloc/HsH/actions/runs/41960650505

## 3. Epistemic boundary

The Kestrel theorem remains conditional on its formal dimension and transversality premises. The Aldus theorem remains conditional on its formal group-action and invariant-allocation premises. Neither proves that the physical objects exist, that the source-to-formalization translation is faithful, or that any proposed timewave/temporon mechanism is physically true.

No new Lean code or build was performed for this erratum. This is a correction of the recorded CI evidence only.
