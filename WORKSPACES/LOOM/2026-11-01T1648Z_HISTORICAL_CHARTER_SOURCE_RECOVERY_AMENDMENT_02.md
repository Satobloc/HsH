# Amendment 02 | Loom historical charter source recovery

**Scope:** Correct only the character-count/malformed-ID diagnosis in Amendment 01.

The value 6668ca60e451f8737903423727da7f9a430484e1 contains exactly 40 hexadecimal characters. A direct Git blob fetch from the HsH repository using this ID succeeded and returned the raw JSON for conversation 6aa67478-541c-83e9-b8fa-32d6d575eeb9, which parsed successfully.

At the HsH main tree inspected during Loom h752:s3, both entries below identify the same 40-character blob and report 4,365,718 bytes:

- DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.13•26.09.19•Tag Conversation Corpus — raw.json
- DEVELOPMENT_FULL_CONVOS/HAGALAZ/26.09.13•26.09.19•Tag Conversation Corpus — raw.json

The earlier 404 came from querying the SAT archive repository's blob endpoint, not from the HsH object. A repository-specific 404 does not make this valid HsH object ID malformed.

Amendment 01's statement that the value has 39 characters and is malformed is incorrect and is superseded on that point only. The raw source counts, conversation identity, ten user-role messages, historical remit, and duplicate-path relationship remain unchanged. No historical report or published artifact is rewritten.