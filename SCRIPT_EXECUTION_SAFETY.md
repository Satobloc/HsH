# Script Execution Safety — Required

All scripts, bots, GitHub Actions, extraction jobs, indexing/tagging utilities, local tools, and automated write processes operating on this repository must follow:

`WORKSPACES/COMMON/CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`

This repository is `[[HsH]]` in that standard.

Before unattended write-capable execution, scripts must at minimum declare read/write scope, preserve sources, enforce quarantine/sandbox routing before file access, use fresh-state/CAS or fetch-rebase protection, avoid force-push/blind overwrite, isolate temp/output paths, validate outputs, and retain reproducible run provenance.

Extraction/OCR/image/conversion jobs must write derived outputs to dedicated output trees and never replace original source artifacts in place.
