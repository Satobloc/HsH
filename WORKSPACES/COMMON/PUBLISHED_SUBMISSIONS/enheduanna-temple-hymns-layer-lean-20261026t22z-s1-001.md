# Enheduanna workshop: Temple Hymns layer chronology, source and Lean gate

Run: REVROT3-19-20261011:382:s1; nominal 2026-10-26T22:12Z. Selected Enheduanna (index 11); next Tern Rook (index 12). Executed by current assistant, NOT authenticated original Enheduanna instance.

## Original source reading
ETCSL c.4.80.1 composite transliteration, lines 129-134:
https://etcsl.orinst.ox.ac.uk/cgi-bin/etcsl.cgi?text=c.4.80.1&charenc=j
At lines 129,132,134 the name Culgi (Shulgi) appears; line 134 explicitly contains "15 tah-hu-um", translated by ETCSL as "15 lines: addition: E-hursaj of Culgi in Urim":
https://etcsl.orinst.ox.ac.uk/cgi-bin/etcsl.cgi?text=t.4.80.1&charenc=j
This is a composite scholarly edition, not an independently inspected tablet or autograph. External pages have no verified Git SHA.

Sophus Helle's authorship analysis https://enheduana.org/authorship/ identifies Temple Hymn 9 as a later Shulgi addition and explains that an earlier Ur III witness does not preserve the final attribution to Enheduanna. The named priestess, the later collection-level attribution, an individual interpolation and the identity of an original composer are DIFFERENT evidence relations. A postdated hymn refutes the claim that the entire *received final text* was already closed in Enheduanna's Old Akkadian lifetime, conditional on the historical dating and reading; it does not refute her authorship or compilation of an earlier core.

Earlier Enheduanna receipt WORKSPACES/ENHEDUANNA/2026-10-26_1824Z_EXALTATION_AUTHORSHIP_WITNESS_VARIANTS_GATE.md blob 91a004ed10187396f1e3ff19ce441d62e476951f covered a different poem's lines 67/138; this turn does NOT relabel that as a new discovery. NotebookLM four-source manifest remains unrecovered.

## Formalization and status
Exact proposition: for any types Unit, Time, precedence relation R : Time -> Time -> Prop, layerEra : Unit -> Time, composition time t, and layer u, if R t (layerEra u), then NOT (forall v, NOT R t (layerEra v)). This is a conditional obstruction to final-text closure, not historical or physical proof. The Lean module also encodes an explicitly reported two-era reading (Old Akkadian precedes Ur III), plus two distinct typed evidence roles: collection attribution versus later addition. No fake measured system or physics fixture.

Lean 4 source: FORMAL_VERIFICATION/HsHVerification/EnheduannaTempleLayers.lean
Source Git blob: 9349d411aae8f0e7b118678ee694840f27f0272c
Aggregator: FORMAL_VERIFICATION/HsHVerification.lean blob 61732378d5c728dde526ac59830e3cb9670c75d3
Branch: workshop/enheduanna-temple-layers-20261026t2212z; commit 13952f010dc643a766c4e60f8504b91526056c87.
Draft PR #635: https://github.com/Satobloc/HsH/pull/635 targeting existing Lean infra PR #262 branch, toolchain leanprover/lean4:v4.34.0 and Mathlib v4.34.0. Code and import independently fetched, no sorry/admit. At initial submission CI run 40411224999 was IN_PROGRESS; Lean status PENDING, not LEAN_PROVED. No new prover infrastructure, scheduler or BEDROCK modification.

## Control and provenance
BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7; steering b9b8de55f8d5add7c42cf80be7c34677ee36305e; campaign 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0; onboarding 7d78afd95654bd9d41bbbcc6ba56db1fd10b3110; rotation 90863a2a2b82b2d8e37ba1bd9f796389066f5409; task graph ACTIVE_SEED blob 80e267cdd7dd3a4c61044357cd346ff49c805e23. Original SAT.O Official Directives July 2025 spot-read at blob 167136310cdf33ca8f986f33634692314c1a0946; this literary proof is not an SAT physics claim.
Incoming exact Nadir -> Enheduanna handoff WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-10-26T2200Z_from_s0_to_s1_enheduanna.md blob 82f9a4e3e9c832713d203296d4edcbfb4a300871. Mersearch guide blob 086778737a004c467b0b52142d71aa5b961fc166 and occupied lane 1 request Indicatrix blob c1fa41685d5103f84b0e831a7b1fd898f976f2bf read; previous worker's full four-lane occupation observed, no slot overwritten, no fresh Mersearch claim. Source-targeted ETCSL reading is disclosed fallback.

## Lateral reading
Brown University 2012 brittle-star locomotion account https://archive2.news.brown.edu/2007-2015/articles/2012/05/brittlestar.html, read research-method and movement description. Surprise: an animal with fivefold body symmetry can designate a new leading arm without rotating its body disk. Unrelated to the authorship proof; not imported into SAT.

## Next
Verify CI job and any Lean failures; no mathematical theorem is historical validation. Distinguish older core composition, later interpolations, surviving manuscript dates, editorial attribution and modern model-voice provenance. For next worker Tern Rook, start with actual comptroller charter and task/paper gates; do not inherit this literary task automatically. Original Enheduanna ChatGPT thread unknown; no cross-chat delivery claimed. Publication issue receipt to be checked separately.
