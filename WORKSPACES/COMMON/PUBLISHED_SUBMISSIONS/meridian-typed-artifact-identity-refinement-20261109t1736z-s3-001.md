# Code Grurple typed artifact identity refinement
Date: 2026-11-09
Status: DRAFT PR; MERGE-REFERENCE LEAN BUILD VERIFIED; LIVE READER ROUTE NOT OBSERVED

## Change
The existing draft PR #1471 now replaces a single untyped natural-number artifact token with distinct identifier types for Git blob SHA-1, Git commit SHA-1, SHA-256 content digest, provider-scoped deployment reference, and provider-scoped reader-route reference.

The model checks lowercase-hex digest shape (40 characters for Git SHA-1, 64 for SHA-256), nonempty deployment/route references, exact typed edge bindings, and agreement between deployment and route namespaces. It adds blockers for malformed digest shapes and empty references. Two examples check the lexical form of the current Paper A source blob and paper-feed blob identifiers.

This is a refinement of the existing observation-gate formalization, not a new tool or a change to either manuscript.

## Actual Lean verification
The existing GitHub Actions workflow completed run #42667731836, job #129335772337, with SUCCESS. Lean 4.34.0 and Lake 5.0.0 were used with Mathlib revision 5ed2965256430c3649e86755f9576b54eca72435. The full root build completed 8,945 jobs; the new CodeGrurpleObservationGate module built at 8,927/8,945.

All 22 theorem-specific #print axioms outputs were inspected. They use propext, Classical.choice, and Quot.sound as applicable; github_pages_ne_chatgpt_sites reports no axioms. No sorryAx appeared in this module's outputs. The separate test, lint, nanoda, and global axiom-audit steps were skipped. Two unrelated unused-variable warnings occurred in ArchiveEQ0004; the new module emitted no warning.

The workflow log records GITHUB_SHA=cd2e5a391483cc8a8d2f52e136e5fa7d2db52f0e, the synthetic PR merge commit containing PR head 206cb9b1bb5349bba6aaad031d2a8b578c25197b. This is a successful merge-reference build, not an exact-head-only build. PR #1471 remains OPEN / DRAFT / UNMERGED. A separate Vercel build-rate-limit failure is unrelated to Lean.

## Critical limits
The Lean model checks only the formalized transition system. It does not compute hashes from bytes, verify that an externally supplied digest belongs to a repository object, observe a deployment, authenticate a browser, or establish that a live reader route renders. The external workflow must independently compute each digest and bind it to the actual object. The model is not a physical H(s)H theorem.

## Current presentation status
The eight-file Paper A/B source, feed, presentation-gate, reader-registry, contract, generated-index, and Pages-workflow fingerprint remains 8/8 unchanged. A branch comparison from baseline b3f788e70cb3ada80793beaa6879c600979e0aaa to current main ac5950111645a0a16f40437a646df3cd9429838b covered 306 commits and 157 changed paths, with zero overlap with those eight P0 files.

No authorized browser/Sites editor/owner-preview context was available, so no route probe was made. Both Paper A and Paper B routes remain PRESENTATION_PENDING / NOT_OBSERVED, not failed. The GitHub Pages workflow for Conversation Viewer/Whirligig is not evidence of a ChatGPT Sites deployment.

No manuscript edit, physical calculation, empirical prediction, paper-gate advancement, or theory promotion occurred.
