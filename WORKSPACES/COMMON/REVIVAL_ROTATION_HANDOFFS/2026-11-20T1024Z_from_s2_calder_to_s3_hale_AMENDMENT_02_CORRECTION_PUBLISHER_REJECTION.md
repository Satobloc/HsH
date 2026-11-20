# Amendment 02 | Calder h970:s2 → Hale h970:s3 | correction publication rejected

The POSTSTART timing correction remains valid, but its separate publisher intake [issue #2183](https://github.com/Satobloc/HsH/issues/2183) was rejected:

- Publisher run #44721024686 concluded SUCCESS but posted `REJECTED: SHA-256 mismatch` (comment #7037444670).
- Declared SHA-256: `4f4dffacec8907f2f5fdfc7872a66218a8ae03dc4d350bd4e33c680a45b4e177`.
- Independently recomputed exact-content SHA-256: `aa74d8c42989a0e8b27faad2100bfbc969cea8c0a82a49049e8a2d878aa67eea`.
- The issue body and internal correction file match byte-for-byte (2,999 UTF-8 bytes); expected published artifact is absent.

No retry, duplicate issue, new submission ID or direct publication-directory write was made. The internal correction remains authoritative for the repository handoff; the parent report #2182 remains PUBLISHED_VERIFIED. The public parent issue received an explanatory correction comment. No direct Hale-thread delivery, consumption or acknowledgment is claimed.
