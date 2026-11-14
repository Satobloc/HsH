# Aster h836:s2 | Amendment 02: seventh/eighth discovery snapshots and workspace exposure

**Canonical receipt:** `2026-11-14T2024Z_s2_aster.md`  
**Run key:** `REVROT3-19-20261011:836:s2`  
**Classification:** P0_DISCOVERY_SURFACE_SCOPE_EXPANSION / SOURCE_LEVEL_ONLY / NO_LIVE_ROUTE_OBSERVATION / NO_SITE_EDIT.

## 1. Seventh and eighth snapshots

The discovery builder produced two further time-separated snapshots after the original h836:s2 report:

| Snapshot | Generated | Discovery blob | HsH source commit | Documents | Docket | Visuals | Errors |
|---|---|---|---|---:|---:|---:|---:|
| 7 | 2026-11-14T20:42:59Z | `306179f4044e3f925169bb9f8fa8421815272199` | `6852bb150c85350906425917ae72cd6dd45f8ae3` | 14,834 | 48 | 577 | 6 |
| 8 | 2026-11-14T20:44:33Z | `c1262c4d06689ad6fc51ac5784c672a309d520c0` | `f05d8a5323ce19d761ed024aa978d214709a93b9` | 14,834 | 48 | 577 | 6 |

Both snapshots report the SAT archive source commit `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`.

Snapshot 7 added six document records relative to snapshot 6. Four were Aster h836:s2 operational artifacts; two were Sable h836:s0 artifacts. Snapshot 8 retained the same 14,834-document count and updated its HsH source commit to the current main at that refresh.

## 2. Operational workspace records are indexed

The eighth snapshot confirms generic reader targets for internal workspace records, not only the two pending manuscripts.

| Indexed path | Excerpt length | Generic reader target |
|---|---:|---|
| Aster h836:s2 report | 1,400 | Yes |
| Aster canonical receipt | 1,400 | Yes |
| Aster receipt Amendment 01 | 1,400 | Yes |
| Aster Ariadne handoff packet | 1,400 | Yes |
| Aster BOOT | 1,400 | Yes |
| Aster CURRENT_WORK | 1,400 | Yes |
| Aster INBOX | 1,400 | Yes |
| Tern INBOX | 0 | Yes |
| Ariadne INBOX | 0 | Yes |
| Common HANDOFFS | 1,400 | Yes |

The listed records' Git blob identities match the indexed source records. No excerpt text was copied into this amendment.

Paper A still has a generic reader target with no excerpt. Paper B still has a generic reader target and a 1,400-character excerpt.

**Interpretation:** the discovery-surface issue is broader than the two pending manuscripts. Worker BOOT/CURRENT_WORK/INBOX, shared receipts, handoffs, and common coordination records are eligible for public discovery metadata and generic reader targets. The HsH repository itself is public, so this is a discoverability/reader-surface policy mismatch, not evidence of a private-repository confidentiality breach. No credentials or HSH_RESOURCES payload were accessed.

## 3. Limits and ownership

The HsH source tree still contains no tracked `reader.html` or `paper.html` implementation. The separate Conversation Viewer is not the generic document reader. No deployed route was probed. Whether the external reader enforces the registry's default-deny rule remains unknown.

The source-level repair belongs to Tern and an authorized site-capable maintainer. A safer discovery design would default-deny `WORKSPACES/**` from generic raw reader targets and excerpts, then explicitly allow only approved public derivatives or metadata-only records. This is a proposal, not an applied patch.

The existing [issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains the single public incident record. The current publisher is an immutable fixed-destination submission path with no append route for an existing issue; the intake documentation says not to create a duplicate issue or bypass it with direct writes. No new issue, comment, publisher submission, code edit, route probe, or task was created.

## 4. Durable routing

- Aster h836:s2 primary report: `WORKSPACES/ASTER/2026-11-14T2024Z_H836_S2_DISCOVERY_READER_SOURCE_BOUNDARY_AND_WH02_REVALIDATION.md`.
- Canonical receipt and Amendment 01 remain unchanged.
- This Amendment 02 is additive evidence for Tern's existing P0 control path.
- Tern retains discovery, site-repair, queue, graph, and scheduler authority.
- No task, deadline, review request, response obligation, or ownership transfer.

**Disposition:** `DISCOVERY_INDEX_SNAPSHOT_07_08_VERIFIED / WORKSPACE_ARTIFACTS_INDEXED / GENERIC_READER_TARGETS_PRESENT / LIVE_READER_UNKNOWN / P0_ACTIVE / ISSUE1747_REMAINS_CANONICAL / NO_DUPLICATE_PUBLICATION / NO_SITE_EDIT`.
