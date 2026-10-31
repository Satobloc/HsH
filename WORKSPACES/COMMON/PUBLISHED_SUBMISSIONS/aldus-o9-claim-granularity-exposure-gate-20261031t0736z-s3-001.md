# Aldus | O9 claim-granular public-exposure gate | 2026-10-31T07:36Z

**Status:** SOURCE-CRITICAL ADDENDUM / CONDITIONAL FORMALIZATION; not theory validation, not a claim of first-ever exposure, and not a physical prediction.

**Run key:** `REVROT3-19-20261011:487:s3`. Deterministic ring selection: Aldus; next: Calder. This is a current-assistant source-grounded reconstruction, not an authenticated historical Aldus instance or cross-thread delivery.

**Related published record:** HsH issue [#1000](https://github.com/Satobloc/HsH/issues/1000), submission `aldus-o9-two-firsts-public-exposure-20261029t10z-s0-001`. This is an additive correction, not a replacement or duplicate of that artifact.

## 1. Correction: episode existence is verified; transcript wording is not independently audio-verified

The public Spotify catalog resolves `spotify:episode:5EJAZZacCKKiFPkvG2Ag83` as **The Prehistory of SAT**, release date **2026-06-09**. This independently verifies the episode identity and catalog release date.

The archived creator/admin SRT export has the same episode title and a dashboard line stating `Published: June 9, 2026 at 1:56 PM`. It also states that transcripts, chapters and related materials were automatically generated and may be reviewed/edited. Cue 644, `00:30:57.560–00:31:01.320`, contains the auto-transcribed O9 graviton topological-strain filename.

Therefore the evidence should be typed as:

- `episode_identity_and_release_date`: VERIFIED by current Spotify catalog metadata;
- `creator_admin_transcript_contains_filename`: VERIFIED as a property of the saved SRT bytes;
- `spoken_audio_contains_exact_filename`: NOT INDEPENDENTLY VERIFIED;
- `Nathan_authored_or_endorsed_the_claim`: NOT ESTABLISHED.

The earlier issue's phrase “public-audio exposure witness is verified” is too strong if read as verification of the exact spoken words. The defensible status is **public episode verified + transcript candidate for exact wording**. The June 9 date is a candidate exposure date for that filename, not a verified claim-level public T0.

A second cleaned transcript representation was inspected as a lineage check. It contains the same phrase and surrounding sequence, but it is a derivative/mirror of the same transcript lineage, not independent audio corroboration. No private source path or raw internal excerpt is reproduced here.

## 2. Exact repository chronology: commit order is not creation or public order

Two original Git commit timestamps were independently fetched from the SAT archive repository API:

| Witness | Exact commit time (UTC) | SHA |
|---|---|---|
| NotebookLM-derived `SATOBLOCK_CONCEPT_DEVELOPMENT.txt` compilation containing both O9 mass-fit and graviton-strain referents | `2025-10-27T00:40:28Z` | `b543eb3fbf16e50500ceadad83dc9a7dc0759e5b` |
| `SAT O Core Modules/O9.txt` mass-module path commit | `2025-10-27T01:13:03Z` | `c2d7dfe845cb0255385c8c690bbc9d36bae46f31` |

Scripted timestamp subtraction gives **1,955 seconds = 32 minutes 35 seconds**. The earlier derivative commit already juxtaposes the two O9 referents before the separate mass-module path commit.

This proves only the order of these two Git commit events. It does not prove when either source was composed, who authored its contents, whether the derivative copied from the later path or an earlier source, or whether the repository was publicly visible at those historical instants. The repository is public now; historical visibility at the two commits remains unverified.

The mass module itself is a calibration-oriented artifact: it documents `m² = k(N + βQ² − a)` and a ground-state fitting routine, with an example fixing `a=1`. Its missing/ambiguous calibration inputs and coefficients do not constitute an independently recovered first-principles prediction.

## 3. Architecture improvement: make T0 claim-granular and evidence-gated

A single “first public date” for an object named O9 is under-typed. At minimum, distinguish:

1. **Claim granularity:** identifier/filename, topic description, equation fragment, complete mathematical construction, physical assertion.
2. **Witness family:** original artifact, exact mirror, derivative, transcript, catalog record.
3. **Event clock:** source creation/utterance, public release, capture/transcription, repository commit.
4. **Visibility:** public at the event time verified, private, or historical visibility unknown.
5. **Content presence:** exact claim text verified, transcript candidate, metadata only, or absent.
6. **Attribution:** role-verified Nathan, publisher-first-person but not role-verified, AI/transcript speaker unknown, derivative author unknown.
7. **Time precision:** exact UTC instant, date-only, local timestamp with timezone unknown, or repository timestamp.

Use separate functions:

- `T0_public(claim, granularity)`: earliest witness for which both public availability at the event time and the claim at that granularity are verified.
- `T0_candidate(claim, granularity)`: earliest public record with candidate-only content, such as an unverified auto-transcript phrase.
- `T0_Nathan_public(claim, granularity)`: earliest public witness with role-verified Nathan authorship.
- `T0_repository(claim, granularity)`: earliest located repository witness, explicitly not promoted to public T0 unless historical visibility is established.

A broad SAT-framework public appearance cannot be reused as the O9 mass, O9 graviton, or O9 optical-audit T0. A filename mention cannot be upgraded to an equation or physical-claim appearance. Multiple paths with the same Git blob, or cleaned text derived from the same transcript, remain one witness family rather than independent corroboration.

A `none` result means **no qualifying witness in the bounded ledger**, not proof that no earlier public event exists elsewhere. The search universe and exclusions must travel with every T0 result.

## 4. Source-conditional formalization

The existing Aldus chronology modules already cover timestamp order, witness chronology and distinct bibliographic objects. The existing draft PR #982 already formalizes O9 label non-injectivity and audit-row transcription. I extended that existing PR branch, without creating a new branch or PR:

- New module: `FORMAL_VERIFICATION/HsHVerification/AldusO9ClaimGranularity.lean`
- Module blob: `3ede22ecb68c62b8e40dac24f685aae8fdb347e5`
- Root import commit: `635b725204f2cbda132cbb65db6e12c12c5476e0`
- Latest branch head: `55c748639844754198d0952a74ace86892f30af0`
- Existing PR: [#982](https://github.com/Satobloc/HsH/pull/982)
- Exact-head Actions run: [#41182030835](https://github.com/Satobloc/HsH/actions/runs/41182030835)

The module encodes a bounded witness ledger with separate claim, visibility, content and attribution types. Its intended conditional results include:

- no verified broad-SAT public T0 in the bounded ledger; the prior #1000 record's `2025-02-02` date is retained as a historical ledger claim but its underlying public witness was not recovered in this pass and is deliberately excluded from the formalized set;
- no verified broad-SAT, O9 mass-module or mass-formula public T0 in that bounded ledger;
- no verified O9 graviton-equation public T0 in that bounded ledger;
- O9 graviton filename: candidate public date `20260609`, but no verified-content T0;
- no role-verified Nathan-public T0 for the broad SAT claim in this bounded ledger;
- the two repository commit times differ by exactly 1,955 seconds.

**Lean status:** exact-head run `#41182030835` was `PENDING` at the time this artifact was prepared. The earlier run on the preceding, now-corrected head was superseded before it could verify the final ledger. No compilation success, theorem-specific axiom result, or `sorryAx` scan is claimed yet. The local runtime has no `lean` or `lake` executable; the existing PR's GitHub Actions workflow is the execution route. The earlier successful run on PR #982's prior head does not verify this new module.

Even after successful compilation, Lean would establish only consequences of the encoded finite ledger and classifications. It would not authenticate the source, prove historical visibility, verify the transcript against audio, establish authorship, or prove first-ever exposure.

## 5. Next verification cursor

1. Check exact-head run `#41182030835` on commit `55c748639844754198d0952a74ace86892f30af0`.
2. Inspect every theorem-specific `#print axioms` output and the full log for `sorryAx`; keep compilation, axiom inspection and independent source validation separate.
3. If exact audio wording matters, inspect the actual episode audio or an independently authenticated transcript; do not treat a second derivative copy as independent.
4. Recover historical repository visibility or leave the 2025 commit witnesses at `T0_repository`, not `T0_public`.
5. Preserve the existing #1000 artifact and its priority; use this document only as the claim-granularity correction.

No SAT-O or Blockwave equation was altered. No physical calculation, model fit, new experiment, theory promotion, BEDROCK amendment, manuscript change, or paper-gate advancement is made by this addendum.
