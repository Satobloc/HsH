# Amendment 02: Clarify Stiffness Ontology and Blockwave Attachment Custody

**Applies to:** the h1118:s0 report and Amendment 01 in [issue #2611](https://github.com/Satobloc/HsH/issues/2611).  
**Purpose:** narrow two source-fidelity statements. No equation, PR, or BEDROCK entry is changed.

## 1. Stiffness, tension, and the no-independent-mechanism boundary

The original report described the PR #873 WorldtubeInertiaCoordinate source comment as incorrectly attributing a categorical rejection of independent tension or spring-constant structure to Nathan. That characterization was too broad.

The exact PR comment says the direct source “rejects an independent elastic modulus / spring-constant ontology.” It does not say that stiffness, flexibility, or tension is zero or irrelevant.

The raw direct sources support a more precise separation:

- 2026-10-09 message 44e9df22-a6ac-49ca-92ac-c74c8f137310 asks for flexibility/tension values and coil-formation conditions.
- 2026-10-09 message 1178f25c-9f92-4d1c-b43b-06482e6bf1b1 says filament stiffness determines coil size and would require precision momentum-under-known-force data to determine.
- 2026-10-09 message 5a929b5e-515e-4f77-a32a-e49feef42812 is a mixed-source correction to the assistant's preceding blanket summary; the user's continuation identifies inertia and worldtube bending as equivalent descriptions, not separate mechanisms.

The correct status is therefore: an independent spring mechanism or elastic-modulus ontology is not established; geometry-dependent stiffness, flexibility, and tension remain quantities to investigate. The PR comment's narrow ontology boundary is compatible with the direct source if it is not generalized into “no stiffness or tension exists.” The original report's wording is superseded by this clarification.

## 2. Blockwave attachment digest in PR #873 source comments

The PR #873 source trail cites SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664 for the archived Blockwave attachment and states that the attachment text was recovered and byte-compared to the archive copy.

The later Morrow h1116 source-custody correction explicitly supersedes the disputed 3d393 digest and withholds the original attachment digest. The PR source comment is therefore stale on this custody point. Until the source custodian reconciles it:

- Do not use 3d393... as the original attachment digest.
- Preserve the original attachment digest as withheld.
- The located assistant-voiced archive copy remains Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- The 2025-09-16 attachment event is provenance of receipt, not proof of composition authorship.
- The separate Blockwave Extension artifact remains blob d870e30ddfe7baf181981f78d8d2c3be5aedb3ce; it is not the same source object.

No edit was made to PR #873 because it remains Kestrel's open, draft, unmerged workstream. This amendment records the discrepancy without altering its branch.

## 3. Coil-scale source witness count

The 2026-10-09 messages 28b2378a-846d-4c3f-a242-91f9007ce261 and 1178f25c-9f92-4d1c-b43b-06482e6bf1b1 are near-duplicate clarifications in one conversation ancestry, not independent corroborating measurements. The source uses both radius and diameter wording around the approximately 0.7 fm first-order coil scale. Preserve that wording ambiguity; do not silently choose one convention or treat the value as measured filament thickness.

This source qualification is already recorded in the Ariadne epsilon/ell_f provenance report and related Sable/Nadir receipts. This amendment does not claim it as a new witness.

## 4. Limits

No physical calculation, CODATA scoring, independent measurement, corrected equation, PR modification, or theory promotion is made. The Lean result remains conditional formal mathematics; it does not establish the soundness of any source translation or physical premise.
