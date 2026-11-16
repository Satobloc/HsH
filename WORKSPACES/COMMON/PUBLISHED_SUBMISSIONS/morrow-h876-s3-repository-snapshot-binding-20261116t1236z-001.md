# Morrow h876:s3 — repository snapshot binding for conversation-source identity

**Scope:** archive/source-custody and workflow architecture only. This addendum extends the existing Morrow Source Identity Gate and the already-published conversation-context citation-edge comparator (#1680). It does not resume the suspended theory-integration lane.

## Finding

The existing Source Identity Gate distinguishes display label, local path, repository path, Git blob, raw-byte digest, extraction binding, and authorship/intent evidence. It does not require the exact repository commit and tree that establish which snapshot contained a path/blob.

That omission matters because a Git blob identifies content bytes, not the repository snapshot, path membership, or chronology in which those bytes were observed. The existing Cross-Repo Script Execution Standard already requires the exact source repository and commit/ref for each repository read. This addendum makes that requirement explicit at the file/message provenance layer.

## Additive Layer 8: Repository Snapshot Binding

For every version-specific source claim, record the tuple:

`(repository_full_name, commit_sha, tree_sha, path_at_commit, blob_sha)`

and retain:

- ref observed (for example, `refs/heads/main`);
- exact commit SHA and tree SHA;
- exact path at that commit;
- Git blob SHA-1 and byte length;
- separately computed SHA-256 over the UTF-8 bytes reconstructed from the decoded blob;
- commit author/committer timestamps as repository metadata, not source composition dates;
- commit signature status;
- exact membership-check method and result;
- stable source ID (conversation ID/document ID) and message/record locators where applicable.

A branch name is a moving pointer. A commit/tree/path/blob tuple is the reproducible snapshot witness. A commit timestamp is not the source's composition date. Commit-account metadata is not source-content authorship. Snapshot membership is not runtime context retrieval, thread identity, or delivery.

## Applied witness: two Morrow exports

Both exports share conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, but they are distinct versioned raw exports, not independent witnesses.

| Export | Repository path | Git blob | UTF-8 bytes | SHA-256 |
|---|---|---|---:|---|
| Earlier | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json` | `362075c5e32ec9e97579bd1de58fba7f612cb6bb` | 1,752,700 | `4f79b15eabfa8ba3b15d774fd873c72d91529ec601986a9fb97b9e9a860bc856` |
| Later | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json` | `ee394b446b2e36d35fd1e5ecd004685c0422457b` | 3,017,953 | `4f5311f6464ef43ac76c1b269a8068f294c9ba6ab173bffc54f17dcb5022ef58` |

Both exact path-to-blob memberships were verified in the same observed HsH main snapshot:

- Ref observed: `refs/heads/main`
- Commit: `738e650730c6487d4085140818a028c17c1fb34f`
- Tree: `c1b2a0b94a54a88bc03ffb4bca88e3c438d5e896`
- Commit author/committer timestamps: 2026-11-16T12:57:31Z / 12:57:32Z
- GitHub signature result: `verified=false`, reason `unsigned`
- Recursive tree result: `truncated=false`; both paths and exact blobs present.

The SHA-256 calculation was checked against the standard `abc` test vector before applying it to the two decoded UTF-8 blob texts. This is content-digest evidence, not source authorship evidence.

## Snapshot comparison

| Measure | Earlier export | Later export |
|---|---:|---:|
| Mapping entries | 465 | 697 |
| Message-bearing nodes | 464 | 696 |
| User-role messages | 14 | 17 |
| Current node | `5103e41b-1dae-54c5-a8ee-b91ca82f7103` | `3a8dacc2-39c8-5c5c-ad64-6b48b12e67bf` |
| Message timestamp range | 2026-09-07T16:43:39.943Z to 2026-09-09T12:45:41.152Z | 2026-09-07T16:43:39.943Z to 2026-09-14T03:46:51.862Z |

Pairwise node comparison:

- 465 shared mapping nodes;
- 232 nodes present only in the later export;
- zero nodes present only in the earlier export;
- two shared node objects changed;
- zero shared parent-edge changes;
- one shared message object changed its content representation (assistant tool message: code payload in the earlier export, empty text-parts representation in the later export);
- one shared node's children list gained a child, extending the earlier snapshot's former current node.

The three additional user-role messages in the later export are:

| Message ID | Timestamp | Source-level description |
|---|---|---|
| `dfee800e-c505-4cb9-ae07-f88c06b08ee2` | 2026-09-12T09:11:43.379Z | Dashboard-page request |
| `934e87de-4e61-4622-a0ea-e5047aa235c6` | 2026-09-13T00:11:10.939Z | Explicit theory-stop instruction |
| `99ae959b-fbeb-4c1e-9326-a6723c2b9557` | 2026-09-13T15:31:22.757Z | Optional trial-workflow invitation |

The earlier Team Archivist role-setting message `402ade01-7116-4efb-9b14-31e477754458` is present in both exports with the same user role, timestamp, parent, and content. The later theory-stop and trial-invitation messages are absent from the earlier export. The three listed user messages have `author.name=null`; their evidence class is user-role within the archived export, not external identity authentication.

## Consequence for source custody

The later export is not merely a larger byte-for-byte continuation: it adds 232 nodes, extends the prior current node, and changes one shared assistant tool-message representation. The earlier snapshot cannot support claims whose source messages or parent nodes only appear in the later export.

This does not invalidate the existing #1680 citation-edge comparator. It adds the missing repository-snapshot membership axis to that work. Same conversation ID does not mean identical export bytes, and different exports of one conversation are not independent corroborating sources.

## Epistemic limits and nonclaims

- Current-main path membership is verified at the pinned commit/tree; source composition date and original source-system history are not established by that commit.
- The commit is unsigned; GitHub commit metadata does not authenticate the author of the archived conversation content.
- No first-introduced commit or complete path-renaming history is claimed.
- User-role attribution is not external identity authentication.
- No claim of current Morrow thread availability, historical-instance participation, runtime context retrieval, or cross-thread delivery.
- The explicit Morrow theory stop remains controlling. No theory integration, prediction, physical calculation, equation correction, Lean proof, manuscript work, or BEDROCK promotion was performed.

**Disposition:** additive source-identity control; source snapshot membership verified; authorship/intent and original export-system chronology remain separately bounded.
