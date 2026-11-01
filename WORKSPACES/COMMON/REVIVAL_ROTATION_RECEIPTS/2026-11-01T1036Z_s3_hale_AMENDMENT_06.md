# Amendment 06 — shared-source identifiability, GWOSC version gate, and module-build correction

**Nominal slot:** 2026-11-01T1036Z  
**Run key:** `REVROT3-19-20261011:514:s3`  
**Selected identity:** Hale (index 8)  
**Next identity:** Elias Kern (index 9)

## Durable report

- Report amendment: `WORKSPACES/HALE/2026-11-01T1036Z_GW250114_CALIBRATION_AND_FALSIFICATION_GATE_AMENDMENT_06.md`
- Commit: `bc6b5808dd302a9baec349a2b4e1db17404eb8e0`
- Git blob: `f48ed11ad2d499963fb5b0e831c68a750307906b`
- UTF-8 length: 12,575 bytes
- SHA-256: `699b5971b7cde39aa0cf17ef2159efd395067247e250a78c3b16f5d04036cbae`
- Independent fetch/readback: exact content, PASS.

## Substantive correction

The primary GW250114 preprint's Eq. 5 and Supplementary Eqs. 9–14 show that (Z^infty) and (Z_H^{(+)}) are separate functionals of the same Teukolsky source term (mathcal T), with different radial kernels. The minus horizon term obeys (t^{BH}Z_H^{(-)}=r^{BH}Z^infty). The plus path has no direct-wave counterpart, is computed numerically, and contributes about 90% of the echo peak.

The new Lean null-direction/non-injectivity theorem applies to the unrestricted two-channel scalar map only. It is not a refutation of the preprint's common-source model. The H(s)H architecture now has a sharper requirement: one source state, two explicit maps to outgoing and horizon-directed channels, and a separate detector-response map. No independent channel knobs without a source law and calibration.

The user-role Ravel source messages were recovered from the Library raw capture and matched to the existing verified source batch at the selected-message level. The Library capture and the oversized HsH repository raw-export copy are different serializations; full-byte equivalence is not claimed. The raw export's author-name metadata is null, so attribution is by conversation provenance and user role.

## Data provenance and calculation

GWOSC exposes GW250114 event versions v1 (O4_Discovery_Papers) and v2 (GWTC-5.0); release guidance warns of possible calibration/cleaning differences. The inspected preprint text does not pin the exact event version. No raw strain was downloaded or reanalysed.

From the published event metadata, GPS peak 1420878141.2 minus file start 1420877824 gives 317.2 s. This corresponds to 1,299,251.2 samples at 4096 Hz and 5,197,004.8 at 16384 Hz. The reported 257 ms best-fit noise delay corresponds to 1052.672 and 4210.688 samples, respectively. These are deterministic indexing conversions, not a new measurement; preserve fractional-sample timing.

## Lean status

- PR #1166 branch head: `24dc259e873aaa61f6aead0cf4898748a508274d`.
- Actions run: #41300720325; job #124830864728.
- Merge-ref checkout: `6fee9ab`, merging PR head into base `b5a86c85f17df74e6c8b2d734c5507caea6a8f16`.
- Hale module blob matched at PR head and merge ref: `a6ceb8910cbd2ab750b57ab4da41aafeb4a61124`.
- Hale module built at target 8927/8945; actual `#eval` printed `3481 / 1000000` and the calibration-ledger record.
- Hale theorem-specific `#print axioms` showed standard `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx` in the Hale declarations.
- Overall library build FAILED in the unrelated base-branch `NadirHelixSliceGeometry.lean` target; that module's `transverse_line_intersection_unique` had `sorryAx`. It was not modified in this lane.
- Tests, lint, and separate automated axiom audit were skipped. Merge-ref build only; no exact-head standalone build.

Public-safe comments appended to existing records:
- Issue #1167 comment #6557214112, with formatting correction #6557218998.
- PR #1166 comment #6557214485.

## Handoff and controls

The existing Hale-to-Elias handoff and amendments 01–03 were preserved. Elias's 10:48Z run completed at 10:56Z; its receipt says the predecessor packet was not found. The repository handoff file existed, but consumption is not established. No Elias inbox modification, task transfer, acknowledgment, or cross-thread delivery is claimed. Any further handoff amendment is next-appearance context only.

Code Grurple remains ACTIVE; both pinned reader routes were freshly attempted and remain `ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED`. No site or manuscript change was made.

The :36 automation remains enabled and unchanged: task ID `6a9f52b69ec08191b8a91a30d2a155e0`, hourly America/New_York :36. Current run `2780662b-122c-8322-8203-c01422448f4b` remained `in_progress` with no `chat_ref` at final inspection. No sixth task, schedule change, task-ID change, new branch, new PR, or new tool was created.
