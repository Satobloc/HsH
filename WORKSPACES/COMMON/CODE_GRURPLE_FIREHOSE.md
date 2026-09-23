# CODE GRURPLE — FIREHOSE BOARD

**Status:** ACTIVE / PEER-TO-POSTING THROUGHPUT
**Opened:** 2026-09-22
**Owner:** Tern / Comptroller

## Rule

Do not wait behind an Originator for work that does not require Originator judgment. Pull one bounded packet, produce a merge-ready result, and return it to the canonical paper packet. Do not fork the manuscript as an alternate-author lane.

Review independence still applies: anyone performing an independent formal review must not read paper-specific reviewer commentary until that review is frozen.

## GRURPLE-A — Meridian

**Current merge point:** Meridian R1.

Parallel packets available to non-blinded/post-freeze workers and outside consultants:

| Packet | Work | Return artifact |
|---|---|---|
| A-SOURCE | Harden primary citations and chronology/provenance microcitations | source table: claim → source → date → status → exact locator |
| A-CLAIM | Claim-strength/type lint against R0/R1 plan | only sentences needing change, with proposed replacement and reason |
| A-COMPARE | Verify comparison rows use like-with-like mathematical object/status typing | discrepancy list + proposed typed row |
| A-BIB | Bibliography/metadata/DOI consistency and missing-reference candidates | merge-ready bibliography patch/candidate queue |
| A-LATEX | LaTeX build/readability/notation/format lint | mechanical patch; no scientific rewriting |
| A-WEB | Prepare current-version sandbox metadata, warning state, replacement/deactivation plan for stale web draft | website-ready manifest |
| A-REVIEW | Independent first-pass review for reviewers who remain unexposed | frozen review; then cross-read opens |

**Originator-only target:** thesis/argument decisions, acceptance/disposition of substantive review changes, scientific status judgments, release of R1.

## GRURPLE-B — Mercer

**Current merge point:** **Originator freeze decision.** Tern's 2026-09-22 firehose pass removed the visible conventional-citation blockers and reduced the remaining gate to one scientific-status decision.

| Packet | State | Return artifact / cursor |
|---|---|---|
| B-CITE | **COMPLETE / INCORPORATED** | SAT-BND-01–03 are formal archival citations already used in `DRAFT_R0.md`; see `SAT_ARCHIVE_CITATION_LEDGER.md` |
| B-TYPE | **ORIGINATOR DECISION BOUNDARY** | Historical antecedent is typed; stronger mechanism chain remains explicitly conjectural. Decide whether that disclosed status is sufficient for proposal-paper R0 freeze. |
| B-NEG | **COMPLETE / TESTED** | Negative-support boundaries are explicit in ledger and manuscript; no ordinary slit→neutrino or later-vocabulary back-projection claimed. |
| B-BIB | **COMPLETE FOR CURRENT CLAIMS** | `TERN_CITATION_HARDENING_PACKET.md`; primary replacements inserted into manuscript at commit `d002ce1a000dc8c2ed343fa3f849a401a647fdf3` |
| B-LATEX | AVAILABLE AFTER FREEZE | Convert/normalize frozen manuscript to publication-ready LaTeX/PDF path; do not serialize review behind this if Markdown R0 is reviewable. |
| B-WEB | AVAILABLE IN PARALLEL | Prepare sandbox metadata/warning/display manifest while review runs. |
| B-REVIEW | **ARMED** | On Mercer freeze, fan independent first-pass reviews in parallel immediately. |

**Prepared decision packet:** `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/TERN_FREEZE_DECISION_PACKET.md` @ commit `1909319cc6dfc24b5e9be9cba9bc563d3ed4a451`.

**Smallest Originator action:** answer whether R0 is intentionally an experiment/proposal paper with the SAT/H(s)H boundary→neutrino mechanism explicitly conjectural. If YES, freeze/release current R0. If NO and the intended claim is that SAT/H(s)H already predicts the channel, HOLD for arrow-by-arrow source/derivation.

**Immediate downstream after YES:** freeze SHA → create canonical GRURPLE-B review packet → parallel independent review; simultaneously start B-WEB and mechanical B-LATEX staging.

## Pull discipline

1. Prefer a packet matching a demonstrated capability, but capability is not jurisdiction.
2. One worker may take one packet at a time unless explicitly coordinating a bundle.
3. Record source/provenance and do not cross quarantine.
4. Return merge-ready work; do not merely report that work should be done.
5. If a packet exposes a genuine scientific/provenance blocker, mark **HOLD + exact decision needed**.
6. If a packet is already complete, mark **DUPLICATE/MERGED** and take another useful packet.
7. Tern may split/merge/reassign packets as traffic reveals the true bottleneck.

## Throughput trigger

If either paper remains at the same pipeline state across two Comptroller checks despite available workers, issue a `PRIORITY_REWEIGHT` request to the Originator containing:
- exact blocking decision;
- work already removed from their desk;
- prepared artifacts awaiting merge;
- smallest action needed to advance;
- downstream work that will start immediately once they act.

For Paper B, the first such packet is now prepared above. If the next Comptroller check still shows no freeze/release and no contrary Mercer disposition, route this exact bounded decision to the active Paper-B Mercer identity rather than reopening broad retrieval.

## Automation lane

Automation may be built only where it directly clears one or more packets above. First candidates:
- paper manifest/state tracker;
- citation/locator normalization scaffold;
- LaTeX build + PDF staging;
- keyword/bibliography lint;
- website version/warning/display manifest;
- elapsed-time/bottleneck detector.

Do not automate scientific correctness, review disposition, provenance acceptance, or quarantine clearance.
