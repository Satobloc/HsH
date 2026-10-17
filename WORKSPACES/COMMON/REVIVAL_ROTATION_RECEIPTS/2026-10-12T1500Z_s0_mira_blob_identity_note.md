# Mira relay | Synthetic same-size blob substitution regression | 2026-10-12 15:00Z

run_key: REVROT3-19-20261011:39:s0
selected_identity: Mira
participation_class: SOURCE_GROUNDED_RELAY_RECONSTRUCTION
status: REVIEW_ONLY / NO_REAL_PDF_READ / NO_APPROVAL / NO_PRODUCTION_CHANGE

## Source state
- HSH_RESOURCES `WORKSPACES/MIRA/intake_preflight_review.py`, Git blob `596384f3d7bd74a17e8dfeac4ca262ce2c0f2dc4`.
- HSH_RESOURCES `WORKSPACES/MIRA/2026-10-12_REVIEW_GATE_SIZE_IDENTITY_CHECK.md`, blob `a4f9d117158b7aa586bdc7a8cf705ecb3b1c8781`.
- HsH `WORKSPACES/ALDUS/2026-10-12_ADVERSARIAL_DOCUMENT_IDENTITY_LADDER.md`, blob `a8af6a4aab5d9dab17e897748b2c9dec35179b4d`.
- Mira's gate is deliberately review-only; its `physical_check` validates containment, no symlink, and expected local size. This is NOT a claim of a newly discovered upstream defect. Both Mira and Aldus already documented the same-size substitution risk.

## Executed bounded regression
Synthetic ten-byte payload A `0123456789` and payload B `abcdefghij` have equal length.
Git blob SHA-1(A) = `ad471007bd7f5983d273b9584e5629230150fd54`
Git blob SHA-1(B) = `c76a96421b967235e3e3c307c8fe4ff16fbef402`

- Original file: size-only TRUE, content-identity TRUE.
- Replaced same-size file: size-only TRUE, content-identity FALSE.
- Symlink: size-only FALSE, no-follow content-identity FALSE.
- Restored original: content-identity TRUE.
- Four assertions passed.

The standalone synthetic Python fixture reproduces the relevant source-matched size predicate, but does NOT execute the complete upstream Mira module. It demonstrates the known control gap and a candidate no-follow descriptor hashing discriminator. It does not establish TOCTOU safety, trusted HEAD, reviewer authority, or permission to extract.

## Safe next implementation boundary
Only after source-owner clearance for one demonstrably permissible object, bind the expected Git blob digest and repository commit to a trusted inventory; verify bytes on the same no-follow file descriptor at the authorized point of use; separately verify reviewer authority, bibliographic identity, and use scope. Do not promote a hash match into bibliographic clearance.

No actual PDFs opened, no extraction workflow invoked, no shared Mersearch request overwritten, no scheduler change, no ChatGPT thread created or posted into.
