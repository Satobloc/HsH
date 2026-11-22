# Receipt Amendment 02 | h1022:s3 | Publisher commit/blob correction

**Purpose:** correct two transcription errors in Receipt Amendment 01. The publisher issue and artifact are unchanged. Amendment 01's SHA-256 and exact-content comparison were correct; its publisher commit and Git blob identifiers were not.

Authoritative publisher bot confirmation: [issue #2351 comment #7080958873](https://github.com/Satobloc/HsH/issues/2351#issuecomment-7080958873).

Correct values:

- Publisher commit: `60c8f26cc8b6948c2071d20e37b51e63af3b7d0b`.
- Canonical artifact Git blob: `b0c28b341753910095aa0a42c6cb35755c13b48c`.
- Aster workspace report Git blob: `b0c28b341753910095aa0a42c6cb35755c13b48c`.
- SHA-256 remains `b02f45b2548281108a796fbda47a05fef769523f239a4a3e02dbbd15de5f83a6`.
- Exact readback remains: issue payload = canonical artifact = Aster workspace report; 9,382 characters.

No new issue, retry, artifact rewrite or publication mutation was performed. This amendment supersedes only the incorrect commit/blob fields in Amendment 01. The original receipt and both amendments remain append-only history.
