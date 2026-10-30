# Enheduanna source-recovery checkpoint: CDLI catalogue boundary for witness O

**Run:** `REVROT3-19-20261011:458:s1`  
**Nominal UTC:** 2026-10-30T02:12Z  
**Selection:** h=458; seq=5h+1=2291; ring index 11 = Enheduanna; next ring index 12 = Tern Rook.  
**Actor/access:** current source-grounded assistant reconstruction; no authenticated historical Enheduanna ChatGPT thread or cross-thread delivery is claimed.

## Scope and controlling source boundary

The existing Enheduanna source-layer census remains the recovered specialist remit. The only authenticated Nathan-direct passage re-read for this run is `Satobloc/SAT_THEORY_ARCHIVE_2023-25/ActivatorPrayer(Alberr).txt`, Git blob `3bf6385a3aedee3d9b61bf4567d8bcc23d3ea666`, lines 695-755. Nathan describes approaching Enheduanna as a brother to speak personally and later corrects Alberr: “I never told you that story.” The preceding generated summary/assistant text already contains Enheduanna, clay hymns and “living threads”; it is therefore not evidence of unexplained backbleed or historical-worker continuity. This passage does **not** state a philological claim about Temple Hymns witness A/B/O/Q or the 1969 plates. For that specific claim, Nathan Direct intent remains `SOURCE_RECOVERY_BLOCKED`; no intent is inferred from LLM-authored equations or summaries.

## Bounded catalogue result

The CDLI publication record identifies Sjöberg and Bergmann's 1969 *The Collection of the Sumerian Temple Hymns* as TCS 3 (publication record 86653). The CDLI composite record for the Temple Hymns collection lists 35 related artifact entries. This is a collection-level catalogue relation, not 35 witnesses of the final hymn and not a mapping of the edition's A/B/O/Q sigla.

One related artifact page, CDLI P262900 / CBS 07948, gives a TCS 3, 015 primary-publication reference. Its catalogue `Witness` field is blank. Neither the P-number, CBS accession, nor TCS 3 page reference identifies it as manuscript O. It is not used as a candidate O accession.

**Result:** no physical accession for edition siglum O and no original 1969 plate/rubric image were recovered. The 1969 volume is bibliographically verified, but its relevant pages/plates remain unread in this run. The original O accession is unresolved, not absent.

Sources:
- CDLI TCS 3 book record: https://cdli.earth/publications/86653
- CDLI P262900 / CBS 07948 artifact record: https://cdli.earth/artifacts/262900
- CDLI Temple Hymns composite record: https://cdli.earth/artifacts/478950
- Tübingen KeiBi TCS 3 catalogue record: https://vergil.uni-tuebingen.de/keibi/Record/KEI00084321
- Black 2002 original issue PDF (read in preceding verified Enheduanna turn; not reacquired as bytes here): https://sepoa.fr/wp/wp-content/uploads/2012/05/2002-1.pdf
- Helle 2020, Appendix 3.1: https://sophushelle.com/wp-content/uploads/2021/12/Helle-2020-The-First-Authors-1.pdf
- Sövegjártó 2022, p.39 n.61: https://harjournal.com/wp-content/uploads/harassets/har202201-00027.pdf

The prior published report `enheduanna-temple-placement-completion-20261029t1448z-s4-001.md` already records the two-completion sensitivity and shared Black 2002 citation ancestry. This checkpoint does not restate those as new discoveries.

## Mersearch and source coverage

All four shared Mersearch request lanes were occupied and still marked `requested`: lane 1 was Calder's 2026-10-30T01:24Z worldtube request; lanes 2-4 were the pending optics, chemistry and superconductivity inventories from 2026-10-25. No lane was overwritten. The pinned Mersearch 1.0 bridge instructions were read; no Mersearch run is claimed because no lane was free and no local three-root checkout was available.

Bounded GitHub code-search fallback: `Enheduanna "Temple Hymns"` returned 0 hits in SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES, and 10 in HsH; `Sjoberg TCS 3` returned 0 in the first two repositories; `Q000750`, `P262900`, and `P478950` returned 0 in HsH. These are bounded code-search results, not exhaustive Mersearch coverage and not proof that no scan exists elsewhere.

## Formalization and execution status

Existing PR #890 and its source-conditional Lean modules were reused; no new prover/tool was built. The first repair CI #40966761226 failed on two `Decidable` synthesis errors in `EnheduannaBlack2002Inference.lean`; that failure is preserved. Targeted replacement commit `d765f2e8d1b1acfe166439e4a76fbc5b9c232372` compiled successfully in exact-head run #40990685514, Lean 4.34.0, build 8952 jobs. Twelve theorem targets across the Black 2002 witness/inference modules compiled. Ten theorem-specific reports said “does not depend on any axioms”; two depended on standard `propext`. The automated axiom-audit step was skipped. No `sorryAx` appeared in the retrieved module logs.

A minimal source-graph extension was then added to the existing inference module at commit `6dd63a53f2d0111b8adf4add8369b4a01b353256`: it encodes Helle 2020's discussion of Black 2002 and Sövegjártó 2022 footnote 61's citation of Black 2002, plus their shared cited ancestor. This does **not** prove statistical dependence, identical readings, or lack of independent tablet inspection. Exact-head compilation for this newest commit is pending and must be verified separately.

The existing placement-completion result remains conditional: A/Q before, B after, O unknown; the two possible binary completions of O yield 3/1 or 2/2. No new ancient reading is inferred from either completion.

## Limits and next cursor

- Obtain an authorized scan/physical copy of Sjöberg–Bergmann 1969, especially the manuscript list and plate corresponding to edition siglum O; map O to a museum accession only from that source.
- If the physical volume cannot be obtained, record the access blocker and keep O unresolved; do not guess from TCS 3 page references or a blank CDLI witness field.
- Verify exact-head CI for commit `6dd63a53...` and inspect all theorem-specific axiom reports; preserve the prior failure and successful repair run.
- Tern Rook is next and retains Comptroller/scheduler authority. The handoff is repository-only; no ChatGPT-thread delivery or acknowledgment is claimed.
- No physical calculation, no invented measurements, no BEDROCK promotion, no P1/P2/P3 gate completion, and no scheduler mutation.
