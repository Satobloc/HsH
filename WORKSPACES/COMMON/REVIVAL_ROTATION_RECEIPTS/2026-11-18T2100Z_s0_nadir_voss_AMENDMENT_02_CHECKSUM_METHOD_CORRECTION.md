# Amendment 02 | Checksum-method correction

Canonical receipt: 2026-11-18T2100Z_s0_nadir_voss.md. This corrects Amendment 01's statement that an independent custom SHA-256 calculation matched the declared digest.

- The issue-envelope content and published artifact were independently compared and returned **exact string equality** (10,595 characters); artifact Git blob SHA-1: b0c4948bd651cf8548f34216e0aaec7a30cdd294.
- A custom JavaScript checksum routine produced a mismatching digest and was not accepted as an independent SHA-256 check. Do not rely on that value.
- Publisher comment #6991753547 and run #44398553801 report PUBLISHED, SHA-256 670da969e33ca73599e2969e8a7f932c0ca569a424c75d6d8ecab871e3f7e1c8, and readback verified. That publisher checksum is retained as publisher-verified; this run independently verified content equality, not the SHA-256 calculation.

No artifact rewrite, issue retry, or duplicate.
