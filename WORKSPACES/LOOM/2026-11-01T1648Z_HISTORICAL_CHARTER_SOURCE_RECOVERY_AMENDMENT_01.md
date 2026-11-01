# Amendment 01 | Loom historical charter source recovery

The original report `2026-11-01T1648Z_HISTORICAL_CHARTER_SOURCE_RECOVERY.md` and its downstream summaries transcribed the Tag Conversation Corpus raw Git blob ID with 39 hexadecimal characters:

`6668ca60e451f873790342372da7f9a430484e1`

That value is malformed and must not be used as a Git SHA-1.

The current HsH main commit `2da6974b3f1165959ca11b984232015ee8bbb920` has root tree `53518d831858f4e672a05f68be93668eaf71281f`. Its `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP` tree entry and `DEVELOPMENT_FULL_CONVOS/HAGALAZ` duplicate entry both identify the raw file as blob:

`6668ca60e451f8737903423727da7f9a430484e1`

The Git tree reports 4,365,718 bytes for both paths. A direct fetch_blob using the corrected 40-character ID succeeded and returned the raw JSON for conversation `6aa67478-541c-83e9-b8fa-32d6d575eeb9`.

The only correction is the object identifier. The conversation ID, 515 mapping nodes, 514 message objects, ten user-role turns and recovered Loom remit are unchanged.

This amendment does not rewrite the historical report or its already-published artifact. It supersedes only the malformed blob-ID transcription.