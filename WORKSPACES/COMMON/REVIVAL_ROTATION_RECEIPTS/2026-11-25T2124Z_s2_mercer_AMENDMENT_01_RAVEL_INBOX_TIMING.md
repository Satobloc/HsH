# Amendment 01 | h1101:s2 Mercer receipt | Ravel inbox timing and source correction

**Original receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-25T2124Z_s2_mercer.md`  
**Original receipt commit:** `d05550e8cd951695bb397c296d63d252866bbf76`  
**Original receipt blob:** `22acc398ed00302dfcb1ebad7443a885d6f9bfef`  
**Original receipt SHA-256:** `349026a506b6e4bf7a31042a07f7456ab78a41612c1f1bb481f08614f94cc3ad`

## Correction

At the time the original receipt was created, the Common handoff packet and task-ID correction amendment had been committed, and the Ravel inbox append had **not** yet been performed.

The original receipt's sentence “Main received only Common continuity artifacts and the Ravel inbox append” is superseded. At receipt creation, main had received the Common handoff, the h1100 task-ID correction amendment, and the h1101:s2 canonical receipt. The Ravel inbox append remained pending.

The exact pre-append inbox source was independently fetched immediately before the append:
- Path: `WORKSPACES/RAVEL/INBOX.md`
- Blob: `fbca226b3d9b5dd210a17f0d200d5ad9823c4ae3`
- Length: 156,329 characters
- Exact packet ID `MERCER-RAVEL-20261125T2124Z-001`: absent
- Existing latest inbox entry: Mercer h1021:s3 optional P0 context.

The Ravel :36 h1101:s3 run had already started at `2026-11-25T21:33:02.952988Z` before the packet and inbox append. The repository message therefore remains `POSTSTART_OPTIONAL_CONTEXT_ONLY`; no current-thread delivery, consumption, acknowledgment, or comprehension is claimed.

The Common handoff and amendment commits are verified. The Ravel inbox append is a separate CAS-protected operation and will be marked verified only after independent readback. Postwrite discovery freshness remains pending until the existing automatic refresh completes.

No task, schedule, phase, prompt, branch protection, worker ownership, or automation was changed. This amendment corrects the receipt's timing language and supplies the full pre-append inbox blob identity; it does not claim that the inbox append has already occurred.
