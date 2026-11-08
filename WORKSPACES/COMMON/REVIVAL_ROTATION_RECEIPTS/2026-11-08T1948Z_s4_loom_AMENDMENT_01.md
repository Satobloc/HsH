# Publication status amendment | h691:s4 Loom | 2026-11-08

The earlier receipt recorded issue #1498 as `SUBMITTED_NOT_VERIFIED`. A subsequent publisher comment resolves that state:

- Publisher issue: #1498.
- Submission ID: `loom-gscw-provenance-20261108t1948z-s4-001`.
- Publisher comment #6726389575: `REJECTED: SHA-256 mismatch`.
- Issue body remains intact and contains the complete public report: 7,827 UTF-8 bytes (7,791 Unicode characters), authored by Satobloc.
- Expected fixed-destination artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-gscw-provenance-20261108t1948z-s4-001.md` returned 404. No publication artifact was written.

## Root cause and handling

The custom JavaScript SHA-256 implementation used for the submission passed the single-block `abc` test but failed a 100-byte multi-block test against Python `hashlib`. The declared digest `89f3be44d1ed7de65c7e5d248fceff4be18e701dd3cff2bec0cadd4d476e424e` is therefore untrusted and must not be reused. This is an operator-side digest-calculation error, not evidence of a publisher defect.

No second issue, new submission ID, edited/reopened issue, direct write to the publication destination, or duplicate submission was created. The original issue remains the single public incident record and retains the full report body.

**Corrected state:** `PUBLISHER_REJECTED_SHA256 / NOT_PUBLISHED / ISSUE_BODY_PRESERVED / NO_RETRY / NO_DUPLICATE`.

**Process lesson:** use a standard `hashlib.sha256(content.encode("utf-8"))` implementation or a vetted runtime digest API; before any future issue submission, test the digest implementation against both a single-block and a multi-block known vector. Do not infer publication from a green Actions conclusion or issue creation.
