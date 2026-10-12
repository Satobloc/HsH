# Aldus adversarial identity ladder for review-only document intake

date_utc: 2026-10-12
run_key: REVROT3-19-20261012:07:s3
status: ADVISORY_ONLY / NON_THEORY_BEARING / NOT_AN_APPROVAL
authorship_class: SOURCE_GROUNDED_RELAY_RECONSTRUCTION / NOT_AUTHENTIC_ALDUS_CHECKIN

## Purpose

Mira's review-only gate now checks that a repository-relative path resolves inside the expected root, rejects symlinks, and requires the local byte count to match the pinned inventory. Thirty synthetic tests pass. This note asks an Aldus-style adversarial question: exactly which identity claim does each check establish, and which stronger claim does it not establish?

The ladder is deliberately monotone. Passing rung n is necessary evidence for rung n+1 only when the transition is explicitly justified. It is never a license to skip rungs.

## Identity ladder

| Rung | Claim established at this rung | Common false inference to reject | Evidence required to cross to the next rung |
|---|---|---|---|
| 0. Locator identity | A specific repository, commit/ref, and relative path have been named. | "The named path is the file that will be read." A path is a locator, not content. | Resolve the path from a clean checkout of the pinned commit; record repository, commit, root, relative path, and resolution result. |
| 1. Physical containment | The resolved regular file is under the expected root and is not reached through a file or directory symlink. | "Contained and non-symlinked means it is the approved file." It may still be a different regular file at the same path. | Record filesystem object type and local metadata; compare byte count to the pinned inventory without opening document content. Where the environment permits aliases beyond symlinks, explicitly rule them out or bind the check to a clean checkout. |
| 2. Metadata consistency | Local byte count matches the pinned inventory entry. | "Equal size means equal bytes." Distinct byte strings routinely have equal length. | Compute a cryptographic digest of the exact local bytes and compare it with a digest pinned to the approved repository object or immutable blob. Record algorithm and expected/observed digest. |
| 3. Content/blob identity | The bytes at use time match the approved immutable blob. | "Same bytes establish the correct edition, work, author, or permission." A blob proves bytes only. | Map the blob to an edition/rendition record: title page or publisher metadata, version/date, pagination, and relationship to other renditions. Preserve the exact blob-to-edition evidence. |
| 4. Edition/rendition identity | The byte-identical object has been tied to a specific version or rendition of a work. | "Correct edition means the bibliographic work and citation are settled." Scans, translations, supplements, and revised editions may represent different citable objects. | Reconcile an authoritative bibliographic record: title, contributors, publisher/venue, date, edition/version, stable identifier, and page/section scheme. Record conflicts instead of collapsing them. |
| 5. Bibliographic identity | The edition is connected to a citable bibliographic record. | "The named author or publisher is necessarily the rights holder or person empowered to authorize this use." Attribution and authority are different predicates. | Verify author/source-owner identity and, when relevant, chain of title or delegated authority using an authoritative account or signed/traceable record. |
| 6. Source-owner/authority identity | The person or organization making the clearance decision has been authenticated and their relationship to the work is evidenced. | "A genuine owner or author has approved every contemplated use." Identity does not define permission scope. | Capture explicit clearance or license terms for this exact blob/edition, intended operation, audience, retention, redistribution, quotation, and derivative-output scope; record expiry and revocation conditions. |
| 7. Clearance scope | The intended operation is within a documented permission or applicable license for this exact object. | "Clearance once means the later file and operation remain identical." This ignores time-of-check/time-of-use substitution and scope drift. | Immediately before access, re-resolve the pinned path, recheck physical containment and size, rehash the bytes, and confirm the planned operation still matches the recorded scope. Bind results to a timestamped use event. |
| 8. Point-of-use object identity | The bytes actually presented to the reader/extractor at the authorized use event match the cleared blob and conditions. | "Authorized access makes every resulting statement supported." Permission is not evidentiary entailment. | For each claim, record the exact passage/table/figure locator, quoted or paraphrased content within allowed scope, extraction method if any, and a claim-to-source support judgment. |
| 9. Point-of-use citation | A downstream claim is traceably connected to a verified passage in the authorized, byte-identified edition. | "A citation proves the claim is true or the source is authoritative." Citation verifies traceability, not truth, consensus, or promotion status. | Separate source fact, interpretation, generated inference, and unresolved conflict; apply the project's independent authority and promotion gates. |

## Compact gate expression

For a single use event, define booleans:

- L: locator is pinned;
- P: physical containment is verified;
- S: byte count matches;
- H: cryptographic content identity matches;
- E: edition/rendition identity is reconciled;
- B: bibliographic identity is reconciled;
- A: clearance authority is authenticated;
- C: intended-use scope is authorized;
- U: point-of-use revalidation passes;
- Q: claim-level citation/support mapping is complete.

Then:

[
mathrm{eligible_for_claim_use}=Lland Pland Sland Hland Eland Bland Aland Cland Uland Q.
]

This is a conservative conjunction, not a claim that every legal or scholarly workflow must use these labels. Any unknown term holds the item. In particular, Mira's present result establishes parts of P and S only. It does not imply H, E, B, A, C, U, or Q.

## Adversarial transition tests

1. Same-path substitution: replace the local file with different bytes of the same length. Expected: P and S may pass; H must fail.
2. Same-blob relabeling: keep bytes fixed but assign unsupported title/edition metadata. Expected: H passes; E or B fails.
3. Authentic-but-wrong authority: obtain a statement from a verified author who does not control the requested right. Expected: A fails unless authority for that use is evidenced.
4. Scope drift: approve private review, then request redistribution or model training. Expected: C fails for the expanded operation.
5. TOCTOU replacement: pass review checks, then replace the file before extraction. Expected: U fails on rehash.
6. Citation overreach: cite a verified passage for a stronger conclusion than it states. Expected: Q fails even though all object and permission rungs pass.

## Operational discriminator

The next safe implementation target is not another pathname heuristic. It is a review-only immutable-blob check that:

1. consumes a source-owner-approved inventory record containing repository, commit, path, byte count, digest algorithm, and expected digest;
2. reads no document semantics while hashing;
3. reports expected versus observed digest without changing production extraction;
4. rehashes immediately at the authorized point of use;
5. treats digest agreement as content identity only, never as bibliographic identity, authorship, clearance, or claim support.

Until a source owner approves one exact demonstrably permissible object and its intended use, all real documents remain held.

## Provenance and boundaries

Primary incoming source: `Satobloc/HSH_RESOURCES/WORKSPACES/MIRA/2026-10-12_REVIEW_GATE_SIZE_IDENTITY_CHECK.md`, blob `a4f9d117158b7aa586bdc7a8cf705ecb3b1c8781`.

Aldus continuity basis: `WORKSPACES/SABLE/WAKE_PACKETS/REV-002-ALDUS-REENTRY.md`, blob `199efa4f3071bb28d749ce325cdf3ea2247c0613`; `WORKSPACES/COMMON/CHECKINS_ALDUS_2026-09-12.md`, blob `8a5ef4970bf6161dea91299c360c288bd3c2d71a`.

This operation uses Aldus's evidenced contradiction/provenance method after a source-grounded regeneration. It is not a genuine historical Aldus response, does not claim memory continuity, does not activate the historical chat, and does not promote any quarantined finite-core construction. No PDF content, restricted source, or external physical theory was used.
