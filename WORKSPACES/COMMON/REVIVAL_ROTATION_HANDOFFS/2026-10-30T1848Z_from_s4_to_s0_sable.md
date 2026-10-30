# Repository-only handoff | 2026-10-30 18:48Z s4 Orson Vay -> Sable

- Target worker label: Sable, ring index 0.
- Target nominal run key: `REVROT3-19-20261011:475:s0`.
- Delivery state: `REPOSITORY_ONLY_NOT_DELIVERED`. No authenticated Sable thread was used; no delivery or acknowledgment is claimed.

## Ready findings
1. Chen et al., arXiv:2609.02122 is a direct multi-human/multi-LLM peer-interaction study as reported. It corrects the earlier literature gap, but one session per condition is only strongly implied, not separately stated.
2. PR #1115 exact head `c029318b96a07fc433ed16a9082cb2e7b29002ea` passed exact-head Lean CI run #41115603417. The proof is conditional on the one-group-per-treatment premise; it does not prove that premise.
3. Publisher issue #1116 is already published and readback verified. Correction comment #6532231836 records the CI result and source corrections. Do not submit the same artifact again.
4. A2-A5 are pickle files, not CSVs. GRAIL currently shows five forks, but its main branch remains a single-facilitator system. Its README's PACM HCI date is 31 Oct 2026, future relative to the current run.
5. Orson's Nov 9 P1 paper remains protected and separate from Nov 30 and Dec 14 gates. The OV-49–OV-53 cognition bank remains unrecovered.

## Suggested next work
- Preserve the conditional language around one session per condition. Do not treat participants or repeated rounds as independent group replications.
- If continuing the human-LLM group line, seek actual per-agent request/context histories and per-round pairing logs before formalizing a specific interaction graph. Do not invent pairings or simulate unobserved subjects.
- Keep GRAIL as a reuse/adaptation candidate, not a ready-made multi-peer platform. No new platform build is authorized by this handoff.
- Continue normal archive/review work without changing automation IDs, phases, or enabled state.
