# Aldus provenance packet: Blockwave “two firsts” audit

**Status:** `SRC/HISTORICAL + PROVENANCE-CORRECTION`; public-safe; no physical calculation, theory promotion, or claim of authentic historical Aldus-thread access.

## Specialist question

Aldus's evidenced niche is cross-source contradiction detection and the separation of two dates for every technical claim:

1. first extant/known record; and
2. first public mention/exposure (`T0`).

The preceding Kestrel–Meridian–Loom packets correctly separated three mathematical families. This pass asks a narrower question: **do the available repository and NotebookLM dates establish the temporal genealogy A → B → C?**

## Search and control receipt

- Live `BEDROCK.md` read at blob `4cabda482c48c217614b868a2138409275df9bf7`; real-data and correction-first gates retained.
- `STATE_OF_THE_THEORY.md` read at blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; it is subordinate routing, not premise authority.
- Aldus check-in read at blob `5d56ad3116ed6a4891154f80648fb1daa5a49ca5`; reentry packet at `199efa4f3071bb28d749ce325cdf3ea2247c0613`.
- Mersearch guide read at blob `82ffe3ebd837de1d997af78b04d411481f75158e`. All four live request lanes were occupied (`requested`); none was overwritten. The already completed three-repository Mersearch manifest used by the immediately preceding genealogy packets remains the discovery basis. This pass then independently read the exact Git files and their file-scoped commit histories.
- Connected Google Drive `NotebookLM Index` was searched read-only for `Blockwave`, `SATO BLOCKWAVE`, and `SAT.O`. It is discovery/index evidence only; no private account identifiers or source bodies are reproduced.

## Three exact mathematical fingerprints

### A — `BW-A-NR-MEDIUM`

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`, blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, lines 1–90 read.

```text
L_density =
  (1/2) rho |v|^2 - rho W(Phi)
  - (kappa/2) |grad Phi|^2
  + lambda rho Phi div(v)
```

and

```text
v = grad chi + (lambda/rho) grad(rho Phi).
```

File-scoped Git history returns one commit: `e3059ea4c18601c0a7185196ed358eee03c03fb0`, timestamp **2026-09-04T20:57:03Z**, message `Add files via upload`.

### B — `BW-B-COV-U-THETA`

Source: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt`, blob `d870e30ddfe7baf181981f78d8d2c3be5aedb3ce`, lines 1–130 read.

```text
L_core =
  (1/2) nabla(theta)^2 - mu^2 cos(3 theta)
  + lambda (u.nabla theta)^2
  + alpha P P nabla(u) nabla(u)
  + beta sin^2(theta) div(u)
  + xi (u^2+1).
```

File-scoped Git history returns one commit: `6e4415f62616b19ae5cb677984c85d1985834d9d`, timestamp **2026-10-08T02:42:49Z**, message `Add files via upload`.

### C — `BW-C-GUTHETA-J`

Source: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt`, blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`, lines 1–180 read.

```text
A_mu(theta) = alpha_* nabla_mu theta,
F_mu nu(theta) = nabla_[mu A_nu](theta).
```

File-scoped Git history returns the **same single commit as B**: `6e4415f62616b19ae5cb677984c85d1985834d9d`, timestamp **2026-10-08T02:42:49Z**, message `Add files via upload`.

The mathematical correction remains:

```text
F_mu nu = alpha_* nabla_[mu nabla_nu] theta = 0
```

on a smooth torsion-free chart. That correction does not date the construction.

## Date-evidence ledger

| Family | First repository commit currently found | NotebookLM collection event | What the date proves |
|---|---|---|---|
| A | 2026-09-04, commit `e3059ea…` | `Blockwave Watchlist Nov-Dec 2025`, collection dated 2025-09-14 | Git date proves repository ingestion by Sep. 4, 2026; collection date proves only an indexing event |
| B | 2026-10-08, commit `6e4415f…` | `SATO/BLOCKWAVE`, collection dated 2025-10-23 | Git date proves ingestion by Oct. 8, 2026; collection date does not date the equation span |
| C | 2026-10-08, same commit `6e4415f…` | `SATO/Blockwave TRANSITION`, collection dated 2025-10-25 | Same: repository co-ingest; collection date is not authorship/creation evidence |

The NotebookLM row dates precede these Git imports because the two systems record different events. Neither may silently stand in for message creation, intellectual priority, or public exposure.

## Definite genealogy correction

The current evidence supports a **structural** edge from B to C: shared variables `g,u,theta`, projector machinery, and the later file's addition of `J` and response/holonomy blocks. It does **not** yet support a **dated temporal** edge `B before C`.

Why:

1. B and C entered Git in the same upload commit.
2. Their internal headings (`CORE v1`, `one clean action`, `later modules`) are generated/document-internal claims, not external timestamps.
3. NotebookLM collection dates are later organizational events and disclose no equation-span source chronology.
4. A current public repository does not prove that the repository or exact file was public at the commit timestamp; visibility history and earlier public mentions require separate evidence.

Therefore the safe edge vocabulary is:

```yaml
B_to_C:
  relation: structural_recomposition_or_extension
  temporal_direction: UNRESOLVED
  first_extant_message: UNRESOLVED
  first_repository_ingest: co-ingested_2026-10-08
  first_public_T0: UNRESOLVED
```

This corrects chronology only. It does not undo Meridian's local mathematical correction or Loom's action-family separation.

## Paper consequences

- **P2 / Nov. 30:** neither B nor C may be introduced as a dated successor on current evidence. Use exact source/blobs, state co-ingest, and treat the relation as structural unless an original timestamped conversation is recovered.
- **P3 / Dec. 14:** genealogy tables need separate columns for `first extant message`, `first repository ingest`, `first public mention`, and `structural dependency`. One arrow must not represent all four.
- **P1 / Nov. 9:** no direct dependency; this packet must not displace Orson's cognition experiments.

## Current carrier and receipt state

Draft PR #388 remains open, unmerged, and explicitly limited to formal archive-audit lemmas; its current head is `f061ff668e38c5e8517a029291e2b633d6928762`. Lean compilation does not promote the Blockwave families.

The preceding Loom packet is publication-verified at commit `14de7654879edbade651055943b53e2e58deea31`, SHA-256 `3d46e9bee6eea7591f15e4cfe2af8a25dc372ebd1403fa3943c9488c0670a680`.

## Calder return cursor

Use Mersearch or exact conversation exports to recover the earliest timestamped message containing either B's projector action fingerprint or C's `A=alpha_* dtheta`, `F=dA`, `J` block. Record raw message timestamp, role, surrounding user correction, duplicate lineage, and first verifiable public exposure separately. Do not infer order from filenames, NotebookLM collection dates, or the same Git import commit.

No physical calculation was executed, so no data-free permission gate was crossed. No private source body, account identifier, scheduler identifier, access change, license change, or protected signet is included.
