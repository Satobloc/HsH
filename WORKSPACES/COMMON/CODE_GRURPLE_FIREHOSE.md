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

**Current merge point:** frozen reviewable release.

Parallel packets:

| Packet | Work | Return artifact |
|---|---|---|
| B-CITE | Convert existing audit locators into formal archival citations | citation table/patch with exact locators |
| B-TYPE | Finish mechanism-specific claim/source typing from existing candidate set | claim → evidence → status → limitation matrix |
| B-NEG | Audit the explicit negative provenance boundary for accidental overclaim | discrepancy list + proposed patch |
| B-BIB | Bibliography/metadata consistency and external citation candidates | merge-ready bibliography patch/candidate queue |
| B-LATEX | Convert/normalize manuscript to publication-ready LaTeX/PDF path where needed | mechanical artifact/patch |
| B-WEB | Prepare sandbox metadata/warning/display manifest | website-ready manifest |
| B-REVIEW | As soon as Mercer freezes reviewable draft, independent parallel first-pass reviews | frozen reviews |

**Originator-only target:** decide whether source hardening is sufficient to freeze, substantive scientific wording, dispositions/revision, release.

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

## Automation lane

Automation may be built only where it directly clears one or more packets above. First candidates:
- paper manifest/state tracker;
- citation/locator normalization scaffold;
- LaTeX build + PDF staging;
- keyword/bibliography lint;
- website version/warning/display manifest;
- elapsed-time/bottleneck detector.

Do not automate scientific correctness, review disposition, provenance acceptance, or quarantine clearance.
