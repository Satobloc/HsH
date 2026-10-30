# Morrow archival crosswalk — Dim.txt / PR #824

**Run key:** `REVROT3-19-20261011:477:s3`  
**Nominal slot:** 2026-10-30T21:36Z  
**Selection:** `h=477`, `seq=5h+3=2388`, ring index 13 = Morrow; next index 14 = Kestrel.  
**Execution identity:** current assistant using the documented Morrow archival remit; historical Morrow-instance participation is not authenticated.  
**Scope:** source role, chronology, angle-frame genealogy, and formalization status only. No theory integration, physical calculation, prediction, PR edit, or merge.

## Result in one sentence

The June 23 source chain is recovered, and the previous issue addendum needs one correction: the cleaned assistant reply **does propose** a complementary sheet/normal angle relation, but it leaves the naming direction conditional and does not define the signed scalar `u`, `u=sin(theta_clip)`, or `K=R_k`; the original pasted `Dim.txt` remains noncanonical and does not itself establish those mappings.

## Mersearch-first source chain

The existing Mersearch result was reused rather than starting or overwriting a request:

- HsH search result: `indexes/mersearch_requests/2026-09-22-mira-boundary-weak-emission-provenance-002/SEARCH_RESULTS.md`.
- That existing result identifies the June 23 *Homes in Cardinal Order* user message and its raw-export locator. It is a discovery lead; the original message and SAT archive artifact were then fetched directly.
- No new Mersearch request was created. Tern's incoming receipt reports the shared request slot occupied by Ariadne.

### Primary archive artifact and user-role message

- SAT archive file: `Dim.txt`, blob `8f019606e52cbc8e45bd7638395f994777a3a446`, 17,395 characters. [Current archive path](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/Dim.txt).
- HsH raw conversation blob: `5ec26adb1a1b884b98246737ef51e82434d725a8`; conversation ID `6a39839c-0d50-83ea-afe2-f8e15a97f76a`.
- User-role message `456841be-463b-43c8-9042-f7f4c19c50a8`, timestamp `2026-06-23T00:58:54.473792Z`; `author.name=null`.
- The message begins with the exact caution prefix `Ok, treat this as tentative, probably wrong:\n\n` (46 characters). Removing only that prefix leaves a 17,395-character body exactly equal to the `Dim.txt` file. This establishes a user-pasted copy relation, not authorship or endorsement of the embedded equations.
- The parent node `5fc784b4-da8c-45e4-b994-144a5a2e5aea` is an assistant message. The embedded block is assistant-style prose, but its original author is unresolved. Do not relabel it Nathan Direct.

### Chronology and authorship

| Locator | Role / timestamp | What it establishes |
|---|---|---|
| `456841be-463b-43c8-9042-f7f4c19c50a8` | user, 00:58:54.473792Z | Nathan's caution about the pasted block; not authorship of its contents. |
| `c26cf6b6-d60e-44cf-94e3-b45baef5dbc2` | assistant, 00:58:55.607267Z | Explicitly classifies the block as historical/pre-cleaning, not canonical; supplies a cleaned assistant reconstruction. |
| `3ab3f81f-6cf4-4dee-b0af-180c6fafe831` | user, 01:00:18.186953Z | Nathan says “Locked may be a useful idea” only as a soft entrainment/cobordism/coholonomy-type constraint with the time sheet/slice. This is permission for the concept, not adoption of the assistant's equations. |
| `1261ccff-664f-4b14-9390-520ed774e5fb` | assistant, 01:00:19.884421Z | Defines “coholonomic lock” and supplies `Lambda_k`, `W_co`, and cobordism expressions; assistant reconstruction, not Nathan Direct. |
| `36e0ed51-5a10-4d34-b97b-1ff8e055919a` | user, 01:00:55.964871Z | Adds a strict SAT status-language restriction. Preserve it; avoid finality vocabulary. |

## Angle-frame crosswalk

The key new correction is that the cleaned assistant reply does contain a candidate frame map. It should not be described as wholly absent.

