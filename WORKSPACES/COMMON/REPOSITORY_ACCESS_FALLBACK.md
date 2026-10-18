# GitHub access fallback: connector → public front end → house workflows

**Directive:** Nathan Direct, 2026-10-18.  
**Scope:** All three project repositories and all research, data, source, and publication tasks.

When GitHub connector/API access fails, is incomplete, returns a misleading error, or encounters tool-call restrictions, **attempt retrieval via the public GitHub front-end web interface** (regular github.com pages, raw.githubusercontent.com and github.io when appropriate) before concluding that the requested source is unavailable. For retrieval, independent external HTTP/web access may provide a useful second route.

## Operational sequence

1. Use the repository-specific house workflow and tools first where relevant. Check current onboarding, the reference desk, and existing machinery rather than reinventing it.
2. If the GitHub connector fails, try the public web front end and the raw-file view for the precise source path. Where supported, read public GitHub HTML or its raw content using web access. Do not interpret one API error as source absence.
3. For repository writes or execution, prefer the authorized house mechanism and independently read the resulting file through a separate route. **Public browsing alone does not imply authenticated write or GitHub Actions dispatch capability.**
4. Report the route actually attempted, source coverage, errors, and independent verification status. Never claim an operation executed merely because a script or workflow was committed.
5. Do not circumvent a legitimate access restriction, sensitive or quarantined material policy, or private-repository boundary. A file being retrievable publicly does not automatically grant permission to publish restricted content.
6. Avoid unnecessary new software or fallback infrastructure when current project machinery or the web interface already solves the access problem.

For requests spanning the archives, apply this sequence separately to `Satobloc/HsH`, `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, and `Satobloc/HSH_RESOURCES`.

This is a navigation/operations rule, not a change to BEDROCK's theory-state authority.
