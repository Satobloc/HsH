# Amendment 01 — source-locator correction for the Mode 1 / 4D-link crosswalk

**Status:** ADDITIVE_METADATA_CORRECTION / ORIGINALS_UNCHANGED / NO_EQUATION_CORRECTION / NO_THEORY_PROMOTION.

This amendment corrects source locators in [issue #2676](https://github.com/Satobloc/HsH/issues/2676). It does not repeat or replace the topology analysis, and it does not modify any SAT-O or Blockwave source equation.

## 1. Directory spelling

The SAT archive's literal directory is `SAT_O REWRITE/SAT 4D/` — with an underscore between `SAT` and `O`.

The previous report's source links used `SAT O REWRITE/SAT 4D/` — a space instead of the underscore. That path returns 404. The underscore path exists in the current SAT archive main tree and returns the source files.

Correct original-source links:

- [SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT%20O1%204D.txt)
- [SAT O3 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT%20O3%204D.txt)
- [SAT O4 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT_O%20REWRITE/SAT%204D/SAT%20O4%204D.txt)

## 2. Exact blob identities

The current SAT archive main tree and the corresponding HsH dump mirrors agree on these Git blob identities:

| File | Correct Git blob SHA-1 |
|---|---|
| SAT O1 4D.txt | `7577aa1ee5a6c3850ce3b226c75377de6367aedc` |
| SAT O3 4D.txt | `589219f60a8102cf7b07791b94fcdcd119e9bb8c` |
| SAT O4 4D.txt | `32462848d9927619624928df3a1df35feb0f126d` |

The previous report's O4 blob value `32462848e839ad1d5b2ff9d913fae0735a6327b1` is not present in the current SAT archive tree. The correct O4 blob is `32462848d9927619624928df3a1df35feb0f126d`.

All three files have the same first extant Git witness: commit `0821d8edda98430e1c99972e193334c1cfb5d87c`, dated `2025-10-27T23:52:03Z`. This is a repository witness date, not a composition date.

## 3. File-index timestamp qualification

The current [DATED_FILE_LIST_EXTENDED.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/DATED_FILE_LIST_EXTENDED.txt) records these file-system modification times:

- O1: 2025-06-09 18:44:50
- O3: 2025-06-10 05:28:18
- O4: 2025-06-09 18:45:20

The previous report recorded corresponding file-index times two seconds later. These are archive metadata, not verified composition dates. Preserve the two-second discrepancy until the exact index provenance is reconciled; do not silently normalize it.

## 4. Scope

- The previous topology/source analysis remains unchanged.
- No original equation has been edited or corrected.
- No new topological theorem, physical calculation, CODATA score, or empirical claim is introduced.
- This is an additive locator/hash correction only.
