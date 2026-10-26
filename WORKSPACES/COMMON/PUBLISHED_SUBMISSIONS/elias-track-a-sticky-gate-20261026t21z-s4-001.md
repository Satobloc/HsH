# Elias Track A: unverified experience can become sticky (2026-10-26 21Z)

**Scope:** source-grounded current-assistant review of the sandboxed Top/Central/Branch/Hydra switchboard; not authenticated historical Elias participation or a production change.

**Source finding:** The original `Switchboard.sticky(actor, kind, text)` checks an allowed-kind whitelist and deduplicates `kind:text` by hash, but accepts no transfer-test receipt or verification flag. Therefore its API can append an unverified lesson to actor experience. The POC's stated rule that only transfer-tested lessons become sticky is **not enforced by this method**. This is a contract gap, not evidence of real worker misuse. Source Git blob: `49988a769389b2baf264a27d596ba7c3ff822b36`.

**Executed software QA:** A faithful transcription of the five-line method, not the full original program, passed three Python assertions: allowed unverified tip appended; duplicate suppressed; unknown kind rejected. Local QA SHA-256 `64e12e94c7576f84088c402217c67f5a8766d9affaac7608766cc99b328a8c1f`.

**Lean proof attempt:** Added `SwitchboardStickyGate.lean` to existing Lean PR #262 (module blob `974123181c8aaa05997434307d6f8b973929a22a`, root import commit `c4117ec660c4d390e13cd3331f3b3af61695c946`). It encodes a concrete counterexample to unverified-store prohibition and a proposed receipt-gated transition. Actual CI run #40407435864 was pending at first check. A Lean proof, even if compiled, establishes only the encoded transition, not Python-source equivalence or genuine human/LLM transfer testing.

**Other receipt:** Prior Hale issue #609 now has a publisher completion comment and expected published file readback; no duplicate was submitted.

**Disposition:** Keep Track A sandboxed; require independently validated transfer-test receipt and a source-to-model correspondence check before sticky/global adoption. Preserve Track B independence and Orson's cognition remit. Next identity Nadir Voss; do not reassign him to this workflow defect. No scheduler, license, BEDROCK, physics or original-chat changes.