| Symbol / phrase | Source and status | Recovered meaning | Remaining limitation |
|---|---|---|---|
| `theta` in `Dim.txt` | Historical pasted artifact | Calls it an intersection angle; gives 1° “relative to the 3D timesheet”; later says a normal hit is 90° when the filament is parallel with time. | The same block later uses `theta_4` without defining the relationship. |
| `theta_4` | Current BEDROCK BR-005, lines 309–313; BEDROCK blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` | Measured from the time normal; aligned/null vacuum is `theta_4=0`. | The original raw user turn behind this current control was not recovered in this bounded pass. |
| `theta_clip`, `theta_normal` | Assistant reply `c26cf6b6-d60e-44cf-94e3-b45baef5dbc2` | `theta_clip` is described as sheet-relative; `theta_normal` as normal-relative. It writes the candidate complement `theta_clip = pi/2 - theta_normal`, then says the direction depends on convention. | This is an assistant proposal, not Nathan Direct, and the labels/direction were not standardized. |
| `u` | PR #824 | A signed real input to `unsignedIncidence(u)=|u|`. | No source message or cleaned assistant reply defines `u`, its orientation, or `u=sin(theta_clip)`. |
| `K` | PR #824 | Generic numerator in `sliceFactor(K,u)=K/|u|`. | `K=R_k` is not explicitly specified by the source or the cleaned reply. |

**Corrected interpretation:** the prior issue addendum's blanket statement that the cleaned assistant reconstruction contains no angle convention was too strong. A complementary sheet/normal relation is explicitly proposed there. The correct status is `ASSISTANT_PROPOSED_COMPLEMENT_MAP / NOT_STANDARDIZED`. If one conditionally identifies `theta_normal=theta_4`, then the assistant's candidate map would connect the sheet-relative clipping angle to the BEDROCK normal-relative angle. That conditional identification is not a recovered Nathan equation.

The original `Dim.txt` still does not itself define an oriented angle, a signed incidence, or an absolute-value readout. Its “Source History” placeholders do not identify retrievable primary equations.

## PR #824 and Lean status

- PR #824 remains **OPEN / DRAFT / NOT MERGED**; head branch `research/tern-dim-provenance-signloss-20261028t01z`, head SHA `3c8a9f2393efd39ad6acf18433bfb72db51b8c46`.
- Module: `FORMAL_VERIFICATION/HsHVerification/TernDimReadout.lean`, blob `9134c7975d28c938515a38a72a14951fe38e373f`.
- Actions run `40864054774`, job `123414842181`: completed **SUCCESS**. The job's “Install Lean and compile formal library” step completed successfully. The run metadata identifies the same PR head SHA. The separate test, lint, and axiom-audit steps were not part of this successful job.
- The module defines `unsignedIncidence(u)=|u|` and `sliceFactor(K,u)=K/|u|`; it compiles six theorems about sign reversal, aligned input, and impossibility of decoding both `u` and `-u` from the same unsigned scalar.

**Formalization boundary:** those theorems are conditional results about the module's chosen abstraction. They do not establish that `Dim.txt` used an absolute incidence, that its angle was signed, or that a physical chirality degree of freedom is lost. The sign is introduced by the formal variable `u`; the source itself does not supply it.

**Additional domain gap:** `sliceFactor` is defined for every real `u`, with no `u ≠ 0` domain condition. Under the proposed `u=sin(theta_clip)` interpretation, zero incidence is the singular limit of the source's reciprocal-sine expression. The module does not encode that partial domain; Lean's total field-division semantics therefore cannot be read as the source's geometric singularity rule. The sign-reversal theorem does not repair this omission.

**Proof triage:** existing module CI is a real successful compile of the abstract statements. A source-faithful theorem for the angle-frame bridge is `FORMALIZATION_BLOCKED_DEFINITION`: the source-to-current angle identification and signed/domain conventions are not fixed. No new data-free geometry proof was run; the specific prior-permission gate remains in force. No physical dataset or measured-system calculation was involved.

## Other source and method boundaries

- The `Dim.txt` artifact is not a SAT-O/Blockwave equation set. No SAT-O/Blockwave equations were copied, corrected, or promoted in this bounded crosswalk; no such equation SHA/date lineage is implied.
- No new tooling was built. Existing Mersearch result, repository source, PR #824, and its existing CI route were reused.
- No PR edit, branch change, merge, physical calculation, prediction, manuscript edit, or BEDROCK amendment was made.

## Lateral reading / break

Read HSH_RESOURCES `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, lines 413–460, blob `a7f48e0a01dc7c647d6c18f5418d90d71242b8e3`. This unrelated historical astronomy passage distinguishes apparent line-of-sight clustering from actual three-dimensional association and notes that direct stellar distances were not then available for every member. It contains qualitative projection geometry but no definite mathematical proposition; no Lean attempt or calculation was warranted. **Next cursor: line 461.**

The last full FIE review was October 27, so the 14-day rereview trigger is not due.

## Identity, handoff, and return cursor

- Morrow's historical README records a provisional “Team Archivist” assignment from Nathan's user-role message `402ade01-7116-4efb-9b14-31e477754458` in conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`; this supports the archive/provenance remit, not current runtime identity.
- Existing-thread-first lookup found prior Morrow conversation candidates but no authenticated, usable current Morrow destination. No cross-thread delivery was available.
- Next identity: Kestrel. Best existing candidate located is “Science Made Stupid,” conversation `6ab070ce-2384-83e9-b76f-4661c55867c4`, raw blob `100267f3f11f3cce09c7d802ce85ad03879d5744`; current accessibility/authentication is not established.
- Outgoing Kestrel packet is optional context for Kestrel's protected cross-boundary synthesis remit, not an assignment to repeat Morrow's source audit.

**Next exact source cursor:** if the source-to-current angle relation is to be used, recover the raw Nathan message underlying BEDROCK BR-005 and reconcile its frame with the June 23 assistant proposal before any canonical symbol mapping or Lean extension. Keep PR #824 unchanged pending that source gate.
