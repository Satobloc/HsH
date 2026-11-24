# Aster h950:s2 — Amendment 01: raw-export reparse and SAT archive row provenance

**Parent report:** WORKSPACES/ASTER/2026-11-19T1424Z_H950_S2_GW150914_SOURCE_GENEALOGY_AND_DEPENDENCE_AUDIT.md  
**Parent publisher issue:** [#2101](https://github.com/Satobloc/HsH/issues/2101)  
**Status:** Additive source-fidelity amendment. The original report, receipt and published artifact remain unchanged.

## 1. Historical Aster export: successful full parse

The previously known raw export was successfully retrieved through the Git blob endpoint and parsed as JSON. This supersedes the earlier reader-path observation that the large export returned an empty body; that earlier observation remains accurate for the endpoint used at the time.

- Repository: Satobloc/HsH
- Path: DEVELOPMENT_FULL_CONVOS/CONVOS_23/26.09.20•26.10.17•ASTER — raw.json
- Conversation title: ASTER
- Conversation ID: 6ab006ce-e358-83ea-b3dd-7b23a26c00fa
- Immutable Git blob SHA-1: 1bf6e65c4ac1650297acb67d7e39f700454a03c8
- Embedded creation: 2026-09-20T16:16:17.286Z
- Embedded update: 2026-10-17T12:28:18.531Z

The parsed graph contains 1,818 mapping entries, 1,817 message-bearing nodes and 39 outer user-role messages. It has one root, one terminal leaf and no branching nodes. Following the current_node parent chain traverses all 1,818 nodes and all 39 user-role messages.

An earlier CURRENT_WORK.md statement reported 455 current-ancestry nodes / 19 user-role messages. That count is not reproducible from this immutable export using the current-node parent chain and is superseded as the current graph count. Preserve it as a historical, method-unresolved discrepancy; do not silently erase the earlier record.

Relevant direct user-role source messages:

- d15369d1-1412-4f4a-9460-702d2de573ea, 2026-09-22T05:37:41.366Z: asks whether a text reads like Nathan, whether he said it elsewhere, and whether it contradicts his other statements.
- 01505af7-37cd-491f-a951-1822934e36ff, 2026-09-22T19:03:08.093Z: “I'm going to say paper A review is your lane now. Read the whole pile.”
- 727b0f16-bd05-4834-adc8-0875b33ed231, 2026-09-23T05:14:37.118Z: confirms the name “Ms. Aster”.
- e3067f7b-f1c2-45fb-ab98-075d4a798ae5, 2026-10-11T12:00:14.494Z: “Yeah, but you're part of my prior art review team, so that doesn't apply to you.”

This confirms a historical source-fidelity / Nathan-attribution and prior-art review remit, plus a historical Paper A review assignment. It does not create a standalone signed specialist charter or authenticate a current Aster thread. The current Code Grurple roster still controls: formal Paper A review is FROZEN / CROSS-READ OPEN. No review was reopened.

The last user-role message in the archived conversation is dated 2026-10-17T12:28:14.355Z. Current-thread usability remains unverified.

## 2. SAT archive Electrogravacoustics row: exact column and citation check

The source was re-fetched from Satobloc/SAT_THEORY_ARCHIVE_2023-25:

- Path: 2026/ELECTROGRAVACOUSTICS.txt
- Blob SHA-1: 4085e071d4804fd3313a0c01a7ca7e9aa62d76dd
- The same blob is present at four archive paths: the 2026/ source, SAT 2026 CONCEPTS/, [[SAT26 TOOLBOX]]/, and SAT 2026 ROUNDUP DOCS/. These are duplicate copies, not four independent sources.

The table header at lines 1715 onward explicitly labels the relevant column Wavelength (Λ). The row at lines 1814–1822 reads, in column order:

LIGO GW150914 | Gravitational | 3.0×10^6 m | 100 Hz | Variable (Torsion Gradient) | Q=3A | Braid Smoothed | [2], [6]

The bibliography at lines 2020–2025 resolves those two row citations as:

- [2] The_4D_machine_replacing_quantum_dice.m4a
- [6] Pasted Text

Neither citation is a primary LIGO paper, GWOSC strain release, calibration record or independent detector measurement. The generic Pasted Text entry is not further identified by the bibliography.

The corresponding Electrogravacoustics 1.srt transcript is also duplicated at two paths with one identical blob (11f1c1e3dd472c946ce48fcadbade95ee94b17aa). It repeats the table but is not independent measurement evidence and does not resolve the row's authorial or primary-data provenance.

Therefore the 3.0×10^6 m entry is explicitly an archived wavelength field, not an H1/L1 baseline. Its rough dimensional consistency with 100 Hz via c/f does not establish a measured GW150914 wavelength, detector separation, source parameter, or H(s)H prediction. The row remains an archive hypothesis/summary with unresolved authorship and no primary LIGO citation.

## 3. Parent publication status: now independently verified

The parent report's original receipt recorded issue #2101 as SUBMITTED_NOT_VERIFIED. Subsequent publisher and independent artifact readback now establish:

- Issue: [#2101](https://github.com/Satobloc/HsH/issues/2101)
- Publisher comment: #7012542381
- Publisher commit: 66b7c338630cef904bc14bca850f010e4eaabe44
- Artifact blob: 54e28b0179bf3cbb91368975c31fb039c41e9bb9
- SHA-256: 11d3a248269005bad4bc9cbf0d90dfa654626bc4723f243fb24980d3f291a4d4

The published artifact was independently fetched and compared byte-for-byte with the issue payload. Exact content equality passed. The parent report is therefore PUBLISHED_VERIFIED. No retry or duplicate was made.

## 4. Scientific and workflow limits retained

- GW150914 remains an existing P2 candidate, not a newly selected independent physical system.
- Raw H1/L1 HDF5 strain and O1 calibration uncertainty files remain NOT ACQUIRED.
- No waveform fit, calibration propagation, independent holdout, physical prediction, independent measurement or CODATA numerical comparison was performed in this amendment.
- P2 remains HOLD; P0 Code Grurple remains ACTIVE.
- No Lean build was run, no new theorem or PR was created, no BEDROCK/SAT-O/Blockwave equation was changed, and no theory or paper gate was promoted.

**Interpretation:** this amendment improves historical-source and publication-state fidelity. It does not change the physical or theoretical status of the parent report.
