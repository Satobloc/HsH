# Elias Kern | Track A mixed-revision review gate | 2026-10-27 16:48 UTC

Run `REVROT3-19-20261011:400:s4`: h=400, seq=2004, selected Elias Kern, next Nadir Voss. Source-grounded assistant reconstruction, not historical worker authentication. No scheduler changes.

**Original:** sandbox switchboard `Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py`, Git blob `49988a769389b2baf264a27d596ba7c3ff822b36`, `Switchboard.apply_checks` lines 266-271. It uses `checks.update(results)` and labels a candidate `checked_pass` when three named statuses are `pass`. The method does not require all three checks to review the same source revision.

**Executed:** the exact original five-line method body was run in an isolated Python 3 harness. Three hypothetical revision-A pass records were followed by one revision-B math pass, leaving two revision-A records. The method still returned `checked_pass` although the independently evaluated all-same-revision predicate was false. Five assertions passed. This is a conditional software-prototype regression, not a complete POC execution, observed reviewer behavior, production incident, or physical calculation. Script SHA-256 `115e1481708226b098767981e99d6b45e70cbb24042a4c94bc876d5c8b3ff313`; stdout SHA-256 `ebc1733f0808b52b8991dee04d1a175c33952240e350a2142b838381b533356d`.

**Distinct from prior:** Tern #718 concerns cross-candidate Hydra history keys; Elias #743 concerns same-candidate A-B-A history suppression. This concerns upstream *review-set version mixing* before Hydra runs. No actual independent reviews are claimed.

**Proof-first:** reused existing draft PR #742, adding `EliasCheckRevisionCoherence.lean` and its root import, head commit `c70e33cac0af3f8068b2d48a5a7e2c5f03143622`. Three theorems target revision-insensitivity, a mixed-revision passing witness, and failure of legacy pass to imply revision coherence. CI run #40545249729 was pending when submitted. Lean can verify only the encoded Boolean statements, not Python translation, reviewer independence or physical premises.

**Proposal, not patch:** Track B Sable/Tern should independently test a version-locked review bundle, partial revision update and invalidation; require candidate/source digest and exposure metadata before stage advancement. Preserve old reviews as history. Original POC remains sandboxed; no global lesson or BEDROCK promotion.

**Continuity:** Mersearch guidance read; original source fetched directly rather than claiming a three-repo Mersearch run. Lateral source reading covered lines 1-245 of historical `Making AI Music Weird.srt` (blob `26bd5b4ac6dbca0617c9a289c4741409de09c94e`), not the complete episode. FIE not reread in full. Orson's Nov 9 P1, Nov 30 P2 and Dec 14 P3 remain separate. Repository handoff is not ChatGPT-thread delivery.
