# Aldus | O9 chronology correction: verified broad-SAT public T0 | 2026-10-31T07:36Z

Status: SOURCE-CRITICAL CORRECTION / CONDITIONAL FORMALIZATION. Not theory validation, not a claim of first-ever O9 exposure, and not a physical prediction.

Run key: REVROT3-19-20261011:487:s3. Deterministic selection: Aldus; next: Calder. This is a current-assistant source-grounded reconstruction, not an authenticated historical Aldus instance or cross-thread delivery.

Related records: HsH issue #1000 is the original O9 two-firsts report. Issue #1139 published the claim-granular schema but excluded the 2025-02-02 broad-SAT date pending source recovery. Issue #1140 was rejected by the publisher for SHA-256 mismatch and created no artifact. This corrected payload reuses #1140's submission ID because its file was verified absent.

## 1. Broad SAT public T0: VERIFIED

Spotify catalog entry: [What Is Thought Made Of? (Filament Unification Intro)](https://open.spotify.com/episode/3Z1id4TvYGXVYsnryL8I4T), episode URI spotify:episode:3Z1id4TvYGXVYsnryL8I4T, parent show The New Physics, release date 2025-02-02.

The public episode description explicitly identifies SAT and Stringing-Along Theory. The creator/admin export independently records the episode as published on February 2, 2025 at 4:21 PM; timezone is not established. Therefore 2025-02-02 is a verified public-exposure date for the broad SAT framework.

Attribution remains separate: the description is a first-person publisher field, not a raw role-verified Nathan message. Broad public exposure is verified; Nathan-authored public T0 is not established by this witness.

This date is NOT an O9 mass, O9 graviton, or O9 optical-audit T0.

## 2. O9-specific public exposure: still candidate / unresolved

Spotify catalog entry: [The Prehistory of SAT](https://open.spotify.com/episode/5EJAZZacCKKiFPkvG2Ag83), release date 2026-06-09.

The saved creator/admin SRT has the same episode identity and records publication at 1:56 PM. It states that transcripts are automatically generated and may be edited. Cue 644, 00:30:57.560-00:31:01.320, contains the O9 graviton topological-strain filename.

Verified: the episode exists and its catalog release date is 2026-06-09; the saved SRT bytes contain that filename.
Not independently verified: that the exact filename was spoken in the audio.
Not established: Nathan authorship or endorsement of that claim.

Thus 2026-06-09 is a candidate date for the O9 filename, not a verified claim-level public T0. A cleaned transcript copy is a derivative of the same transcript lineage, not independent audio corroboration.

## 3. Repository chronology: commit order is not creation or public order

Two exact Git commit timestamps were fetched from the SAT archive repository API:

- NotebookLM-derived SATOBLOCK_CONCEPT_DEVELOPMENT.txt compilation: 2025-10-27T00:40:28Z, commit b543eb3fbf16e50500ceadad83dc9a7dc0759e5b.
- SAT O Core Modules/O9.txt mass-module path: 2025-10-27T01:13:03Z, commit c2d7dfe845cb0255385c8c690bbc9d36bae46f31.

Scripted subtraction: 1,955 seconds = 32 minutes 35 seconds. The earlier derivative commit already juxtaposes the O9 mass-fit and graviton-strain referents before the separate mass-module path commit.

This establishes only repository commit order. It does not establish source composition time, author, direction of copying, or historical repository visibility. The repository is public now; visibility at those 2025 commit instants remains unverified.

## 4. Architecture and formalization

The correct unit of chronology is a claim at a stated granularity, not an object label. Keep separate:
- identifier/filename, topic, equation fragment, complete construction, physical assertion;
- witness family and derivative lineage;
- source creation, public release, capture/transcription, repository commit;
- public visibility, exact content presence, authorship, and time precision.

Use separate workflow-local functions:
- T0_public(claim, granularity): earliest witness with verified public availability and verified claim content at that granularity;
- T0_candidate: earliest public record with candidate-only content, such as an auto-transcript;
- T0_Nathan_public: earliest public witness with role-verified Nathan authorship;
- T0_repository: earliest located repository witness, not promoted to public T0 without historical visibility evidence.

These names are LOCAL:ALDUS_O9_CLAIM_GRANULARITY workflow identifiers, implemented under Lean namespace HsHVerification.AldusO9ClaimGranularity. They are not SAT/H(s)H physical symbols and are not canonical theory notation.

The existing draft PR #982 was extended on its existing branch; no new branch or PR was created:
- Module: FORMAL_VERIFICATION/HsHVerification/AldusO9ClaimGranularity.lean
- Module blob: 49fe36b449122865128454a9d6865b2099e4ee59
- Latest branch head: 14c713fe7e1fc0853760a64bf6cd26a1cbacd7d8
- Exact-head Lean Actions run: #41182177659, currently pending.

The bounded ledger encodes broad SAT public T0 = 20250202, but no role-verified Nathan-public T0; no verified O9 mass-module, mass-formula, or graviton-equation public T0; and a candidate 20260609 date for the O9 graviton filename without verified transcript content. It also proves the 1,955-second repository commit gap.

Lean only checks the encoded finite ledger and classifications. It cannot authenticate source bytes, historical visibility, authorship, transcript accuracy, or first-ever exposure. The exact-head run has not yet produced a compile result or theorem-specific axiom/sorryAx audit.

No SAT-O or Blockwave equation was altered. No physical calculation, fit, experiment, theory promotion, BEDROCK amendment, manuscript change, or paper-gate advancement is made.
