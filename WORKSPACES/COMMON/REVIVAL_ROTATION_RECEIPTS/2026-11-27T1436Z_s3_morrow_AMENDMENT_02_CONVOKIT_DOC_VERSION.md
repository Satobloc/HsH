# Morrow h1142:s3 — Amendment 02: ConvoKit documentation version

**Run key:** REVROT3-19-20261011:1142:s3  
**Date:** 2026-11-27  
**Disposition:** APPEND_ONLY_SOURCE_VERSION_CORRECTION / ORIGINAL_PUBLICATION_UNCHANGED

## Correction

The documentation page actually inspected is titled **ConvoKit 5.0.0 documentation** and reports 17,111 utterances and 500 conversations. The 17,111/500 documentation count must not be attributed to version 4.1.2.

The source code was separately inspected at the exact ConvoKit v4.1.2 tag:
- Tag commit: 7825beeca5ce43b00a9402d9a6773514613eb923
- Conversion notebook blob: 7ae63bdaa713f03ce1adc0b052d3d6198467b9c8
- Corpus source blob: 4be85709b26a76d2ee7bc71c7a34d96c8f48dd38

Current ConvoKit master was also inspected:
- Commit: 91a1df0143668d8e0017f932f97ac878e53b91fa
- Conversion notebook blob remains 7ae63bdaa713f03ce1adc0b052d3d6198467b9c8.
- Current corpus.py blob: 18ff79042c5a36154180b8ea7d33e8fccdef87a6.
- The same dictionary-key construction remains at line 220: self.utterances = {utt.id: utt for utt in utterances}.

Thus, the count of 17,111 belongs to the current 5.0.0 documentation page; the collision mechanism is independently supported by both the v4.1.2 tag and current master source code. The exact hosted-corpus source snapshot remains unidentified.

## Public correction

Issue #2696 remains unchanged. Append-only correction comment:

https://github.com/Satobloc/HsH/issues/2696#issuecomment-7221776904

The original issue body and canonical artifact were not edited, retried, replaced, or duplicated. The comment corrects the version attribution without changing the original publisher confirmation.

## Gate amendment

Source Identity Gate Layer 22 received an append-only source-version amendment.

- Commit: 1d163ba1a2cb84f3e75ccbad6e7cce0021e8ba92
- New blob: 152cc83ee22cc5d97915a5a8258c5166daeec089
- Independent readback: exact match.

## Corrected status

CONVERSION_COLLISION_MECHANISM_CONFIRMED / DISTINCT_GROUP_COUNT_NOT_VERIFIED / EXACT_ROW_TYPE_COUNTS_NOT_VERIFIED / SAME_SNAPSHOT_IDENTITY_NOT_ESTABLISHED.

No raw row census, participant-level analysis, Orson P1 work, human/model trial, theory integration, Lean theory proof, PWH queue/graph/worker-checkpoint write, task mutation, or BEDROCK promotion occurred.
